# -*- coding:utf-8 -*-

import sys
import traceback

from flask import Flask

from werkzeug.contrib.fixers import ProxyFix

from scribe import scribe
from thrift.transport import TTransport
from thrift.transport import TSocket
from thrift.protocol import TBinaryProtocol


app = Flask(__name__)

@app.route('/sendbi/<string:host>/<int:port>/<string:category>/<string:message>')
def send_bi(host, port, category, message):
    assert message
    assert category

    if (message is None) or (category is None):
        return "error args"

    result = 0
    socket = TSocket.TSocket(host = host, port = port)
    socket.setTimeout(3000)
    transport = TTransport.TFramedTransport(socket)
    protocol = TBinaryProtocol.TBinaryProtocol(trans = transport, strictRead = False, strictWrite = False)
    client = scribe.Client(iprot = protocol, oprot = protocol)

    try:
        transport.open()
        log_entry = scribe.LogEntry(category = category, message = message)
        result = client.Log(messages=[log_entry])
    except Exception as e:
        result = "failed to write bilog"
        traceback.print_exc(file=sys.stdout)
    finally:
        try:
            transport.close()
        except Exception as e:
            result = "failed to close socket"
            traceback.print_exc(file=sys.stdout)

    if result == scribe.ResultCode.OK:
        result = "success for sending bi log"
    elif result == scribe.ResultCode.TRY_LATER:
        result = "try it later"
    else:
        result = "Unknown error code."

    return result


#if __name__ == '__main__':
#
#    # using wsgi
#    app.wsgi_app = ProxyFix(app.wsgi_app)
#
#    app.run(host='0.0.0.0', port=8080, debug=True)


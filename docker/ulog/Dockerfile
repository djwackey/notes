FROM proudlygeek/scribe
MAINTAINER wackey <worcy_kiddy@126.com>

RUN curl https://bootstrap.pypa.io/get-pip.py | python
RUN pip install flask
RUN pip install gevent==1.1rc3
RUN pip install gunicorn==19.4.5

COPY server.py /root/
COPY docker-entrypoint.sh /usr/local/bin/

ENV PYTHONPATH /usr/lib/python2.7/site-packages

EXPOSE 8080

ENTRYPOINT ["docker-entrypoint.sh"]


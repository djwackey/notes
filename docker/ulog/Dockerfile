FROM docker.io/proudlygeek/scribe
MAINTAINER wackey <worcy_kiddy@126.com>

RUN curl https://bootstrap.pypa.io/get-pip.py | python
RUN pip install flask

COPY server.py /root/
COPY docker-entrypoint.sh /usr/local/bin/

ENV PYTHONPATH /usr/lib/python2.7/site-packages

EXPOSE 8080

ENTRYPOINT ["docker-entrypoint.sh"]


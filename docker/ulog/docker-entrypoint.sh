#!/bin/bash

cd /root
gunicorn server:app --worker-class=gevent -w 4 -b :8080

# -*- coding:utf-8 -*-

import time
import requests
from celery import Celery

celery = Celery('tasks', broker='redis://localhost:6379/0')

BASE_URL = "http://localhost:5002"

DEST_HOST = "127.0.0.1" # bi server
DEST_PORT = "1463"

@celery.task
def sendbi(category, message):
    result = False
    try:
        url = "{BASE_URL}/sendbi/{DEST_HOST}/{DEST_PORT}/{category}/{message}".format(
            BASE_URL=BASE_URL,
            DEST_HOST=DEST_HOST,
            DEST_PORT=DEST_PORT,
            category=category,
            message=message)

        resp = requests.get(url)
        if resp.status_code == 200:
            print(resp.content)
            result = True
    except Exception as e:
        print(e)
    return result

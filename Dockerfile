FROM python:3.8

COPY entrypoint.sh /entrypoint.sh
COPY main.py /main.py
COPY sherlock.c /sherlock.c

ENTRYPOINT ["/entrypoint.sh"]
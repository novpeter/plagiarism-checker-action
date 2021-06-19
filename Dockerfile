FROM python:3.8

COPY entrypoint.sh /entrypoint.sh
COPY download.py /main.py
COPY sherlock.c /sherlock.c
COPY parser.py /parser.py

ENTRYPOINT ["/entrypoint.sh"]
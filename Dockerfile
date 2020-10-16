FROM  alpine:latest

RUN apk add git

#RUN apk add --update --no-cache python3 && ln -sf python3 /usr/bin/python

RUN apk add python3

RUN apk add py3-pip

RUN pip3 install PyGithub

COPY entrypoint.sh /entrypoint.sh

RUN chmod +x /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
FROM  varunsridharan/actions-alpine:latest

RUN apk add python3

RUN apk add py3-pip

RUN pip3 install PyGithub

COPY entrypoint.sh /entrypoint.sh

RUN chmod +x /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
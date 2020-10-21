FROM debian:sid-20201012

RUN apt-get update && \
    apt-get install -y gitit

ADD ssh/id_rsa ssh/id_rsa.pub .ssh/

RUN ["ssh-add", ".ssh/id_rsa"]

VOLUME /gitit/wikidata
VOLUME /gitit/logs
VOLUME /gitit/users

ADD static /gitit/static/
ADD templates /gitit/templates/
COPY gitit.conf \
    secret.conf \
    entrypoint.sh \
    post-commit \
    /gitit/

WORKDIR /gitit/

ENTRYPOINT ["./entrypoint.sh"]

CMD []

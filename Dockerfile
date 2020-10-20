FROM debian:sid-20201012

RUN apt-get update && \
    apt-get install -y gitit

VOLUME /gitit/wikidata
VOLUME /gitit/logs
VOLUME /gitit/users

ADD static /gitit/static/
ADD templates /gitit/templates/
COPY gitit.conf /gitit/
COPY secret.conf /gitit/

WORKDIR /gitit/

ENTRYPOINT ["gitit", "-f", "gitit.conf", "-f", "secret.conf"]

CMD []

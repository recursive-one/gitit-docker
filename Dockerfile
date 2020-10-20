FROM debian:sid-20201012

RUN apt-get update && \
    apt-get install -y gitit

RUN useradd gitit

USER gitit:gitit

VOLUME /gitit/wikidata
VOLUME /gitit/logs
VOLUME /gitit/users

ADD --chown=gitit:gitit static /gitit/static/
ADD --chown=gitit:gitit templates /gitit/templates/
COPY --chown=gitit:gitit gitit.conf /gitit/

WORKDIR /gitit/

ENTRYPOINT ["gitit", "-f", "gitit.conf"]

CMD []

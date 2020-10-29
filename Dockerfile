FROM debian:sid-20201012

RUN apt-get update && \
    apt-get install -y gitit

# Authorize SSH Host
RUN mkdir -p /root/.ssh && \
    chmod 0700 /root/.ssh && \
    ssh-agent ssh-keyscan github.com > /root/.ssh/known_hosts

# Add the keys and set permissions
ADD ssh/id_rsa ssh/id_rsa.pub /root/.ssh/
RUN chmod 600 /root/.ssh/id_rsa && \
    chmod 600 /root/.ssh/id_rsa.pub && \
    ssh-agent ssh-add /root/.ssh/id_rsa

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

EXPOSE 8000/tcp

ENTRYPOINT ["./entrypoint.sh"]

CMD []

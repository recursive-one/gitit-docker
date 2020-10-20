# Gitit dor [wiki.recursive.one](https://wiki.recursive.one).

1. Clone a wiki repo to the `wikidata` subdir.
2. Place a `secret.conf` (secret question, GitHub auth stuff, etc) near the `gitit.conf`.
2. `docker-compose build`.
3. `docker-compose up`.
4. Add a hook `hook-push.sh` for the auto-push.

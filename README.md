# Gitit dor [wiki.recursive.one](https://wiki.recursive.one).

1. Clone a wiki repo to the `wikidata` subdir.
2. Put the SSH keys (`id_rsa` and `id_rsa.pub`, for autopush) into `ssh`).
3. Place a `secret.conf` (secret question, GitHub auth stuff, etc) near the `gitit.conf`.
4. `docker-compose build`.
5. `docker-compose up`.

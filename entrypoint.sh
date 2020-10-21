#!/bin/sh

set -eou pipefail

# ensure hook
HOOKS="wikidata/.git/hooks"
if [ ! -f "$HOOKS/post-commit" ]; then
    cp post-commit "$HOOKS"
fi

# downsync
cd wikidata && git pull && cd ..

# serve
gitit -f gitit.conf -f secret.conf

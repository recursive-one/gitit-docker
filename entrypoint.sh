#!/bin/sh

set -eu

WORKDIR="/gitit"
cd $WORKDIR

# ensure hook
HOOKS="wikidata/.git/hooks"
if [ ! -f "$HOOKS/post-commit" ]; then
    cp post-commit "$HOOKS"
fi

# downsync
cd wikidata
ssh-agent git pull >> "$WORKDIR/logs/git.log" 2>&1
cd "$WORKDIR"

# serve
gitit -f gitit.conf -f secret.conf

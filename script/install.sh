#!/bin/bash

#
# Installing
#
cabal --version &&
cabal configure &&
cabal build     &&
cabal install   &&
cabal clean     &&
echo "DONE"

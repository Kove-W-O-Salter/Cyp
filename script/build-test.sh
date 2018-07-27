#!/bin/bash

#
# Test compile source.
#
cabal --version &&
cabal configure &&
cabal build     &&
cabal clean     &&
echo "DONE!"

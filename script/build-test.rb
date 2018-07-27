#!/bin/ruby

# Compile then clean the code base.

`cabal --version &&
 cabal configure &&
 cabal build     &&
 cabal clean`

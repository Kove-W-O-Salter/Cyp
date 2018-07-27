#!/bin/ruby

`cabal configure &&
 cabal build     &&
 cabal install   &&
 cabal clean`

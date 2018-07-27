#!/bin/bash

#
# All of the source files that are to be documented.
#

SOURCE_FILES=`find ./src | grep .hs`

#
# The documentation directory.
#

DOC_DIR=./docs

echo "Generating documentation, with Haddock, for:"

for SOURCE_FILE in $SOURCE_FILES; do
    echo "   * '$SOURCE_FILE'"
done

#
# Generating Haddock documentation for all SOURCE_FILES.
#

haddock --version                                      &&
haddock -o $DOC_DIR --html --use-unicode $SOURCE_FILES &&
echo "DONE"

#!/bin/bash

#
# The temporary clone directory.
#
TMP_DIR=/tmp

#
# The official source repository.
#
REPO=https://github.com/Kove-W-O-Salter/Cyp

#
# The current repository.
#
CURRENT_REPO=`pwd`

#
# The new repository's directory.
#
NEW_REPO=$TMP_DIR/Cyp

#
# Tell the user what they have to do to continue the update.
#
function TELL_THEM_WHAT_TO_DO() {
    echo -e ""
    echo -e "########################################"
    echo -e "# A    T    E    N    T    I    O    N #"
    echo -e "########################################"
    echo -e " Run the following commands to continue "
    echo -e " the update:                            "
    echo -e "   \e[32m                               "
    echo -e "   rm -r $CURRENT_REPO &&\\             "
    echo -e "   cp -r $NEW_REPO $CURRENT_REPO &&\\   "
    echo -e "   rm -r $NEW_REPO &&\\                 "
    echo -e "   cd $CURRENT_REPO &&\\                "
    echo -e "   bash script/install.hs               "
    echo -e "   \e[0m                                "
    echo -e "########################################"
    echo -e ""
}

#
# Tell the user that /tmp couldn't be found.
#
function ERROR() {
    echo -e ""
    echo -e "########################################"
    echo -e "#     \e[31m E  R  R  O  R \e[0m       #"
    echo -e "########################################"
    echo -e "    I couldn't find the directory       "
    echo -e "    '$TMP_DIR'. This directory is       "
    echo -e "    essential for this operation.       "
    echo -e "    Please make sure that you are       "
    echo -e "    running a 'UNIX' or 'Linux' OS.     "
    echo -e "########################################"
    echo -e ""
}

#
# Run the update process if and only if /tmp exists.
#
if [ -e $TMP_DIR ]; then
    git --version        &&
    cd $TMP_DIR          &&
    git clone $REPO      &&
    TELL_THEM_WHAT_TO_DO &&
    exit 0
else
    ERROR
    exit 1
fi

#!/bin/bash
 
if [ `uname` == Darwin ]; then
    READLINK=greadlink
else
    READLINK=readlink
fi
 
SCRIPT_DIR=`dirname $($READLINK -f $0)`

python3 $SCRIPT_DIR/update.py $*  --include-dirs ../flow/lib/,../material/
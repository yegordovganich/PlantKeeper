#!/bin/bash

if [ `uname` == Darwin ]; then
	READLINK=greadlink
else
	READLINK=readlink
fi

SCRIPT_DIR=`dirname $($READLINK -f $0)`

python $SCRIPT_DIR/plantkeeper_compile.py $*
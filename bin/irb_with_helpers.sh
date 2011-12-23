#!/bin/sh

BASEDIR=$(dirname $0)
cd $BASEDIR
cd ..
irb -r `pwd`/config/environment


#!/bin/sh

echo "Starting {{appname}} development console.\n"

exec erl -pa $PWD/../ebin\
         -pa $PWD/../deps/*/ebin\
         -pa $PWD/../apps/*/ebin\
         -pa $PWD/../dev/*/ebin\
         -args_file `dirname $0`/system.args

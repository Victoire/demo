#!/usr/bin/env bash

if [[ $1 ]];
then
php -r " echo var_export(unserialize('"$1"')); echo \"\\n\";"
else
STRING=`pbpaste`
php -r " echo var_export(unserialize('"$STRING"')); echo \"\\n\";" | pbcopy
php -r "echo 'unserialized array copied in the pressclip'; echo \"\\n\";"
fi

#!/usr/bin/env bash

if [[ $1 ]];
then
   php -r ' $pb = "'$1'"; eval("\$array = $pb;"); echo serialize($array); ' | pbcopy
else

   php -r ' $pb = shell_exec("pbpaste"); eval("\$array = $pb;"); echo serialize($array); ' | pbcopy
   php -r "echo 'serialized array copied in the pressclip'; echo \"\\n\";"
fi

#!/bin/sh
# sh becaue dind does not include bash

error_in_compose=false

# Search compose files in first directory layer only. Files must be .yml. Folders starting with _ are excluded.
for file in $(find * -mindepth 1 -maxdepth 1 -type f -iname '*.yml' ! -path '_*'); do
    echo ${file}
    docker-compose -f ${file} config -q;
    if [ "$?" -gt 0 ]
    then
        error_in_compose=true
    fi
done

if [ "$error_in_compose" == true ]
    then
        echo "SOME COMPOSE FILES HAVE AN ERROR!"
        exit 1
    else
        echo "ALL COMPOSE FILES ARE SYNTACTICALLY CORRECT!"
fi
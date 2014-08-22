#!/bin/bash

set -e

if [ "$1" ]; then
 for dir in /var/www/*/core/extensions
     do
        cd "$dir"
        git checkout master
        git reset --hard origin/master
        git pull
        git branch -D "$1"
        git checkout -b "$1" "$1"
     done
 echo "Extensions are updated to '$1'"

else
 for dir in core/extensions/*
     do
        cd "$dir"
        git checkout master
        git reset --hard origin/master
        git pull
     done
 echo "Extensions are updated to master"
fi

echo "Updating mw-master to latest master"

cd /var/www/mw-master/core
git checkout master
git reset --hard origin/master
git pull

echo "Updated mw-master to latest master"

# Update each core repositories
for dir in /var/www/*
    do
        cd "$dir"
        php maintenance/update.php
    done

echo "Ran update.php to all extensions"

#!/bin/bash

if [ "$1" ]; then
 for dir in */extensions
     do
        cd $dir
        git checkout master
        git reset --hard origin/master
        git pull
        git branch -D $1
        git checkout -b $1 $1
     done
 echo "Extensions are updated to '$1'"

else
 for dir in master/extensions/*
     do
        cd $dir
        git checkout master
        git reset --hard origin/master
        git pull
     done
 echo "Extensions are updated to master"
fi

echo "Updating mwmaster to latest master"

cd core/mwmaster/core
git checkout master
git reset --hard origin/master
git pull

echo "Updated mwmaster to latest master"

for dir in /var/www/mlebtest/*
    do
        cd $dir
        php maintenance/update.php
    done

echo "Ran update.php to all extensions"

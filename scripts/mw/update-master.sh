#!/bin/bash

set -e

cd core
git checkout "$1"
git reset --hard origin/master
git pull
echo "master is updated to latest master"

php maintenance/update.php

echo "Finished running update.php on master"

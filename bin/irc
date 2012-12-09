#!/bin/sh

cd ~/.irssi

Date=`date +%a`
clear
echo Today is "$Date"day.

if [ "$Date" = "Sat" ] || [ "$Date" = "Sun" ]
then
    rm -f config
    ln -s config.weekend config
else
    rm -f config
    ln -s config.weekdays config
fi

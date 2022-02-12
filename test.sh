#!/bin/bash
sed -i -e 's/"curl/curl/g' track.sh

find2=`done\n"`
find3=`done\n`

sed -i -e 's/$find2/$find3/g' track.sh

sed -i -e 's/""/"/g' track.sh
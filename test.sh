#!/bin/bash
sed -i -e 's/"curl/curl/g' track.sh
sed -i -e 's/done\n"/done\n/g' track.sh
sed -i -e 's/""/"/g' track.sh
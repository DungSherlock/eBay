#!/bin/bash
sed -i -e 's/"while/while/g' track.sh
sed -i -E 's/fi"/fi/g' track.sh
sed -i -e 's/""/"/g' track.sh
./track.sh
#!/bin/bash
sed -i -e 's/"while/while/g' track-ADOT.sh
sed -i -E 's/fi"/fi/g' track-ADOT.sh
sed -i -e 's/""/"/g' track-ADOT.sh
./track-ADOT.sh
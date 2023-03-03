#!/bin/bash

read -a nickName < nickName.txt
read -a leaderMark < leaderMark.txt

link=()
for i in "${!nickName[@]}"; do
    link+=("${nickName[i]} ${leaderMark[i]}")
done

echo "${link[@]}" > link.txt

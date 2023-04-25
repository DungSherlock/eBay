#!/bin/bash
curl -C - -Ls https://script.google.com/macros/s/AKfycbwUXljrnjCBVZRFbDIbzNtmv9eFrSD-ejpOzXqvwXv2XO6Ybb1JtK5o1Xv9_ffr2QIySw/exec | jq '.content.names[]' | sed 's/"//g' > m3u8/list.txt

while read line
do
    idAudio=`echo $line | cut -d '|' -f1`
    name=`echo $line | cut -d '|' -f2`
    idLink=`echo $line | cut -d '|' -f3`
    m3u8Link=`echo $line | cut -d '|' -f4`
    outputName=`echo $line | cut -d '|' -f5`
    while true
    do
        curl -C - -LOs -H "Host: voiz-prod.s3.cloud.cmctelecom.vn" -H "Accept-Language: vi-VN,vi;q=0.9" -H "Accept: */*" -H "User-Agent: AppleCoreMedia/1.0.0.20E252 (iPhone; U; CPU OS 16_4_1 like Mac OS X; vi_vn)" -H "Referer: stream.voiz.app" --compressed "$m3u8Link"
        if [ $? -eq 0 ] then
            break
        fi
            echo "Có lỗi xảy ra, chờ 3s"
            sleep 3
    done
    cp "$outputName.m3u8" "$name.sh"
    gsed -i '/^#/d' "$name.sh"
    text1='while true; do curl -C - -LOs -H "Host: voiz-prod.s3.cloud.cmctelecom.vn" -H "Accept-Language: en-US,en;q=0.9" -H "Accept: */*" -H "User-Agent: AppleCoreMedia/1.0.0.20E252 (iPhone; U; CPU OS 16_4_1 like Mac OS X; en_us)" -H "Referer: stream.voiz.app" "'
    text2='https://voiz-prod.s3.cloud.cmctelecom.vn/uploads/audio/filename/'$idLink'/'
    text3='"; if [ $? -eq 0 ]; then break; fi; echo "Có lỗi xảy ra, chờ 3s"; sleep 3; done'
    gsed -i "s/^/${text1//\//\\/}${text2//\//\\/}/g; s/$/${text3//\//\\/}/g" "$name.sh"
    firstRow="#!\/bin\/bash\n"
    lastRow='cat part*'$outputName'*.ts > '$outputName'.ts && ffmpeg -i '$outputName'.ts -map 0:a:0 -c copy -y "$(basename -s .sh "$0").aac" && rm *"'$outputName'"*""'
    gsed -i "1s/^/$firstRow/" "$name.sh"
    echo $lastRow >> "$name.sh"
    mv "$outputName.m3u8" "m3u8/"

done < m3u8/list.txt
# rm getList.sh
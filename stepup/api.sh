#!/bin/bash
# eval `ssh-agent -s`
# git pull
# : > wm-TD-usItemId.txt
# : > wm-TD-currentPrice.txt
# : > wm-TD-wasPrice.txt
# : > wm-TD-availabilityStatus.txt
# : > wm-TD-orderLimit.txt

lessons="https://tofu.stepup.edu.vn/tofu/api/v1/communicate/lessons?app_user_id=879654&app_device_id=C52416BE-6D71-4156-8D23-2483BC850836&app_v=2.0.7&platform=ios-17.5.1&device_id=C52416BE-6D71-4156-8D23-2483BC850836&topic_id=105"

outline="https://tofu.stepup.edu.vn/tofu/api/v1/communicate/lesson_outline?app_user_id=879654&app_device_id=C52416BE-6D71-4156-8D23-2483BC850836&app_v=2.0.7&platform=ios-17.5.1&lesson_id=1310&device_id=C52416BE-6D71-4156-8D23-2483BC850836"

basic="https://tofu.stepup.edu.vn/tofu/api/v1/communicate/lesson_detail_data?app_user_id=879654&app_device_id=C52416BE-6D71-4156-8D23-2483BC850836&app_v=2.0.7&platform=ios-17.5.1&device_id=C52416BE-6D71-4156-8D23-2483BC850836&lesson_id=1310&learn_type=BASIC"

extend="https://tofu.stepup.edu.vn/tofu/api/v1/communicate/lesson_detail_data?app_user_id=879654&app_device_id=C52416BE-6D71-4156-8D23-2483BC850836&app_v=2.0.7&platform=ios-17.5.1&device_id=C52416BE-6D71-4156-8D23-2483BC850836&lesson_id=1310&learn_type=EXTEND"

api=`curl -H "Host: tofu.stepup.edu.vn" -H "Accept: application/json" -H "User-Agent: tofuapp/1712053268 CFNetwork/1496.0.7 Darwin/23.5.0" -H "Accept-Language: vi-VN,vi;q=0.9" -H "Authorization: Bearer eyJhbGciOiJIUzUxMiJ9.eyJzdWIiOiIwOTc5MjczNTA3IiwiYXV0aG9yaXRpZXMiOlsiUk9MRV9VU0VSIl0sInVzZXJfaWQiOjg3OTY1NCwidXNlcm5hbWUiOiJIdeG7hyBExaluZyIsImp0aSI6ImoyR2xNVzZTSTJPM2FiR3hLaE5YV184Nzk2NTQiLCJpYXQiOjE3MTQ3NTc1MDAsImV4cCI6MjAzMDExNzUwMH0.kyeFhFDXXBRC1H5V2P629O6Gnrw6VDKGWRPzqZ3jQCcLJLeo-aAkdBnCDZIXyn4bRdiouW6DK81Y0b_lYp7oVg" --compressed "$basic"`

#outline
echo $api | jq '.data.lesson_details[].data.tasks[] | select(.task_description == "NẠP CỤM") | .task_details[] | {audio, sentence_en, sentence_vi, ipa}'
echo $api | jq '.data.lesson_details[].data.tasks[] | select(.task_description == "GHÉP CÂU") | .task_details[] | {audio, sentence_en, sentence_vi, ipa}'

#basic
echo $api | jq '.data.lesson_details[] | select(.type == "FLEXIBLE_PHRASE") | .data | {sentence_en, sentence_vi, sentence_audio_speaker}'
echo $api | jq '.data.lesson_details[] | select(.type == "EXTEND_IDEA_QNA") | .data.messages[] | select(.type == "text") | {content, sentence_vi, audio}'
echo $api | jq '.data.lesson_details[] | select(.type == "LEARNING_CARD") | .data | {sentence_en, ipa, sentence_vi, sentence_audio}'


# while read line
# do
#   # array=(${line//|/ })
#   while true
#   do
#     list=`curl -C - -Ls 'https://www.walmart.com/orchestra/home/graphql/getListDetails/9c473c83d05f86b605d982c553d220cd0d7014a0cdd727836da8bf91eaecc121?variables=%7B%22input%22%3A%7B%22id%22%3A%22'$line'%22%2C%22listType%22%3A%22WL%22%2C%22pagination%22%3A%7B%22page%22%3A1%2C%22pageSize%22%3A100%7D%2C%22sortOrder%22%3A%22DEFAULT%22%2C%22maxItems%22%3Atrue%2C%22skipGeneric%22%3Afalse%2C%22permission%22%3A%22VIEW%22%7D%2C%22groupsEnable%22%3Afalse%7D' \
#   -H 'authority: www.walmart.com' \
#   -H 'accept: application/json' \
#   -H 'accept-language: en-US' \
#   -H 'content-type: application/json' \
#   -H 'cookie: '$cookie'' \
#   -H 'device_profile_ref_id: 4vihg2lpwwbzggqeow3rjzv_ag2eguz6cz-t' \
#   -H 'dnt: 1' \
#   -H 'downlink: 10' \
#   -H 'dpr: 2' \
#   -H 'lists-device-type: desktop' \
#   -H 'sec-ch-ua: "Microsoft Edge";v="117", "Not;A=Brand";v="8", "Chromium";v="117"' \
#   -H 'sec-ch-ua-mobile: ?0' \
#   -H 'sec-ch-ua-platform: "macOS"' \
#   -H 'sec-fetch-dest: empty' \
#   -H 'sec-fetch-mode: cors' \
#   -H 'sec-fetch-site: same-origin' \
#   -H 'traceparent: 00-c61c2a326098db40a1d3eebea54bfeba-a29e9a8c600bafc1-00' \
#   -H 'user-agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/117.0.0.0 Safari/537.36 Edg/117.0.2045.35' \
#   -H 'wm_mp: true' \
#   -H 'wm_qos.correlation_id: YIKkB93kLuv1cIGDbKAo9KuGwIf4l3jAp00o' \
#   -H 'x-apollo-operation-name: getListDetails' \
#   -H 'x-enable-server-timing: 1' \
#   -H 'x-latency-trace: 1' \
#   -H 'x-o-bu: WALMART-US' \
#   -H 'x-o-ccm: server' \
#   -H 'x-o-correlation-id: YIKkB93kLuv1cIGDbKAo9KuGwIf4l3jAp00o' \
#   -H 'x-o-gql-query: query getListDetails' \
#   -H 'x-o-mart: B2C' \
#   -H 'x-o-platform: rweb' \
#   -H 'x-o-platform-version: us-web-1.100.0-514b355-0919T0537' \
#   -H 'x-o-segment: oaoh' \
#   --compressed`

#     list2=`curl -C - -Ls 'https://www.walmart.com/orchestra/home/graphql/getListDetails/9c473c83d05f86b605d982c553d220cd0d7014a0cdd727836da8bf91eaecc121?variables=%7B%22input%22%3A%7B%22id%22%3A%22'$line'%22%2C%22listType%22%3A%22WL%22%2C%22pagination%22%3A%7B%22page%22%3A2%2C%22pageSize%22%3A100%7D%2C%22sortOrder%22%3A%22DEFAULT%22%2C%22maxItems%22%3Atrue%2C%22skipGeneric%22%3Afalse%2C%22permission%22%3A%22VIEW%22%7D%2C%22groupsEnable%22%3Afalse%7D' \
#   -H 'authority: www.walmart.com' \
#   -H 'accept: application/json' \
#   -H 'accept-language: en-US' \
#   -H 'content-type: application/json' \
#   -H 'cookie: '$cookie'' \
#   -H 'device_profile_ref_id: 4vihg2lpwwbzggqeow3rjzv_ag2eguz6cz-t' \
#   -H 'dnt: 1' \
#   -H 'downlink: 10' \
#   -H 'dpr: 2' \
#   -H 'lists-device-type: desktop' \
#   -H 'sec-ch-ua: "Microsoft Edge";v="117", "Not;A=Brand";v="8", "Chromium";v="117"' \
#   -H 'sec-ch-ua-mobile: ?0' \
#   -H 'sec-ch-ua-platform: "macOS"' \
#   -H 'sec-fetch-dest: empty' \
#   -H 'sec-fetch-mode: cors' \
#   -H 'sec-fetch-site: same-origin' \
#   -H 'traceparent: 00-c61c2a326098db40a1d3eebea54bfeba-a29e9a8c600bafc1-00' \
#   -H 'user-agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/117.0.0.0 Safari/537.36 Edg/117.0.2045.35' \
#   -H 'wm_mp: true' \
#   -H 'wm_qos.correlation_id: YIKkB93kLuv1cIGDbKAo9KuGwIf4l3jAp00o' \
#   -H 'x-apollo-operation-name: getListDetails' \
#   -H 'x-enable-server-timing: 1' \
#   -H 'x-latency-trace: 1' \
#   -H 'x-o-bu: WALMART-US' \
#   -H 'x-o-ccm: server' \
#   -H 'x-o-correlation-id: YIKkB93kLuv1cIGDbKAo9KuGwIf4l3jAp00o' \
#   -H 'x-o-gql-query: query getListDetails' \
#   -H 'x-o-mart: B2C' \
#   -H 'x-o-platform: rweb' \
#   -H 'x-o-platform-version: us-web-1.100.0-514b355-0919T0537' \
#   -H 'x-o-segment: oaoh' \
#   --compressed`

#     if [[ $list =~ "blocked" ]]
#       then
#         link=`echo $list | jq '.redirectUrl' | sed 's/"//g'`
#         `open -n -a /Applications/Microsoft\ Edge.app --args --profile-directory=Default https://walmart.com$link`
#         read -p "blocked"
#         echo 'Thoát script'
#         exit 1
#       else
#         echo $list | jq '.data.shoppingListDetails.items.listItems[].product.usItemId' >> wm-TD-usItemId.txt
#         echo $list2 | jq '.data.shoppingListDetails.items.listItems[].product.usItemId' >> wm-TD-usItemId.txt
#         echo $list | jq '.data.shoppingListDetails.items.listItems[].product.priceInfo.currentPrice.price' >> wm-TD-currentPrice.txt
#         echo $list2 | jq '.data.shoppingListDetails.items.listItems[].product.priceInfo.currentPrice.price' >> wm-TD-currentPrice.txt
#         echo $list | jq '.data.shoppingListDetails.items.listItems[].product.priceInfo.wasPrice.price' | sed 's/null//g' >> wm-TD-wasPrice.txt
#         echo $list2 | jq '.data.shoppingListDetails.items.listItems[].product.priceInfo.wasPrice.price' | sed 's/null//g' >> wm-TD-wasPrice.txt
#         echo $list | jq '.data.shoppingListDetails.items.listItems[].product.availabilityStatus' >> wm-TD-availabilityStatus.txt
#         echo $list2 | jq '.data.shoppingListDetails.items.listItems[].product.availabilityStatus' >> wm-TD-availabilityStatus.txt
#         echo $list | jq '.data.shoppingListDetails.items.listItems[].product.orderLimit' >> wm-TD-orderLimit.txt
#         echo $list2 | jq '.data.shoppingListDetails.items.listItems[].product.orderLimit' >> wm-TD-orderLimit.txt
#         echo ${line[0]}
#         break
#     fi
#   done
# done < wm-TD-list.txt

# git add -A .
# git commit -m --allow-empty
# git push
# git push origin HEAD -f
# gitCommit=`git rev-parse HEAD`
# linkGit=`echo https://raw.githubusercontent.com/DungSherlock/eBay/`$gitCommit`echo /`
# apiTD=`echo https://script.google.com/macros/s/AKfycbwjeDgCI1EMcwOCQoOqeIKyTa2zHJ3UOfGru0J_RfnHPjjQNaCYbsg1bX9q_8kL0k7ANQ/exec?`
# apiFLY=`echo https://script.google.com/macros/s/AKfycbws0w4cG4jntUsWOBzKcy-2PM_vFKojfLtSyOVhp8PMbr4L3YXzpNZYDLb8ygS2WwBMQQ/exec?`
# linkPostTD=$apiTD`echo LinkID==IMPORTDATA\(\"`$linkGit`echo wm-TD-usItemId.txt\"\)\
# \&GiaHienTai==IMPORTDATA\(\"`$linkGit`echo wm-TD-currentPrice.txt\"\)\
# \&TrangThaiHang==IMPORTDATA\(\"`$linkGit`echo wm-TD-availabilityStatus.txt\"\)\
# \&Quantity==IMPORTDATA\(\"`$linkGit`echo wm-TD-orderLimit.txt\"\)
# `
# linkPostFLY=$apiFLY`echo LinkID==IMPORTDATA\(\"`$linkGit`echo wm-TD-usItemId.txt\"\)\
# \&GiaHienTai==IMPORTDATA\(\"`$linkGit`echo wm-TD-currentPrice.txt\"\)\
# \&TrangThaiHang==IMPORTDATA\(\"`$linkGit`echo wm-TD-availabilityStatus.txt\"\)\
# \&Quantity==IMPORTDATA\(\"`$linkGit`echo wm-TD-orderLimit.txt\"\)
# `

# echo '[InternetShortcut]\
# URL='$linkPostTD > wm-TD.url
# open -a "Microsoft Edge" wm-TD.url
# # open https://app.clickup.com/9008002310/v/b/7-9008002310-2

# echo '[InternetShortcut]\
# URL='$linkPostFLY > wm-FLY.url
# open -a "Microsoft Edge" wm-FLY.url
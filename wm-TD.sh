#!/bin/bash
git pull
: > ebay-usItemId.txt
: > ebay-currentPrice.txt
: > ebay-wasPrice.txt
: > ebay-availabilityStatus.txt
: > ebay-orderLimit.txt

curl -C - -Ls https://script.google.com/macros/s/AKfycbxLSohHO4ZCfamg0195s7GB77CsXz20Xa_gVlrNhKvh3EToDMarPCtgNRcsXa6W09M4nA/exec | jq '.content.names[]' | sed 's/"//g' | sed 's/.*\///g' > wm-TD-list.txt


while read line
do
  # array=(${line//|/ })
  while true
  do
    list=`curl -s 'https://www.walmart.com/orchestra/home/graphql/getListDetails/4fb20c34987f00ecdbbf4f388b7ddc80a70519f2d9f87c615b59f71834124dcd?variables=%7B%22input%22%3A%7B%22id%22%3A%22'$line'%22%2C%22listType%22%3A%22WL%22%2C%22pagination%22%3A%7B%22page%22%3A1%2C%22pageSize%22%3A1%7D%2C%22sortOrder%22%3A%22DEFAULT%22%2C%22maxItems%22%3Atrue%2C%22skipGeneric%22%3Atrue%2C%22permission%22%3A%22VIEW%22%7D%7D' \
  -H 'authority: www.walmart.com' \
  -H 'accept: application/json' \
  -H 'accept-language: vi' \
  -H 'content-type: application/json' \
  -H 'device_profile_ref_id: iFp6Hi50uc-gNvplE2uA4NA0qnOlAN2G04Gj' \
  -H 'dnt: 1' \
  -H 'lists-device-type: desktop' \
  -H 'referer: https://www.walmart.com/lists/shared/WL/'$line'' \
  -H 'sec-ch-ua: "Chromium";v="106", "Microsoft Edge";v="106", "Not;A=Brand";v="99"' \
  -H 'sec-ch-ua-mobile: ?0' \
  -H 'sec-ch-ua-platform: "macOS"' \
  -H 'sec-fetch-dest: empty' \
  -H 'sec-fetch-mode: cors' \
  -H 'sec-fetch-site: same-origin' \
  -H 'traceparent: 00-7397a0a5fef6de55685b3d3eca6a245a-ffc7eb1e30e2892c-00' \
  -H 'user-agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36 Edg/111.0.1661.43' \
  -H 'wm_mp: true' \
  -H 'wm_page_url: https://www.walmart.com/lists/shared/WL/'$line'' \
  -H 'wm_qos.correlation_id: aN3Kozf7JSv9SfIdoMq_jMSUZTmEjc-3K_wf' \
  -H 'x-apollo-operation-name: getListDetails' \
  -H 'x-enable-server-timing: 1' \
  -H 'x-latency-trace: 1' \
  -H 'x-o-bu: WALMART-US' \
  -H 'x-o-ccm: server' \
  -H 'x-o-correlation-id: aN3Kozf7JSv9SfIdoMq_jMSUZTmEjc-3K_wf' \
  -H 'x-o-gql-query: query getListDetails' \
  -H 'x-o-mart: B2C' \
  -H 'x-o-platform: rweb' \
  -H 'x-o-platform-version: main-1.26.0-be17f7' \
  -H 'x-o-segment: oaoh' \
  --compressed`

    list2=`curl -s 'https://www.walmart.com/orchestra/home/graphql/getListDetails/4fb20c34987f00ecdbbf4f388b7ddc80a70519f2d9f87c615b59f71834124dcd?variables=%7B%22input%22%3A%7B%22id%22%3A%22'$line'%22%2C%22listType%22%3A%22WL%22%2C%22pagination%22%3A%7B%22page%22%3A2%2C%22pageSize%22%3A1%7D%2C%22sortOrder%22%3A%22DEFAULT%22%2C%22maxItems%22%3Atrue%2C%22skipGeneric%22%3Atrue%2C%22permission%22%3A%22VIEW%22%7D%7D' \
  -H 'authority: www.walmart.com' \
  -H 'accept: application/json' \
  -H 'accept-language: vi' \
  -H 'content-type: application/json' \
  -H 'device_profile_ref_id: iFp6Hi50uc-gNvplE2uA4NA0qnOlAN2G04Gj' \
  -H 'dnt: 1' \
  -H 'lists-device-type: desktop' \
  -H 'referer: https://www.walmart.com/lists/shared/WL/'$line'' \
  -H 'sec-ch-ua: "Chromium";v="106", "Microsoft Edge";v="106", "Not;A=Brand";v="99"' \
  -H 'sec-ch-ua-mobile: ?0' \
  -H 'sec-ch-ua-platform: "macOS"' \
  -H 'sec-fetch-dest: empty' \
  -H 'sec-fetch-mode: cors' \
  -H 'sec-fetch-site: same-origin' \
  -H 'traceparent: 00-7397a0a5fef6de55685b3d3eca6a245a-ffc7eb1e30e2892c-00' \
  -H 'user-agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36 Edg/111.0.1661.43' \
  -H 'wm_mp: true' \
  -H 'wm_page_url: https://www.walmart.com/lists/shared/WL/'$line'' \
  -H 'wm_qos.correlation_id: aN3Kozf7JSv9SfIdoMq_jMSUZTmEjc-3K_wf' \
  -H 'x-apollo-operation-name: getListDetails' \
  -H 'x-enable-server-timing: 1' \
  -H 'x-latency-trace: 1' \
  -H 'x-o-bu: WALMART-US' \
  -H 'x-o-ccm: server' \
  -H 'x-o-correlation-id: aN3Kozf7JSv9SfIdoMq_jMSUZTmEjc-3K_wf' \
  -H 'x-o-gql-query: query getListDetails' \
  -H 'x-o-mart: B2C' \
  -H 'x-o-platform: rweb' \
  -H 'x-o-platform-version: main-1.26.0-be17f7' \
  -H 'x-o-segment: oaoh' \
  --compressed`

    if [[ $list =~ "blocked" ]]
      then
        link=`echo $list | jq '.redirectUrl' | sed 's/"//g'`
        `open -n -a /Applications/Microsoft\ Edge.app --args --profile-directory=Default https://walmart.com$link`
        read -p "blocked"
        echo 'Thoát script'
        exit 1
      else
        echo $list | jq '.data.shoppingListDetails.items.listItems[].product.usItemId' >> ebay-usItemId.txt
        echo $list2 | jq '.data.shoppingListDetails.items.listItems[].product.usItemId' >> ebay-usItemId.txt
        echo $list | jq '.data.shoppingListDetails.items.listItems[].product.priceInfo.currentPrice.price' >> ebay-currentPrice.txt
        echo $list2 | jq '.data.shoppingListDetails.items.listItems[].product.priceInfo.currentPrice.price' >> ebay-currentPrice.txt
        echo $list | jq '.data.shoppingListDetails.items.listItems[].product.priceInfo.wasPrice.price' | sed 's/null//g' >> ebay-wasPrice.txt
        echo $list2 | jq '.data.shoppingListDetails.items.listItems[].product.priceInfo.wasPrice.price' | sed 's/null//g' >> ebay-wasPrice.txt
        echo $list | jq '.data.shoppingListDetails.items.listItems[].product.availabilityStatus' >> ebay-availabilityStatus.txt
        echo $list2 | jq '.data.shoppingListDetails.items.listItems[].product.availabilityStatus' >> ebay-availabilityStatus.txt
        echo $list | jq '.data.shoppingListDetails.items.listItems[].product.orderLimit' >> ebay-orderLimit.txt
        echo $list2 | jq '.data.shoppingListDetails.items.listItems[].product.orderLimit' >> ebay-orderLimit.txt
        echo ${line[0]}
        break
    fi
  done
done < wm-TD-list.txt

git add -A .
git commit -m --allow-empty
git push
git push origin HEAD -f
gitCommit=`git rev-parse HEAD`
linkGit=`echo https://raw.githubusercontent.com/DungSherlock/eBay/`$gitCommit`echo /`
linkApi=`echo https://script.google.com/macros/s/AKfycbwjeDgCI1EMcwOCQoOqeIKyTa2zHJ3UOfGru0J_RfnHPjjQNaCYbsg1bX9q_8kL0k7ANQ/exec?`
linkPost=$linkApi`echo LinkID==IMPORTDATA\(\"`$linkGit`echo ebay-usItemId.txt\"\)\
\&GiaHienTai==IMPORTDATA\(\"`$linkGit`echo ebay-currentPrice.txt\"\)\
\&TrangThaiHang==IMPORTDATA\(\"`$linkGit`echo ebay-availabilityStatus.txt\"\)\
\&Quantity==IMPORTDATA\(\"`$linkGit`echo ebay-orderLimit.txt\"\)
`
echo '[InternetShortcut]\
URL='$linkPost > wm-TD.url
open wm-TD.url
open https://app.clickup.com/9008002310/v/b/7-9008002310-2
#!/bin/bash
  # --data-raw '{"query":"query shoppingListTotal($input:ListTotalInput){shoppingListTotal(input:$input){products{priceInfo{currentPrice{price}},priceInfo{wasPrice{price}},name,usItemId,availabilityStatus,imageInfo{thumbnailUrl}}}}","variables":{"input":{"id":"5235469c-9c94-4bc9-96cc-e0f44ade3b9e","permission":"VIEW"}}}' \

list1=`curl 'https://www.walmart.com/orchestra/home/graphql' \
  -H 'authority: www.walmart.com' \
  -H 'sec-ch-ua: "Microsoft Edge";v="95", "Chromium";v="95", ";Not A Brand";v="99"' \
  -H 'x-o-platform: rweb' \
  -H 'dnt: 1' \
  -H 'x-o-correlation-id: GXeAU7LQidNgZ1VdBU6c5RdFinx2rlrmzcdc' \
  -H 'device_profile_ref_id: LlDy6XxmkLbb-fmOqyGUoK6NnHex3B5W_2Zu' \
  -H 'x-latency-trace: 1' \
  -H 'wm_mp: true' \
  -H 'x-o-market: us' \
  -H 'x-o-platform-version: main-253-ebbb47' \
  -H 'x-o-gql-query: query shoppingListTotal' \
  -H 'x-apollo-operation-name: shoppingListTotal' \
  -H 'sec-ch-ua-platform: "macOS"' \
  -H 'sec-ch-ua-mobile: ?0' \
  -H 'user-agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/95.0.4638.69 Safari/537.36 Edg/95.0.1020.53' \
  -H 'x-o-segment: oaoh' \
  -H 'content-type: application/json' \
  -H 'accept: application/json' \
  -H 'x-enable-server-timing: 1' \
  -H 'x-o-ccm: server' \
  -H 'wm_qos.correlation_id: GXeAU7LQidNgZ1VdBU6c5RdFinx2rlrmzcdc' \
  -H 'origin: https://www.walmart.com' \
  -H 'sec-fetch-site: same-origin' \
  -H 'sec-fetch-mode: cors' \
  -H 'sec-fetch-dest: empty' \
  -H 'accept-language: vi' \
  # -H 'cookie: ACID=b050ddc7-01f9-4a7c-9762-318b4949722b; hasACID=true; locDataV3=eyJpbnRlbnQiOiJTSElQUElORyIsInBpY2t1cCI6W3siYnVJZCI6IjAiLCJub2RlSWQiOiIzMDgxIiwiZGlzcGxheU5hbWUiOiJTYWNyYW1lbnRvIFN1cGVyY2VudGVyIiwibm9kZVR5cGUiOiJTVE9SRSIsImFkZHJlc3MiOnsicG9zdGFsQ29kZSI6Ijk1ODI5IiwiYWRkcmVzc0xpbmUxIjoiODkxNSBHZXJiZXIgUm9hZCIsImNpdHkiOiJTYWNyYW1lbnRvIiwic3RhdGUiOiJDQSIsImNvdW50cnkiOiJVUyIsInBvc3RhbENvZGU5IjoiOTU4MjktMDAwMCJ9LCJnZW9Qb2ludCI6eyJsYXRpdHVkZSI6MzguNDgyNjc3LCJsb25naXR1ZGUiOi0xMjEuMzY5MDI2fSwiaXNHbGFzc0VuYWJsZWQiOnRydWUsInNjaGVkdWxlZEVuYWJsZWQiOnRydWUsInVuU2NoZWR1bGVkRW5hYmxlZCI6dHJ1ZX1dLCJzaGlwcGluZ0FkZHJlc3MiOnsibGF0aXR1ZGUiOjM4LjQ4MjY3NywibG9uZ2l0dWRlIjotMTIxLjM2OTAyNiwicG9zdGFsQ29kZSI6Ijk1ODI5IiwiY2l0eSI6IlNhY3JhbWVudG8iLCJzdGF0ZSI6IkNBIiwiY291bnRyeUNvZGUiOiJVUyIsImxvY2F0aW9uQWNjdXJhY3kiOiJsb3ciLCJnaWZ0QWRkcmVzcyI6ZmFsc2V9LCJhc3NvcnRtZW50Ijp7Im5vZGVJZCI6IjMwODEiLCJkaXNwbGF5TmFtZSI6IlNhY3JhbWVudG8gU3VwZXJjZW50ZXIiLCJhY2Nlc3NQb2ludHMiOm51bGwsImludGVudCI6IlBJQ0tVUCIsInNjaGVkdWxlRW5hYmxlZCI6ZmFsc2V9LCJpbnN0b3JlIjpmYWxzZSwicmVmcmVzaEF0IjoxNjQwNDQ0MDc2NDU0LCJ2YWxpZGF0ZUtleSI6InByb2Q6djI6YjA1MGRkYzctMDFmOS00YTdjLTk3NjItMzE4YjQ5NDk3MjJiIn0%3D; assortmentStoreId=3081; hasLocData=1; locGuestData=eyJpbnRlbnQiOiJTSElQUElORyIsInN0b3JlSW50ZW50IjoiUElDS1VQIiwibWVyZ2VGbGFnIjpmYWxzZSwicGlja3VwIjp7Im5vZGVJZCI6IjMwODEiLCJ0aW1lc3RhbXAiOjE2NDA0MjI0NzY0NDd9LCJwb3N0YWxDb2RlIjp7InRpbWVzdGFtcCI6MTY0MDQyMjQ3NjQ0NywiYmFzZSI6Ijk1ODI5In0sInZhbGlkYXRlS2V5IjoicHJvZDp2MjpiMDUwZGRjNy0wMWY5LTRhN2MtOTc2Mi0zMThiNDk0OTcyMmIifQ%3D%3D; TB_Latency_Tracker_100=1; TB_Navigation_Preload_01=1; vtc=a_KyL90qJxbTA61PT1m85c; bstc=a_KyL90qJxbTA61PT1m85c; mobileweb=0; xpa=CfaEu|aKAYi|s6z_-|vdskW; exp-ck=CfaEu1aKAYi1; _pxhd=173Ez2ssUzz3NbBJNfd0AfkVFWqJG-IZfBT7A1vCZcIlrpMDWGg1T9IHzrPGLQUzYZ7UU7WPW1dZ/id9gg5PRQ==:pEW7kbAfzQsk-X7PwxmAT6xlTRbGntVQF-fxQz9IKV-rmNv-gKPLm3dzKTaJusvZKxwNb7txtUS642naQvyuXZGaY7TdtVut4uPgDCdKQH0=; TBV=7; pxcts=4ab90cf0-6560-11ec-96a9-932a3aefcb02; _pxvid=493af19a-6560-11ec-b005-7270484b504f; xpm=1%2B1640422476%2Ba_KyL90qJxbTA61PT1m85c~%2B0; tb_sw_supported=true; ak_bmsc=22E29B17F957381B824C574DFA9CAC69~000000000000000000000000000000~YAAQJOscuOqIFbh9AQAAx5TM8A50KX/BDk8wRihppUZDE17OuhV/Y/lVxkj1Hl2ps1PBf2NMkvJjIubCz1Ie0WnkTUQUYM/imPj2A2YnOXyhDMmAY8AhlmBEGzqU1KL6iitcRQqERyRPTeMXQDUdBtgyti7zmMuppIAnToWTVEQ721+Nz6IRuAAib6kgX/ZHNHJrALPMI0KhbWOY1TtgHVu74FxgPi2gOsR0u9Z8LYCZiFelzBeOhHK9612ScWkwy8JWC5Mm12QeyuJH/LzWW9czLWB/E9N1vtsJA2L8Ot6OTYY/mVVAiTWETxaaMVxc+QYsN1/Vezoh6BZyFvGnp3Nx7/uFza6dAHVowaB+kw9IjDTEAhGVbt5Snpj+2QWCDYXtG+VPb0JLp47AWVeZ5rhoK9qpf+InnUrTYgp39aArJOYvaWgtBX65Jys2FLQ/4SDNYzFO7ejy9Nm+d/XNS6bdtqbsxPkRwb3pwEdSMFuQpl/0v5h6uQ0GNJg=; AID=wmlspartner%253D0%253Areflectorid%253D0000000000000000000000%253Alastupd%253D1640422524729; TB_SFOU-100=1; auth=MTAyOTYyMDE4rG0gTDxswGDcKdT2aCxwy%2FaJwCWYQpMDAqXaPmC09BVsDDxBYKZ4HP0M2XBGQpZKve%2BxM4zZGdOdBMFJK%2FaR%2Fue6PjaHEN161gNciXiTU0E5tGFnSP%2FEQLqsFP5vzi1P767wuZloTfhm7Wk2KcjygpySosImygUk1x1iKsdnk48xhytVpyG%2FXIoZuLyGAv%2Fr9B9dAZcKOZ6qFzlfrsPaiYprKgwCzsrkvGG9Zpkm5U0UMk70P8glgOEpLOprhDfMywI05adPtwc9%2Fm5r1ONHR%2BRoYQ2jbkh9%2BHRfiT0pHwMjHm9VEvrUd0eM07oT4YeV0x6y5UVDwwENeLDgx9%2BJBm%2BfxvU%2BRFoQGFqneCB1L6KswE7BJjpR3TP3IRI4AkL%2BS5fIohkC2dzHYdwr8mETkyQzX7MAlLBJXxL%2Bwi6fx6Y%3D; com.wm.reflector="reflectorid:0000000000000000000000@lastupd:1640424598777@firstcreate:1640422476385"; xptwg=575118943:100C92FB380A3B0:2A05168:35BCBD27:3B4D9105:F8C34CC9:; TS01b0be75=01538efd7c9909dacc220821bd32c238282cf695090dd537b98f7af4712ab637c49c9c98da90b0ed080967cd725fe20db9f1f42ecb; TS013ed49a=01538efd7c9909dacc220821bd32c238282cf695090dd537b98f7af4712ab637c49c9c98da90b0ed080967cd725fe20db9f1f42ecb; bm_sv=6B85461452DEB9938FCDFB90280B047C~XOLJ4EK9LKC/e963Uve6HyRTZ+6wytVxi62GQLH7cPnF++GE4t4JE4kkG+yIsDj88R+asIwp2fRRGX8Lc0KHOmkwL4f3etItujyWFcKXXPWv4IKTKR5JyV/IYExe00W8MyM0qYfpgbcvuFAD7YA7gP0A5Me20oxRJUIbsmEXnDg=' \
  --data-raw '{"query":"query shoppingListTotal($input:ListTotalInput){shoppingListTotal(input:$input){products{priceInfo{currentPrice{price}},priceInfo{wasPrice{price}},name,usItemId,availabilityStatus}}}","variables":{"input":{"id":"5235469c-9c94-4bc9-96cc-e0f44ade3b9e","permission":"VIEW"}}}' \
  --compressed`

list2=`curl 'https://www.walmart.com/orchestra/home/graphql' \
  -H 'authority: www.walmart.com' \
  -H 'sec-ch-ua: "Microsoft Edge";v="95", "Chromium";v="95", ";Not A Brand";v="99"' \
  -H 'x-o-platform: rweb' \
  -H 'dnt: 1' \
  -H 'x-o-correlation-id: GXeAU7LQidNgZ1VdBU6c5RdFinx2rlrmzcdc' \
  -H 'device_profile_ref_id: LlDy6XxmkLbb-fmOqyGUoK6NnHex3B5W_2Zu' \
  -H 'x-latency-trace: 1' \
  -H 'wm_mp: true' \
  -H 'x-o-market: us' \
  -H 'x-o-platform-version: main-253-ebbb47' \
  -H 'x-o-gql-query: query shoppingListTotal' \
  -H 'x-apollo-operation-name: shoppingListTotal' \
  -H 'sec-ch-ua-platform: "macOS"' \
  -H 'sec-ch-ua-mobile: ?0' \
  -H 'user-agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/95.0.4638.69 Safari/537.36 Edg/95.0.1020.53' \
  -H 'x-o-segment: oaoh' \
  -H 'content-type: application/json' \
  -H 'accept: application/json' \
  -H 'x-enable-server-timing: 1' \
  -H 'x-o-ccm: server' \
  -H 'wm_qos.correlation_id: GXeAU7LQidNgZ1VdBU6c5RdFinx2rlrmzcdc' \
  -H 'origin: https://www.walmart.com' \
  -H 'sec-fetch-site: same-origin' \
  -H 'sec-fetch-mode: cors' \
  -H 'sec-fetch-dest: empty' \
  -H 'accept-language: vi' \
  --data-raw '{"query":"query shoppingListTotal($input:ListTotalInput){shoppingListTotal(input:$input){products{priceInfo{currentPrice{price}},priceInfo{wasPrice{price}},name,usItemId,availabilityStatus}}}","variables":{"input":{"id":"35f6f25d-5c2a-49bb-a9f2-0c78204a2099","permission":"VIEW"}}}' \
  --compressed`

list3=`curl 'https://www.walmart.com/orchestra/home/graphql' \
  -H 'authority: www.walmart.com' \
  -H 'sec-ch-ua: "Microsoft Edge";v="95", "Chromium";v="95", ";Not A Brand";v="99"' \
  -H 'x-o-platform: rweb' \
  -H 'dnt: 1' \
  -H 'x-o-correlation-id: GXeAU7LQidNgZ1VdBU6c5RdFinx2rlrmzcdc' \
  -H 'device_profile_ref_id: LlDy6XxmkLbb-fmOqyGUoK6NnHex3B5W_2Zu' \
  -H 'x-latency-trace: 1' \
  -H 'wm_mp: true' \
  -H 'x-o-market: us' \
  -H 'x-o-platform-version: main-253-ebbb47' \
  -H 'x-o-gql-query: query shoppingListTotal' \
  -H 'x-apollo-operation-name: shoppingListTotal' \
  -H 'sec-ch-ua-platform: "macOS"' \
  -H 'sec-ch-ua-mobile: ?0' \
  -H 'user-agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/95.0.4638.69 Safari/537.36 Edg/95.0.1020.53' \
  -H 'x-o-segment: oaoh' \
  -H 'content-type: application/json' \
  -H 'accept: application/json' \
  -H 'x-enable-server-timing: 1' \
  -H 'x-o-ccm: server' \
  -H 'wm_qos.correlation_id: GXeAU7LQidNgZ1VdBU6c5RdFinx2rlrmzcdc' \
  -H 'origin: https://www.walmart.com' \
  -H 'sec-fetch-site: same-origin' \
  -H 'sec-fetch-mode: cors' \
  -H 'sec-fetch-dest: empty' \
  -H 'accept-language: vi' \
  --data-raw '{"query":"query shoppingListTotal($input:ListTotalInput){shoppingListTotal(input:$input){products{priceInfo{currentPrice{price}},priceInfo{wasPrice{price}},name,usItemId,availabilityStatus}}}","variables":{"input":{"id":"caf523c1-f70a-4d38-aa12-029147e94b16","permission":"VIEW"}}}' \
  --compressed`

if [[ $list1 =~ "blocked" ]]
then
  echo "Lỗi rồi!"
  exit
fi


# echo $output | jq '.data.shoppingListTotal.products[].imageInfo.thumbnailUrl' | sed 's/\,//g' > ebay-thumbnailUrl
# echo $output | jq '.data.shoppingListTotal.products[].name' | sed 's/\,//g' > ebay-name
echo $list1 | jq '.data.shoppingListTotal.products[].usItemId' > ebay-usItemId.txt
echo $list1 | jq '.data.shoppingListTotal.products[].priceInfo.currentPrice.price' > ebay-currentPrice.txt
echo $list1 | jq '.data.shoppingListTotal.products[].priceInfo.wasPrice.price' | sed 's/null//g'> ebay-wasPrice.txt
echo $list1 | jq '.data.shoppingListTotal.products[].availabilityStatus' > ebay-availabilityStatus.txt

echo $list2 | jq '.data.shoppingListTotal.products[].usItemId' >> ebay-usItemId.txt
echo $list2 | jq '.data.shoppingListTotal.products[].priceInfo.currentPrice.price' >> ebay-currentPrice.txt
echo $list2 | jq '.data.shoppingListTotal.products[].priceInfo.wasPrice.price' | sed 's/null//g' >> ebay-wasPrice.txt
echo $list2 | jq '.data.shoppingListTotal.products[].availabilityStatus' >> ebay-availabilityStatus.txt

# echo $list3 | jq '.data.shoppingListTotal.products[].usItemId' >> ebay-usItemId.txt
# echo $list3 | jq '.data.shoppingListTotal.products[].priceInfo.currentPrice.price' >> ebay-currentPrice.txt
# echo $list3 | jq '.data.shoppingListTotal.products[].priceInfo.wasPrice.price' | sed 's/null//g' >> ebay-wasPrice.txt
# echo $list3 | jq '.data.shoppingListTotal.products[].availabilityStatus' >> ebay-availabilityStatus.txt

git add -A .
git commit -m --allow-empty
git push
git push origin HEAD -f
gitCommit=`git rev-parse HEAD`
linkGit=`echo https://raw.githubusercontent.com/DungSherlock/eBay/`$gitCommit`echo /`
linkApi=`echo https://script.google.com/macros/s/AKfycby_hOHVU89OzlCdtECUuqy3pSW83BtIPJmoW2UGMC7PWmLdxErG1Fn5niiyRyPnUgGqYA/exec?`
linkPost=$linkApi`echo Link ID==IMPORTDATA\(\"`$linkGit`echo ebay-usItemId.txt\"\)\&Giá hiện tại==IMPORTDATA\(\"`$linkGit`echo ebay-currentPrice.txt\"\)\&Trạng thái hàng==IMPORTDATA\(\"`$linkGit`echo ebay-availabilityStatus.txt\"\)\&Giá gốc==IMPORTDATA\(\"`$linkGit`echo ebay-wasPrice.txt\"\)`
echo $linkPost
# curl POST `https://script.google.com/macros/s/AKfycby_hOHVU89OzlCdtECUuqy3pSW83BtIPJmoW2UGMC7PWmLdxErG1Fn5niiyRyPnUgGqYA/exec?Link ID==IMPORTDATA("https://raw.githubusercontent.com/DungSherlock/eBay/ea474c5affcfa46bdd9fa86d49ccb2f14f1aa5cc/ebay-usItemId.txt")&Giá hiện tại==IMPORTDATA("https://raw.githubusercontent.com/DungSherlock/eBay/ea474c5affcfa46bdd9fa86d49ccb2f14f1aa5cc/ebay-currentPrice.txt")&Trạng thái hàng==IMPORTDATA("https://raw.githubusercontent.com/DungSherlock/eBay/ea474c5affcfa46bdd9fa86d49ccb2f14f1aa5cc/ebay-availabilityStatus.txt")&Giá gốc==IMPORTDATA("https://raw.githubusercontent.com/DungSherlock/eBay/ea474c5affcfa46bdd9fa86d49ccb2f14f1aa5cc/ebay-wasPrice.txt")`
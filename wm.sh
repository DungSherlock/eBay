#!/bin/bash
  # --data-raw '{"query":"query shoppingListTotal($input:ListTotalInput){shoppingListTotal(input:$input){products{priceInfo{currentPrice{price}},priceInfo{wasPrice{price}},name,usItemId,availabilityStatus,imageInfo{thumbnailUrl}}}}","variables":{"input":{"id":"5235469c-9c94-4bc9-96cc-e0f44ade3b9e","permission":"VIEW"}}}' \

: > ebay-usItemId.txt
: > ebay-currentPrice.txt
: > ebay-wasPrice.txt
: > ebay-availabilityStatus.txt

while true
do
list1=`curl -s 'https://www.walmart.com/orchestra/home/graphql' \
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
  -H 'cookie: auth=MTAyOTYyMDE4SAFoijgoW%2BwVbVl1XCR8b1LY15K%2FPFkpB3eqeMWKxB8neaW%2BC1T2bnXu4hcsFbsL3drLRuHXPg%2F%2Fk1f6bSTYAzjhJuhJDynI%2BiazR%2F4BWP8KjDEgutZecVEIw2W%2FoD%2B4767wuZloTfhm7Wk2KcjygobRHThsmZk%2BGcqTfIab85SwxXtAz7E82fz1Znm95f9I31fMVdEFB01AdiHjLYIrVgSU6%2FFSyFHoBLkxTbgXNUoUMk70P8glgOEpLOprhDfMM%2FFHGZ2dCNmxWrdkwqEKrjMMRWvuyffZ1jFJ6FEiGMy5eEZMH6Z6ge%2BPBrf%2BmQ6MFTZUwhWEMIwdnlmj85fW3xwH4pTZFmNzWmz2pR5ixfLpB03mfjBSpaZQK7Euu6DERjQ3r9INNAjLhqBeT2p7%2FljKcklje4R5ioW78kDnDBU%3D; ACID=04d84235-6998-47be-a2f2-91071c122a77; hasACID=true; assortmentStoreId=3081; hasLocData=1; TB_Latency_Tracker_100=1; TB_Navigation_Preload_01=1; vtc=Wwbqv2nRsU2su70JwXaqZk; bstc=Wwbqv2nRsU2su70JwXaqZk; mobileweb=0; xpa=2PRJ6|9qHE4|DAwQd|KzWDJ|PwUCp|fD9ZO|mrxWN|pAAwd|s6z_-|vkFmv|yurXb; exp-ck=DAwQd2PwUCp1fD9ZO1vkFmv1yurXb1; TS01b0be75=01538efd7c6e4f5583d7d9fab7f97ce95db0a921ecad5afe719e9432b5beabf8d846a3ffd55efbabfae6b079855b9acab3f92af4ad; TS013ed49a=01538efd7c6e4f5583d7d9fab7f97ce95db0a921ecad5afe719e9432b5beabf8d846a3ffd55efbabfae6b079855b9acab3f92af4ad; TBV=7; tb_sw_supported=true; ak_bmsc=3C08BCE3E605BDA834111846614D317F~000000000000000000000000000000~YAAQBS83Fwcqtql+AQAAEVsnqg71Qntyg8gPY7pbbJQBYcohSHcwfonQ756IXPgno+Ni0rrSNFhBMPgWw2GLlJp3UJ1y6ZIc2n6Go+aNEYnELk1UotVxy/a06iVlWE3zlfFKyKMBSsJ1NpzvPSQ3O889ppxDP0XScxTXzKllwPwd5TF4EyE0YqKRkUK7vhdPJ/IQULjXOhy/mt3K9Nz2TPX/SQ5NEd7UmSoMIvASBmS+oyCdC4pdU/6tmKTtvgCGpQuVkw4eTjjK1U5VToGhYHb8RpHCfILCQl2DE0BqY0BJA1ZFEm2L+qgBXLevYmNVBKvp+RikFnP3hkCiupmaf18CSj5nf6ZQW+GLJP24KJZq/tNaWm0nypm0Ar9kv5++OhOoMRwBE+SqVYSFj3hszXQWE40b3ubmc3FZ/WowcIsu2j6597qI1xLzzQAslWQ2Y7ibhqk+94UzniGnWfoyXgD+XneJmoJ6OC11I0X7lt7de8iIID1m5LGiiEL3; pxcts=b524a810-81a8-11ec-b1c7-2f3bb0e953f5; _pxvid=b524530a-81a8-11ec-bb78-516742524d6f; _px3=1da26b5e368f3079da8896be506869586c02b5781ef543bbacf7de32bd38700a:GVI+qY/xG/RjSXWobZrYa+S+7RIUEYeuU6f0jbyqG90do1AuDIpg9MxHplnZddEHS5fwrCPCkG4XlHwpypIrcg==:1000:4Kw8A0Ai2P3eKFIlZlSGqzLq85QyDULwW9UYRHCqpGNZ6O9erOjjflqgaJ1CmpkIUQ7YBZ4H6+ZMJrUquXO3Rg0LkrGI9ffGDVBn029CJal/Ed4Rnq8SlQ2ZufgNRnulhDG2PshoBzA6rsfuOtHn5lOmLUAa+66V4dx/7/oSNZHgYC2K8G8F0rPXzfdTAAKXuIIdGv0h/ugS9jRdDeTRgw==; _pxde=91debf3db4ce52f57682bbd51ae3ee60287b66346b9afea0a84315e9916aadad:eyJ0aW1lc3RhbXAiOjE2NDM1MzIyMjkzODAsImZfa2IiOjAsImlwY19pZCI6W119; TB_SFOU-100=1; xpm=1%2B1643532208%2BWwbqv2nRsU2su70JwXaqZk~%2B0; tb-c30=scus-t1; locDataV3=Fe26.2**d78933d8d1735e992c15e31829880b5319f08fad3a9fa707e7e995b88d8a4553*l8MiNfVaU2yLfvmu9gRmuQ*FCthQUvf0zzmBl3XFuD0TQ37AB9eQit3FjmfxXMMDCNDrIbHYeqvMbe8e-vYcVAjZYxR1eoAlyfZfnq_nzKE3eY5zqAruPn5diTCnIlbLaPgedt5e1sN6r5LAbfxrfeRHlQMQf4fvoaMih8EDdTxFSmQIEaArflv7IaNQg0ta7Du3c_f7qkSrswH57gKmQwSxpeP6ea0Vll2tKAPpYdYIDn14Ld7e4PDcAePzyKhes3Uum1b7EQZpABfxM6fDDxyV3k14UB2KYMCCHFE-svPCbwFDaJMVIQiCZeF6sE1ke0OGwdTmyVAEoeK2E6ayxSPeMa3ei_dgGCyivZCQWRPLdjH92zJslh5_o8b_LejDZxSuMGCZt26qfoP-Rm6TD26fjhGQ1BXnfO-kudMdNwrOvPBaYikLj0fqmv4IHOi3Grb7deU60nY-DuhS5RdAfszNN-xzxnUeWqBqM5M58C95AFChk3ofCy7wCXVsW4MjEwb60qJBCji3nitX_bd1Y0bzeLUK_Hs7SotYbR3TO_Y9dk3TvklHz39LehQcJHvaTaBbLP6z4HNERg_Xk86pZqXcRj_Y4dkwkkx6gS1SSwoJKSg_pueLCSiZQnWYOoTzLRZ1QXf9rrEH1_o9VW5PCkDZkzl0DuIpNetiyzq0nPjaB2-T2eA_jF1b_gjMQ9ihujLXjSbmVcFvFOHaoI1VOj_o39ouXkiWD6jYuVvFm58hGK1-uawa69c-yly02GdhqyvFLHyydyvo7YnQV84tKutt5cF3F-5z4NzwGnbxsYCPTXIdSLvU4AYw6F5v7PdBu6Og62e9mzwzTSw3cx3sWClYYt2toohHuiqPtjeIHp3s-XSmCmISIWjzOaImJ9Prodv_ZnUyZoldFhplAdXnpuPzElculIAsmIRU2fjCGr3fSQEXSrMd5jLe8nnpXENXjmNNhVL-Y2CJBizmF68AJbtHY0s0F2oXbk4YgVkipO-sir4HbpJ5QDzVgVoR_0ZPZ2slE0ItIYNJzn9Cmw3eGFJkZT-Y4-tWem_9eChn2Ew9e3dud1PoH4_J1NaKI__f-vF6HevtrXVnc5j6mlInhJW**e952c5dcc46cc3d3698dd6fd1d4b161bbf8c797991a25424d9f8f18713f9c49d*piOZfd8qFyL_Ac8vqF-VDAyiRL7NVQhwbsTlc1chjfA; locGuestData=eyJpbnRlbnQiOiJTSElQUElORyIsInN0b3JlSW50ZW50IjoiUElDS1VQIiwibWVyZ2VGbGFnIjpmYWxzZSwicGlja3VwIjp7Im5vZGVJZCI6IjMwODEiLCJ0aW1lc3RhbXAiOjE2NDM1MzIyMzMyMzZ9LCJwb3N0YWxDb2RlIjp7InRpbWVzdGFtcCI6MTY0MzUzMjIzMzIzNiwiYmFzZSI6Ijk1ODI5In0sInZhbGlkYXRlS2V5IjoicHJvZDp2MjowNGQ4NDIzNS02OTk4LTQ3YmUtYTJmMi05MTA3MWMxMjJhNzcifQ%3D%3D; AID=wmlspartner%253D0%253Areflectorid%253D0000000000000000000000%253Alastupd%253D1643532291277; com.wm.reflector="reflectorid:0000000000000000000000@lastupd:1643532291277@firstcreate:1643532208806"; xptwg=931059659:5059901D814BE0:D1F97E:5F91AC9F:4FF50BAC:F12E0628:; bm_sv=A1989D55605AF57BB1876AA22994EDF8~t3gzpBSuSRX5QGQOWbSAIIw9RFr0NbwNcDvuILTihkyUC3L/u2/HnSMi+2t2Xo2OeApGjiae+svqz+G1buVgOH26z1AFI/LMVs3sVxRLfNyZlw5DERMGXjLHJlKeijXDdvoxkLTOGYbIeRz9I+2ZJ78RbNsiY1ooqPbL8UlH0H8=' \
  --data-raw '{"query":"query shoppingListTotal($input:ListTotalInput){shoppingListTotal(input:$input){products{priceInfo{currentPrice{price}},priceInfo{wasPrice{price}},name,usItemId,availabilityStatus}}}","variables":{"input":{"id":"5235469c-9c94-4bc9-96cc-e0f44ade3b9e","permission":"VIEW"}}}' \
  --compressed`
  if [[ $list1 =~ "blocked" ]]
  then
    link1=`echo $list1 | jq '.redirectUrl' | sed 's/"//g'`
    `open -n -a /Applications/Microsoft\ Edge.app --args --profile-directory=Default https://walmart.com$link1`
    read -n 1 -p "blocked"
  else
    echo $list1 | jq '.data.shoppingListTotal.products[].usItemId' >> ebay-usItemId.txt
    echo $list1 | jq '.data.shoppingListTotal.products[].priceInfo.currentPrice.price' >> ebay-currentPrice.txt
    echo $list1 | jq '.data.shoppingListTotal.products[].priceInfo.wasPrice.price' | sed 's/null//g' >> ebay-wasPrice.txt
    echo $list1 | jq '.data.shoppingListTotal.products[].availabilityStatus' >> ebay-availabilityStatus.txt
    echo "1"
    break
  fi
done

while true
do
list2=`curl -s 'https://www.walmart.com/orchestra/home/graphql' \
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
  -H 'cookie: auth=MTAyOTYyMDE4SAFoijgoW%2BwVbVl1XCR8b1LY15K%2FPFkpB3eqeMWKxB8neaW%2BC1T2bnXu4hcsFbsL3drLRuHXPg%2F%2Fk1f6bSTYAzjhJuhJDynI%2BiazR%2F4BWP8KjDEgutZecVEIw2W%2FoD%2B4767wuZloTfhm7Wk2KcjygobRHThsmZk%2BGcqTfIab85SwxXtAz7E82fz1Znm95f9I31fMVdEFB01AdiHjLYIrVgSU6%2FFSyFHoBLkxTbgXNUoUMk70P8glgOEpLOprhDfMM%2FFHGZ2dCNmxWrdkwqEKrjMMRWvuyffZ1jFJ6FEiGMy5eEZMH6Z6ge%2BPBrf%2BmQ6MFTZUwhWEMIwdnlmj85fW3xwH4pTZFmNzWmz2pR5ixfLpB03mfjBSpaZQK7Euu6DERjQ3r9INNAjLhqBeT2p7%2FljKcklje4R5ioW78kDnDBU%3D; ACID=04d84235-6998-47be-a2f2-91071c122a77; hasACID=true; assortmentStoreId=3081; hasLocData=1; TB_Latency_Tracker_100=1; TB_Navigation_Preload_01=1; vtc=Wwbqv2nRsU2su70JwXaqZk; bstc=Wwbqv2nRsU2su70JwXaqZk; mobileweb=0; xpa=2PRJ6|9qHE4|DAwQd|KzWDJ|PwUCp|fD9ZO|mrxWN|pAAwd|s6z_-|vkFmv|yurXb; exp-ck=DAwQd2PwUCp1fD9ZO1vkFmv1yurXb1; TS01b0be75=01538efd7c6e4f5583d7d9fab7f97ce95db0a921ecad5afe719e9432b5beabf8d846a3ffd55efbabfae6b079855b9acab3f92af4ad; TS013ed49a=01538efd7c6e4f5583d7d9fab7f97ce95db0a921ecad5afe719e9432b5beabf8d846a3ffd55efbabfae6b079855b9acab3f92af4ad; TBV=7; tb_sw_supported=true; ak_bmsc=3C08BCE3E605BDA834111846614D317F~000000000000000000000000000000~YAAQBS83Fwcqtql+AQAAEVsnqg71Qntyg8gPY7pbbJQBYcohSHcwfonQ756IXPgno+Ni0rrSNFhBMPgWw2GLlJp3UJ1y6ZIc2n6Go+aNEYnELk1UotVxy/a06iVlWE3zlfFKyKMBSsJ1NpzvPSQ3O889ppxDP0XScxTXzKllwPwd5TF4EyE0YqKRkUK7vhdPJ/IQULjXOhy/mt3K9Nz2TPX/SQ5NEd7UmSoMIvASBmS+oyCdC4pdU/6tmKTtvgCGpQuVkw4eTjjK1U5VToGhYHb8RpHCfILCQl2DE0BqY0BJA1ZFEm2L+qgBXLevYmNVBKvp+RikFnP3hkCiupmaf18CSj5nf6ZQW+GLJP24KJZq/tNaWm0nypm0Ar9kv5++OhOoMRwBE+SqVYSFj3hszXQWE40b3ubmc3FZ/WowcIsu2j6597qI1xLzzQAslWQ2Y7ibhqk+94UzniGnWfoyXgD+XneJmoJ6OC11I0X7lt7de8iIID1m5LGiiEL3; pxcts=b524a810-81a8-11ec-b1c7-2f3bb0e953f5; _pxvid=b524530a-81a8-11ec-bb78-516742524d6f; _px3=1da26b5e368f3079da8896be506869586c02b5781ef543bbacf7de32bd38700a:GVI+qY/xG/RjSXWobZrYa+S+7RIUEYeuU6f0jbyqG90do1AuDIpg9MxHplnZddEHS5fwrCPCkG4XlHwpypIrcg==:1000:4Kw8A0Ai2P3eKFIlZlSGqzLq85QyDULwW9UYRHCqpGNZ6O9erOjjflqgaJ1CmpkIUQ7YBZ4H6+ZMJrUquXO3Rg0LkrGI9ffGDVBn029CJal/Ed4Rnq8SlQ2ZufgNRnulhDG2PshoBzA6rsfuOtHn5lOmLUAa+66V4dx/7/oSNZHgYC2K8G8F0rPXzfdTAAKXuIIdGv0h/ugS9jRdDeTRgw==; _pxde=91debf3db4ce52f57682bbd51ae3ee60287b66346b9afea0a84315e9916aadad:eyJ0aW1lc3RhbXAiOjE2NDM1MzIyMjkzODAsImZfa2IiOjAsImlwY19pZCI6W119; TB_SFOU-100=1; xpm=1%2B1643532208%2BWwbqv2nRsU2su70JwXaqZk~%2B0; tb-c30=scus-t1; locDataV3=Fe26.2**d78933d8d1735e992c15e31829880b5319f08fad3a9fa707e7e995b88d8a4553*l8MiNfVaU2yLfvmu9gRmuQ*FCthQUvf0zzmBl3XFuD0TQ37AB9eQit3FjmfxXMMDCNDrIbHYeqvMbe8e-vYcVAjZYxR1eoAlyfZfnq_nzKE3eY5zqAruPn5diTCnIlbLaPgedt5e1sN6r5LAbfxrfeRHlQMQf4fvoaMih8EDdTxFSmQIEaArflv7IaNQg0ta7Du3c_f7qkSrswH57gKmQwSxpeP6ea0Vll2tKAPpYdYIDn14Ld7e4PDcAePzyKhes3Uum1b7EQZpABfxM6fDDxyV3k14UB2KYMCCHFE-svPCbwFDaJMVIQiCZeF6sE1ke0OGwdTmyVAEoeK2E6ayxSPeMa3ei_dgGCyivZCQWRPLdjH92zJslh5_o8b_LejDZxSuMGCZt26qfoP-Rm6TD26fjhGQ1BXnfO-kudMdNwrOvPBaYikLj0fqmv4IHOi3Grb7deU60nY-DuhS5RdAfszNN-xzxnUeWqBqM5M58C95AFChk3ofCy7wCXVsW4MjEwb60qJBCji3nitX_bd1Y0bzeLUK_Hs7SotYbR3TO_Y9dk3TvklHz39LehQcJHvaTaBbLP6z4HNERg_Xk86pZqXcRj_Y4dkwkkx6gS1SSwoJKSg_pueLCSiZQnWYOoTzLRZ1QXf9rrEH1_o9VW5PCkDZkzl0DuIpNetiyzq0nPjaB2-T2eA_jF1b_gjMQ9ihujLXjSbmVcFvFOHaoI1VOj_o39ouXkiWD6jYuVvFm58hGK1-uawa69c-yly02GdhqyvFLHyydyvo7YnQV84tKutt5cF3F-5z4NzwGnbxsYCPTXIdSLvU4AYw6F5v7PdBu6Og62e9mzwzTSw3cx3sWClYYt2toohHuiqPtjeIHp3s-XSmCmISIWjzOaImJ9Prodv_ZnUyZoldFhplAdXnpuPzElculIAsmIRU2fjCGr3fSQEXSrMd5jLe8nnpXENXjmNNhVL-Y2CJBizmF68AJbtHY0s0F2oXbk4YgVkipO-sir4HbpJ5QDzVgVoR_0ZPZ2slE0ItIYNJzn9Cmw3eGFJkZT-Y4-tWem_9eChn2Ew9e3dud1PoH4_J1NaKI__f-vF6HevtrXVnc5j6mlInhJW**e952c5dcc46cc3d3698dd6fd1d4b161bbf8c797991a25424d9f8f18713f9c49d*piOZfd8qFyL_Ac8vqF-VDAyiRL7NVQhwbsTlc1chjfA; locGuestData=eyJpbnRlbnQiOiJTSElQUElORyIsInN0b3JlSW50ZW50IjoiUElDS1VQIiwibWVyZ2VGbGFnIjpmYWxzZSwicGlja3VwIjp7Im5vZGVJZCI6IjMwODEiLCJ0aW1lc3RhbXAiOjE2NDM1MzIyMzMyMzZ9LCJwb3N0YWxDb2RlIjp7InRpbWVzdGFtcCI6MTY0MzUzMjIzMzIzNiwiYmFzZSI6Ijk1ODI5In0sInZhbGlkYXRlS2V5IjoicHJvZDp2MjowNGQ4NDIzNS02OTk4LTQ3YmUtYTJmMi05MTA3MWMxMjJhNzcifQ%3D%3D; AID=wmlspartner%253D0%253Areflectorid%253D0000000000000000000000%253Alastupd%253D1643532291277; com.wm.reflector="reflectorid:0000000000000000000000@lastupd:1643532291277@firstcreate:1643532208806"; xptwg=931059659:5059901D814BE0:D1F97E:5F91AC9F:4FF50BAC:F12E0628:; bm_sv=A1989D55605AF57BB1876AA22994EDF8~t3gzpBSuSRX5QGQOWbSAIIw9RFr0NbwNcDvuILTihkyUC3L/u2/HnSMi+2t2Xo2OeApGjiae+svqz+G1buVgOH26z1AFI/LMVs3sVxRLfNyZlw5DERMGXjLHJlKeijXDdvoxkLTOGYbIeRz9I+2ZJ78RbNsiY1ooqPbL8UlH0H8=' \
  --data-raw '{"query":"query shoppingListTotal($input:ListTotalInput){shoppingListTotal(input:$input){products{priceInfo{currentPrice{price}},priceInfo{wasPrice{price}},name,usItemId,availabilityStatus}}}","variables":{"input":{"id":"35f6f25d-5c2a-49bb-a9f2-0c78204a2099","permission":"VIEW"}}}' \
  --compressed`
  if [[ $list2 =~ "blocked" ]]
  then
    link2=`echo $list2 | jq '.redirectUrl' | sed 's/"//g'`
    `open -n -a /Applications/Microsoft\ Edge.app --args --profile-directory=Default https://walmart.com$link2`
  else
    echo $list2 | jq '.data.shoppingListTotal.products[].usItemId' >> ebay-usItemId.txt
    echo $list2 | jq '.data.shoppingListTotal.products[].priceInfo.currentPrice.price' >> ebay-currentPrice.txt
    echo $list2 | jq '.data.shoppingListTotal.products[].priceInfo.wasPrice.price' | sed 's/null//g' >> ebay-wasPrice.txt
    echo $list2 | jq '.data.shoppingListTotal.products[].availabilityStatus' >> ebay-availabilityStatus.txt
    echo "2"
    break
  fi
done

while true
do
list3=`curl -s 'https://www.walmart.com/orchestra/home/graphql' \
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
  -H 'cookie: auth=MTAyOTYyMDE4SAFoijgoW%2BwVbVl1XCR8b1LY15K%2FPFkpB3eqeMWKxB8neaW%2BC1T2bnXu4hcsFbsL3drLRuHXPg%2F%2Fk1f6bSTYAzjhJuhJDynI%2BiazR%2F4BWP8KjDEgutZecVEIw2W%2FoD%2B4767wuZloTfhm7Wk2KcjygobRHThsmZk%2BGcqTfIab85SwxXtAz7E82fz1Znm95f9I31fMVdEFB01AdiHjLYIrVgSU6%2FFSyFHoBLkxTbgXNUoUMk70P8glgOEpLOprhDfMM%2FFHGZ2dCNmxWrdkwqEKrjMMRWvuyffZ1jFJ6FEiGMy5eEZMH6Z6ge%2BPBrf%2BmQ6MFTZUwhWEMIwdnlmj85fW3xwH4pTZFmNzWmz2pR5ixfLpB03mfjBSpaZQK7Euu6DERjQ3r9INNAjLhqBeT2p7%2FljKcklje4R5ioW78kDnDBU%3D; ACID=04d84235-6998-47be-a2f2-91071c122a77; hasACID=true; assortmentStoreId=3081; hasLocData=1; TB_Latency_Tracker_100=1; TB_Navigation_Preload_01=1; vtc=Wwbqv2nRsU2su70JwXaqZk; bstc=Wwbqv2nRsU2su70JwXaqZk; mobileweb=0; xpa=2PRJ6|9qHE4|DAwQd|KzWDJ|PwUCp|fD9ZO|mrxWN|pAAwd|s6z_-|vkFmv|yurXb; exp-ck=DAwQd2PwUCp1fD9ZO1vkFmv1yurXb1; TS01b0be75=01538efd7c6e4f5583d7d9fab7f97ce95db0a921ecad5afe719e9432b5beabf8d846a3ffd55efbabfae6b079855b9acab3f92af4ad; TS013ed49a=01538efd7c6e4f5583d7d9fab7f97ce95db0a921ecad5afe719e9432b5beabf8d846a3ffd55efbabfae6b079855b9acab3f92af4ad; TBV=7; tb_sw_supported=true; ak_bmsc=3C08BCE3E605BDA834111846614D317F~000000000000000000000000000000~YAAQBS83Fwcqtql+AQAAEVsnqg71Qntyg8gPY7pbbJQBYcohSHcwfonQ756IXPgno+Ni0rrSNFhBMPgWw2GLlJp3UJ1y6ZIc2n6Go+aNEYnELk1UotVxy/a06iVlWE3zlfFKyKMBSsJ1NpzvPSQ3O889ppxDP0XScxTXzKllwPwd5TF4EyE0YqKRkUK7vhdPJ/IQULjXOhy/mt3K9Nz2TPX/SQ5NEd7UmSoMIvASBmS+oyCdC4pdU/6tmKTtvgCGpQuVkw4eTjjK1U5VToGhYHb8RpHCfILCQl2DE0BqY0BJA1ZFEm2L+qgBXLevYmNVBKvp+RikFnP3hkCiupmaf18CSj5nf6ZQW+GLJP24KJZq/tNaWm0nypm0Ar9kv5++OhOoMRwBE+SqVYSFj3hszXQWE40b3ubmc3FZ/WowcIsu2j6597qI1xLzzQAslWQ2Y7ibhqk+94UzniGnWfoyXgD+XneJmoJ6OC11I0X7lt7de8iIID1m5LGiiEL3; pxcts=b524a810-81a8-11ec-b1c7-2f3bb0e953f5; _pxvid=b524530a-81a8-11ec-bb78-516742524d6f; _px3=1da26b5e368f3079da8896be506869586c02b5781ef543bbacf7de32bd38700a:GVI+qY/xG/RjSXWobZrYa+S+7RIUEYeuU6f0jbyqG90do1AuDIpg9MxHplnZddEHS5fwrCPCkG4XlHwpypIrcg==:1000:4Kw8A0Ai2P3eKFIlZlSGqzLq85QyDULwW9UYRHCqpGNZ6O9erOjjflqgaJ1CmpkIUQ7YBZ4H6+ZMJrUquXO3Rg0LkrGI9ffGDVBn029CJal/Ed4Rnq8SlQ2ZufgNRnulhDG2PshoBzA6rsfuOtHn5lOmLUAa+66V4dx/7/oSNZHgYC2K8G8F0rPXzfdTAAKXuIIdGv0h/ugS9jRdDeTRgw==; _pxde=91debf3db4ce52f57682bbd51ae3ee60287b66346b9afea0a84315e9916aadad:eyJ0aW1lc3RhbXAiOjE2NDM1MzIyMjkzODAsImZfa2IiOjAsImlwY19pZCI6W119; TB_SFOU-100=1; xpm=1%2B1643532208%2BWwbqv2nRsU2su70JwXaqZk~%2B0; tb-c30=scus-t1; locDataV3=Fe26.2**d78933d8d1735e992c15e31829880b5319f08fad3a9fa707e7e995b88d8a4553*l8MiNfVaU2yLfvmu9gRmuQ*FCthQUvf0zzmBl3XFuD0TQ37AB9eQit3FjmfxXMMDCNDrIbHYeqvMbe8e-vYcVAjZYxR1eoAlyfZfnq_nzKE3eY5zqAruPn5diTCnIlbLaPgedt5e1sN6r5LAbfxrfeRHlQMQf4fvoaMih8EDdTxFSmQIEaArflv7IaNQg0ta7Du3c_f7qkSrswH57gKmQwSxpeP6ea0Vll2tKAPpYdYIDn14Ld7e4PDcAePzyKhes3Uum1b7EQZpABfxM6fDDxyV3k14UB2KYMCCHFE-svPCbwFDaJMVIQiCZeF6sE1ke0OGwdTmyVAEoeK2E6ayxSPeMa3ei_dgGCyivZCQWRPLdjH92zJslh5_o8b_LejDZxSuMGCZt26qfoP-Rm6TD26fjhGQ1BXnfO-kudMdNwrOvPBaYikLj0fqmv4IHOi3Grb7deU60nY-DuhS5RdAfszNN-xzxnUeWqBqM5M58C95AFChk3ofCy7wCXVsW4MjEwb60qJBCji3nitX_bd1Y0bzeLUK_Hs7SotYbR3TO_Y9dk3TvklHz39LehQcJHvaTaBbLP6z4HNERg_Xk86pZqXcRj_Y4dkwkkx6gS1SSwoJKSg_pueLCSiZQnWYOoTzLRZ1QXf9rrEH1_o9VW5PCkDZkzl0DuIpNetiyzq0nPjaB2-T2eA_jF1b_gjMQ9ihujLXjSbmVcFvFOHaoI1VOj_o39ouXkiWD6jYuVvFm58hGK1-uawa69c-yly02GdhqyvFLHyydyvo7YnQV84tKutt5cF3F-5z4NzwGnbxsYCPTXIdSLvU4AYw6F5v7PdBu6Og62e9mzwzTSw3cx3sWClYYt2toohHuiqPtjeIHp3s-XSmCmISIWjzOaImJ9Prodv_ZnUyZoldFhplAdXnpuPzElculIAsmIRU2fjCGr3fSQEXSrMd5jLe8nnpXENXjmNNhVL-Y2CJBizmF68AJbtHY0s0F2oXbk4YgVkipO-sir4HbpJ5QDzVgVoR_0ZPZ2slE0ItIYNJzn9Cmw3eGFJkZT-Y4-tWem_9eChn2Ew9e3dud1PoH4_J1NaKI__f-vF6HevtrXVnc5j6mlInhJW**e952c5dcc46cc3d3698dd6fd1d4b161bbf8c797991a25424d9f8f18713f9c49d*piOZfd8qFyL_Ac8vqF-VDAyiRL7NVQhwbsTlc1chjfA; locGuestData=eyJpbnRlbnQiOiJTSElQUElORyIsInN0b3JlSW50ZW50IjoiUElDS1VQIiwibWVyZ2VGbGFnIjpmYWxzZSwicGlja3VwIjp7Im5vZGVJZCI6IjMwODEiLCJ0aW1lc3RhbXAiOjE2NDM1MzIyMzMyMzZ9LCJwb3N0YWxDb2RlIjp7InRpbWVzdGFtcCI6MTY0MzUzMjIzMzIzNiwiYmFzZSI6Ijk1ODI5In0sInZhbGlkYXRlS2V5IjoicHJvZDp2MjowNGQ4NDIzNS02OTk4LTQ3YmUtYTJmMi05MTA3MWMxMjJhNzcifQ%3D%3D; AID=wmlspartner%253D0%253Areflectorid%253D0000000000000000000000%253Alastupd%253D1643532291277; com.wm.reflector="reflectorid:0000000000000000000000@lastupd:1643532291277@firstcreate:1643532208806"; xptwg=931059659:5059901D814BE0:D1F97E:5F91AC9F:4FF50BAC:F12E0628:; bm_sv=A1989D55605AF57BB1876AA22994EDF8~t3gzpBSuSRX5QGQOWbSAIIw9RFr0NbwNcDvuILTihkyUC3L/u2/HnSMi+2t2Xo2OeApGjiae+svqz+G1buVgOH26z1AFI/LMVs3sVxRLfNyZlw5DERMGXjLHJlKeijXDdvoxkLTOGYbIeRz9I+2ZJ78RbNsiY1ooqPbL8UlH0H8=' \
  --data-raw '{"query":"query shoppingListTotal($input:ListTotalInput){shoppingListTotal(input:$input){products{priceInfo{currentPrice{price}},priceInfo{wasPrice{price}},name,usItemId,availabilityStatus}}}","variables":{"input":{"id":"caf523c1-f70a-4d38-aa12-029147e94b16","permission":"VIEW"}}}' \
  --compressed`
  if [[ $list3 =~ "blocked" ]]
  then
    link3=`echo $list3 | jq '.redirectUrl' | sed 's/"//g'`
    `open -n -a /Applications/Microsoft\ Edge.app --args --profile-directory=Default https://walmart.com$link3`
  else
    echo $list3 | jq '.data.shoppingListTotal.products[].usItemId' >> ebay-usItemId.txt
    echo $list3 | jq '.data.shoppingListTotal.products[].priceInfo.currentPrice.price' >> ebay-currentPrice.txt
    echo $list3 | jq '.data.shoppingListTotal.products[].priceInfo.wasPrice.price' | sed 's/null//g' >> ebay-wasPrice.txt
    echo $list3 | jq '.data.shoppingListTotal.products[].availabilityStatus' >> ebay-availabilityStatus.txt
    echo "3"
    break
  fi
done

while true
do
list4=`curl -s 'https://www.walmart.com/orchestra/home/graphql' \
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
  -H 'cookie: auth=MTAyOTYyMDE4SAFoijgoW%2BwVbVl1XCR8b1LY15K%2FPFkpB3eqeMWKxB8neaW%2BC1T2bnXu4hcsFbsL3drLRuHXPg%2F%2Fk1f6bSTYAzjhJuhJDynI%2BiazR%2F4BWP8KjDEgutZecVEIw2W%2FoD%2B4767wuZloTfhm7Wk2KcjygobRHThsmZk%2BGcqTfIab85SwxXtAz7E82fz1Znm95f9I31fMVdEFB01AdiHjLYIrVgSU6%2FFSyFHoBLkxTbgXNUoUMk70P8glgOEpLOprhDfMM%2FFHGZ2dCNmxWrdkwqEKrjMMRWvuyffZ1jFJ6FEiGMy5eEZMH6Z6ge%2BPBrf%2BmQ6MFTZUwhWEMIwdnlmj85fW3xwH4pTZFmNzWmz2pR5ixfLpB03mfjBSpaZQK7Euu6DERjQ3r9INNAjLhqBeT2p7%2FljKcklje4R5ioW78kDnDBU%3D; ACID=04d84235-6998-47be-a2f2-91071c122a77; hasACID=true; assortmentStoreId=3081; hasLocData=1; TB_Latency_Tracker_100=1; TB_Navigation_Preload_01=1; vtc=Wwbqv2nRsU2su70JwXaqZk; bstc=Wwbqv2nRsU2su70JwXaqZk; mobileweb=0; xpa=2PRJ6|9qHE4|DAwQd|KzWDJ|PwUCp|fD9ZO|mrxWN|pAAwd|s6z_-|vkFmv|yurXb; exp-ck=DAwQd2PwUCp1fD9ZO1vkFmv1yurXb1; TS01b0be75=01538efd7c6e4f5583d7d9fab7f97ce95db0a921ecad5afe719e9432b5beabf8d846a3ffd55efbabfae6b079855b9acab3f92af4ad; TS013ed49a=01538efd7c6e4f5583d7d9fab7f97ce95db0a921ecad5afe719e9432b5beabf8d846a3ffd55efbabfae6b079855b9acab3f92af4ad; TBV=7; tb_sw_supported=true; ak_bmsc=3C08BCE3E605BDA834111846614D317F~000000000000000000000000000000~YAAQBS83Fwcqtql+AQAAEVsnqg71Qntyg8gPY7pbbJQBYcohSHcwfonQ756IXPgno+Ni0rrSNFhBMPgWw2GLlJp3UJ1y6ZIc2n6Go+aNEYnELk1UotVxy/a06iVlWE3zlfFKyKMBSsJ1NpzvPSQ3O889ppxDP0XScxTXzKllwPwd5TF4EyE0YqKRkUK7vhdPJ/IQULjXOhy/mt3K9Nz2TPX/SQ5NEd7UmSoMIvASBmS+oyCdC4pdU/6tmKTtvgCGpQuVkw4eTjjK1U5VToGhYHb8RpHCfILCQl2DE0BqY0BJA1ZFEm2L+qgBXLevYmNVBKvp+RikFnP3hkCiupmaf18CSj5nf6ZQW+GLJP24KJZq/tNaWm0nypm0Ar9kv5++OhOoMRwBE+SqVYSFj3hszXQWE40b3ubmc3FZ/WowcIsu2j6597qI1xLzzQAslWQ2Y7ibhqk+94UzniGnWfoyXgD+XneJmoJ6OC11I0X7lt7de8iIID1m5LGiiEL3; pxcts=b524a810-81a8-11ec-b1c7-2f3bb0e953f5; _pxvid=b524530a-81a8-11ec-bb78-516742524d6f; _px3=1da26b5e368f3079da8896be506869586c02b5781ef543bbacf7de32bd38700a:GVI+qY/xG/RjSXWobZrYa+S+7RIUEYeuU6f0jbyqG90do1AuDIpg9MxHplnZddEHS5fwrCPCkG4XlHwpypIrcg==:1000:4Kw8A0Ai2P3eKFIlZlSGqzLq85QyDULwW9UYRHCqpGNZ6O9erOjjflqgaJ1CmpkIUQ7YBZ4H6+ZMJrUquXO3Rg0LkrGI9ffGDVBn029CJal/Ed4Rnq8SlQ2ZufgNRnulhDG2PshoBzA6rsfuOtHn5lOmLUAa+66V4dx/7/oSNZHgYC2K8G8F0rPXzfdTAAKXuIIdGv0h/ugS9jRdDeTRgw==; _pxde=91debf3db4ce52f57682bbd51ae3ee60287b66346b9afea0a84315e9916aadad:eyJ0aW1lc3RhbXAiOjE2NDM1MzIyMjkzODAsImZfa2IiOjAsImlwY19pZCI6W119; TB_SFOU-100=1; xpm=1%2B1643532208%2BWwbqv2nRsU2su70JwXaqZk~%2B0; tb-c30=scus-t1; locDataV3=Fe26.2**d78933d8d1735e992c15e31829880b5319f08fad3a9fa707e7e995b88d8a4553*l8MiNfVaU2yLfvmu9gRmuQ*FCthQUvf0zzmBl3XFuD0TQ37AB9eQit3FjmfxXMMDCNDrIbHYeqvMbe8e-vYcVAjZYxR1eoAlyfZfnq_nzKE3eY5zqAruPn5diTCnIlbLaPgedt5e1sN6r5LAbfxrfeRHlQMQf4fvoaMih8EDdTxFSmQIEaArflv7IaNQg0ta7Du3c_f7qkSrswH57gKmQwSxpeP6ea0Vll2tKAPpYdYIDn14Ld7e4PDcAePzyKhes3Uum1b7EQZpABfxM6fDDxyV3k14UB2KYMCCHFE-svPCbwFDaJMVIQiCZeF6sE1ke0OGwdTmyVAEoeK2E6ayxSPeMa3ei_dgGCyivZCQWRPLdjH92zJslh5_o8b_LejDZxSuMGCZt26qfoP-Rm6TD26fjhGQ1BXnfO-kudMdNwrOvPBaYikLj0fqmv4IHOi3Grb7deU60nY-DuhS5RdAfszNN-xzxnUeWqBqM5M58C95AFChk3ofCy7wCXVsW4MjEwb60qJBCji3nitX_bd1Y0bzeLUK_Hs7SotYbR3TO_Y9dk3TvklHz39LehQcJHvaTaBbLP6z4HNERg_Xk86pZqXcRj_Y4dkwkkx6gS1SSwoJKSg_pueLCSiZQnWYOoTzLRZ1QXf9rrEH1_o9VW5PCkDZkzl0DuIpNetiyzq0nPjaB2-T2eA_jF1b_gjMQ9ihujLXjSbmVcFvFOHaoI1VOj_o39ouXkiWD6jYuVvFm58hGK1-uawa69c-yly02GdhqyvFLHyydyvo7YnQV84tKutt5cF3F-5z4NzwGnbxsYCPTXIdSLvU4AYw6F5v7PdBu6Og62e9mzwzTSw3cx3sWClYYt2toohHuiqPtjeIHp3s-XSmCmISIWjzOaImJ9Prodv_ZnUyZoldFhplAdXnpuPzElculIAsmIRU2fjCGr3fSQEXSrMd5jLe8nnpXENXjmNNhVL-Y2CJBizmF68AJbtHY0s0F2oXbk4YgVkipO-sir4HbpJ5QDzVgVoR_0ZPZ2slE0ItIYNJzn9Cmw3eGFJkZT-Y4-tWem_9eChn2Ew9e3dud1PoH4_J1NaKI__f-vF6HevtrXVnc5j6mlInhJW**e952c5dcc46cc3d3698dd6fd1d4b161bbf8c797991a25424d9f8f18713f9c49d*piOZfd8qFyL_Ac8vqF-VDAyiRL7NVQhwbsTlc1chjfA; locGuestData=eyJpbnRlbnQiOiJTSElQUElORyIsInN0b3JlSW50ZW50IjoiUElDS1VQIiwibWVyZ2VGbGFnIjpmYWxzZSwicGlja3VwIjp7Im5vZGVJZCI6IjMwODEiLCJ0aW1lc3RhbXAiOjE2NDM1MzIyMzMyMzZ9LCJwb3N0YWxDb2RlIjp7InRpbWVzdGFtcCI6MTY0MzUzMjIzMzIzNiwiYmFzZSI6Ijk1ODI5In0sInZhbGlkYXRlS2V5IjoicHJvZDp2MjowNGQ4NDIzNS02OTk4LTQ3YmUtYTJmMi05MTA3MWMxMjJhNzcifQ%3D%3D; AID=wmlspartner%253D0%253Areflectorid%253D0000000000000000000000%253Alastupd%253D1643532291277; com.wm.reflector="reflectorid:0000000000000000000000@lastupd:1643532291277@firstcreate:1643532208806"; xptwg=931059659:5059901D814BE0:D1F97E:5F91AC9F:4FF50BAC:F12E0628:; bm_sv=A1989D55605AF57BB1876AA22994EDF8~t3gzpBSuSRX5QGQOWbSAIIw9RFr0NbwNcDvuILTihkyUC3L/u2/HnSMi+2t2Xo2OeApGjiae+svqz+G1buVgOH26z1AFI/LMVs3sVxRLfNyZlw5DERMGXjLHJlKeijXDdvoxkLTOGYbIeRz9I+2ZJ78RbNsiY1ooqPbL8UlH0H8=' \
  --data-raw '{"query":"query shoppingListTotal($input:ListTotalInput){shoppingListTotal(input:$input){products{priceInfo{currentPrice{price}},priceInfo{wasPrice{price}},name,usItemId,availabilityStatus}}}","variables":{"input":{"id":"b1460f26-9507-4962-9b88-f31feebb06f4","permission":"VIEW"}}}' \
  --compressed`
  if [[ $list4 =~ "blocked" ]]
  then
    link4=`echo $list4 | jq '.redirectUrl' | sed 's/"//g'`
    `open -n -a /Applications/Microsoft\ Edge.app --args --profile-directory=Default https://walmart.com$link4`
  else
      echo $list4 | jq '.data.shoppingListTotal.products[].usItemId' >> ebay-usItemId.txt
      echo $list4 | jq '.data.shoppingListTotal.products[].priceInfo.currentPrice.price' >> ebay-currentPrice.txt
      echo $list4 | jq '.data.shoppingListTotal.products[].priceInfo.wasPrice.price' | sed 's/null//g' >> ebay-wasPrice.txt
      echo $list4 | jq '.data.shoppingListTotal.products[].availabilityStatus' >> ebay-availabilityStatus.txt
      echo "4"
      break
  fi
done

while true
do
list5=`curl -s 'https://www.walmart.com/orchestra/home/graphql' \
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
  -H 'cookie: auth=MTAyOTYyMDE4SAFoijgoW%2BwVbVl1XCR8b1LY15K%2FPFkpB3eqeMWKxB8neaW%2BC1T2bnXu4hcsFbsL3drLRuHXPg%2F%2Fk1f6bSTYAzjhJuhJDynI%2BiazR%2F4BWP8KjDEgutZecVEIw2W%2FoD%2B4767wuZloTfhm7Wk2KcjygobRHThsmZk%2BGcqTfIab85SwxXtAz7E82fz1Znm95f9I31fMVdEFB01AdiHjLYIrVgSU6%2FFSyFHoBLkxTbgXNUoUMk70P8glgOEpLOprhDfMM%2FFHGZ2dCNmxWrdkwqEKrjMMRWvuyffZ1jFJ6FEiGMy5eEZMH6Z6ge%2BPBrf%2BmQ6MFTZUwhWEMIwdnlmj85fW3xwH4pTZFmNzWmz2pR5ixfLpB03mfjBSpaZQK7Euu6DERjQ3r9INNAjLhqBeT2p7%2FljKcklje4R5ioW78kDnDBU%3D; ACID=04d84235-6998-47be-a2f2-91071c122a77; hasACID=true; assortmentStoreId=3081; hasLocData=1; TB_Latency_Tracker_100=1; TB_Navigation_Preload_01=1; vtc=Wwbqv2nRsU2su70JwXaqZk; bstc=Wwbqv2nRsU2su70JwXaqZk; mobileweb=0; xpa=2PRJ6|9qHE4|DAwQd|KzWDJ|PwUCp|fD9ZO|mrxWN|pAAwd|s6z_-|vkFmv|yurXb; exp-ck=DAwQd2PwUCp1fD9ZO1vkFmv1yurXb1; TS01b0be75=01538efd7c6e4f5583d7d9fab7f97ce95db0a921ecad5afe719e9432b5beabf8d846a3ffd55efbabfae6b079855b9acab3f92af4ad; TS013ed49a=01538efd7c6e4f5583d7d9fab7f97ce95db0a921ecad5afe719e9432b5beabf8d846a3ffd55efbabfae6b079855b9acab3f92af4ad; TBV=7; tb_sw_supported=true; ak_bmsc=3C08BCE3E605BDA834111846614D317F~000000000000000000000000000000~YAAQBS83Fwcqtql+AQAAEVsnqg71Qntyg8gPY7pbbJQBYcohSHcwfonQ756IXPgno+Ni0rrSNFhBMPgWw2GLlJp3UJ1y6ZIc2n6Go+aNEYnELk1UotVxy/a06iVlWE3zlfFKyKMBSsJ1NpzvPSQ3O889ppxDP0XScxTXzKllwPwd5TF4EyE0YqKRkUK7vhdPJ/IQULjXOhy/mt3K9Nz2TPX/SQ5NEd7UmSoMIvASBmS+oyCdC4pdU/6tmKTtvgCGpQuVkw4eTjjK1U5VToGhYHb8RpHCfILCQl2DE0BqY0BJA1ZFEm2L+qgBXLevYmNVBKvp+RikFnP3hkCiupmaf18CSj5nf6ZQW+GLJP24KJZq/tNaWm0nypm0Ar9kv5++OhOoMRwBE+SqVYSFj3hszXQWE40b3ubmc3FZ/WowcIsu2j6597qI1xLzzQAslWQ2Y7ibhqk+94UzniGnWfoyXgD+XneJmoJ6OC11I0X7lt7de8iIID1m5LGiiEL3; pxcts=b524a810-81a8-11ec-b1c7-2f3bb0e953f5; _pxvid=b524530a-81a8-11ec-bb78-516742524d6f; _px3=1da26b5e368f3079da8896be506869586c02b5781ef543bbacf7de32bd38700a:GVI+qY/xG/RjSXWobZrYa+S+7RIUEYeuU6f0jbyqG90do1AuDIpg9MxHplnZddEHS5fwrCPCkG4XlHwpypIrcg==:1000:4Kw8A0Ai2P3eKFIlZlSGqzLq85QyDULwW9UYRHCqpGNZ6O9erOjjflqgaJ1CmpkIUQ7YBZ4H6+ZMJrUquXO3Rg0LkrGI9ffGDVBn029CJal/Ed4Rnq8SlQ2ZufgNRnulhDG2PshoBzA6rsfuOtHn5lOmLUAa+66V4dx/7/oSNZHgYC2K8G8F0rPXzfdTAAKXuIIdGv0h/ugS9jRdDeTRgw==; _pxde=91debf3db4ce52f57682bbd51ae3ee60287b66346b9afea0a84315e9916aadad:eyJ0aW1lc3RhbXAiOjE2NDM1MzIyMjkzODAsImZfa2IiOjAsImlwY19pZCI6W119; TB_SFOU-100=1; xpm=1%2B1643532208%2BWwbqv2nRsU2su70JwXaqZk~%2B0; tb-c30=scus-t1; locDataV3=Fe26.2**d78933d8d1735e992c15e31829880b5319f08fad3a9fa707e7e995b88d8a4553*l8MiNfVaU2yLfvmu9gRmuQ*FCthQUvf0zzmBl3XFuD0TQ37AB9eQit3FjmfxXMMDCNDrIbHYeqvMbe8e-vYcVAjZYxR1eoAlyfZfnq_nzKE3eY5zqAruPn5diTCnIlbLaPgedt5e1sN6r5LAbfxrfeRHlQMQf4fvoaMih8EDdTxFSmQIEaArflv7IaNQg0ta7Du3c_f7qkSrswH57gKmQwSxpeP6ea0Vll2tKAPpYdYIDn14Ld7e4PDcAePzyKhes3Uum1b7EQZpABfxM6fDDxyV3k14UB2KYMCCHFE-svPCbwFDaJMVIQiCZeF6sE1ke0OGwdTmyVAEoeK2E6ayxSPeMa3ei_dgGCyivZCQWRPLdjH92zJslh5_o8b_LejDZxSuMGCZt26qfoP-Rm6TD26fjhGQ1BXnfO-kudMdNwrOvPBaYikLj0fqmv4IHOi3Grb7deU60nY-DuhS5RdAfszNN-xzxnUeWqBqM5M58C95AFChk3ofCy7wCXVsW4MjEwb60qJBCji3nitX_bd1Y0bzeLUK_Hs7SotYbR3TO_Y9dk3TvklHz39LehQcJHvaTaBbLP6z4HNERg_Xk86pZqXcRj_Y4dkwkkx6gS1SSwoJKSg_pueLCSiZQnWYOoTzLRZ1QXf9rrEH1_o9VW5PCkDZkzl0DuIpNetiyzq0nPjaB2-T2eA_jF1b_gjMQ9ihujLXjSbmVcFvFOHaoI1VOj_o39ouXkiWD6jYuVvFm58hGK1-uawa69c-yly02GdhqyvFLHyydyvo7YnQV84tKutt5cF3F-5z4NzwGnbxsYCPTXIdSLvU4AYw6F5v7PdBu6Og62e9mzwzTSw3cx3sWClYYt2toohHuiqPtjeIHp3s-XSmCmISIWjzOaImJ9Prodv_ZnUyZoldFhplAdXnpuPzElculIAsmIRU2fjCGr3fSQEXSrMd5jLe8nnpXENXjmNNhVL-Y2CJBizmF68AJbtHY0s0F2oXbk4YgVkipO-sir4HbpJ5QDzVgVoR_0ZPZ2slE0ItIYNJzn9Cmw3eGFJkZT-Y4-tWem_9eChn2Ew9e3dud1PoH4_J1NaKI__f-vF6HevtrXVnc5j6mlInhJW**e952c5dcc46cc3d3698dd6fd1d4b161bbf8c797991a25424d9f8f18713f9c49d*piOZfd8qFyL_Ac8vqF-VDAyiRL7NVQhwbsTlc1chjfA; locGuestData=eyJpbnRlbnQiOiJTSElQUElORyIsInN0b3JlSW50ZW50IjoiUElDS1VQIiwibWVyZ2VGbGFnIjpmYWxzZSwicGlja3VwIjp7Im5vZGVJZCI6IjMwODEiLCJ0aW1lc3RhbXAiOjE2NDM1MzIyMzMyMzZ9LCJwb3N0YWxDb2RlIjp7InRpbWVzdGFtcCI6MTY0MzUzMjIzMzIzNiwiYmFzZSI6Ijk1ODI5In0sInZhbGlkYXRlS2V5IjoicHJvZDp2MjowNGQ4NDIzNS02OTk4LTQ3YmUtYTJmMi05MTA3MWMxMjJhNzcifQ%3D%3D; AID=wmlspartner%253D0%253Areflectorid%253D0000000000000000000000%253Alastupd%253D1643532291277; com.wm.reflector="reflectorid:0000000000000000000000@lastupd:1643532291277@firstcreate:1643532208806"; xptwg=931059659:5059901D814BE0:D1F97E:5F91AC9F:4FF50BAC:F12E0628:; bm_sv=A1989D55605AF57BB1876AA22994EDF8~t3gzpBSuSRX5QGQOWbSAIIw9RFr0NbwNcDvuILTihkyUC3L/u2/HnSMi+2t2Xo2OeApGjiae+svqz+G1buVgOH26z1AFI/LMVs3sVxRLfNyZlw5DERMGXjLHJlKeijXDdvoxkLTOGYbIeRz9I+2ZJ78RbNsiY1ooqPbL8UlH0H8=' \
  --data-raw '{"query":"query shoppingListTotal($input:ListTotalInput){shoppingListTotal(input:$input){products{priceInfo{currentPrice{price}},priceInfo{wasPrice{price}},name,usItemId,availabilityStatus}}}","variables":{"input":{"id":"227986fe-7a93-4510-8a4b-4860174aaa41","permission":"VIEW"}}}' \
  --compressed`
  if [[ $list5 =~ "blocked" ]]
  then
    link5=`echo $list5 | jq '.redirectUrl' | sed 's/"//g'`
    `open -n -a /Applications/Microsoft\ Edge.app --args --profile-directory=Default https://walmart.com$link5`
  else
    echo $list5 | jq '.data.shoppingListTotal.products[].usItemId' >> ebay-usItemId.txt
    echo $list5 | jq '.data.shoppingListTotal.products[].priceInfo.currentPrice.price' >> ebay-currentPrice.txt
    echo $list5 | jq '.data.shoppingListTotal.products[].priceInfo.wasPrice.price' | sed 's/null//g' >> ebay-wasPrice.txt
    echo $list5 | jq '.data.shoppingListTotal.products[].availabilityStatus' >> ebay-availabilityStatus.txt
    echo "5"
    break
  fi
done

while true
do
list6=`curl -s 'https://www.walmart.com/orchestra/home/graphql' \
  -H 'authority: www.walmart.com' \
  -H 'sec-ch-ua: " Not;A Brand";v="99", "Microsoft Edge";v="97", "Chromium";v="97"' \
  -H 'x-o-platform: rweb' \
  -H 'dnt: 1' \
  -H 'x-o-correlation-id: Hx_h9wbjcWjAD1PKYw2YSay-qISABKd_nATP' \
  -H 'device_profile_ref_id: EjqT69mD2mW8b8Chw_g79e3XLPVxzuEDajEn' \
  -H 'x-latency-trace: 1' \
  -H 'wm_mp: true' \
  -H 'x-o-market: us' \
  -H 'x-o-platform-version: main-496-bb268d' \
  -H 'x-o-gql-query: query shoppingListTotal' \
  -H 'wm_page_url: https://www.walmart.com/lists/shared/WL/d68191bf-e02b-4020-b1ae-6ed29acf7d2e' \
  -H 'x-apollo-operation-name: shoppingListTotal' \
  -H 'sec-ch-ua-platform: "macOS"' \
  -H 'sec-ch-ua-mobile: ?0' \
  -H 'user-agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/97.0.4692.71 Safari/537.36 Edg/97.0.1072.62' \
  -H 'x-o-segment: oaoh' \
  -H 'content-type: application/json' \
  -H 'accept: application/json' \
  -H 'x-enable-server-timing: 1' \
  -H 'x-o-ccm: server' \
  -H 'wm_qos.correlation_id: Hx_h9wbjcWjAD1PKYw2YSay-qISABKd_nATP' \
  -H 'origin: https://www.walmart.com' \
  -H 'sec-fetch-site: same-origin' \
  -H 'sec-fetch-mode: cors' \
  -H 'sec-fetch-dest: empty' \
  -H 'referer: https://www.walmart.com/lists/shared/WL/d68191bf-e02b-4020-b1ae-6ed29acf7d2e' \
  -H 'accept-language: vi' \
  -H 'cookie: hasACID=true; vtc=VzkPEhgqvpkWmD5bEkzlZk; TBV=7; tb_sw_supported=true; pxcts=1e72b5b8-95d7-11ec-a102-706259415952; _pxvid=1e72aa33-95d7-11ec-a102-706259415952; AID=wmlspartner%253D0%253Areflectorid%253D0000000000000000000000%253Alastupd%253D1645751315246; hasLocData=1; TB_Latency_Tracker_100=1; TB_Navigation_Preload_01=1; TB_SFOU-100=1; ACID=964cb8c0-fb45-4b12-87ee-bfdfbbb986c5; auth=MTAyOTYyMDE4zfK5hoIHgSoR1RwYeGWD4crC68QRVh7qaHX%2BBg%2F5aZwTcFKpmnA1Oaf4THgvnzw6UBeiEfHAp2wgqKuetp7bofJHl39Wyk%2BM%2FrJwaB5mpa2epvm3dCczMVMqABNeOyKg767wuZloTfhm7Wk2Kcjygv3M5Jnvc7ePkiG6%2BkglNAAtHCISZajYkYYPtC3FiTx6W2E4BR%2BnISRRVk8SAOWxbWeyoWoynDSUkcfa%2FQBngSsUMk70P8glgOEpLOprhDfMM%2FFHGZ2dCNmxWrdkwqEKrh0z91%2BgLE0KBAMGV0On9ehtNjLN6rQqOTbOLS9BCD%2BMTSXrHl9TPwVHh%2BW4UQwiqAA7ZwZMO%2B7CStUAgRo1q%2BLJrIWfG25dW4lu6tRdLGkl28%2F1gNPTS066mDMCV5ypKUjyrOXbKKhH072NS%2FW0j%2FU%3D; locGuestData=eyJpbnRlbnQiOiJTSElQUElORyIsInN0b3JlSW50ZW50IjoiUElDS1VQIiwibWVyZ2VGbGFnIjpmYWxzZSwiaXNEZWZhdWx0ZWQiOnRydWUsInBpY2t1cCI6eyJub2RlSWQiOiIzMDgxIiwidGltZXN0YW1wIjoxNjQ2MDIyNzE2MTAzfSwicG9zdGFsQ29kZSI6eyJ0aW1lc3RhbXAiOjE2NDYwMjI3MTYxMDMsImJhc2UiOiI5NTgyOSJ9LCJ2YWxpZGF0ZUtleSI6InByb2Q6djI6OTY0Y2I4YzAtZmI0NS00YjEyLTg3ZWUtYmZkZmJiYjk4NmM1In0%3D; TS013ed49a=01538efd7c53f296f4c4526e24a3832b99ef2a6d8d6668a88faa96de673b38d7dadacb5ba6625e200a74ea94b4889d24e040899a02; bstc=Tz34GsBu0YohGl_0KAAP_o; mobileweb=0; xpa=0vCgY|2MKF8|92i0d|9OVuz|DAwQd|YgI0R|cahsq|o6gca|zbWJX; exp-ck=0vCgY12MKF8192i0d1DAwQd2YgI0R1cahsq1o6gca1zbWJX1; ak_bmsc=E236C966235A1B673C6D629274E6B5AE~000000000000000000000000000000~YAAQpi43F/Cg3Dt/AQAAP+3QQg4U9FMvmEGPXOJI8mbrxr+wQ3XKWP/Tv8xGsR6Ehcn5QeiduZQMRHOcGfCvxnlnwJUkevTt5cPj03Y+jDCby0oDGnhVEw/NBQDiAyXSc0DjPnNxLmXWYDJdwc0nIJjgbxWhvPIP2S9sSOxpkjvLUbPnkLKsTHj2mnCBuQM5eaNn0SzgmyOdP6NfIRpQiQLj58MNzrBuWCvCZ72iBnrMCIijdThutP1Hz+T3uT5byddqUMiOxA8OwCRJyJ3OYkPo/n8FmPrfQUe0tnBUiU49Mj8gXiWuqHNn6LpOttyHqivGA6XAb7oe/6dtAaIeXFgb2JtA+KE4RlIUy+pDhOWnRimuP2O5Mt38hGpcZ5NFlkulIKhuPInwbafO; xpm=1%2B1646093462%2BVzkPEhgqvpkWmD5bEkzlZk~%2B0; com.wm.reflector="reflectorid:0000000000000000000000@lastupd:1646095202115@firstcreate:1645751168930"; locDataV3=eyJpc0RlZmF1bHRlZCI6dHJ1ZSwiaW50ZW50IjoiU0hJUFBJTkciLCJwaWNrdXAiOlt7ImJ1SWQiOiIwIiwibm9kZUlkIjoiMzA4MSIsImRpc3BsYXlOYW1lIjoiU2FjcmFtZW50byBTdXBlcmNlbnRlciIsIm5vZGVUeXBlIjoiU1RPUkUiLCJhZGRyZXNzIjp7InBvc3RhbENvZGUiOiI5NTgyOSIsImFkZHJlc3NMaW5lMSI6Ijg5MTUgR2VyYmVyIFJvYWQiLCJjaXR5IjoiU2FjcmFtZW50byIsInN0YXRlIjoiQ0EiLCJjb3VudHJ5IjoiVVMiLCJwb3N0YWxDb2RlOSI6Ijk1ODI5LTAwMDAifSwiZ2VvUG9pbnQiOnsibGF0aXR1ZGUiOjM4LjQ4MjY3NywibG9uZ2l0dWRlIjotMTIxLjM2OTAyNn0sImlzR2xhc3NFbmFibGVkIjp0cnVlLCJzY2hlZHVsZWRFbmFibGVkIjp0cnVlLCJ1blNjaGVkdWxlZEVuYWJsZWQiOmZhbHNlfV0sInNoaXBwaW5nQWRkcmVzcyI6eyJsYXRpdHVkZSI6MzguNDczOCwibG9uZ2l0dWRlIjotMTIxLjM0MzksInBvc3RhbENvZGUiOiI5NTgyOSIsImNpdHkiOiJTYWNyYW1lbnRvIiwic3RhdGUiOiJDQSIsImNvdW50cnlDb2RlIjoiVVNBIiwiZ2lmdEFkZHJlc3MiOmZhbHNlfSwiYXNzb3J0bWVudCI6eyJub2RlSWQiOiIzMDgxIiwiZGlzcGxheU5hbWUiOiJTYWNyYW1lbnRvIFN1cGVyY2VudGVyIiwiYWNjZXNzUG9pbnRzIjpudWxsLCJzdXBwb3J0ZWRBY2Nlc3NUeXBlcyI6W10sImludGVudCI6IlBJQ0tVUCIsInNjaGVkdWxlRW5hYmxlZCI6ZmFsc2V9LCJkZWxpdmVyeSI6eyJidUlkIjoiMCIsIm5vZGVJZCI6IjMwODEiLCJkaXNwbGF5TmFtZSI6IlNhY3JhbWVudG8gU3VwZXJjZW50ZXIiLCJub2RlVHlwZSI6IlNUT1JFIiwiYWRkcmVzcyI6eyJwb3N0YWxDb2RlIjoiOTU4MjkiLCJhZGRyZXNzTGluZTEiOiI4OTE1IEdlcmJlciBSb2FkIiwiY2l0eSI6IlNhY3JhbWVudG8iLCJzdGF0ZSI6IkNBIiwiY291bnRyeSI6IlVTIiwicG9zdGFsQ29kZTkiOiI5NTgyOS0wMDAwIn0sImdlb1BvaW50Ijp7ImxhdGl0dWRlIjozOC40ODI2NzcsImxvbmdpdHVkZSI6LTEyMS4zNjkwMjZ9LCJpc0dsYXNzRW5hYmxlZCI6dHJ1ZSwic2NoZWR1bGVkRW5hYmxlZCI6dHJ1ZSwidW5TY2hlZHVsZWRFbmFibGVkIjpmYWxzZSwiYWNjZXNzUG9pbnRzIjpbeyJhY2Nlc3NUeXBlIjoiREVMSVZFUllfQUREUkVTUyJ9XSwic3VwcG9ydGVkQWNjZXNzVHlwZXMiOlsiREVMSVZFUllfQUREUkVTUyJdfSwiaW5zdG9yZSI6ZmFsc2UsInJlZnJlc2hBdCI6MTY0NjExNjgwMjE4MSwidmFsaWRhdGVLZXkiOiJwcm9kOnYyOjk2NGNiOGMwLWZiNDUtNGIxMi04N2VlLWJmZGZiYmI5ODZjNSJ9; assortmentStoreId=3081; xptwg=2625546297:1FAB7FAF4B101E0:52A1F75:7A157020:B9B267BE:C728125F:; TS01b0be75=01538efd7c4a1cb4170b048b06b66038f6b7a84a2f1defa58b5d2ff42ead2dd17fb0fe404dcd155bccaa2aa1c3fe79006371c0773a; bm_sv=85EF3E1B25E3A03797B1F1630400F558~AhnAnmi1Idfo9Eul5qEVLNAvVTdxcwcKVRjF/AySlF2JWeeLebSGJIuZIlVWKaeC28W2l2d7Acf+1Lmdvoce+JjALfnXHNb7OZClspMaIFHYqgUlP/NJKjq5gUOboUR0mvg6Yrbdb3lQDgSfs25hFty8Ixsmucgd/m7dfM8i7mE=; bm_mi=94E336C723ABF7E586436EC0788C9DD1~Vj+lSuVv59+zbBzbD4R6cXTiSw+aFVrNUfsVXYVmOWgQFdFNYj8l4zrnVviR0wIjIpnGR/fsDw2zMsX5cOOfuHsXuEI1KikM6R++PFeiS4BO469kimmEYQhPDOK0oQWDJ7/uW2bcCEi9pvljvfSbhnSzMzlBK0knt2YV/pggv95q2o5UzX4w0bqJ5twjLzggwpWzN2R0MfXl6yAAkA43j9tyTwC8+UZZnEzyRhD88RAaIP1IvI88R380OhbtuVlPieVqSTtJ9IXydRYktJf2mIXJCrT+ATllT4cz/ks4p/gNr6+T2aS/0/kDAxw1aDyfDdy9bN3V8Xud+7Zz8E/ogzZKSYZh5oB9hz/WcVIYAnw=' \
  --data-raw '{"query":"query shoppingListTotal($input:ListTotalInput){shoppingListTotal(input:$input){products{priceInfo{currentPrice{price}},priceInfo{wasPrice{price}},name,usItemId,availabilityStatus}}}","variables":{"input":{"id":"d68191bf-e02b-4020-b1ae-6ed29acf7d2e","permission":"VIEW"}}}' \
  --compressed`

  if [[ $list6 =~ "blocked" ]]
  then
    link6=`echo $list6 | jq '.redirectUrl' | sed 's/"//g'`
    `open -n -a /Applications/Microsoft\ Edge.app --args --profile-directory=Default https://walmart.com$link6`
  else
    echo $list6 | jq '.data.shoppingListTotal.products[].usItemId' >> ebay-usItemId.txt
    echo $list6 | jq '.data.shoppingListTotal.products[].priceInfo.currentPrice.price' >> ebay-currentPrice.txt
    echo $list6 | jq '.data.shoppingListTotal.products[].priceInfo.wasPrice.price' | sed 's/null//g' >> ebay-wasPrice.txt
    echo $list6 | jq '.data.shoppingListTotal.products[].availabilityStatus' >> ebay-availabilityStatus.txt
    echo "6"
    break
  fi

done

while true
do
list7=`curl -s 'https://www.walmart.com/orchestra/home/graphql' \
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
  -H 'cookie: auth=MTAyOTYyMDE4SAFoijgoW%2BwVbVl1XCR8b1LY15K%2FPFkpB3eqeMWKxB8neaW%2BC1T2bnXu4hcsFbsL3drLRuHXPg%2F%2Fk1f6bSTYAzjhJuhJDynI%2BiazR%2F4BWP8KjDEgutZecVEIw2W%2FoD%2B4767wuZloTfhm7Wk2KcjygobRHThsmZk%2BGcqTfIab85SwxXtAz7E82fz1Znm95f9I31fMVdEFB01AdiHjLYIrVgSU6%2FFSyFHoBLkxTbgXNUoUMk70P8glgOEpLOprhDfMM%2FFHGZ2dCNmxWrdkwqEKrjMMRWvuyffZ1jFJ6FEiGMy5eEZMH6Z6ge%2BPBrf%2BmQ6MFTZUwhWEMIwdnlmj85fW3xwH4pTZFmNzWmz2pR5ixfLpB03mfjBSpaZQK7Euu6DERjQ3r9INNAjLhqBeT2p7%2FljKcklje4R5ioW78kDnDBU%3D; ACID=04d84235-6998-47be-a2f2-91071c122a77; hasACID=true; assortmentStoreId=3081; hasLocData=1; TB_Latency_Tracker_100=1; TB_Navigation_Preload_01=1; vtc=Wwbqv2nRsU2su70JwXaqZk; bstc=Wwbqv2nRsU2su70JwXaqZk; mobileweb=0; xpa=2PRJ6|9qHE4|DAwQd|KzWDJ|PwUCp|fD9ZO|mrxWN|pAAwd|s6z_-|vkFmv|yurXb; exp-ck=DAwQd2PwUCp1fD9ZO1vkFmv1yurXb1; TS01b0be75=01538efd7c6e4f5583d7d9fab7f97ce95db0a921ecad5afe719e9432b5beabf8d846a3ffd55efbabfae6b079855b9acab3f92af4ad; TS013ed49a=01538efd7c6e4f5583d7d9fab7f97ce95db0a921ecad5afe719e9432b5beabf8d846a3ffd55efbabfae6b079855b9acab3f92af4ad; TBV=7; tb_sw_supported=true; ak_bmsc=3C08BCE3E605BDA834111846614D317F~000000000000000000000000000000~YAAQBS83Fwcqtql+AQAAEVsnqg71Qntyg8gPY7pbbJQBYcohSHcwfonQ756IXPgno+Ni0rrSNFhBMPgWw2GLlJp3UJ1y6ZIc2n6Go+aNEYnELk1UotVxy/a06iVlWE3zlfFKyKMBSsJ1NpzvPSQ3O889ppxDP0XScxTXzKllwPwd5TF4EyE0YqKRkUK7vhdPJ/IQULjXOhy/mt3K9Nz2TPX/SQ5NEd7UmSoMIvASBmS+oyCdC4pdU/6tmKTtvgCGpQuVkw4eTjjK1U5VToGhYHb8RpHCfILCQl2DE0BqY0BJA1ZFEm2L+qgBXLevYmNVBKvp+RikFnP3hkCiupmaf18CSj5nf6ZQW+GLJP24KJZq/tNaWm0nypm0Ar9kv5++OhOoMRwBE+SqVYSFj3hszXQWE40b3ubmc3FZ/WowcIsu2j6597qI1xLzzQAslWQ2Y7ibhqk+94UzniGnWfoyXgD+XneJmoJ6OC11I0X7lt7de8iIID1m5LGiiEL3; pxcts=b524a810-81a8-11ec-b1c7-2f3bb0e953f5; _pxvid=b524530a-81a8-11ec-bb78-516742524d6f; _px3=1da26b5e368f3079da8896be506869586c02b5781ef543bbacf7de32bd38700a:GVI+qY/xG/RjSXWobZrYa+S+7RIUEYeuU6f0jbyqG90do1AuDIpg9MxHplnZddEHS5fwrCPCkG4XlHwpypIrcg==:1000:4Kw8A0Ai2P3eKFIlZlSGqzLq85QyDULwW9UYRHCqpGNZ6O9erOjjflqgaJ1CmpkIUQ7YBZ4H6+ZMJrUquXO3Rg0LkrGI9ffGDVBn029CJal/Ed4Rnq8SlQ2ZufgNRnulhDG2PshoBzA6rsfuOtHn5lOmLUAa+66V4dx/7/oSNZHgYC2K8G8F0rPXzfdTAAKXuIIdGv0h/ugS9jRdDeTRgw==; _pxde=91debf3db4ce52f57682bbd51ae3ee60287b66346b9afea0a84315e9916aadad:eyJ0aW1lc3RhbXAiOjE2NDM1MzIyMjkzODAsImZfa2IiOjAsImlwY19pZCI6W119; TB_SFOU-100=1; xpm=1%2B1643532208%2BWwbqv2nRsU2su70JwXaqZk~%2B0; tb-c30=scus-t1; locDataV3=Fe26.2**d78933d8d1735e992c15e31829880b5319f08fad3a9fa707e7e995b88d8a4553*l8MiNfVaU2yLfvmu9gRmuQ*FCthQUvf0zzmBl3XFuD0TQ37AB9eQit3FjmfxXMMDCNDrIbHYeqvMbe8e-vYcVAjZYxR1eoAlyfZfnq_nzKE3eY5zqAruPn5diTCnIlbLaPgedt5e1sN6r5LAbfxrfeRHlQMQf4fvoaMih8EDdTxFSmQIEaArflv7IaNQg0ta7Du3c_f7qkSrswH57gKmQwSxpeP6ea0Vll2tKAPpYdYIDn14Ld7e4PDcAePzyKhes3Uum1b7EQZpABfxM6fDDxyV3k14UB2KYMCCHFE-svPCbwFDaJMVIQiCZeF6sE1ke0OGwdTmyVAEoeK2E6ayxSPeMa3ei_dgGCyivZCQWRPLdjH92zJslh5_o8b_LejDZxSuMGCZt26qfoP-Rm6TD26fjhGQ1BXnfO-kudMdNwrOvPBaYikLj0fqmv4IHOi3Grb7deU60nY-DuhS5RdAfszNN-xzxnUeWqBqM5M58C95AFChk3ofCy7wCXVsW4MjEwb60qJBCji3nitX_bd1Y0bzeLUK_Hs7SotYbR3TO_Y9dk3TvklHz39LehQcJHvaTaBbLP6z4HNERg_Xk86pZqXcRj_Y4dkwkkx6gS1SSwoJKSg_pueLCSiZQnWYOoTzLRZ1QXf9rrEH1_o9VW5PCkDZkzl0DuIpNetiyzq0nPjaB2-T2eA_jF1b_gjMQ9ihujLXjSbmVcFvFOHaoI1VOj_o39ouXkiWD6jYuVvFm58hGK1-uawa69c-yly02GdhqyvFLHyydyvo7YnQV84tKutt5cF3F-5z4NzwGnbxsYCPTXIdSLvU4AYw6F5v7PdBu6Og62e9mzwzTSw3cx3sWClYYt2toohHuiqPtjeIHp3s-XSmCmISIWjzOaImJ9Prodv_ZnUyZoldFhplAdXnpuPzElculIAsmIRU2fjCGr3fSQEXSrMd5jLe8nnpXENXjmNNhVL-Y2CJBizmF68AJbtHY0s0F2oXbk4YgVkipO-sir4HbpJ5QDzVgVoR_0ZPZ2slE0ItIYNJzn9Cmw3eGFJkZT-Y4-tWem_9eChn2Ew9e3dud1PoH4_J1NaKI__f-vF6HevtrXVnc5j6mlInhJW**e952c5dcc46cc3d3698dd6fd1d4b161bbf8c797991a25424d9f8f18713f9c49d*piOZfd8qFyL_Ac8vqF-VDAyiRL7NVQhwbsTlc1chjfA; locGuestData=eyJpbnRlbnQiOiJTSElQUElORyIsInN0b3JlSW50ZW50IjoiUElDS1VQIiwibWVyZ2VGbGFnIjpmYWxzZSwicGlja3VwIjp7Im5vZGVJZCI6IjMwODEiLCJ0aW1lc3RhbXAiOjE2NDM1MzIyMzMyMzZ9LCJwb3N0YWxDb2RlIjp7InRpbWVzdGFtcCI6MTY0MzUzMjIzMzIzNiwiYmFzZSI6Ijk1ODI5In0sInZhbGlkYXRlS2V5IjoicHJvZDp2MjowNGQ4NDIzNS02OTk4LTQ3YmUtYTJmMi05MTA3MWMxMjJhNzcifQ%3D%3D; AID=wmlspartner%253D0%253Areflectorid%253D0000000000000000000000%253Alastupd%253D1643532291277; com.wm.reflector="reflectorid:0000000000000000000000@lastupd:1643532291277@firstcreate:1643532208806"; xptwg=931059659:5059901D814BE0:D1F97E:5F91AC9F:4FF50BAC:F12E0628:; bm_sv=A1989D55605AF57BB1876AA22994EDF8~t3gzpBSuSRX5QGQOWbSAIIw9RFr0NbwNcDvuILTihkyUC3L/u2/HnSMi+2t2Xo2OeApGjiae+svqz+G1buVgOH26z1AFI/LMVs3sVxRLfNyZlw5DERMGXjLHJlKeijXDdvoxkLTOGYbIeRz9I+2ZJ78RbNsiY1ooqPbL8UlH0H8=' \
  --data-raw '{"query":"query shoppingListTotal($input:ListTotalInput){shoppingListTotal(input:$input){products{priceInfo{currentPrice{price}},priceInfo{wasPrice{price}},name,usItemId,availabilityStatus}}}","variables":{"input":{"id":"7772d6eb-e8d7-46b9-b08a-0d6bbebc19d9","permission":"VIEW"}}}' \
  --compressed`
  if [[ $list7 =~ "blocked" ]]
  then
    link7=`echo $list7 | jq '.redirectUrl' | sed 's/"//g'`
    `open -n -a /Applications/Microsoft\ Edge.app --args --profile-directory=Default https://walmart.com$link7`
  else
    echo $list7 | jq '.data.shoppingListTotal.products[].usItemId' >> ebay-usItemId.txt
    echo $list7 | jq '.data.shoppingListTotal.products[].priceInfo.currentPrice.price' >> ebay-currentPrice.txt
    echo $list7 | jq '.data.shoppingListTotal.products[].priceInfo.wasPrice.price' | sed 's/null//g' >> ebay-wasPrice.txt
    echo $list7 | jq '.data.shoppingListTotal.products[].availabilityStatus' >> ebay-availabilityStatus.txt
    echo "7"
    break
  fi
done


git add -A .
git commit -m --allow-empty
git push
git push origin HEAD -f
gitCommit=`git rev-parse HEAD`
linkGit=`echo https://raw.githubusercontent.com/DungSherlock/eBay/`$gitCommit`echo /`
linkApi=`echo https://script.google.com/macros/s/AKfycby_hOHVU89OzlCdtECUuqy3pSW83BtIPJmoW2UGMC7PWmLdxErG1Fn5niiyRyPnUgGqYA/exec?`
linkPost=$linkApi`echo Link ID==IMPORTDATA\(\"`$linkGit`echo ebay-usItemId.txt\"\)\&Giá hiện tại==IMPORTDATA\(\"`$linkGit`echo ebay-currentPrice.txt\"\)\&Trạng thái hàng==IMPORTDATA\(\"`$linkGit`echo ebay-availabilityStatus.txt\"\)\&Giá gốc==IMPORTDATA\(\"`$linkGit`echo ebay-wasPrice.txt\"\)`
echo $linkPost
# curl -s POST `https://script.google.com/macros/s/AKfycby_hOHVU89OzlCdtECUuqy3pSW83BtIPJmoW2UGMC7PWmLdxErG1Fn5niiyRyPnUgGqYA/exec?Link ID==IMPORTDATA("https://raw.githubusercontent.com/DungSherlock/eBay/ea474c5affcfa46bdd9fa86d49ccb2f14f1aa5cc/ebay-usItemId.txt")&Giá hiện tại==IMPORTDATA("https://raw.githubusercontent.com/DungSherlock/eBay/ea474c5affcfa46bdd9fa86d49ccb2f14f1aa5cc/ebay-currentPrice.txt")&Trạng thái hàng==IMPORTDATA("https://raw.githubusercontent.com/DungSherlock/eBay/ea474c5affcfa46bdd9fa86d49ccb2f14f1aa5cc/ebay-availabilityStatus.txt")&Giá gốc==IMPORTDATA("https://raw.githubusercontent.com/DungSherlock/eBay/ea474c5affcfa46bdd9fa86d49ccb2f14f1aa5cc/ebay-wasPrice.txt")`
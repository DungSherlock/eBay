#!/bin/bash
  # --data-raw '{"query":"query shoppingListTotal($input:ListTotalInput){shoppingListTotal(input:$input){products{priceInfo{currentPrice{price}},priceInfo{wasPrice{price}},name,usItemId,availabilityStatus,imageInfo{thumbnailUrl}}}}","variables":{"input":{"id":"5235469c-9c94-4bc9-96cc-e0f44ade3b9e","permission":"VIEW"}}}' \

: > ebay-usItemId.txt
: > ebay-currentPrice.txt
: > ebay-wasPrice.txt
: > ebay-availabilityStatus.txt

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

if [[ $list1 =~ "blocked" ]]
then
  link=`echo $list1 | jq '.redirectUrl' | sed 's/"//g'`
  echo 'https://walmart.com'$link
  exit
fi
if [[ $list2 =~ "blocked" ]]
then
  link=`echo $list2 | jq '.redirectUrl' | sed 's/"//g'`
  echo 'https://walmart.com'$link
  exit
fi
if [[ $list3 =~ "blocked" ]]
then
  link=`echo $list3 | jq '.redirectUrl' | sed 's/"//g'`
  echo 'https://walmart.com'$link
  exit
fi
if [[ $list4 =~ "blocked" ]]
then
  link=`echo $list4 | jq '.redirectUrl' | sed 's/"//g'`
  echo 'https://walmart.com'$link
  exit
fi
if [[ $list5 =~ "blocked" ]]
then
  link=`echo $list5 | jq '.redirectUrl' | sed 's/"//g'`
  echo 'https://walmart.com'$link
  exit
fi

# echo $output | jq '.data.shoppingListTotal.products[].imageInfo.thumbnailUrl' | sed 's/\,//g' > ebay-thumbnailUrl
# echo $output | jq '.data.shoppingListTotal.products[].name' | sed 's/\,//g' > ebay-name
echo $list1 | jq '.data.shoppingListTotal.products[].usItemId' >> ebay-usItemId.txt
echo $list1 | jq '.data.shoppingListTotal.products[].priceInfo.currentPrice.price' >> ebay-currentPrice.txt
echo $list1 | jq '.data.shoppingListTotal.products[].priceInfo.wasPrice.price' | sed 's/null//g' >> ebay-wasPrice.txt
echo $list1 | jq '.data.shoppingListTotal.products[].availabilityStatus' >> ebay-availabilityStatus.txt

echo $list2 | jq '.data.shoppingListTotal.products[].usItemId' >> ebay-usItemId.txt
echo $list2 | jq '.data.shoppingListTotal.products[].priceInfo.currentPrice.price' >> ebay-currentPrice.txt
echo $list2 | jq '.data.shoppingListTotal.products[].priceInfo.wasPrice.price' | sed 's/null//g' >> ebay-wasPrice.txt
echo $list2 | jq '.data.shoppingListTotal.products[].availabilityStatus' >> ebay-availabilityStatus.txt

echo $list3 | jq '.data.shoppingListTotal.products[].usItemId' >> ebay-usItemId.txt
echo $list3 | jq '.data.shoppingListTotal.products[].priceInfo.currentPrice.price' >> ebay-currentPrice.txt
echo $list3 | jq '.data.shoppingListTotal.products[].priceInfo.wasPrice.price' | sed 's/null//g' >> ebay-wasPrice.txt
echo $list3 | jq '.data.shoppingListTotal.products[].availabilityStatus' >> ebay-availabilityStatus.txt

echo $list4 | jq '.data.shoppingListTotal.products[].usItemId' >> ebay-usItemId.txt
echo $list4 | jq '.data.shoppingListTotal.products[].priceInfo.currentPrice.price' >> ebay-currentPrice.txt
echo $list4 | jq '.data.shoppingListTotal.products[].priceInfo.wasPrice.price' | sed 's/null//g' >> ebay-wasPrice.txt
echo $list4 | jq '.data.shoppingListTotal.products[].availabilityStatus' >> ebay-availabilityStatus.txt

echo $list5 | jq '.data.shoppingListTotal.products[].usItemId' >> ebay-usItemId.txt
echo $list5 | jq '.data.shoppingListTotal.products[].priceInfo.currentPrice.price' >> ebay-currentPrice.txt
echo $list5 | jq '.data.shoppingListTotal.products[].priceInfo.wasPrice.price' | sed 's/null//g' >> ebay-wasPrice.txt
echo $list5 | jq '.data.shoppingListTotal.products[].availabilityStatus' >> ebay-availabilityStatus.txt

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
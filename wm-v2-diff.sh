#!/bin/bash
#'${array[1]}'
# eBay-CO Rác: https://script.google.com/macros/s/AKfycbzsiGXaclu6CAFaAAQEIuR7io8UuGMP1jNM_flgD5uWrv8P4rIlhabx4B3AOdZ7kKw/exec
# EBAY TD T11: https://script.google.com/macros/s/AKfycby_hOHVU89OzlCdtECUuqy3pSW83BtIPJmoW2UGMC7PWmLdxErG1Fn5niiyRyPnUgGqYA/exec

git pull
: > ebay-usItemId.txt
: > ebay-currentPrice.txt
: > ebay-wasPrice.txt
: > ebay-availabilityStatus.txt

while read line
do
  array=(${line//|/ })
  while true
  do
    list=`curl -s 'https://www.walmart.com/orchestra/home/graphql/getListDetails/4fb20c34987f00ecdbbf4f388b7ddc80a70519f2d9f87c615b59f71834124dcd?variables=%7B%22input%22%3A%7B%22id%22%3A%22'${array[1]}'%22%2C%22listType%22%3A%22WL%22%2C%22pagination%22%3A%7B%22page%22%3A1%2C%22pageSize%22%3A1%7D%2C%22sortOrder%22%3A%22DEFAULT%22%2C%22maxItems%22%3Atrue%2C%22skipGeneric%22%3Atrue%7D%7D' \
    -H 'authority: www.walmart.com' \
    -H 'accept: application/json' \
    -H 'accept-language: vi' \
    -H 'content-type: application/json' \
    -H 'cookie: hasLocData=1; TB_Latency_Tracker_100=1; TB_Navigation_Preload_01=1; TB_SFOU-100=; vtc=ZV4XF19kqR87hp6NvYWKOU; bstc=ZV4XF19kqR87hp6NvYWKOU; mobileweb=0; xpth=x-o-mverified%2Bfalse; _pxhd=9ddc75fcbcd7181b1ac8b9313b6938ae0c667078e3ffe6d576883a9d2d2c473e:b53b4e32-559d-11ed-b409-654a64435159; TBV=7; pxcts=5d23bf44-559f-11ed-87d6-726b55506f50; dimensionData=943; CID=4317c22b-5225-417f-bc33-66847d8fe66b; hasCID=1; SPID=02bf7b7eb51056ab985646870a1c4c3c830bd82df7adc4dc1e515fe7e0cc606da8aeb97e58627c6ad337b22ae6a02fd9wmcxo; type=REGISTERED; _vc=4dieIfRp5KxUCRzCLzZsgyzJJuSzA0A%2FG6pbXzLShhA%3D; customer=%7B%22firstName%22%3A%22Dung%22%2C%22lastNameInitial%22%3A%22D%22%7D; _m=9; akavpau_p2=1666838470~id=4b8b7ee0f30c2ece4ae2ff56c7ed5671; adblocked=true; assortmentStoreId=1132; xptc=assortmentStoreId%2B1132; userContext=eyJhZGRyZXNzRGF0YSI6bnVsbCwiaGFzSXRlbVN1YnNjcmlwdGlvbiI6ZmFsc2UsImhhc01lbWJlcnNoaXBJbmZvIjpmYWxzZSwiaXNEZWZhdWx0IjpmYWxzZSwicGF5bWVudERhdGEiOnsiY2FwaXRhbE9uZUJhbm5lclNub296ZVRTIjoxNjQ3NzQ2NDIwNTEzLCJoYXNDYXBPbmUiOmZhbHNlLCJoYXNDYXBPbmVMaW5rZWQiOmZhbHNlLCJoYXNDcmVkaXRDYXJkIjpmYWxzZSwiaGFzRGlyZWN0ZWRTcGVuZENhcmQiOmZhbHNlLCJoYXNFQlQiOmZhbHNlLCJoYXNHaWZ0Q2FyZCI6ZmFsc2UsInNob3dDYXBPbmVCYW5uZXIiOnRydWUsIndwbHVzTm9CZW5lZml0QmFubmVyIjp0cnVlLCJwYXltZW50TWV0aG9kVGFncyI6W10sImhhc1BheXBhbEJBIjpmYWxzZX0sInByb2ZpbGVEYXRhIjp7ImlzQXNzb2NpYXRlIjpmYWxzZSwiaXNUZXN0QWNjb3VudCI6ZmFsc2UsImN1c3RvbWVyVHlwZSI6IklORElWSURVQUwiLCJtZW1iZXJzaGlwT3B0SW4iOnsiaXNPcHRlZEluIjpmYWxzZSwib3B0ZWRJbkF0dHJpYnV0ZUlkIjoiNjQyMGJiNDYtNDYwNi00MjY1LThiZTctODY4YTIxMTcwMjE0In19LCJzaG93U2lnblVwU3BsYXNoIjpmYWxzZX0%3D; _astc=dabf5b9c0a87ec580d49f3fba8bafc2e; locDataV3=eyJyZWZyZXNoQXQiOjE2NjY4NTk1NDM0MTUsImludGVudCI6IlNISVBQSU5HIiwiYXNzb3J0bWVudCI6eyJub2RlSWQiOiIxMTMyIiwiZGlzcGxheU5hbWUiOiJBc2hlYm9ybyBTdXBlcmNlbnRlciIsImFjY2Vzc1BvaW50cyI6bnVsbCwic3VwcG9ydGVkQWNjZXNzVHlwZXMiOltdLCJpbnRlbnQiOiJQSUNLVVAiLCJzY2hlZHVsZUVuYWJsZWQiOmZhbHNlfSwicGlja3VwIjpbeyJidUlkIjoiMCIsIm5vZGVJZCI6IjExMzIiLCJkaXNwbGF5TmFtZSI6IkFzaGVib3JvIFN1cGVyY2VudGVyIiwibm9kZVR5cGUiOiJTVE9SRSIsImFkZHJlc3MiOnsicG9zdGFsQ29kZSI6IjI3MjAzIiwiYWRkcmVzc0xpbmUxIjoiMTIyNiBFIERpeGllIERyIiwiY2l0eSI6IkFzaGVib3JvIiwic3RhdGUiOiJOQyIsImNvdW50cnkiOiJVUyIsInBvc3RhbENvZGU5IjoiMjcyMDMtODg1NiJ9LCJnZW9Qb2ludCI6eyJsYXRpdHVkZSI6MzUuNjkyMjIzLCJsb25naXR1ZGUiOi03OS43ODk1ODF9LCJpc0dsYXNzRW5hYmxlZCI6dHJ1ZSwic2NoZWR1bGVkRW5hYmxlZCI6dHJ1ZSwidW5TY2hlZHVsZWRFbmFibGVkIjp0cnVlLCJodWJOb2RlSWQiOiIxMTMyIiwic3RvcmVIcnMiOiIwNjowMC0yMzowMCIsInN1cHBvcnRlZEFjY2Vzc1R5cGVzIjpbIlBJQ0tVUF9DVVJCU0lERSIsIlBJQ0tVUF9JTlNUT1JFIl19XSwiZGVsaXZlcnkiOnsiYnVJZCI6IjAiLCJub2RlSWQiOiIxMTMyIiwiZGlzcGxheU5hbWUiOiJBc2hlYm9ybyBTdXBlcmNlbnRlciIsIm5vZGVUeXBlIjoiU1RPUkUiLCJhZGRyZXNzIjp7InBvc3RhbENvZGUiOiIyNzIwMyIsImFkZHJlc3NMaW5lMSI6IjEyMjYgRSBEaXhpZSBEciIsImNpdHkiOiJBc2hlYm9ybyIsInN0YXRlIjoiTkMiLCJjb3VudHJ5IjoiVVMiLCJwb3N0YWxDb2RlOSI6IjI3MjAzLTg4NTYifSwiZ2VvUG9pbnQiOnsibGF0aXR1ZGUiOjM1LjY5MjIyMywibG9uZ2l0dWRlIjotNzkuNzg5NTgxfSwiaXNHbGFzc0VuYWJsZWQiOnRydWUsInNjaGVkdWxlZEVuYWJsZWQiOnRydWUsInVuU2NoZWR1bGVkRW5hYmxlZCI6dHJ1ZSwiYWNjZXNzUG9pbnRzIjpbeyJhY2Nlc3NUeXBlIjoiREVMSVZFUllfQUREUkVTUyJ9XSwiaHViTm9kZUlkIjoiMTEzMiIsImlzRXhwcmVzc0RlbGl2ZXJ5T25seSI6ZmFsc2UsInN1cHBvcnRlZEFjY2Vzc1R5cGVzIjpbIkRFTElWRVJZX0FERFJFU1MiXX0sInNoaXBwaW5nQWRkcmVzcyI6eyJsYXRpdHVkZSI6MzUuNjYyNSwibG9uZ2l0dWRlIjotNzkuODMwOSwicG9zdGFsQ29kZSI6IjI3MjA1IiwiY2l0eSI6IkFzaGVib3JvIiwic3RhdGUiOiJOQyIsImNvdW50cnlDb2RlIjoiVVNBIiwiZ2lmdEFkZHJlc3MiOmZhbHNlfSwiZW50aXR5RXJyb3JzIjpbXSwiaXNFeHBsaWNpdCI6ZmFsc2UsImluc3RvcmUiOmZhbHNlLCJkZWxpdmVyeVNsb3RJbmZvRFRPIjpudWxsLCJpc0RlZmF1bHRlZCI6ZmFsc2UsIm1wIjpbXSwidmFsaWRhdGVLZXkiOiJwcm9kOnYyOjQzMTdjMjJiLTUyMjUtNDE3Zi1iYzMzLTY2ODQ3ZDhmZTY2YiJ9; bm_mi=0E3DD1D0BD962506DD7063CC5D07D0F2~YAAQtAyrcS7qqA+EAQAAAZ9IFxFIupPhwGERuBrYJSxSIFXgkt9t12zsiV0tT2WetYOQoXicyW1XerE2fdo5ILOUI7aSRi6tw5WCpu8fIdQnfZ9dA6ZzwRM7p3WYyXbnh9lc/29OlMFo+Sg7ajtYRMoAlF3IfFBOhDdGgFSEFkn11u4/dEuwsVXYJWclZb8athiKGYiFDerUhKOJl3dHFWx1YFDJ/i3IEyyvTbS7+T/ucfWQ5SoKf0NiHllm5zemKF5wuOdtxyIvdzXSlRDmhL1f5hfwdbrUGuCNZL5zbClhlu4pSjkcnR/fjh0zaMd4cFgA3jz4gKsiE2tqayLzQY9QISKyB3vkYEJt1L6kJb87G/RALOj7sg8eaN8=~1; bm_sv=749A436E03FB994BE16257F344BCA4D6~YAAQtAyrcYHqqA+EAQAA4LtIFxGzq7flPp2xz8B6IcjFTiAZMjRKPUy1qfQ6WuirwTjjYcCjIF/ehPDbL6C0U1L68BpR/PJqhCOPdQQhcT1RyixDToChruhQ0wBPlWSR9KqLd1cLSJWUHUVcLOG2PsJTUdvx+dqyGRe3gZnVlkLDbe7PKhBHJBN7tKoT8gbgjC6gVXNpHVbGzIvyA+QWeqeb7HvbGL3zpsIyQQtEak124BuOA8c+Mz78bPn5ynRMPFU=~1; ak_bmsc=0D890BABEDFE3B342C067F50FE631399~000000000000000000000000000000~YAAQpwyrcXxYcRKEAQAAluJLFxG63T0TNXJgc52o+qJYww2zlFNIJbQW9Q0PZpU9r7ZrPUr36S+fexceRilij1KHkHg/63qx7W0G9pRVbLJFeBqRNQY8kSfPNOfkjcp1VYuaCaG2IhmUmMLpt7sZL0ujvlTGqF+ozAANgCQPQZiqwyp40LFgq8BwO8RdC2Yjggn//3XxTIgwLx6Sae07YunnDfVtgEuxj13XX++/PTiRoy50G4YnE6p1Le5+IxrLtxk5MnpPZHWWWycRzaeMzwNVeVxWbTbH4gUO3B5QY+GKcyt40pT439TtcoYXEFs+9T/Wc9FnX2cDp93YLPheYfSZ3enyJObWfMwA9ibB6lL2ez9TS+nQc+6LUhSrKjgVMv0CS7NJRaU5RMygL7LooKTUqnc8MtU3vLrvshq1cU1hClowFictxaJdGbCENpu7znqChC1x8XI/fG2WuU66aAp9eVYPd67pzi6YHrco; wmtboid=1666838544-8047454962-27395591360-85611223; _px3=e5f5f87fc02ee0a860e10f6429db6a5ffa27b379733cf2195c541766cfb92a09:Tz/sIt8hniM8vsLKF+EEil1XawQhTGdqO12/dUmTQfRoLhP7kdmdAl9axDpu9riU4Ls/unf3pjGiCrWnjjE25w==:1000:SzCHrYv4jh/UQVglfph1kgpZ3Ce2lmXRHKTY0EsqAdUPKBCqE76JEAEg9kQfIAHyFfSOtvCs+qerX4RyMdUfiJRmcndmFJ395qeFUChdX4eec+F2rgNEKjv6ztJ2bCxtv1S6Y8om2RzoCeEFiGPhFgBPfta8It+NjS3fO/0t9VuYLU8h/8SILHX0BGGMUAoaZWKLu0Z13Y/9mHsBnw9/5A==; xpa=17vNR|1ymNb|3WA5l|3mpU4|6uuLa|9T1D1|9YFWs|Al6-8|DOP7N|Dtw1C|Epx0e|FnTfV|Fxy8_|Gsq0D|H8_CP|JCPlz|KoFml|LqN_G|SAYS0|SPL_W|SmVSa|WqK9p|XmJLH|Ym5YS|_PuEf|c6tgM|c8HYq|cJpdK|cTVhp|hYHrN|jfF1F|k9N6S|m6OsI|mEsMi|oEDIj|oIP8w|p4kkd|tyeB4|u8ztl|uZnYU|v8r5t|vLRtI|zYSzT|ziOua; exp-ck=1ymNb33WA5l23mpU416uuLa1Al6-81Dtw1C2Fxy8_2Gsq0D1H8_CP2SmVSa1_PuEf2c6tgM3c8HYq1cTVhp2jfF1F1k9N6S3m6OsI1oEDIj1p4kkd1tyeB41u8ztl1vLRtI1zYSzT1; auth=MTAyOTYyMDE4EoLi71GU904F%2Bl97x8R4%2B6w8cb%2F6co7%2BAxbK9YgJF1LMcR%2FMdXQ6QBaL3dgp85SNOB3hhbbRmROGoRlfMJgXAzAxll6p58K75cKoQBqK4VPSEKCrJp1xdiMCoIH%2BXg3plrvBbkT8GAVfcnvLIPG4V6yof3prNWDZqXXrDWTIKJXJD1zerGqoWeUeVQcfvA%2BEK6iV9724jP4M1jlYMFyykQ88%2FbreJ29hxGEqOcjsqKqHmjo7qhYaSiPcVAAu%2FbQWMnRXVGRouWAl1YL5Fdw37zCySVAle29JsPkauAm%2FpOUej%2Bl%2BQ9i4R1I5ip1xo606QUzbav4lb046KQpA%2BFbd0yvnmjnRixAo9h3DiGS6SQvAJ02Ey1BKfad1k5q7%2ByEJPIbclyKIimLFmC2xerQacCVgMT6bIhqKDpxu2PMUdWw%3D; xptwj=rq:cd30a255069773ff0dfc:EAYTpMyTaoe3+Qc8rQvirGuWJxt4sMp2Qbwyagz+dnpp3gUL2ECiLd2pj01LCvN1GlQCFEUPTWp/nQlVlF3K4t75v+RI6YfOQcp7voybj7SqYNi3URFOnYzrQA==; akavpau_p1=1666840604~id=168eb51251db8bec677054f21a882d99; xpm=0%2B1666840017%2BZV4XF19kqR87hp6NvYWKOU~4317c22b-5225-417f-bc33-66847d8fe66b%2B0; xptwg=475369177:2438795319205C0:5D547F9:73A82A6A:F5E46D44:2275C773:; TS012768cf=016ea84bd27f01df85f1d2d5641cca1e8cf729d33bc8965d7c7082c8842b28fa9a82e5a3e56f728568c99c71d02bf3d04f487c7712; TS01a90220=016ea84bd27f01df85f1d2d5641cca1e8cf729d33bc8965d7c7082c8842b28fa9a82e5a3e56f728568c99c71d02bf3d04f487c7712; TS2a5e0c5c027=08039d86dcab2000db4fce80708e1012e2ed0477c5d0950bdb606182f0946458b2bc7bf7d185c8ab08bdefe351113000ce8d0ce5e42711c9a638c7512bfde85117856612f1369c7b0415fc2ab04a0600b896322d72ee5c0677607c895dd05157' \
    -H 'device_profile_ref_id: iFp6Hi50uc-gNvplE2uA4NA0qnOlAN2G04Gj' \
    -H 'dnt: 1' \
    -H 'lists-device-type: desktop' \
    -H 'referer: https://www.walmart.com/lists/WL/'${array[1]}'' \
    -H 'sec-ch-ua: "Chromium";v="106", "Microsoft Edge";v="106", "Not;A=Brand";v="99"' \
    -H 'sec-ch-ua-mobile: ?0' \
    -H 'sec-ch-ua-platform: "macOS"' \
    -H 'sec-fetch-dest: empty' \
    -H 'sec-fetch-mode: cors' \
    -H 'sec-fetch-site: same-origin' \
    -H 'traceparent: 00-0caac733e3f765b78c104f28de4e6f55-93becfa1f9b57d0d-00' \
    -H 'user-agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/106.0.0.0 Safari/537.36 Edg/106.0.1370.52' \
    -H 'wm_mp: true' \
    -H 'wm_page_url: https://www.walmart.com/lists/WL/'${array[1]}'' \
    -H 'wm_qos.correlation_id: 5dS8voJ1Tux-5BPV5I_F_R1XWeM-AZYaYNtN' \
    -H 'x-apollo-operation-name: getListDetails' \
    -H 'x-enable-server-timing: 1' \
    -H 'x-latency-trace: 1' \
    -H 'x-o-bu: WALMART-US' \
    -H 'x-o-ccm: server' \
    -H 'x-o-correlation-id: 5dS8voJ1Tux-5BPV5I_F_R1XWeM-AZYaYNtN' \
    -H 'x-o-gql-query: query getListDetails' \
    -H 'x-o-mart: B2C' \
    -H 'x-o-platform: rweb' \
    -H 'x-o-platform-version: main-1.26.0-be17f7' \
    -H 'x-o-segment: oaoh' \
    --compressed`

    list2=`curl -s 'https://www.walmart.com/orchestra/home/graphql/getListDetails/4fb20c34987f00ecdbbf4f388b7ddc80a70519f2d9f87c615b59f71834124dcd?variables=%7B%22input%22%3A%7B%22id%22%3A%22'${array[1]}'%22%2C%22listType%22%3A%22WL%22%2C%22pagination%22%3A%7B%22page%22%3A2%2C%22pageSize%22%3A1%7D%2C%22sortOrder%22%3A%22DEFAULT%22%2C%22maxItems%22%3Atrue%2C%22skipGeneric%22%3Atrue%7D%7D' \
    -H 'authority: www.walmart.com' \
    -H 'accept: application/json' \
    -H 'accept-language: vi' \
    -H 'content-type: application/json' \
    -H 'cookie: hasLocData=1; TB_Latency_Tracker_100=1; TB_Navigation_Preload_01=1; TB_SFOU-100=; vtc=ZV4XF19kqR87hp6NvYWKOU; bstc=ZV4XF19kqR87hp6NvYWKOU; mobileweb=0; xpth=x-o-mverified%2Bfalse; _pxhd=9ddc75fcbcd7181b1ac8b9313b6938ae0c667078e3ffe6d576883a9d2d2c473e:b53b4e32-559d-11ed-b409-654a64435159; TBV=7; pxcts=5d23bf44-559f-11ed-87d6-726b55506f50; dimensionData=943; CID=4317c22b-5225-417f-bc33-66847d8fe66b; hasCID=1; SPID=02bf7b7eb51056ab985646870a1c4c3c830bd82df7adc4dc1e515fe7e0cc606da8aeb97e58627c6ad337b22ae6a02fd9wmcxo; type=REGISTERED; _vc=4dieIfRp5KxUCRzCLzZsgyzJJuSzA0A%2FG6pbXzLShhA%3D; customer=%7B%22firstName%22%3A%22Dung%22%2C%22lastNameInitial%22%3A%22D%22%7D; _m=9; akavpau_p2=1666838470~id=4b8b7ee0f30c2ece4ae2ff56c7ed5671; adblocked=true; assortmentStoreId=1132; xptc=assortmentStoreId%2B1132; userContext=eyJhZGRyZXNzRGF0YSI6bnVsbCwiaGFzSXRlbVN1YnNjcmlwdGlvbiI6ZmFsc2UsImhhc01lbWJlcnNoaXBJbmZvIjpmYWxzZSwiaXNEZWZhdWx0IjpmYWxzZSwicGF5bWVudERhdGEiOnsiY2FwaXRhbE9uZUJhbm5lclNub296ZVRTIjoxNjQ3NzQ2NDIwNTEzLCJoYXNDYXBPbmUiOmZhbHNlLCJoYXNDYXBPbmVMaW5rZWQiOmZhbHNlLCJoYXNDcmVkaXRDYXJkIjpmYWxzZSwiaGFzRGlyZWN0ZWRTcGVuZENhcmQiOmZhbHNlLCJoYXNFQlQiOmZhbHNlLCJoYXNHaWZ0Q2FyZCI6ZmFsc2UsInNob3dDYXBPbmVCYW5uZXIiOnRydWUsIndwbHVzTm9CZW5lZml0QmFubmVyIjp0cnVlLCJwYXltZW50TWV0aG9kVGFncyI6W10sImhhc1BheXBhbEJBIjpmYWxzZX0sInByb2ZpbGVEYXRhIjp7ImlzQXNzb2NpYXRlIjpmYWxzZSwiaXNUZXN0QWNjb3VudCI6ZmFsc2UsImN1c3RvbWVyVHlwZSI6IklORElWSURVQUwiLCJtZW1iZXJzaGlwT3B0SW4iOnsiaXNPcHRlZEluIjpmYWxzZSwib3B0ZWRJbkF0dHJpYnV0ZUlkIjoiNjQyMGJiNDYtNDYwNi00MjY1LThiZTctODY4YTIxMTcwMjE0In19LCJzaG93U2lnblVwU3BsYXNoIjpmYWxzZX0%3D; _astc=dabf5b9c0a87ec580d49f3fba8bafc2e; locDataV3=eyJyZWZyZXNoQXQiOjE2NjY4NTk1NDM0MTUsImludGVudCI6IlNISVBQSU5HIiwiYXNzb3J0bWVudCI6eyJub2RlSWQiOiIxMTMyIiwiZGlzcGxheU5hbWUiOiJBc2hlYm9ybyBTdXBlcmNlbnRlciIsImFjY2Vzc1BvaW50cyI6bnVsbCwic3VwcG9ydGVkQWNjZXNzVHlwZXMiOltdLCJpbnRlbnQiOiJQSUNLVVAiLCJzY2hlZHVsZUVuYWJsZWQiOmZhbHNlfSwicGlja3VwIjpbeyJidUlkIjoiMCIsIm5vZGVJZCI6IjExMzIiLCJkaXNwbGF5TmFtZSI6IkFzaGVib3JvIFN1cGVyY2VudGVyIiwibm9kZVR5cGUiOiJTVE9SRSIsImFkZHJlc3MiOnsicG9zdGFsQ29kZSI6IjI3MjAzIiwiYWRkcmVzc0xpbmUxIjoiMTIyNiBFIERpeGllIERyIiwiY2l0eSI6IkFzaGVib3JvIiwic3RhdGUiOiJOQyIsImNvdW50cnkiOiJVUyIsInBvc3RhbENvZGU5IjoiMjcyMDMtODg1NiJ9LCJnZW9Qb2ludCI6eyJsYXRpdHVkZSI6MzUuNjkyMjIzLCJsb25naXR1ZGUiOi03OS43ODk1ODF9LCJpc0dsYXNzRW5hYmxlZCI6dHJ1ZSwic2NoZWR1bGVkRW5hYmxlZCI6dHJ1ZSwidW5TY2hlZHVsZWRFbmFibGVkIjp0cnVlLCJodWJOb2RlSWQiOiIxMTMyIiwic3RvcmVIcnMiOiIwNjowMC0yMzowMCIsInN1cHBvcnRlZEFjY2Vzc1R5cGVzIjpbIlBJQ0tVUF9DVVJCU0lERSIsIlBJQ0tVUF9JTlNUT1JFIl19XSwiZGVsaXZlcnkiOnsiYnVJZCI6IjAiLCJub2RlSWQiOiIxMTMyIiwiZGlzcGxheU5hbWUiOiJBc2hlYm9ybyBTdXBlcmNlbnRlciIsIm5vZGVUeXBlIjoiU1RPUkUiLCJhZGRyZXNzIjp7InBvc3RhbENvZGUiOiIyNzIwMyIsImFkZHJlc3NMaW5lMSI6IjEyMjYgRSBEaXhpZSBEciIsImNpdHkiOiJBc2hlYm9ybyIsInN0YXRlIjoiTkMiLCJjb3VudHJ5IjoiVVMiLCJwb3N0YWxDb2RlOSI6IjI3MjAzLTg4NTYifSwiZ2VvUG9pbnQiOnsibGF0aXR1ZGUiOjM1LjY5MjIyMywibG9uZ2l0dWRlIjotNzkuNzg5NTgxfSwiaXNHbGFzc0VuYWJsZWQiOnRydWUsInNjaGVkdWxlZEVuYWJsZWQiOnRydWUsInVuU2NoZWR1bGVkRW5hYmxlZCI6dHJ1ZSwiYWNjZXNzUG9pbnRzIjpbeyJhY2Nlc3NUeXBlIjoiREVMSVZFUllfQUREUkVTUyJ9XSwiaHViTm9kZUlkIjoiMTEzMiIsImlzRXhwcmVzc0RlbGl2ZXJ5T25seSI6ZmFsc2UsInN1cHBvcnRlZEFjY2Vzc1R5cGVzIjpbIkRFTElWRVJZX0FERFJFU1MiXX0sInNoaXBwaW5nQWRkcmVzcyI6eyJsYXRpdHVkZSI6MzUuNjYyNSwibG9uZ2l0dWRlIjotNzkuODMwOSwicG9zdGFsQ29kZSI6IjI3MjA1IiwiY2l0eSI6IkFzaGVib3JvIiwic3RhdGUiOiJOQyIsImNvdW50cnlDb2RlIjoiVVNBIiwiZ2lmdEFkZHJlc3MiOmZhbHNlfSwiZW50aXR5RXJyb3JzIjpbXSwiaXNFeHBsaWNpdCI6ZmFsc2UsImluc3RvcmUiOmZhbHNlLCJkZWxpdmVyeVNsb3RJbmZvRFRPIjpudWxsLCJpc0RlZmF1bHRlZCI6ZmFsc2UsIm1wIjpbXSwidmFsaWRhdGVLZXkiOiJwcm9kOnYyOjQzMTdjMjJiLTUyMjUtNDE3Zi1iYzMzLTY2ODQ3ZDhmZTY2YiJ9; bm_mi=0E3DD1D0BD962506DD7063CC5D07D0F2~YAAQtAyrcS7qqA+EAQAAAZ9IFxFIupPhwGERuBrYJSxSIFXgkt9t12zsiV0tT2WetYOQoXicyW1XerE2fdo5ILOUI7aSRi6tw5WCpu8fIdQnfZ9dA6ZzwRM7p3WYyXbnh9lc/29OlMFo+Sg7ajtYRMoAlF3IfFBOhDdGgFSEFkn11u4/dEuwsVXYJWclZb8athiKGYiFDerUhKOJl3dHFWx1YFDJ/i3IEyyvTbS7+T/ucfWQ5SoKf0NiHllm5zemKF5wuOdtxyIvdzXSlRDmhL1f5hfwdbrUGuCNZL5zbClhlu4pSjkcnR/fjh0zaMd4cFgA3jz4gKsiE2tqayLzQY9QISKyB3vkYEJt1L6kJb87G/RALOj7sg8eaN8=~1; bm_sv=749A436E03FB994BE16257F344BCA4D6~YAAQtAyrcYHqqA+EAQAA4LtIFxGzq7flPp2xz8B6IcjFTiAZMjRKPUy1qfQ6WuirwTjjYcCjIF/ehPDbL6C0U1L68BpR/PJqhCOPdQQhcT1RyixDToChruhQ0wBPlWSR9KqLd1cLSJWUHUVcLOG2PsJTUdvx+dqyGRe3gZnVlkLDbe7PKhBHJBN7tKoT8gbgjC6gVXNpHVbGzIvyA+QWeqeb7HvbGL3zpsIyQQtEak124BuOA8c+Mz78bPn5ynRMPFU=~1; ak_bmsc=0D890BABEDFE3B342C067F50FE631399~000000000000000000000000000000~YAAQpwyrcXxYcRKEAQAAluJLFxG63T0TNXJgc52o+qJYww2zlFNIJbQW9Q0PZpU9r7ZrPUr36S+fexceRilij1KHkHg/63qx7W0G9pRVbLJFeBqRNQY8kSfPNOfkjcp1VYuaCaG2IhmUmMLpt7sZL0ujvlTGqF+ozAANgCQPQZiqwyp40LFgq8BwO8RdC2Yjggn//3XxTIgwLx6Sae07YunnDfVtgEuxj13XX++/PTiRoy50G4YnE6p1Le5+IxrLtxk5MnpPZHWWWycRzaeMzwNVeVxWbTbH4gUO3B5QY+GKcyt40pT439TtcoYXEFs+9T/Wc9FnX2cDp93YLPheYfSZ3enyJObWfMwA9ibB6lL2ez9TS+nQc+6LUhSrKjgVMv0CS7NJRaU5RMygL7LooKTUqnc8MtU3vLrvshq1cU1hClowFictxaJdGbCENpu7znqChC1x8XI/fG2WuU66aAp9eVYPd67pzi6YHrco; wmtboid=1666838544-8047454962-27395591360-85611223; _px3=e5f5f87fc02ee0a860e10f6429db6a5ffa27b379733cf2195c541766cfb92a09:Tz/sIt8hniM8vsLKF+EEil1XawQhTGdqO12/dUmTQfRoLhP7kdmdAl9axDpu9riU4Ls/unf3pjGiCrWnjjE25w==:1000:SzCHrYv4jh/UQVglfph1kgpZ3Ce2lmXRHKTY0EsqAdUPKBCqE76JEAEg9kQfIAHyFfSOtvCs+qerX4RyMdUfiJRmcndmFJ395qeFUChdX4eec+F2rgNEKjv6ztJ2bCxtv1S6Y8om2RzoCeEFiGPhFgBPfta8It+NjS3fO/0t9VuYLU8h/8SILHX0BGGMUAoaZWKLu0Z13Y/9mHsBnw9/5A==; xpa=17vNR|1ymNb|3WA5l|3mpU4|6uuLa|9T1D1|9YFWs|Al6-8|DOP7N|Dtw1C|Epx0e|FnTfV|Fxy8_|Gsq0D|H8_CP|JCPlz|KoFml|LqN_G|SAYS0|SPL_W|SmVSa|WqK9p|XmJLH|Ym5YS|_PuEf|c6tgM|c8HYq|cJpdK|cTVhp|hYHrN|jfF1F|k9N6S|m6OsI|mEsMi|oEDIj|oIP8w|p4kkd|tyeB4|u8ztl|uZnYU|v8r5t|vLRtI|zYSzT|ziOua; exp-ck=1ymNb33WA5l23mpU416uuLa1Al6-81Dtw1C2Fxy8_2Gsq0D1H8_CP2SmVSa1_PuEf2c6tgM3c8HYq1cTVhp2jfF1F1k9N6S3m6OsI1oEDIj1p4kkd1tyeB41u8ztl1vLRtI1zYSzT1; auth=MTAyOTYyMDE4EoLi71GU904F%2Bl97x8R4%2B6w8cb%2F6co7%2BAxbK9YgJF1LMcR%2FMdXQ6QBaL3dgp85SNOB3hhbbRmROGoRlfMJgXAzAxll6p58K75cKoQBqK4VPSEKCrJp1xdiMCoIH%2BXg3plrvBbkT8GAVfcnvLIPG4V6yof3prNWDZqXXrDWTIKJXJD1zerGqoWeUeVQcfvA%2BEK6iV9724jP4M1jlYMFyykQ88%2FbreJ29hxGEqOcjsqKqHmjo7qhYaSiPcVAAu%2FbQWMnRXVGRouWAl1YL5Fdw37zCySVAle29JsPkauAm%2FpOUej%2Bl%2BQ9i4R1I5ip1xo606QUzbav4lb046KQpA%2BFbd0yvnmjnRixAo9h3DiGS6SQvAJ02Ey1BKfad1k5q7%2ByEJPIbclyKIimLFmC2xerQacCVgMT6bIhqKDpxu2PMUdWw%3D; xptwj=rq:cd30a255069773ff0dfc:EAYTpMyTaoe3+Qc8rQvirGuWJxt4sMp2Qbwyagz+dnpp3gUL2ECiLd2pj01LCvN1GlQCFEUPTWp/nQlVlF3K4t75v+RI6YfOQcp7voybj7SqYNi3URFOnYzrQA==; akavpau_p1=1666840604~id=168eb51251db8bec677054f21a882d99; xpm=0%2B1666840017%2BZV4XF19kqR87hp6NvYWKOU~4317c22b-5225-417f-bc33-66847d8fe66b%2B0; xptwg=475369177:2438795319205C0:5D547F9:73A82A6A:F5E46D44:2275C773:; TS012768cf=016ea84bd27f01df85f1d2d5641cca1e8cf729d33bc8965d7c7082c8842b28fa9a82e5a3e56f728568c99c71d02bf3d04f487c7712; TS01a90220=016ea84bd27f01df85f1d2d5641cca1e8cf729d33bc8965d7c7082c8842b28fa9a82e5a3e56f728568c99c71d02bf3d04f487c7712; TS2a5e0c5c027=08039d86dcab2000db4fce80708e1012e2ed0477c5d0950bdb606182f0946458b2bc7bf7d185c8ab08bdefe351113000ce8d0ce5e42711c9a638c7512bfde85117856612f1369c7b0415fc2ab04a0600b896322d72ee5c0677607c895dd05157' \
    -H 'device_profile_ref_id: iFp6Hi50uc-gNvplE2uA4NA0qnOlAN2G04Gj' \
    -H 'dnt: 1' \
    -H 'lists-device-type: desktop' \
    -H 'referer: https://www.walmart.com/lists/WL/'${array[1]}'' \
    -H 'sec-ch-ua: "Chromium";v="106", "Microsoft Edge";v="106", "Not;A=Brand";v="99"' \
    -H 'sec-ch-ua-mobile: ?0' \
    -H 'sec-ch-ua-platform: "macOS"' \
    -H 'sec-fetch-dest: empty' \
    -H 'sec-fetch-mode: cors' \
    -H 'sec-fetch-site: same-origin' \
    -H 'traceparent: 00-0caac733e3f765b78c104f28de4e6f55-93becfa1f9b57d0d-00' \
    -H 'user-agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/106.0.0.0 Safari/537.36 Edg/106.0.1370.52' \
    -H 'wm_mp: true' \
    -H 'wm_page_url: https://www.walmart.com/lists/WL/'${array[1]}'' \
    -H 'wm_qos.correlation_id: 5dS8voJ1Tux-5BPV5I_F_R1XWeM-AZYaYNtN' \
    -H 'x-apollo-operation-name: getListDetails' \
    -H 'x-enable-server-timing: 1' \
    -H 'x-latency-trace: 1' \
    -H 'x-o-bu: WALMART-US' \
    -H 'x-o-ccm: server' \
    -H 'x-o-correlation-id: 5dS8voJ1Tux-5BPV5I_F_R1XWeM-AZYaYNtN' \
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
        read -n 1 -p "blocked"
        echo 'sleep 5'
        sleep 5
      else
        echo $list | jq '.data.shoppingListDetails.items.listItems[].product.usItemId' >> ebay-usItemId.txt
        echo $list2 | jq '.data.shoppingListDetails.items.listItems[].product.usItemId' >> ebay-usItemId.txt
        echo $list | jq '.data.shoppingListDetails.items.listItems[].product.priceInfo.currentPrice.price' >> ebay-currentPrice.txt
        echo $list2 | jq '.data.shoppingListDetails.items.listItems[].product.priceInfo.currentPrice.price' >> ebay-currentPrice.txt
        echo $list | jq '.data.shoppingListDetails.items.listItems[].product.priceInfo.wasPrice.price' | sed 's/null//g' >> ebay-wasPrice.txt
        echo $list2 | jq '.data.shoppingListDetails.items.listItems[].product.priceInfo.wasPrice.price' | sed 's/null//g' >> ebay-wasPrice.txt
        echo $list | jq '.data.shoppingListDetails.items.listItems[].product.availabilityStatus' >> ebay-availabilityStatus.txt
        echo $list2 | jq '.data.shoppingListDetails.items.listItems[].product.availabilityStatus' >> ebay-availabilityStatus.txt
        echo ${array[0]}
        break
    fi
  done
done < input-wm-list-diff.txt

git add -A .
git commit -m --allow-empty
git push
git push origin HEAD -f
gitCommit=`git rev-parse HEAD`
linkGit=`echo https://raw.githubusercontent.com/DungSherlock/eBay/`$gitCommit`echo /`
linkApi=`echo https://script.google.com/macros/s/AKfycbz8KpKxkoZYQieBmAgWkgSvFjRmaX6XrmgZobjeMMrjltO2xbLVYBCXrIs9CodSEskRkA/exec?`
linkPost=$linkApi`echo Link ID==IMPORTDATA\(\"`$linkGit`echo ebay-usItemId.txt\"\)\&Giá hiện tại==IMPORTDATA\(\"`$linkGit`echo ebay-currentPrice.txt\"\)\&Trạng thái hàng==IMPORTDATA\(\"`$linkGit`echo ebay-availabilityStatus.txt\"\)\&Giá gốc==IMPORTDATA\(\"`$linkGit`echo ebay-wasPrice.txt\"\)`
echo $linkPost



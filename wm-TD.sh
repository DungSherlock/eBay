#!/bin/bash
# eval `ssh-agent -s`
git pull
: > wm-TD-usItemId.txt
: > wm-TD-currentPrice.txt
: > wm-TD-wasPrice.txt
: > wm-TD-availabilityStatus.txt
: > wm-TD-orderLimit.txt

# curl -C - -Ls https://script.google.com/macros/s/AKfycbxLSohHO4ZCfamg0195s7GB77CsXz20Xa_gVlrNhKvh3EToDMarPCtgNRcsXa6W09M4nA/exec | jq '.content.names[]' | sed 's/"//g' | sed 's/.*\///g' > wm-TD-list.txt

cookie='vtc=ZV4XF19kqR87hp6NvYWKOU; CID=4317c22b-5225-417f-bc33-66847d8fe66b; hasCID=1; type=REGISTERED; customer=%7B%22firstName%22%3A%22Dung%22%2C%22lastNameInitial%22%3A%22D%22%7D; _m=9; _pxvid=b53b4e32-559d-11ed-b409-654a64435159; dimensionData=945; SPID=2b1e79311f9f4458e4e7d273218bd2281a67a19c7c65e3f0585183b0fe65d2d82e572a1141b9aed67e19ca9b2ab7e48cwmart; g=1; _sp_id.ad94=7e93d7be-379a-4c09-b03d-8602e64d9df1.1672191400.2.1680338260.1672191401.c2cfe04a-7222-4c56-9d33-05312067970c; _vc=jg%2FqNdJcplr1yZ0awAeHZi4BfiSrquCjY3jVDz%2Bp9PQ%3D; abqme=true; _pxhd=bf8d63c794f7086339958e68548ab23a092ec2021c963c5ecc12453ce2386607:b53b4e32-559d-11ed-b409-b1f43a4e2b7f; TBV=7; akehab=ipctrl; AID=wmlspartner%3D0%3Areflectorid%3D0000000000000000000000%3Alastupd%3D1687860419123; userAppVersion=main-1.81.0-f787e7-0622T1507; adblocked=true; akavpau_p2=1687901887~id=6e7d48dde10297bd8ba9a4298db5c163; auth=MTAyOTYyMDE4EoLi71GU904F%2Bl97x8R4%2B6w8cb%2F6co7%2BAxbK9YgJF1LMcR%2FMdXQ6QBaL3dgp85SNOB3hhbbRmROGoRlfMJgXAzAxll6p58K75cKoQBqK4VPSEKCrJp1xdiMCoIH%2BXg3plrvBbkT8GAVfcnvLIPG4VzUsaEIK3J2L3XZg8Dom%2BHWfOprqUAvnyOSvF8JSnbYZSiGAHS9wJYWnfu1KqfRXLw88%2FbreJ29hxGEqOcjsqKqHmjo7qhYaSiPcVAAu%2FbQWMnRXVGRouWAl1YL5Fdw372PnVlfrEZcQ62eR2S3yTaAej%2Bl%2BQ9i4R1I5ip1xo606RztMTES088EMkAwceRI7TodjsLIB9oxGalnUqwrtKuCQcbCa773B7Tuhi4IpCH4FFatHeW9oyRDNEKmHU6RZ5ZqCAeNRK73xvOtmrIKcpk8%3D; _tsc=MTQyODYyMDIyGzWa%2BoODfqN8L2UvYFDGzmsC%2BFveQt8eQ9%2FcNS0u%2BH7Jkfxzq9MQkxS7qm8MBNxGXEBxZl4LNqmdrJLgdKW8ozW83XUSj63%2FXi1oVZxNP45kYYwLHQona4z2mxIMydqGd6sg1F52uFShTy2YDISUFndxZT%2FYS2GF75nmHu9Z9EzwVrf7FQyuL88mpXcktYxU8v5NMvAL5qORSCnCLYbAYgYCMBNnhW%2B%2FIsoHIyPrjwLrHbI%2BfxdjdWABH9YpR9PaMDwr0WMUVPz0Pw9QuhYARKOFZ5Fd18z%2B%2BFB4bayLSfNPCwi%2B6YIHlqb1PsUC%2FyVF3WPneerAZuJ0gvkOP8U5qPXPayHNTbQOuBZyITquXMSBhZ8aNz0nI%2F46En%2Be23E4Q1Xw5t2Ws8rv0UM9IpeKR47zBVyuk9gEep%2FXtWFtlj1AWdEg6XhILqXk4jFN04OMJijsbA%3D%3D; locDataV3=eyJpc0RlZmF1bHRlZCI6ZmFsc2UsImlzRXhwbGljaXQiOmZhbHNlLCJpbnRlbnQiOiJTSElQUElORyIsInBpY2t1cCI6W3siYnVJZCI6IjAiLCJub2RlSWQiOiIyOTAzIiwiZGlzcGxheU5hbWUiOiJDaGVsbXNmb3JkIFN0b3JlIiwibm9kZVR5cGUiOiJTVE9SRSIsImFkZHJlc3MiOnsicG9zdGFsQ29kZSI6IjAxODI0IiwiYWRkcmVzc0xpbmUxIjoiNjYgUGFya2h1cnN0IFJkIiwiY2l0eSI6IkNoZWxtc2ZvcmQiLCJzdGF0ZSI6Ik1BIiwiY291bnRyeSI6IlVTIiwicG9zdGFsQ29kZTkiOiIwMTgyNC0xNTA4In0sImdlb1BvaW50Ijp7ImxhdGl0dWRlIjo0Mi42MjI4NTIsImxvbmdpdHVkZSI6LTcxLjM2MDc0Mn0sImlzR2xhc3NFbmFibGVkIjp0cnVlLCJzY2hlZHVsZWRFbmFibGVkIjp0cnVlLCJ1blNjaGVkdWxlZEVuYWJsZWQiOnRydWUsImh1Yk5vZGVJZCI6IjI5MDMiLCJzdG9yZUhycyI6IjA2OjAwLTIzOjAwIiwic3VwcG9ydGVkQWNjZXNzVHlwZXMiOlsiUElDS1VQX0NVUkJTSURFIiwiUElDS1VQX0lOU1RPUkUiXX1dLCJzaGlwcGluZ0FkZHJlc3MiOnsiaWQiOiIzN2ZlOGMwMS0wNjc5LTRkOGUtOGFiMS1iMDAxZDNjZGI5ZGQiLCJhZGRyZXNzTGluZU9uZSI6IjQzMCBUZXh0aWxlIEF2ZSIsImxhdGl0dWRlIjo0Mi42NjAzNywibG9uZ2l0dWRlIjotNzEuMzM3NzM5LCJwb3N0YWxDb2RlIjoiMDE4MjY0NDI3IiwiY2l0eSI6IkRyYWN1dCIsInN0YXRlIjoiTUEiLCJjb3VudHJ5Q29kZSI6IlVTQSIsImlzQXBvRnBvIjpmYWxzZSwiaXNQb0JveCI6ZmFsc2UsImFkZHJlc3NUeXBlIjoiUkVTSURFTlRJQUwiLCJsb2NhdGlvbkFjY3VyYWN5IjoiaGlnaCIsIm1vZGlmaWVkRGF0ZSI6MTY1NDY3MTA5NzAzNywiZ2lmdEFkZHJlc3MiOmZhbHNlLCJmaXJzdE5hbWUiOiJUZXh0aWxlIiwibGFzdE5hbWUiOiJBdmUifSwiYXNzb3J0bWVudCI6eyJub2RlSWQiOiIyOTAzIiwiZGlzcGxheU5hbWUiOiJDaGVsbXNmb3JkIFN0b3JlIiwiaW50ZW50IjoiUElDS1VQIn0sImluc3RvcmUiOmZhbHNlLCJkZWxpdmVyeSI6eyJidUlkIjoiMCIsIm5vZGVJZCI6IjI5MDMiLCJkaXNwbGF5TmFtZSI6IkNoZWxtc2ZvcmQgU3RvcmUiLCJub2RlVHlwZSI6IlNUT1JFIiwiYWRkcmVzcyI6eyJwb3N0YWxDb2RlIjoiMDE4MjQiLCJhZGRyZXNzTGluZTEiOiI2NiBQYXJraHVyc3QgUmQiLCJjaXR5IjoiQ2hlbG1zZm9yZCIsInN0YXRlIjoiTUEiLCJjb3VudHJ5IjoiVVMiLCJwb3N0YWxDb2RlOSI6IjAxODI0LTE1MDgifSwiZ2VvUG9pbnQiOnsibGF0aXR1ZGUiOjQyLjYyMjg1MiwibG9uZ2l0dWRlIjotNzEuMzYwNzQyfSwiaXNHbGFzc0VuYWJsZWQiOnRydWUsInNjaGVkdWxlZEVuYWJsZWQiOnRydWUsInVuU2NoZWR1bGVkRW5hYmxlZCI6dHJ1ZSwiYWNjZXNzUG9pbnRzIjpbeyJhY2Nlc3NUeXBlIjoiREVMSVZFUllfQUREUkVTUyJ9XSwiaHViTm9kZUlkIjoiMjkwMyIsImlzRXhwcmVzc0RlbGl2ZXJ5T25seSI6ZmFsc2UsInN1cHBvcnRlZEFjY2Vzc1R5cGVzIjpbIkRFTElWRVJZX0FERFJFU1MiXSwic2VsZWN0aW9uVHlwZSI6IkxTX1NFTEVDVEVEIn0sInJlZnJlc2hBdCI6MTY4ODAwNjQ2MTA5NiwidmFsaWRhdGVLZXkiOiJwcm9kOnYyOjQzMTdjMjJiLTUyMjUtNDE3Zi1iYzMzLTY2ODQ3ZDhmZTY2YiJ9; assortmentStoreId=2903; hasLocData=1; bstc=VDl44cOYEEREHca7Xx2pqA; mobileweb=0; xpth=x-o-mart%2BB2C~x-o-mverified%2Bfalse; xpa=0Iadf|0KA3-|0uTG6|2SeeK|2X-gH|2c-Ep|341Uk|3K-KJ|3caIW|4CECO|5M-UN|5e9Fg|8cYMq|8oGja|9-5I8|AZbwv|Aj49u|BukPC|CLzBA|DcdL-|Du0vv|Edk-I|FjLG1|FkMr1|GmDfi|GycPV|IRAHO|IhmrE|KvYZX|Md9jg|N0ixq|N6Yhp|O4zXd|OFXXb|OMi7h|OpwGp|SoVwe|TWhvb|U3NAT|VDAFc|WYyPr|YnYws|ZEhBK|ZgSVh|_uNDy|a_rrh|dayNl|eM5JI|gjQMr|jUBiS|jyp9o|mCT_N|pcXyb|q7xXt|u2iCd|v4Ppy|vK1I8|wXvq0|xTsTj; exp-ck=0Iadf10uTG612SeeK12X-gH1341Uk13caIW25M-UN18cYMq19-5I81BukPC1Du0vv1FjLG11FkMr11GmDfi2GycPV1IRAHO1KvYZX1N6Yhp2O4zXd1OMi7h2TWhvb1VDAFc1YnYws4ZgSVh1_uNDy1a_rrh2eM5JI1mCT_N1pcXyb1u2iCd1v4Ppy2vK1I81; _astc=1f28d6717b5fa189c72e31c112ff28e1; xptc=assortmentStoreId%2B2903; xpm=1%2B1688002864%2BZV4XF19kqR87hp6NvYWKOU~4317c22b-5225-417f-bc33-66847d8fe66b%2B0; bm_mi=A55151655B3272E18DFBDB56C5A56007~YAAQqhBFdgSylwOJAQAADvzRBBQVRrEcVIAlBv6xvDWuDbcYYfpeTYtZQuaUXDyPJBF7qAGR9DcnhBy2FGFjyy7yvpICP5IyGHSzvijxz0JuHZHGuEn2kdT8JHU87sTgCesGs4tG3PG5yrjDATgpTaDupVAZOp3WyZyLKNhkdztu+iTQJLGCy+FMLxgOhfLyoKJgcdWdZf/y7UsCK9Y5D+zfJfCQJvo4HSTnbJhNu3ls4KFFUIT6rBLlYcPG/2XVIx3hQsVFcho+DHHUVaLXtrDksTW/kAF6rVXZNQD7kmvzK9dICqi3n6Ep6PL7k2dubnRQgvkHg/wlFXOTbV7/hRdrSF5HLV7QdjkoV+HANlfDQuqWKNPh0pxXQ/ATAfp2xrz9~1; bm_sv=B9026E437FBF74FE613749C38B47516B~YAAQqhBFdhqylwOJAQAAIwPSBBQx9MX3DVWTdQ+PBEg85PnwuPTJEn9mgM8zOARVWOJcc8BPUV0g2e8cAcTeocx+roHvZ8CRXBx8k+3q1PtW80mDa0V1NAHXPEDC6GNL0yAQVyOKxakI5z7PGtwnJbkIzmC9fvbe/baqdvoCjUYIhKMjg/KLD+Xj/Lga+Z9gktSuWgskTVVIJYAHyYhx/n/9gZAog8CFfsdAQqb4uNXMVKBkCgfhqBqXB6K3eAO+fw==~1; com.wm.reflector="reflectorid:0000000000000000000000@lastupd:1688003142797@firstcreate:1678157996592"; _lat=32bd688450ec7fb26c5b556671a51e45wmcxo; userContext=eyJhZGRyZXNzRGF0YSI6bnVsbCwiaGFzSXRlbVN1YnNjcmlwdGlvbiI6ZmFsc2UsImhhc01lbWJlcnNoaXBJbmZvIjpmYWxzZSwiaXNEZWZhdWx0IjpmYWxzZSwicGF5bWVudERhdGEiOnsiY2FwaXRhbE9uZUJhbm5lclNub296ZVRTIjoxNjgxMDk2NTczNjI0LCJoYXNDYXBPbmUiOmZhbHNlLCJoYXNDYXBPbmVMaW5rZWQiOmZhbHNlLCJoYXNDcmVkaXRDYXJkIjpmYWxzZSwiaGFzRGlyZWN0ZWRTcGVuZENhcmQiOmZhbHNlLCJoYXNFQlQiOmZhbHNlLCJoYXNHaWZ0Q2FyZCI6ZmFsc2UsInNob3dDYXBPbmVCYW5uZXIiOnRydWUsIndwbHVzTm9CZW5lZml0QmFubmVyIjp0cnVlLCJwYXltZW50TWV0aG9kVGFncyI6W10sImhhc1BheXBhbEJBIjpmYWxzZX0sInByb2ZpbGVEYXRhIjp7ImlzQXNzb2NpYXRlIjpmYWxzZSwiaXNUZXN0QWNjb3VudCI6ZmFsc2UsImN1c3RvbWVyVHlwZSI6IklORElWSURVQUwiLCJtZW1iZXJzaGlwT3B0SW4iOnsiaXNPcHRlZEluIjpmYWxzZSwib3B0ZWRJbkF0dHJpYnV0ZUlkIjoiNjQyMGJiNDYtNDYwNi00MjY1LThiZTctODY4YTIxMTcwMjE0In19LCJzaG93U2lnblVwU3BsYXNoIjpmYWxzZX0%3D; xptwg=907138869:9EA54E8E0E2358:193A8CA:27E0B310:73578A85:83A5375C:; xptwj=qq:4a1ef34bd00e29d9bf03:e+oK2QaTyHsFiuhBC2yyvz6kD2BaoHI2yFJL777FPusJtRiyWgupMZfuDMdBBGwPWmibrKtOwOiH+M3Fpt06i8/1ZPUhsReTUsc/BnlV9EHq7GYo3i/1qqWW+2wLu+s1ttwbL873HyFRgmb1TrUtKAt/ctycr04aRw1CTER0M/MNvcviGtIOabS/HVAM+DEtXNHMQfmVZNNDWI8FWViqAYlO; TS012768cf=014dff5a5d1c6496db2a209ba76ccaacb7f75ec042e2aa9301700f382a4b227222c4c33941e043ece0b34204b490d0717be2726583; TS01a90220=014dff5a5d1c6496db2a209ba76ccaacb7f75ec042e2aa9301700f382a4b227222c4c33941e043ece0b34204b490d0717be2726583; TS2a5e0c5c027=085ea3cd67ab20002fb92d63bb39fa23fa7076b6bf95e19ed59ed5fc1b4d0f9cc3bc2cea14655b6908a3d98d451130004af65e3dd715f4c745e53df11a0ce502332aabad42752c2b40431499bc17565fc65eeb55216f27bd2cb82497c863e8fb; ak_bmsc=02CBD5D96AE109188EF78787308160F6~000000000000000000000000000000~YAAQsxBFdkjDSAOJAQAA+ufTBBQmLItMNEEc7NIH0Ibnc3eK5p3hwwkxCc8g02KtJZbf0uqJ1C7Q6Q510Q6N+EYN5KtORaxBlGpFtsh2mi2g27lvX43QcOfUjzBGG125wgOCg9cRrsdZ/gkwUd94ZhXIISp41vFoDseRDNlC58RB1FWhPxcASoQW1iNsw+Ucn1bw73tgGup03JnqunttAgkZgHN71R2vbdJEnlezYKUnS6lC+jzsCLvbu8LZL7JJ/LCLt05CU0Rb111rBIQZiGeCzUCV3Dhe2svs37YBmggvnn8ixz0v3EkDyPYM9mqZMf7kb/ILH9xXJJIKNjH68yEZ9s67FcV3DnKry+AsgCc/jPFj8x0iuxd04XhN8Eagwj9YUjfF3ObBufQzE0nBbkeUV+FlUzqOZqU/K2ZhZkDM9/eW8Fvc0441nqXvAYVVqvn/Uks/ftdDCjkXR7wGuqdmaNyeF3emEz3JV59w4G/KeAtWXA=='

while read line
do
  # array=(${line//|/ })
  while true
  do
    list=`curl -C - -Ls 'https://www.walmart.com/orchestra/home/graphql/getListDetails/4fb20c34987f00ecdbbf4f388b7ddc80a70519f2d9f87c615b59f71834124dcd?variables=%7B%22input%22%3A%7B%22id%22%3A%22'$line'%22%2C%22listType%22%3A%22WL%22%2C%22pagination%22%3A%7B%22page%22%3A1%2C%22pageSize%22%3A1%7D%2C%22sortOrder%22%3A%22DEFAULT%22%2C%22maxItems%22%3Atrue%2C%22skipGeneric%22%3Atrue%2C%22permission%22%3A%22VIEW%22%7D%7D' \
  -H 'authority: www.walmart.com' \
  -H 'cookie: '$cookie'' \
  -H 'accept: application/json' \
  -H 'accept-language: vi' \
  -H 'content-type: application/json' \
  -H 'dnt: 1' \
  -H 'lists-device-type: desktop' \
  -H 'referer: https://www.walmart.com/lists/shared/WL/'$line'' \
  -H 'sec-ch-ua-mobile: ?0' \
  -H 'sec-ch-ua-platform: "macOS"' \
  -H 'sec-fetch-dest: empty' \
  -H 'sec-fetch-mode: cors' \
  -H 'sec-fetch-site: same-origin' \
  -H 'user-agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/114.0.0.0 Safari/537.36 Edg/114.0.1823.43' \
  -H 'wm_mp: true' \
  -H 'wm_page_url: https://www.walmart.com/lists/shared/WL/'$line'' \
  -H 'x-apollo-operation-name: getListDetails' \
  -H 'x-enable-server-timing: 1' \
  -H 'x-latency-trace: 1' \
  -H 'x-o-bu: WALMART-US' \
  -H 'x-o-ccm: server' \
  -H 'x-o-gql-query: query getListDetails' \
  -H 'x-o-mart: B2C' \
  -H 'x-o-platform: rweb' \
  -H 'x-o-platform-version: main-1.26.0-be17f7' \
  -H 'x-o-segment: oaoh' \
  --compressed`

    list2=`curl -C - -Ls 'https://www.walmart.com/orchestra/home/graphql/getListDetails/4fb20c34987f00ecdbbf4f388b7ddc80a70519f2d9f87c615b59f71834124dcd?variables=%7B%22input%22%3A%7B%22id%22%3A%22'$line'%22%2C%22listType%22%3A%22WL%22%2C%22pagination%22%3A%7B%22page%22%3A2%2C%22pageSize%22%3A1%7D%2C%22sortOrder%22%3A%22DEFAULT%22%2C%22maxItems%22%3Atrue%2C%22skipGeneric%22%3Atrue%2C%22permission%22%3A%22VIEW%22%7D%7D' \
  -H 'authority: www.walmart.com' \
  -H 'cookie: '$cookie'' \
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
  -H 'user-agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/114.0.0.0 Safari/537.36 Edg/114.0.1823.43' \
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
        echo $list | jq '.data.shoppingListDetails.items.listItems[].product.usItemId' >> wm-TD-usItemId.txt
        echo $list2 | jq '.data.shoppingListDetails.items.listItems[].product.usItemId' >> wm-TD-usItemId.txt
        echo $list | jq '.data.shoppingListDetails.items.listItems[].product.priceInfo.currentPrice.price' >> wm-TD-currentPrice.txt
        echo $list2 | jq '.data.shoppingListDetails.items.listItems[].product.priceInfo.currentPrice.price' >> wm-TD-currentPrice.txt
        echo $list | jq '.data.shoppingListDetails.items.listItems[].product.priceInfo.wasPrice.price' | sed 's/null//g' >> wm-TD-wasPrice.txt
        echo $list2 | jq '.data.shoppingListDetails.items.listItems[].product.priceInfo.wasPrice.price' | sed 's/null//g' >> wm-TD-wasPrice.txt
        echo $list | jq '.data.shoppingListDetails.items.listItems[].product.availabilityStatus' >> wm-TD-availabilityStatus.txt
        echo $list2 | jq '.data.shoppingListDetails.items.listItems[].product.availabilityStatus' >> wm-TD-availabilityStatus.txt
        echo $list | jq '.data.shoppingListDetails.items.listItems[].product.orderLimit' >> wm-TD-orderLimit.txt
        echo $list2 | jq '.data.shoppingListDetails.items.listItems[].product.orderLimit' >> wm-TD-orderLimit.txt
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
apiTD=`echo https://script.google.com/macros/s/AKfycbwjeDgCI1EMcwOCQoOqeIKyTa2zHJ3UOfGru0J_RfnHPjjQNaCYbsg1bX9q_8kL0k7ANQ/exec?`
apiFLY=`echo https://script.google.com/macros/s/AKfycbws0w4cG4jntUsWOBzKcy-2PM_vFKojfLtSyOVhp8PMbr4L3YXzpNZYDLb8ygS2WwBMQQ/exec?`
linkPostTD=$apiTD`echo LinkID==IMPORTDATA\(\"`$linkGit`echo wm-TD-usItemId.txt\"\)\
\&GiaHienTai==IMPORTDATA\(\"`$linkGit`echo wm-TD-currentPrice.txt\"\)\
\&TrangThaiHang==IMPORTDATA\(\"`$linkGit`echo wm-TD-availabilityStatus.txt\"\)\
\&Quantity==IMPORTDATA\(\"`$linkGit`echo wm-TD-orderLimit.txt\"\)
`
linkPostFLY=$apiFLY`echo LinkID==IMPORTDATA\(\"`$linkGit`echo wm-TD-usItemId.txt\"\)\
\&GiaHienTai==IMPORTDATA\(\"`$linkGit`echo wm-TD-currentPrice.txt\"\)\
\&TrangThaiHang==IMPORTDATA\(\"`$linkGit`echo wm-TD-availabilityStatus.txt\"\)\
\&Quantity==IMPORTDATA\(\"`$linkGit`echo wm-TD-orderLimit.txt\"\)
`

echo '[InternetShortcut]\
URL='$linkPostTD > wm-TD.url
open wm-TD.url
open https://app.clickup.com/9008002310/v/b/7-9008002310-2

echo '[InternetShortcut]\
URL='$linkPostFLY > wm-FLY.url
open wm-FLY.url
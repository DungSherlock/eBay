#!/bin/bash
# eval `ssh-agent -s`
# git pull
# : > wm-TD-usItemId.txt
# : > wm-TD-currentPrice.txt
# : > wm-TD-wasPrice.txt
# : > wm-TD-availabilityStatus.txt
# : > wm-TD-orderLimit.txt

topic_id="10"
lesson_id="83"


lessons=`curl -sH "Host: tofu.stepup.edu.vn" -H "Accept: application/json" -H "User-Agent: tofuapp/1712053268 CFNetwork/1496.0.7 Darwin/23.5.0" -H "Accept-Language: vi-VN,vi;q=0.9" -H "Authorization: Bearer eyJhbGciOiJIUzUxMiJ9.eyJzdWIiOiIwOTc5MjczNTA3IiwiYXV0aG9yaXRpZXMiOlsiUk9MRV9VU0VSIl0sInVzZXJfaWQiOjg3OTY1NCwidXNlcm5hbWUiOiJIdeG7hyBExaluZyIsImp0aSI6ImoyR2xNVzZTSTJPM2FiR3hLaE5YV184Nzk2NTQiLCJpYXQiOjE3MTQ3NTc1MDAsImV4cCI6MjAzMDExNzUwMH0.kyeFhFDXXBRC1H5V2P629O6Gnrw6VDKGWRPzqZ3jQCcLJLeo-aAkdBnCDZIXyn4bRdiouW6DK81Y0b_lYp7oVg" --compressed "https://tofu.stepup.edu.vn/tofu/api/v1/communicate/lessons?app_user_id=879654&app_device_id=C52416BE-6D71-4156-8D23-2483BC850836&app_v=2.0.7&platform=ios-17.5.1&device_id=C52416BE-6D71-4156-8D23-2483BC850836&topic_id=$topic_id"`

echo $lessons | jq '.data.lessons[] | {description, lesson_id, name_en}'


outline=`curl -sH "Host: tofu.stepup.edu.vn" -H "Accept: application/json" -H "User-Agent: tofuapp/1712053268 CFNetwork/1496.0.7 Darwin/23.5.0" -H "Accept-Language: vi-VN,vi;q=0.9" -H "Authorization: Bearer eyJhbGciOiJIUzUxMiJ9.eyJzdWIiOiIwOTc5MjczNTA3IiwiYXV0aG9yaXRpZXMiOlsiUk9MRV9VU0VSIl0sInVzZXJfaWQiOjg3OTY1NCwidXNlcm5hbWUiOiJIdeG7hyBExaluZyIsImp0aSI6ImoyR2xNVzZTSTJPM2FiR3hLaE5YV184Nzk2NTQiLCJpYXQiOjE3MTQ3NTc1MDAsImV4cCI6MjAzMDExNzUwMH0.kyeFhFDXXBRC1H5V2P629O6Gnrw6VDKGWRPzqZ3jQCcLJLeo-aAkdBnCDZIXyn4bRdiouW6DK81Y0b_lYp7oVg" --compressed "https://tofu.stepup.edu.vn/tofu/api/v1/communicate/lesson_outline?app_user_id=879654&app_device_id=C52416BE-6D71-4156-8D23-2483BC850836&app_v=2.0.7&platform=ios-17.5.1&lesson_id=$lesson_id&device_id=C52416BE-6D71-4156-8D23-2483BC850836"`

basic=`curl -sH "Host: tofu.stepup.edu.vn" -H "Accept: application/json" -H "User-Agent: tofuapp/1712053268 CFNetwork/1496.0.7 Darwin/23.5.0" -H "Accept-Language: vi-VN,vi;q=0.9" -H "Authorization: Bearer eyJhbGciOiJIUzUxMiJ9.eyJzdWIiOiIwOTc5MjczNTA3IiwiYXV0aG9yaXRpZXMiOlsiUk9MRV9VU0VSIl0sInVzZXJfaWQiOjg3OTY1NCwidXNlcm5hbWUiOiJIdeG7hyBExaluZyIsImp0aSI6ImoyR2xNVzZTSTJPM2FiR3hLaE5YV184Nzk2NTQiLCJpYXQiOjE3MTQ3NTc1MDAsImV4cCI6MjAzMDExNzUwMH0.kyeFhFDXXBRC1H5V2P629O6Gnrw6VDKGWRPzqZ3jQCcLJLeo-aAkdBnCDZIXyn4bRdiouW6DK81Y0b_lYp7oVg" --compressed "https://tofu.stepup.edu.vn/tofu/api/v1/communicate/lesson_detail_data?app_user_id=879654&app_device_id=C52416BE-6D71-4156-8D23-2483BC850836&app_v=2.0.7&platform=ios-17.5.1&device_id=C52416BE-6D71-4156-8D23-2483BC850836&lesson_id=$lesson_id&learn_type=BASIC"`

extend=`curl -sH "Host: tofu.stepup.edu.vn" -H "Accept: application/json" -H "User-Agent: tofuapp/1712053268 CFNetwork/1496.0.7 Darwin/23.5.0" -H "Accept-Language: vi-VN,vi;q=0.9" -H "Authorization: Bearer eyJhbGciOiJIUzUxMiJ9.eyJzdWIiOiIwOTc5MjczNTA3IiwiYXV0aG9yaXRpZXMiOlsiUk9MRV9VU0VSIl0sInVzZXJfaWQiOjg3OTY1NCwidXNlcm5hbWUiOiJIdeG7hyBExaluZyIsImp0aSI6ImoyR2xNVzZTSTJPM2FiR3hLaE5YV184Nzk2NTQiLCJpYXQiOjE3MTQ3NTc1MDAsImV4cCI6MjAzMDExNzUwMH0.kyeFhFDXXBRC1H5V2P629O6Gnrw6VDKGWRPzqZ3jQCcLJLeo-aAkdBnCDZIXyn4bRdiouW6DK81Y0b_lYp7oVg" --compressed "https://tofu.stepup.edu.vn/tofu/api/v1/communicate/lesson_detail_data?app_user_id=879654&app_device_id=C52416BE-6D71-4156-8D23-2483BC850836&app_v=2.0.7&platform=ios-17.5.1&device_id=C52416BE-6D71-4156-8D23-2483BC850836&lesson_id=$lesson_id&learn_type=EXTEND"`


#outline
echo $outline | jq '.data.lesson_details[].data.tasks[] | select(.task_description == "NẠP CỤM") | .task_details[] | {'lesson_id_$lesson_id': .null, typeOutline_NAP_CUM: .null, en: .sentence_en, ipa: .ipa, vi: .sentence_vi, audio: .audio}'
echo $outline | jq '.data.lesson_details[].data.tasks[] | select(.task_description == "GHÉP CÂU") | .task_details[] | {typeOutline_GHEP_CAU: .null, en: .sentence_en, ipa: .ipa, vi: .sentence_vi, audio: .audio}'

# #basic
echo $basic | jq '.data.lesson_details[] | select(.type == "FLEXIBLE_PHRASE") | .data | {typeBasic_FLEXIBLE_PHRASE: .null, en: .sentence_en, ipa: .ipa, vi: .sentence_vi, audio: .sentence_audio_speaker}'
echo $basic | jq '.data.lesson_details[] | select(.type == "EXTEND_IDEA_QNA") | .data.messages[] | select(.type == "text") | {typeBasic_EXTEND_IDEA_QNA: .null, en: .content, ipa: .ipa, vi: .sentence_vi, audio: .audio}'
echo $basic | jq '.data.lesson_details[] | select(.type == "LEARNING_CARD") | .data | {typeBasic_LEARNING_CARD: .null, en: .sentence_en, ipa: .ipa, vi: .sentence_vi, audio: .sentence_audio}'

#extend
echo $extend | jq '.data.lesson_details[] | select(.type == "SPEAKING_WORD") | .data | {typeExtend_SPEAKING_WORD: .null, en: .word, ipa: .pronunciation, vi: .meaning_vi, audio: .audio}'
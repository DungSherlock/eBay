#!/bin/bash

# Thay đổi đường dẫn URL của trang web cần tải về và khóa người dùng
url=`https://script.google.com/macros/s/AKfycbxGrlzQU4LxH9VrPonQwYY3BtD25ILuHOFYDPSmGVesSRMJOXuA0KfUppq4AaTAqCU6/exec?Item ID==IMPORTDATA("https://raw.githubusercontent.com/DungSherlock/eBay/73a4d70d0a088be9d0e125dc9ab7b0d11d806ba8/track-Hiep-usItemId-CO.txt")&Giá==IMPORTDATA("https://raw.githubusercontent.com/DungSherlock/eBay/73a4d70d0a088be9d0e125dc9ab7b0d11d806ba8/track-Hiep-priceValue-CO.txt")&Tên==IMPORTDATA("https://raw.githubusercontent.com/DungSherlock/eBay/73a4d70d0a088be9d0e125dc9ab7b0d11d806ba8/track-Hiep-fullName-CO.txt")&Địa chỉ==index(IMPORTDATA("https://raw.githubusercontent.com/DungSherlock/eBay/73a4d70d0a088be9d0e125dc9ab7b0d11d806ba8/track-Hiep-address-CO.txt"),,1)&Status==IMPORTDATA("https://raw.githubusercontent.com/DungSherlock/eBay/73a4d70d0a088be9d0e125dc9ab7b0d11d806ba8/track-Hiep-status-CO.txt")&Tracking Number==IMPORTDATA("https://raw.githubusercontent.com/DungSherlock/eBay/73a4d70d0a088be9d0e125dc9ab7b0d11d806ba8/track-Hiep-number-CO.txt")&Tracking URL==IMPORTDATA("https://raw.githubusercontent.com/DungSherlock/eBay/73a4d70d0a088be9d0e125dc9ab7b0d11d806ba8/track-Hiep-url-CO.txt")&Email==IMPORTDATA("https://raw.githubusercontent.com/DungSherlock/eBay/73a4d70d0a088be9d0e125dc9ab7b0d11d806ba8/track-Hiep-email-CO.txt")&Order==IMPORTDATA("https://raw.githubusercontent.com/DungSherlock/eBay/73a4d70d0a088be9d0e125dc9ab7b0d11d806ba8/track-Hiep-OrderID-CO.txt")&categoriesType==IMPORTDATA("https://raw.githubusercontent.com/DungSherlock/eBay/73a4d70d0a088be9d0e125dc9ab7b0d11d806ba8/track-Hiep-categoriesType-CO.txt")`

key="abcd1234"

# Tải nội dung trang web về và lưu vào biến content
content=$(curl -s "$url")

# Trích xuất mã thông báo từ nội dung trang web
content_key=$(echo "$content" | grep -oP 'user_content_key=.*?"' | awk -F= '{print $2}' | sed 's/"//g')

# Tạo chuỗi link content và key
link="https://script.googleusercontent.com/macros/echo?user_content_key=$content_key&$key"

echo $link

#!/bin/bash
link=`https://script.google.com/macros/s/AKfycbxvgB0cMGKRjx_sVCDTrrzTkT40YIeRPsBUp-1-e913NLyI8mUywjiaGDu9MDj9bChN/exec?Item ID==IMPORTDATA("https://raw.githubusercontent.com/DungSherlock/eBay/785379a43e75acbb4bdc1f44371d29233c62414f/track-usItemId-CO.txt")&Giá==IMPORTDATA("https://raw.githubusercontent.com/DungSherlock/eBay/785379a43e75acbb4bdc1f44371d29233c62414f/track-priceValue-CO.txt")&Tên==IMPORTDATA("https://raw.githubusercontent.com/DungSherlock/eBay/785379a43e75acbb4bdc1f44371d29233c62414f/track-fullName-CO.txt")&Địa chỉ==index(IMPORTDATA("https://raw.githubusercontent.com/DungSherlock/eBay/785379a43e75acbb4bdc1f44371d29233c62414f/track-address-CO.txt"),,1)&Status==IMPORTDATA("https://raw.githubusercontent.com/DungSherlock/eBay/785379a43e75acbb4bdc1f44371d29233c62414f/track-status-CO.txt")&Tracking Number==IMPORTDATA("https://raw.githubusercontent.com/DungSherlock/eBay/785379a43e75acbb4bdc1f44371d29233c62414f/track-number-CO.txt")&Tracking URL==IMPORTDATA("https://raw.githubusercontent.com/DungSherlock/eBay/785379a43e75acbb4bdc1f44371d29233c62414f/track-url-CO.txt")&Email==IMPORTDATA("https://raw.githubusercontent.com/DungSherlock/eBay/785379a43e75acbb4bdc1f44371d29233c62414f/track-email-CO.txt")&Order==IMPORTDATA("https://raw.githubusercontent.com/DungSherlock/eBay/785379a43e75acbb4bdc1f44371d29233c62414f/track-OrderID-CO.txt")&categoriesType==IMPORTDATA("https://raw.githubusercontent.com/DungSherlock/eBay/785379a43e75acbb4bdc1f44371d29233c62414f/track-categoriesType-CO.txt")`
echo $link
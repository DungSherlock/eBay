#!/bin/bash
git pull
: > track-usItemId-TD.txt
: > track-priceValue-TD.txt
: > track-fullName-TD.txt
: > track-address-TD.txt
: > track-status-TD.txt
: > track-number-TD.txt
: > track-url-TD.txt
: > track-OrderID-TD.txt
: > track-email-TD.txt
: > track-categoriesType-TD.txt
: > track-CO-TD.txt

while read line
do
  array0=(${line// /$})
  array=(${array0//|/ })
  while true
    do
    curl=`curl -s 'https://www.walmart.com/orchestra/home/graphql' \
      -H 'authority: www.walmart.com' \
      -H 'sec-ch-ua: " Not;A Brand";v="99", "Microsoft Edge";v="97", "Chromium";v="97"' \
      -H 'x-o-platform: rweb' \
      -H 'dnt: 1' \
      -H 'x-o-TDrrelation-id: pn9BnlEx0zDiyvRGJ6nL5BS9pDN7erB017Nf' \
      -H 'device_profile_ref_id: E75qSsFMPUgfUnNtpgnTkFKD0ikbbLGTuMXJ' \
      -H 'x-latency-trace: 1' \
      -H 'wm_mp: true' \
      -H 'x-o-market: us' \
      -H 'x-o-platform-version: main-347-5e3156' \
      -H 'x-o-gql-query: query getGuestOrder' \
      -H 'wm_page_url: https://www.walmart.com/orders' \
      -H 'x-apollo-operation-name: getGuestOrder' \
      -H 'sec-ch-ua-platform: "macOS"' \
      -H 'sec-ch-ua-mobile: ?0' \
      -H 'user-agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/101.0.4951.64 Safari/537.36 Edg/101.0.1210.53' \
      -H 'x-o-segment: oaoh' \
      -H 'content-type: application/json' \
      -H 'accept: application/json' \
      -H 'x-enable-server-timing: 1' \
      -H 'x-o-ccm: server' \
      -H 'wm_qos.correlation_id: pn9BnlEx0zDiyvRGJ6nL5BS9pDN7erB017Nf' \
      -H 'origin: https://www.walmart.com' \
      -H 'sec-fetch-site: same-origin' \
      -H 'sec-fetch-mode: cors' \
      -H 'sec-fetch-dest: empty' \
      -H 'referer: https://www.walmart.com/orders' \
      -H 'accept-language: vi' \
      --data-raw $'{"query":"query getGuestOrder($orderId:ID\u0021 $emailAddress:String\u0021){guestOrder(input:{id:$orderId emailAddress:$emailAddress}){...OrderFieldsFragment}}fragment cancelReason on OrderCancelReason{__typename subReasonCode subDescription}fragment priceDetailFragment on OrderPriceDetailRow{label value displayValue info{title message}rowInfo{...orderPriceDetailRowInfo}}fragment orderPriceDetailRowInfo on OrderPriceDetailRowInfo{title message{...textFragment}}fragment price on Price{displayValue value}fragment variants on MapEntry{name value}fragment OrderAddOn on OrderAddOn{lineId uniqueLineId productInfo{name usItemId offerId}quantityString quantityLabel type fulfillmentInstructions{...textFragment}actions{manageProtectionPlan{...orderActionFragment}cancel}priceInfo{linePrice{...price}}quantity isActive}fragment orderDonationDetails on OrderDonationDetails{message{...textFragment}emailReceipt emailReceiptToken status{...textFragment}errorStatus}fragment orderLineItem on OrderLineItem{id uniqueId actions{contactSeller cancel addToCart configureCake reviewItem resendEGiftCardToken protectionPlan{...orderActionFragment}manageProtectionPlan{...orderActionFragment}}isGift digitalDeliveryMessage quantity quantityString quantityLabel isSubstitutionSelected fulfilledItems{id quantityString priceInfo{itemPrice{value}}productInfo{usItemId name}}isReturnable returnEligibilityMessage productInfo{name usItemId imageInfo{thumbnailUrl}canonicalUrl offerId orderLimit orderMinLimit weightIncrement salesUnit salesUnitType isSubstitutionEligible isAlcohol}reshop{reshopMessage isShippingAvailable minPromiseDate maxPromiseDate}selectedVariants{...variants}variantAdditionalInfo{parts{text nativeAction}}priceInfo{priceDisplayCodes{showItemPrice priceDisplayCondition finalCostByWeight}itemPrice{...price}linePrice{...price}unitPrice{...price}preDiscountedLinePrice{...price}additionalLines{name value}}discounts{label labelText{...textFragment}}itemReviewed activationCodes{label code}protectionPlanMessage{...textFragment}showSeller isShippedByWalmart seller{id name isPro}digitalDeliveryPhoneNumber addOns{...OrderAddOn}multiboxBundleId}fragment DriverFragment on Driver{id firstName photoUrl}fragment OrderGroupFragment on OrderGroup{driver{...DriverFragment}deliveryDate fulfillmentType status{...OrderGroupStatusFragment}showSeller isShippedByWalmart seller{...SellerFragment}id itemCount items{...LiteLineItemFragment}pickupPerson{firstName lastName email}accessPointId shipment{...ShipmentFragment}returnEligibilityMessage actions{...OrderGroupActionsFragment}recipientEmailAddress digitalDelivery{...DigitalDeliveryFragment}tireInstallationReservation{status extraText reservationId}}fragment OrderGroupStatusFragment on OrderGroupStatus{statusType showStatusTracker statusTracker{status label isCurrent}message{...textFragment}subtext subMessage{...textFragment}notice helpCenterText{...textFragment}}fragment textFragment on Text{parts{bold url text nativeAction lineBreak}}fragment LiteLineItemFragment on OrderLineItem{id quantity productInfo{name usItemId imageInfo{thumbnailUrl}offerId isAlcohol}priceInfo{linePrice{...price}}}fragment SellerFragment on GroupSeller{id name isPro}fragment DigitalDeliveryFragment on DigitalDelivery{title name instructions{...textFragment}}fragment ShipmentFragment on Shipment{id trackingNumber isExternalTracking trackingUrl proofOfDelivery{...ProofOfDeliveryFragment}}fragment OrderGroupActionsFragment on OrderGroupActions{reorder edit track changeSlot checkin editDeliveryInstructions editPickupPerson editTip tip rateDriver cancel enableTip{...orderActionFragment}enableEdit{...orderActionFragment}rescheduleTireInstall{...orderActionFragment}cancelTireInstall{...orderActionFragment}help viewCancellationDetails{...cancellationDetailsActionFragment}}fragment cancellationDetailsActionFragment on CancellationDetailsAction{label heading text{...textFragment}}fragment ProofOfDeliveryFragment on ProofOfDelivery{photoUrl photoPreviewUrl showPreview}fragment DeliveryInstructionsFragment on DeliveryInstructions{text type typeText}fragment GiftDetailsFragment on GiftDetails{recipientAddress{fullName}recipientEmail senderName giftMessage}fragment SubstitutionAction on SubstitutionAction{message label type}fragment ODPGroupCategoryFragment on OrderCategory{type name subtext returnMessage substitutionsBanner{...textFragment}showExtendedSubstitutions actions{substitutions{...SubstitutionAction}nilPickReshop{message action{text url}}returnDetails viewCancellationDetails{...cancellationDetailsActionFragment}trackOnInHomeApp}banner{...textFragment}accordionState items{...orderLineItem}substitutions{...orderLineItem fulfilledItems{...orderLineItem}}returnInfo{...returnInfoFragment}}fragment ODPGroupFragment on OrderGroup{id fulfillmentType deliveryMessage deliveryAddress{fullName firstName lastName address{...addressFragment}}deliveryInstructions{...DeliveryInstructionsFragment}deliveryPreferences{text{...textFragment}cta{...orderActionFragment}}editSubstitutionsCutOff status{statusType showStatusTracker message{...textFragment}notice helpCenterText{...textFragment}}itemCount isCategorized categories{...ODPGroupCategoryFragment}seller{id name isPro}shipment{id trackingNumber}actions{reorder edit track changeSlot checkin editDeliveryInstructions editPickupPerson tip cancel help enableTip{...orderActionFragment}enableEdit{...orderActionFragment}viewCancellationDetails{...cancellationDetailsActionFragment}enableInHome{...orderActionFragment}createGiftReceipt}cutOffTimestamp isEditSubstitutionsEligible isInHome giftDetails{...GiftDetailsFragment}donationDetails{...orderDonationDetails}}fragment returnInfoFragment on ReturnInfo{returnOrderId type refundPriceDetails{__typename...refundPriceDetailsFragment}refundMessage tierRefundMessage paymentMethods{__typename description cardType paymentType displayValues message{...textFragment}}actions{__typename generate scheduleOrModifyPickup{text url}reschedulePickup editPickupContact}shippingLabelUrl qrCodeImageUrl carriers{__typename id name}pickupCarrier pickupContact{nameAndAddress{fullName firstName lastName address{addressString city state postalCode addressLineOne addressLineTwo country}}phone}pickupConfirmationNumber bannerMessage{...textFragment}}fragment refundPriceDetailsFragment on RefundPriceDetails{subTotal{__typename...orderPriceDetailRowFragment}fees{__typename...orderPriceDetailRowFragment}discounts{__typename...orderPriceDetailRowFragment}taxTotal{__typename...orderPriceDetailRowFragment}grandTotal{__typename...orderPriceDetailRowFragment}}fragment orderPriceDetailRowFragment on OrderPriceDetailRow{label displayValue value info{__typename title message}}fragment addressFragment on OrderAddress{addressString addressLineOne addressLineTwo state postalCode city}fragment ODPPickupInfo on OrderGroup{pickupInstructions pickupPerson{...person}alternatePickupPerson{...person}store{id name address{...addressFragment}}}fragment person on OrderPickupPerson{firstName lastName email}fragment ODPTippingInfo on OrderGroup{addTipMessage{...textFragment}driver{...DriverFragment}tipping{min{...price}max{...price}suggested{...price}preselected}subtotal{...price}}fragment orderActionFragment on Action{text url}fragment orderCustomer on OrderCustomer{id firstName lastName email isGuest isEmailRegistered}fragment OrderFieldsFragment on Order{__typename id version type customer{...orderCustomer}displayId idBarcodeImageUrl(barWidth:3 barHeight:100) isFuelPurchase title shortTitle timezone tippableGroup{...OrderGroupFragment}amendableGroup{id changeSlotIterationsLeft cutOffTimestamp fulfillmentType deliveryAddress{fullName firstName lastName address{addressString addressLineOne addressLineTwo state postalCode city country}}isAmendInProgress}substitutionsBanner{heading subheading longSubheading}groups_2101{__typename...OrderGroupFragment...ODPGroupFragment...ODPPickupInfo...ODPTippingInfo}multiboxBundles{...orderLineItem}itemCancelReasons{__typename...cancelReason}groupCancelReasons{__typename...cancelReason}priceDetails{__typename subTotal{__typename...priceDetailFragment}taxTotal{__typename...priceDetailFragment}grandTotal{__typename...priceDetailFragment}authorizationAmount{__typename...priceDetailFragment}fees{__typename...priceDetailFragment}discounts{__typename...priceDetailFragment}minimumThreshold{__typename...price}belowMinimumFee{__typename...priceDetailFragment}driverTip{__typename...priceDetailFragment}donations{__typename...priceDetailFragment}}paymentMethods{__typename description cardType paymentType displayValues message{...textFragment}actions{connectToCapitalOne{...orderActionFragment}visitAffirm{...orderActionFragment}}}actions{__typename return pendingReturn cancel startReturn{...orderActionFragment}reorder}banners{...textFragment}}","variables":{"orderId":"'${array[2]}'","emailAddress":"'${array[1]}'"}}' \
      --compressed`
      

      if [[ $curl =~ "blocked" ]]; then
        link=`echo $curl | jq '.redirectUrl' | sed 's/"//g'`
        `open -n -a /Applications/Microsoft\ Edge.app --args --profile-directory=Default https://walmart.com$link`
        read -n 1 -p "blocked"
      else
        break
      fi
    done

    if [[ $curl =~ "error" ]]; then
        echo "1-Sai info"
        echo ${array[2]} >> track-OrderID-TD.txt
        echo ${array[0]} >> track-email-TD.txt
        echo "Sai info" >> track-usItemId-TD.txt
        echo "Sai info" >> track-priceValue-TD.txt
        echo "Sai info" >> track-fullName-TD.txt
        echo "Sai info" >> track-address-TD.txt
        echo "Sai info" >> track-status-TD.txt
        echo "Sai info" >> track-number-TD.txt
        echo "Sai info" >> track-url-TD.txt
        echo "Sai info" >> track-categoriesType-TD.txt
        echo ${array[4]//$/ } >> track-CO-TD.txt
    else
        sum=`md5 track-OrderID-TD.txt`
        for (( i=0; i<=4; i++ ))
        do
            for (( j=0; j<=4; j++))
            do
                if [[ `echo $curl | jq '.data.guestOrder.groups_2101['${i[@]}'].items['${j[@]}'].productInfo.usItemId'` == '"'${array[3]}'"' ]]; then
                    echo ${array[2]} >> track-OrderID-TD.txt
                    echo ${array[0]} >> track-email-TD.txt
                    echo $curl | jq '.data.guestOrder.groups_2101['${i[@]}'].items['${j[@]}'].productInfo.usItemId' >> track-usItemId-TD.txt
                    echo $curl | jq '.data.guestOrder.groups_2101['${i[@]}'].items['${j[@]}'].priceInfo.linePrice.value' >> track-priceValue-TD.txt
                    echo $curl | jq '.data.guestOrder.groups_2101['${i[@]}'].deliveryAddress.fullName' >> track-fullName-TD.txt
                    echo $curl | jq '.data.guestOrder.groups_2101['${i[@]}'].deliveryAddress.address.addressString' >> track-address-TD.txt
                    echo $curl | jq '.data.guestOrder.groups_2101['${i[@]}'].status.message.parts[].text' >> track-status-TD.txt
                    echo $curl | jq '.data.guestOrder.groups_2101['${i[@]}'].shipment.trackingNumber' | sed 's/null//g' >> track-number-TD.txt
                    echo $curl | jq '.data.guestOrder.groups_2101['${i[@]}'].shipment.trackingUrl' | sed 's/null//g' >> track-url-TD.txt
                    echo $curl | jq '.data.guestOrder.groups_2101['${i[@]}'].categories[].type' >> track-categoriesType-TD.txt
                    echo ${array[4]//$/ } >> track-CO-TD.txt
                    break
                fi
            done
        done
        if [[ $sum == `md5 track-OrderID-TD.txt` ]]; then
            echo ${array[0]}"-Khác Item"
            echo "'"${array[2]} >> track-OrderID-TD.txt
            echo ${array[0]} >> track-email-TD.txt
            echo "Khác Item" >> track-usItemId-TD.txt
            echo "Khác Item" >> track-priceValue-TD.txt
            echo "Khác Item" >> track-fullName-TD.txt
            echo "Khác Item" >> track-address-TD.txt
            echo "Khác Item" >> track-status-TD.txt
            echo "Khác Item" >> track-number-TD.txt
            echo "Khác Item" >> track-url-TD.txt
            echo "Khác Item" >> track-categoriesType-TD.txt
            echo "Khác Item" >> track-CO-TD.txt
        else
            echo ${array[0]}
        fi   

fi

done < input-wm-track-TD.txt

git add -A .
git commit -m --allow-empty
git push
git push origin HEAD -f
gitCommit=`git rev-parse HEAD`
linkGit=`echo https://raw.githubusercontent.com/DungSherlock/eBay/`$gitCommit`echo /`
linkApi=`echo https://script.google.com/macros/s/AKfycbxTUZPtaHbpL6Sdf4PXWLmCg1PcRotJWSyJQ-cKMC9AxPb-du0q4h3mmFAICVNeGp8GNQ/exec?`
linkPost=$linkApi`echo Item ID==IMPORTDATA\(\"`$linkGit`echo track-usItemId-TD.txt\"\)\&Giá==IMPORTDATA\(\"`$linkGit`echo track-priceValue-TD.txt\"\)\&Tên==IMPORTDATA\(\"`$linkGit`echo track-fullName-TD.txt\"\)\&Địa chỉ==index\(IMPORTDATA\(\"`$linkGit`echo track-address-TD.txt\"\),,1\)\&Status==IMPORTDATA\(\"`$linkGit`echo track-status-TD.txt\"\)\&Tracking Number==IMPORTDATA\(\"`$linkGit`echo track-number-TD.txt\"\)\&Tracking URL==IMPORTDATA\(\"`$linkGit`echo track-url-TD.txt\"\)\&Email==IMPORTDATA\(\"`$linkGit`echo track-email-TD.txt\"\)\&Order==IMPORTDATA\(\"`$linkGit`echo track-OrderID-TD.txt\"\)\&categoriesType==IMPORTDATA\(\"`$linkGit`echo track-categoriesType-TD.txt\"\)\&CO==IMPORTDATA\(\"`$linkGit`echo track-CO-TD.txt\"\)`
echo $linkPost
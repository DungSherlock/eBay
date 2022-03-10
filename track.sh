#!/bin/bash
: > track-usItemId.txt
: > track-priceValue.txt
: > track-fullName.txt
: > track-address.txt
: > track-status.txt
: > track-number.txt
: > track-url.txt
: > track-OrderID.txt
: > track-email.txt
: > track-categoriesType.txt

while true
do
curl1=`curl -s 'https://www.walmart.com/orchestra/home/graphql' \
  -H 'authority: www.walmart.com' \
  -H 'sec-ch-ua: " Not;A Brand";v="99", "Microsoft Edge";v="97", "Chromium";v="97"' \
  -H 'x-o-platform: rweb' \
  -H 'dnt: 1' \
  -H 'x-o-correlation-id: pn9BnlEx0zDiyvRGJ6nL5BS9pDN7erB017Nf' \
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
  -H 'user-agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.51 Safari/537.36 Edg/99.0.1150.36' \
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
  --data-raw $'{"query":"query getGuestOrder($orderId:ID\u0021 $emailAddress:String\u0021){guestOrder(input:{id:$orderId emailAddress:$emailAddress}){...OrderFieldsFragment}}fragment cancelReason on OrderCancelReason{__typename subReasonCode subDescription}fragment priceDetailFragment on OrderPriceDetailRow{label value displayValue info{title message}rowInfo{...orderPriceDetailRowInfo}}fragment orderPriceDetailRowInfo on OrderPriceDetailRowInfo{title message{...textFragment}}fragment price on Price{displayValue value}fragment variants on MapEntry{name value}fragment OrderAddOn on OrderAddOn{lineId uniqueLineId productInfo{name usItemId offerId}quantityString quantityLabel type fulfillmentInstructions{...textFragment}actions{manageProtectionPlan{...orderActionFragment}cancel}priceInfo{linePrice{...price}}quantity isActive}fragment orderDonationDetails on OrderDonationDetails{message{...textFragment}emailReceipt emailReceiptToken status{...textFragment}errorStatus}fragment orderLineItem on OrderLineItem{id uniqueId actions{contactSeller cancel addToCart configureCake reviewItem resendEGiftCardToken protectionPlan{...orderActionFragment}manageProtectionPlan{...orderActionFragment}}isGift digitalDeliveryMessage quantity quantityString quantityLabel isSubstitutionSelected fulfilledItems{id quantityString priceInfo{itemPrice{value}}productInfo{usItemId name}}isReturnable returnEligibilityMessage productInfo{name usItemId imageInfo{thumbnailUrl}canonicalUrl offerId orderLimit orderMinLimit weightIncrement salesUnit salesUnitType isSubstitutionEligible isAlcohol}reshop{reshopMessage isShippingAvailable minPromiseDate maxPromiseDate}selectedVariants{...variants}variantAdditionalInfo{parts{text nativeAction}}priceInfo{priceDisplayCodes{showItemPrice priceDisplayCondition finalCostByWeight}itemPrice{...price}linePrice{...price}unitPrice{...price}preDiscountedLinePrice{...price}additionalLines{name value}}discounts{label labelText{...textFragment}}itemReviewed activationCodes{label code}protectionPlanMessage{...textFragment}showSeller isShippedByWalmart seller{id name isPro}digitalDeliveryPhoneNumber addOns{...OrderAddOn}multiboxBundleId}fragment DriverFragment on Driver{id firstName photoUrl}fragment OrderGroupFragment on OrderGroup{driver{...DriverFragment}deliveryDate fulfillmentType status{...OrderGroupStatusFragment}showSeller isShippedByWalmart seller{...SellerFragment}id itemCount items{...LiteLineItemFragment}pickupPerson{firstName lastName email}accessPointId shipment{...ShipmentFragment}returnEligibilityMessage actions{...OrderGroupActionsFragment}recipientEmailAddress digitalDelivery{...DigitalDeliveryFragment}tireInstallationReservation{status extraText reservationId}}fragment OrderGroupStatusFragment on OrderGroupStatus{statusType showStatusTracker statusTracker{status label isCurrent}message{...textFragment}subtext subMessage{...textFragment}notice helpCenterText{...textFragment}}fragment textFragment on Text{parts{bold url text nativeAction lineBreak}}fragment LiteLineItemFragment on OrderLineItem{id quantity productInfo{name usItemId imageInfo{thumbnailUrl}offerId isAlcohol}priceInfo{linePrice{...price}}}fragment SellerFragment on GroupSeller{id name isPro}fragment DigitalDeliveryFragment on DigitalDelivery{title name instructions{...textFragment}}fragment ShipmentFragment on Shipment{id trackingNumber isExternalTracking trackingUrl proofOfDelivery{...ProofOfDeliveryFragment}}fragment OrderGroupActionsFragment on OrderGroupActions{reorder edit track changeSlot checkin editDeliveryInstructions editPickupPerson editTip tip rateDriver cancel enableTip{...orderActionFragment}enableEdit{...orderActionFragment}rescheduleTireInstall{...orderActionFragment}cancelTireInstall{...orderActionFragment}help viewCancellationDetails{...cancellationDetailsActionFragment}}fragment cancellationDetailsActionFragment on CancellationDetailsAction{label heading text{...textFragment}}fragment ProofOfDeliveryFragment on ProofOfDelivery{photoUrl photoPreviewUrl showPreview}fragment DeliveryInstructionsFragment on DeliveryInstructions{text type typeText}fragment GiftDetailsFragment on GiftDetails{recipientAddress{fullName}recipientEmail senderName giftMessage}fragment SubstitutionAction on SubstitutionAction{message label type}fragment ODPGroupCategoryFragment on OrderCategory{type name subtext returnMessage substitutionsBanner{...textFragment}showExtendedSubstitutions actions{substitutions{...SubstitutionAction}nilPickReshop{message action{text url}}returnDetails viewCancellationDetails{...cancellationDetailsActionFragment}trackOnInHomeApp}banner{...textFragment}accordionState items{...orderLineItem}substitutions{...orderLineItem fulfilledItems{...orderLineItem}}returnInfo{...returnInfoFragment}}fragment ODPGroupFragment on OrderGroup{id fulfillmentType deliveryMessage deliveryAddress{fullName firstName lastName address{...addressFragment}}deliveryInstructions{...DeliveryInstructionsFragment}deliveryPreferences{text{...textFragment}cta{...orderActionFragment}}editSubstitutionsCutOff status{statusType showStatusTracker message{...textFragment}notice helpCenterText{...textFragment}}itemCount isCategorized categories{...ODPGroupCategoryFragment}seller{id name isPro}shipment{id trackingNumber}actions{reorder edit track changeSlot checkin editDeliveryInstructions editPickupPerson tip cancel help enableTip{...orderActionFragment}enableEdit{...orderActionFragment}viewCancellationDetails{...cancellationDetailsActionFragment}enableInHome{...orderActionFragment}createGiftReceipt}cutOffTimestamp isEditSubstitutionsEligible isInHome giftDetails{...GiftDetailsFragment}donationDetails{...orderDonationDetails}}fragment returnInfoFragment on ReturnInfo{returnOrderId type refundPriceDetails{__typename...refundPriceDetailsFragment}refundMessage tierRefundMessage paymentMethods{__typename description cardType paymentType displayValues message{...textFragment}}actions{__typename generate scheduleOrModifyPickup{text url}reschedulePickup editPickupContact}shippingLabelUrl qrCodeImageUrl carriers{__typename id name}pickupCarrier pickupContact{nameAndAddress{fullName firstName lastName address{addressString city state postalCode addressLineOne addressLineTwo country}}phone}pickupConfirmationNumber bannerMessage{...textFragment}}fragment refundPriceDetailsFragment on RefundPriceDetails{subTotal{__typename...orderPriceDetailRowFragment}fees{__typename...orderPriceDetailRowFragment}discounts{__typename...orderPriceDetailRowFragment}taxTotal{__typename...orderPriceDetailRowFragment}grandTotal{__typename...orderPriceDetailRowFragment}}fragment orderPriceDetailRowFragment on OrderPriceDetailRow{label displayValue value info{__typename title message}}fragment addressFragment on OrderAddress{addressString addressLineOne addressLineTwo state postalCode city}fragment ODPPickupInfo on OrderGroup{pickupInstructions pickupPerson{...person}alternatePickupPerson{...person}store{id name address{...addressFragment}}}fragment person on OrderPickupPerson{firstName lastName email}fragment ODPTippingInfo on OrderGroup{addTipMessage{...textFragment}driver{...DriverFragment}tipping{min{...price}max{...price}suggested{...price}preselected}subtotal{...price}}fragment orderActionFragment on Action{text url}fragment orderCustomer on OrderCustomer{id firstName lastName email isGuest isEmailRegistered}fragment OrderFieldsFragment on Order{__typename id version type customer{...orderCustomer}displayId idBarcodeImageUrl(barWidth:3 barHeight:100) isFuelPurchase title shortTitle timezone tippableGroup{...OrderGroupFragment}amendableGroup{id changeSlotIterationsLeft cutOffTimestamp fulfillmentType deliveryAddress{fullName firstName lastName address{addressString addressLineOne addressLineTwo state postalCode city country}}isAmendInProgress}substitutionsBanner{heading subheading longSubheading}groups_2101{__typename...OrderGroupFragment...ODPGroupFragment...ODPPickupInfo...ODPTippingInfo}multiboxBundles{...orderLineItem}itemCancelReasons{__typename...cancelReason}groupCancelReasons{__typename...cancelReason}priceDetails{__typename subTotal{__typename...priceDetailFragment}taxTotal{__typename...priceDetailFragment}grandTotal{__typename...priceDetailFragment}authorizationAmount{__typename...priceDetailFragment}fees{__typename...priceDetailFragment}discounts{__typename...priceDetailFragment}minimumThreshold{__typename...price}belowMinimumFee{__typename...priceDetailFragment}driverTip{__typename...priceDetailFragment}donations{__typename...priceDetailFragment}}paymentMethods{__typename description cardType paymentType displayValues message{...textFragment}actions{connectToCapitalOne{...orderActionFragment}visitAffirm{...orderActionFragment}}}actions{__typename return pendingReturn cancel startReturn{...orderActionFragment}reorder}banners{...textFragment}}","variables":{"orderId":"2972267729170","emailAddress":"kenya_adams1471@yahoo.com"}}' \
  --compressed`
 
  if [[ $curl1 =~ "blocked" ]]; then
    link1=`echo $curl1 | jq '.redirectUrl' | sed 's/"//g'`
    `open -n -a /Applications/Microsoft\ Edge.app --args --profile-directory=Default https://walmart.com$link1`
    read -n 1 -p "blocked"
  else
    break
  fi
done

if [[ $curl1 =~ "error" ]]; then
    echo "1-Sai info"
    echo "'2972267729170" >> track-OrderID.txt
    echo "kenya_adams1471@yahoo.com" >> track-email.txt
    echo "Sai info" >> track-usItemId.txt
    echo "Sai info" >> track-priceValue.txt
    echo "Sai info" >> track-fullName.txt
    echo "Sai info" >> track-address.txt
    echo "Sai info" >> track-status.txt
    echo "Sai info" >> track-number.txt
    echo "Sai info" >> track-url.txt
    echo "Sai info" >> track-categoriesType.txt
else
    sum1=`md5 track-OrderID.txt`
    for (( i=0; i<=4; i++ ))
    do
        for (( j=0; j<=4; j++))
        do
            if [[ `echo $curl1 | jq '.data.guestOrder.groups_2101['${i[@]}'].items['${j[@]}'].productInfo.usItemId'` == '"110554122"' ]]; then
                echo "'2972267729170" >> track-OrderID.txt
                echo kenya_adams1471@yahoo.com >> track-email.txt
                echo $curl1 | jq '.data.guestOrder.groups_2101['${i[@]}'].items['${j[@]}'].productInfo.usItemId' >> track-usItemId.txt
                echo $curl1 | jq '.data.guestOrder.groups_2101['${i[@]}'].items['${j[@]}'].priceInfo.linePrice.value' >> track-priceValue.txt
                echo $curl1 | jq '.data.guestOrder.groups_2101['${i[@]}'].deliveryAddress.fullName' >> track-fullName.txt
                echo $curl1 | jq '.data.guestOrder.groups_2101['${i[@]}'].deliveryAddress.address.addressString' >> track-address.txt
                echo $curl1 | jq '.data.guestOrder.groups_2101['${i[@]}'].status.message.parts[].text' >> track-status.txt
                echo $curl1 | jq '.data.guestOrder.groups_2101['${i[@]}'].shipment.trackingNumber' | sed 's/null//g' >> track-number.txt
                echo $curl1 | jq '.data.guestOrder.groups_2101['${i[@]}'].shipment.trackingUrl' | sed 's/null//g' >> track-url.txt
                echo $curl1 | jq '.data.guestOrder.groups_2101['${i[@]}'].categories[].type' >> track-categoriesType.txt

                break
            fi
        done
    done
    if [[ $sum1 == `md5 track-OrderID.txt` ]]; then
        echo "1-Khác Item"
        echo "'2972267729170" >> track-OrderID.txt
        echo "kenya_adams1471@yahoo.com" >> track-email.txt
        echo "Khác Item" >> track-usItemId.txt
        echo "Khác Item" >> track-priceValue.txt
        echo "Khác Item" >> track-fullName.txt
        echo "Khác Item" >> track-address.txt
        echo "Khác Item" >> track-status.txt
        echo "Khác Item" >> track-number.txt
        echo "Khác Item" >> track-url.txt
        echo "Khác Item" >> track-categoriesType.txt
    else
        echo "1"
    fi   
fi
while true
do
curl2=`curl -s 'https://www.walmart.com/orchestra/home/graphql' \
  -H 'authority: www.walmart.com' \
  -H 'sec-ch-ua: " Not;A Brand";v="99", "Microsoft Edge";v="97", "Chromium";v="97"' \
  -H 'x-o-platform: rweb' \
  -H 'dnt: 1' \
  -H 'x-o-correlation-id: pn9BnlEx0zDiyvRGJ6nL5BS9pDN7erB017Nf' \
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
  -H 'user-agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.51 Safari/537.36 Edg/99.0.1150.36' \
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
  --data-raw $'{"query":"query getGuestOrder($orderId:ID\u0021 $emailAddress:String\u0021){guestOrder(input:{id:$orderId emailAddress:$emailAddress}){...OrderFieldsFragment}}fragment cancelReason on OrderCancelReason{__typename subReasonCode subDescription}fragment priceDetailFragment on OrderPriceDetailRow{label value displayValue info{title message}rowInfo{...orderPriceDetailRowInfo}}fragment orderPriceDetailRowInfo on OrderPriceDetailRowInfo{title message{...textFragment}}fragment price on Price{displayValue value}fragment variants on MapEntry{name value}fragment OrderAddOn on OrderAddOn{lineId uniqueLineId productInfo{name usItemId offerId}quantityString quantityLabel type fulfillmentInstructions{...textFragment}actions{manageProtectionPlan{...orderActionFragment}cancel}priceInfo{linePrice{...price}}quantity isActive}fragment orderDonationDetails on OrderDonationDetails{message{...textFragment}emailReceipt emailReceiptToken status{...textFragment}errorStatus}fragment orderLineItem on OrderLineItem{id uniqueId actions{contactSeller cancel addToCart configureCake reviewItem resendEGiftCardToken protectionPlan{...orderActionFragment}manageProtectionPlan{...orderActionFragment}}isGift digitalDeliveryMessage quantity quantityString quantityLabel isSubstitutionSelected fulfilledItems{id quantityString priceInfo{itemPrice{value}}productInfo{usItemId name}}isReturnable returnEligibilityMessage productInfo{name usItemId imageInfo{thumbnailUrl}canonicalUrl offerId orderLimit orderMinLimit weightIncrement salesUnit salesUnitType isSubstitutionEligible isAlcohol}reshop{reshopMessage isShippingAvailable minPromiseDate maxPromiseDate}selectedVariants{...variants}variantAdditionalInfo{parts{text nativeAction}}priceInfo{priceDisplayCodes{showItemPrice priceDisplayCondition finalCostByWeight}itemPrice{...price}linePrice{...price}unitPrice{...price}preDiscountedLinePrice{...price}additionalLines{name value}}discounts{label labelText{...textFragment}}itemReviewed activationCodes{label code}protectionPlanMessage{...textFragment}showSeller isShippedByWalmart seller{id name isPro}digitalDeliveryPhoneNumber addOns{...OrderAddOn}multiboxBundleId}fragment DriverFragment on Driver{id firstName photoUrl}fragment OrderGroupFragment on OrderGroup{driver{...DriverFragment}deliveryDate fulfillmentType status{...OrderGroupStatusFragment}showSeller isShippedByWalmart seller{...SellerFragment}id itemCount items{...LiteLineItemFragment}pickupPerson{firstName lastName email}accessPointId shipment{...ShipmentFragment}returnEligibilityMessage actions{...OrderGroupActionsFragment}recipientEmailAddress digitalDelivery{...DigitalDeliveryFragment}tireInstallationReservation{status extraText reservationId}}fragment OrderGroupStatusFragment on OrderGroupStatus{statusType showStatusTracker statusTracker{status label isCurrent}message{...textFragment}subtext subMessage{...textFragment}notice helpCenterText{...textFragment}}fragment textFragment on Text{parts{bold url text nativeAction lineBreak}}fragment LiteLineItemFragment on OrderLineItem{id quantity productInfo{name usItemId imageInfo{thumbnailUrl}offerId isAlcohol}priceInfo{linePrice{...price}}}fragment SellerFragment on GroupSeller{id name isPro}fragment DigitalDeliveryFragment on DigitalDelivery{title name instructions{...textFragment}}fragment ShipmentFragment on Shipment{id trackingNumber isExternalTracking trackingUrl proofOfDelivery{...ProofOfDeliveryFragment}}fragment OrderGroupActionsFragment on OrderGroupActions{reorder edit track changeSlot checkin editDeliveryInstructions editPickupPerson editTip tip rateDriver cancel enableTip{...orderActionFragment}enableEdit{...orderActionFragment}rescheduleTireInstall{...orderActionFragment}cancelTireInstall{...orderActionFragment}help viewCancellationDetails{...cancellationDetailsActionFragment}}fragment cancellationDetailsActionFragment on CancellationDetailsAction{label heading text{...textFragment}}fragment ProofOfDeliveryFragment on ProofOfDelivery{photoUrl photoPreviewUrl showPreview}fragment DeliveryInstructionsFragment on DeliveryInstructions{text type typeText}fragment GiftDetailsFragment on GiftDetails{recipientAddress{fullName}recipientEmail senderName giftMessage}fragment SubstitutionAction on SubstitutionAction{message label type}fragment ODPGroupCategoryFragment on OrderCategory{type name subtext returnMessage substitutionsBanner{...textFragment}showExtendedSubstitutions actions{substitutions{...SubstitutionAction}nilPickReshop{message action{text url}}returnDetails viewCancellationDetails{...cancellationDetailsActionFragment}trackOnInHomeApp}banner{...textFragment}accordionState items{...orderLineItem}substitutions{...orderLineItem fulfilledItems{...orderLineItem}}returnInfo{...returnInfoFragment}}fragment ODPGroupFragment on OrderGroup{id fulfillmentType deliveryMessage deliveryAddress{fullName firstName lastName address{...addressFragment}}deliveryInstructions{...DeliveryInstructionsFragment}deliveryPreferences{text{...textFragment}cta{...orderActionFragment}}editSubstitutionsCutOff status{statusType showStatusTracker message{...textFragment}notice helpCenterText{...textFragment}}itemCount isCategorized categories{...ODPGroupCategoryFragment}seller{id name isPro}shipment{id trackingNumber}actions{reorder edit track changeSlot checkin editDeliveryInstructions editPickupPerson tip cancel help enableTip{...orderActionFragment}enableEdit{...orderActionFragment}viewCancellationDetails{...cancellationDetailsActionFragment}enableInHome{...orderActionFragment}createGiftReceipt}cutOffTimestamp isEditSubstitutionsEligible isInHome giftDetails{...GiftDetailsFragment}donationDetails{...orderDonationDetails}}fragment returnInfoFragment on ReturnInfo{returnOrderId type refundPriceDetails{__typename...refundPriceDetailsFragment}refundMessage tierRefundMessage paymentMethods{__typename description cardType paymentType displayValues message{...textFragment}}actions{__typename generate scheduleOrModifyPickup{text url}reschedulePickup editPickupContact}shippingLabelUrl qrCodeImageUrl carriers{__typename id name}pickupCarrier pickupContact{nameAndAddress{fullName firstName lastName address{addressString city state postalCode addressLineOne addressLineTwo country}}phone}pickupConfirmationNumber bannerMessage{...textFragment}}fragment refundPriceDetailsFragment on RefundPriceDetails{subTotal{__typename...orderPriceDetailRowFragment}fees{__typename...orderPriceDetailRowFragment}discounts{__typename...orderPriceDetailRowFragment}taxTotal{__typename...orderPriceDetailRowFragment}grandTotal{__typename...orderPriceDetailRowFragment}}fragment orderPriceDetailRowFragment on OrderPriceDetailRow{label displayValue value info{__typename title message}}fragment addressFragment on OrderAddress{addressString addressLineOne addressLineTwo state postalCode city}fragment ODPPickupInfo on OrderGroup{pickupInstructions pickupPerson{...person}alternatePickupPerson{...person}store{id name address{...addressFragment}}}fragment person on OrderPickupPerson{firstName lastName email}fragment ODPTippingInfo on OrderGroup{addTipMessage{...textFragment}driver{...DriverFragment}tipping{min{...price}max{...price}suggested{...price}preselected}subtotal{...price}}fragment orderActionFragment on Action{text url}fragment orderCustomer on OrderCustomer{id firstName lastName email isGuest isEmailRegistered}fragment OrderFieldsFragment on Order{__typename id version type customer{...orderCustomer}displayId idBarcodeImageUrl(barWidth:3 barHeight:100) isFuelPurchase title shortTitle timezone tippableGroup{...OrderGroupFragment}amendableGroup{id changeSlotIterationsLeft cutOffTimestamp fulfillmentType deliveryAddress{fullName firstName lastName address{addressString addressLineOne addressLineTwo state postalCode city country}}isAmendInProgress}substitutionsBanner{heading subheading longSubheading}groups_2101{__typename...OrderGroupFragment...ODPGroupFragment...ODPPickupInfo...ODPTippingInfo}multiboxBundles{...orderLineItem}itemCancelReasons{__typename...cancelReason}groupCancelReasons{__typename...cancelReason}priceDetails{__typename subTotal{__typename...priceDetailFragment}taxTotal{__typename...priceDetailFragment}grandTotal{__typename...priceDetailFragment}authorizationAmount{__typename...priceDetailFragment}fees{__typename...priceDetailFragment}discounts{__typename...priceDetailFragment}minimumThreshold{__typename...price}belowMinimumFee{__typename...priceDetailFragment}driverTip{__typename...priceDetailFragment}donations{__typename...priceDetailFragment}}paymentMethods{__typename description cardType paymentType displayValues message{...textFragment}actions{connectToCapitalOne{...orderActionFragment}visitAffirm{...orderActionFragment}}}actions{__typename return pendingReturn cancel startReturn{...orderActionFragment}reorder}banners{...textFragment}}","variables":{"orderId":"3122233516669","emailAddress":"frankmwright@hotmail.com"}}' \
  --compressed`
 
  if [[ $curl2 =~ "blocked" ]]; then
    link2=`echo $curl2 | jq '.redirectUrl' | sed 's/"//g'`
    `open -n -a /Applications/Microsoft\ Edge.app --args --profile-directory=Default https://walmart.com$link2`
    read -n 1 -p "blocked"
  else
    break
  fi
done

if [[ $curl2 =~ "error" ]]; then
    echo "2-Sai info"
    echo "'3122233516669" >> track-OrderID.txt
    echo "frankmwright@hotmail.com" >> track-email.txt
    echo "Sai info" >> track-usItemId.txt
    echo "Sai info" >> track-priceValue.txt
    echo "Sai info" >> track-fullName.txt
    echo "Sai info" >> track-address.txt
    echo "Sai info" >> track-status.txt
    echo "Sai info" >> track-number.txt
    echo "Sai info" >> track-url.txt
    echo "Sai info" >> track-categoriesType.txt
else
    sum2=`md5 track-OrderID.txt`
    for (( i=0; i<=4; i++ ))
    do
        for (( j=0; j<=4; j++))
        do
            if [[ `echo $curl2 | jq '.data.guestOrder.groups_2101['${i[@]}'].items['${j[@]}'].productInfo.usItemId'` == '"10752553"' ]]; then
                echo "'3122233516669" >> track-OrderID.txt
                echo frankmwright@hotmail.com >> track-email.txt
                echo $curl2 | jq '.data.guestOrder.groups_2101['${i[@]}'].items['${j[@]}'].productInfo.usItemId' >> track-usItemId.txt
                echo $curl2 | jq '.data.guestOrder.groups_2101['${i[@]}'].items['${j[@]}'].priceInfo.linePrice.value' >> track-priceValue.txt
                echo $curl2 | jq '.data.guestOrder.groups_2101['${i[@]}'].deliveryAddress.fullName' >> track-fullName.txt
                echo $curl2 | jq '.data.guestOrder.groups_2101['${i[@]}'].deliveryAddress.address.addressString' >> track-address.txt
                echo $curl2 | jq '.data.guestOrder.groups_2101['${i[@]}'].status.message.parts[].text' >> track-status.txt
                echo $curl2 | jq '.data.guestOrder.groups_2101['${i[@]}'].shipment.trackingNumber' | sed 's/null//g' >> track-number.txt
                echo $curl2 | jq '.data.guestOrder.groups_2101['${i[@]}'].shipment.trackingUrl' | sed 's/null//g' >> track-url.txt
                echo $curl2 | jq '.data.guestOrder.groups_2101['${i[@]}'].categories[].type' >> track-categoriesType.txt

                break
            fi
        done
    done
    if [[ $sum2 == `md5 track-OrderID.txt` ]]; then
        echo "2-Khác Item"
        echo "'3122233516669" >> track-OrderID.txt
        echo "frankmwright@hotmail.com" >> track-email.txt
        echo "Khác Item" >> track-usItemId.txt
        echo "Khác Item" >> track-priceValue.txt
        echo "Khác Item" >> track-fullName.txt
        echo "Khác Item" >> track-address.txt
        echo "Khác Item" >> track-status.txt
        echo "Khác Item" >> track-number.txt
        echo "Khác Item" >> track-url.txt
        echo "Khác Item" >> track-categoriesType.txt
    else
        echo "2"
    fi   
fi
while true
do
curl3=`curl -s 'https://www.walmart.com/orchestra/home/graphql' \
  -H 'authority: www.walmart.com' \
  -H 'sec-ch-ua: " Not;A Brand";v="99", "Microsoft Edge";v="97", "Chromium";v="97"' \
  -H 'x-o-platform: rweb' \
  -H 'dnt: 1' \
  -H 'x-o-correlation-id: pn9BnlEx0zDiyvRGJ6nL5BS9pDN7erB017Nf' \
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
  -H 'user-agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.51 Safari/537.36 Edg/99.0.1150.36' \
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
  --data-raw $'{"query":"query getGuestOrder($orderId:ID\u0021 $emailAddress:String\u0021){guestOrder(input:{id:$orderId emailAddress:$emailAddress}){...OrderFieldsFragment}}fragment cancelReason on OrderCancelReason{__typename subReasonCode subDescription}fragment priceDetailFragment on OrderPriceDetailRow{label value displayValue info{title message}rowInfo{...orderPriceDetailRowInfo}}fragment orderPriceDetailRowInfo on OrderPriceDetailRowInfo{title message{...textFragment}}fragment price on Price{displayValue value}fragment variants on MapEntry{name value}fragment OrderAddOn on OrderAddOn{lineId uniqueLineId productInfo{name usItemId offerId}quantityString quantityLabel type fulfillmentInstructions{...textFragment}actions{manageProtectionPlan{...orderActionFragment}cancel}priceInfo{linePrice{...price}}quantity isActive}fragment orderDonationDetails on OrderDonationDetails{message{...textFragment}emailReceipt emailReceiptToken status{...textFragment}errorStatus}fragment orderLineItem on OrderLineItem{id uniqueId actions{contactSeller cancel addToCart configureCake reviewItem resendEGiftCardToken protectionPlan{...orderActionFragment}manageProtectionPlan{...orderActionFragment}}isGift digitalDeliveryMessage quantity quantityString quantityLabel isSubstitutionSelected fulfilledItems{id quantityString priceInfo{itemPrice{value}}productInfo{usItemId name}}isReturnable returnEligibilityMessage productInfo{name usItemId imageInfo{thumbnailUrl}canonicalUrl offerId orderLimit orderMinLimit weightIncrement salesUnit salesUnitType isSubstitutionEligible isAlcohol}reshop{reshopMessage isShippingAvailable minPromiseDate maxPromiseDate}selectedVariants{...variants}variantAdditionalInfo{parts{text nativeAction}}priceInfo{priceDisplayCodes{showItemPrice priceDisplayCondition finalCostByWeight}itemPrice{...price}linePrice{...price}unitPrice{...price}preDiscountedLinePrice{...price}additionalLines{name value}}discounts{label labelText{...textFragment}}itemReviewed activationCodes{label code}protectionPlanMessage{...textFragment}showSeller isShippedByWalmart seller{id name isPro}digitalDeliveryPhoneNumber addOns{...OrderAddOn}multiboxBundleId}fragment DriverFragment on Driver{id firstName photoUrl}fragment OrderGroupFragment on OrderGroup{driver{...DriverFragment}deliveryDate fulfillmentType status{...OrderGroupStatusFragment}showSeller isShippedByWalmart seller{...SellerFragment}id itemCount items{...LiteLineItemFragment}pickupPerson{firstName lastName email}accessPointId shipment{...ShipmentFragment}returnEligibilityMessage actions{...OrderGroupActionsFragment}recipientEmailAddress digitalDelivery{...DigitalDeliveryFragment}tireInstallationReservation{status extraText reservationId}}fragment OrderGroupStatusFragment on OrderGroupStatus{statusType showStatusTracker statusTracker{status label isCurrent}message{...textFragment}subtext subMessage{...textFragment}notice helpCenterText{...textFragment}}fragment textFragment on Text{parts{bold url text nativeAction lineBreak}}fragment LiteLineItemFragment on OrderLineItem{id quantity productInfo{name usItemId imageInfo{thumbnailUrl}offerId isAlcohol}priceInfo{linePrice{...price}}}fragment SellerFragment on GroupSeller{id name isPro}fragment DigitalDeliveryFragment on DigitalDelivery{title name instructions{...textFragment}}fragment ShipmentFragment on Shipment{id trackingNumber isExternalTracking trackingUrl proofOfDelivery{...ProofOfDeliveryFragment}}fragment OrderGroupActionsFragment on OrderGroupActions{reorder edit track changeSlot checkin editDeliveryInstructions editPickupPerson editTip tip rateDriver cancel enableTip{...orderActionFragment}enableEdit{...orderActionFragment}rescheduleTireInstall{...orderActionFragment}cancelTireInstall{...orderActionFragment}help viewCancellationDetails{...cancellationDetailsActionFragment}}fragment cancellationDetailsActionFragment on CancellationDetailsAction{label heading text{...textFragment}}fragment ProofOfDeliveryFragment on ProofOfDelivery{photoUrl photoPreviewUrl showPreview}fragment DeliveryInstructionsFragment on DeliveryInstructions{text type typeText}fragment GiftDetailsFragment on GiftDetails{recipientAddress{fullName}recipientEmail senderName giftMessage}fragment SubstitutionAction on SubstitutionAction{message label type}fragment ODPGroupCategoryFragment on OrderCategory{type name subtext returnMessage substitutionsBanner{...textFragment}showExtendedSubstitutions actions{substitutions{...SubstitutionAction}nilPickReshop{message action{text url}}returnDetails viewCancellationDetails{...cancellationDetailsActionFragment}trackOnInHomeApp}banner{...textFragment}accordionState items{...orderLineItem}substitutions{...orderLineItem fulfilledItems{...orderLineItem}}returnInfo{...returnInfoFragment}}fragment ODPGroupFragment on OrderGroup{id fulfillmentType deliveryMessage deliveryAddress{fullName firstName lastName address{...addressFragment}}deliveryInstructions{...DeliveryInstructionsFragment}deliveryPreferences{text{...textFragment}cta{...orderActionFragment}}editSubstitutionsCutOff status{statusType showStatusTracker message{...textFragment}notice helpCenterText{...textFragment}}itemCount isCategorized categories{...ODPGroupCategoryFragment}seller{id name isPro}shipment{id trackingNumber}actions{reorder edit track changeSlot checkin editDeliveryInstructions editPickupPerson tip cancel help enableTip{...orderActionFragment}enableEdit{...orderActionFragment}viewCancellationDetails{...cancellationDetailsActionFragment}enableInHome{...orderActionFragment}createGiftReceipt}cutOffTimestamp isEditSubstitutionsEligible isInHome giftDetails{...GiftDetailsFragment}donationDetails{...orderDonationDetails}}fragment returnInfoFragment on ReturnInfo{returnOrderId type refundPriceDetails{__typename...refundPriceDetailsFragment}refundMessage tierRefundMessage paymentMethods{__typename description cardType paymentType displayValues message{...textFragment}}actions{__typename generate scheduleOrModifyPickup{text url}reschedulePickup editPickupContact}shippingLabelUrl qrCodeImageUrl carriers{__typename id name}pickupCarrier pickupContact{nameAndAddress{fullName firstName lastName address{addressString city state postalCode addressLineOne addressLineTwo country}}phone}pickupConfirmationNumber bannerMessage{...textFragment}}fragment refundPriceDetailsFragment on RefundPriceDetails{subTotal{__typename...orderPriceDetailRowFragment}fees{__typename...orderPriceDetailRowFragment}discounts{__typename...orderPriceDetailRowFragment}taxTotal{__typename...orderPriceDetailRowFragment}grandTotal{__typename...orderPriceDetailRowFragment}}fragment orderPriceDetailRowFragment on OrderPriceDetailRow{label displayValue value info{__typename title message}}fragment addressFragment on OrderAddress{addressString addressLineOne addressLineTwo state postalCode city}fragment ODPPickupInfo on OrderGroup{pickupInstructions pickupPerson{...person}alternatePickupPerson{...person}store{id name address{...addressFragment}}}fragment person on OrderPickupPerson{firstName lastName email}fragment ODPTippingInfo on OrderGroup{addTipMessage{...textFragment}driver{...DriverFragment}tipping{min{...price}max{...price}suggested{...price}preselected}subtotal{...price}}fragment orderActionFragment on Action{text url}fragment orderCustomer on OrderCustomer{id firstName lastName email isGuest isEmailRegistered}fragment OrderFieldsFragment on Order{__typename id version type customer{...orderCustomer}displayId idBarcodeImageUrl(barWidth:3 barHeight:100) isFuelPurchase title shortTitle timezone tippableGroup{...OrderGroupFragment}amendableGroup{id changeSlotIterationsLeft cutOffTimestamp fulfillmentType deliveryAddress{fullName firstName lastName address{addressString addressLineOne addressLineTwo state postalCode city country}}isAmendInProgress}substitutionsBanner{heading subheading longSubheading}groups_2101{__typename...OrderGroupFragment...ODPGroupFragment...ODPPickupInfo...ODPTippingInfo}multiboxBundles{...orderLineItem}itemCancelReasons{__typename...cancelReason}groupCancelReasons{__typename...cancelReason}priceDetails{__typename subTotal{__typename...priceDetailFragment}taxTotal{__typename...priceDetailFragment}grandTotal{__typename...priceDetailFragment}authorizationAmount{__typename...priceDetailFragment}fees{__typename...priceDetailFragment}discounts{__typename...priceDetailFragment}minimumThreshold{__typename...price}belowMinimumFee{__typename...priceDetailFragment}driverTip{__typename...priceDetailFragment}donations{__typename...priceDetailFragment}}paymentMethods{__typename description cardType paymentType displayValues message{...textFragment}actions{connectToCapitalOne{...orderActionFragment}visitAffirm{...orderActionFragment}}}actions{__typename return pendingReturn cancel startReturn{...orderActionFragment}reorder}banners{...textFragment}}","variables":{"orderId":"3342213481710","emailAddress":"Omgsikvm9@gmail.com"}}' \
  --compressed`
 
  if [[ $curl3 =~ "blocked" ]]; then
    link3=`echo $curl3 | jq '.redirectUrl' | sed 's/"//g'`
    `open -n -a /Applications/Microsoft\ Edge.app --args --profile-directory=Default https://walmart.com$link3`
    read -n 1 -p "blocked"
  else
    break
  fi
done

if [[ $curl3 =~ "error" ]]; then
    echo "3-Sai info"
    echo "'3342213481710" >> track-OrderID.txt
    echo "Omgsikvm9@gmail.com" >> track-email.txt
    echo "Sai info" >> track-usItemId.txt
    echo "Sai info" >> track-priceValue.txt
    echo "Sai info" >> track-fullName.txt
    echo "Sai info" >> track-address.txt
    echo "Sai info" >> track-status.txt
    echo "Sai info" >> track-number.txt
    echo "Sai info" >> track-url.txt
    echo "Sai info" >> track-categoriesType.txt
else
    sum3=`md5 track-OrderID.txt`
    for (( i=0; i<=4; i++ ))
    do
        for (( j=0; j<=4; j++))
        do
            if [[ `echo $curl3 | jq '.data.guestOrder.groups_2101['${i[@]}'].items['${j[@]}'].productInfo.usItemId'` == '"586145746"' ]]; then
                echo "'3342213481710" >> track-OrderID.txt
                echo Omgsikvm9@gmail.com >> track-email.txt
                echo $curl3 | jq '.data.guestOrder.groups_2101['${i[@]}'].items['${j[@]}'].productInfo.usItemId' >> track-usItemId.txt
                echo $curl3 | jq '.data.guestOrder.groups_2101['${i[@]}'].items['${j[@]}'].priceInfo.linePrice.value' >> track-priceValue.txt
                echo $curl3 | jq '.data.guestOrder.groups_2101['${i[@]}'].deliveryAddress.fullName' >> track-fullName.txt
                echo $curl3 | jq '.data.guestOrder.groups_2101['${i[@]}'].deliveryAddress.address.addressString' >> track-address.txt
                echo $curl3 | jq '.data.guestOrder.groups_2101['${i[@]}'].status.message.parts[].text' >> track-status.txt
                echo $curl3 | jq '.data.guestOrder.groups_2101['${i[@]}'].shipment.trackingNumber' | sed 's/null//g' >> track-number.txt
                echo $curl3 | jq '.data.guestOrder.groups_2101['${i[@]}'].shipment.trackingUrl' | sed 's/null//g' >> track-url.txt
                echo $curl3 | jq '.data.guestOrder.groups_2101['${i[@]}'].categories[].type' >> track-categoriesType.txt

                break
            fi
        done
    done
    if [[ $sum3 == `md5 track-OrderID.txt` ]]; then
        echo "3-Khác Item"
        echo "'3342213481710" >> track-OrderID.txt
        echo "Omgsikvm9@gmail.com" >> track-email.txt
        echo "Khác Item" >> track-usItemId.txt
        echo "Khác Item" >> track-priceValue.txt
        echo "Khác Item" >> track-fullName.txt
        echo "Khác Item" >> track-address.txt
        echo "Khác Item" >> track-status.txt
        echo "Khác Item" >> track-number.txt
        echo "Khác Item" >> track-url.txt
        echo "Khác Item" >> track-categoriesType.txt
    else
        echo "3"
    fi   
fi
while true
do
curl4=`curl -s 'https://www.walmart.com/orchestra/home/graphql' \
  -H 'authority: www.walmart.com' \
  -H 'sec-ch-ua: " Not;A Brand";v="99", "Microsoft Edge";v="97", "Chromium";v="97"' \
  -H 'x-o-platform: rweb' \
  -H 'dnt: 1' \
  -H 'x-o-correlation-id: pn9BnlEx0zDiyvRGJ6nL5BS9pDN7erB017Nf' \
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
  -H 'user-agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.51 Safari/537.36 Edg/99.0.1150.36' \
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
  --data-raw $'{"query":"query getGuestOrder($orderId:ID\u0021 $emailAddress:String\u0021){guestOrder(input:{id:$orderId emailAddress:$emailAddress}){...OrderFieldsFragment}}fragment cancelReason on OrderCancelReason{__typename subReasonCode subDescription}fragment priceDetailFragment on OrderPriceDetailRow{label value displayValue info{title message}rowInfo{...orderPriceDetailRowInfo}}fragment orderPriceDetailRowInfo on OrderPriceDetailRowInfo{title message{...textFragment}}fragment price on Price{displayValue value}fragment variants on MapEntry{name value}fragment OrderAddOn on OrderAddOn{lineId uniqueLineId productInfo{name usItemId offerId}quantityString quantityLabel type fulfillmentInstructions{...textFragment}actions{manageProtectionPlan{...orderActionFragment}cancel}priceInfo{linePrice{...price}}quantity isActive}fragment orderDonationDetails on OrderDonationDetails{message{...textFragment}emailReceipt emailReceiptToken status{...textFragment}errorStatus}fragment orderLineItem on OrderLineItem{id uniqueId actions{contactSeller cancel addToCart configureCake reviewItem resendEGiftCardToken protectionPlan{...orderActionFragment}manageProtectionPlan{...orderActionFragment}}isGift digitalDeliveryMessage quantity quantityString quantityLabel isSubstitutionSelected fulfilledItems{id quantityString priceInfo{itemPrice{value}}productInfo{usItemId name}}isReturnable returnEligibilityMessage productInfo{name usItemId imageInfo{thumbnailUrl}canonicalUrl offerId orderLimit orderMinLimit weightIncrement salesUnit salesUnitType isSubstitutionEligible isAlcohol}reshop{reshopMessage isShippingAvailable minPromiseDate maxPromiseDate}selectedVariants{...variants}variantAdditionalInfo{parts{text nativeAction}}priceInfo{priceDisplayCodes{showItemPrice priceDisplayCondition finalCostByWeight}itemPrice{...price}linePrice{...price}unitPrice{...price}preDiscountedLinePrice{...price}additionalLines{name value}}discounts{label labelText{...textFragment}}itemReviewed activationCodes{label code}protectionPlanMessage{...textFragment}showSeller isShippedByWalmart seller{id name isPro}digitalDeliveryPhoneNumber addOns{...OrderAddOn}multiboxBundleId}fragment DriverFragment on Driver{id firstName photoUrl}fragment OrderGroupFragment on OrderGroup{driver{...DriverFragment}deliveryDate fulfillmentType status{...OrderGroupStatusFragment}showSeller isShippedByWalmart seller{...SellerFragment}id itemCount items{...LiteLineItemFragment}pickupPerson{firstName lastName email}accessPointId shipment{...ShipmentFragment}returnEligibilityMessage actions{...OrderGroupActionsFragment}recipientEmailAddress digitalDelivery{...DigitalDeliveryFragment}tireInstallationReservation{status extraText reservationId}}fragment OrderGroupStatusFragment on OrderGroupStatus{statusType showStatusTracker statusTracker{status label isCurrent}message{...textFragment}subtext subMessage{...textFragment}notice helpCenterText{...textFragment}}fragment textFragment on Text{parts{bold url text nativeAction lineBreak}}fragment LiteLineItemFragment on OrderLineItem{id quantity productInfo{name usItemId imageInfo{thumbnailUrl}offerId isAlcohol}priceInfo{linePrice{...price}}}fragment SellerFragment on GroupSeller{id name isPro}fragment DigitalDeliveryFragment on DigitalDelivery{title name instructions{...textFragment}}fragment ShipmentFragment on Shipment{id trackingNumber isExternalTracking trackingUrl proofOfDelivery{...ProofOfDeliveryFragment}}fragment OrderGroupActionsFragment on OrderGroupActions{reorder edit track changeSlot checkin editDeliveryInstructions editPickupPerson editTip tip rateDriver cancel enableTip{...orderActionFragment}enableEdit{...orderActionFragment}rescheduleTireInstall{...orderActionFragment}cancelTireInstall{...orderActionFragment}help viewCancellationDetails{...cancellationDetailsActionFragment}}fragment cancellationDetailsActionFragment on CancellationDetailsAction{label heading text{...textFragment}}fragment ProofOfDeliveryFragment on ProofOfDelivery{photoUrl photoPreviewUrl showPreview}fragment DeliveryInstructionsFragment on DeliveryInstructions{text type typeText}fragment GiftDetailsFragment on GiftDetails{recipientAddress{fullName}recipientEmail senderName giftMessage}fragment SubstitutionAction on SubstitutionAction{message label type}fragment ODPGroupCategoryFragment on OrderCategory{type name subtext returnMessage substitutionsBanner{...textFragment}showExtendedSubstitutions actions{substitutions{...SubstitutionAction}nilPickReshop{message action{text url}}returnDetails viewCancellationDetails{...cancellationDetailsActionFragment}trackOnInHomeApp}banner{...textFragment}accordionState items{...orderLineItem}substitutions{...orderLineItem fulfilledItems{...orderLineItem}}returnInfo{...returnInfoFragment}}fragment ODPGroupFragment on OrderGroup{id fulfillmentType deliveryMessage deliveryAddress{fullName firstName lastName address{...addressFragment}}deliveryInstructions{...DeliveryInstructionsFragment}deliveryPreferences{text{...textFragment}cta{...orderActionFragment}}editSubstitutionsCutOff status{statusType showStatusTracker message{...textFragment}notice helpCenterText{...textFragment}}itemCount isCategorized categories{...ODPGroupCategoryFragment}seller{id name isPro}shipment{id trackingNumber}actions{reorder edit track changeSlot checkin editDeliveryInstructions editPickupPerson tip cancel help enableTip{...orderActionFragment}enableEdit{...orderActionFragment}viewCancellationDetails{...cancellationDetailsActionFragment}enableInHome{...orderActionFragment}createGiftReceipt}cutOffTimestamp isEditSubstitutionsEligible isInHome giftDetails{...GiftDetailsFragment}donationDetails{...orderDonationDetails}}fragment returnInfoFragment on ReturnInfo{returnOrderId type refundPriceDetails{__typename...refundPriceDetailsFragment}refundMessage tierRefundMessage paymentMethods{__typename description cardType paymentType displayValues message{...textFragment}}actions{__typename generate scheduleOrModifyPickup{text url}reschedulePickup editPickupContact}shippingLabelUrl qrCodeImageUrl carriers{__typename id name}pickupCarrier pickupContact{nameAndAddress{fullName firstName lastName address{addressString city state postalCode addressLineOne addressLineTwo country}}phone}pickupConfirmationNumber bannerMessage{...textFragment}}fragment refundPriceDetailsFragment on RefundPriceDetails{subTotal{__typename...orderPriceDetailRowFragment}fees{__typename...orderPriceDetailRowFragment}discounts{__typename...orderPriceDetailRowFragment}taxTotal{__typename...orderPriceDetailRowFragment}grandTotal{__typename...orderPriceDetailRowFragment}}fragment orderPriceDetailRowFragment on OrderPriceDetailRow{label displayValue value info{__typename title message}}fragment addressFragment on OrderAddress{addressString addressLineOne addressLineTwo state postalCode city}fragment ODPPickupInfo on OrderGroup{pickupInstructions pickupPerson{...person}alternatePickupPerson{...person}store{id name address{...addressFragment}}}fragment person on OrderPickupPerson{firstName lastName email}fragment ODPTippingInfo on OrderGroup{addTipMessage{...textFragment}driver{...DriverFragment}tipping{min{...price}max{...price}suggested{...price}preselected}subtotal{...price}}fragment orderActionFragment on Action{text url}fragment orderCustomer on OrderCustomer{id firstName lastName email isGuest isEmailRegistered}fragment OrderFieldsFragment on Order{__typename id version type customer{...orderCustomer}displayId idBarcodeImageUrl(barWidth:3 barHeight:100) isFuelPurchase title shortTitle timezone tippableGroup{...OrderGroupFragment}amendableGroup{id changeSlotIterationsLeft cutOffTimestamp fulfillmentType deliveryAddress{fullName firstName lastName address{addressString addressLineOne addressLineTwo state postalCode city country}}isAmendInProgress}substitutionsBanner{heading subheading longSubheading}groups_2101{__typename...OrderGroupFragment...ODPGroupFragment...ODPPickupInfo...ODPTippingInfo}multiboxBundles{...orderLineItem}itemCancelReasons{__typename...cancelReason}groupCancelReasons{__typename...cancelReason}priceDetails{__typename subTotal{__typename...priceDetailFragment}taxTotal{__typename...priceDetailFragment}grandTotal{__typename...priceDetailFragment}authorizationAmount{__typename...priceDetailFragment}fees{__typename...priceDetailFragment}discounts{__typename...priceDetailFragment}minimumThreshold{__typename...price}belowMinimumFee{__typename...priceDetailFragment}driverTip{__typename...priceDetailFragment}donations{__typename...priceDetailFragment}}paymentMethods{__typename description cardType paymentType displayValues message{...textFragment}actions{connectToCapitalOne{...orderActionFragment}visitAffirm{...orderActionFragment}}}actions{__typename return pendingReturn cancel startReturn{...orderActionFragment}reorder}banners{...textFragment}}","variables":{"orderId":"3332211081452","emailAddress":"alexnanajan@yahoo.com"}}' \
  --compressed`
 
  if [[ $curl4 =~ "blocked" ]]; then
    link4=`echo $curl4 | jq '.redirectUrl' | sed 's/"//g'`
    `open -n -a /Applications/Microsoft\ Edge.app --args --profile-directory=Default https://walmart.com$link4`
    read -n 1 -p "blocked"
  else
    break
  fi
done

if [[ $curl4 =~ "error" ]]; then
    echo "4-Sai info"
    echo "'3332211081452" >> track-OrderID.txt
    echo "alexnanajan@yahoo.com" >> track-email.txt
    echo "Sai info" >> track-usItemId.txt
    echo "Sai info" >> track-priceValue.txt
    echo "Sai info" >> track-fullName.txt
    echo "Sai info" >> track-address.txt
    echo "Sai info" >> track-status.txt
    echo "Sai info" >> track-number.txt
    echo "Sai info" >> track-url.txt
    echo "Sai info" >> track-categoriesType.txt
else
    sum4=`md5 track-OrderID.txt`
    for (( i=0; i<=4; i++ ))
    do
        for (( j=0; j<=4; j++))
        do
            if [[ `echo $curl4 | jq '.data.guestOrder.groups_2101['${i[@]}'].items['${j[@]}'].productInfo.usItemId'` == '"958476019"' ]]; then
                echo "'3332211081452" >> track-OrderID.txt
                echo alexnanajan@yahoo.com >> track-email.txt
                echo $curl4 | jq '.data.guestOrder.groups_2101['${i[@]}'].items['${j[@]}'].productInfo.usItemId' >> track-usItemId.txt
                echo $curl4 | jq '.data.guestOrder.groups_2101['${i[@]}'].items['${j[@]}'].priceInfo.linePrice.value' >> track-priceValue.txt
                echo $curl4 | jq '.data.guestOrder.groups_2101['${i[@]}'].deliveryAddress.fullName' >> track-fullName.txt
                echo $curl4 | jq '.data.guestOrder.groups_2101['${i[@]}'].deliveryAddress.address.addressString' >> track-address.txt
                echo $curl4 | jq '.data.guestOrder.groups_2101['${i[@]}'].status.message.parts[].text' >> track-status.txt
                echo $curl4 | jq '.data.guestOrder.groups_2101['${i[@]}'].shipment.trackingNumber' | sed 's/null//g' >> track-number.txt
                echo $curl4 | jq '.data.guestOrder.groups_2101['${i[@]}'].shipment.trackingUrl' | sed 's/null//g' >> track-url.txt
                echo $curl4 | jq '.data.guestOrder.groups_2101['${i[@]}'].categories[].type' >> track-categoriesType.txt

                break
            fi
        done
    done
    if [[ $sum4 == `md5 track-OrderID.txt` ]]; then
        echo "4-Khác Item"
        echo "'3332211081452" >> track-OrderID.txt
        echo "alexnanajan@yahoo.com" >> track-email.txt
        echo "Khác Item" >> track-usItemId.txt
        echo "Khác Item" >> track-priceValue.txt
        echo "Khác Item" >> track-fullName.txt
        echo "Khác Item" >> track-address.txt
        echo "Khác Item" >> track-status.txt
        echo "Khác Item" >> track-number.txt
        echo "Khác Item" >> track-url.txt
        echo "Khác Item" >> track-categoriesType.txt
    else
        echo "4"
    fi   
fi
while true
do
curl5=`curl -s 'https://www.walmart.com/orchestra/home/graphql' \
  -H 'authority: www.walmart.com' \
  -H 'sec-ch-ua: " Not;A Brand";v="99", "Microsoft Edge";v="97", "Chromium";v="97"' \
  -H 'x-o-platform: rweb' \
  -H 'dnt: 1' \
  -H 'x-o-correlation-id: pn9BnlEx0zDiyvRGJ6nL5BS9pDN7erB017Nf' \
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
  -H 'user-agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.51 Safari/537.36 Edg/99.0.1150.36' \
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
  --data-raw $'{"query":"query getGuestOrder($orderId:ID\u0021 $emailAddress:String\u0021){guestOrder(input:{id:$orderId emailAddress:$emailAddress}){...OrderFieldsFragment}}fragment cancelReason on OrderCancelReason{__typename subReasonCode subDescription}fragment priceDetailFragment on OrderPriceDetailRow{label value displayValue info{title message}rowInfo{...orderPriceDetailRowInfo}}fragment orderPriceDetailRowInfo on OrderPriceDetailRowInfo{title message{...textFragment}}fragment price on Price{displayValue value}fragment variants on MapEntry{name value}fragment OrderAddOn on OrderAddOn{lineId uniqueLineId productInfo{name usItemId offerId}quantityString quantityLabel type fulfillmentInstructions{...textFragment}actions{manageProtectionPlan{...orderActionFragment}cancel}priceInfo{linePrice{...price}}quantity isActive}fragment orderDonationDetails on OrderDonationDetails{message{...textFragment}emailReceipt emailReceiptToken status{...textFragment}errorStatus}fragment orderLineItem on OrderLineItem{id uniqueId actions{contactSeller cancel addToCart configureCake reviewItem resendEGiftCardToken protectionPlan{...orderActionFragment}manageProtectionPlan{...orderActionFragment}}isGift digitalDeliveryMessage quantity quantityString quantityLabel isSubstitutionSelected fulfilledItems{id quantityString priceInfo{itemPrice{value}}productInfo{usItemId name}}isReturnable returnEligibilityMessage productInfo{name usItemId imageInfo{thumbnailUrl}canonicalUrl offerId orderLimit orderMinLimit weightIncrement salesUnit salesUnitType isSubstitutionEligible isAlcohol}reshop{reshopMessage isShippingAvailable minPromiseDate maxPromiseDate}selectedVariants{...variants}variantAdditionalInfo{parts{text nativeAction}}priceInfo{priceDisplayCodes{showItemPrice priceDisplayCondition finalCostByWeight}itemPrice{...price}linePrice{...price}unitPrice{...price}preDiscountedLinePrice{...price}additionalLines{name value}}discounts{label labelText{...textFragment}}itemReviewed activationCodes{label code}protectionPlanMessage{...textFragment}showSeller isShippedByWalmart seller{id name isPro}digitalDeliveryPhoneNumber addOns{...OrderAddOn}multiboxBundleId}fragment DriverFragment on Driver{id firstName photoUrl}fragment OrderGroupFragment on OrderGroup{driver{...DriverFragment}deliveryDate fulfillmentType status{...OrderGroupStatusFragment}showSeller isShippedByWalmart seller{...SellerFragment}id itemCount items{...LiteLineItemFragment}pickupPerson{firstName lastName email}accessPointId shipment{...ShipmentFragment}returnEligibilityMessage actions{...OrderGroupActionsFragment}recipientEmailAddress digitalDelivery{...DigitalDeliveryFragment}tireInstallationReservation{status extraText reservationId}}fragment OrderGroupStatusFragment on OrderGroupStatus{statusType showStatusTracker statusTracker{status label isCurrent}message{...textFragment}subtext subMessage{...textFragment}notice helpCenterText{...textFragment}}fragment textFragment on Text{parts{bold url text nativeAction lineBreak}}fragment LiteLineItemFragment on OrderLineItem{id quantity productInfo{name usItemId imageInfo{thumbnailUrl}offerId isAlcohol}priceInfo{linePrice{...price}}}fragment SellerFragment on GroupSeller{id name isPro}fragment DigitalDeliveryFragment on DigitalDelivery{title name instructions{...textFragment}}fragment ShipmentFragment on Shipment{id trackingNumber isExternalTracking trackingUrl proofOfDelivery{...ProofOfDeliveryFragment}}fragment OrderGroupActionsFragment on OrderGroupActions{reorder edit track changeSlot checkin editDeliveryInstructions editPickupPerson editTip tip rateDriver cancel enableTip{...orderActionFragment}enableEdit{...orderActionFragment}rescheduleTireInstall{...orderActionFragment}cancelTireInstall{...orderActionFragment}help viewCancellationDetails{...cancellationDetailsActionFragment}}fragment cancellationDetailsActionFragment on CancellationDetailsAction{label heading text{...textFragment}}fragment ProofOfDeliveryFragment on ProofOfDelivery{photoUrl photoPreviewUrl showPreview}fragment DeliveryInstructionsFragment on DeliveryInstructions{text type typeText}fragment GiftDetailsFragment on GiftDetails{recipientAddress{fullName}recipientEmail senderName giftMessage}fragment SubstitutionAction on SubstitutionAction{message label type}fragment ODPGroupCategoryFragment on OrderCategory{type name subtext returnMessage substitutionsBanner{...textFragment}showExtendedSubstitutions actions{substitutions{...SubstitutionAction}nilPickReshop{message action{text url}}returnDetails viewCancellationDetails{...cancellationDetailsActionFragment}trackOnInHomeApp}banner{...textFragment}accordionState items{...orderLineItem}substitutions{...orderLineItem fulfilledItems{...orderLineItem}}returnInfo{...returnInfoFragment}}fragment ODPGroupFragment on OrderGroup{id fulfillmentType deliveryMessage deliveryAddress{fullName firstName lastName address{...addressFragment}}deliveryInstructions{...DeliveryInstructionsFragment}deliveryPreferences{text{...textFragment}cta{...orderActionFragment}}editSubstitutionsCutOff status{statusType showStatusTracker message{...textFragment}notice helpCenterText{...textFragment}}itemCount isCategorized categories{...ODPGroupCategoryFragment}seller{id name isPro}shipment{id trackingNumber}actions{reorder edit track changeSlot checkin editDeliveryInstructions editPickupPerson tip cancel help enableTip{...orderActionFragment}enableEdit{...orderActionFragment}viewCancellationDetails{...cancellationDetailsActionFragment}enableInHome{...orderActionFragment}createGiftReceipt}cutOffTimestamp isEditSubstitutionsEligible isInHome giftDetails{...GiftDetailsFragment}donationDetails{...orderDonationDetails}}fragment returnInfoFragment on ReturnInfo{returnOrderId type refundPriceDetails{__typename...refundPriceDetailsFragment}refundMessage tierRefundMessage paymentMethods{__typename description cardType paymentType displayValues message{...textFragment}}actions{__typename generate scheduleOrModifyPickup{text url}reschedulePickup editPickupContact}shippingLabelUrl qrCodeImageUrl carriers{__typename id name}pickupCarrier pickupContact{nameAndAddress{fullName firstName lastName address{addressString city state postalCode addressLineOne addressLineTwo country}}phone}pickupConfirmationNumber bannerMessage{...textFragment}}fragment refundPriceDetailsFragment on RefundPriceDetails{subTotal{__typename...orderPriceDetailRowFragment}fees{__typename...orderPriceDetailRowFragment}discounts{__typename...orderPriceDetailRowFragment}taxTotal{__typename...orderPriceDetailRowFragment}grandTotal{__typename...orderPriceDetailRowFragment}}fragment orderPriceDetailRowFragment on OrderPriceDetailRow{label displayValue value info{__typename title message}}fragment addressFragment on OrderAddress{addressString addressLineOne addressLineTwo state postalCode city}fragment ODPPickupInfo on OrderGroup{pickupInstructions pickupPerson{...person}alternatePickupPerson{...person}store{id name address{...addressFragment}}}fragment person on OrderPickupPerson{firstName lastName email}fragment ODPTippingInfo on OrderGroup{addTipMessage{...textFragment}driver{...DriverFragment}tipping{min{...price}max{...price}suggested{...price}preselected}subtotal{...price}}fragment orderActionFragment on Action{text url}fragment orderCustomer on OrderCustomer{id firstName lastName email isGuest isEmailRegistered}fragment OrderFieldsFragment on Order{__typename id version type customer{...orderCustomer}displayId idBarcodeImageUrl(barWidth:3 barHeight:100) isFuelPurchase title shortTitle timezone tippableGroup{...OrderGroupFragment}amendableGroup{id changeSlotIterationsLeft cutOffTimestamp fulfillmentType deliveryAddress{fullName firstName lastName address{addressString addressLineOne addressLineTwo state postalCode city country}}isAmendInProgress}substitutionsBanner{heading subheading longSubheading}groups_2101{__typename...OrderGroupFragment...ODPGroupFragment...ODPPickupInfo...ODPTippingInfo}multiboxBundles{...orderLineItem}itemCancelReasons{__typename...cancelReason}groupCancelReasons{__typename...cancelReason}priceDetails{__typename subTotal{__typename...priceDetailFragment}taxTotal{__typename...priceDetailFragment}grandTotal{__typename...priceDetailFragment}authorizationAmount{__typename...priceDetailFragment}fees{__typename...priceDetailFragment}discounts{__typename...priceDetailFragment}minimumThreshold{__typename...price}belowMinimumFee{__typename...priceDetailFragment}driverTip{__typename...priceDetailFragment}donations{__typename...priceDetailFragment}}paymentMethods{__typename description cardType paymentType displayValues message{...textFragment}actions{connectToCapitalOne{...orderActionFragment}visitAffirm{...orderActionFragment}}}actions{__typename return pendingReturn cancel startReturn{...orderActionFragment}reorder}banners{...textFragment}}","variables":{"orderId":"3352214797141","emailAddress":"Leexjckjd1@gmail.com"}}' \
  --compressed`
 
  if [[ $curl5 =~ "blocked" ]]; then
    link5=`echo $curl5 | jq '.redirectUrl' | sed 's/"//g'`
    `open -n -a /Applications/Microsoft\ Edge.app --args --profile-directory=Default https://walmart.com$link5`
    read -n 1 -p "blocked"
  else
    break
  fi
done

if [[ $curl5 =~ "error" ]]; then
    echo "5-Sai info"
    echo "'3352214797141" >> track-OrderID.txt
    echo "Leexjckjd1@gmail.com" >> track-email.txt
    echo "Sai info" >> track-usItemId.txt
    echo "Sai info" >> track-priceValue.txt
    echo "Sai info" >> track-fullName.txt
    echo "Sai info" >> track-address.txt
    echo "Sai info" >> track-status.txt
    echo "Sai info" >> track-number.txt
    echo "Sai info" >> track-url.txt
    echo "Sai info" >> track-categoriesType.txt
else
    sum5=`md5 track-OrderID.txt`
    for (( i=0; i<=4; i++ ))
    do
        for (( j=0; j<=4; j++))
        do
            if [[ `echo $curl5 | jq '.data.guestOrder.groups_2101['${i[@]}'].items['${j[@]}'].productInfo.usItemId'` == '"520551642"' ]]; then
                echo "'3352214797141" >> track-OrderID.txt
                echo Leexjckjd1@gmail.com >> track-email.txt
                echo $curl5 | jq '.data.guestOrder.groups_2101['${i[@]}'].items['${j[@]}'].productInfo.usItemId' >> track-usItemId.txt
                echo $curl5 | jq '.data.guestOrder.groups_2101['${i[@]}'].items['${j[@]}'].priceInfo.linePrice.value' >> track-priceValue.txt
                echo $curl5 | jq '.data.guestOrder.groups_2101['${i[@]}'].deliveryAddress.fullName' >> track-fullName.txt
                echo $curl5 | jq '.data.guestOrder.groups_2101['${i[@]}'].deliveryAddress.address.addressString' >> track-address.txt
                echo $curl5 | jq '.data.guestOrder.groups_2101['${i[@]}'].status.message.parts[].text' >> track-status.txt
                echo $curl5 | jq '.data.guestOrder.groups_2101['${i[@]}'].shipment.trackingNumber' | sed 's/null//g' >> track-number.txt
                echo $curl5 | jq '.data.guestOrder.groups_2101['${i[@]}'].shipment.trackingUrl' | sed 's/null//g' >> track-url.txt
                echo $curl5 | jq '.data.guestOrder.groups_2101['${i[@]}'].categories[].type' >> track-categoriesType.txt

                break
            fi
        done
    done
    if [[ $sum5 == `md5 track-OrderID.txt` ]]; then
        echo "5-Khác Item"
        echo "'3352214797141" >> track-OrderID.txt
        echo "Leexjckjd1@gmail.com" >> track-email.txt
        echo "Khác Item" >> track-usItemId.txt
        echo "Khác Item" >> track-priceValue.txt
        echo "Khác Item" >> track-fullName.txt
        echo "Khác Item" >> track-address.txt
        echo "Khác Item" >> track-status.txt
        echo "Khác Item" >> track-number.txt
        echo "Khác Item" >> track-url.txt
        echo "Khác Item" >> track-categoriesType.txt
    else
        echo "5"
    fi   
fi
while true
do
curl6=`curl -s 'https://www.walmart.com/orchestra/home/graphql' \
  -H 'authority: www.walmart.com' \
  -H 'sec-ch-ua: " Not;A Brand";v="99", "Microsoft Edge";v="97", "Chromium";v="97"' \
  -H 'x-o-platform: rweb' \
  -H 'dnt: 1' \
  -H 'x-o-correlation-id: pn9BnlEx0zDiyvRGJ6nL5BS9pDN7erB017Nf' \
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
  -H 'user-agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.51 Safari/537.36 Edg/99.0.1150.36' \
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
  --data-raw $'{"query":"query getGuestOrder($orderId:ID\u0021 $emailAddress:String\u0021){guestOrder(input:{id:$orderId emailAddress:$emailAddress}){...OrderFieldsFragment}}fragment cancelReason on OrderCancelReason{__typename subReasonCode subDescription}fragment priceDetailFragment on OrderPriceDetailRow{label value displayValue info{title message}rowInfo{...orderPriceDetailRowInfo}}fragment orderPriceDetailRowInfo on OrderPriceDetailRowInfo{title message{...textFragment}}fragment price on Price{displayValue value}fragment variants on MapEntry{name value}fragment OrderAddOn on OrderAddOn{lineId uniqueLineId productInfo{name usItemId offerId}quantityString quantityLabel type fulfillmentInstructions{...textFragment}actions{manageProtectionPlan{...orderActionFragment}cancel}priceInfo{linePrice{...price}}quantity isActive}fragment orderDonationDetails on OrderDonationDetails{message{...textFragment}emailReceipt emailReceiptToken status{...textFragment}errorStatus}fragment orderLineItem on OrderLineItem{id uniqueId actions{contactSeller cancel addToCart configureCake reviewItem resendEGiftCardToken protectionPlan{...orderActionFragment}manageProtectionPlan{...orderActionFragment}}isGift digitalDeliveryMessage quantity quantityString quantityLabel isSubstitutionSelected fulfilledItems{id quantityString priceInfo{itemPrice{value}}productInfo{usItemId name}}isReturnable returnEligibilityMessage productInfo{name usItemId imageInfo{thumbnailUrl}canonicalUrl offerId orderLimit orderMinLimit weightIncrement salesUnit salesUnitType isSubstitutionEligible isAlcohol}reshop{reshopMessage isShippingAvailable minPromiseDate maxPromiseDate}selectedVariants{...variants}variantAdditionalInfo{parts{text nativeAction}}priceInfo{priceDisplayCodes{showItemPrice priceDisplayCondition finalCostByWeight}itemPrice{...price}linePrice{...price}unitPrice{...price}preDiscountedLinePrice{...price}additionalLines{name value}}discounts{label labelText{...textFragment}}itemReviewed activationCodes{label code}protectionPlanMessage{...textFragment}showSeller isShippedByWalmart seller{id name isPro}digitalDeliveryPhoneNumber addOns{...OrderAddOn}multiboxBundleId}fragment DriverFragment on Driver{id firstName photoUrl}fragment OrderGroupFragment on OrderGroup{driver{...DriverFragment}deliveryDate fulfillmentType status{...OrderGroupStatusFragment}showSeller isShippedByWalmart seller{...SellerFragment}id itemCount items{...LiteLineItemFragment}pickupPerson{firstName lastName email}accessPointId shipment{...ShipmentFragment}returnEligibilityMessage actions{...OrderGroupActionsFragment}recipientEmailAddress digitalDelivery{...DigitalDeliveryFragment}tireInstallationReservation{status extraText reservationId}}fragment OrderGroupStatusFragment on OrderGroupStatus{statusType showStatusTracker statusTracker{status label isCurrent}message{...textFragment}subtext subMessage{...textFragment}notice helpCenterText{...textFragment}}fragment textFragment on Text{parts{bold url text nativeAction lineBreak}}fragment LiteLineItemFragment on OrderLineItem{id quantity productInfo{name usItemId imageInfo{thumbnailUrl}offerId isAlcohol}priceInfo{linePrice{...price}}}fragment SellerFragment on GroupSeller{id name isPro}fragment DigitalDeliveryFragment on DigitalDelivery{title name instructions{...textFragment}}fragment ShipmentFragment on Shipment{id trackingNumber isExternalTracking trackingUrl proofOfDelivery{...ProofOfDeliveryFragment}}fragment OrderGroupActionsFragment on OrderGroupActions{reorder edit track changeSlot checkin editDeliveryInstructions editPickupPerson editTip tip rateDriver cancel enableTip{...orderActionFragment}enableEdit{...orderActionFragment}rescheduleTireInstall{...orderActionFragment}cancelTireInstall{...orderActionFragment}help viewCancellationDetails{...cancellationDetailsActionFragment}}fragment cancellationDetailsActionFragment on CancellationDetailsAction{label heading text{...textFragment}}fragment ProofOfDeliveryFragment on ProofOfDelivery{photoUrl photoPreviewUrl showPreview}fragment DeliveryInstructionsFragment on DeliveryInstructions{text type typeText}fragment GiftDetailsFragment on GiftDetails{recipientAddress{fullName}recipientEmail senderName giftMessage}fragment SubstitutionAction on SubstitutionAction{message label type}fragment ODPGroupCategoryFragment on OrderCategory{type name subtext returnMessage substitutionsBanner{...textFragment}showExtendedSubstitutions actions{substitutions{...SubstitutionAction}nilPickReshop{message action{text url}}returnDetails viewCancellationDetails{...cancellationDetailsActionFragment}trackOnInHomeApp}banner{...textFragment}accordionState items{...orderLineItem}substitutions{...orderLineItem fulfilledItems{...orderLineItem}}returnInfo{...returnInfoFragment}}fragment ODPGroupFragment on OrderGroup{id fulfillmentType deliveryMessage deliveryAddress{fullName firstName lastName address{...addressFragment}}deliveryInstructions{...DeliveryInstructionsFragment}deliveryPreferences{text{...textFragment}cta{...orderActionFragment}}editSubstitutionsCutOff status{statusType showStatusTracker message{...textFragment}notice helpCenterText{...textFragment}}itemCount isCategorized categories{...ODPGroupCategoryFragment}seller{id name isPro}shipment{id trackingNumber}actions{reorder edit track changeSlot checkin editDeliveryInstructions editPickupPerson tip cancel help enableTip{...orderActionFragment}enableEdit{...orderActionFragment}viewCancellationDetails{...cancellationDetailsActionFragment}enableInHome{...orderActionFragment}createGiftReceipt}cutOffTimestamp isEditSubstitutionsEligible isInHome giftDetails{...GiftDetailsFragment}donationDetails{...orderDonationDetails}}fragment returnInfoFragment on ReturnInfo{returnOrderId type refundPriceDetails{__typename...refundPriceDetailsFragment}refundMessage tierRefundMessage paymentMethods{__typename description cardType paymentType displayValues message{...textFragment}}actions{__typename generate scheduleOrModifyPickup{text url}reschedulePickup editPickupContact}shippingLabelUrl qrCodeImageUrl carriers{__typename id name}pickupCarrier pickupContact{nameAndAddress{fullName firstName lastName address{addressString city state postalCode addressLineOne addressLineTwo country}}phone}pickupConfirmationNumber bannerMessage{...textFragment}}fragment refundPriceDetailsFragment on RefundPriceDetails{subTotal{__typename...orderPriceDetailRowFragment}fees{__typename...orderPriceDetailRowFragment}discounts{__typename...orderPriceDetailRowFragment}taxTotal{__typename...orderPriceDetailRowFragment}grandTotal{__typename...orderPriceDetailRowFragment}}fragment orderPriceDetailRowFragment on OrderPriceDetailRow{label displayValue value info{__typename title message}}fragment addressFragment on OrderAddress{addressString addressLineOne addressLineTwo state postalCode city}fragment ODPPickupInfo on OrderGroup{pickupInstructions pickupPerson{...person}alternatePickupPerson{...person}store{id name address{...addressFragment}}}fragment person on OrderPickupPerson{firstName lastName email}fragment ODPTippingInfo on OrderGroup{addTipMessage{...textFragment}driver{...DriverFragment}tipping{min{...price}max{...price}suggested{...price}preselected}subtotal{...price}}fragment orderActionFragment on Action{text url}fragment orderCustomer on OrderCustomer{id firstName lastName email isGuest isEmailRegistered}fragment OrderFieldsFragment on Order{__typename id version type customer{...orderCustomer}displayId idBarcodeImageUrl(barWidth:3 barHeight:100) isFuelPurchase title shortTitle timezone tippableGroup{...OrderGroupFragment}amendableGroup{id changeSlotIterationsLeft cutOffTimestamp fulfillmentType deliveryAddress{fullName firstName lastName address{addressString addressLineOne addressLineTwo state postalCode city country}}isAmendInProgress}substitutionsBanner{heading subheading longSubheading}groups_2101{__typename...OrderGroupFragment...ODPGroupFragment...ODPPickupInfo...ODPTippingInfo}multiboxBundles{...orderLineItem}itemCancelReasons{__typename...cancelReason}groupCancelReasons{__typename...cancelReason}priceDetails{__typename subTotal{__typename...priceDetailFragment}taxTotal{__typename...priceDetailFragment}grandTotal{__typename...priceDetailFragment}authorizationAmount{__typename...priceDetailFragment}fees{__typename...priceDetailFragment}discounts{__typename...priceDetailFragment}minimumThreshold{__typename...price}belowMinimumFee{__typename...priceDetailFragment}driverTip{__typename...priceDetailFragment}donations{__typename...priceDetailFragment}}paymentMethods{__typename description cardType paymentType displayValues message{...textFragment}actions{connectToCapitalOne{...orderActionFragment}visitAffirm{...orderActionFragment}}}actions{__typename return pendingReturn cancel startReturn{...orderActionFragment}reorder}banners{...textFragment}}","variables":{"orderId":"3382219955706","emailAddress":"allen_angelica@icloud.com"}}' \
  --compressed`
 
  if [[ $curl6 =~ "blocked" ]]; then
    link6=`echo $curl6 | jq '.redirectUrl' | sed 's/"//g'`
    `open -n -a /Applications/Microsoft\ Edge.app --args --profile-directory=Default https://walmart.com$link6`
    read -n 1 -p "blocked"
  else
    break
  fi
done

if [[ $curl6 =~ "error" ]]; then
    echo "6-Sai info"
    echo "'3382219955706" >> track-OrderID.txt
    echo "allen_angelica@icloud.com" >> track-email.txt
    echo "Sai info" >> track-usItemId.txt
    echo "Sai info" >> track-priceValue.txt
    echo "Sai info" >> track-fullName.txt
    echo "Sai info" >> track-address.txt
    echo "Sai info" >> track-status.txt
    echo "Sai info" >> track-number.txt
    echo "Sai info" >> track-url.txt
    echo "Sai info" >> track-categoriesType.txt
else
    sum6=`md5 track-OrderID.txt`
    for (( i=0; i<=4; i++ ))
    do
        for (( j=0; j<=4; j++))
        do
            if [[ `echo $curl6 | jq '.data.guestOrder.groups_2101['${i[@]}'].items['${j[@]}'].productInfo.usItemId'` == '"240828726"' ]]; then
                echo "'3382219955706" >> track-OrderID.txt
                echo allen_angelica@icloud.com >> track-email.txt
                echo $curl6 | jq '.data.guestOrder.groups_2101['${i[@]}'].items['${j[@]}'].productInfo.usItemId' >> track-usItemId.txt
                echo $curl6 | jq '.data.guestOrder.groups_2101['${i[@]}'].items['${j[@]}'].priceInfo.linePrice.value' >> track-priceValue.txt
                echo $curl6 | jq '.data.guestOrder.groups_2101['${i[@]}'].deliveryAddress.fullName' >> track-fullName.txt
                echo $curl6 | jq '.data.guestOrder.groups_2101['${i[@]}'].deliveryAddress.address.addressString' >> track-address.txt
                echo $curl6 | jq '.data.guestOrder.groups_2101['${i[@]}'].status.message.parts[].text' >> track-status.txt
                echo $curl6 | jq '.data.guestOrder.groups_2101['${i[@]}'].shipment.trackingNumber' | sed 's/null//g' >> track-number.txt
                echo $curl6 | jq '.data.guestOrder.groups_2101['${i[@]}'].shipment.trackingUrl' | sed 's/null//g' >> track-url.txt
                echo $curl6 | jq '.data.guestOrder.groups_2101['${i[@]}'].categories[].type' >> track-categoriesType.txt

                break
            fi
        done
    done
    if [[ $sum6 == `md5 track-OrderID.txt` ]]; then
        echo "6-Khác Item"
        echo "'3382219955706" >> track-OrderID.txt
        echo "allen_angelica@icloud.com" >> track-email.txt
        echo "Khác Item" >> track-usItemId.txt
        echo "Khác Item" >> track-priceValue.txt
        echo "Khác Item" >> track-fullName.txt
        echo "Khác Item" >> track-address.txt
        echo "Khác Item" >> track-status.txt
        echo "Khác Item" >> track-number.txt
        echo "Khác Item" >> track-url.txt
        echo "Khác Item" >> track-categoriesType.txt
    else
        echo "6"
    fi   
fi
while true
do
curl7=`curl -s 'https://www.walmart.com/orchestra/home/graphql' \
  -H 'authority: www.walmart.com' \
  -H 'sec-ch-ua: " Not;A Brand";v="99", "Microsoft Edge";v="97", "Chromium";v="97"' \
  -H 'x-o-platform: rweb' \
  -H 'dnt: 1' \
  -H 'x-o-correlation-id: pn9BnlEx0zDiyvRGJ6nL5BS9pDN7erB017Nf' \
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
  -H 'user-agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.51 Safari/537.36 Edg/99.0.1150.36' \
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
  --data-raw $'{"query":"query getGuestOrder($orderId:ID\u0021 $emailAddress:String\u0021){guestOrder(input:{id:$orderId emailAddress:$emailAddress}){...OrderFieldsFragment}}fragment cancelReason on OrderCancelReason{__typename subReasonCode subDescription}fragment priceDetailFragment on OrderPriceDetailRow{label value displayValue info{title message}rowInfo{...orderPriceDetailRowInfo}}fragment orderPriceDetailRowInfo on OrderPriceDetailRowInfo{title message{...textFragment}}fragment price on Price{displayValue value}fragment variants on MapEntry{name value}fragment OrderAddOn on OrderAddOn{lineId uniqueLineId productInfo{name usItemId offerId}quantityString quantityLabel type fulfillmentInstructions{...textFragment}actions{manageProtectionPlan{...orderActionFragment}cancel}priceInfo{linePrice{...price}}quantity isActive}fragment orderDonationDetails on OrderDonationDetails{message{...textFragment}emailReceipt emailReceiptToken status{...textFragment}errorStatus}fragment orderLineItem on OrderLineItem{id uniqueId actions{contactSeller cancel addToCart configureCake reviewItem resendEGiftCardToken protectionPlan{...orderActionFragment}manageProtectionPlan{...orderActionFragment}}isGift digitalDeliveryMessage quantity quantityString quantityLabel isSubstitutionSelected fulfilledItems{id quantityString priceInfo{itemPrice{value}}productInfo{usItemId name}}isReturnable returnEligibilityMessage productInfo{name usItemId imageInfo{thumbnailUrl}canonicalUrl offerId orderLimit orderMinLimit weightIncrement salesUnit salesUnitType isSubstitutionEligible isAlcohol}reshop{reshopMessage isShippingAvailable minPromiseDate maxPromiseDate}selectedVariants{...variants}variantAdditionalInfo{parts{text nativeAction}}priceInfo{priceDisplayCodes{showItemPrice priceDisplayCondition finalCostByWeight}itemPrice{...price}linePrice{...price}unitPrice{...price}preDiscountedLinePrice{...price}additionalLines{name value}}discounts{label labelText{...textFragment}}itemReviewed activationCodes{label code}protectionPlanMessage{...textFragment}showSeller isShippedByWalmart seller{id name isPro}digitalDeliveryPhoneNumber addOns{...OrderAddOn}multiboxBundleId}fragment DriverFragment on Driver{id firstName photoUrl}fragment OrderGroupFragment on OrderGroup{driver{...DriverFragment}deliveryDate fulfillmentType status{...OrderGroupStatusFragment}showSeller isShippedByWalmart seller{...SellerFragment}id itemCount items{...LiteLineItemFragment}pickupPerson{firstName lastName email}accessPointId shipment{...ShipmentFragment}returnEligibilityMessage actions{...OrderGroupActionsFragment}recipientEmailAddress digitalDelivery{...DigitalDeliveryFragment}tireInstallationReservation{status extraText reservationId}}fragment OrderGroupStatusFragment on OrderGroupStatus{statusType showStatusTracker statusTracker{status label isCurrent}message{...textFragment}subtext subMessage{...textFragment}notice helpCenterText{...textFragment}}fragment textFragment on Text{parts{bold url text nativeAction lineBreak}}fragment LiteLineItemFragment on OrderLineItem{id quantity productInfo{name usItemId imageInfo{thumbnailUrl}offerId isAlcohol}priceInfo{linePrice{...price}}}fragment SellerFragment on GroupSeller{id name isPro}fragment DigitalDeliveryFragment on DigitalDelivery{title name instructions{...textFragment}}fragment ShipmentFragment on Shipment{id trackingNumber isExternalTracking trackingUrl proofOfDelivery{...ProofOfDeliveryFragment}}fragment OrderGroupActionsFragment on OrderGroupActions{reorder edit track changeSlot checkin editDeliveryInstructions editPickupPerson editTip tip rateDriver cancel enableTip{...orderActionFragment}enableEdit{...orderActionFragment}rescheduleTireInstall{...orderActionFragment}cancelTireInstall{...orderActionFragment}help viewCancellationDetails{...cancellationDetailsActionFragment}}fragment cancellationDetailsActionFragment on CancellationDetailsAction{label heading text{...textFragment}}fragment ProofOfDeliveryFragment on ProofOfDelivery{photoUrl photoPreviewUrl showPreview}fragment DeliveryInstructionsFragment on DeliveryInstructions{text type typeText}fragment GiftDetailsFragment on GiftDetails{recipientAddress{fullName}recipientEmail senderName giftMessage}fragment SubstitutionAction on SubstitutionAction{message label type}fragment ODPGroupCategoryFragment on OrderCategory{type name subtext returnMessage substitutionsBanner{...textFragment}showExtendedSubstitutions actions{substitutions{...SubstitutionAction}nilPickReshop{message action{text url}}returnDetails viewCancellationDetails{...cancellationDetailsActionFragment}trackOnInHomeApp}banner{...textFragment}accordionState items{...orderLineItem}substitutions{...orderLineItem fulfilledItems{...orderLineItem}}returnInfo{...returnInfoFragment}}fragment ODPGroupFragment on OrderGroup{id fulfillmentType deliveryMessage deliveryAddress{fullName firstName lastName address{...addressFragment}}deliveryInstructions{...DeliveryInstructionsFragment}deliveryPreferences{text{...textFragment}cta{...orderActionFragment}}editSubstitutionsCutOff status{statusType showStatusTracker message{...textFragment}notice helpCenterText{...textFragment}}itemCount isCategorized categories{...ODPGroupCategoryFragment}seller{id name isPro}shipment{id trackingNumber}actions{reorder edit track changeSlot checkin editDeliveryInstructions editPickupPerson tip cancel help enableTip{...orderActionFragment}enableEdit{...orderActionFragment}viewCancellationDetails{...cancellationDetailsActionFragment}enableInHome{...orderActionFragment}createGiftReceipt}cutOffTimestamp isEditSubstitutionsEligible isInHome giftDetails{...GiftDetailsFragment}donationDetails{...orderDonationDetails}}fragment returnInfoFragment on ReturnInfo{returnOrderId type refundPriceDetails{__typename...refundPriceDetailsFragment}refundMessage tierRefundMessage paymentMethods{__typename description cardType paymentType displayValues message{...textFragment}}actions{__typename generate scheduleOrModifyPickup{text url}reschedulePickup editPickupContact}shippingLabelUrl qrCodeImageUrl carriers{__typename id name}pickupCarrier pickupContact{nameAndAddress{fullName firstName lastName address{addressString city state postalCode addressLineOne addressLineTwo country}}phone}pickupConfirmationNumber bannerMessage{...textFragment}}fragment refundPriceDetailsFragment on RefundPriceDetails{subTotal{__typename...orderPriceDetailRowFragment}fees{__typename...orderPriceDetailRowFragment}discounts{__typename...orderPriceDetailRowFragment}taxTotal{__typename...orderPriceDetailRowFragment}grandTotal{__typename...orderPriceDetailRowFragment}}fragment orderPriceDetailRowFragment on OrderPriceDetailRow{label displayValue value info{__typename title message}}fragment addressFragment on OrderAddress{addressString addressLineOne addressLineTwo state postalCode city}fragment ODPPickupInfo on OrderGroup{pickupInstructions pickupPerson{...person}alternatePickupPerson{...person}store{id name address{...addressFragment}}}fragment person on OrderPickupPerson{firstName lastName email}fragment ODPTippingInfo on OrderGroup{addTipMessage{...textFragment}driver{...DriverFragment}tipping{min{...price}max{...price}suggested{...price}preselected}subtotal{...price}}fragment orderActionFragment on Action{text url}fragment orderCustomer on OrderCustomer{id firstName lastName email isGuest isEmailRegistered}fragment OrderFieldsFragment on Order{__typename id version type customer{...orderCustomer}displayId idBarcodeImageUrl(barWidth:3 barHeight:100) isFuelPurchase title shortTitle timezone tippableGroup{...OrderGroupFragment}amendableGroup{id changeSlotIterationsLeft cutOffTimestamp fulfillmentType deliveryAddress{fullName firstName lastName address{addressString addressLineOne addressLineTwo state postalCode city country}}isAmendInProgress}substitutionsBanner{heading subheading longSubheading}groups_2101{__typename...OrderGroupFragment...ODPGroupFragment...ODPPickupInfo...ODPTippingInfo}multiboxBundles{...orderLineItem}itemCancelReasons{__typename...cancelReason}groupCancelReasons{__typename...cancelReason}priceDetails{__typename subTotal{__typename...priceDetailFragment}taxTotal{__typename...priceDetailFragment}grandTotal{__typename...priceDetailFragment}authorizationAmount{__typename...priceDetailFragment}fees{__typename...priceDetailFragment}discounts{__typename...priceDetailFragment}minimumThreshold{__typename...price}belowMinimumFee{__typename...priceDetailFragment}driverTip{__typename...priceDetailFragment}donations{__typename...priceDetailFragment}}paymentMethods{__typename description cardType paymentType displayValues message{...textFragment}actions{connectToCapitalOne{...orderActionFragment}visitAffirm{...orderActionFragment}}}actions{__typename return pendingReturn cancel startReturn{...orderActionFragment}reorder}banners{...textFragment}}","variables":{"orderId":"3372218863963","emailAddress":"hoangthai07.nguyen@outlook.com"}}' \
  --compressed`
 
  if [[ $curl7 =~ "blocked" ]]; then
    link7=`echo $curl7 | jq '.redirectUrl' | sed 's/"//g'`
    `open -n -a /Applications/Microsoft\ Edge.app --args --profile-directory=Default https://walmart.com$link7`
    read -n 1 -p "blocked"
  else
    break
  fi
done

if [[ $curl7 =~ "error" ]]; then
    echo "7-Sai info"
    echo "'3372218863963" >> track-OrderID.txt
    echo "hoangthai07.nguyen@outlook.com" >> track-email.txt
    echo "Sai info" >> track-usItemId.txt
    echo "Sai info" >> track-priceValue.txt
    echo "Sai info" >> track-fullName.txt
    echo "Sai info" >> track-address.txt
    echo "Sai info" >> track-status.txt
    echo "Sai info" >> track-number.txt
    echo "Sai info" >> track-url.txt
    echo "Sai info" >> track-categoriesType.txt
else
    sum7=`md5 track-OrderID.txt`
    for (( i=0; i<=4; i++ ))
    do
        for (( j=0; j<=4; j++))
        do
            if [[ `echo $curl7 | jq '.data.guestOrder.groups_2101['${i[@]}'].items['${j[@]}'].productInfo.usItemId'` == '"194251838"' ]]; then
                echo "'3372218863963" >> track-OrderID.txt
                echo hoangthai07.nguyen@outlook.com >> track-email.txt
                echo $curl7 | jq '.data.guestOrder.groups_2101['${i[@]}'].items['${j[@]}'].productInfo.usItemId' >> track-usItemId.txt
                echo $curl7 | jq '.data.guestOrder.groups_2101['${i[@]}'].items['${j[@]}'].priceInfo.linePrice.value' >> track-priceValue.txt
                echo $curl7 | jq '.data.guestOrder.groups_2101['${i[@]}'].deliveryAddress.fullName' >> track-fullName.txt
                echo $curl7 | jq '.data.guestOrder.groups_2101['${i[@]}'].deliveryAddress.address.addressString' >> track-address.txt
                echo $curl7 | jq '.data.guestOrder.groups_2101['${i[@]}'].status.message.parts[].text' >> track-status.txt
                echo $curl7 | jq '.data.guestOrder.groups_2101['${i[@]}'].shipment.trackingNumber' | sed 's/null//g' >> track-number.txt
                echo $curl7 | jq '.data.guestOrder.groups_2101['${i[@]}'].shipment.trackingUrl' | sed 's/null//g' >> track-url.txt
                echo $curl7 | jq '.data.guestOrder.groups_2101['${i[@]}'].categories[].type' >> track-categoriesType.txt

                break
            fi
        done
    done
    if [[ $sum7 == `md5 track-OrderID.txt` ]]; then
        echo "7-Khác Item"
        echo "'3372218863963" >> track-OrderID.txt
        echo "hoangthai07.nguyen@outlook.com" >> track-email.txt
        echo "Khác Item" >> track-usItemId.txt
        echo "Khác Item" >> track-priceValue.txt
        echo "Khác Item" >> track-fullName.txt
        echo "Khác Item" >> track-address.txt
        echo "Khác Item" >> track-status.txt
        echo "Khác Item" >> track-number.txt
        echo "Khác Item" >> track-url.txt
        echo "Khác Item" >> track-categoriesType.txt
    else
        echo "7"
    fi   
fi
while true
do
curl8=`curl -s 'https://www.walmart.com/orchestra/home/graphql' \
  -H 'authority: www.walmart.com' \
  -H 'sec-ch-ua: " Not;A Brand";v="99", "Microsoft Edge";v="97", "Chromium";v="97"' \
  -H 'x-o-platform: rweb' \
  -H 'dnt: 1' \
  -H 'x-o-correlation-id: pn9BnlEx0zDiyvRGJ6nL5BS9pDN7erB017Nf' \
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
  -H 'user-agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.51 Safari/537.36 Edg/99.0.1150.36' \
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
  --data-raw $'{"query":"query getGuestOrder($orderId:ID\u0021 $emailAddress:String\u0021){guestOrder(input:{id:$orderId emailAddress:$emailAddress}){...OrderFieldsFragment}}fragment cancelReason on OrderCancelReason{__typename subReasonCode subDescription}fragment priceDetailFragment on OrderPriceDetailRow{label value displayValue info{title message}rowInfo{...orderPriceDetailRowInfo}}fragment orderPriceDetailRowInfo on OrderPriceDetailRowInfo{title message{...textFragment}}fragment price on Price{displayValue value}fragment variants on MapEntry{name value}fragment OrderAddOn on OrderAddOn{lineId uniqueLineId productInfo{name usItemId offerId}quantityString quantityLabel type fulfillmentInstructions{...textFragment}actions{manageProtectionPlan{...orderActionFragment}cancel}priceInfo{linePrice{...price}}quantity isActive}fragment orderDonationDetails on OrderDonationDetails{message{...textFragment}emailReceipt emailReceiptToken status{...textFragment}errorStatus}fragment orderLineItem on OrderLineItem{id uniqueId actions{contactSeller cancel addToCart configureCake reviewItem resendEGiftCardToken protectionPlan{...orderActionFragment}manageProtectionPlan{...orderActionFragment}}isGift digitalDeliveryMessage quantity quantityString quantityLabel isSubstitutionSelected fulfilledItems{id quantityString priceInfo{itemPrice{value}}productInfo{usItemId name}}isReturnable returnEligibilityMessage productInfo{name usItemId imageInfo{thumbnailUrl}canonicalUrl offerId orderLimit orderMinLimit weightIncrement salesUnit salesUnitType isSubstitutionEligible isAlcohol}reshop{reshopMessage isShippingAvailable minPromiseDate maxPromiseDate}selectedVariants{...variants}variantAdditionalInfo{parts{text nativeAction}}priceInfo{priceDisplayCodes{showItemPrice priceDisplayCondition finalCostByWeight}itemPrice{...price}linePrice{...price}unitPrice{...price}preDiscountedLinePrice{...price}additionalLines{name value}}discounts{label labelText{...textFragment}}itemReviewed activationCodes{label code}protectionPlanMessage{...textFragment}showSeller isShippedByWalmart seller{id name isPro}digitalDeliveryPhoneNumber addOns{...OrderAddOn}multiboxBundleId}fragment DriverFragment on Driver{id firstName photoUrl}fragment OrderGroupFragment on OrderGroup{driver{...DriverFragment}deliveryDate fulfillmentType status{...OrderGroupStatusFragment}showSeller isShippedByWalmart seller{...SellerFragment}id itemCount items{...LiteLineItemFragment}pickupPerson{firstName lastName email}accessPointId shipment{...ShipmentFragment}returnEligibilityMessage actions{...OrderGroupActionsFragment}recipientEmailAddress digitalDelivery{...DigitalDeliveryFragment}tireInstallationReservation{status extraText reservationId}}fragment OrderGroupStatusFragment on OrderGroupStatus{statusType showStatusTracker statusTracker{status label isCurrent}message{...textFragment}subtext subMessage{...textFragment}notice helpCenterText{...textFragment}}fragment textFragment on Text{parts{bold url text nativeAction lineBreak}}fragment LiteLineItemFragment on OrderLineItem{id quantity productInfo{name usItemId imageInfo{thumbnailUrl}offerId isAlcohol}priceInfo{linePrice{...price}}}fragment SellerFragment on GroupSeller{id name isPro}fragment DigitalDeliveryFragment on DigitalDelivery{title name instructions{...textFragment}}fragment ShipmentFragment on Shipment{id trackingNumber isExternalTracking trackingUrl proofOfDelivery{...ProofOfDeliveryFragment}}fragment OrderGroupActionsFragment on OrderGroupActions{reorder edit track changeSlot checkin editDeliveryInstructions editPickupPerson editTip tip rateDriver cancel enableTip{...orderActionFragment}enableEdit{...orderActionFragment}rescheduleTireInstall{...orderActionFragment}cancelTireInstall{...orderActionFragment}help viewCancellationDetails{...cancellationDetailsActionFragment}}fragment cancellationDetailsActionFragment on CancellationDetailsAction{label heading text{...textFragment}}fragment ProofOfDeliveryFragment on ProofOfDelivery{photoUrl photoPreviewUrl showPreview}fragment DeliveryInstructionsFragment on DeliveryInstructions{text type typeText}fragment GiftDetailsFragment on GiftDetails{recipientAddress{fullName}recipientEmail senderName giftMessage}fragment SubstitutionAction on SubstitutionAction{message label type}fragment ODPGroupCategoryFragment on OrderCategory{type name subtext returnMessage substitutionsBanner{...textFragment}showExtendedSubstitutions actions{substitutions{...SubstitutionAction}nilPickReshop{message action{text url}}returnDetails viewCancellationDetails{...cancellationDetailsActionFragment}trackOnInHomeApp}banner{...textFragment}accordionState items{...orderLineItem}substitutions{...orderLineItem fulfilledItems{...orderLineItem}}returnInfo{...returnInfoFragment}}fragment ODPGroupFragment on OrderGroup{id fulfillmentType deliveryMessage deliveryAddress{fullName firstName lastName address{...addressFragment}}deliveryInstructions{...DeliveryInstructionsFragment}deliveryPreferences{text{...textFragment}cta{...orderActionFragment}}editSubstitutionsCutOff status{statusType showStatusTracker message{...textFragment}notice helpCenterText{...textFragment}}itemCount isCategorized categories{...ODPGroupCategoryFragment}seller{id name isPro}shipment{id trackingNumber}actions{reorder edit track changeSlot checkin editDeliveryInstructions editPickupPerson tip cancel help enableTip{...orderActionFragment}enableEdit{...orderActionFragment}viewCancellationDetails{...cancellationDetailsActionFragment}enableInHome{...orderActionFragment}createGiftReceipt}cutOffTimestamp isEditSubstitutionsEligible isInHome giftDetails{...GiftDetailsFragment}donationDetails{...orderDonationDetails}}fragment returnInfoFragment on ReturnInfo{returnOrderId type refundPriceDetails{__typename...refundPriceDetailsFragment}refundMessage tierRefundMessage paymentMethods{__typename description cardType paymentType displayValues message{...textFragment}}actions{__typename generate scheduleOrModifyPickup{text url}reschedulePickup editPickupContact}shippingLabelUrl qrCodeImageUrl carriers{__typename id name}pickupCarrier pickupContact{nameAndAddress{fullName firstName lastName address{addressString city state postalCode addressLineOne addressLineTwo country}}phone}pickupConfirmationNumber bannerMessage{...textFragment}}fragment refundPriceDetailsFragment on RefundPriceDetails{subTotal{__typename...orderPriceDetailRowFragment}fees{__typename...orderPriceDetailRowFragment}discounts{__typename...orderPriceDetailRowFragment}taxTotal{__typename...orderPriceDetailRowFragment}grandTotal{__typename...orderPriceDetailRowFragment}}fragment orderPriceDetailRowFragment on OrderPriceDetailRow{label displayValue value info{__typename title message}}fragment addressFragment on OrderAddress{addressString addressLineOne addressLineTwo state postalCode city}fragment ODPPickupInfo on OrderGroup{pickupInstructions pickupPerson{...person}alternatePickupPerson{...person}store{id name address{...addressFragment}}}fragment person on OrderPickupPerson{firstName lastName email}fragment ODPTippingInfo on OrderGroup{addTipMessage{...textFragment}driver{...DriverFragment}tipping{min{...price}max{...price}suggested{...price}preselected}subtotal{...price}}fragment orderActionFragment on Action{text url}fragment orderCustomer on OrderCustomer{id firstName lastName email isGuest isEmailRegistered}fragment OrderFieldsFragment on Order{__typename id version type customer{...orderCustomer}displayId idBarcodeImageUrl(barWidth:3 barHeight:100) isFuelPurchase title shortTitle timezone tippableGroup{...OrderGroupFragment}amendableGroup{id changeSlotIterationsLeft cutOffTimestamp fulfillmentType deliveryAddress{fullName firstName lastName address{addressString addressLineOne addressLineTwo state postalCode city country}}isAmendInProgress}substitutionsBanner{heading subheading longSubheading}groups_2101{__typename...OrderGroupFragment...ODPGroupFragment...ODPPickupInfo...ODPTippingInfo}multiboxBundles{...orderLineItem}itemCancelReasons{__typename...cancelReason}groupCancelReasons{__typename...cancelReason}priceDetails{__typename subTotal{__typename...priceDetailFragment}taxTotal{__typename...priceDetailFragment}grandTotal{__typename...priceDetailFragment}authorizationAmount{__typename...priceDetailFragment}fees{__typename...priceDetailFragment}discounts{__typename...priceDetailFragment}minimumThreshold{__typename...price}belowMinimumFee{__typename...priceDetailFragment}driverTip{__typename...priceDetailFragment}donations{__typename...priceDetailFragment}}paymentMethods{__typename description cardType paymentType displayValues message{...textFragment}actions{connectToCapitalOne{...orderActionFragment}visitAffirm{...orderActionFragment}}}actions{__typename return pendingReturn cancel startReturn{...orderActionFragment}reorder}banners{...textFragment}}","variables":{"orderId":"3352214541213","emailAddress":"norita19@aol.com"}}' \
  --compressed`
 
  if [[ $curl8 =~ "blocked" ]]; then
    link8=`echo $curl8 | jq '.redirectUrl' | sed 's/"//g'`
    `open -n -a /Applications/Microsoft\ Edge.app --args --profile-directory=Default https://walmart.com$link8`
    read -n 1 -p "blocked"
  else
    break
  fi
done

if [[ $curl8 =~ "error" ]]; then
    echo "8-Sai info"
    echo "'3352214541213" >> track-OrderID.txt
    echo "norita19@aol.com" >> track-email.txt
    echo "Sai info" >> track-usItemId.txt
    echo "Sai info" >> track-priceValue.txt
    echo "Sai info" >> track-fullName.txt
    echo "Sai info" >> track-address.txt
    echo "Sai info" >> track-status.txt
    echo "Sai info" >> track-number.txt
    echo "Sai info" >> track-url.txt
    echo "Sai info" >> track-categoriesType.txt
else
    sum8=`md5 track-OrderID.txt`
    for (( i=0; i<=4; i++ ))
    do
        for (( j=0; j<=4; j++))
        do
            if [[ `echo $curl8 | jq '.data.guestOrder.groups_2101['${i[@]}'].items['${j[@]}'].productInfo.usItemId'` == '"514921600"' ]]; then
                echo "'3352214541213" >> track-OrderID.txt
                echo norita19@aol.com >> track-email.txt
                echo $curl8 | jq '.data.guestOrder.groups_2101['${i[@]}'].items['${j[@]}'].productInfo.usItemId' >> track-usItemId.txt
                echo $curl8 | jq '.data.guestOrder.groups_2101['${i[@]}'].items['${j[@]}'].priceInfo.linePrice.value' >> track-priceValue.txt
                echo $curl8 | jq '.data.guestOrder.groups_2101['${i[@]}'].deliveryAddress.fullName' >> track-fullName.txt
                echo $curl8 | jq '.data.guestOrder.groups_2101['${i[@]}'].deliveryAddress.address.addressString' >> track-address.txt
                echo $curl8 | jq '.data.guestOrder.groups_2101['${i[@]}'].status.message.parts[].text' >> track-status.txt
                echo $curl8 | jq '.data.guestOrder.groups_2101['${i[@]}'].shipment.trackingNumber' | sed 's/null//g' >> track-number.txt
                echo $curl8 | jq '.data.guestOrder.groups_2101['${i[@]}'].shipment.trackingUrl' | sed 's/null//g' >> track-url.txt
                echo $curl8 | jq '.data.guestOrder.groups_2101['${i[@]}'].categories[].type' >> track-categoriesType.txt

                break
            fi
        done
    done
    if [[ $sum8 == `md5 track-OrderID.txt` ]]; then
        echo "8-Khác Item"
        echo "'3352214541213" >> track-OrderID.txt
        echo "norita19@aol.com" >> track-email.txt
        echo "Khác Item" >> track-usItemId.txt
        echo "Khác Item" >> track-priceValue.txt
        echo "Khác Item" >> track-fullName.txt
        echo "Khác Item" >> track-address.txt
        echo "Khác Item" >> track-status.txt
        echo "Khác Item" >> track-number.txt
        echo "Khác Item" >> track-url.txt
        echo "Khác Item" >> track-categoriesType.txt
    else
        echo "8"
    fi   
fi
while true
do
curl9=`curl -s 'https://www.walmart.com/orchestra/home/graphql' \
  -H 'authority: www.walmart.com' \
  -H 'sec-ch-ua: " Not;A Brand";v="99", "Microsoft Edge";v="97", "Chromium";v="97"' \
  -H 'x-o-platform: rweb' \
  -H 'dnt: 1' \
  -H 'x-o-correlation-id: pn9BnlEx0zDiyvRGJ6nL5BS9pDN7erB017Nf' \
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
  -H 'user-agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.51 Safari/537.36 Edg/99.0.1150.36' \
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
  --data-raw $'{"query":"query getGuestOrder($orderId:ID\u0021 $emailAddress:String\u0021){guestOrder(input:{id:$orderId emailAddress:$emailAddress}){...OrderFieldsFragment}}fragment cancelReason on OrderCancelReason{__typename subReasonCode subDescription}fragment priceDetailFragment on OrderPriceDetailRow{label value displayValue info{title message}rowInfo{...orderPriceDetailRowInfo}}fragment orderPriceDetailRowInfo on OrderPriceDetailRowInfo{title message{...textFragment}}fragment price on Price{displayValue value}fragment variants on MapEntry{name value}fragment OrderAddOn on OrderAddOn{lineId uniqueLineId productInfo{name usItemId offerId}quantityString quantityLabel type fulfillmentInstructions{...textFragment}actions{manageProtectionPlan{...orderActionFragment}cancel}priceInfo{linePrice{...price}}quantity isActive}fragment orderDonationDetails on OrderDonationDetails{message{...textFragment}emailReceipt emailReceiptToken status{...textFragment}errorStatus}fragment orderLineItem on OrderLineItem{id uniqueId actions{contactSeller cancel addToCart configureCake reviewItem resendEGiftCardToken protectionPlan{...orderActionFragment}manageProtectionPlan{...orderActionFragment}}isGift digitalDeliveryMessage quantity quantityString quantityLabel isSubstitutionSelected fulfilledItems{id quantityString priceInfo{itemPrice{value}}productInfo{usItemId name}}isReturnable returnEligibilityMessage productInfo{name usItemId imageInfo{thumbnailUrl}canonicalUrl offerId orderLimit orderMinLimit weightIncrement salesUnit salesUnitType isSubstitutionEligible isAlcohol}reshop{reshopMessage isShippingAvailable minPromiseDate maxPromiseDate}selectedVariants{...variants}variantAdditionalInfo{parts{text nativeAction}}priceInfo{priceDisplayCodes{showItemPrice priceDisplayCondition finalCostByWeight}itemPrice{...price}linePrice{...price}unitPrice{...price}preDiscountedLinePrice{...price}additionalLines{name value}}discounts{label labelText{...textFragment}}itemReviewed activationCodes{label code}protectionPlanMessage{...textFragment}showSeller isShippedByWalmart seller{id name isPro}digitalDeliveryPhoneNumber addOns{...OrderAddOn}multiboxBundleId}fragment DriverFragment on Driver{id firstName photoUrl}fragment OrderGroupFragment on OrderGroup{driver{...DriverFragment}deliveryDate fulfillmentType status{...OrderGroupStatusFragment}showSeller isShippedByWalmart seller{...SellerFragment}id itemCount items{...LiteLineItemFragment}pickupPerson{firstName lastName email}accessPointId shipment{...ShipmentFragment}returnEligibilityMessage actions{...OrderGroupActionsFragment}recipientEmailAddress digitalDelivery{...DigitalDeliveryFragment}tireInstallationReservation{status extraText reservationId}}fragment OrderGroupStatusFragment on OrderGroupStatus{statusType showStatusTracker statusTracker{status label isCurrent}message{...textFragment}subtext subMessage{...textFragment}notice helpCenterText{...textFragment}}fragment textFragment on Text{parts{bold url text nativeAction lineBreak}}fragment LiteLineItemFragment on OrderLineItem{id quantity productInfo{name usItemId imageInfo{thumbnailUrl}offerId isAlcohol}priceInfo{linePrice{...price}}}fragment SellerFragment on GroupSeller{id name isPro}fragment DigitalDeliveryFragment on DigitalDelivery{title name instructions{...textFragment}}fragment ShipmentFragment on Shipment{id trackingNumber isExternalTracking trackingUrl proofOfDelivery{...ProofOfDeliveryFragment}}fragment OrderGroupActionsFragment on OrderGroupActions{reorder edit track changeSlot checkin editDeliveryInstructions editPickupPerson editTip tip rateDriver cancel enableTip{...orderActionFragment}enableEdit{...orderActionFragment}rescheduleTireInstall{...orderActionFragment}cancelTireInstall{...orderActionFragment}help viewCancellationDetails{...cancellationDetailsActionFragment}}fragment cancellationDetailsActionFragment on CancellationDetailsAction{label heading text{...textFragment}}fragment ProofOfDeliveryFragment on ProofOfDelivery{photoUrl photoPreviewUrl showPreview}fragment DeliveryInstructionsFragment on DeliveryInstructions{text type typeText}fragment GiftDetailsFragment on GiftDetails{recipientAddress{fullName}recipientEmail senderName giftMessage}fragment SubstitutionAction on SubstitutionAction{message label type}fragment ODPGroupCategoryFragment on OrderCategory{type name subtext returnMessage substitutionsBanner{...textFragment}showExtendedSubstitutions actions{substitutions{...SubstitutionAction}nilPickReshop{message action{text url}}returnDetails viewCancellationDetails{...cancellationDetailsActionFragment}trackOnInHomeApp}banner{...textFragment}accordionState items{...orderLineItem}substitutions{...orderLineItem fulfilledItems{...orderLineItem}}returnInfo{...returnInfoFragment}}fragment ODPGroupFragment on OrderGroup{id fulfillmentType deliveryMessage deliveryAddress{fullName firstName lastName address{...addressFragment}}deliveryInstructions{...DeliveryInstructionsFragment}deliveryPreferences{text{...textFragment}cta{...orderActionFragment}}editSubstitutionsCutOff status{statusType showStatusTracker message{...textFragment}notice helpCenterText{...textFragment}}itemCount isCategorized categories{...ODPGroupCategoryFragment}seller{id name isPro}shipment{id trackingNumber}actions{reorder edit track changeSlot checkin editDeliveryInstructions editPickupPerson tip cancel help enableTip{...orderActionFragment}enableEdit{...orderActionFragment}viewCancellationDetails{...cancellationDetailsActionFragment}enableInHome{...orderActionFragment}createGiftReceipt}cutOffTimestamp isEditSubstitutionsEligible isInHome giftDetails{...GiftDetailsFragment}donationDetails{...orderDonationDetails}}fragment returnInfoFragment on ReturnInfo{returnOrderId type refundPriceDetails{__typename...refundPriceDetailsFragment}refundMessage tierRefundMessage paymentMethods{__typename description cardType paymentType displayValues message{...textFragment}}actions{__typename generate scheduleOrModifyPickup{text url}reschedulePickup editPickupContact}shippingLabelUrl qrCodeImageUrl carriers{__typename id name}pickupCarrier pickupContact{nameAndAddress{fullName firstName lastName address{addressString city state postalCode addressLineOne addressLineTwo country}}phone}pickupConfirmationNumber bannerMessage{...textFragment}}fragment refundPriceDetailsFragment on RefundPriceDetails{subTotal{__typename...orderPriceDetailRowFragment}fees{__typename...orderPriceDetailRowFragment}discounts{__typename...orderPriceDetailRowFragment}taxTotal{__typename...orderPriceDetailRowFragment}grandTotal{__typename...orderPriceDetailRowFragment}}fragment orderPriceDetailRowFragment on OrderPriceDetailRow{label displayValue value info{__typename title message}}fragment addressFragment on OrderAddress{addressString addressLineOne addressLineTwo state postalCode city}fragment ODPPickupInfo on OrderGroup{pickupInstructions pickupPerson{...person}alternatePickupPerson{...person}store{id name address{...addressFragment}}}fragment person on OrderPickupPerson{firstName lastName email}fragment ODPTippingInfo on OrderGroup{addTipMessage{...textFragment}driver{...DriverFragment}tipping{min{...price}max{...price}suggested{...price}preselected}subtotal{...price}}fragment orderActionFragment on Action{text url}fragment orderCustomer on OrderCustomer{id firstName lastName email isGuest isEmailRegistered}fragment OrderFieldsFragment on Order{__typename id version type customer{...orderCustomer}displayId idBarcodeImageUrl(barWidth:3 barHeight:100) isFuelPurchase title shortTitle timezone tippableGroup{...OrderGroupFragment}amendableGroup{id changeSlotIterationsLeft cutOffTimestamp fulfillmentType deliveryAddress{fullName firstName lastName address{addressString addressLineOne addressLineTwo state postalCode city country}}isAmendInProgress}substitutionsBanner{heading subheading longSubheading}groups_2101{__typename...OrderGroupFragment...ODPGroupFragment...ODPPickupInfo...ODPTippingInfo}multiboxBundles{...orderLineItem}itemCancelReasons{__typename...cancelReason}groupCancelReasons{__typename...cancelReason}priceDetails{__typename subTotal{__typename...priceDetailFragment}taxTotal{__typename...priceDetailFragment}grandTotal{__typename...priceDetailFragment}authorizationAmount{__typename...priceDetailFragment}fees{__typename...priceDetailFragment}discounts{__typename...priceDetailFragment}minimumThreshold{__typename...price}belowMinimumFee{__typename...priceDetailFragment}driverTip{__typename...priceDetailFragment}donations{__typename...priceDetailFragment}}paymentMethods{__typename description cardType paymentType displayValues message{...textFragment}actions{connectToCapitalOne{...orderActionFragment}visitAffirm{...orderActionFragment}}}actions{__typename return pendingReturn cancel startReturn{...orderActionFragment}reorder}banners{...textFragment}}","variables":{"orderId":"3352214844298","emailAddress":"janetfwilliams05@gmail.com"}}' \
  --compressed`
 
  if [[ $curl9 =~ "blocked" ]]; then
    link9=`echo $curl9 | jq '.redirectUrl' | sed 's/"//g'`
    `open -n -a /Applications/Microsoft\ Edge.app --args --profile-directory=Default https://walmart.com$link9`
    read -n 1 -p "blocked"
  else
    break
  fi
done

if [[ $curl9 =~ "error" ]]; then
    echo "9-Sai info"
    echo "'3352214844298" >> track-OrderID.txt
    echo "janetfwilliams05@gmail.com" >> track-email.txt
    echo "Sai info" >> track-usItemId.txt
    echo "Sai info" >> track-priceValue.txt
    echo "Sai info" >> track-fullName.txt
    echo "Sai info" >> track-address.txt
    echo "Sai info" >> track-status.txt
    echo "Sai info" >> track-number.txt
    echo "Sai info" >> track-url.txt
    echo "Sai info" >> track-categoriesType.txt
else
    sum9=`md5 track-OrderID.txt`
    for (( i=0; i<=4; i++ ))
    do
        for (( j=0; j<=4; j++))
        do
            if [[ `echo $curl9 | jq '.data.guestOrder.groups_2101['${i[@]}'].items['${j[@]}'].productInfo.usItemId'` == '"430779192"' ]]; then
                echo "'3352214844298" >> track-OrderID.txt
                echo janetfwilliams05@gmail.com >> track-email.txt
                echo $curl9 | jq '.data.guestOrder.groups_2101['${i[@]}'].items['${j[@]}'].productInfo.usItemId' >> track-usItemId.txt
                echo $curl9 | jq '.data.guestOrder.groups_2101['${i[@]}'].items['${j[@]}'].priceInfo.linePrice.value' >> track-priceValue.txt
                echo $curl9 | jq '.data.guestOrder.groups_2101['${i[@]}'].deliveryAddress.fullName' >> track-fullName.txt
                echo $curl9 | jq '.data.guestOrder.groups_2101['${i[@]}'].deliveryAddress.address.addressString' >> track-address.txt
                echo $curl9 | jq '.data.guestOrder.groups_2101['${i[@]}'].status.message.parts[].text' >> track-status.txt
                echo $curl9 | jq '.data.guestOrder.groups_2101['${i[@]}'].shipment.trackingNumber' | sed 's/null//g' >> track-number.txt
                echo $curl9 | jq '.data.guestOrder.groups_2101['${i[@]}'].shipment.trackingUrl' | sed 's/null//g' >> track-url.txt
                echo $curl9 | jq '.data.guestOrder.groups_2101['${i[@]}'].categories[].type' >> track-categoriesType.txt

                break
            fi
        done
    done
    if [[ $sum9 == `md5 track-OrderID.txt` ]]; then
        echo "9-Khác Item"
        echo "'3352214844298" >> track-OrderID.txt
        echo "janetfwilliams05@gmail.com" >> track-email.txt
        echo "Khác Item" >> track-usItemId.txt
        echo "Khác Item" >> track-priceValue.txt
        echo "Khác Item" >> track-fullName.txt
        echo "Khác Item" >> track-address.txt
        echo "Khác Item" >> track-status.txt
        echo "Khác Item" >> track-number.txt
        echo "Khác Item" >> track-url.txt
        echo "Khác Item" >> track-categoriesType.txt
    else
        echo "9"
    fi   
fi
while true
do
curl10=`curl -s 'https://www.walmart.com/orchestra/home/graphql' \
  -H 'authority: www.walmart.com' \
  -H 'sec-ch-ua: " Not;A Brand";v="99", "Microsoft Edge";v="97", "Chromium";v="97"' \
  -H 'x-o-platform: rweb' \
  -H 'dnt: 1' \
  -H 'x-o-correlation-id: pn9BnlEx0zDiyvRGJ6nL5BS9pDN7erB017Nf' \
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
  -H 'user-agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.51 Safari/537.36 Edg/99.0.1150.36' \
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
  --data-raw $'{"query":"query getGuestOrder($orderId:ID\u0021 $emailAddress:String\u0021){guestOrder(input:{id:$orderId emailAddress:$emailAddress}){...OrderFieldsFragment}}fragment cancelReason on OrderCancelReason{__typename subReasonCode subDescription}fragment priceDetailFragment on OrderPriceDetailRow{label value displayValue info{title message}rowInfo{...orderPriceDetailRowInfo}}fragment orderPriceDetailRowInfo on OrderPriceDetailRowInfo{title message{...textFragment}}fragment price on Price{displayValue value}fragment variants on MapEntry{name value}fragment OrderAddOn on OrderAddOn{lineId uniqueLineId productInfo{name usItemId offerId}quantityString quantityLabel type fulfillmentInstructions{...textFragment}actions{manageProtectionPlan{...orderActionFragment}cancel}priceInfo{linePrice{...price}}quantity isActive}fragment orderDonationDetails on OrderDonationDetails{message{...textFragment}emailReceipt emailReceiptToken status{...textFragment}errorStatus}fragment orderLineItem on OrderLineItem{id uniqueId actions{contactSeller cancel addToCart configureCake reviewItem resendEGiftCardToken protectionPlan{...orderActionFragment}manageProtectionPlan{...orderActionFragment}}isGift digitalDeliveryMessage quantity quantityString quantityLabel isSubstitutionSelected fulfilledItems{id quantityString priceInfo{itemPrice{value}}productInfo{usItemId name}}isReturnable returnEligibilityMessage productInfo{name usItemId imageInfo{thumbnailUrl}canonicalUrl offerId orderLimit orderMinLimit weightIncrement salesUnit salesUnitType isSubstitutionEligible isAlcohol}reshop{reshopMessage isShippingAvailable minPromiseDate maxPromiseDate}selectedVariants{...variants}variantAdditionalInfo{parts{text nativeAction}}priceInfo{priceDisplayCodes{showItemPrice priceDisplayCondition finalCostByWeight}itemPrice{...price}linePrice{...price}unitPrice{...price}preDiscountedLinePrice{...price}additionalLines{name value}}discounts{label labelText{...textFragment}}itemReviewed activationCodes{label code}protectionPlanMessage{...textFragment}showSeller isShippedByWalmart seller{id name isPro}digitalDeliveryPhoneNumber addOns{...OrderAddOn}multiboxBundleId}fragment DriverFragment on Driver{id firstName photoUrl}fragment OrderGroupFragment on OrderGroup{driver{...DriverFragment}deliveryDate fulfillmentType status{...OrderGroupStatusFragment}showSeller isShippedByWalmart seller{...SellerFragment}id itemCount items{...LiteLineItemFragment}pickupPerson{firstName lastName email}accessPointId shipment{...ShipmentFragment}returnEligibilityMessage actions{...OrderGroupActionsFragment}recipientEmailAddress digitalDelivery{...DigitalDeliveryFragment}tireInstallationReservation{status extraText reservationId}}fragment OrderGroupStatusFragment on OrderGroupStatus{statusType showStatusTracker statusTracker{status label isCurrent}message{...textFragment}subtext subMessage{...textFragment}notice helpCenterText{...textFragment}}fragment textFragment on Text{parts{bold url text nativeAction lineBreak}}fragment LiteLineItemFragment on OrderLineItem{id quantity productInfo{name usItemId imageInfo{thumbnailUrl}offerId isAlcohol}priceInfo{linePrice{...price}}}fragment SellerFragment on GroupSeller{id name isPro}fragment DigitalDeliveryFragment on DigitalDelivery{title name instructions{...textFragment}}fragment ShipmentFragment on Shipment{id trackingNumber isExternalTracking trackingUrl proofOfDelivery{...ProofOfDeliveryFragment}}fragment OrderGroupActionsFragment on OrderGroupActions{reorder edit track changeSlot checkin editDeliveryInstructions editPickupPerson editTip tip rateDriver cancel enableTip{...orderActionFragment}enableEdit{...orderActionFragment}rescheduleTireInstall{...orderActionFragment}cancelTireInstall{...orderActionFragment}help viewCancellationDetails{...cancellationDetailsActionFragment}}fragment cancellationDetailsActionFragment on CancellationDetailsAction{label heading text{...textFragment}}fragment ProofOfDeliveryFragment on ProofOfDelivery{photoUrl photoPreviewUrl showPreview}fragment DeliveryInstructionsFragment on DeliveryInstructions{text type typeText}fragment GiftDetailsFragment on GiftDetails{recipientAddress{fullName}recipientEmail senderName giftMessage}fragment SubstitutionAction on SubstitutionAction{message label type}fragment ODPGroupCategoryFragment on OrderCategory{type name subtext returnMessage substitutionsBanner{...textFragment}showExtendedSubstitutions actions{substitutions{...SubstitutionAction}nilPickReshop{message action{text url}}returnDetails viewCancellationDetails{...cancellationDetailsActionFragment}trackOnInHomeApp}banner{...textFragment}accordionState items{...orderLineItem}substitutions{...orderLineItem fulfilledItems{...orderLineItem}}returnInfo{...returnInfoFragment}}fragment ODPGroupFragment on OrderGroup{id fulfillmentType deliveryMessage deliveryAddress{fullName firstName lastName address{...addressFragment}}deliveryInstructions{...DeliveryInstructionsFragment}deliveryPreferences{text{...textFragment}cta{...orderActionFragment}}editSubstitutionsCutOff status{statusType showStatusTracker message{...textFragment}notice helpCenterText{...textFragment}}itemCount isCategorized categories{...ODPGroupCategoryFragment}seller{id name isPro}shipment{id trackingNumber}actions{reorder edit track changeSlot checkin editDeliveryInstructions editPickupPerson tip cancel help enableTip{...orderActionFragment}enableEdit{...orderActionFragment}viewCancellationDetails{...cancellationDetailsActionFragment}enableInHome{...orderActionFragment}createGiftReceipt}cutOffTimestamp isEditSubstitutionsEligible isInHome giftDetails{...GiftDetailsFragment}donationDetails{...orderDonationDetails}}fragment returnInfoFragment on ReturnInfo{returnOrderId type refundPriceDetails{__typename...refundPriceDetailsFragment}refundMessage tierRefundMessage paymentMethods{__typename description cardType paymentType displayValues message{...textFragment}}actions{__typename generate scheduleOrModifyPickup{text url}reschedulePickup editPickupContact}shippingLabelUrl qrCodeImageUrl carriers{__typename id name}pickupCarrier pickupContact{nameAndAddress{fullName firstName lastName address{addressString city state postalCode addressLineOne addressLineTwo country}}phone}pickupConfirmationNumber bannerMessage{...textFragment}}fragment refundPriceDetailsFragment on RefundPriceDetails{subTotal{__typename...orderPriceDetailRowFragment}fees{__typename...orderPriceDetailRowFragment}discounts{__typename...orderPriceDetailRowFragment}taxTotal{__typename...orderPriceDetailRowFragment}grandTotal{__typename...orderPriceDetailRowFragment}}fragment orderPriceDetailRowFragment on OrderPriceDetailRow{label displayValue value info{__typename title message}}fragment addressFragment on OrderAddress{addressString addressLineOne addressLineTwo state postalCode city}fragment ODPPickupInfo on OrderGroup{pickupInstructions pickupPerson{...person}alternatePickupPerson{...person}store{id name address{...addressFragment}}}fragment person on OrderPickupPerson{firstName lastName email}fragment ODPTippingInfo on OrderGroup{addTipMessage{...textFragment}driver{...DriverFragment}tipping{min{...price}max{...price}suggested{...price}preselected}subtotal{...price}}fragment orderActionFragment on Action{text url}fragment orderCustomer on OrderCustomer{id firstName lastName email isGuest isEmailRegistered}fragment OrderFieldsFragment on Order{__typename id version type customer{...orderCustomer}displayId idBarcodeImageUrl(barWidth:3 barHeight:100) isFuelPurchase title shortTitle timezone tippableGroup{...OrderGroupFragment}amendableGroup{id changeSlotIterationsLeft cutOffTimestamp fulfillmentType deliveryAddress{fullName firstName lastName address{addressString addressLineOne addressLineTwo state postalCode city country}}isAmendInProgress}substitutionsBanner{heading subheading longSubheading}groups_2101{__typename...OrderGroupFragment...ODPGroupFragment...ODPPickupInfo...ODPTippingInfo}multiboxBundles{...orderLineItem}itemCancelReasons{__typename...cancelReason}groupCancelReasons{__typename...cancelReason}priceDetails{__typename subTotal{__typename...priceDetailFragment}taxTotal{__typename...priceDetailFragment}grandTotal{__typename...priceDetailFragment}authorizationAmount{__typename...priceDetailFragment}fees{__typename...priceDetailFragment}discounts{__typename...priceDetailFragment}minimumThreshold{__typename...price}belowMinimumFee{__typename...priceDetailFragment}driverTip{__typename...priceDetailFragment}donations{__typename...priceDetailFragment}}paymentMethods{__typename description cardType paymentType displayValues message{...textFragment}actions{connectToCapitalOne{...orderActionFragment}visitAffirm{...orderActionFragment}}}actions{__typename return pendingReturn cancel startReturn{...orderActionFragment}reorder}banners{...textFragment}}","variables":{"orderId":"3382220376437","emailAddress":"Mayzingbg11@gmail.com"}}' \
  --compressed`
 
  if [[ $curl10 =~ "blocked" ]]; then
    link10=`echo $curl10 | jq '.redirectUrl' | sed 's/"//g'`
    `open -n -a /Applications/Microsoft\ Edge.app --args --profile-directory=Default https://walmart.com$link10`
    read -n 1 -p "blocked"
  else
    break
  fi
done

if [[ $curl10 =~ "error" ]]; then
    echo "10-Sai info"
    echo "'3382220376437" >> track-OrderID.txt
    echo "Mayzingbg11@gmail.com" >> track-email.txt
    echo "Sai info" >> track-usItemId.txt
    echo "Sai info" >> track-priceValue.txt
    echo "Sai info" >> track-fullName.txt
    echo "Sai info" >> track-address.txt
    echo "Sai info" >> track-status.txt
    echo "Sai info" >> track-number.txt
    echo "Sai info" >> track-url.txt
    echo "Sai info" >> track-categoriesType.txt
else
    sum10=`md5 track-OrderID.txt`
    for (( i=0; i<=4; i++ ))
    do
        for (( j=0; j<=4; j++))
        do
            if [[ `echo $curl10 | jq '.data.guestOrder.groups_2101['${i[@]}'].items['${j[@]}'].productInfo.usItemId'` == '"993572228"' ]]; then
                echo "'3382220376437" >> track-OrderID.txt
                echo Mayzingbg11@gmail.com >> track-email.txt
                echo $curl10 | jq '.data.guestOrder.groups_2101['${i[@]}'].items['${j[@]}'].productInfo.usItemId' >> track-usItemId.txt
                echo $curl10 | jq '.data.guestOrder.groups_2101['${i[@]}'].items['${j[@]}'].priceInfo.linePrice.value' >> track-priceValue.txt
                echo $curl10 | jq '.data.guestOrder.groups_2101['${i[@]}'].deliveryAddress.fullName' >> track-fullName.txt
                echo $curl10 | jq '.data.guestOrder.groups_2101['${i[@]}'].deliveryAddress.address.addressString' >> track-address.txt
                echo $curl10 | jq '.data.guestOrder.groups_2101['${i[@]}'].status.message.parts[].text' >> track-status.txt
                echo $curl10 | jq '.data.guestOrder.groups_2101['${i[@]}'].shipment.trackingNumber' | sed 's/null//g' >> track-number.txt
                echo $curl10 | jq '.data.guestOrder.groups_2101['${i[@]}'].shipment.trackingUrl' | sed 's/null//g' >> track-url.txt
                echo $curl10 | jq '.data.guestOrder.groups_2101['${i[@]}'].categories[].type' >> track-categoriesType.txt

                break
            fi
        done
    done
    if [[ $sum10 == `md5 track-OrderID.txt` ]]; then
        echo "10-Khác Item"
        echo "'3382220376437" >> track-OrderID.txt
        echo "Mayzingbg11@gmail.com" >> track-email.txt
        echo "Khác Item" >> track-usItemId.txt
        echo "Khác Item" >> track-priceValue.txt
        echo "Khác Item" >> track-fullName.txt
        echo "Khác Item" >> track-address.txt
        echo "Khác Item" >> track-status.txt
        echo "Khác Item" >> track-number.txt
        echo "Khác Item" >> track-url.txt
        echo "Khác Item" >> track-categoriesType.txt
    else
        echo "10"
    fi   
fi
while true
do
curl11=`curl -s 'https://www.walmart.com/orchestra/home/graphql' \
  -H 'authority: www.walmart.com' \
  -H 'sec-ch-ua: " Not;A Brand";v="99", "Microsoft Edge";v="97", "Chromium";v="97"' \
  -H 'x-o-platform: rweb' \
  -H 'dnt: 1' \
  -H 'x-o-correlation-id: pn9BnlEx0zDiyvRGJ6nL5BS9pDN7erB017Nf' \
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
  -H 'user-agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.51 Safari/537.36 Edg/99.0.1150.36' \
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
  --data-raw $'{"query":"query getGuestOrder($orderId:ID\u0021 $emailAddress:String\u0021){guestOrder(input:{id:$orderId emailAddress:$emailAddress}){...OrderFieldsFragment}}fragment cancelReason on OrderCancelReason{__typename subReasonCode subDescription}fragment priceDetailFragment on OrderPriceDetailRow{label value displayValue info{title message}rowInfo{...orderPriceDetailRowInfo}}fragment orderPriceDetailRowInfo on OrderPriceDetailRowInfo{title message{...textFragment}}fragment price on Price{displayValue value}fragment variants on MapEntry{name value}fragment OrderAddOn on OrderAddOn{lineId uniqueLineId productInfo{name usItemId offerId}quantityString quantityLabel type fulfillmentInstructions{...textFragment}actions{manageProtectionPlan{...orderActionFragment}cancel}priceInfo{linePrice{...price}}quantity isActive}fragment orderDonationDetails on OrderDonationDetails{message{...textFragment}emailReceipt emailReceiptToken status{...textFragment}errorStatus}fragment orderLineItem on OrderLineItem{id uniqueId actions{contactSeller cancel addToCart configureCake reviewItem resendEGiftCardToken protectionPlan{...orderActionFragment}manageProtectionPlan{...orderActionFragment}}isGift digitalDeliveryMessage quantity quantityString quantityLabel isSubstitutionSelected fulfilledItems{id quantityString priceInfo{itemPrice{value}}productInfo{usItemId name}}isReturnable returnEligibilityMessage productInfo{name usItemId imageInfo{thumbnailUrl}canonicalUrl offerId orderLimit orderMinLimit weightIncrement salesUnit salesUnitType isSubstitutionEligible isAlcohol}reshop{reshopMessage isShippingAvailable minPromiseDate maxPromiseDate}selectedVariants{...variants}variantAdditionalInfo{parts{text nativeAction}}priceInfo{priceDisplayCodes{showItemPrice priceDisplayCondition finalCostByWeight}itemPrice{...price}linePrice{...price}unitPrice{...price}preDiscountedLinePrice{...price}additionalLines{name value}}discounts{label labelText{...textFragment}}itemReviewed activationCodes{label code}protectionPlanMessage{...textFragment}showSeller isShippedByWalmart seller{id name isPro}digitalDeliveryPhoneNumber addOns{...OrderAddOn}multiboxBundleId}fragment DriverFragment on Driver{id firstName photoUrl}fragment OrderGroupFragment on OrderGroup{driver{...DriverFragment}deliveryDate fulfillmentType status{...OrderGroupStatusFragment}showSeller isShippedByWalmart seller{...SellerFragment}id itemCount items{...LiteLineItemFragment}pickupPerson{firstName lastName email}accessPointId shipment{...ShipmentFragment}returnEligibilityMessage actions{...OrderGroupActionsFragment}recipientEmailAddress digitalDelivery{...DigitalDeliveryFragment}tireInstallationReservation{status extraText reservationId}}fragment OrderGroupStatusFragment on OrderGroupStatus{statusType showStatusTracker statusTracker{status label isCurrent}message{...textFragment}subtext subMessage{...textFragment}notice helpCenterText{...textFragment}}fragment textFragment on Text{parts{bold url text nativeAction lineBreak}}fragment LiteLineItemFragment on OrderLineItem{id quantity productInfo{name usItemId imageInfo{thumbnailUrl}offerId isAlcohol}priceInfo{linePrice{...price}}}fragment SellerFragment on GroupSeller{id name isPro}fragment DigitalDeliveryFragment on DigitalDelivery{title name instructions{...textFragment}}fragment ShipmentFragment on Shipment{id trackingNumber isExternalTracking trackingUrl proofOfDelivery{...ProofOfDeliveryFragment}}fragment OrderGroupActionsFragment on OrderGroupActions{reorder edit track changeSlot checkin editDeliveryInstructions editPickupPerson editTip tip rateDriver cancel enableTip{...orderActionFragment}enableEdit{...orderActionFragment}rescheduleTireInstall{...orderActionFragment}cancelTireInstall{...orderActionFragment}help viewCancellationDetails{...cancellationDetailsActionFragment}}fragment cancellationDetailsActionFragment on CancellationDetailsAction{label heading text{...textFragment}}fragment ProofOfDeliveryFragment on ProofOfDelivery{photoUrl photoPreviewUrl showPreview}fragment DeliveryInstructionsFragment on DeliveryInstructions{text type typeText}fragment GiftDetailsFragment on GiftDetails{recipientAddress{fullName}recipientEmail senderName giftMessage}fragment SubstitutionAction on SubstitutionAction{message label type}fragment ODPGroupCategoryFragment on OrderCategory{type name subtext returnMessage substitutionsBanner{...textFragment}showExtendedSubstitutions actions{substitutions{...SubstitutionAction}nilPickReshop{message action{text url}}returnDetails viewCancellationDetails{...cancellationDetailsActionFragment}trackOnInHomeApp}banner{...textFragment}accordionState items{...orderLineItem}substitutions{...orderLineItem fulfilledItems{...orderLineItem}}returnInfo{...returnInfoFragment}}fragment ODPGroupFragment on OrderGroup{id fulfillmentType deliveryMessage deliveryAddress{fullName firstName lastName address{...addressFragment}}deliveryInstructions{...DeliveryInstructionsFragment}deliveryPreferences{text{...textFragment}cta{...orderActionFragment}}editSubstitutionsCutOff status{statusType showStatusTracker message{...textFragment}notice helpCenterText{...textFragment}}itemCount isCategorized categories{...ODPGroupCategoryFragment}seller{id name isPro}shipment{id trackingNumber}actions{reorder edit track changeSlot checkin editDeliveryInstructions editPickupPerson tip cancel help enableTip{...orderActionFragment}enableEdit{...orderActionFragment}viewCancellationDetails{...cancellationDetailsActionFragment}enableInHome{...orderActionFragment}createGiftReceipt}cutOffTimestamp isEditSubstitutionsEligible isInHome giftDetails{...GiftDetailsFragment}donationDetails{...orderDonationDetails}}fragment returnInfoFragment on ReturnInfo{returnOrderId type refundPriceDetails{__typename...refundPriceDetailsFragment}refundMessage tierRefundMessage paymentMethods{__typename description cardType paymentType displayValues message{...textFragment}}actions{__typename generate scheduleOrModifyPickup{text url}reschedulePickup editPickupContact}shippingLabelUrl qrCodeImageUrl carriers{__typename id name}pickupCarrier pickupContact{nameAndAddress{fullName firstName lastName address{addressString city state postalCode addressLineOne addressLineTwo country}}phone}pickupConfirmationNumber bannerMessage{...textFragment}}fragment refundPriceDetailsFragment on RefundPriceDetails{subTotal{__typename...orderPriceDetailRowFragment}fees{__typename...orderPriceDetailRowFragment}discounts{__typename...orderPriceDetailRowFragment}taxTotal{__typename...orderPriceDetailRowFragment}grandTotal{__typename...orderPriceDetailRowFragment}}fragment orderPriceDetailRowFragment on OrderPriceDetailRow{label displayValue value info{__typename title message}}fragment addressFragment on OrderAddress{addressString addressLineOne addressLineTwo state postalCode city}fragment ODPPickupInfo on OrderGroup{pickupInstructions pickupPerson{...person}alternatePickupPerson{...person}store{id name address{...addressFragment}}}fragment person on OrderPickupPerson{firstName lastName email}fragment ODPTippingInfo on OrderGroup{addTipMessage{...textFragment}driver{...DriverFragment}tipping{min{...price}max{...price}suggested{...price}preselected}subtotal{...price}}fragment orderActionFragment on Action{text url}fragment orderCustomer on OrderCustomer{id firstName lastName email isGuest isEmailRegistered}fragment OrderFieldsFragment on Order{__typename id version type customer{...orderCustomer}displayId idBarcodeImageUrl(barWidth:3 barHeight:100) isFuelPurchase title shortTitle timezone tippableGroup{...OrderGroupFragment}amendableGroup{id changeSlotIterationsLeft cutOffTimestamp fulfillmentType deliveryAddress{fullName firstName lastName address{addressString addressLineOne addressLineTwo state postalCode city country}}isAmendInProgress}substitutionsBanner{heading subheading longSubheading}groups_2101{__typename...OrderGroupFragment...ODPGroupFragment...ODPPickupInfo...ODPTippingInfo}multiboxBundles{...orderLineItem}itemCancelReasons{__typename...cancelReason}groupCancelReasons{__typename...cancelReason}priceDetails{__typename subTotal{__typename...priceDetailFragment}taxTotal{__typename...priceDetailFragment}grandTotal{__typename...priceDetailFragment}authorizationAmount{__typename...priceDetailFragment}fees{__typename...priceDetailFragment}discounts{__typename...priceDetailFragment}minimumThreshold{__typename...price}belowMinimumFee{__typename...priceDetailFragment}driverTip{__typename...priceDetailFragment}donations{__typename...priceDetailFragment}}paymentMethods{__typename description cardType paymentType displayValues message{...textFragment}actions{connectToCapitalOne{...orderActionFragment}visitAffirm{...orderActionFragment}}}actions{__typename return pendingReturn cancel startReturn{...orderActionFragment}reorder}banners{...textFragment}}","variables":{"orderId":"3372218300712","emailAddress":"melissamelgaard@mac.com"}}' \
  --compressed`
 
  if [[ $curl11 =~ "blocked" ]]; then
    link11=`echo $curl11 | jq '.redirectUrl' | sed 's/"//g'`
    `open -n -a /Applications/Microsoft\ Edge.app --args --profile-directory=Default https://walmart.com$link11`
    read -n 1 -p "blocked"
  else
    break
  fi
done

if [[ $curl11 =~ "error" ]]; then
    echo "11-Sai info"
    echo "'3372218300712" >> track-OrderID.txt
    echo "melissamelgaard@mac.com" >> track-email.txt
    echo "Sai info" >> track-usItemId.txt
    echo "Sai info" >> track-priceValue.txt
    echo "Sai info" >> track-fullName.txt
    echo "Sai info" >> track-address.txt
    echo "Sai info" >> track-status.txt
    echo "Sai info" >> track-number.txt
    echo "Sai info" >> track-url.txt
    echo "Sai info" >> track-categoriesType.txt
else
    sum11=`md5 track-OrderID.txt`
    for (( i=0; i<=4; i++ ))
    do
        for (( j=0; j<=4; j++))
        do
            if [[ `echo $curl11 | jq '.data.guestOrder.groups_2101['${i[@]}'].items['${j[@]}'].productInfo.usItemId'` == '"37532019"' ]]; then
                echo "'3372218300712" >> track-OrderID.txt
                echo melissamelgaard@mac.com >> track-email.txt
                echo $curl11 | jq '.data.guestOrder.groups_2101['${i[@]}'].items['${j[@]}'].productInfo.usItemId' >> track-usItemId.txt
                echo $curl11 | jq '.data.guestOrder.groups_2101['${i[@]}'].items['${j[@]}'].priceInfo.linePrice.value' >> track-priceValue.txt
                echo $curl11 | jq '.data.guestOrder.groups_2101['${i[@]}'].deliveryAddress.fullName' >> track-fullName.txt
                echo $curl11 | jq '.data.guestOrder.groups_2101['${i[@]}'].deliveryAddress.address.addressString' >> track-address.txt
                echo $curl11 | jq '.data.guestOrder.groups_2101['${i[@]}'].status.message.parts[].text' >> track-status.txt
                echo $curl11 | jq '.data.guestOrder.groups_2101['${i[@]}'].shipment.trackingNumber' | sed 's/null//g' >> track-number.txt
                echo $curl11 | jq '.data.guestOrder.groups_2101['${i[@]}'].shipment.trackingUrl' | sed 's/null//g' >> track-url.txt
                echo $curl11 | jq '.data.guestOrder.groups_2101['${i[@]}'].categories[].type' >> track-categoriesType.txt

                break
            fi
        done
    done
    if [[ $sum11 == `md5 track-OrderID.txt` ]]; then
        echo "11-Khác Item"
        echo "'3372218300712" >> track-OrderID.txt
        echo "melissamelgaard@mac.com" >> track-email.txt
        echo "Khác Item" >> track-usItemId.txt
        echo "Khác Item" >> track-priceValue.txt
        echo "Khác Item" >> track-fullName.txt
        echo "Khác Item" >> track-address.txt
        echo "Khác Item" >> track-status.txt
        echo "Khác Item" >> track-number.txt
        echo "Khác Item" >> track-url.txt
        echo "Khác Item" >> track-categoriesType.txt
    else
        echo "11"
    fi   
fi
while true
do
curl12=`curl -s 'https://www.walmart.com/orchestra/home/graphql' \
  -H 'authority: www.walmart.com' \
  -H 'sec-ch-ua: " Not;A Brand";v="99", "Microsoft Edge";v="97", "Chromium";v="97"' \
  -H 'x-o-platform: rweb' \
  -H 'dnt: 1' \
  -H 'x-o-correlation-id: pn9BnlEx0zDiyvRGJ6nL5BS9pDN7erB017Nf' \
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
  -H 'user-agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.51 Safari/537.36 Edg/99.0.1150.36' \
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
  --data-raw $'{"query":"query getGuestOrder($orderId:ID\u0021 $emailAddress:String\u0021){guestOrder(input:{id:$orderId emailAddress:$emailAddress}){...OrderFieldsFragment}}fragment cancelReason on OrderCancelReason{__typename subReasonCode subDescription}fragment priceDetailFragment on OrderPriceDetailRow{label value displayValue info{title message}rowInfo{...orderPriceDetailRowInfo}}fragment orderPriceDetailRowInfo on OrderPriceDetailRowInfo{title message{...textFragment}}fragment price on Price{displayValue value}fragment variants on MapEntry{name value}fragment OrderAddOn on OrderAddOn{lineId uniqueLineId productInfo{name usItemId offerId}quantityString quantityLabel type fulfillmentInstructions{...textFragment}actions{manageProtectionPlan{...orderActionFragment}cancel}priceInfo{linePrice{...price}}quantity isActive}fragment orderDonationDetails on OrderDonationDetails{message{...textFragment}emailReceipt emailReceiptToken status{...textFragment}errorStatus}fragment orderLineItem on OrderLineItem{id uniqueId actions{contactSeller cancel addToCart configureCake reviewItem resendEGiftCardToken protectionPlan{...orderActionFragment}manageProtectionPlan{...orderActionFragment}}isGift digitalDeliveryMessage quantity quantityString quantityLabel isSubstitutionSelected fulfilledItems{id quantityString priceInfo{itemPrice{value}}productInfo{usItemId name}}isReturnable returnEligibilityMessage productInfo{name usItemId imageInfo{thumbnailUrl}canonicalUrl offerId orderLimit orderMinLimit weightIncrement salesUnit salesUnitType isSubstitutionEligible isAlcohol}reshop{reshopMessage isShippingAvailable minPromiseDate maxPromiseDate}selectedVariants{...variants}variantAdditionalInfo{parts{text nativeAction}}priceInfo{priceDisplayCodes{showItemPrice priceDisplayCondition finalCostByWeight}itemPrice{...price}linePrice{...price}unitPrice{...price}preDiscountedLinePrice{...price}additionalLines{name value}}discounts{label labelText{...textFragment}}itemReviewed activationCodes{label code}protectionPlanMessage{...textFragment}showSeller isShippedByWalmart seller{id name isPro}digitalDeliveryPhoneNumber addOns{...OrderAddOn}multiboxBundleId}fragment DriverFragment on Driver{id firstName photoUrl}fragment OrderGroupFragment on OrderGroup{driver{...DriverFragment}deliveryDate fulfillmentType status{...OrderGroupStatusFragment}showSeller isShippedByWalmart seller{...SellerFragment}id itemCount items{...LiteLineItemFragment}pickupPerson{firstName lastName email}accessPointId shipment{...ShipmentFragment}returnEligibilityMessage actions{...OrderGroupActionsFragment}recipientEmailAddress digitalDelivery{...DigitalDeliveryFragment}tireInstallationReservation{status extraText reservationId}}fragment OrderGroupStatusFragment on OrderGroupStatus{statusType showStatusTracker statusTracker{status label isCurrent}message{...textFragment}subtext subMessage{...textFragment}notice helpCenterText{...textFragment}}fragment textFragment on Text{parts{bold url text nativeAction lineBreak}}fragment LiteLineItemFragment on OrderLineItem{id quantity productInfo{name usItemId imageInfo{thumbnailUrl}offerId isAlcohol}priceInfo{linePrice{...price}}}fragment SellerFragment on GroupSeller{id name isPro}fragment DigitalDeliveryFragment on DigitalDelivery{title name instructions{...textFragment}}fragment ShipmentFragment on Shipment{id trackingNumber isExternalTracking trackingUrl proofOfDelivery{...ProofOfDeliveryFragment}}fragment OrderGroupActionsFragment on OrderGroupActions{reorder edit track changeSlot checkin editDeliveryInstructions editPickupPerson editTip tip rateDriver cancel enableTip{...orderActionFragment}enableEdit{...orderActionFragment}rescheduleTireInstall{...orderActionFragment}cancelTireInstall{...orderActionFragment}help viewCancellationDetails{...cancellationDetailsActionFragment}}fragment cancellationDetailsActionFragment on CancellationDetailsAction{label heading text{...textFragment}}fragment ProofOfDeliveryFragment on ProofOfDelivery{photoUrl photoPreviewUrl showPreview}fragment DeliveryInstructionsFragment on DeliveryInstructions{text type typeText}fragment GiftDetailsFragment on GiftDetails{recipientAddress{fullName}recipientEmail senderName giftMessage}fragment SubstitutionAction on SubstitutionAction{message label type}fragment ODPGroupCategoryFragment on OrderCategory{type name subtext returnMessage substitutionsBanner{...textFragment}showExtendedSubstitutions actions{substitutions{...SubstitutionAction}nilPickReshop{message action{text url}}returnDetails viewCancellationDetails{...cancellationDetailsActionFragment}trackOnInHomeApp}banner{...textFragment}accordionState items{...orderLineItem}substitutions{...orderLineItem fulfilledItems{...orderLineItem}}returnInfo{...returnInfoFragment}}fragment ODPGroupFragment on OrderGroup{id fulfillmentType deliveryMessage deliveryAddress{fullName firstName lastName address{...addressFragment}}deliveryInstructions{...DeliveryInstructionsFragment}deliveryPreferences{text{...textFragment}cta{...orderActionFragment}}editSubstitutionsCutOff status{statusType showStatusTracker message{...textFragment}notice helpCenterText{...textFragment}}itemCount isCategorized categories{...ODPGroupCategoryFragment}seller{id name isPro}shipment{id trackingNumber}actions{reorder edit track changeSlot checkin editDeliveryInstructions editPickupPerson tip cancel help enableTip{...orderActionFragment}enableEdit{...orderActionFragment}viewCancellationDetails{...cancellationDetailsActionFragment}enableInHome{...orderActionFragment}createGiftReceipt}cutOffTimestamp isEditSubstitutionsEligible isInHome giftDetails{...GiftDetailsFragment}donationDetails{...orderDonationDetails}}fragment returnInfoFragment on ReturnInfo{returnOrderId type refundPriceDetails{__typename...refundPriceDetailsFragment}refundMessage tierRefundMessage paymentMethods{__typename description cardType paymentType displayValues message{...textFragment}}actions{__typename generate scheduleOrModifyPickup{text url}reschedulePickup editPickupContact}shippingLabelUrl qrCodeImageUrl carriers{__typename id name}pickupCarrier pickupContact{nameAndAddress{fullName firstName lastName address{addressString city state postalCode addressLineOne addressLineTwo country}}phone}pickupConfirmationNumber bannerMessage{...textFragment}}fragment refundPriceDetailsFragment on RefundPriceDetails{subTotal{__typename...orderPriceDetailRowFragment}fees{__typename...orderPriceDetailRowFragment}discounts{__typename...orderPriceDetailRowFragment}taxTotal{__typename...orderPriceDetailRowFragment}grandTotal{__typename...orderPriceDetailRowFragment}}fragment orderPriceDetailRowFragment on OrderPriceDetailRow{label displayValue value info{__typename title message}}fragment addressFragment on OrderAddress{addressString addressLineOne addressLineTwo state postalCode city}fragment ODPPickupInfo on OrderGroup{pickupInstructions pickupPerson{...person}alternatePickupPerson{...person}store{id name address{...addressFragment}}}fragment person on OrderPickupPerson{firstName lastName email}fragment ODPTippingInfo on OrderGroup{addTipMessage{...textFragment}driver{...DriverFragment}tipping{min{...price}max{...price}suggested{...price}preselected}subtotal{...price}}fragment orderActionFragment on Action{text url}fragment orderCustomer on OrderCustomer{id firstName lastName email isGuest isEmailRegistered}fragment OrderFieldsFragment on Order{__typename id version type customer{...orderCustomer}displayId idBarcodeImageUrl(barWidth:3 barHeight:100) isFuelPurchase title shortTitle timezone tippableGroup{...OrderGroupFragment}amendableGroup{id changeSlotIterationsLeft cutOffTimestamp fulfillmentType deliveryAddress{fullName firstName lastName address{addressString addressLineOne addressLineTwo state postalCode city country}}isAmendInProgress}substitutionsBanner{heading subheading longSubheading}groups_2101{__typename...OrderGroupFragment...ODPGroupFragment...ODPPickupInfo...ODPTippingInfo}multiboxBundles{...orderLineItem}itemCancelReasons{__typename...cancelReason}groupCancelReasons{__typename...cancelReason}priceDetails{__typename subTotal{__typename...priceDetailFragment}taxTotal{__typename...priceDetailFragment}grandTotal{__typename...priceDetailFragment}authorizationAmount{__typename...priceDetailFragment}fees{__typename...priceDetailFragment}discounts{__typename...priceDetailFragment}minimumThreshold{__typename...price}belowMinimumFee{__typename...priceDetailFragment}driverTip{__typename...priceDetailFragment}donations{__typename...priceDetailFragment}}paymentMethods{__typename description cardType paymentType displayValues message{...textFragment}actions{connectToCapitalOne{...orderActionFragment}visitAffirm{...orderActionFragment}}}actions{__typename return pendingReturn cancel startReturn{...orderActionFragment}reorder}banners{...textFragment}}","variables":{"orderId":"3382219232293","emailAddress":"dldrebes@aol.com"}}' \
  --compressed`
 
  if [[ $curl12 =~ "blocked" ]]; then
    link12=`echo $curl12 | jq '.redirectUrl' | sed 's/"//g'`
    `open -n -a /Applications/Microsoft\ Edge.app --args --profile-directory=Default https://walmart.com$link12`
    read -n 1 -p "blocked"
  else
    break
  fi
done

if [[ $curl12 =~ "error" ]]; then
    echo "12-Sai info"
    echo "'3382219232293" >> track-OrderID.txt
    echo "dldrebes@aol.com" >> track-email.txt
    echo "Sai info" >> track-usItemId.txt
    echo "Sai info" >> track-priceValue.txt
    echo "Sai info" >> track-fullName.txt
    echo "Sai info" >> track-address.txt
    echo "Sai info" >> track-status.txt
    echo "Sai info" >> track-number.txt
    echo "Sai info" >> track-url.txt
    echo "Sai info" >> track-categoriesType.txt
else
    sum12=`md5 track-OrderID.txt`
    for (( i=0; i<=4; i++ ))
    do
        for (( j=0; j<=4; j++))
        do
            if [[ `echo $curl12 | jq '.data.guestOrder.groups_2101['${i[@]}'].items['${j[@]}'].productInfo.usItemId'` == '"689830322"' ]]; then
                echo "'3382219232293" >> track-OrderID.txt
                echo dldrebes@aol.com >> track-email.txt
                echo $curl12 | jq '.data.guestOrder.groups_2101['${i[@]}'].items['${j[@]}'].productInfo.usItemId' >> track-usItemId.txt
                echo $curl12 | jq '.data.guestOrder.groups_2101['${i[@]}'].items['${j[@]}'].priceInfo.linePrice.value' >> track-priceValue.txt
                echo $curl12 | jq '.data.guestOrder.groups_2101['${i[@]}'].deliveryAddress.fullName' >> track-fullName.txt
                echo $curl12 | jq '.data.guestOrder.groups_2101['${i[@]}'].deliveryAddress.address.addressString' >> track-address.txt
                echo $curl12 | jq '.data.guestOrder.groups_2101['${i[@]}'].status.message.parts[].text' >> track-status.txt
                echo $curl12 | jq '.data.guestOrder.groups_2101['${i[@]}'].shipment.trackingNumber' | sed 's/null//g' >> track-number.txt
                echo $curl12 | jq '.data.guestOrder.groups_2101['${i[@]}'].shipment.trackingUrl' | sed 's/null//g' >> track-url.txt
                echo $curl12 | jq '.data.guestOrder.groups_2101['${i[@]}'].categories[].type' >> track-categoriesType.txt

                break
            fi
        done
    done
    if [[ $sum12 == `md5 track-OrderID.txt` ]]; then
        echo "12-Khác Item"
        echo "'3382219232293" >> track-OrderID.txt
        echo "dldrebes@aol.com" >> track-email.txt
        echo "Khác Item" >> track-usItemId.txt
        echo "Khác Item" >> track-priceValue.txt
        echo "Khác Item" >> track-fullName.txt
        echo "Khác Item" >> track-address.txt
        echo "Khác Item" >> track-status.txt
        echo "Khác Item" >> track-number.txt
        echo "Khác Item" >> track-url.txt
        echo "Khác Item" >> track-categoriesType.txt
    else
        echo "12"
    fi   
fi
while true
do
curl13=`curl -s 'https://www.walmart.com/orchestra/home/graphql' \
  -H 'authority: www.walmart.com' \
  -H 'sec-ch-ua: " Not;A Brand";v="99", "Microsoft Edge";v="97", "Chromium";v="97"' \
  -H 'x-o-platform: rweb' \
  -H 'dnt: 1' \
  -H 'x-o-correlation-id: pn9BnlEx0zDiyvRGJ6nL5BS9pDN7erB017Nf' \
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
  -H 'user-agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.51 Safari/537.36 Edg/99.0.1150.36' \
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
  --data-raw $'{"query":"query getGuestOrder($orderId:ID\u0021 $emailAddress:String\u0021){guestOrder(input:{id:$orderId emailAddress:$emailAddress}){...OrderFieldsFragment}}fragment cancelReason on OrderCancelReason{__typename subReasonCode subDescription}fragment priceDetailFragment on OrderPriceDetailRow{label value displayValue info{title message}rowInfo{...orderPriceDetailRowInfo}}fragment orderPriceDetailRowInfo on OrderPriceDetailRowInfo{title message{...textFragment}}fragment price on Price{displayValue value}fragment variants on MapEntry{name value}fragment OrderAddOn on OrderAddOn{lineId uniqueLineId productInfo{name usItemId offerId}quantityString quantityLabel type fulfillmentInstructions{...textFragment}actions{manageProtectionPlan{...orderActionFragment}cancel}priceInfo{linePrice{...price}}quantity isActive}fragment orderDonationDetails on OrderDonationDetails{message{...textFragment}emailReceipt emailReceiptToken status{...textFragment}errorStatus}fragment orderLineItem on OrderLineItem{id uniqueId actions{contactSeller cancel addToCart configureCake reviewItem resendEGiftCardToken protectionPlan{...orderActionFragment}manageProtectionPlan{...orderActionFragment}}isGift digitalDeliveryMessage quantity quantityString quantityLabel isSubstitutionSelected fulfilledItems{id quantityString priceInfo{itemPrice{value}}productInfo{usItemId name}}isReturnable returnEligibilityMessage productInfo{name usItemId imageInfo{thumbnailUrl}canonicalUrl offerId orderLimit orderMinLimit weightIncrement salesUnit salesUnitType isSubstitutionEligible isAlcohol}reshop{reshopMessage isShippingAvailable minPromiseDate maxPromiseDate}selectedVariants{...variants}variantAdditionalInfo{parts{text nativeAction}}priceInfo{priceDisplayCodes{showItemPrice priceDisplayCondition finalCostByWeight}itemPrice{...price}linePrice{...price}unitPrice{...price}preDiscountedLinePrice{...price}additionalLines{name value}}discounts{label labelText{...textFragment}}itemReviewed activationCodes{label code}protectionPlanMessage{...textFragment}showSeller isShippedByWalmart seller{id name isPro}digitalDeliveryPhoneNumber addOns{...OrderAddOn}multiboxBundleId}fragment DriverFragment on Driver{id firstName photoUrl}fragment OrderGroupFragment on OrderGroup{driver{...DriverFragment}deliveryDate fulfillmentType status{...OrderGroupStatusFragment}showSeller isShippedByWalmart seller{...SellerFragment}id itemCount items{...LiteLineItemFragment}pickupPerson{firstName lastName email}accessPointId shipment{...ShipmentFragment}returnEligibilityMessage actions{...OrderGroupActionsFragment}recipientEmailAddress digitalDelivery{...DigitalDeliveryFragment}tireInstallationReservation{status extraText reservationId}}fragment OrderGroupStatusFragment on OrderGroupStatus{statusType showStatusTracker statusTracker{status label isCurrent}message{...textFragment}subtext subMessage{...textFragment}notice helpCenterText{...textFragment}}fragment textFragment on Text{parts{bold url text nativeAction lineBreak}}fragment LiteLineItemFragment on OrderLineItem{id quantity productInfo{name usItemId imageInfo{thumbnailUrl}offerId isAlcohol}priceInfo{linePrice{...price}}}fragment SellerFragment on GroupSeller{id name isPro}fragment DigitalDeliveryFragment on DigitalDelivery{title name instructions{...textFragment}}fragment ShipmentFragment on Shipment{id trackingNumber isExternalTracking trackingUrl proofOfDelivery{...ProofOfDeliveryFragment}}fragment OrderGroupActionsFragment on OrderGroupActions{reorder edit track changeSlot checkin editDeliveryInstructions editPickupPerson editTip tip rateDriver cancel enableTip{...orderActionFragment}enableEdit{...orderActionFragment}rescheduleTireInstall{...orderActionFragment}cancelTireInstall{...orderActionFragment}help viewCancellationDetails{...cancellationDetailsActionFragment}}fragment cancellationDetailsActionFragment on CancellationDetailsAction{label heading text{...textFragment}}fragment ProofOfDeliveryFragment on ProofOfDelivery{photoUrl photoPreviewUrl showPreview}fragment DeliveryInstructionsFragment on DeliveryInstructions{text type typeText}fragment GiftDetailsFragment on GiftDetails{recipientAddress{fullName}recipientEmail senderName giftMessage}fragment SubstitutionAction on SubstitutionAction{message label type}fragment ODPGroupCategoryFragment on OrderCategory{type name subtext returnMessage substitutionsBanner{...textFragment}showExtendedSubstitutions actions{substitutions{...SubstitutionAction}nilPickReshop{message action{text url}}returnDetails viewCancellationDetails{...cancellationDetailsActionFragment}trackOnInHomeApp}banner{...textFragment}accordionState items{...orderLineItem}substitutions{...orderLineItem fulfilledItems{...orderLineItem}}returnInfo{...returnInfoFragment}}fragment ODPGroupFragment on OrderGroup{id fulfillmentType deliveryMessage deliveryAddress{fullName firstName lastName address{...addressFragment}}deliveryInstructions{...DeliveryInstructionsFragment}deliveryPreferences{text{...textFragment}cta{...orderActionFragment}}editSubstitutionsCutOff status{statusType showStatusTracker message{...textFragment}notice helpCenterText{...textFragment}}itemCount isCategorized categories{...ODPGroupCategoryFragment}seller{id name isPro}shipment{id trackingNumber}actions{reorder edit track changeSlot checkin editDeliveryInstructions editPickupPerson tip cancel help enableTip{...orderActionFragment}enableEdit{...orderActionFragment}viewCancellationDetails{...cancellationDetailsActionFragment}enableInHome{...orderActionFragment}createGiftReceipt}cutOffTimestamp isEditSubstitutionsEligible isInHome giftDetails{...GiftDetailsFragment}donationDetails{...orderDonationDetails}}fragment returnInfoFragment on ReturnInfo{returnOrderId type refundPriceDetails{__typename...refundPriceDetailsFragment}refundMessage tierRefundMessage paymentMethods{__typename description cardType paymentType displayValues message{...textFragment}}actions{__typename generate scheduleOrModifyPickup{text url}reschedulePickup editPickupContact}shippingLabelUrl qrCodeImageUrl carriers{__typename id name}pickupCarrier pickupContact{nameAndAddress{fullName firstName lastName address{addressString city state postalCode addressLineOne addressLineTwo country}}phone}pickupConfirmationNumber bannerMessage{...textFragment}}fragment refundPriceDetailsFragment on RefundPriceDetails{subTotal{__typename...orderPriceDetailRowFragment}fees{__typename...orderPriceDetailRowFragment}discounts{__typename...orderPriceDetailRowFragment}taxTotal{__typename...orderPriceDetailRowFragment}grandTotal{__typename...orderPriceDetailRowFragment}}fragment orderPriceDetailRowFragment on OrderPriceDetailRow{label displayValue value info{__typename title message}}fragment addressFragment on OrderAddress{addressString addressLineOne addressLineTwo state postalCode city}fragment ODPPickupInfo on OrderGroup{pickupInstructions pickupPerson{...person}alternatePickupPerson{...person}store{id name address{...addressFragment}}}fragment person on OrderPickupPerson{firstName lastName email}fragment ODPTippingInfo on OrderGroup{addTipMessage{...textFragment}driver{...DriverFragment}tipping{min{...price}max{...price}suggested{...price}preselected}subtotal{...price}}fragment orderActionFragment on Action{text url}fragment orderCustomer on OrderCustomer{id firstName lastName email isGuest isEmailRegistered}fragment OrderFieldsFragment on Order{__typename id version type customer{...orderCustomer}displayId idBarcodeImageUrl(barWidth:3 barHeight:100) isFuelPurchase title shortTitle timezone tippableGroup{...OrderGroupFragment}amendableGroup{id changeSlotIterationsLeft cutOffTimestamp fulfillmentType deliveryAddress{fullName firstName lastName address{addressString addressLineOne addressLineTwo state postalCode city country}}isAmendInProgress}substitutionsBanner{heading subheading longSubheading}groups_2101{__typename...OrderGroupFragment...ODPGroupFragment...ODPPickupInfo...ODPTippingInfo}multiboxBundles{...orderLineItem}itemCancelReasons{__typename...cancelReason}groupCancelReasons{__typename...cancelReason}priceDetails{__typename subTotal{__typename...priceDetailFragment}taxTotal{__typename...priceDetailFragment}grandTotal{__typename...priceDetailFragment}authorizationAmount{__typename...priceDetailFragment}fees{__typename...priceDetailFragment}discounts{__typename...priceDetailFragment}minimumThreshold{__typename...price}belowMinimumFee{__typename...priceDetailFragment}driverTip{__typename...priceDetailFragment}donations{__typename...priceDetailFragment}}paymentMethods{__typename description cardType paymentType displayValues message{...textFragment}actions{connectToCapitalOne{...orderActionFragment}visitAffirm{...orderActionFragment}}}actions{__typename return pendingReturn cancel startReturn{...orderActionFragment}reorder}banners{...textFragment}}","variables":{"orderId":"3382219974032","emailAddress":"jalpapatel@hotmail.com"}}' \
  --compressed`
 
  if [[ $curl13 =~ "blocked" ]]; then
    link13=`echo $curl13 | jq '.redirectUrl' | sed 's/"//g'`
    `open -n -a /Applications/Microsoft\ Edge.app --args --profile-directory=Default https://walmart.com$link13`
    read -n 1 -p "blocked"
  else
    break
  fi
done

if [[ $curl13 =~ "error" ]]; then
    echo "13-Sai info"
    echo "'3382219974032" >> track-OrderID.txt
    echo "jalpapatel@hotmail.com" >> track-email.txt
    echo "Sai info" >> track-usItemId.txt
    echo "Sai info" >> track-priceValue.txt
    echo "Sai info" >> track-fullName.txt
    echo "Sai info" >> track-address.txt
    echo "Sai info" >> track-status.txt
    echo "Sai info" >> track-number.txt
    echo "Sai info" >> track-url.txt
    echo "Sai info" >> track-categoriesType.txt
else
    sum13=`md5 track-OrderID.txt`
    for (( i=0; i<=4; i++ ))
    do
        for (( j=0; j<=4; j++))
        do
            if [[ `echo $curl13 | jq '.data.guestOrder.groups_2101['${i[@]}'].items['${j[@]}'].productInfo.usItemId'` == '"50753944"' ]]; then
                echo "'3382219974032" >> track-OrderID.txt
                echo jalpapatel@hotmail.com >> track-email.txt
                echo $curl13 | jq '.data.guestOrder.groups_2101['${i[@]}'].items['${j[@]}'].productInfo.usItemId' >> track-usItemId.txt
                echo $curl13 | jq '.data.guestOrder.groups_2101['${i[@]}'].items['${j[@]}'].priceInfo.linePrice.value' >> track-priceValue.txt
                echo $curl13 | jq '.data.guestOrder.groups_2101['${i[@]}'].deliveryAddress.fullName' >> track-fullName.txt
                echo $curl13 | jq '.data.guestOrder.groups_2101['${i[@]}'].deliveryAddress.address.addressString' >> track-address.txt
                echo $curl13 | jq '.data.guestOrder.groups_2101['${i[@]}'].status.message.parts[].text' >> track-status.txt
                echo $curl13 | jq '.data.guestOrder.groups_2101['${i[@]}'].shipment.trackingNumber' | sed 's/null//g' >> track-number.txt
                echo $curl13 | jq '.data.guestOrder.groups_2101['${i[@]}'].shipment.trackingUrl' | sed 's/null//g' >> track-url.txt
                echo $curl13 | jq '.data.guestOrder.groups_2101['${i[@]}'].categories[].type' >> track-categoriesType.txt

                break
            fi
        done
    done
    if [[ $sum13 == `md5 track-OrderID.txt` ]]; then
        echo "13-Khác Item"
        echo "'3382219974032" >> track-OrderID.txt
        echo "jalpapatel@hotmail.com" >> track-email.txt
        echo "Khác Item" >> track-usItemId.txt
        echo "Khác Item" >> track-priceValue.txt
        echo "Khác Item" >> track-fullName.txt
        echo "Khác Item" >> track-address.txt
        echo "Khác Item" >> track-status.txt
        echo "Khác Item" >> track-number.txt
        echo "Khác Item" >> track-url.txt
        echo "Khác Item" >> track-categoriesType.txt
    else
        echo "13"
    fi   
fi
while true
do
curl14=`curl -s 'https://www.walmart.com/orchestra/home/graphql' \
  -H 'authority: www.walmart.com' \
  -H 'sec-ch-ua: " Not;A Brand";v="99", "Microsoft Edge";v="97", "Chromium";v="97"' \
  -H 'x-o-platform: rweb' \
  -H 'dnt: 1' \
  -H 'x-o-correlation-id: pn9BnlEx0zDiyvRGJ6nL5BS9pDN7erB017Nf' \
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
  -H 'user-agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.51 Safari/537.36 Edg/99.0.1150.36' \
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
  --data-raw $'{"query":"query getGuestOrder($orderId:ID\u0021 $emailAddress:String\u0021){guestOrder(input:{id:$orderId emailAddress:$emailAddress}){...OrderFieldsFragment}}fragment cancelReason on OrderCancelReason{__typename subReasonCode subDescription}fragment priceDetailFragment on OrderPriceDetailRow{label value displayValue info{title message}rowInfo{...orderPriceDetailRowInfo}}fragment orderPriceDetailRowInfo on OrderPriceDetailRowInfo{title message{...textFragment}}fragment price on Price{displayValue value}fragment variants on MapEntry{name value}fragment OrderAddOn on OrderAddOn{lineId uniqueLineId productInfo{name usItemId offerId}quantityString quantityLabel type fulfillmentInstructions{...textFragment}actions{manageProtectionPlan{...orderActionFragment}cancel}priceInfo{linePrice{...price}}quantity isActive}fragment orderDonationDetails on OrderDonationDetails{message{...textFragment}emailReceipt emailReceiptToken status{...textFragment}errorStatus}fragment orderLineItem on OrderLineItem{id uniqueId actions{contactSeller cancel addToCart configureCake reviewItem resendEGiftCardToken protectionPlan{...orderActionFragment}manageProtectionPlan{...orderActionFragment}}isGift digitalDeliveryMessage quantity quantityString quantityLabel isSubstitutionSelected fulfilledItems{id quantityString priceInfo{itemPrice{value}}productInfo{usItemId name}}isReturnable returnEligibilityMessage productInfo{name usItemId imageInfo{thumbnailUrl}canonicalUrl offerId orderLimit orderMinLimit weightIncrement salesUnit salesUnitType isSubstitutionEligible isAlcohol}reshop{reshopMessage isShippingAvailable minPromiseDate maxPromiseDate}selectedVariants{...variants}variantAdditionalInfo{parts{text nativeAction}}priceInfo{priceDisplayCodes{showItemPrice priceDisplayCondition finalCostByWeight}itemPrice{...price}linePrice{...price}unitPrice{...price}preDiscountedLinePrice{...price}additionalLines{name value}}discounts{label labelText{...textFragment}}itemReviewed activationCodes{label code}protectionPlanMessage{...textFragment}showSeller isShippedByWalmart seller{id name isPro}digitalDeliveryPhoneNumber addOns{...OrderAddOn}multiboxBundleId}fragment DriverFragment on Driver{id firstName photoUrl}fragment OrderGroupFragment on OrderGroup{driver{...DriverFragment}deliveryDate fulfillmentType status{...OrderGroupStatusFragment}showSeller isShippedByWalmart seller{...SellerFragment}id itemCount items{...LiteLineItemFragment}pickupPerson{firstName lastName email}accessPointId shipment{...ShipmentFragment}returnEligibilityMessage actions{...OrderGroupActionsFragment}recipientEmailAddress digitalDelivery{...DigitalDeliveryFragment}tireInstallationReservation{status extraText reservationId}}fragment OrderGroupStatusFragment on OrderGroupStatus{statusType showStatusTracker statusTracker{status label isCurrent}message{...textFragment}subtext subMessage{...textFragment}notice helpCenterText{...textFragment}}fragment textFragment on Text{parts{bold url text nativeAction lineBreak}}fragment LiteLineItemFragment on OrderLineItem{id quantity productInfo{name usItemId imageInfo{thumbnailUrl}offerId isAlcohol}priceInfo{linePrice{...price}}}fragment SellerFragment on GroupSeller{id name isPro}fragment DigitalDeliveryFragment on DigitalDelivery{title name instructions{...textFragment}}fragment ShipmentFragment on Shipment{id trackingNumber isExternalTracking trackingUrl proofOfDelivery{...ProofOfDeliveryFragment}}fragment OrderGroupActionsFragment on OrderGroupActions{reorder edit track changeSlot checkin editDeliveryInstructions editPickupPerson editTip tip rateDriver cancel enableTip{...orderActionFragment}enableEdit{...orderActionFragment}rescheduleTireInstall{...orderActionFragment}cancelTireInstall{...orderActionFragment}help viewCancellationDetails{...cancellationDetailsActionFragment}}fragment cancellationDetailsActionFragment on CancellationDetailsAction{label heading text{...textFragment}}fragment ProofOfDeliveryFragment on ProofOfDelivery{photoUrl photoPreviewUrl showPreview}fragment DeliveryInstructionsFragment on DeliveryInstructions{text type typeText}fragment GiftDetailsFragment on GiftDetails{recipientAddress{fullName}recipientEmail senderName giftMessage}fragment SubstitutionAction on SubstitutionAction{message label type}fragment ODPGroupCategoryFragment on OrderCategory{type name subtext returnMessage substitutionsBanner{...textFragment}showExtendedSubstitutions actions{substitutions{...SubstitutionAction}nilPickReshop{message action{text url}}returnDetails viewCancellationDetails{...cancellationDetailsActionFragment}trackOnInHomeApp}banner{...textFragment}accordionState items{...orderLineItem}substitutions{...orderLineItem fulfilledItems{...orderLineItem}}returnInfo{...returnInfoFragment}}fragment ODPGroupFragment on OrderGroup{id fulfillmentType deliveryMessage deliveryAddress{fullName firstName lastName address{...addressFragment}}deliveryInstructions{...DeliveryInstructionsFragment}deliveryPreferences{text{...textFragment}cta{...orderActionFragment}}editSubstitutionsCutOff status{statusType showStatusTracker message{...textFragment}notice helpCenterText{...textFragment}}itemCount isCategorized categories{...ODPGroupCategoryFragment}seller{id name isPro}shipment{id trackingNumber}actions{reorder edit track changeSlot checkin editDeliveryInstructions editPickupPerson tip cancel help enableTip{...orderActionFragment}enableEdit{...orderActionFragment}viewCancellationDetails{...cancellationDetailsActionFragment}enableInHome{...orderActionFragment}createGiftReceipt}cutOffTimestamp isEditSubstitutionsEligible isInHome giftDetails{...GiftDetailsFragment}donationDetails{...orderDonationDetails}}fragment returnInfoFragment on ReturnInfo{returnOrderId type refundPriceDetails{__typename...refundPriceDetailsFragment}refundMessage tierRefundMessage paymentMethods{__typename description cardType paymentType displayValues message{...textFragment}}actions{__typename generate scheduleOrModifyPickup{text url}reschedulePickup editPickupContact}shippingLabelUrl qrCodeImageUrl carriers{__typename id name}pickupCarrier pickupContact{nameAndAddress{fullName firstName lastName address{addressString city state postalCode addressLineOne addressLineTwo country}}phone}pickupConfirmationNumber bannerMessage{...textFragment}}fragment refundPriceDetailsFragment on RefundPriceDetails{subTotal{__typename...orderPriceDetailRowFragment}fees{__typename...orderPriceDetailRowFragment}discounts{__typename...orderPriceDetailRowFragment}taxTotal{__typename...orderPriceDetailRowFragment}grandTotal{__typename...orderPriceDetailRowFragment}}fragment orderPriceDetailRowFragment on OrderPriceDetailRow{label displayValue value info{__typename title message}}fragment addressFragment on OrderAddress{addressString addressLineOne addressLineTwo state postalCode city}fragment ODPPickupInfo on OrderGroup{pickupInstructions pickupPerson{...person}alternatePickupPerson{...person}store{id name address{...addressFragment}}}fragment person on OrderPickupPerson{firstName lastName email}fragment ODPTippingInfo on OrderGroup{addTipMessage{...textFragment}driver{...DriverFragment}tipping{min{...price}max{...price}suggested{...price}preselected}subtotal{...price}}fragment orderActionFragment on Action{text url}fragment orderCustomer on OrderCustomer{id firstName lastName email isGuest isEmailRegistered}fragment OrderFieldsFragment on Order{__typename id version type customer{...orderCustomer}displayId idBarcodeImageUrl(barWidth:3 barHeight:100) isFuelPurchase title shortTitle timezone tippableGroup{...OrderGroupFragment}amendableGroup{id changeSlotIterationsLeft cutOffTimestamp fulfillmentType deliveryAddress{fullName firstName lastName address{addressString addressLineOne addressLineTwo state postalCode city country}}isAmendInProgress}substitutionsBanner{heading subheading longSubheading}groups_2101{__typename...OrderGroupFragment...ODPGroupFragment...ODPPickupInfo...ODPTippingInfo}multiboxBundles{...orderLineItem}itemCancelReasons{__typename...cancelReason}groupCancelReasons{__typename...cancelReason}priceDetails{__typename subTotal{__typename...priceDetailFragment}taxTotal{__typename...priceDetailFragment}grandTotal{__typename...priceDetailFragment}authorizationAmount{__typename...priceDetailFragment}fees{__typename...priceDetailFragment}discounts{__typename...priceDetailFragment}minimumThreshold{__typename...price}belowMinimumFee{__typename...priceDetailFragment}driverTip{__typename...priceDetailFragment}donations{__typename...priceDetailFragment}}paymentMethods{__typename description cardType paymentType displayValues message{...textFragment}actions{connectToCapitalOne{...orderActionFragment}visitAffirm{...orderActionFragment}}}actions{__typename return pendingReturn cancel startReturn{...orderActionFragment}reorder}banners{...textFragment}}","variables":{"orderId":"3392221964529","emailAddress":"Calalilly71276@gmail.com"}}' \
  --compressed`
 
  if [[ $curl14 =~ "blocked" ]]; then
    link14=`echo $curl14 | jq '.redirectUrl' | sed 's/"//g'`
    `open -n -a /Applications/Microsoft\ Edge.app --args --profile-directory=Default https://walmart.com$link14`
    read -n 1 -p "blocked"
  else
    break
  fi
done

if [[ $curl14 =~ "error" ]]; then
    echo "14-Sai info"
    echo "'3392221964529" >> track-OrderID.txt
    echo "Calalilly71276@gmail.com" >> track-email.txt
    echo "Sai info" >> track-usItemId.txt
    echo "Sai info" >> track-priceValue.txt
    echo "Sai info" >> track-fullName.txt
    echo "Sai info" >> track-address.txt
    echo "Sai info" >> track-status.txt
    echo "Sai info" >> track-number.txt
    echo "Sai info" >> track-url.txt
    echo "Sai info" >> track-categoriesType.txt
else
    sum14=`md5 track-OrderID.txt`
    for (( i=0; i<=4; i++ ))
    do
        for (( j=0; j<=4; j++))
        do
            if [[ `echo $curl14 | jq '.data.guestOrder.groups_2101['${i[@]}'].items['${j[@]}'].productInfo.usItemId'` == '"251754848"' ]]; then
                echo "'3392221964529" >> track-OrderID.txt
                echo Calalilly71276@gmail.com >> track-email.txt
                echo $curl14 | jq '.data.guestOrder.groups_2101['${i[@]}'].items['${j[@]}'].productInfo.usItemId' >> track-usItemId.txt
                echo $curl14 | jq '.data.guestOrder.groups_2101['${i[@]}'].items['${j[@]}'].priceInfo.linePrice.value' >> track-priceValue.txt
                echo $curl14 | jq '.data.guestOrder.groups_2101['${i[@]}'].deliveryAddress.fullName' >> track-fullName.txt
                echo $curl14 | jq '.data.guestOrder.groups_2101['${i[@]}'].deliveryAddress.address.addressString' >> track-address.txt
                echo $curl14 | jq '.data.guestOrder.groups_2101['${i[@]}'].status.message.parts[].text' >> track-status.txt
                echo $curl14 | jq '.data.guestOrder.groups_2101['${i[@]}'].shipment.trackingNumber' | sed 's/null//g' >> track-number.txt
                echo $curl14 | jq '.data.guestOrder.groups_2101['${i[@]}'].shipment.trackingUrl' | sed 's/null//g' >> track-url.txt
                echo $curl14 | jq '.data.guestOrder.groups_2101['${i[@]}'].categories[].type' >> track-categoriesType.txt

                break
            fi
        done
    done
    if [[ $sum14 == `md5 track-OrderID.txt` ]]; then
        echo "14-Khác Item"
        echo "'3392221964529" >> track-OrderID.txt
        echo "Calalilly71276@gmail.com" >> track-email.txt
        echo "Khác Item" >> track-usItemId.txt
        echo "Khác Item" >> track-priceValue.txt
        echo "Khác Item" >> track-fullName.txt
        echo "Khác Item" >> track-address.txt
        echo "Khác Item" >> track-status.txt
        echo "Khác Item" >> track-number.txt
        echo "Khác Item" >> track-url.txt
        echo "Khác Item" >> track-categoriesType.txt
    else
        echo "14"
    fi   
fi
while true
do
curl15=`curl -s 'https://www.walmart.com/orchestra/home/graphql' \
  -H 'authority: www.walmart.com' \
  -H 'sec-ch-ua: " Not;A Brand";v="99", "Microsoft Edge";v="97", "Chromium";v="97"' \
  -H 'x-o-platform: rweb' \
  -H 'dnt: 1' \
  -H 'x-o-correlation-id: pn9BnlEx0zDiyvRGJ6nL5BS9pDN7erB017Nf' \
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
  -H 'user-agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.51 Safari/537.36 Edg/99.0.1150.36' \
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
  --data-raw $'{"query":"query getGuestOrder($orderId:ID\u0021 $emailAddress:String\u0021){guestOrder(input:{id:$orderId emailAddress:$emailAddress}){...OrderFieldsFragment}}fragment cancelReason on OrderCancelReason{__typename subReasonCode subDescription}fragment priceDetailFragment on OrderPriceDetailRow{label value displayValue info{title message}rowInfo{...orderPriceDetailRowInfo}}fragment orderPriceDetailRowInfo on OrderPriceDetailRowInfo{title message{...textFragment}}fragment price on Price{displayValue value}fragment variants on MapEntry{name value}fragment OrderAddOn on OrderAddOn{lineId uniqueLineId productInfo{name usItemId offerId}quantityString quantityLabel type fulfillmentInstructions{...textFragment}actions{manageProtectionPlan{...orderActionFragment}cancel}priceInfo{linePrice{...price}}quantity isActive}fragment orderDonationDetails on OrderDonationDetails{message{...textFragment}emailReceipt emailReceiptToken status{...textFragment}errorStatus}fragment orderLineItem on OrderLineItem{id uniqueId actions{contactSeller cancel addToCart configureCake reviewItem resendEGiftCardToken protectionPlan{...orderActionFragment}manageProtectionPlan{...orderActionFragment}}isGift digitalDeliveryMessage quantity quantityString quantityLabel isSubstitutionSelected fulfilledItems{id quantityString priceInfo{itemPrice{value}}productInfo{usItemId name}}isReturnable returnEligibilityMessage productInfo{name usItemId imageInfo{thumbnailUrl}canonicalUrl offerId orderLimit orderMinLimit weightIncrement salesUnit salesUnitType isSubstitutionEligible isAlcohol}reshop{reshopMessage isShippingAvailable minPromiseDate maxPromiseDate}selectedVariants{...variants}variantAdditionalInfo{parts{text nativeAction}}priceInfo{priceDisplayCodes{showItemPrice priceDisplayCondition finalCostByWeight}itemPrice{...price}linePrice{...price}unitPrice{...price}preDiscountedLinePrice{...price}additionalLines{name value}}discounts{label labelText{...textFragment}}itemReviewed activationCodes{label code}protectionPlanMessage{...textFragment}showSeller isShippedByWalmart seller{id name isPro}digitalDeliveryPhoneNumber addOns{...OrderAddOn}multiboxBundleId}fragment DriverFragment on Driver{id firstName photoUrl}fragment OrderGroupFragment on OrderGroup{driver{...DriverFragment}deliveryDate fulfillmentType status{...OrderGroupStatusFragment}showSeller isShippedByWalmart seller{...SellerFragment}id itemCount items{...LiteLineItemFragment}pickupPerson{firstName lastName email}accessPointId shipment{...ShipmentFragment}returnEligibilityMessage actions{...OrderGroupActionsFragment}recipientEmailAddress digitalDelivery{...DigitalDeliveryFragment}tireInstallationReservation{status extraText reservationId}}fragment OrderGroupStatusFragment on OrderGroupStatus{statusType showStatusTracker statusTracker{status label isCurrent}message{...textFragment}subtext subMessage{...textFragment}notice helpCenterText{...textFragment}}fragment textFragment on Text{parts{bold url text nativeAction lineBreak}}fragment LiteLineItemFragment on OrderLineItem{id quantity productInfo{name usItemId imageInfo{thumbnailUrl}offerId isAlcohol}priceInfo{linePrice{...price}}}fragment SellerFragment on GroupSeller{id name isPro}fragment DigitalDeliveryFragment on DigitalDelivery{title name instructions{...textFragment}}fragment ShipmentFragment on Shipment{id trackingNumber isExternalTracking trackingUrl proofOfDelivery{...ProofOfDeliveryFragment}}fragment OrderGroupActionsFragment on OrderGroupActions{reorder edit track changeSlot checkin editDeliveryInstructions editPickupPerson editTip tip rateDriver cancel enableTip{...orderActionFragment}enableEdit{...orderActionFragment}rescheduleTireInstall{...orderActionFragment}cancelTireInstall{...orderActionFragment}help viewCancellationDetails{...cancellationDetailsActionFragment}}fragment cancellationDetailsActionFragment on CancellationDetailsAction{label heading text{...textFragment}}fragment ProofOfDeliveryFragment on ProofOfDelivery{photoUrl photoPreviewUrl showPreview}fragment DeliveryInstructionsFragment on DeliveryInstructions{text type typeText}fragment GiftDetailsFragment on GiftDetails{recipientAddress{fullName}recipientEmail senderName giftMessage}fragment SubstitutionAction on SubstitutionAction{message label type}fragment ODPGroupCategoryFragment on OrderCategory{type name subtext returnMessage substitutionsBanner{...textFragment}showExtendedSubstitutions actions{substitutions{...SubstitutionAction}nilPickReshop{message action{text url}}returnDetails viewCancellationDetails{...cancellationDetailsActionFragment}trackOnInHomeApp}banner{...textFragment}accordionState items{...orderLineItem}substitutions{...orderLineItem fulfilledItems{...orderLineItem}}returnInfo{...returnInfoFragment}}fragment ODPGroupFragment on OrderGroup{id fulfillmentType deliveryMessage deliveryAddress{fullName firstName lastName address{...addressFragment}}deliveryInstructions{...DeliveryInstructionsFragment}deliveryPreferences{text{...textFragment}cta{...orderActionFragment}}editSubstitutionsCutOff status{statusType showStatusTracker message{...textFragment}notice helpCenterText{...textFragment}}itemCount isCategorized categories{...ODPGroupCategoryFragment}seller{id name isPro}shipment{id trackingNumber}actions{reorder edit track changeSlot checkin editDeliveryInstructions editPickupPerson tip cancel help enableTip{...orderActionFragment}enableEdit{...orderActionFragment}viewCancellationDetails{...cancellationDetailsActionFragment}enableInHome{...orderActionFragment}createGiftReceipt}cutOffTimestamp isEditSubstitutionsEligible isInHome giftDetails{...GiftDetailsFragment}donationDetails{...orderDonationDetails}}fragment returnInfoFragment on ReturnInfo{returnOrderId type refundPriceDetails{__typename...refundPriceDetailsFragment}refundMessage tierRefundMessage paymentMethods{__typename description cardType paymentType displayValues message{...textFragment}}actions{__typename generate scheduleOrModifyPickup{text url}reschedulePickup editPickupContact}shippingLabelUrl qrCodeImageUrl carriers{__typename id name}pickupCarrier pickupContact{nameAndAddress{fullName firstName lastName address{addressString city state postalCode addressLineOne addressLineTwo country}}phone}pickupConfirmationNumber bannerMessage{...textFragment}}fragment refundPriceDetailsFragment on RefundPriceDetails{subTotal{__typename...orderPriceDetailRowFragment}fees{__typename...orderPriceDetailRowFragment}discounts{__typename...orderPriceDetailRowFragment}taxTotal{__typename...orderPriceDetailRowFragment}grandTotal{__typename...orderPriceDetailRowFragment}}fragment orderPriceDetailRowFragment on OrderPriceDetailRow{label displayValue value info{__typename title message}}fragment addressFragment on OrderAddress{addressString addressLineOne addressLineTwo state postalCode city}fragment ODPPickupInfo on OrderGroup{pickupInstructions pickupPerson{...person}alternatePickupPerson{...person}store{id name address{...addressFragment}}}fragment person on OrderPickupPerson{firstName lastName email}fragment ODPTippingInfo on OrderGroup{addTipMessage{...textFragment}driver{...DriverFragment}tipping{min{...price}max{...price}suggested{...price}preselected}subtotal{...price}}fragment orderActionFragment on Action{text url}fragment orderCustomer on OrderCustomer{id firstName lastName email isGuest isEmailRegistered}fragment OrderFieldsFragment on Order{__typename id version type customer{...orderCustomer}displayId idBarcodeImageUrl(barWidth:3 barHeight:100) isFuelPurchase title shortTitle timezone tippableGroup{...OrderGroupFragment}amendableGroup{id changeSlotIterationsLeft cutOffTimestamp fulfillmentType deliveryAddress{fullName firstName lastName address{addressString addressLineOne addressLineTwo state postalCode city country}}isAmendInProgress}substitutionsBanner{heading subheading longSubheading}groups_2101{__typename...OrderGroupFragment...ODPGroupFragment...ODPPickupInfo...ODPTippingInfo}multiboxBundles{...orderLineItem}itemCancelReasons{__typename...cancelReason}groupCancelReasons{__typename...cancelReason}priceDetails{__typename subTotal{__typename...priceDetailFragment}taxTotal{__typename...priceDetailFragment}grandTotal{__typename...priceDetailFragment}authorizationAmount{__typename...priceDetailFragment}fees{__typename...priceDetailFragment}discounts{__typename...priceDetailFragment}minimumThreshold{__typename...price}belowMinimumFee{__typename...priceDetailFragment}driverTip{__typename...priceDetailFragment}donations{__typename...priceDetailFragment}}paymentMethods{__typename description cardType paymentType displayValues message{...textFragment}actions{connectToCapitalOne{...orderActionFragment}visitAffirm{...orderActionFragment}}}actions{__typename return pendingReturn cancel startReturn{...orderActionFragment}reorder}banners{...textFragment}}","variables":{"orderId":"3382219775947","emailAddress":"ganhorn@gmail.com"}}' \
  --compressed`
 
  if [[ $curl15 =~ "blocked" ]]; then
    link15=`echo $curl15 | jq '.redirectUrl' | sed 's/"//g'`
    `open -n -a /Applications/Microsoft\ Edge.app --args --profile-directory=Default https://walmart.com$link15`
    read -n 1 -p "blocked"
  else
    break
  fi
done

if [[ $curl15 =~ "error" ]]; then
    echo "15-Sai info"
    echo "'3382219775947" >> track-OrderID.txt
    echo "ganhorn@gmail.com" >> track-email.txt
    echo "Sai info" >> track-usItemId.txt
    echo "Sai info" >> track-priceValue.txt
    echo "Sai info" >> track-fullName.txt
    echo "Sai info" >> track-address.txt
    echo "Sai info" >> track-status.txt
    echo "Sai info" >> track-number.txt
    echo "Sai info" >> track-url.txt
    echo "Sai info" >> track-categoriesType.txt
else
    sum15=`md5 track-OrderID.txt`
    for (( i=0; i<=4; i++ ))
    do
        for (( j=0; j<=4; j++))
        do
            if [[ `echo $curl15 | jq '.data.guestOrder.groups_2101['${i[@]}'].items['${j[@]}'].productInfo.usItemId'` == '"2625289"' ]]; then
                echo "'3382219775947" >> track-OrderID.txt
                echo ganhorn@gmail.com >> track-email.txt
                echo $curl15 | jq '.data.guestOrder.groups_2101['${i[@]}'].items['${j[@]}'].productInfo.usItemId' >> track-usItemId.txt
                echo $curl15 | jq '.data.guestOrder.groups_2101['${i[@]}'].items['${j[@]}'].priceInfo.linePrice.value' >> track-priceValue.txt
                echo $curl15 | jq '.data.guestOrder.groups_2101['${i[@]}'].deliveryAddress.fullName' >> track-fullName.txt
                echo $curl15 | jq '.data.guestOrder.groups_2101['${i[@]}'].deliveryAddress.address.addressString' >> track-address.txt
                echo $curl15 | jq '.data.guestOrder.groups_2101['${i[@]}'].status.message.parts[].text' >> track-status.txt
                echo $curl15 | jq '.data.guestOrder.groups_2101['${i[@]}'].shipment.trackingNumber' | sed 's/null//g' >> track-number.txt
                echo $curl15 | jq '.data.guestOrder.groups_2101['${i[@]}'].shipment.trackingUrl' | sed 's/null//g' >> track-url.txt
                echo $curl15 | jq '.data.guestOrder.groups_2101['${i[@]}'].categories[].type' >> track-categoriesType.txt

                break
            fi
        done
    done
    if [[ $sum15 == `md5 track-OrderID.txt` ]]; then
        echo "15-Khác Item"
        echo "'3382219775947" >> track-OrderID.txt
        echo "ganhorn@gmail.com" >> track-email.txt
        echo "Khác Item" >> track-usItemId.txt
        echo "Khác Item" >> track-priceValue.txt
        echo "Khác Item" >> track-fullName.txt
        echo "Khác Item" >> track-address.txt
        echo "Khác Item" >> track-status.txt
        echo "Khác Item" >> track-number.txt
        echo "Khác Item" >> track-url.txt
        echo "Khác Item" >> track-categoriesType.txt
    else
        echo "15"
    fi   
fi
while true
do
curl16=`curl -s 'https://www.walmart.com/orchestra/home/graphql' \
  -H 'authority: www.walmart.com' \
  -H 'sec-ch-ua: " Not;A Brand";v="99", "Microsoft Edge";v="97", "Chromium";v="97"' \
  -H 'x-o-platform: rweb' \
  -H 'dnt: 1' \
  -H 'x-o-correlation-id: pn9BnlEx0zDiyvRGJ6nL5BS9pDN7erB017Nf' \
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
  -H 'user-agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.51 Safari/537.36 Edg/99.0.1150.36' \
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
  --data-raw $'{"query":"query getGuestOrder($orderId:ID\u0021 $emailAddress:String\u0021){guestOrder(input:{id:$orderId emailAddress:$emailAddress}){...OrderFieldsFragment}}fragment cancelReason on OrderCancelReason{__typename subReasonCode subDescription}fragment priceDetailFragment on OrderPriceDetailRow{label value displayValue info{title message}rowInfo{...orderPriceDetailRowInfo}}fragment orderPriceDetailRowInfo on OrderPriceDetailRowInfo{title message{...textFragment}}fragment price on Price{displayValue value}fragment variants on MapEntry{name value}fragment OrderAddOn on OrderAddOn{lineId uniqueLineId productInfo{name usItemId offerId}quantityString quantityLabel type fulfillmentInstructions{...textFragment}actions{manageProtectionPlan{...orderActionFragment}cancel}priceInfo{linePrice{...price}}quantity isActive}fragment orderDonationDetails on OrderDonationDetails{message{...textFragment}emailReceipt emailReceiptToken status{...textFragment}errorStatus}fragment orderLineItem on OrderLineItem{id uniqueId actions{contactSeller cancel addToCart configureCake reviewItem resendEGiftCardToken protectionPlan{...orderActionFragment}manageProtectionPlan{...orderActionFragment}}isGift digitalDeliveryMessage quantity quantityString quantityLabel isSubstitutionSelected fulfilledItems{id quantityString priceInfo{itemPrice{value}}productInfo{usItemId name}}isReturnable returnEligibilityMessage productInfo{name usItemId imageInfo{thumbnailUrl}canonicalUrl offerId orderLimit orderMinLimit weightIncrement salesUnit salesUnitType isSubstitutionEligible isAlcohol}reshop{reshopMessage isShippingAvailable minPromiseDate maxPromiseDate}selectedVariants{...variants}variantAdditionalInfo{parts{text nativeAction}}priceInfo{priceDisplayCodes{showItemPrice priceDisplayCondition finalCostByWeight}itemPrice{...price}linePrice{...price}unitPrice{...price}preDiscountedLinePrice{...price}additionalLines{name value}}discounts{label labelText{...textFragment}}itemReviewed activationCodes{label code}protectionPlanMessage{...textFragment}showSeller isShippedByWalmart seller{id name isPro}digitalDeliveryPhoneNumber addOns{...OrderAddOn}multiboxBundleId}fragment DriverFragment on Driver{id firstName photoUrl}fragment OrderGroupFragment on OrderGroup{driver{...DriverFragment}deliveryDate fulfillmentType status{...OrderGroupStatusFragment}showSeller isShippedByWalmart seller{...SellerFragment}id itemCount items{...LiteLineItemFragment}pickupPerson{firstName lastName email}accessPointId shipment{...ShipmentFragment}returnEligibilityMessage actions{...OrderGroupActionsFragment}recipientEmailAddress digitalDelivery{...DigitalDeliveryFragment}tireInstallationReservation{status extraText reservationId}}fragment OrderGroupStatusFragment on OrderGroupStatus{statusType showStatusTracker statusTracker{status label isCurrent}message{...textFragment}subtext subMessage{...textFragment}notice helpCenterText{...textFragment}}fragment textFragment on Text{parts{bold url text nativeAction lineBreak}}fragment LiteLineItemFragment on OrderLineItem{id quantity productInfo{name usItemId imageInfo{thumbnailUrl}offerId isAlcohol}priceInfo{linePrice{...price}}}fragment SellerFragment on GroupSeller{id name isPro}fragment DigitalDeliveryFragment on DigitalDelivery{title name instructions{...textFragment}}fragment ShipmentFragment on Shipment{id trackingNumber isExternalTracking trackingUrl proofOfDelivery{...ProofOfDeliveryFragment}}fragment OrderGroupActionsFragment on OrderGroupActions{reorder edit track changeSlot checkin editDeliveryInstructions editPickupPerson editTip tip rateDriver cancel enableTip{...orderActionFragment}enableEdit{...orderActionFragment}rescheduleTireInstall{...orderActionFragment}cancelTireInstall{...orderActionFragment}help viewCancellationDetails{...cancellationDetailsActionFragment}}fragment cancellationDetailsActionFragment on CancellationDetailsAction{label heading text{...textFragment}}fragment ProofOfDeliveryFragment on ProofOfDelivery{photoUrl photoPreviewUrl showPreview}fragment DeliveryInstructionsFragment on DeliveryInstructions{text type typeText}fragment GiftDetailsFragment on GiftDetails{recipientAddress{fullName}recipientEmail senderName giftMessage}fragment SubstitutionAction on SubstitutionAction{message label type}fragment ODPGroupCategoryFragment on OrderCategory{type name subtext returnMessage substitutionsBanner{...textFragment}showExtendedSubstitutions actions{substitutions{...SubstitutionAction}nilPickReshop{message action{text url}}returnDetails viewCancellationDetails{...cancellationDetailsActionFragment}trackOnInHomeApp}banner{...textFragment}accordionState items{...orderLineItem}substitutions{...orderLineItem fulfilledItems{...orderLineItem}}returnInfo{...returnInfoFragment}}fragment ODPGroupFragment on OrderGroup{id fulfillmentType deliveryMessage deliveryAddress{fullName firstName lastName address{...addressFragment}}deliveryInstructions{...DeliveryInstructionsFragment}deliveryPreferences{text{...textFragment}cta{...orderActionFragment}}editSubstitutionsCutOff status{statusType showStatusTracker message{...textFragment}notice helpCenterText{...textFragment}}itemCount isCategorized categories{...ODPGroupCategoryFragment}seller{id name isPro}shipment{id trackingNumber}actions{reorder edit track changeSlot checkin editDeliveryInstructions editPickupPerson tip cancel help enableTip{...orderActionFragment}enableEdit{...orderActionFragment}viewCancellationDetails{...cancellationDetailsActionFragment}enableInHome{...orderActionFragment}createGiftReceipt}cutOffTimestamp isEditSubstitutionsEligible isInHome giftDetails{...GiftDetailsFragment}donationDetails{...orderDonationDetails}}fragment returnInfoFragment on ReturnInfo{returnOrderId type refundPriceDetails{__typename...refundPriceDetailsFragment}refundMessage tierRefundMessage paymentMethods{__typename description cardType paymentType displayValues message{...textFragment}}actions{__typename generate scheduleOrModifyPickup{text url}reschedulePickup editPickupContact}shippingLabelUrl qrCodeImageUrl carriers{__typename id name}pickupCarrier pickupContact{nameAndAddress{fullName firstName lastName address{addressString city state postalCode addressLineOne addressLineTwo country}}phone}pickupConfirmationNumber bannerMessage{...textFragment}}fragment refundPriceDetailsFragment on RefundPriceDetails{subTotal{__typename...orderPriceDetailRowFragment}fees{__typename...orderPriceDetailRowFragment}discounts{__typename...orderPriceDetailRowFragment}taxTotal{__typename...orderPriceDetailRowFragment}grandTotal{__typename...orderPriceDetailRowFragment}}fragment orderPriceDetailRowFragment on OrderPriceDetailRow{label displayValue value info{__typename title message}}fragment addressFragment on OrderAddress{addressString addressLineOne addressLineTwo state postalCode city}fragment ODPPickupInfo on OrderGroup{pickupInstructions pickupPerson{...person}alternatePickupPerson{...person}store{id name address{...addressFragment}}}fragment person on OrderPickupPerson{firstName lastName email}fragment ODPTippingInfo on OrderGroup{addTipMessage{...textFragment}driver{...DriverFragment}tipping{min{...price}max{...price}suggested{...price}preselected}subtotal{...price}}fragment orderActionFragment on Action{text url}fragment orderCustomer on OrderCustomer{id firstName lastName email isGuest isEmailRegistered}fragment OrderFieldsFragment on Order{__typename id version type customer{...orderCustomer}displayId idBarcodeImageUrl(barWidth:3 barHeight:100) isFuelPurchase title shortTitle timezone tippableGroup{...OrderGroupFragment}amendableGroup{id changeSlotIterationsLeft cutOffTimestamp fulfillmentType deliveryAddress{fullName firstName lastName address{addressString addressLineOne addressLineTwo state postalCode city country}}isAmendInProgress}substitutionsBanner{heading subheading longSubheading}groups_2101{__typename...OrderGroupFragment...ODPGroupFragment...ODPPickupInfo...ODPTippingInfo}multiboxBundles{...orderLineItem}itemCancelReasons{__typename...cancelReason}groupCancelReasons{__typename...cancelReason}priceDetails{__typename subTotal{__typename...priceDetailFragment}taxTotal{__typename...priceDetailFragment}grandTotal{__typename...priceDetailFragment}authorizationAmount{__typename...priceDetailFragment}fees{__typename...priceDetailFragment}discounts{__typename...priceDetailFragment}minimumThreshold{__typename...price}belowMinimumFee{__typename...priceDetailFragment}driverTip{__typename...priceDetailFragment}donations{__typename...priceDetailFragment}}paymentMethods{__typename description cardType paymentType displayValues message{...textFragment}actions{connectToCapitalOne{...orderActionFragment}visitAffirm{...orderActionFragment}}}actions{__typename return pendingReturn cancel startReturn{...orderActionFragment}reorder}banners{...textFragment}}","variables":{"orderId":"3382219484969","emailAddress":"abradley3813@gmail.com"}}' \
  --compressed`
 
  if [[ $curl16 =~ "blocked" ]]; then
    link16=`echo $curl16 | jq '.redirectUrl' | sed 's/"//g'`
    `open -n -a /Applications/Microsoft\ Edge.app --args --profile-directory=Default https://walmart.com$link16`
    read -n 1 -p "blocked"
  else
    break
  fi
done

if [[ $curl16 =~ "error" ]]; then
    echo "16-Sai info"
    echo "'3382219484969" >> track-OrderID.txt
    echo "abradley3813@gmail.com" >> track-email.txt
    echo "Sai info" >> track-usItemId.txt
    echo "Sai info" >> track-priceValue.txt
    echo "Sai info" >> track-fullName.txt
    echo "Sai info" >> track-address.txt
    echo "Sai info" >> track-status.txt
    echo "Sai info" >> track-number.txt
    echo "Sai info" >> track-url.txt
    echo "Sai info" >> track-categoriesType.txt
else
    sum16=`md5 track-OrderID.txt`
    for (( i=0; i<=4; i++ ))
    do
        for (( j=0; j<=4; j++))
        do
            if [[ `echo $curl16 | jq '.data.guestOrder.groups_2101['${i[@]}'].items['${j[@]}'].productInfo.usItemId'` == '"121639349"' ]]; then
                echo "'3382219484969" >> track-OrderID.txt
                echo abradley3813@gmail.com >> track-email.txt
                echo $curl16 | jq '.data.guestOrder.groups_2101['${i[@]}'].items['${j[@]}'].productInfo.usItemId' >> track-usItemId.txt
                echo $curl16 | jq '.data.guestOrder.groups_2101['${i[@]}'].items['${j[@]}'].priceInfo.linePrice.value' >> track-priceValue.txt
                echo $curl16 | jq '.data.guestOrder.groups_2101['${i[@]}'].deliveryAddress.fullName' >> track-fullName.txt
                echo $curl16 | jq '.data.guestOrder.groups_2101['${i[@]}'].deliveryAddress.address.addressString' >> track-address.txt
                echo $curl16 | jq '.data.guestOrder.groups_2101['${i[@]}'].status.message.parts[].text' >> track-status.txt
                echo $curl16 | jq '.data.guestOrder.groups_2101['${i[@]}'].shipment.trackingNumber' | sed 's/null//g' >> track-number.txt
                echo $curl16 | jq '.data.guestOrder.groups_2101['${i[@]}'].shipment.trackingUrl' | sed 's/null//g' >> track-url.txt
                echo $curl16 | jq '.data.guestOrder.groups_2101['${i[@]}'].categories[].type' >> track-categoriesType.txt

                break
            fi
        done
    done
    if [[ $sum16 == `md5 track-OrderID.txt` ]]; then
        echo "16-Khác Item"
        echo "'3382219484969" >> track-OrderID.txt
        echo "abradley3813@gmail.com" >> track-email.txt
        echo "Khác Item" >> track-usItemId.txt
        echo "Khác Item" >> track-priceValue.txt
        echo "Khác Item" >> track-fullName.txt
        echo "Khác Item" >> track-address.txt
        echo "Khác Item" >> track-status.txt
        echo "Khác Item" >> track-number.txt
        echo "Khác Item" >> track-url.txt
        echo "Khác Item" >> track-categoriesType.txt
    else
        echo "16"
    fi   
fi
while true
do
curl17=`curl -s 'https://www.walmart.com/orchestra/home/graphql' \
  -H 'authority: www.walmart.com' \
  -H 'sec-ch-ua: " Not;A Brand";v="99", "Microsoft Edge";v="97", "Chromium";v="97"' \
  -H 'x-o-platform: rweb' \
  -H 'dnt: 1' \
  -H 'x-o-correlation-id: pn9BnlEx0zDiyvRGJ6nL5BS9pDN7erB017Nf' \
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
  -H 'user-agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.51 Safari/537.36 Edg/99.0.1150.36' \
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
  --data-raw $'{"query":"query getGuestOrder($orderId:ID\u0021 $emailAddress:String\u0021){guestOrder(input:{id:$orderId emailAddress:$emailAddress}){...OrderFieldsFragment}}fragment cancelReason on OrderCancelReason{__typename subReasonCode subDescription}fragment priceDetailFragment on OrderPriceDetailRow{label value displayValue info{title message}rowInfo{...orderPriceDetailRowInfo}}fragment orderPriceDetailRowInfo on OrderPriceDetailRowInfo{title message{...textFragment}}fragment price on Price{displayValue value}fragment variants on MapEntry{name value}fragment OrderAddOn on OrderAddOn{lineId uniqueLineId productInfo{name usItemId offerId}quantityString quantityLabel type fulfillmentInstructions{...textFragment}actions{manageProtectionPlan{...orderActionFragment}cancel}priceInfo{linePrice{...price}}quantity isActive}fragment orderDonationDetails on OrderDonationDetails{message{...textFragment}emailReceipt emailReceiptToken status{...textFragment}errorStatus}fragment orderLineItem on OrderLineItem{id uniqueId actions{contactSeller cancel addToCart configureCake reviewItem resendEGiftCardToken protectionPlan{...orderActionFragment}manageProtectionPlan{...orderActionFragment}}isGift digitalDeliveryMessage quantity quantityString quantityLabel isSubstitutionSelected fulfilledItems{id quantityString priceInfo{itemPrice{value}}productInfo{usItemId name}}isReturnable returnEligibilityMessage productInfo{name usItemId imageInfo{thumbnailUrl}canonicalUrl offerId orderLimit orderMinLimit weightIncrement salesUnit salesUnitType isSubstitutionEligible isAlcohol}reshop{reshopMessage isShippingAvailable minPromiseDate maxPromiseDate}selectedVariants{...variants}variantAdditionalInfo{parts{text nativeAction}}priceInfo{priceDisplayCodes{showItemPrice priceDisplayCondition finalCostByWeight}itemPrice{...price}linePrice{...price}unitPrice{...price}preDiscountedLinePrice{...price}additionalLines{name value}}discounts{label labelText{...textFragment}}itemReviewed activationCodes{label code}protectionPlanMessage{...textFragment}showSeller isShippedByWalmart seller{id name isPro}digitalDeliveryPhoneNumber addOns{...OrderAddOn}multiboxBundleId}fragment DriverFragment on Driver{id firstName photoUrl}fragment OrderGroupFragment on OrderGroup{driver{...DriverFragment}deliveryDate fulfillmentType status{...OrderGroupStatusFragment}showSeller isShippedByWalmart seller{...SellerFragment}id itemCount items{...LiteLineItemFragment}pickupPerson{firstName lastName email}accessPointId shipment{...ShipmentFragment}returnEligibilityMessage actions{...OrderGroupActionsFragment}recipientEmailAddress digitalDelivery{...DigitalDeliveryFragment}tireInstallationReservation{status extraText reservationId}}fragment OrderGroupStatusFragment on OrderGroupStatus{statusType showStatusTracker statusTracker{status label isCurrent}message{...textFragment}subtext subMessage{...textFragment}notice helpCenterText{...textFragment}}fragment textFragment on Text{parts{bold url text nativeAction lineBreak}}fragment LiteLineItemFragment on OrderLineItem{id quantity productInfo{name usItemId imageInfo{thumbnailUrl}offerId isAlcohol}priceInfo{linePrice{...price}}}fragment SellerFragment on GroupSeller{id name isPro}fragment DigitalDeliveryFragment on DigitalDelivery{title name instructions{...textFragment}}fragment ShipmentFragment on Shipment{id trackingNumber isExternalTracking trackingUrl proofOfDelivery{...ProofOfDeliveryFragment}}fragment OrderGroupActionsFragment on OrderGroupActions{reorder edit track changeSlot checkin editDeliveryInstructions editPickupPerson editTip tip rateDriver cancel enableTip{...orderActionFragment}enableEdit{...orderActionFragment}rescheduleTireInstall{...orderActionFragment}cancelTireInstall{...orderActionFragment}help viewCancellationDetails{...cancellationDetailsActionFragment}}fragment cancellationDetailsActionFragment on CancellationDetailsAction{label heading text{...textFragment}}fragment ProofOfDeliveryFragment on ProofOfDelivery{photoUrl photoPreviewUrl showPreview}fragment DeliveryInstructionsFragment on DeliveryInstructions{text type typeText}fragment GiftDetailsFragment on GiftDetails{recipientAddress{fullName}recipientEmail senderName giftMessage}fragment SubstitutionAction on SubstitutionAction{message label type}fragment ODPGroupCategoryFragment on OrderCategory{type name subtext returnMessage substitutionsBanner{...textFragment}showExtendedSubstitutions actions{substitutions{...SubstitutionAction}nilPickReshop{message action{text url}}returnDetails viewCancellationDetails{...cancellationDetailsActionFragment}trackOnInHomeApp}banner{...textFragment}accordionState items{...orderLineItem}substitutions{...orderLineItem fulfilledItems{...orderLineItem}}returnInfo{...returnInfoFragment}}fragment ODPGroupFragment on OrderGroup{id fulfillmentType deliveryMessage deliveryAddress{fullName firstName lastName address{...addressFragment}}deliveryInstructions{...DeliveryInstructionsFragment}deliveryPreferences{text{...textFragment}cta{...orderActionFragment}}editSubstitutionsCutOff status{statusType showStatusTracker message{...textFragment}notice helpCenterText{...textFragment}}itemCount isCategorized categories{...ODPGroupCategoryFragment}seller{id name isPro}shipment{id trackingNumber}actions{reorder edit track changeSlot checkin editDeliveryInstructions editPickupPerson tip cancel help enableTip{...orderActionFragment}enableEdit{...orderActionFragment}viewCancellationDetails{...cancellationDetailsActionFragment}enableInHome{...orderActionFragment}createGiftReceipt}cutOffTimestamp isEditSubstitutionsEligible isInHome giftDetails{...GiftDetailsFragment}donationDetails{...orderDonationDetails}}fragment returnInfoFragment on ReturnInfo{returnOrderId type refundPriceDetails{__typename...refundPriceDetailsFragment}refundMessage tierRefundMessage paymentMethods{__typename description cardType paymentType displayValues message{...textFragment}}actions{__typename generate scheduleOrModifyPickup{text url}reschedulePickup editPickupContact}shippingLabelUrl qrCodeImageUrl carriers{__typename id name}pickupCarrier pickupContact{nameAndAddress{fullName firstName lastName address{addressString city state postalCode addressLineOne addressLineTwo country}}phone}pickupConfirmationNumber bannerMessage{...textFragment}}fragment refundPriceDetailsFragment on RefundPriceDetails{subTotal{__typename...orderPriceDetailRowFragment}fees{__typename...orderPriceDetailRowFragment}discounts{__typename...orderPriceDetailRowFragment}taxTotal{__typename...orderPriceDetailRowFragment}grandTotal{__typename...orderPriceDetailRowFragment}}fragment orderPriceDetailRowFragment on OrderPriceDetailRow{label displayValue value info{__typename title message}}fragment addressFragment on OrderAddress{addressString addressLineOne addressLineTwo state postalCode city}fragment ODPPickupInfo on OrderGroup{pickupInstructions pickupPerson{...person}alternatePickupPerson{...person}store{id name address{...addressFragment}}}fragment person on OrderPickupPerson{firstName lastName email}fragment ODPTippingInfo on OrderGroup{addTipMessage{...textFragment}driver{...DriverFragment}tipping{min{...price}max{...price}suggested{...price}preselected}subtotal{...price}}fragment orderActionFragment on Action{text url}fragment orderCustomer on OrderCustomer{id firstName lastName email isGuest isEmailRegistered}fragment OrderFieldsFragment on Order{__typename id version type customer{...orderCustomer}displayId idBarcodeImageUrl(barWidth:3 barHeight:100) isFuelPurchase title shortTitle timezone tippableGroup{...OrderGroupFragment}amendableGroup{id changeSlotIterationsLeft cutOffTimestamp fulfillmentType deliveryAddress{fullName firstName lastName address{addressString addressLineOne addressLineTwo state postalCode city country}}isAmendInProgress}substitutionsBanner{heading subheading longSubheading}groups_2101{__typename...OrderGroupFragment...ODPGroupFragment...ODPPickupInfo...ODPTippingInfo}multiboxBundles{...orderLineItem}itemCancelReasons{__typename...cancelReason}groupCancelReasons{__typename...cancelReason}priceDetails{__typename subTotal{__typename...priceDetailFragment}taxTotal{__typename...priceDetailFragment}grandTotal{__typename...priceDetailFragment}authorizationAmount{__typename...priceDetailFragment}fees{__typename...priceDetailFragment}discounts{__typename...priceDetailFragment}minimumThreshold{__typename...price}belowMinimumFee{__typename...priceDetailFragment}driverTip{__typename...priceDetailFragment}donations{__typename...priceDetailFragment}}paymentMethods{__typename description cardType paymentType displayValues message{...textFragment}actions{connectToCapitalOne{...orderActionFragment}visitAffirm{...orderActionFragment}}}actions{__typename return pendingReturn cancel startReturn{...orderActionFragment}reorder}banners{...textFragment}}","variables":{"orderId":"3362216604530","emailAddress":"juliebean2006@yahoo.com"}}' \
  --compressed`
 
  if [[ $curl17 =~ "blocked" ]]; then
    link17=`echo $curl17 | jq '.redirectUrl' | sed 's/"//g'`
    `open -n -a /Applications/Microsoft\ Edge.app --args --profile-directory=Default https://walmart.com$link17`
    read -n 1 -p "blocked"
  else
    break
  fi
done

if [[ $curl17 =~ "error" ]]; then
    echo "17-Sai info"
    echo "'3362216604530" >> track-OrderID.txt
    echo "juliebean2006@yahoo.com" >> track-email.txt
    echo "Sai info" >> track-usItemId.txt
    echo "Sai info" >> track-priceValue.txt
    echo "Sai info" >> track-fullName.txt
    echo "Sai info" >> track-address.txt
    echo "Sai info" >> track-status.txt
    echo "Sai info" >> track-number.txt
    echo "Sai info" >> track-url.txt
    echo "Sai info" >> track-categoriesType.txt
else
    sum17=`md5 track-OrderID.txt`
    for (( i=0; i<=4; i++ ))
    do
        for (( j=0; j<=4; j++))
        do
            if [[ `echo $curl17 | jq '.data.guestOrder.groups_2101['${i[@]}'].items['${j[@]}'].productInfo.usItemId'` == '"811638922"' ]]; then
                echo "'3362216604530" >> track-OrderID.txt
                echo juliebean2006@yahoo.com >> track-email.txt
                echo $curl17 | jq '.data.guestOrder.groups_2101['${i[@]}'].items['${j[@]}'].productInfo.usItemId' >> track-usItemId.txt
                echo $curl17 | jq '.data.guestOrder.groups_2101['${i[@]}'].items['${j[@]}'].priceInfo.linePrice.value' >> track-priceValue.txt
                echo $curl17 | jq '.data.guestOrder.groups_2101['${i[@]}'].deliveryAddress.fullName' >> track-fullName.txt
                echo $curl17 | jq '.data.guestOrder.groups_2101['${i[@]}'].deliveryAddress.address.addressString' >> track-address.txt
                echo $curl17 | jq '.data.guestOrder.groups_2101['${i[@]}'].status.message.parts[].text' >> track-status.txt
                echo $curl17 | jq '.data.guestOrder.groups_2101['${i[@]}'].shipment.trackingNumber' | sed 's/null//g' >> track-number.txt
                echo $curl17 | jq '.data.guestOrder.groups_2101['${i[@]}'].shipment.trackingUrl' | sed 's/null//g' >> track-url.txt
                echo $curl17 | jq '.data.guestOrder.groups_2101['${i[@]}'].categories[].type' >> track-categoriesType.txt

                break
            fi
        done
    done
    if [[ $sum17 == `md5 track-OrderID.txt` ]]; then
        echo "17-Khác Item"
        echo "'3362216604530" >> track-OrderID.txt
        echo "juliebean2006@yahoo.com" >> track-email.txt
        echo "Khác Item" >> track-usItemId.txt
        echo "Khác Item" >> track-priceValue.txt
        echo "Khác Item" >> track-fullName.txt
        echo "Khác Item" >> track-address.txt
        echo "Khác Item" >> track-status.txt
        echo "Khác Item" >> track-number.txt
        echo "Khác Item" >> track-url.txt
        echo "Khác Item" >> track-categoriesType.txt
    else
        echo "17"
    fi   
fi
while true
do
curl18=`curl -s 'https://www.walmart.com/orchestra/home/graphql' \
  -H 'authority: www.walmart.com' \
  -H 'sec-ch-ua: " Not;A Brand";v="99", "Microsoft Edge";v="97", "Chromium";v="97"' \
  -H 'x-o-platform: rweb' \
  -H 'dnt: 1' \
  -H 'x-o-correlation-id: pn9BnlEx0zDiyvRGJ6nL5BS9pDN7erB017Nf' \
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
  -H 'user-agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.51 Safari/537.36 Edg/99.0.1150.36' \
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
  --data-raw $'{"query":"query getGuestOrder($orderId:ID\u0021 $emailAddress:String\u0021){guestOrder(input:{id:$orderId emailAddress:$emailAddress}){...OrderFieldsFragment}}fragment cancelReason on OrderCancelReason{__typename subReasonCode subDescription}fragment priceDetailFragment on OrderPriceDetailRow{label value displayValue info{title message}rowInfo{...orderPriceDetailRowInfo}}fragment orderPriceDetailRowInfo on OrderPriceDetailRowInfo{title message{...textFragment}}fragment price on Price{displayValue value}fragment variants on MapEntry{name value}fragment OrderAddOn on OrderAddOn{lineId uniqueLineId productInfo{name usItemId offerId}quantityString quantityLabel type fulfillmentInstructions{...textFragment}actions{manageProtectionPlan{...orderActionFragment}cancel}priceInfo{linePrice{...price}}quantity isActive}fragment orderDonationDetails on OrderDonationDetails{message{...textFragment}emailReceipt emailReceiptToken status{...textFragment}errorStatus}fragment orderLineItem on OrderLineItem{id uniqueId actions{contactSeller cancel addToCart configureCake reviewItem resendEGiftCardToken protectionPlan{...orderActionFragment}manageProtectionPlan{...orderActionFragment}}isGift digitalDeliveryMessage quantity quantityString quantityLabel isSubstitutionSelected fulfilledItems{id quantityString priceInfo{itemPrice{value}}productInfo{usItemId name}}isReturnable returnEligibilityMessage productInfo{name usItemId imageInfo{thumbnailUrl}canonicalUrl offerId orderLimit orderMinLimit weightIncrement salesUnit salesUnitType isSubstitutionEligible isAlcohol}reshop{reshopMessage isShippingAvailable minPromiseDate maxPromiseDate}selectedVariants{...variants}variantAdditionalInfo{parts{text nativeAction}}priceInfo{priceDisplayCodes{showItemPrice priceDisplayCondition finalCostByWeight}itemPrice{...price}linePrice{...price}unitPrice{...price}preDiscountedLinePrice{...price}additionalLines{name value}}discounts{label labelText{...textFragment}}itemReviewed activationCodes{label code}protectionPlanMessage{...textFragment}showSeller isShippedByWalmart seller{id name isPro}digitalDeliveryPhoneNumber addOns{...OrderAddOn}multiboxBundleId}fragment DriverFragment on Driver{id firstName photoUrl}fragment OrderGroupFragment on OrderGroup{driver{...DriverFragment}deliveryDate fulfillmentType status{...OrderGroupStatusFragment}showSeller isShippedByWalmart seller{...SellerFragment}id itemCount items{...LiteLineItemFragment}pickupPerson{firstName lastName email}accessPointId shipment{...ShipmentFragment}returnEligibilityMessage actions{...OrderGroupActionsFragment}recipientEmailAddress digitalDelivery{...DigitalDeliveryFragment}tireInstallationReservation{status extraText reservationId}}fragment OrderGroupStatusFragment on OrderGroupStatus{statusType showStatusTracker statusTracker{status label isCurrent}message{...textFragment}subtext subMessage{...textFragment}notice helpCenterText{...textFragment}}fragment textFragment on Text{parts{bold url text nativeAction lineBreak}}fragment LiteLineItemFragment on OrderLineItem{id quantity productInfo{name usItemId imageInfo{thumbnailUrl}offerId isAlcohol}priceInfo{linePrice{...price}}}fragment SellerFragment on GroupSeller{id name isPro}fragment DigitalDeliveryFragment on DigitalDelivery{title name instructions{...textFragment}}fragment ShipmentFragment on Shipment{id trackingNumber isExternalTracking trackingUrl proofOfDelivery{...ProofOfDeliveryFragment}}fragment OrderGroupActionsFragment on OrderGroupActions{reorder edit track changeSlot checkin editDeliveryInstructions editPickupPerson editTip tip rateDriver cancel enableTip{...orderActionFragment}enableEdit{...orderActionFragment}rescheduleTireInstall{...orderActionFragment}cancelTireInstall{...orderActionFragment}help viewCancellationDetails{...cancellationDetailsActionFragment}}fragment cancellationDetailsActionFragment on CancellationDetailsAction{label heading text{...textFragment}}fragment ProofOfDeliveryFragment on ProofOfDelivery{photoUrl photoPreviewUrl showPreview}fragment DeliveryInstructionsFragment on DeliveryInstructions{text type typeText}fragment GiftDetailsFragment on GiftDetails{recipientAddress{fullName}recipientEmail senderName giftMessage}fragment SubstitutionAction on SubstitutionAction{message label type}fragment ODPGroupCategoryFragment on OrderCategory{type name subtext returnMessage substitutionsBanner{...textFragment}showExtendedSubstitutions actions{substitutions{...SubstitutionAction}nilPickReshop{message action{text url}}returnDetails viewCancellationDetails{...cancellationDetailsActionFragment}trackOnInHomeApp}banner{...textFragment}accordionState items{...orderLineItem}substitutions{...orderLineItem fulfilledItems{...orderLineItem}}returnInfo{...returnInfoFragment}}fragment ODPGroupFragment on OrderGroup{id fulfillmentType deliveryMessage deliveryAddress{fullName firstName lastName address{...addressFragment}}deliveryInstructions{...DeliveryInstructionsFragment}deliveryPreferences{text{...textFragment}cta{...orderActionFragment}}editSubstitutionsCutOff status{statusType showStatusTracker message{...textFragment}notice helpCenterText{...textFragment}}itemCount isCategorized categories{...ODPGroupCategoryFragment}seller{id name isPro}shipment{id trackingNumber}actions{reorder edit track changeSlot checkin editDeliveryInstructions editPickupPerson tip cancel help enableTip{...orderActionFragment}enableEdit{...orderActionFragment}viewCancellationDetails{...cancellationDetailsActionFragment}enableInHome{...orderActionFragment}createGiftReceipt}cutOffTimestamp isEditSubstitutionsEligible isInHome giftDetails{...GiftDetailsFragment}donationDetails{...orderDonationDetails}}fragment returnInfoFragment on ReturnInfo{returnOrderId type refundPriceDetails{__typename...refundPriceDetailsFragment}refundMessage tierRefundMessage paymentMethods{__typename description cardType paymentType displayValues message{...textFragment}}actions{__typename generate scheduleOrModifyPickup{text url}reschedulePickup editPickupContact}shippingLabelUrl qrCodeImageUrl carriers{__typename id name}pickupCarrier pickupContact{nameAndAddress{fullName firstName lastName address{addressString city state postalCode addressLineOne addressLineTwo country}}phone}pickupConfirmationNumber bannerMessage{...textFragment}}fragment refundPriceDetailsFragment on RefundPriceDetails{subTotal{__typename...orderPriceDetailRowFragment}fees{__typename...orderPriceDetailRowFragment}discounts{__typename...orderPriceDetailRowFragment}taxTotal{__typename...orderPriceDetailRowFragment}grandTotal{__typename...orderPriceDetailRowFragment}}fragment orderPriceDetailRowFragment on OrderPriceDetailRow{label displayValue value info{__typename title message}}fragment addressFragment on OrderAddress{addressString addressLineOne addressLineTwo state postalCode city}fragment ODPPickupInfo on OrderGroup{pickupInstructions pickupPerson{...person}alternatePickupPerson{...person}store{id name address{...addressFragment}}}fragment person on OrderPickupPerson{firstName lastName email}fragment ODPTippingInfo on OrderGroup{addTipMessage{...textFragment}driver{...DriverFragment}tipping{min{...price}max{...price}suggested{...price}preselected}subtotal{...price}}fragment orderActionFragment on Action{text url}fragment orderCustomer on OrderCustomer{id firstName lastName email isGuest isEmailRegistered}fragment OrderFieldsFragment on Order{__typename id version type customer{...orderCustomer}displayId idBarcodeImageUrl(barWidth:3 barHeight:100) isFuelPurchase title shortTitle timezone tippableGroup{...OrderGroupFragment}amendableGroup{id changeSlotIterationsLeft cutOffTimestamp fulfillmentType deliveryAddress{fullName firstName lastName address{addressString addressLineOne addressLineTwo state postalCode city country}}isAmendInProgress}substitutionsBanner{heading subheading longSubheading}groups_2101{__typename...OrderGroupFragment...ODPGroupFragment...ODPPickupInfo...ODPTippingInfo}multiboxBundles{...orderLineItem}itemCancelReasons{__typename...cancelReason}groupCancelReasons{__typename...cancelReason}priceDetails{__typename subTotal{__typename...priceDetailFragment}taxTotal{__typename...priceDetailFragment}grandTotal{__typename...priceDetailFragment}authorizationAmount{__typename...priceDetailFragment}fees{__typename...priceDetailFragment}discounts{__typename...priceDetailFragment}minimumThreshold{__typename...price}belowMinimumFee{__typename...priceDetailFragment}driverTip{__typename...priceDetailFragment}donations{__typename...priceDetailFragment}}paymentMethods{__typename description cardType paymentType displayValues message{...textFragment}actions{connectToCapitalOne{...orderActionFragment}visitAffirm{...orderActionFragment}}}actions{__typename return pendingReturn cancel startReturn{...orderActionFragment}reorder}banners{...textFragment}}","variables":{"orderId":"3362216909653","emailAddress":"brendajky@hotmail.com"}}' \
  --compressed`
 
  if [[ $curl18 =~ "blocked" ]]; then
    link18=`echo $curl18 | jq '.redirectUrl' | sed 's/"//g'`
    `open -n -a /Applications/Microsoft\ Edge.app --args --profile-directory=Default https://walmart.com$link18`
    read -n 1 -p "blocked"
  else
    break
  fi
done

if [[ $curl18 =~ "error" ]]; then
    echo "18-Sai info"
    echo "'3362216909653" >> track-OrderID.txt
    echo "brendajky@hotmail.com" >> track-email.txt
    echo "Sai info" >> track-usItemId.txt
    echo "Sai info" >> track-priceValue.txt
    echo "Sai info" >> track-fullName.txt
    echo "Sai info" >> track-address.txt
    echo "Sai info" >> track-status.txt
    echo "Sai info" >> track-number.txt
    echo "Sai info" >> track-url.txt
    echo "Sai info" >> track-categoriesType.txt
else
    sum18=`md5 track-OrderID.txt`
    for (( i=0; i<=4; i++ ))
    do
        for (( j=0; j<=4; j++))
        do
            if [[ `echo $curl18 | jq '.data.guestOrder.groups_2101['${i[@]}'].items['${j[@]}'].productInfo.usItemId'` == '"924227821"' ]]; then
                echo "'3362216909653" >> track-OrderID.txt
                echo brendajky@hotmail.com >> track-email.txt
                echo $curl18 | jq '.data.guestOrder.groups_2101['${i[@]}'].items['${j[@]}'].productInfo.usItemId' >> track-usItemId.txt
                echo $curl18 | jq '.data.guestOrder.groups_2101['${i[@]}'].items['${j[@]}'].priceInfo.linePrice.value' >> track-priceValue.txt
                echo $curl18 | jq '.data.guestOrder.groups_2101['${i[@]}'].deliveryAddress.fullName' >> track-fullName.txt
                echo $curl18 | jq '.data.guestOrder.groups_2101['${i[@]}'].deliveryAddress.address.addressString' >> track-address.txt
                echo $curl18 | jq '.data.guestOrder.groups_2101['${i[@]}'].status.message.parts[].text' >> track-status.txt
                echo $curl18 | jq '.data.guestOrder.groups_2101['${i[@]}'].shipment.trackingNumber' | sed 's/null//g' >> track-number.txt
                echo $curl18 | jq '.data.guestOrder.groups_2101['${i[@]}'].shipment.trackingUrl' | sed 's/null//g' >> track-url.txt
                echo $curl18 | jq '.data.guestOrder.groups_2101['${i[@]}'].categories[].type' >> track-categoriesType.txt

                break
            fi
        done
    done
    if [[ $sum18 == `md5 track-OrderID.txt` ]]; then
        echo "18-Khác Item"
        echo "'3362216909653" >> track-OrderID.txt
        echo "brendajky@hotmail.com" >> track-email.txt
        echo "Khác Item" >> track-usItemId.txt
        echo "Khác Item" >> track-priceValue.txt
        echo "Khác Item" >> track-fullName.txt
        echo "Khác Item" >> track-address.txt
        echo "Khác Item" >> track-status.txt
        echo "Khác Item" >> track-number.txt
        echo "Khác Item" >> track-url.txt
        echo "Khác Item" >> track-categoriesType.txt
    else
        echo "18"
    fi   
fi
while true
do
curl19=`curl -s 'https://www.walmart.com/orchestra/home/graphql' \
  -H 'authority: www.walmart.com' \
  -H 'sec-ch-ua: " Not;A Brand";v="99", "Microsoft Edge";v="97", "Chromium";v="97"' \
  -H 'x-o-platform: rweb' \
  -H 'dnt: 1' \
  -H 'x-o-correlation-id: pn9BnlEx0zDiyvRGJ6nL5BS9pDN7erB017Nf' \
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
  -H 'user-agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.51 Safari/537.36 Edg/99.0.1150.36' \
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
  --data-raw $'{"query":"query getGuestOrder($orderId:ID\u0021 $emailAddress:String\u0021){guestOrder(input:{id:$orderId emailAddress:$emailAddress}){...OrderFieldsFragment}}fragment cancelReason on OrderCancelReason{__typename subReasonCode subDescription}fragment priceDetailFragment on OrderPriceDetailRow{label value displayValue info{title message}rowInfo{...orderPriceDetailRowInfo}}fragment orderPriceDetailRowInfo on OrderPriceDetailRowInfo{title message{...textFragment}}fragment price on Price{displayValue value}fragment variants on MapEntry{name value}fragment OrderAddOn on OrderAddOn{lineId uniqueLineId productInfo{name usItemId offerId}quantityString quantityLabel type fulfillmentInstructions{...textFragment}actions{manageProtectionPlan{...orderActionFragment}cancel}priceInfo{linePrice{...price}}quantity isActive}fragment orderDonationDetails on OrderDonationDetails{message{...textFragment}emailReceipt emailReceiptToken status{...textFragment}errorStatus}fragment orderLineItem on OrderLineItem{id uniqueId actions{contactSeller cancel addToCart configureCake reviewItem resendEGiftCardToken protectionPlan{...orderActionFragment}manageProtectionPlan{...orderActionFragment}}isGift digitalDeliveryMessage quantity quantityString quantityLabel isSubstitutionSelected fulfilledItems{id quantityString priceInfo{itemPrice{value}}productInfo{usItemId name}}isReturnable returnEligibilityMessage productInfo{name usItemId imageInfo{thumbnailUrl}canonicalUrl offerId orderLimit orderMinLimit weightIncrement salesUnit salesUnitType isSubstitutionEligible isAlcohol}reshop{reshopMessage isShippingAvailable minPromiseDate maxPromiseDate}selectedVariants{...variants}variantAdditionalInfo{parts{text nativeAction}}priceInfo{priceDisplayCodes{showItemPrice priceDisplayCondition finalCostByWeight}itemPrice{...price}linePrice{...price}unitPrice{...price}preDiscountedLinePrice{...price}additionalLines{name value}}discounts{label labelText{...textFragment}}itemReviewed activationCodes{label code}protectionPlanMessage{...textFragment}showSeller isShippedByWalmart seller{id name isPro}digitalDeliveryPhoneNumber addOns{...OrderAddOn}multiboxBundleId}fragment DriverFragment on Driver{id firstName photoUrl}fragment OrderGroupFragment on OrderGroup{driver{...DriverFragment}deliveryDate fulfillmentType status{...OrderGroupStatusFragment}showSeller isShippedByWalmart seller{...SellerFragment}id itemCount items{...LiteLineItemFragment}pickupPerson{firstName lastName email}accessPointId shipment{...ShipmentFragment}returnEligibilityMessage actions{...OrderGroupActionsFragment}recipientEmailAddress digitalDelivery{...DigitalDeliveryFragment}tireInstallationReservation{status extraText reservationId}}fragment OrderGroupStatusFragment on OrderGroupStatus{statusType showStatusTracker statusTracker{status label isCurrent}message{...textFragment}subtext subMessage{...textFragment}notice helpCenterText{...textFragment}}fragment textFragment on Text{parts{bold url text nativeAction lineBreak}}fragment LiteLineItemFragment on OrderLineItem{id quantity productInfo{name usItemId imageInfo{thumbnailUrl}offerId isAlcohol}priceInfo{linePrice{...price}}}fragment SellerFragment on GroupSeller{id name isPro}fragment DigitalDeliveryFragment on DigitalDelivery{title name instructions{...textFragment}}fragment ShipmentFragment on Shipment{id trackingNumber isExternalTracking trackingUrl proofOfDelivery{...ProofOfDeliveryFragment}}fragment OrderGroupActionsFragment on OrderGroupActions{reorder edit track changeSlot checkin editDeliveryInstructions editPickupPerson editTip tip rateDriver cancel enableTip{...orderActionFragment}enableEdit{...orderActionFragment}rescheduleTireInstall{...orderActionFragment}cancelTireInstall{...orderActionFragment}help viewCancellationDetails{...cancellationDetailsActionFragment}}fragment cancellationDetailsActionFragment on CancellationDetailsAction{label heading text{...textFragment}}fragment ProofOfDeliveryFragment on ProofOfDelivery{photoUrl photoPreviewUrl showPreview}fragment DeliveryInstructionsFragment on DeliveryInstructions{text type typeText}fragment GiftDetailsFragment on GiftDetails{recipientAddress{fullName}recipientEmail senderName giftMessage}fragment SubstitutionAction on SubstitutionAction{message label type}fragment ODPGroupCategoryFragment on OrderCategory{type name subtext returnMessage substitutionsBanner{...textFragment}showExtendedSubstitutions actions{substitutions{...SubstitutionAction}nilPickReshop{message action{text url}}returnDetails viewCancellationDetails{...cancellationDetailsActionFragment}trackOnInHomeApp}banner{...textFragment}accordionState items{...orderLineItem}substitutions{...orderLineItem fulfilledItems{...orderLineItem}}returnInfo{...returnInfoFragment}}fragment ODPGroupFragment on OrderGroup{id fulfillmentType deliveryMessage deliveryAddress{fullName firstName lastName address{...addressFragment}}deliveryInstructions{...DeliveryInstructionsFragment}deliveryPreferences{text{...textFragment}cta{...orderActionFragment}}editSubstitutionsCutOff status{statusType showStatusTracker message{...textFragment}notice helpCenterText{...textFragment}}itemCount isCategorized categories{...ODPGroupCategoryFragment}seller{id name isPro}shipment{id trackingNumber}actions{reorder edit track changeSlot checkin editDeliveryInstructions editPickupPerson tip cancel help enableTip{...orderActionFragment}enableEdit{...orderActionFragment}viewCancellationDetails{...cancellationDetailsActionFragment}enableInHome{...orderActionFragment}createGiftReceipt}cutOffTimestamp isEditSubstitutionsEligible isInHome giftDetails{...GiftDetailsFragment}donationDetails{...orderDonationDetails}}fragment returnInfoFragment on ReturnInfo{returnOrderId type refundPriceDetails{__typename...refundPriceDetailsFragment}refundMessage tierRefundMessage paymentMethods{__typename description cardType paymentType displayValues message{...textFragment}}actions{__typename generate scheduleOrModifyPickup{text url}reschedulePickup editPickupContact}shippingLabelUrl qrCodeImageUrl carriers{__typename id name}pickupCarrier pickupContact{nameAndAddress{fullName firstName lastName address{addressString city state postalCode addressLineOne addressLineTwo country}}phone}pickupConfirmationNumber bannerMessage{...textFragment}}fragment refundPriceDetailsFragment on RefundPriceDetails{subTotal{__typename...orderPriceDetailRowFragment}fees{__typename...orderPriceDetailRowFragment}discounts{__typename...orderPriceDetailRowFragment}taxTotal{__typename...orderPriceDetailRowFragment}grandTotal{__typename...orderPriceDetailRowFragment}}fragment orderPriceDetailRowFragment on OrderPriceDetailRow{label displayValue value info{__typename title message}}fragment addressFragment on OrderAddress{addressString addressLineOne addressLineTwo state postalCode city}fragment ODPPickupInfo on OrderGroup{pickupInstructions pickupPerson{...person}alternatePickupPerson{...person}store{id name address{...addressFragment}}}fragment person on OrderPickupPerson{firstName lastName email}fragment ODPTippingInfo on OrderGroup{addTipMessage{...textFragment}driver{...DriverFragment}tipping{min{...price}max{...price}suggested{...price}preselected}subtotal{...price}}fragment orderActionFragment on Action{text url}fragment orderCustomer on OrderCustomer{id firstName lastName email isGuest isEmailRegistered}fragment OrderFieldsFragment on Order{__typename id version type customer{...orderCustomer}displayId idBarcodeImageUrl(barWidth:3 barHeight:100) isFuelPurchase title shortTitle timezone tippableGroup{...OrderGroupFragment}amendableGroup{id changeSlotIterationsLeft cutOffTimestamp fulfillmentType deliveryAddress{fullName firstName lastName address{addressString addressLineOne addressLineTwo state postalCode city country}}isAmendInProgress}substitutionsBanner{heading subheading longSubheading}groups_2101{__typename...OrderGroupFragment...ODPGroupFragment...ODPPickupInfo...ODPTippingInfo}multiboxBundles{...orderLineItem}itemCancelReasons{__typename...cancelReason}groupCancelReasons{__typename...cancelReason}priceDetails{__typename subTotal{__typename...priceDetailFragment}taxTotal{__typename...priceDetailFragment}grandTotal{__typename...priceDetailFragment}authorizationAmount{__typename...priceDetailFragment}fees{__typename...priceDetailFragment}discounts{__typename...priceDetailFragment}minimumThreshold{__typename...price}belowMinimumFee{__typename...priceDetailFragment}driverTip{__typename...priceDetailFragment}donations{__typename...priceDetailFragment}}paymentMethods{__typename description cardType paymentType displayValues message{...textFragment}actions{connectToCapitalOne{...orderActionFragment}visitAffirm{...orderActionFragment}}}actions{__typename return pendingReturn cancel startReturn{...orderActionFragment}reorder}banners{...textFragment}}","variables":{"orderId":"3392221561586","emailAddress":"jeffreyhill70@gmail.com"}}' \
  --compressed`
 
  if [[ $curl19 =~ "blocked" ]]; then
    link19=`echo $curl19 | jq '.redirectUrl' | sed 's/"//g'`
    `open -n -a /Applications/Microsoft\ Edge.app --args --profile-directory=Default https://walmart.com$link19`
    read -n 1 -p "blocked"
  else
    break
  fi
done

if [[ $curl19 =~ "error" ]]; then
    echo "19-Sai info"
    echo "'3392221561586" >> track-OrderID.txt
    echo "jeffreyhill70@gmail.com" >> track-email.txt
    echo "Sai info" >> track-usItemId.txt
    echo "Sai info" >> track-priceValue.txt
    echo "Sai info" >> track-fullName.txt
    echo "Sai info" >> track-address.txt
    echo "Sai info" >> track-status.txt
    echo "Sai info" >> track-number.txt
    echo "Sai info" >> track-url.txt
    echo "Sai info" >> track-categoriesType.txt
else
    sum19=`md5 track-OrderID.txt`
    for (( i=0; i<=4; i++ ))
    do
        for (( j=0; j<=4; j++))
        do
            if [[ `echo $curl19 | jq '.data.guestOrder.groups_2101['${i[@]}'].items['${j[@]}'].productInfo.usItemId'` == '"924227821"' ]]; then
                echo "'3392221561586" >> track-OrderID.txt
                echo jeffreyhill70@gmail.com >> track-email.txt
                echo $curl19 | jq '.data.guestOrder.groups_2101['${i[@]}'].items['${j[@]}'].productInfo.usItemId' >> track-usItemId.txt
                echo $curl19 | jq '.data.guestOrder.groups_2101['${i[@]}'].items['${j[@]}'].priceInfo.linePrice.value' >> track-priceValue.txt
                echo $curl19 | jq '.data.guestOrder.groups_2101['${i[@]}'].deliveryAddress.fullName' >> track-fullName.txt
                echo $curl19 | jq '.data.guestOrder.groups_2101['${i[@]}'].deliveryAddress.address.addressString' >> track-address.txt
                echo $curl19 | jq '.data.guestOrder.groups_2101['${i[@]}'].status.message.parts[].text' >> track-status.txt
                echo $curl19 | jq '.data.guestOrder.groups_2101['${i[@]}'].shipment.trackingNumber' | sed 's/null//g' >> track-number.txt
                echo $curl19 | jq '.data.guestOrder.groups_2101['${i[@]}'].shipment.trackingUrl' | sed 's/null//g' >> track-url.txt
                echo $curl19 | jq '.data.guestOrder.groups_2101['${i[@]}'].categories[].type' >> track-categoriesType.txt

                break
            fi
        done
    done
    if [[ $sum19 == `md5 track-OrderID.txt` ]]; then
        echo "19-Khác Item"
        echo "'3392221561586" >> track-OrderID.txt
        echo "jeffreyhill70@gmail.com" >> track-email.txt
        echo "Khác Item" >> track-usItemId.txt
        echo "Khác Item" >> track-priceValue.txt
        echo "Khác Item" >> track-fullName.txt
        echo "Khác Item" >> track-address.txt
        echo "Khác Item" >> track-status.txt
        echo "Khác Item" >> track-number.txt
        echo "Khác Item" >> track-url.txt
        echo "Khác Item" >> track-categoriesType.txt
    else
        echo "19"
    fi   
fi
while true
do
curl20=`curl -s 'https://www.walmart.com/orchestra/home/graphql' \
  -H 'authority: www.walmart.com' \
  -H 'sec-ch-ua: " Not;A Brand";v="99", "Microsoft Edge";v="97", "Chromium";v="97"' \
  -H 'x-o-platform: rweb' \
  -H 'dnt: 1' \
  -H 'x-o-correlation-id: pn9BnlEx0zDiyvRGJ6nL5BS9pDN7erB017Nf' \
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
  -H 'user-agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.51 Safari/537.36 Edg/99.0.1150.36' \
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
  --data-raw $'{"query":"query getGuestOrder($orderId:ID\u0021 $emailAddress:String\u0021){guestOrder(input:{id:$orderId emailAddress:$emailAddress}){...OrderFieldsFragment}}fragment cancelReason on OrderCancelReason{__typename subReasonCode subDescription}fragment priceDetailFragment on OrderPriceDetailRow{label value displayValue info{title message}rowInfo{...orderPriceDetailRowInfo}}fragment orderPriceDetailRowInfo on OrderPriceDetailRowInfo{title message{...textFragment}}fragment price on Price{displayValue value}fragment variants on MapEntry{name value}fragment OrderAddOn on OrderAddOn{lineId uniqueLineId productInfo{name usItemId offerId}quantityString quantityLabel type fulfillmentInstructions{...textFragment}actions{manageProtectionPlan{...orderActionFragment}cancel}priceInfo{linePrice{...price}}quantity isActive}fragment orderDonationDetails on OrderDonationDetails{message{...textFragment}emailReceipt emailReceiptToken status{...textFragment}errorStatus}fragment orderLineItem on OrderLineItem{id uniqueId actions{contactSeller cancel addToCart configureCake reviewItem resendEGiftCardToken protectionPlan{...orderActionFragment}manageProtectionPlan{...orderActionFragment}}isGift digitalDeliveryMessage quantity quantityString quantityLabel isSubstitutionSelected fulfilledItems{id quantityString priceInfo{itemPrice{value}}productInfo{usItemId name}}isReturnable returnEligibilityMessage productInfo{name usItemId imageInfo{thumbnailUrl}canonicalUrl offerId orderLimit orderMinLimit weightIncrement salesUnit salesUnitType isSubstitutionEligible isAlcohol}reshop{reshopMessage isShippingAvailable minPromiseDate maxPromiseDate}selectedVariants{...variants}variantAdditionalInfo{parts{text nativeAction}}priceInfo{priceDisplayCodes{showItemPrice priceDisplayCondition finalCostByWeight}itemPrice{...price}linePrice{...price}unitPrice{...price}preDiscountedLinePrice{...price}additionalLines{name value}}discounts{label labelText{...textFragment}}itemReviewed activationCodes{label code}protectionPlanMessage{...textFragment}showSeller isShippedByWalmart seller{id name isPro}digitalDeliveryPhoneNumber addOns{...OrderAddOn}multiboxBundleId}fragment DriverFragment on Driver{id firstName photoUrl}fragment OrderGroupFragment on OrderGroup{driver{...DriverFragment}deliveryDate fulfillmentType status{...OrderGroupStatusFragment}showSeller isShippedByWalmart seller{...SellerFragment}id itemCount items{...LiteLineItemFragment}pickupPerson{firstName lastName email}accessPointId shipment{...ShipmentFragment}returnEligibilityMessage actions{...OrderGroupActionsFragment}recipientEmailAddress digitalDelivery{...DigitalDeliveryFragment}tireInstallationReservation{status extraText reservationId}}fragment OrderGroupStatusFragment on OrderGroupStatus{statusType showStatusTracker statusTracker{status label isCurrent}message{...textFragment}subtext subMessage{...textFragment}notice helpCenterText{...textFragment}}fragment textFragment on Text{parts{bold url text nativeAction lineBreak}}fragment LiteLineItemFragment on OrderLineItem{id quantity productInfo{name usItemId imageInfo{thumbnailUrl}offerId isAlcohol}priceInfo{linePrice{...price}}}fragment SellerFragment on GroupSeller{id name isPro}fragment DigitalDeliveryFragment on DigitalDelivery{title name instructions{...textFragment}}fragment ShipmentFragment on Shipment{id trackingNumber isExternalTracking trackingUrl proofOfDelivery{...ProofOfDeliveryFragment}}fragment OrderGroupActionsFragment on OrderGroupActions{reorder edit track changeSlot checkin editDeliveryInstructions editPickupPerson editTip tip rateDriver cancel enableTip{...orderActionFragment}enableEdit{...orderActionFragment}rescheduleTireInstall{...orderActionFragment}cancelTireInstall{...orderActionFragment}help viewCancellationDetails{...cancellationDetailsActionFragment}}fragment cancellationDetailsActionFragment on CancellationDetailsAction{label heading text{...textFragment}}fragment ProofOfDeliveryFragment on ProofOfDelivery{photoUrl photoPreviewUrl showPreview}fragment DeliveryInstructionsFragment on DeliveryInstructions{text type typeText}fragment GiftDetailsFragment on GiftDetails{recipientAddress{fullName}recipientEmail senderName giftMessage}fragment SubstitutionAction on SubstitutionAction{message label type}fragment ODPGroupCategoryFragment on OrderCategory{type name subtext returnMessage substitutionsBanner{...textFragment}showExtendedSubstitutions actions{substitutions{...SubstitutionAction}nilPickReshop{message action{text url}}returnDetails viewCancellationDetails{...cancellationDetailsActionFragment}trackOnInHomeApp}banner{...textFragment}accordionState items{...orderLineItem}substitutions{...orderLineItem fulfilledItems{...orderLineItem}}returnInfo{...returnInfoFragment}}fragment ODPGroupFragment on OrderGroup{id fulfillmentType deliveryMessage deliveryAddress{fullName firstName lastName address{...addressFragment}}deliveryInstructions{...DeliveryInstructionsFragment}deliveryPreferences{text{...textFragment}cta{...orderActionFragment}}editSubstitutionsCutOff status{statusType showStatusTracker message{...textFragment}notice helpCenterText{...textFragment}}itemCount isCategorized categories{...ODPGroupCategoryFragment}seller{id name isPro}shipment{id trackingNumber}actions{reorder edit track changeSlot checkin editDeliveryInstructions editPickupPerson tip cancel help enableTip{...orderActionFragment}enableEdit{...orderActionFragment}viewCancellationDetails{...cancellationDetailsActionFragment}enableInHome{...orderActionFragment}createGiftReceipt}cutOffTimestamp isEditSubstitutionsEligible isInHome giftDetails{...GiftDetailsFragment}donationDetails{...orderDonationDetails}}fragment returnInfoFragment on ReturnInfo{returnOrderId type refundPriceDetails{__typename...refundPriceDetailsFragment}refundMessage tierRefundMessage paymentMethods{__typename description cardType paymentType displayValues message{...textFragment}}actions{__typename generate scheduleOrModifyPickup{text url}reschedulePickup editPickupContact}shippingLabelUrl qrCodeImageUrl carriers{__typename id name}pickupCarrier pickupContact{nameAndAddress{fullName firstName lastName address{addressString city state postalCode addressLineOne addressLineTwo country}}phone}pickupConfirmationNumber bannerMessage{...textFragment}}fragment refundPriceDetailsFragment on RefundPriceDetails{subTotal{__typename...orderPriceDetailRowFragment}fees{__typename...orderPriceDetailRowFragment}discounts{__typename...orderPriceDetailRowFragment}taxTotal{__typename...orderPriceDetailRowFragment}grandTotal{__typename...orderPriceDetailRowFragment}}fragment orderPriceDetailRowFragment on OrderPriceDetailRow{label displayValue value info{__typename title message}}fragment addressFragment on OrderAddress{addressString addressLineOne addressLineTwo state postalCode city}fragment ODPPickupInfo on OrderGroup{pickupInstructions pickupPerson{...person}alternatePickupPerson{...person}store{id name address{...addressFragment}}}fragment person on OrderPickupPerson{firstName lastName email}fragment ODPTippingInfo on OrderGroup{addTipMessage{...textFragment}driver{...DriverFragment}tipping{min{...price}max{...price}suggested{...price}preselected}subtotal{...price}}fragment orderActionFragment on Action{text url}fragment orderCustomer on OrderCustomer{id firstName lastName email isGuest isEmailRegistered}fragment OrderFieldsFragment on Order{__typename id version type customer{...orderCustomer}displayId idBarcodeImageUrl(barWidth:3 barHeight:100) isFuelPurchase title shortTitle timezone tippableGroup{...OrderGroupFragment}amendableGroup{id changeSlotIterationsLeft cutOffTimestamp fulfillmentType deliveryAddress{fullName firstName lastName address{addressString addressLineOne addressLineTwo state postalCode city country}}isAmendInProgress}substitutionsBanner{heading subheading longSubheading}groups_2101{__typename...OrderGroupFragment...ODPGroupFragment...ODPPickupInfo...ODPTippingInfo}multiboxBundles{...orderLineItem}itemCancelReasons{__typename...cancelReason}groupCancelReasons{__typename...cancelReason}priceDetails{__typename subTotal{__typename...priceDetailFragment}taxTotal{__typename...priceDetailFragment}grandTotal{__typename...priceDetailFragment}authorizationAmount{__typename...priceDetailFragment}fees{__typename...priceDetailFragment}discounts{__typename...priceDetailFragment}minimumThreshold{__typename...price}belowMinimumFee{__typename...priceDetailFragment}driverTip{__typename...priceDetailFragment}donations{__typename...priceDetailFragment}}paymentMethods{__typename description cardType paymentType displayValues message{...textFragment}actions{connectToCapitalOne{...orderActionFragment}visitAffirm{...orderActionFragment}}}actions{__typename return pendingReturn cancel startReturn{...orderActionFragment}reorder}banners{...textFragment}}","variables":{"orderId":"3382219493856","emailAddress":"sarethaheadley@gmail.com"}}' \
  --compressed`
 
  if [[ $curl20 =~ "blocked" ]]; then
    link20=`echo $curl20 | jq '.redirectUrl' | sed 's/"//g'`
    `open -n -a /Applications/Microsoft\ Edge.app --args --profile-directory=Default https://walmart.com$link20`
    read -n 1 -p "blocked"
  else
    break
  fi
done

if [[ $curl20 =~ "error" ]]; then
    echo "20-Sai info"
    echo "'3382219493856" >> track-OrderID.txt
    echo "sarethaheadley@gmail.com" >> track-email.txt
    echo "Sai info" >> track-usItemId.txt
    echo "Sai info" >> track-priceValue.txt
    echo "Sai info" >> track-fullName.txt
    echo "Sai info" >> track-address.txt
    echo "Sai info" >> track-status.txt
    echo "Sai info" >> track-number.txt
    echo "Sai info" >> track-url.txt
    echo "Sai info" >> track-categoriesType.txt
else
    sum20=`md5 track-OrderID.txt`
    for (( i=0; i<=4; i++ ))
    do
        for (( j=0; j<=4; j++))
        do
            if [[ `echo $curl20 | jq '.data.guestOrder.groups_2101['${i[@]}'].items['${j[@]}'].productInfo.usItemId'` == '"3084"' ]]; then
                echo "'3382219493856" >> track-OrderID.txt
                echo sarethaheadley@gmail.com >> track-email.txt
                echo $curl20 | jq '.data.guestOrder.groups_2101['${i[@]}'].items['${j[@]}'].productInfo.usItemId' >> track-usItemId.txt
                echo $curl20 | jq '.data.guestOrder.groups_2101['${i[@]}'].items['${j[@]}'].priceInfo.linePrice.value' >> track-priceValue.txt
                echo $curl20 | jq '.data.guestOrder.groups_2101['${i[@]}'].deliveryAddress.fullName' >> track-fullName.txt
                echo $curl20 | jq '.data.guestOrder.groups_2101['${i[@]}'].deliveryAddress.address.addressString' >> track-address.txt
                echo $curl20 | jq '.data.guestOrder.groups_2101['${i[@]}'].status.message.parts[].text' >> track-status.txt
                echo $curl20 | jq '.data.guestOrder.groups_2101['${i[@]}'].shipment.trackingNumber' | sed 's/null//g' >> track-number.txt
                echo $curl20 | jq '.data.guestOrder.groups_2101['${i[@]}'].shipment.trackingUrl' | sed 's/null//g' >> track-url.txt
                echo $curl20 | jq '.data.guestOrder.groups_2101['${i[@]}'].categories[].type' >> track-categoriesType.txt

                break
            fi
        done
    done
    if [[ $sum20 == `md5 track-OrderID.txt` ]]; then
        echo "20-Khác Item"
        echo "'3382219493856" >> track-OrderID.txt
        echo "sarethaheadley@gmail.com" >> track-email.txt
        echo "Khác Item" >> track-usItemId.txt
        echo "Khác Item" >> track-priceValue.txt
        echo "Khác Item" >> track-fullName.txt
        echo "Khác Item" >> track-address.txt
        echo "Khác Item" >> track-status.txt
        echo "Khác Item" >> track-number.txt
        echo "Khác Item" >> track-url.txt
        echo "Khác Item" >> track-categoriesType.txt
    else
        echo "20"
    fi   
fi
while true
do
curl21=`curl -s 'https://www.walmart.com/orchestra/home/graphql' \
  -H 'authority: www.walmart.com' \
  -H 'sec-ch-ua: " Not;A Brand";v="99", "Microsoft Edge";v="97", "Chromium";v="97"' \
  -H 'x-o-platform: rweb' \
  -H 'dnt: 1' \
  -H 'x-o-correlation-id: pn9BnlEx0zDiyvRGJ6nL5BS9pDN7erB017Nf' \
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
  -H 'user-agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.51 Safari/537.36 Edg/99.0.1150.36' \
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
  --data-raw $'{"query":"query getGuestOrder($orderId:ID\u0021 $emailAddress:String\u0021){guestOrder(input:{id:$orderId emailAddress:$emailAddress}){...OrderFieldsFragment}}fragment cancelReason on OrderCancelReason{__typename subReasonCode subDescription}fragment priceDetailFragment on OrderPriceDetailRow{label value displayValue info{title message}rowInfo{...orderPriceDetailRowInfo}}fragment orderPriceDetailRowInfo on OrderPriceDetailRowInfo{title message{...textFragment}}fragment price on Price{displayValue value}fragment variants on MapEntry{name value}fragment OrderAddOn on OrderAddOn{lineId uniqueLineId productInfo{name usItemId offerId}quantityString quantityLabel type fulfillmentInstructions{...textFragment}actions{manageProtectionPlan{...orderActionFragment}cancel}priceInfo{linePrice{...price}}quantity isActive}fragment orderDonationDetails on OrderDonationDetails{message{...textFragment}emailReceipt emailReceiptToken status{...textFragment}errorStatus}fragment orderLineItem on OrderLineItem{id uniqueId actions{contactSeller cancel addToCart configureCake reviewItem resendEGiftCardToken protectionPlan{...orderActionFragment}manageProtectionPlan{...orderActionFragment}}isGift digitalDeliveryMessage quantity quantityString quantityLabel isSubstitutionSelected fulfilledItems{id quantityString priceInfo{itemPrice{value}}productInfo{usItemId name}}isReturnable returnEligibilityMessage productInfo{name usItemId imageInfo{thumbnailUrl}canonicalUrl offerId orderLimit orderMinLimit weightIncrement salesUnit salesUnitType isSubstitutionEligible isAlcohol}reshop{reshopMessage isShippingAvailable minPromiseDate maxPromiseDate}selectedVariants{...variants}variantAdditionalInfo{parts{text nativeAction}}priceInfo{priceDisplayCodes{showItemPrice priceDisplayCondition finalCostByWeight}itemPrice{...price}linePrice{...price}unitPrice{...price}preDiscountedLinePrice{...price}additionalLines{name value}}discounts{label labelText{...textFragment}}itemReviewed activationCodes{label code}protectionPlanMessage{...textFragment}showSeller isShippedByWalmart seller{id name isPro}digitalDeliveryPhoneNumber addOns{...OrderAddOn}multiboxBundleId}fragment DriverFragment on Driver{id firstName photoUrl}fragment OrderGroupFragment on OrderGroup{driver{...DriverFragment}deliveryDate fulfillmentType status{...OrderGroupStatusFragment}showSeller isShippedByWalmart seller{...SellerFragment}id itemCount items{...LiteLineItemFragment}pickupPerson{firstName lastName email}accessPointId shipment{...ShipmentFragment}returnEligibilityMessage actions{...OrderGroupActionsFragment}recipientEmailAddress digitalDelivery{...DigitalDeliveryFragment}tireInstallationReservation{status extraText reservationId}}fragment OrderGroupStatusFragment on OrderGroupStatus{statusType showStatusTracker statusTracker{status label isCurrent}message{...textFragment}subtext subMessage{...textFragment}notice helpCenterText{...textFragment}}fragment textFragment on Text{parts{bold url text nativeAction lineBreak}}fragment LiteLineItemFragment on OrderLineItem{id quantity productInfo{name usItemId imageInfo{thumbnailUrl}offerId isAlcohol}priceInfo{linePrice{...price}}}fragment SellerFragment on GroupSeller{id name isPro}fragment DigitalDeliveryFragment on DigitalDelivery{title name instructions{...textFragment}}fragment ShipmentFragment on Shipment{id trackingNumber isExternalTracking trackingUrl proofOfDelivery{...ProofOfDeliveryFragment}}fragment OrderGroupActionsFragment on OrderGroupActions{reorder edit track changeSlot checkin editDeliveryInstructions editPickupPerson editTip tip rateDriver cancel enableTip{...orderActionFragment}enableEdit{...orderActionFragment}rescheduleTireInstall{...orderActionFragment}cancelTireInstall{...orderActionFragment}help viewCancellationDetails{...cancellationDetailsActionFragment}}fragment cancellationDetailsActionFragment on CancellationDetailsAction{label heading text{...textFragment}}fragment ProofOfDeliveryFragment on ProofOfDelivery{photoUrl photoPreviewUrl showPreview}fragment DeliveryInstructionsFragment on DeliveryInstructions{text type typeText}fragment GiftDetailsFragment on GiftDetails{recipientAddress{fullName}recipientEmail senderName giftMessage}fragment SubstitutionAction on SubstitutionAction{message label type}fragment ODPGroupCategoryFragment on OrderCategory{type name subtext returnMessage substitutionsBanner{...textFragment}showExtendedSubstitutions actions{substitutions{...SubstitutionAction}nilPickReshop{message action{text url}}returnDetails viewCancellationDetails{...cancellationDetailsActionFragment}trackOnInHomeApp}banner{...textFragment}accordionState items{...orderLineItem}substitutions{...orderLineItem fulfilledItems{...orderLineItem}}returnInfo{...returnInfoFragment}}fragment ODPGroupFragment on OrderGroup{id fulfillmentType deliveryMessage deliveryAddress{fullName firstName lastName address{...addressFragment}}deliveryInstructions{...DeliveryInstructionsFragment}deliveryPreferences{text{...textFragment}cta{...orderActionFragment}}editSubstitutionsCutOff status{statusType showStatusTracker message{...textFragment}notice helpCenterText{...textFragment}}itemCount isCategorized categories{...ODPGroupCategoryFragment}seller{id name isPro}shipment{id trackingNumber}actions{reorder edit track changeSlot checkin editDeliveryInstructions editPickupPerson tip cancel help enableTip{...orderActionFragment}enableEdit{...orderActionFragment}viewCancellationDetails{...cancellationDetailsActionFragment}enableInHome{...orderActionFragment}createGiftReceipt}cutOffTimestamp isEditSubstitutionsEligible isInHome giftDetails{...GiftDetailsFragment}donationDetails{...orderDonationDetails}}fragment returnInfoFragment on ReturnInfo{returnOrderId type refundPriceDetails{__typename...refundPriceDetailsFragment}refundMessage tierRefundMessage paymentMethods{__typename description cardType paymentType displayValues message{...textFragment}}actions{__typename generate scheduleOrModifyPickup{text url}reschedulePickup editPickupContact}shippingLabelUrl qrCodeImageUrl carriers{__typename id name}pickupCarrier pickupContact{nameAndAddress{fullName firstName lastName address{addressString city state postalCode addressLineOne addressLineTwo country}}phone}pickupConfirmationNumber bannerMessage{...textFragment}}fragment refundPriceDetailsFragment on RefundPriceDetails{subTotal{__typename...orderPriceDetailRowFragment}fees{__typename...orderPriceDetailRowFragment}discounts{__typename...orderPriceDetailRowFragment}taxTotal{__typename...orderPriceDetailRowFragment}grandTotal{__typename...orderPriceDetailRowFragment}}fragment orderPriceDetailRowFragment on OrderPriceDetailRow{label displayValue value info{__typename title message}}fragment addressFragment on OrderAddress{addressString addressLineOne addressLineTwo state postalCode city}fragment ODPPickupInfo on OrderGroup{pickupInstructions pickupPerson{...person}alternatePickupPerson{...person}store{id name address{...addressFragment}}}fragment person on OrderPickupPerson{firstName lastName email}fragment ODPTippingInfo on OrderGroup{addTipMessage{...textFragment}driver{...DriverFragment}tipping{min{...price}max{...price}suggested{...price}preselected}subtotal{...price}}fragment orderActionFragment on Action{text url}fragment orderCustomer on OrderCustomer{id firstName lastName email isGuest isEmailRegistered}fragment OrderFieldsFragment on Order{__typename id version type customer{...orderCustomer}displayId idBarcodeImageUrl(barWidth:3 barHeight:100) isFuelPurchase title shortTitle timezone tippableGroup{...OrderGroupFragment}amendableGroup{id changeSlotIterationsLeft cutOffTimestamp fulfillmentType deliveryAddress{fullName firstName lastName address{addressString addressLineOne addressLineTwo state postalCode city country}}isAmendInProgress}substitutionsBanner{heading subheading longSubheading}groups_2101{__typename...OrderGroupFragment...ODPGroupFragment...ODPPickupInfo...ODPTippingInfo}multiboxBundles{...orderLineItem}itemCancelReasons{__typename...cancelReason}groupCancelReasons{__typename...cancelReason}priceDetails{__typename subTotal{__typename...priceDetailFragment}taxTotal{__typename...priceDetailFragment}grandTotal{__typename...priceDetailFragment}authorizationAmount{__typename...priceDetailFragment}fees{__typename...priceDetailFragment}discounts{__typename...priceDetailFragment}minimumThreshold{__typename...price}belowMinimumFee{__typename...priceDetailFragment}driverTip{__typename...priceDetailFragment}donations{__typename...priceDetailFragment}}paymentMethods{__typename description cardType paymentType displayValues message{...textFragment}actions{connectToCapitalOne{...orderActionFragment}visitAffirm{...orderActionFragment}}}actions{__typename return pendingReturn cancel startReturn{...orderActionFragment}reorder}banners{...textFragment}}","variables":{"orderId":"3362216906425","emailAddress":"teresa052909@yahoo.com"}}' \
  --compressed`
 
  if [[ $curl21 =~ "blocked" ]]; then
    link21=`echo $curl21 | jq '.redirectUrl' | sed 's/"//g'`
    `open -n -a /Applications/Microsoft\ Edge.app --args --profile-directory=Default https://walmart.com$link21`
    read -n 1 -p "blocked"
  else
    break
  fi
done

if [[ $curl21 =~ "error" ]]; then
    echo "21-Sai info"
    echo "'3362216906425" >> track-OrderID.txt
    echo "teresa052909@yahoo.com" >> track-email.txt
    echo "Sai info" >> track-usItemId.txt
    echo "Sai info" >> track-priceValue.txt
    echo "Sai info" >> track-fullName.txt
    echo "Sai info" >> track-address.txt
    echo "Sai info" >> track-status.txt
    echo "Sai info" >> track-number.txt
    echo "Sai info" >> track-url.txt
    echo "Sai info" >> track-categoriesType.txt
else
    sum21=`md5 track-OrderID.txt`
    for (( i=0; i<=4; i++ ))
    do
        for (( j=0; j<=4; j++))
        do
            if [[ `echo $curl21 | jq '.data.guestOrder.groups_2101['${i[@]}'].items['${j[@]}'].productInfo.usItemId'` == '"680614474"' ]]; then
                echo "'3362216906425" >> track-OrderID.txt
                echo teresa052909@yahoo.com >> track-email.txt
                echo $curl21 | jq '.data.guestOrder.groups_2101['${i[@]}'].items['${j[@]}'].productInfo.usItemId' >> track-usItemId.txt
                echo $curl21 | jq '.data.guestOrder.groups_2101['${i[@]}'].items['${j[@]}'].priceInfo.linePrice.value' >> track-priceValue.txt
                echo $curl21 | jq '.data.guestOrder.groups_2101['${i[@]}'].deliveryAddress.fullName' >> track-fullName.txt
                echo $curl21 | jq '.data.guestOrder.groups_2101['${i[@]}'].deliveryAddress.address.addressString' >> track-address.txt
                echo $curl21 | jq '.data.guestOrder.groups_2101['${i[@]}'].status.message.parts[].text' >> track-status.txt
                echo $curl21 | jq '.data.guestOrder.groups_2101['${i[@]}'].shipment.trackingNumber' | sed 's/null//g' >> track-number.txt
                echo $curl21 | jq '.data.guestOrder.groups_2101['${i[@]}'].shipment.trackingUrl' | sed 's/null//g' >> track-url.txt
                echo $curl21 | jq '.data.guestOrder.groups_2101['${i[@]}'].categories[].type' >> track-categoriesType.txt

                break
            fi
        done
    done
    if [[ $sum21 == `md5 track-OrderID.txt` ]]; then
        echo "21-Khác Item"
        echo "'3362216906425" >> track-OrderID.txt
        echo "teresa052909@yahoo.com" >> track-email.txt
        echo "Khác Item" >> track-usItemId.txt
        echo "Khác Item" >> track-priceValue.txt
        echo "Khác Item" >> track-fullName.txt
        echo "Khác Item" >> track-address.txt
        echo "Khác Item" >> track-status.txt
        echo "Khác Item" >> track-number.txt
        echo "Khác Item" >> track-url.txt
        echo "Khác Item" >> track-categoriesType.txt
    else
        echo "21"
    fi   
fi
while true
do
curl22=`curl -s 'https://www.walmart.com/orchestra/home/graphql' \
  -H 'authority: www.walmart.com' \
  -H 'sec-ch-ua: " Not;A Brand";v="99", "Microsoft Edge";v="97", "Chromium";v="97"' \
  -H 'x-o-platform: rweb' \
  -H 'dnt: 1' \
  -H 'x-o-correlation-id: pn9BnlEx0zDiyvRGJ6nL5BS9pDN7erB017Nf' \
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
  -H 'user-agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.51 Safari/537.36 Edg/99.0.1150.36' \
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
  --data-raw $'{"query":"query getGuestOrder($orderId:ID\u0021 $emailAddress:String\u0021){guestOrder(input:{id:$orderId emailAddress:$emailAddress}){...OrderFieldsFragment}}fragment cancelReason on OrderCancelReason{__typename subReasonCode subDescription}fragment priceDetailFragment on OrderPriceDetailRow{label value displayValue info{title message}rowInfo{...orderPriceDetailRowInfo}}fragment orderPriceDetailRowInfo on OrderPriceDetailRowInfo{title message{...textFragment}}fragment price on Price{displayValue value}fragment variants on MapEntry{name value}fragment OrderAddOn on OrderAddOn{lineId uniqueLineId productInfo{name usItemId offerId}quantityString quantityLabel type fulfillmentInstructions{...textFragment}actions{manageProtectionPlan{...orderActionFragment}cancel}priceInfo{linePrice{...price}}quantity isActive}fragment orderDonationDetails on OrderDonationDetails{message{...textFragment}emailReceipt emailReceiptToken status{...textFragment}errorStatus}fragment orderLineItem on OrderLineItem{id uniqueId actions{contactSeller cancel addToCart configureCake reviewItem resendEGiftCardToken protectionPlan{...orderActionFragment}manageProtectionPlan{...orderActionFragment}}isGift digitalDeliveryMessage quantity quantityString quantityLabel isSubstitutionSelected fulfilledItems{id quantityString priceInfo{itemPrice{value}}productInfo{usItemId name}}isReturnable returnEligibilityMessage productInfo{name usItemId imageInfo{thumbnailUrl}canonicalUrl offerId orderLimit orderMinLimit weightIncrement salesUnit salesUnitType isSubstitutionEligible isAlcohol}reshop{reshopMessage isShippingAvailable minPromiseDate maxPromiseDate}selectedVariants{...variants}variantAdditionalInfo{parts{text nativeAction}}priceInfo{priceDisplayCodes{showItemPrice priceDisplayCondition finalCostByWeight}itemPrice{...price}linePrice{...price}unitPrice{...price}preDiscountedLinePrice{...price}additionalLines{name value}}discounts{label labelText{...textFragment}}itemReviewed activationCodes{label code}protectionPlanMessage{...textFragment}showSeller isShippedByWalmart seller{id name isPro}digitalDeliveryPhoneNumber addOns{...OrderAddOn}multiboxBundleId}fragment DriverFragment on Driver{id firstName photoUrl}fragment OrderGroupFragment on OrderGroup{driver{...DriverFragment}deliveryDate fulfillmentType status{...OrderGroupStatusFragment}showSeller isShippedByWalmart seller{...SellerFragment}id itemCount items{...LiteLineItemFragment}pickupPerson{firstName lastName email}accessPointId shipment{...ShipmentFragment}returnEligibilityMessage actions{...OrderGroupActionsFragment}recipientEmailAddress digitalDelivery{...DigitalDeliveryFragment}tireInstallationReservation{status extraText reservationId}}fragment OrderGroupStatusFragment on OrderGroupStatus{statusType showStatusTracker statusTracker{status label isCurrent}message{...textFragment}subtext subMessage{...textFragment}notice helpCenterText{...textFragment}}fragment textFragment on Text{parts{bold url text nativeAction lineBreak}}fragment LiteLineItemFragment on OrderLineItem{id quantity productInfo{name usItemId imageInfo{thumbnailUrl}offerId isAlcohol}priceInfo{linePrice{...price}}}fragment SellerFragment on GroupSeller{id name isPro}fragment DigitalDeliveryFragment on DigitalDelivery{title name instructions{...textFragment}}fragment ShipmentFragment on Shipment{id trackingNumber isExternalTracking trackingUrl proofOfDelivery{...ProofOfDeliveryFragment}}fragment OrderGroupActionsFragment on OrderGroupActions{reorder edit track changeSlot checkin editDeliveryInstructions editPickupPerson editTip tip rateDriver cancel enableTip{...orderActionFragment}enableEdit{...orderActionFragment}rescheduleTireInstall{...orderActionFragment}cancelTireInstall{...orderActionFragment}help viewCancellationDetails{...cancellationDetailsActionFragment}}fragment cancellationDetailsActionFragment on CancellationDetailsAction{label heading text{...textFragment}}fragment ProofOfDeliveryFragment on ProofOfDelivery{photoUrl photoPreviewUrl showPreview}fragment DeliveryInstructionsFragment on DeliveryInstructions{text type typeText}fragment GiftDetailsFragment on GiftDetails{recipientAddress{fullName}recipientEmail senderName giftMessage}fragment SubstitutionAction on SubstitutionAction{message label type}fragment ODPGroupCategoryFragment on OrderCategory{type name subtext returnMessage substitutionsBanner{...textFragment}showExtendedSubstitutions actions{substitutions{...SubstitutionAction}nilPickReshop{message action{text url}}returnDetails viewCancellationDetails{...cancellationDetailsActionFragment}trackOnInHomeApp}banner{...textFragment}accordionState items{...orderLineItem}substitutions{...orderLineItem fulfilledItems{...orderLineItem}}returnInfo{...returnInfoFragment}}fragment ODPGroupFragment on OrderGroup{id fulfillmentType deliveryMessage deliveryAddress{fullName firstName lastName address{...addressFragment}}deliveryInstructions{...DeliveryInstructionsFragment}deliveryPreferences{text{...textFragment}cta{...orderActionFragment}}editSubstitutionsCutOff status{statusType showStatusTracker message{...textFragment}notice helpCenterText{...textFragment}}itemCount isCategorized categories{...ODPGroupCategoryFragment}seller{id name isPro}shipment{id trackingNumber}actions{reorder edit track changeSlot checkin editDeliveryInstructions editPickupPerson tip cancel help enableTip{...orderActionFragment}enableEdit{...orderActionFragment}viewCancellationDetails{...cancellationDetailsActionFragment}enableInHome{...orderActionFragment}createGiftReceipt}cutOffTimestamp isEditSubstitutionsEligible isInHome giftDetails{...GiftDetailsFragment}donationDetails{...orderDonationDetails}}fragment returnInfoFragment on ReturnInfo{returnOrderId type refundPriceDetails{__typename...refundPriceDetailsFragment}refundMessage tierRefundMessage paymentMethods{__typename description cardType paymentType displayValues message{...textFragment}}actions{__typename generate scheduleOrModifyPickup{text url}reschedulePickup editPickupContact}shippingLabelUrl qrCodeImageUrl carriers{__typename id name}pickupCarrier pickupContact{nameAndAddress{fullName firstName lastName address{addressString city state postalCode addressLineOne addressLineTwo country}}phone}pickupConfirmationNumber bannerMessage{...textFragment}}fragment refundPriceDetailsFragment on RefundPriceDetails{subTotal{__typename...orderPriceDetailRowFragment}fees{__typename...orderPriceDetailRowFragment}discounts{__typename...orderPriceDetailRowFragment}taxTotal{__typename...orderPriceDetailRowFragment}grandTotal{__typename...orderPriceDetailRowFragment}}fragment orderPriceDetailRowFragment on OrderPriceDetailRow{label displayValue value info{__typename title message}}fragment addressFragment on OrderAddress{addressString addressLineOne addressLineTwo state postalCode city}fragment ODPPickupInfo on OrderGroup{pickupInstructions pickupPerson{...person}alternatePickupPerson{...person}store{id name address{...addressFragment}}}fragment person on OrderPickupPerson{firstName lastName email}fragment ODPTippingInfo on OrderGroup{addTipMessage{...textFragment}driver{...DriverFragment}tipping{min{...price}max{...price}suggested{...price}preselected}subtotal{...price}}fragment orderActionFragment on Action{text url}fragment orderCustomer on OrderCustomer{id firstName lastName email isGuest isEmailRegistered}fragment OrderFieldsFragment on Order{__typename id version type customer{...orderCustomer}displayId idBarcodeImageUrl(barWidth:3 barHeight:100) isFuelPurchase title shortTitle timezone tippableGroup{...OrderGroupFragment}amendableGroup{id changeSlotIterationsLeft cutOffTimestamp fulfillmentType deliveryAddress{fullName firstName lastName address{addressString addressLineOne addressLineTwo state postalCode city country}}isAmendInProgress}substitutionsBanner{heading subheading longSubheading}groups_2101{__typename...OrderGroupFragment...ODPGroupFragment...ODPPickupInfo...ODPTippingInfo}multiboxBundles{...orderLineItem}itemCancelReasons{__typename...cancelReason}groupCancelReasons{__typename...cancelReason}priceDetails{__typename subTotal{__typename...priceDetailFragment}taxTotal{__typename...priceDetailFragment}grandTotal{__typename...priceDetailFragment}authorizationAmount{__typename...priceDetailFragment}fees{__typename...priceDetailFragment}discounts{__typename...priceDetailFragment}minimumThreshold{__typename...price}belowMinimumFee{__typename...priceDetailFragment}driverTip{__typename...priceDetailFragment}donations{__typename...priceDetailFragment}}paymentMethods{__typename description cardType paymentType displayValues message{...textFragment}actions{connectToCapitalOne{...orderActionFragment}visitAffirm{...orderActionFragment}}}actions{__typename return pendingReturn cancel startReturn{...orderActionFragment}reorder}banners{...textFragment}}","variables":{"orderId":"3392221065653","emailAddress":"katyteenageperrydream@gmail.com"}}' \
  --compressed`
 
  if [[ $curl22 =~ "blocked" ]]; then
    link22=`echo $curl22 | jq '.redirectUrl' | sed 's/"//g'`
    `open -n -a /Applications/Microsoft\ Edge.app --args --profile-directory=Default https://walmart.com$link22`
    read -n 1 -p "blocked"
  else
    break
  fi
done

if [[ $curl22 =~ "error" ]]; then
    echo "22-Sai info"
    echo "'3392221065653" >> track-OrderID.txt
    echo "katyteenageperrydream@gmail.com" >> track-email.txt
    echo "Sai info" >> track-usItemId.txt
    echo "Sai info" >> track-priceValue.txt
    echo "Sai info" >> track-fullName.txt
    echo "Sai info" >> track-address.txt
    echo "Sai info" >> track-status.txt
    echo "Sai info" >> track-number.txt
    echo "Sai info" >> track-url.txt
    echo "Sai info" >> track-categoriesType.txt
else
    sum22=`md5 track-OrderID.txt`
    for (( i=0; i<=4; i++ ))
    do
        for (( j=0; j<=4; j++))
        do
            if [[ `echo $curl22 | jq '.data.guestOrder.groups_2101['${i[@]}'].items['${j[@]}'].productInfo.usItemId'` == '"171173804"' ]]; then
                echo "'3392221065653" >> track-OrderID.txt
                echo katyteenageperrydream@gmail.com >> track-email.txt
                echo $curl22 | jq '.data.guestOrder.groups_2101['${i[@]}'].items['${j[@]}'].productInfo.usItemId' >> track-usItemId.txt
                echo $curl22 | jq '.data.guestOrder.groups_2101['${i[@]}'].items['${j[@]}'].priceInfo.linePrice.value' >> track-priceValue.txt
                echo $curl22 | jq '.data.guestOrder.groups_2101['${i[@]}'].deliveryAddress.fullName' >> track-fullName.txt
                echo $curl22 | jq '.data.guestOrder.groups_2101['${i[@]}'].deliveryAddress.address.addressString' >> track-address.txt
                echo $curl22 | jq '.data.guestOrder.groups_2101['${i[@]}'].status.message.parts[].text' >> track-status.txt
                echo $curl22 | jq '.data.guestOrder.groups_2101['${i[@]}'].shipment.trackingNumber' | sed 's/null//g' >> track-number.txt
                echo $curl22 | jq '.data.guestOrder.groups_2101['${i[@]}'].shipment.trackingUrl' | sed 's/null//g' >> track-url.txt
                echo $curl22 | jq '.data.guestOrder.groups_2101['${i[@]}'].categories[].type' >> track-categoriesType.txt

                break
            fi
        done
    done
    if [[ $sum22 == `md5 track-OrderID.txt` ]]; then
        echo "22-Khác Item"
        echo "'3392221065653" >> track-OrderID.txt
        echo "katyteenageperrydream@gmail.com" >> track-email.txt
        echo "Khác Item" >> track-usItemId.txt
        echo "Khác Item" >> track-priceValue.txt
        echo "Khác Item" >> track-fullName.txt
        echo "Khác Item" >> track-address.txt
        echo "Khác Item" >> track-status.txt
        echo "Khác Item" >> track-number.txt
        echo "Khác Item" >> track-url.txt
        echo "Khác Item" >> track-categoriesType.txt
    else
        echo "22"
    fi   
fi
while true
do
curl23=`curl -s 'https://www.walmart.com/orchestra/home/graphql' \
  -H 'authority: www.walmart.com' \
  -H 'sec-ch-ua: " Not;A Brand";v="99", "Microsoft Edge";v="97", "Chromium";v="97"' \
  -H 'x-o-platform: rweb' \
  -H 'dnt: 1' \
  -H 'x-o-correlation-id: pn9BnlEx0zDiyvRGJ6nL5BS9pDN7erB017Nf' \
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
  -H 'user-agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.51 Safari/537.36 Edg/99.0.1150.36' \
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
  --data-raw $'{"query":"query getGuestOrder($orderId:ID\u0021 $emailAddress:String\u0021){guestOrder(input:{id:$orderId emailAddress:$emailAddress}){...OrderFieldsFragment}}fragment cancelReason on OrderCancelReason{__typename subReasonCode subDescription}fragment priceDetailFragment on OrderPriceDetailRow{label value displayValue info{title message}rowInfo{...orderPriceDetailRowInfo}}fragment orderPriceDetailRowInfo on OrderPriceDetailRowInfo{title message{...textFragment}}fragment price on Price{displayValue value}fragment variants on MapEntry{name value}fragment OrderAddOn on OrderAddOn{lineId uniqueLineId productInfo{name usItemId offerId}quantityString quantityLabel type fulfillmentInstructions{...textFragment}actions{manageProtectionPlan{...orderActionFragment}cancel}priceInfo{linePrice{...price}}quantity isActive}fragment orderDonationDetails on OrderDonationDetails{message{...textFragment}emailReceipt emailReceiptToken status{...textFragment}errorStatus}fragment orderLineItem on OrderLineItem{id uniqueId actions{contactSeller cancel addToCart configureCake reviewItem resendEGiftCardToken protectionPlan{...orderActionFragment}manageProtectionPlan{...orderActionFragment}}isGift digitalDeliveryMessage quantity quantityString quantityLabel isSubstitutionSelected fulfilledItems{id quantityString priceInfo{itemPrice{value}}productInfo{usItemId name}}isReturnable returnEligibilityMessage productInfo{name usItemId imageInfo{thumbnailUrl}canonicalUrl offerId orderLimit orderMinLimit weightIncrement salesUnit salesUnitType isSubstitutionEligible isAlcohol}reshop{reshopMessage isShippingAvailable minPromiseDate maxPromiseDate}selectedVariants{...variants}variantAdditionalInfo{parts{text nativeAction}}priceInfo{priceDisplayCodes{showItemPrice priceDisplayCondition finalCostByWeight}itemPrice{...price}linePrice{...price}unitPrice{...price}preDiscountedLinePrice{...price}additionalLines{name value}}discounts{label labelText{...textFragment}}itemReviewed activationCodes{label code}protectionPlanMessage{...textFragment}showSeller isShippedByWalmart seller{id name isPro}digitalDeliveryPhoneNumber addOns{...OrderAddOn}multiboxBundleId}fragment DriverFragment on Driver{id firstName photoUrl}fragment OrderGroupFragment on OrderGroup{driver{...DriverFragment}deliveryDate fulfillmentType status{...OrderGroupStatusFragment}showSeller isShippedByWalmart seller{...SellerFragment}id itemCount items{...LiteLineItemFragment}pickupPerson{firstName lastName email}accessPointId shipment{...ShipmentFragment}returnEligibilityMessage actions{...OrderGroupActionsFragment}recipientEmailAddress digitalDelivery{...DigitalDeliveryFragment}tireInstallationReservation{status extraText reservationId}}fragment OrderGroupStatusFragment on OrderGroupStatus{statusType showStatusTracker statusTracker{status label isCurrent}message{...textFragment}subtext subMessage{...textFragment}notice helpCenterText{...textFragment}}fragment textFragment on Text{parts{bold url text nativeAction lineBreak}}fragment LiteLineItemFragment on OrderLineItem{id quantity productInfo{name usItemId imageInfo{thumbnailUrl}offerId isAlcohol}priceInfo{linePrice{...price}}}fragment SellerFragment on GroupSeller{id name isPro}fragment DigitalDeliveryFragment on DigitalDelivery{title name instructions{...textFragment}}fragment ShipmentFragment on Shipment{id trackingNumber isExternalTracking trackingUrl proofOfDelivery{...ProofOfDeliveryFragment}}fragment OrderGroupActionsFragment on OrderGroupActions{reorder edit track changeSlot checkin editDeliveryInstructions editPickupPerson editTip tip rateDriver cancel enableTip{...orderActionFragment}enableEdit{...orderActionFragment}rescheduleTireInstall{...orderActionFragment}cancelTireInstall{...orderActionFragment}help viewCancellationDetails{...cancellationDetailsActionFragment}}fragment cancellationDetailsActionFragment on CancellationDetailsAction{label heading text{...textFragment}}fragment ProofOfDeliveryFragment on ProofOfDelivery{photoUrl photoPreviewUrl showPreview}fragment DeliveryInstructionsFragment on DeliveryInstructions{text type typeText}fragment GiftDetailsFragment on GiftDetails{recipientAddress{fullName}recipientEmail senderName giftMessage}fragment SubstitutionAction on SubstitutionAction{message label type}fragment ODPGroupCategoryFragment on OrderCategory{type name subtext returnMessage substitutionsBanner{...textFragment}showExtendedSubstitutions actions{substitutions{...SubstitutionAction}nilPickReshop{message action{text url}}returnDetails viewCancellationDetails{...cancellationDetailsActionFragment}trackOnInHomeApp}banner{...textFragment}accordionState items{...orderLineItem}substitutions{...orderLineItem fulfilledItems{...orderLineItem}}returnInfo{...returnInfoFragment}}fragment ODPGroupFragment on OrderGroup{id fulfillmentType deliveryMessage deliveryAddress{fullName firstName lastName address{...addressFragment}}deliveryInstructions{...DeliveryInstructionsFragment}deliveryPreferences{text{...textFragment}cta{...orderActionFragment}}editSubstitutionsCutOff status{statusType showStatusTracker message{...textFragment}notice helpCenterText{...textFragment}}itemCount isCategorized categories{...ODPGroupCategoryFragment}seller{id name isPro}shipment{id trackingNumber}actions{reorder edit track changeSlot checkin editDeliveryInstructions editPickupPerson tip cancel help enableTip{...orderActionFragment}enableEdit{...orderActionFragment}viewCancellationDetails{...cancellationDetailsActionFragment}enableInHome{...orderActionFragment}createGiftReceipt}cutOffTimestamp isEditSubstitutionsEligible isInHome giftDetails{...GiftDetailsFragment}donationDetails{...orderDonationDetails}}fragment returnInfoFragment on ReturnInfo{returnOrderId type refundPriceDetails{__typename...refundPriceDetailsFragment}refundMessage tierRefundMessage paymentMethods{__typename description cardType paymentType displayValues message{...textFragment}}actions{__typename generate scheduleOrModifyPickup{text url}reschedulePickup editPickupContact}shippingLabelUrl qrCodeImageUrl carriers{__typename id name}pickupCarrier pickupContact{nameAndAddress{fullName firstName lastName address{addressString city state postalCode addressLineOne addressLineTwo country}}phone}pickupConfirmationNumber bannerMessage{...textFragment}}fragment refundPriceDetailsFragment on RefundPriceDetails{subTotal{__typename...orderPriceDetailRowFragment}fees{__typename...orderPriceDetailRowFragment}discounts{__typename...orderPriceDetailRowFragment}taxTotal{__typename...orderPriceDetailRowFragment}grandTotal{__typename...orderPriceDetailRowFragment}}fragment orderPriceDetailRowFragment on OrderPriceDetailRow{label displayValue value info{__typename title message}}fragment addressFragment on OrderAddress{addressString addressLineOne addressLineTwo state postalCode city}fragment ODPPickupInfo on OrderGroup{pickupInstructions pickupPerson{...person}alternatePickupPerson{...person}store{id name address{...addressFragment}}}fragment person on OrderPickupPerson{firstName lastName email}fragment ODPTippingInfo on OrderGroup{addTipMessage{...textFragment}driver{...DriverFragment}tipping{min{...price}max{...price}suggested{...price}preselected}subtotal{...price}}fragment orderActionFragment on Action{text url}fragment orderCustomer on OrderCustomer{id firstName lastName email isGuest isEmailRegistered}fragment OrderFieldsFragment on Order{__typename id version type customer{...orderCustomer}displayId idBarcodeImageUrl(barWidth:3 barHeight:100) isFuelPurchase title shortTitle timezone tippableGroup{...OrderGroupFragment}amendableGroup{id changeSlotIterationsLeft cutOffTimestamp fulfillmentType deliveryAddress{fullName firstName lastName address{addressString addressLineOne addressLineTwo state postalCode city country}}isAmendInProgress}substitutionsBanner{heading subheading longSubheading}groups_2101{__typename...OrderGroupFragment...ODPGroupFragment...ODPPickupInfo...ODPTippingInfo}multiboxBundles{...orderLineItem}itemCancelReasons{__typename...cancelReason}groupCancelReasons{__typename...cancelReason}priceDetails{__typename subTotal{__typename...priceDetailFragment}taxTotal{__typename...priceDetailFragment}grandTotal{__typename...priceDetailFragment}authorizationAmount{__typename...priceDetailFragment}fees{__typename...priceDetailFragment}discounts{__typename...priceDetailFragment}minimumThreshold{__typename...price}belowMinimumFee{__typename...priceDetailFragment}driverTip{__typename...priceDetailFragment}donations{__typename...priceDetailFragment}}paymentMethods{__typename description cardType paymentType displayValues message{...textFragment}actions{connectToCapitalOne{...orderActionFragment}visitAffirm{...orderActionFragment}}}actions{__typename return pendingReturn cancel startReturn{...orderActionFragment}reorder}banners{...textFragment}}","variables":{"orderId":"3372217775315","emailAddress":"cremeans.j.i@gmail.com"}}' \
  --compressed`
 
  if [[ $curl23 =~ "blocked" ]]; then
    link23=`echo $curl23 | jq '.redirectUrl' | sed 's/"//g'`
    `open -n -a /Applications/Microsoft\ Edge.app --args --profile-directory=Default https://walmart.com$link23`
    read -n 1 -p "blocked"
  else
    break
  fi
done

if [[ $curl23 =~ "error" ]]; then
    echo "23-Sai info"
    echo "'3372217775315" >> track-OrderID.txt
    echo "cremeans.j.i@gmail.com" >> track-email.txt
    echo "Sai info" >> track-usItemId.txt
    echo "Sai info" >> track-priceValue.txt
    echo "Sai info" >> track-fullName.txt
    echo "Sai info" >> track-address.txt
    echo "Sai info" >> track-status.txt
    echo "Sai info" >> track-number.txt
    echo "Sai info" >> track-url.txt
    echo "Sai info" >> track-categoriesType.txt
else
    sum23=`md5 track-OrderID.txt`
    for (( i=0; i<=4; i++ ))
    do
        for (( j=0; j<=4; j++))
        do
            if [[ `echo $curl23 | jq '.data.guestOrder.groups_2101['${i[@]}'].items['${j[@]}'].productInfo.usItemId'` == '"171173804"' ]]; then
                echo "'3372217775315" >> track-OrderID.txt
                echo cremeans.j.i@gmail.com >> track-email.txt
                echo $curl23 | jq '.data.guestOrder.groups_2101['${i[@]}'].items['${j[@]}'].productInfo.usItemId' >> track-usItemId.txt
                echo $curl23 | jq '.data.guestOrder.groups_2101['${i[@]}'].items['${j[@]}'].priceInfo.linePrice.value' >> track-priceValue.txt
                echo $curl23 | jq '.data.guestOrder.groups_2101['${i[@]}'].deliveryAddress.fullName' >> track-fullName.txt
                echo $curl23 | jq '.data.guestOrder.groups_2101['${i[@]}'].deliveryAddress.address.addressString' >> track-address.txt
                echo $curl23 | jq '.data.guestOrder.groups_2101['${i[@]}'].status.message.parts[].text' >> track-status.txt
                echo $curl23 | jq '.data.guestOrder.groups_2101['${i[@]}'].shipment.trackingNumber' | sed 's/null//g' >> track-number.txt
                echo $curl23 | jq '.data.guestOrder.groups_2101['${i[@]}'].shipment.trackingUrl' | sed 's/null//g' >> track-url.txt
                echo $curl23 | jq '.data.guestOrder.groups_2101['${i[@]}'].categories[].type' >> track-categoriesType.txt

                break
            fi
        done
    done
    if [[ $sum23 == `md5 track-OrderID.txt` ]]; then
        echo "23-Khác Item"
        echo "'3372217775315" >> track-OrderID.txt
        echo "cremeans.j.i@gmail.com" >> track-email.txt
        echo "Khác Item" >> track-usItemId.txt
        echo "Khác Item" >> track-priceValue.txt
        echo "Khác Item" >> track-fullName.txt
        echo "Khác Item" >> track-address.txt
        echo "Khác Item" >> track-status.txt
        echo "Khác Item" >> track-number.txt
        echo "Khác Item" >> track-url.txt
        echo "Khác Item" >> track-categoriesType.txt
    else
        echo "23"
    fi   
fi
while true
do
curl24=`curl -s 'https://www.walmart.com/orchestra/home/graphql' \
  -H 'authority: www.walmart.com' \
  -H 'sec-ch-ua: " Not;A Brand";v="99", "Microsoft Edge";v="97", "Chromium";v="97"' \
  -H 'x-o-platform: rweb' \
  -H 'dnt: 1' \
  -H 'x-o-correlation-id: pn9BnlEx0zDiyvRGJ6nL5BS9pDN7erB017Nf' \
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
  -H 'user-agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.51 Safari/537.36 Edg/99.0.1150.36' \
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
  --data-raw $'{"query":"query getGuestOrder($orderId:ID\u0021 $emailAddress:String\u0021){guestOrder(input:{id:$orderId emailAddress:$emailAddress}){...OrderFieldsFragment}}fragment cancelReason on OrderCancelReason{__typename subReasonCode subDescription}fragment priceDetailFragment on OrderPriceDetailRow{label value displayValue info{title message}rowInfo{...orderPriceDetailRowInfo}}fragment orderPriceDetailRowInfo on OrderPriceDetailRowInfo{title message{...textFragment}}fragment price on Price{displayValue value}fragment variants on MapEntry{name value}fragment OrderAddOn on OrderAddOn{lineId uniqueLineId productInfo{name usItemId offerId}quantityString quantityLabel type fulfillmentInstructions{...textFragment}actions{manageProtectionPlan{...orderActionFragment}cancel}priceInfo{linePrice{...price}}quantity isActive}fragment orderDonationDetails on OrderDonationDetails{message{...textFragment}emailReceipt emailReceiptToken status{...textFragment}errorStatus}fragment orderLineItem on OrderLineItem{id uniqueId actions{contactSeller cancel addToCart configureCake reviewItem resendEGiftCardToken protectionPlan{...orderActionFragment}manageProtectionPlan{...orderActionFragment}}isGift digitalDeliveryMessage quantity quantityString quantityLabel isSubstitutionSelected fulfilledItems{id quantityString priceInfo{itemPrice{value}}productInfo{usItemId name}}isReturnable returnEligibilityMessage productInfo{name usItemId imageInfo{thumbnailUrl}canonicalUrl offerId orderLimit orderMinLimit weightIncrement salesUnit salesUnitType isSubstitutionEligible isAlcohol}reshop{reshopMessage isShippingAvailable minPromiseDate maxPromiseDate}selectedVariants{...variants}variantAdditionalInfo{parts{text nativeAction}}priceInfo{priceDisplayCodes{showItemPrice priceDisplayCondition finalCostByWeight}itemPrice{...price}linePrice{...price}unitPrice{...price}preDiscountedLinePrice{...price}additionalLines{name value}}discounts{label labelText{...textFragment}}itemReviewed activationCodes{label code}protectionPlanMessage{...textFragment}showSeller isShippedByWalmart seller{id name isPro}digitalDeliveryPhoneNumber addOns{...OrderAddOn}multiboxBundleId}fragment DriverFragment on Driver{id firstName photoUrl}fragment OrderGroupFragment on OrderGroup{driver{...DriverFragment}deliveryDate fulfillmentType status{...OrderGroupStatusFragment}showSeller isShippedByWalmart seller{...SellerFragment}id itemCount items{...LiteLineItemFragment}pickupPerson{firstName lastName email}accessPointId shipment{...ShipmentFragment}returnEligibilityMessage actions{...OrderGroupActionsFragment}recipientEmailAddress digitalDelivery{...DigitalDeliveryFragment}tireInstallationReservation{status extraText reservationId}}fragment OrderGroupStatusFragment on OrderGroupStatus{statusType showStatusTracker statusTracker{status label isCurrent}message{...textFragment}subtext subMessage{...textFragment}notice helpCenterText{...textFragment}}fragment textFragment on Text{parts{bold url text nativeAction lineBreak}}fragment LiteLineItemFragment on OrderLineItem{id quantity productInfo{name usItemId imageInfo{thumbnailUrl}offerId isAlcohol}priceInfo{linePrice{...price}}}fragment SellerFragment on GroupSeller{id name isPro}fragment DigitalDeliveryFragment on DigitalDelivery{title name instructions{...textFragment}}fragment ShipmentFragment on Shipment{id trackingNumber isExternalTracking trackingUrl proofOfDelivery{...ProofOfDeliveryFragment}}fragment OrderGroupActionsFragment on OrderGroupActions{reorder edit track changeSlot checkin editDeliveryInstructions editPickupPerson editTip tip rateDriver cancel enableTip{...orderActionFragment}enableEdit{...orderActionFragment}rescheduleTireInstall{...orderActionFragment}cancelTireInstall{...orderActionFragment}help viewCancellationDetails{...cancellationDetailsActionFragment}}fragment cancellationDetailsActionFragment on CancellationDetailsAction{label heading text{...textFragment}}fragment ProofOfDeliveryFragment on ProofOfDelivery{photoUrl photoPreviewUrl showPreview}fragment DeliveryInstructionsFragment on DeliveryInstructions{text type typeText}fragment GiftDetailsFragment on GiftDetails{recipientAddress{fullName}recipientEmail senderName giftMessage}fragment SubstitutionAction on SubstitutionAction{message label type}fragment ODPGroupCategoryFragment on OrderCategory{type name subtext returnMessage substitutionsBanner{...textFragment}showExtendedSubstitutions actions{substitutions{...SubstitutionAction}nilPickReshop{message action{text url}}returnDetails viewCancellationDetails{...cancellationDetailsActionFragment}trackOnInHomeApp}banner{...textFragment}accordionState items{...orderLineItem}substitutions{...orderLineItem fulfilledItems{...orderLineItem}}returnInfo{...returnInfoFragment}}fragment ODPGroupFragment on OrderGroup{id fulfillmentType deliveryMessage deliveryAddress{fullName firstName lastName address{...addressFragment}}deliveryInstructions{...DeliveryInstructionsFragment}deliveryPreferences{text{...textFragment}cta{...orderActionFragment}}editSubstitutionsCutOff status{statusType showStatusTracker message{...textFragment}notice helpCenterText{...textFragment}}itemCount isCategorized categories{...ODPGroupCategoryFragment}seller{id name isPro}shipment{id trackingNumber}actions{reorder edit track changeSlot checkin editDeliveryInstructions editPickupPerson tip cancel help enableTip{...orderActionFragment}enableEdit{...orderActionFragment}viewCancellationDetails{...cancellationDetailsActionFragment}enableInHome{...orderActionFragment}createGiftReceipt}cutOffTimestamp isEditSubstitutionsEligible isInHome giftDetails{...GiftDetailsFragment}donationDetails{...orderDonationDetails}}fragment returnInfoFragment on ReturnInfo{returnOrderId type refundPriceDetails{__typename...refundPriceDetailsFragment}refundMessage tierRefundMessage paymentMethods{__typename description cardType paymentType displayValues message{...textFragment}}actions{__typename generate scheduleOrModifyPickup{text url}reschedulePickup editPickupContact}shippingLabelUrl qrCodeImageUrl carriers{__typename id name}pickupCarrier pickupContact{nameAndAddress{fullName firstName lastName address{addressString city state postalCode addressLineOne addressLineTwo country}}phone}pickupConfirmationNumber bannerMessage{...textFragment}}fragment refundPriceDetailsFragment on RefundPriceDetails{subTotal{__typename...orderPriceDetailRowFragment}fees{__typename...orderPriceDetailRowFragment}discounts{__typename...orderPriceDetailRowFragment}taxTotal{__typename...orderPriceDetailRowFragment}grandTotal{__typename...orderPriceDetailRowFragment}}fragment orderPriceDetailRowFragment on OrderPriceDetailRow{label displayValue value info{__typename title message}}fragment addressFragment on OrderAddress{addressString addressLineOne addressLineTwo state postalCode city}fragment ODPPickupInfo on OrderGroup{pickupInstructions pickupPerson{...person}alternatePickupPerson{...person}store{id name address{...addressFragment}}}fragment person on OrderPickupPerson{firstName lastName email}fragment ODPTippingInfo on OrderGroup{addTipMessage{...textFragment}driver{...DriverFragment}tipping{min{...price}max{...price}suggested{...price}preselected}subtotal{...price}}fragment orderActionFragment on Action{text url}fragment orderCustomer on OrderCustomer{id firstName lastName email isGuest isEmailRegistered}fragment OrderFieldsFragment on Order{__typename id version type customer{...orderCustomer}displayId idBarcodeImageUrl(barWidth:3 barHeight:100) isFuelPurchase title shortTitle timezone tippableGroup{...OrderGroupFragment}amendableGroup{id changeSlotIterationsLeft cutOffTimestamp fulfillmentType deliveryAddress{fullName firstName lastName address{addressString addressLineOne addressLineTwo state postalCode city country}}isAmendInProgress}substitutionsBanner{heading subheading longSubheading}groups_2101{__typename...OrderGroupFragment...ODPGroupFragment...ODPPickupInfo...ODPTippingInfo}multiboxBundles{...orderLineItem}itemCancelReasons{__typename...cancelReason}groupCancelReasons{__typename...cancelReason}priceDetails{__typename subTotal{__typename...priceDetailFragment}taxTotal{__typename...priceDetailFragment}grandTotal{__typename...priceDetailFragment}authorizationAmount{__typename...priceDetailFragment}fees{__typename...priceDetailFragment}discounts{__typename...priceDetailFragment}minimumThreshold{__typename...price}belowMinimumFee{__typename...priceDetailFragment}driverTip{__typename...priceDetailFragment}donations{__typename...priceDetailFragment}}paymentMethods{__typename description cardType paymentType displayValues message{...textFragment}actions{connectToCapitalOne{...orderActionFragment}visitAffirm{...orderActionFragment}}}actions{__typename return pendingReturn cancel startReturn{...orderActionFragment}reorder}banners{...textFragment}}","variables":{"orderId":"3382219073292","emailAddress":"StefDiCarlo27@gmail.com"}}' \
  --compressed`
 
  if [[ $curl24 =~ "blocked" ]]; then
    link24=`echo $curl24 | jq '.redirectUrl' | sed 's/"//g'`
    `open -n -a /Applications/Microsoft\ Edge.app --args --profile-directory=Default https://walmart.com$link24`
    read -n 1 -p "blocked"
  else
    break
  fi
done

if [[ $curl24 =~ "error" ]]; then
    echo "24-Sai info"
    echo "'3382219073292" >> track-OrderID.txt
    echo "StefDiCarlo27@gmail.com" >> track-email.txt
    echo "Sai info" >> track-usItemId.txt
    echo "Sai info" >> track-priceValue.txt
    echo "Sai info" >> track-fullName.txt
    echo "Sai info" >> track-address.txt
    echo "Sai info" >> track-status.txt
    echo "Sai info" >> track-number.txt
    echo "Sai info" >> track-url.txt
    echo "Sai info" >> track-categoriesType.txt
else
    sum24=`md5 track-OrderID.txt`
    for (( i=0; i<=4; i++ ))
    do
        for (( j=0; j<=4; j++))
        do
            if [[ `echo $curl24 | jq '.data.guestOrder.groups_2101['${i[@]}'].items['${j[@]}'].productInfo.usItemId'` == '"689830322"' ]]; then
                echo "'3382219073292" >> track-OrderID.txt
                echo StefDiCarlo27@gmail.com >> track-email.txt
                echo $curl24 | jq '.data.guestOrder.groups_2101['${i[@]}'].items['${j[@]}'].productInfo.usItemId' >> track-usItemId.txt
                echo $curl24 | jq '.data.guestOrder.groups_2101['${i[@]}'].items['${j[@]}'].priceInfo.linePrice.value' >> track-priceValue.txt
                echo $curl24 | jq '.data.guestOrder.groups_2101['${i[@]}'].deliveryAddress.fullName' >> track-fullName.txt
                echo $curl24 | jq '.data.guestOrder.groups_2101['${i[@]}'].deliveryAddress.address.addressString' >> track-address.txt
                echo $curl24 | jq '.data.guestOrder.groups_2101['${i[@]}'].status.message.parts[].text' >> track-status.txt
                echo $curl24 | jq '.data.guestOrder.groups_2101['${i[@]}'].shipment.trackingNumber' | sed 's/null//g' >> track-number.txt
                echo $curl24 | jq '.data.guestOrder.groups_2101['${i[@]}'].shipment.trackingUrl' | sed 's/null//g' >> track-url.txt
                echo $curl24 | jq '.data.guestOrder.groups_2101['${i[@]}'].categories[].type' >> track-categoriesType.txt

                break
            fi
        done
    done
    if [[ $sum24 == `md5 track-OrderID.txt` ]]; then
        echo "24-Khác Item"
        echo "'3382219073292" >> track-OrderID.txt
        echo "StefDiCarlo27@gmail.com" >> track-email.txt
        echo "Khác Item" >> track-usItemId.txt
        echo "Khác Item" >> track-priceValue.txt
        echo "Khác Item" >> track-fullName.txt
        echo "Khác Item" >> track-address.txt
        echo "Khác Item" >> track-status.txt
        echo "Khác Item" >> track-number.txt
        echo "Khác Item" >> track-url.txt
        echo "Khác Item" >> track-categoriesType.txt
    else
        echo "24"
    fi   
fi
while true
do
curl25=`curl -s 'https://www.walmart.com/orchestra/home/graphql' \
  -H 'authority: www.walmart.com' \
  -H 'sec-ch-ua: " Not;A Brand";v="99", "Microsoft Edge";v="97", "Chromium";v="97"' \
  -H 'x-o-platform: rweb' \
  -H 'dnt: 1' \
  -H 'x-o-correlation-id: pn9BnlEx0zDiyvRGJ6nL5BS9pDN7erB017Nf' \
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
  -H 'user-agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.51 Safari/537.36 Edg/99.0.1150.36' \
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
  --data-raw $'{"query":"query getGuestOrder($orderId:ID\u0021 $emailAddress:String\u0021){guestOrder(input:{id:$orderId emailAddress:$emailAddress}){...OrderFieldsFragment}}fragment cancelReason on OrderCancelReason{__typename subReasonCode subDescription}fragment priceDetailFragment on OrderPriceDetailRow{label value displayValue info{title message}rowInfo{...orderPriceDetailRowInfo}}fragment orderPriceDetailRowInfo on OrderPriceDetailRowInfo{title message{...textFragment}}fragment price on Price{displayValue value}fragment variants on MapEntry{name value}fragment OrderAddOn on OrderAddOn{lineId uniqueLineId productInfo{name usItemId offerId}quantityString quantityLabel type fulfillmentInstructions{...textFragment}actions{manageProtectionPlan{...orderActionFragment}cancel}priceInfo{linePrice{...price}}quantity isActive}fragment orderDonationDetails on OrderDonationDetails{message{...textFragment}emailReceipt emailReceiptToken status{...textFragment}errorStatus}fragment orderLineItem on OrderLineItem{id uniqueId actions{contactSeller cancel addToCart configureCake reviewItem resendEGiftCardToken protectionPlan{...orderActionFragment}manageProtectionPlan{...orderActionFragment}}isGift digitalDeliveryMessage quantity quantityString quantityLabel isSubstitutionSelected fulfilledItems{id quantityString priceInfo{itemPrice{value}}productInfo{usItemId name}}isReturnable returnEligibilityMessage productInfo{name usItemId imageInfo{thumbnailUrl}canonicalUrl offerId orderLimit orderMinLimit weightIncrement salesUnit salesUnitType isSubstitutionEligible isAlcohol}reshop{reshopMessage isShippingAvailable minPromiseDate maxPromiseDate}selectedVariants{...variants}variantAdditionalInfo{parts{text nativeAction}}priceInfo{priceDisplayCodes{showItemPrice priceDisplayCondition finalCostByWeight}itemPrice{...price}linePrice{...price}unitPrice{...price}preDiscountedLinePrice{...price}additionalLines{name value}}discounts{label labelText{...textFragment}}itemReviewed activationCodes{label code}protectionPlanMessage{...textFragment}showSeller isShippedByWalmart seller{id name isPro}digitalDeliveryPhoneNumber addOns{...OrderAddOn}multiboxBundleId}fragment DriverFragment on Driver{id firstName photoUrl}fragment OrderGroupFragment on OrderGroup{driver{...DriverFragment}deliveryDate fulfillmentType status{...OrderGroupStatusFragment}showSeller isShippedByWalmart seller{...SellerFragment}id itemCount items{...LiteLineItemFragment}pickupPerson{firstName lastName email}accessPointId shipment{...ShipmentFragment}returnEligibilityMessage actions{...OrderGroupActionsFragment}recipientEmailAddress digitalDelivery{...DigitalDeliveryFragment}tireInstallationReservation{status extraText reservationId}}fragment OrderGroupStatusFragment on OrderGroupStatus{statusType showStatusTracker statusTracker{status label isCurrent}message{...textFragment}subtext subMessage{...textFragment}notice helpCenterText{...textFragment}}fragment textFragment on Text{parts{bold url text nativeAction lineBreak}}fragment LiteLineItemFragment on OrderLineItem{id quantity productInfo{name usItemId imageInfo{thumbnailUrl}offerId isAlcohol}priceInfo{linePrice{...price}}}fragment SellerFragment on GroupSeller{id name isPro}fragment DigitalDeliveryFragment on DigitalDelivery{title name instructions{...textFragment}}fragment ShipmentFragment on Shipment{id trackingNumber isExternalTracking trackingUrl proofOfDelivery{...ProofOfDeliveryFragment}}fragment OrderGroupActionsFragment on OrderGroupActions{reorder edit track changeSlot checkin editDeliveryInstructions editPickupPerson editTip tip rateDriver cancel enableTip{...orderActionFragment}enableEdit{...orderActionFragment}rescheduleTireInstall{...orderActionFragment}cancelTireInstall{...orderActionFragment}help viewCancellationDetails{...cancellationDetailsActionFragment}}fragment cancellationDetailsActionFragment on CancellationDetailsAction{label heading text{...textFragment}}fragment ProofOfDeliveryFragment on ProofOfDelivery{photoUrl photoPreviewUrl showPreview}fragment DeliveryInstructionsFragment on DeliveryInstructions{text type typeText}fragment GiftDetailsFragment on GiftDetails{recipientAddress{fullName}recipientEmail senderName giftMessage}fragment SubstitutionAction on SubstitutionAction{message label type}fragment ODPGroupCategoryFragment on OrderCategory{type name subtext returnMessage substitutionsBanner{...textFragment}showExtendedSubstitutions actions{substitutions{...SubstitutionAction}nilPickReshop{message action{text url}}returnDetails viewCancellationDetails{...cancellationDetailsActionFragment}trackOnInHomeApp}banner{...textFragment}accordionState items{...orderLineItem}substitutions{...orderLineItem fulfilledItems{...orderLineItem}}returnInfo{...returnInfoFragment}}fragment ODPGroupFragment on OrderGroup{id fulfillmentType deliveryMessage deliveryAddress{fullName firstName lastName address{...addressFragment}}deliveryInstructions{...DeliveryInstructionsFragment}deliveryPreferences{text{...textFragment}cta{...orderActionFragment}}editSubstitutionsCutOff status{statusType showStatusTracker message{...textFragment}notice helpCenterText{...textFragment}}itemCount isCategorized categories{...ODPGroupCategoryFragment}seller{id name isPro}shipment{id trackingNumber}actions{reorder edit track changeSlot checkin editDeliveryInstructions editPickupPerson tip cancel help enableTip{...orderActionFragment}enableEdit{...orderActionFragment}viewCancellationDetails{...cancellationDetailsActionFragment}enableInHome{...orderActionFragment}createGiftReceipt}cutOffTimestamp isEditSubstitutionsEligible isInHome giftDetails{...GiftDetailsFragment}donationDetails{...orderDonationDetails}}fragment returnInfoFragment on ReturnInfo{returnOrderId type refundPriceDetails{__typename...refundPriceDetailsFragment}refundMessage tierRefundMessage paymentMethods{__typename description cardType paymentType displayValues message{...textFragment}}actions{__typename generate scheduleOrModifyPickup{text url}reschedulePickup editPickupContact}shippingLabelUrl qrCodeImageUrl carriers{__typename id name}pickupCarrier pickupContact{nameAndAddress{fullName firstName lastName address{addressString city state postalCode addressLineOne addressLineTwo country}}phone}pickupConfirmationNumber bannerMessage{...textFragment}}fragment refundPriceDetailsFragment on RefundPriceDetails{subTotal{__typename...orderPriceDetailRowFragment}fees{__typename...orderPriceDetailRowFragment}discounts{__typename...orderPriceDetailRowFragment}taxTotal{__typename...orderPriceDetailRowFragment}grandTotal{__typename...orderPriceDetailRowFragment}}fragment orderPriceDetailRowFragment on OrderPriceDetailRow{label displayValue value info{__typename title message}}fragment addressFragment on OrderAddress{addressString addressLineOne addressLineTwo state postalCode city}fragment ODPPickupInfo on OrderGroup{pickupInstructions pickupPerson{...person}alternatePickupPerson{...person}store{id name address{...addressFragment}}}fragment person on OrderPickupPerson{firstName lastName email}fragment ODPTippingInfo on OrderGroup{addTipMessage{...textFragment}driver{...DriverFragment}tipping{min{...price}max{...price}suggested{...price}preselected}subtotal{...price}}fragment orderActionFragment on Action{text url}fragment orderCustomer on OrderCustomer{id firstName lastName email isGuest isEmailRegistered}fragment OrderFieldsFragment on Order{__typename id version type customer{...orderCustomer}displayId idBarcodeImageUrl(barWidth:3 barHeight:100) isFuelPurchase title shortTitle timezone tippableGroup{...OrderGroupFragment}amendableGroup{id changeSlotIterationsLeft cutOffTimestamp fulfillmentType deliveryAddress{fullName firstName lastName address{addressString addressLineOne addressLineTwo state postalCode city country}}isAmendInProgress}substitutionsBanner{heading subheading longSubheading}groups_2101{__typename...OrderGroupFragment...ODPGroupFragment...ODPPickupInfo...ODPTippingInfo}multiboxBundles{...orderLineItem}itemCancelReasons{__typename...cancelReason}groupCancelReasons{__typename...cancelReason}priceDetails{__typename subTotal{__typename...priceDetailFragment}taxTotal{__typename...priceDetailFragment}grandTotal{__typename...priceDetailFragment}authorizationAmount{__typename...priceDetailFragment}fees{__typename...priceDetailFragment}discounts{__typename...priceDetailFragment}minimumThreshold{__typename...price}belowMinimumFee{__typename...priceDetailFragment}driverTip{__typename...priceDetailFragment}donations{__typename...priceDetailFragment}}paymentMethods{__typename description cardType paymentType displayValues message{...textFragment}actions{connectToCapitalOne{...orderActionFragment}visitAffirm{...orderActionFragment}}}actions{__typename return pendingReturn cancel startReturn{...orderActionFragment}reorder}banners{...textFragment}}","variables":{"orderId":"3392221242012","emailAddress":"zawkawsmom@gmail.com"}}' \
  --compressed`
 
  if [[ $curl25 =~ "blocked" ]]; then
    link25=`echo $curl25 | jq '.redirectUrl' | sed 's/"//g'`
    `open -n -a /Applications/Microsoft\ Edge.app --args --profile-directory=Default https://walmart.com$link25`
    read -n 1 -p "blocked"
  else
    break
  fi
done

if [[ $curl25 =~ "error" ]]; then
    echo "25-Sai info"
    echo "'3392221242012" >> track-OrderID.txt
    echo "zawkawsmom@gmail.com" >> track-email.txt
    echo "Sai info" >> track-usItemId.txt
    echo "Sai info" >> track-priceValue.txt
    echo "Sai info" >> track-fullName.txt
    echo "Sai info" >> track-address.txt
    echo "Sai info" >> track-status.txt
    echo "Sai info" >> track-number.txt
    echo "Sai info" >> track-url.txt
    echo "Sai info" >> track-categoriesType.txt
else
    sum25=`md5 track-OrderID.txt`
    for (( i=0; i<=4; i++ ))
    do
        for (( j=0; j<=4; j++))
        do
            if [[ `echo $curl25 | jq '.data.guestOrder.groups_2101['${i[@]}'].items['${j[@]}'].productInfo.usItemId'` == '"837613230"' ]]; then
                echo "'3392221242012" >> track-OrderID.txt
                echo zawkawsmom@gmail.com >> track-email.txt
                echo $curl25 | jq '.data.guestOrder.groups_2101['${i[@]}'].items['${j[@]}'].productInfo.usItemId' >> track-usItemId.txt
                echo $curl25 | jq '.data.guestOrder.groups_2101['${i[@]}'].items['${j[@]}'].priceInfo.linePrice.value' >> track-priceValue.txt
                echo $curl25 | jq '.data.guestOrder.groups_2101['${i[@]}'].deliveryAddress.fullName' >> track-fullName.txt
                echo $curl25 | jq '.data.guestOrder.groups_2101['${i[@]}'].deliveryAddress.address.addressString' >> track-address.txt
                echo $curl25 | jq '.data.guestOrder.groups_2101['${i[@]}'].status.message.parts[].text' >> track-status.txt
                echo $curl25 | jq '.data.guestOrder.groups_2101['${i[@]}'].shipment.trackingNumber' | sed 's/null//g' >> track-number.txt
                echo $curl25 | jq '.data.guestOrder.groups_2101['${i[@]}'].shipment.trackingUrl' | sed 's/null//g' >> track-url.txt
                echo $curl25 | jq '.data.guestOrder.groups_2101['${i[@]}'].categories[].type' >> track-categoriesType.txt

                break
            fi
        done
    done
    if [[ $sum25 == `md5 track-OrderID.txt` ]]; then
        echo "25-Khác Item"
        echo "'3392221242012" >> track-OrderID.txt
        echo "zawkawsmom@gmail.com" >> track-email.txt
        echo "Khác Item" >> track-usItemId.txt
        echo "Khác Item" >> track-priceValue.txt
        echo "Khác Item" >> track-fullName.txt
        echo "Khác Item" >> track-address.txt
        echo "Khác Item" >> track-status.txt
        echo "Khác Item" >> track-number.txt
        echo "Khác Item" >> track-url.txt
        echo "Khác Item" >> track-categoriesType.txt
    else
        echo "25"
    fi   
fi
while true
do
curl26=`curl -s 'https://www.walmart.com/orchestra/home/graphql' \
  -H 'authority: www.walmart.com' \
  -H 'sec-ch-ua: " Not;A Brand";v="99", "Microsoft Edge";v="97", "Chromium";v="97"' \
  -H 'x-o-platform: rweb' \
  -H 'dnt: 1' \
  -H 'x-o-correlation-id: pn9BnlEx0zDiyvRGJ6nL5BS9pDN7erB017Nf' \
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
  -H 'user-agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.51 Safari/537.36 Edg/99.0.1150.36' \
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
  --data-raw $'{"query":"query getGuestOrder($orderId:ID\u0021 $emailAddress:String\u0021){guestOrder(input:{id:$orderId emailAddress:$emailAddress}){...OrderFieldsFragment}}fragment cancelReason on OrderCancelReason{__typename subReasonCode subDescription}fragment priceDetailFragment on OrderPriceDetailRow{label value displayValue info{title message}rowInfo{...orderPriceDetailRowInfo}}fragment orderPriceDetailRowInfo on OrderPriceDetailRowInfo{title message{...textFragment}}fragment price on Price{displayValue value}fragment variants on MapEntry{name value}fragment OrderAddOn on OrderAddOn{lineId uniqueLineId productInfo{name usItemId offerId}quantityString quantityLabel type fulfillmentInstructions{...textFragment}actions{manageProtectionPlan{...orderActionFragment}cancel}priceInfo{linePrice{...price}}quantity isActive}fragment orderDonationDetails on OrderDonationDetails{message{...textFragment}emailReceipt emailReceiptToken status{...textFragment}errorStatus}fragment orderLineItem on OrderLineItem{id uniqueId actions{contactSeller cancel addToCart configureCake reviewItem resendEGiftCardToken protectionPlan{...orderActionFragment}manageProtectionPlan{...orderActionFragment}}isGift digitalDeliveryMessage quantity quantityString quantityLabel isSubstitutionSelected fulfilledItems{id quantityString priceInfo{itemPrice{value}}productInfo{usItemId name}}isReturnable returnEligibilityMessage productInfo{name usItemId imageInfo{thumbnailUrl}canonicalUrl offerId orderLimit orderMinLimit weightIncrement salesUnit salesUnitType isSubstitutionEligible isAlcohol}reshop{reshopMessage isShippingAvailable minPromiseDate maxPromiseDate}selectedVariants{...variants}variantAdditionalInfo{parts{text nativeAction}}priceInfo{priceDisplayCodes{showItemPrice priceDisplayCondition finalCostByWeight}itemPrice{...price}linePrice{...price}unitPrice{...price}preDiscountedLinePrice{...price}additionalLines{name value}}discounts{label labelText{...textFragment}}itemReviewed activationCodes{label code}protectionPlanMessage{...textFragment}showSeller isShippedByWalmart seller{id name isPro}digitalDeliveryPhoneNumber addOns{...OrderAddOn}multiboxBundleId}fragment DriverFragment on Driver{id firstName photoUrl}fragment OrderGroupFragment on OrderGroup{driver{...DriverFragment}deliveryDate fulfillmentType status{...OrderGroupStatusFragment}showSeller isShippedByWalmart seller{...SellerFragment}id itemCount items{...LiteLineItemFragment}pickupPerson{firstName lastName email}accessPointId shipment{...ShipmentFragment}returnEligibilityMessage actions{...OrderGroupActionsFragment}recipientEmailAddress digitalDelivery{...DigitalDeliveryFragment}tireInstallationReservation{status extraText reservationId}}fragment OrderGroupStatusFragment on OrderGroupStatus{statusType showStatusTracker statusTracker{status label isCurrent}message{...textFragment}subtext subMessage{...textFragment}notice helpCenterText{...textFragment}}fragment textFragment on Text{parts{bold url text nativeAction lineBreak}}fragment LiteLineItemFragment on OrderLineItem{id quantity productInfo{name usItemId imageInfo{thumbnailUrl}offerId isAlcohol}priceInfo{linePrice{...price}}}fragment SellerFragment on GroupSeller{id name isPro}fragment DigitalDeliveryFragment on DigitalDelivery{title name instructions{...textFragment}}fragment ShipmentFragment on Shipment{id trackingNumber isExternalTracking trackingUrl proofOfDelivery{...ProofOfDeliveryFragment}}fragment OrderGroupActionsFragment on OrderGroupActions{reorder edit track changeSlot checkin editDeliveryInstructions editPickupPerson editTip tip rateDriver cancel enableTip{...orderActionFragment}enableEdit{...orderActionFragment}rescheduleTireInstall{...orderActionFragment}cancelTireInstall{...orderActionFragment}help viewCancellationDetails{...cancellationDetailsActionFragment}}fragment cancellationDetailsActionFragment on CancellationDetailsAction{label heading text{...textFragment}}fragment ProofOfDeliveryFragment on ProofOfDelivery{photoUrl photoPreviewUrl showPreview}fragment DeliveryInstructionsFragment on DeliveryInstructions{text type typeText}fragment GiftDetailsFragment on GiftDetails{recipientAddress{fullName}recipientEmail senderName giftMessage}fragment SubstitutionAction on SubstitutionAction{message label type}fragment ODPGroupCategoryFragment on OrderCategory{type name subtext returnMessage substitutionsBanner{...textFragment}showExtendedSubstitutions actions{substitutions{...SubstitutionAction}nilPickReshop{message action{text url}}returnDetails viewCancellationDetails{...cancellationDetailsActionFragment}trackOnInHomeApp}banner{...textFragment}accordionState items{...orderLineItem}substitutions{...orderLineItem fulfilledItems{...orderLineItem}}returnInfo{...returnInfoFragment}}fragment ODPGroupFragment on OrderGroup{id fulfillmentType deliveryMessage deliveryAddress{fullName firstName lastName address{...addressFragment}}deliveryInstructions{...DeliveryInstructionsFragment}deliveryPreferences{text{...textFragment}cta{...orderActionFragment}}editSubstitutionsCutOff status{statusType showStatusTracker message{...textFragment}notice helpCenterText{...textFragment}}itemCount isCategorized categories{...ODPGroupCategoryFragment}seller{id name isPro}shipment{id trackingNumber}actions{reorder edit track changeSlot checkin editDeliveryInstructions editPickupPerson tip cancel help enableTip{...orderActionFragment}enableEdit{...orderActionFragment}viewCancellationDetails{...cancellationDetailsActionFragment}enableInHome{...orderActionFragment}createGiftReceipt}cutOffTimestamp isEditSubstitutionsEligible isInHome giftDetails{...GiftDetailsFragment}donationDetails{...orderDonationDetails}}fragment returnInfoFragment on ReturnInfo{returnOrderId type refundPriceDetails{__typename...refundPriceDetailsFragment}refundMessage tierRefundMessage paymentMethods{__typename description cardType paymentType displayValues message{...textFragment}}actions{__typename generate scheduleOrModifyPickup{text url}reschedulePickup editPickupContact}shippingLabelUrl qrCodeImageUrl carriers{__typename id name}pickupCarrier pickupContact{nameAndAddress{fullName firstName lastName address{addressString city state postalCode addressLineOne addressLineTwo country}}phone}pickupConfirmationNumber bannerMessage{...textFragment}}fragment refundPriceDetailsFragment on RefundPriceDetails{subTotal{__typename...orderPriceDetailRowFragment}fees{__typename...orderPriceDetailRowFragment}discounts{__typename...orderPriceDetailRowFragment}taxTotal{__typename...orderPriceDetailRowFragment}grandTotal{__typename...orderPriceDetailRowFragment}}fragment orderPriceDetailRowFragment on OrderPriceDetailRow{label displayValue value info{__typename title message}}fragment addressFragment on OrderAddress{addressString addressLineOne addressLineTwo state postalCode city}fragment ODPPickupInfo on OrderGroup{pickupInstructions pickupPerson{...person}alternatePickupPerson{...person}store{id name address{...addressFragment}}}fragment person on OrderPickupPerson{firstName lastName email}fragment ODPTippingInfo on OrderGroup{addTipMessage{...textFragment}driver{...DriverFragment}tipping{min{...price}max{...price}suggested{...price}preselected}subtotal{...price}}fragment orderActionFragment on Action{text url}fragment orderCustomer on OrderCustomer{id firstName lastName email isGuest isEmailRegistered}fragment OrderFieldsFragment on Order{__typename id version type customer{...orderCustomer}displayId idBarcodeImageUrl(barWidth:3 barHeight:100) isFuelPurchase title shortTitle timezone tippableGroup{...OrderGroupFragment}amendableGroup{id changeSlotIterationsLeft cutOffTimestamp fulfillmentType deliveryAddress{fullName firstName lastName address{addressString addressLineOne addressLineTwo state postalCode city country}}isAmendInProgress}substitutionsBanner{heading subheading longSubheading}groups_2101{__typename...OrderGroupFragment...ODPGroupFragment...ODPPickupInfo...ODPTippingInfo}multiboxBundles{...orderLineItem}itemCancelReasons{__typename...cancelReason}groupCancelReasons{__typename...cancelReason}priceDetails{__typename subTotal{__typename...priceDetailFragment}taxTotal{__typename...priceDetailFragment}grandTotal{__typename...priceDetailFragment}authorizationAmount{__typename...priceDetailFragment}fees{__typename...priceDetailFragment}discounts{__typename...priceDetailFragment}minimumThreshold{__typename...price}belowMinimumFee{__typename...priceDetailFragment}driverTip{__typename...priceDetailFragment}donations{__typename...priceDetailFragment}}paymentMethods{__typename description cardType paymentType displayValues message{...textFragment}actions{connectToCapitalOne{...orderActionFragment}visitAffirm{...orderActionFragment}}}actions{__typename return pendingReturn cancel startReturn{...orderActionFragment}reorder}banners{...textFragment}}","variables":{"orderId":"3382219468143","emailAddress":"sophabel255@gmail.com"}}' \
  --compressed`
 
  if [[ $curl26 =~ "blocked" ]]; then
    link26=`echo $curl26 | jq '.redirectUrl' | sed 's/"//g'`
    `open -n -a /Applications/Microsoft\ Edge.app --args --profile-directory=Default https://walmart.com$link26`
    read -n 1 -p "blocked"
  else
    break
  fi
done

if [[ $curl26 =~ "error" ]]; then
    echo "26-Sai info"
    echo "'3382219468143" >> track-OrderID.txt
    echo "sophabel255@gmail.com" >> track-email.txt
    echo "Sai info" >> track-usItemId.txt
    echo "Sai info" >> track-priceValue.txt
    echo "Sai info" >> track-fullName.txt
    echo "Sai info" >> track-address.txt
    echo "Sai info" >> track-status.txt
    echo "Sai info" >> track-number.txt
    echo "Sai info" >> track-url.txt
    echo "Sai info" >> track-categoriesType.txt
else
    sum26=`md5 track-OrderID.txt`
    for (( i=0; i<=4; i++ ))
    do
        for (( j=0; j<=4; j++))
        do
            if [[ `echo $curl26 | jq '.data.guestOrder.groups_2101['${i[@]}'].items['${j[@]}'].productInfo.usItemId'` == '"151276839"' ]]; then
                echo "'3382219468143" >> track-OrderID.txt
                echo sophabel255@gmail.com >> track-email.txt
                echo $curl26 | jq '.data.guestOrder.groups_2101['${i[@]}'].items['${j[@]}'].productInfo.usItemId' >> track-usItemId.txt
                echo $curl26 | jq '.data.guestOrder.groups_2101['${i[@]}'].items['${j[@]}'].priceInfo.linePrice.value' >> track-priceValue.txt
                echo $curl26 | jq '.data.guestOrder.groups_2101['${i[@]}'].deliveryAddress.fullName' >> track-fullName.txt
                echo $curl26 | jq '.data.guestOrder.groups_2101['${i[@]}'].deliveryAddress.address.addressString' >> track-address.txt
                echo $curl26 | jq '.data.guestOrder.groups_2101['${i[@]}'].status.message.parts[].text' >> track-status.txt
                echo $curl26 | jq '.data.guestOrder.groups_2101['${i[@]}'].shipment.trackingNumber' | sed 's/null//g' >> track-number.txt
                echo $curl26 | jq '.data.guestOrder.groups_2101['${i[@]}'].shipment.trackingUrl' | sed 's/null//g' >> track-url.txt
                echo $curl26 | jq '.data.guestOrder.groups_2101['${i[@]}'].categories[].type' >> track-categoriesType.txt

                break
            fi
        done
    done
    if [[ $sum26 == `md5 track-OrderID.txt` ]]; then
        echo "26-Khác Item"
        echo "'3382219468143" >> track-OrderID.txt
        echo "sophabel255@gmail.com" >> track-email.txt
        echo "Khác Item" >> track-usItemId.txt
        echo "Khác Item" >> track-priceValue.txt
        echo "Khác Item" >> track-fullName.txt
        echo "Khác Item" >> track-address.txt
        echo "Khác Item" >> track-status.txt
        echo "Khác Item" >> track-number.txt
        echo "Khác Item" >> track-url.txt
        echo "Khác Item" >> track-categoriesType.txt
    else
        echo "26"
    fi   
fi
while true
do
curl27=`curl -s 'https://www.walmart.com/orchestra/home/graphql' \
  -H 'authority: www.walmart.com' \
  -H 'sec-ch-ua: " Not;A Brand";v="99", "Microsoft Edge";v="97", "Chromium";v="97"' \
  -H 'x-o-platform: rweb' \
  -H 'dnt: 1' \
  -H 'x-o-correlation-id: pn9BnlEx0zDiyvRGJ6nL5BS9pDN7erB017Nf' \
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
  -H 'user-agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.51 Safari/537.36 Edg/99.0.1150.36' \
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
  --data-raw $'{"query":"query getGuestOrder($orderId:ID\u0021 $emailAddress:String\u0021){guestOrder(input:{id:$orderId emailAddress:$emailAddress}){...OrderFieldsFragment}}fragment cancelReason on OrderCancelReason{__typename subReasonCode subDescription}fragment priceDetailFragment on OrderPriceDetailRow{label value displayValue info{title message}rowInfo{...orderPriceDetailRowInfo}}fragment orderPriceDetailRowInfo on OrderPriceDetailRowInfo{title message{...textFragment}}fragment price on Price{displayValue value}fragment variants on MapEntry{name value}fragment OrderAddOn on OrderAddOn{lineId uniqueLineId productInfo{name usItemId offerId}quantityString quantityLabel type fulfillmentInstructions{...textFragment}actions{manageProtectionPlan{...orderActionFragment}cancel}priceInfo{linePrice{...price}}quantity isActive}fragment orderDonationDetails on OrderDonationDetails{message{...textFragment}emailReceipt emailReceiptToken status{...textFragment}errorStatus}fragment orderLineItem on OrderLineItem{id uniqueId actions{contactSeller cancel addToCart configureCake reviewItem resendEGiftCardToken protectionPlan{...orderActionFragment}manageProtectionPlan{...orderActionFragment}}isGift digitalDeliveryMessage quantity quantityString quantityLabel isSubstitutionSelected fulfilledItems{id quantityString priceInfo{itemPrice{value}}productInfo{usItemId name}}isReturnable returnEligibilityMessage productInfo{name usItemId imageInfo{thumbnailUrl}canonicalUrl offerId orderLimit orderMinLimit weightIncrement salesUnit salesUnitType isSubstitutionEligible isAlcohol}reshop{reshopMessage isShippingAvailable minPromiseDate maxPromiseDate}selectedVariants{...variants}variantAdditionalInfo{parts{text nativeAction}}priceInfo{priceDisplayCodes{showItemPrice priceDisplayCondition finalCostByWeight}itemPrice{...price}linePrice{...price}unitPrice{...price}preDiscountedLinePrice{...price}additionalLines{name value}}discounts{label labelText{...textFragment}}itemReviewed activationCodes{label code}protectionPlanMessage{...textFragment}showSeller isShippedByWalmart seller{id name isPro}digitalDeliveryPhoneNumber addOns{...OrderAddOn}multiboxBundleId}fragment DriverFragment on Driver{id firstName photoUrl}fragment OrderGroupFragment on OrderGroup{driver{...DriverFragment}deliveryDate fulfillmentType status{...OrderGroupStatusFragment}showSeller isShippedByWalmart seller{...SellerFragment}id itemCount items{...LiteLineItemFragment}pickupPerson{firstName lastName email}accessPointId shipment{...ShipmentFragment}returnEligibilityMessage actions{...OrderGroupActionsFragment}recipientEmailAddress digitalDelivery{...DigitalDeliveryFragment}tireInstallationReservation{status extraText reservationId}}fragment OrderGroupStatusFragment on OrderGroupStatus{statusType showStatusTracker statusTracker{status label isCurrent}message{...textFragment}subtext subMessage{...textFragment}notice helpCenterText{...textFragment}}fragment textFragment on Text{parts{bold url text nativeAction lineBreak}}fragment LiteLineItemFragment on OrderLineItem{id quantity productInfo{name usItemId imageInfo{thumbnailUrl}offerId isAlcohol}priceInfo{linePrice{...price}}}fragment SellerFragment on GroupSeller{id name isPro}fragment DigitalDeliveryFragment on DigitalDelivery{title name instructions{...textFragment}}fragment ShipmentFragment on Shipment{id trackingNumber isExternalTracking trackingUrl proofOfDelivery{...ProofOfDeliveryFragment}}fragment OrderGroupActionsFragment on OrderGroupActions{reorder edit track changeSlot checkin editDeliveryInstructions editPickupPerson editTip tip rateDriver cancel enableTip{...orderActionFragment}enableEdit{...orderActionFragment}rescheduleTireInstall{...orderActionFragment}cancelTireInstall{...orderActionFragment}help viewCancellationDetails{...cancellationDetailsActionFragment}}fragment cancellationDetailsActionFragment on CancellationDetailsAction{label heading text{...textFragment}}fragment ProofOfDeliveryFragment on ProofOfDelivery{photoUrl photoPreviewUrl showPreview}fragment DeliveryInstructionsFragment on DeliveryInstructions{text type typeText}fragment GiftDetailsFragment on GiftDetails{recipientAddress{fullName}recipientEmail senderName giftMessage}fragment SubstitutionAction on SubstitutionAction{message label type}fragment ODPGroupCategoryFragment on OrderCategory{type name subtext returnMessage substitutionsBanner{...textFragment}showExtendedSubstitutions actions{substitutions{...SubstitutionAction}nilPickReshop{message action{text url}}returnDetails viewCancellationDetails{...cancellationDetailsActionFragment}trackOnInHomeApp}banner{...textFragment}accordionState items{...orderLineItem}substitutions{...orderLineItem fulfilledItems{...orderLineItem}}returnInfo{...returnInfoFragment}}fragment ODPGroupFragment on OrderGroup{id fulfillmentType deliveryMessage deliveryAddress{fullName firstName lastName address{...addressFragment}}deliveryInstructions{...DeliveryInstructionsFragment}deliveryPreferences{text{...textFragment}cta{...orderActionFragment}}editSubstitutionsCutOff status{statusType showStatusTracker message{...textFragment}notice helpCenterText{...textFragment}}itemCount isCategorized categories{...ODPGroupCategoryFragment}seller{id name isPro}shipment{id trackingNumber}actions{reorder edit track changeSlot checkin editDeliveryInstructions editPickupPerson tip cancel help enableTip{...orderActionFragment}enableEdit{...orderActionFragment}viewCancellationDetails{...cancellationDetailsActionFragment}enableInHome{...orderActionFragment}createGiftReceipt}cutOffTimestamp isEditSubstitutionsEligible isInHome giftDetails{...GiftDetailsFragment}donationDetails{...orderDonationDetails}}fragment returnInfoFragment on ReturnInfo{returnOrderId type refundPriceDetails{__typename...refundPriceDetailsFragment}refundMessage tierRefundMessage paymentMethods{__typename description cardType paymentType displayValues message{...textFragment}}actions{__typename generate scheduleOrModifyPickup{text url}reschedulePickup editPickupContact}shippingLabelUrl qrCodeImageUrl carriers{__typename id name}pickupCarrier pickupContact{nameAndAddress{fullName firstName lastName address{addressString city state postalCode addressLineOne addressLineTwo country}}phone}pickupConfirmationNumber bannerMessage{...textFragment}}fragment refundPriceDetailsFragment on RefundPriceDetails{subTotal{__typename...orderPriceDetailRowFragment}fees{__typename...orderPriceDetailRowFragment}discounts{__typename...orderPriceDetailRowFragment}taxTotal{__typename...orderPriceDetailRowFragment}grandTotal{__typename...orderPriceDetailRowFragment}}fragment orderPriceDetailRowFragment on OrderPriceDetailRow{label displayValue value info{__typename title message}}fragment addressFragment on OrderAddress{addressString addressLineOne addressLineTwo state postalCode city}fragment ODPPickupInfo on OrderGroup{pickupInstructions pickupPerson{...person}alternatePickupPerson{...person}store{id name address{...addressFragment}}}fragment person on OrderPickupPerson{firstName lastName email}fragment ODPTippingInfo on OrderGroup{addTipMessage{...textFragment}driver{...DriverFragment}tipping{min{...price}max{...price}suggested{...price}preselected}subtotal{...price}}fragment orderActionFragment on Action{text url}fragment orderCustomer on OrderCustomer{id firstName lastName email isGuest isEmailRegistered}fragment OrderFieldsFragment on Order{__typename id version type customer{...orderCustomer}displayId idBarcodeImageUrl(barWidth:3 barHeight:100) isFuelPurchase title shortTitle timezone tippableGroup{...OrderGroupFragment}amendableGroup{id changeSlotIterationsLeft cutOffTimestamp fulfillmentType deliveryAddress{fullName firstName lastName address{addressString addressLineOne addressLineTwo state postalCode city country}}isAmendInProgress}substitutionsBanner{heading subheading longSubheading}groups_2101{__typename...OrderGroupFragment...ODPGroupFragment...ODPPickupInfo...ODPTippingInfo}multiboxBundles{...orderLineItem}itemCancelReasons{__typename...cancelReason}groupCancelReasons{__typename...cancelReason}priceDetails{__typename subTotal{__typename...priceDetailFragment}taxTotal{__typename...priceDetailFragment}grandTotal{__typename...priceDetailFragment}authorizationAmount{__typename...priceDetailFragment}fees{__typename...priceDetailFragment}discounts{__typename...priceDetailFragment}minimumThreshold{__typename...price}belowMinimumFee{__typename...priceDetailFragment}driverTip{__typename...priceDetailFragment}donations{__typename...priceDetailFragment}}paymentMethods{__typename description cardType paymentType displayValues message{...textFragment}actions{connectToCapitalOne{...orderActionFragment}visitAffirm{...orderActionFragment}}}actions{__typename return pendingReturn cancel startReturn{...orderActionFragment}reorder}banners{...textFragment}}","variables":{"orderId":"3392221531295","emailAddress":"kelly.natalie702@gmail.com"}}' \
  --compressed`
 
  if [[ $curl27 =~ "blocked" ]]; then
    link27=`echo $curl27 | jq '.redirectUrl' | sed 's/"//g'`
    `open -n -a /Applications/Microsoft\ Edge.app --args --profile-directory=Default https://walmart.com$link27`
    read -n 1 -p "blocked"
  else
    break
  fi
done

if [[ $curl27 =~ "error" ]]; then
    echo "27-Sai info"
    echo "'3392221531295" >> track-OrderID.txt
    echo "kelly.natalie702@gmail.com" >> track-email.txt
    echo "Sai info" >> track-usItemId.txt
    echo "Sai info" >> track-priceValue.txt
    echo "Sai info" >> track-fullName.txt
    echo "Sai info" >> track-address.txt
    echo "Sai info" >> track-status.txt
    echo "Sai info" >> track-number.txt
    echo "Sai info" >> track-url.txt
    echo "Sai info" >> track-categoriesType.txt
else
    sum27=`md5 track-OrderID.txt`
    for (( i=0; i<=4; i++ ))
    do
        for (( j=0; j<=4; j++))
        do
            if [[ `echo $curl27 | jq '.data.guestOrder.groups_2101['${i[@]}'].items['${j[@]}'].productInfo.usItemId'` == '"689830322"' ]]; then
                echo "'3392221531295" >> track-OrderID.txt
                echo kelly.natalie702@gmail.com >> track-email.txt
                echo $curl27 | jq '.data.guestOrder.groups_2101['${i[@]}'].items['${j[@]}'].productInfo.usItemId' >> track-usItemId.txt
                echo $curl27 | jq '.data.guestOrder.groups_2101['${i[@]}'].items['${j[@]}'].priceInfo.linePrice.value' >> track-priceValue.txt
                echo $curl27 | jq '.data.guestOrder.groups_2101['${i[@]}'].deliveryAddress.fullName' >> track-fullName.txt
                echo $curl27 | jq '.data.guestOrder.groups_2101['${i[@]}'].deliveryAddress.address.addressString' >> track-address.txt
                echo $curl27 | jq '.data.guestOrder.groups_2101['${i[@]}'].status.message.parts[].text' >> track-status.txt
                echo $curl27 | jq '.data.guestOrder.groups_2101['${i[@]}'].shipment.trackingNumber' | sed 's/null//g' >> track-number.txt
                echo $curl27 | jq '.data.guestOrder.groups_2101['${i[@]}'].shipment.trackingUrl' | sed 's/null//g' >> track-url.txt
                echo $curl27 | jq '.data.guestOrder.groups_2101['${i[@]}'].categories[].type' >> track-categoriesType.txt

                break
            fi
        done
    done
    if [[ $sum27 == `md5 track-OrderID.txt` ]]; then
        echo "27-Khác Item"
        echo "'3392221531295" >> track-OrderID.txt
        echo "kelly.natalie702@gmail.com" >> track-email.txt
        echo "Khác Item" >> track-usItemId.txt
        echo "Khác Item" >> track-priceValue.txt
        echo "Khác Item" >> track-fullName.txt
        echo "Khác Item" >> track-address.txt
        echo "Khác Item" >> track-status.txt
        echo "Khác Item" >> track-number.txt
        echo "Khác Item" >> track-url.txt
        echo "Khác Item" >> track-categoriesType.txt
    else
        echo "27"
    fi   
fi
while true
do
curl28=`curl -s 'https://www.walmart.com/orchestra/home/graphql' \
  -H 'authority: www.walmart.com' \
  -H 'sec-ch-ua: " Not;A Brand";v="99", "Microsoft Edge";v="97", "Chromium";v="97"' \
  -H 'x-o-platform: rweb' \
  -H 'dnt: 1' \
  -H 'x-o-correlation-id: pn9BnlEx0zDiyvRGJ6nL5BS9pDN7erB017Nf' \
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
  -H 'user-agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.51 Safari/537.36 Edg/99.0.1150.36' \
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
  --data-raw $'{"query":"query getGuestOrder($orderId:ID\u0021 $emailAddress:String\u0021){guestOrder(input:{id:$orderId emailAddress:$emailAddress}){...OrderFieldsFragment}}fragment cancelReason on OrderCancelReason{__typename subReasonCode subDescription}fragment priceDetailFragment on OrderPriceDetailRow{label value displayValue info{title message}rowInfo{...orderPriceDetailRowInfo}}fragment orderPriceDetailRowInfo on OrderPriceDetailRowInfo{title message{...textFragment}}fragment price on Price{displayValue value}fragment variants on MapEntry{name value}fragment OrderAddOn on OrderAddOn{lineId uniqueLineId productInfo{name usItemId offerId}quantityString quantityLabel type fulfillmentInstructions{...textFragment}actions{manageProtectionPlan{...orderActionFragment}cancel}priceInfo{linePrice{...price}}quantity isActive}fragment orderDonationDetails on OrderDonationDetails{message{...textFragment}emailReceipt emailReceiptToken status{...textFragment}errorStatus}fragment orderLineItem on OrderLineItem{id uniqueId actions{contactSeller cancel addToCart configureCake reviewItem resendEGiftCardToken protectionPlan{...orderActionFragment}manageProtectionPlan{...orderActionFragment}}isGift digitalDeliveryMessage quantity quantityString quantityLabel isSubstitutionSelected fulfilledItems{id quantityString priceInfo{itemPrice{value}}productInfo{usItemId name}}isReturnable returnEligibilityMessage productInfo{name usItemId imageInfo{thumbnailUrl}canonicalUrl offerId orderLimit orderMinLimit weightIncrement salesUnit salesUnitType isSubstitutionEligible isAlcohol}reshop{reshopMessage isShippingAvailable minPromiseDate maxPromiseDate}selectedVariants{...variants}variantAdditionalInfo{parts{text nativeAction}}priceInfo{priceDisplayCodes{showItemPrice priceDisplayCondition finalCostByWeight}itemPrice{...price}linePrice{...price}unitPrice{...price}preDiscountedLinePrice{...price}additionalLines{name value}}discounts{label labelText{...textFragment}}itemReviewed activationCodes{label code}protectionPlanMessage{...textFragment}showSeller isShippedByWalmart seller{id name isPro}digitalDeliveryPhoneNumber addOns{...OrderAddOn}multiboxBundleId}fragment DriverFragment on Driver{id firstName photoUrl}fragment OrderGroupFragment on OrderGroup{driver{...DriverFragment}deliveryDate fulfillmentType status{...OrderGroupStatusFragment}showSeller isShippedByWalmart seller{...SellerFragment}id itemCount items{...LiteLineItemFragment}pickupPerson{firstName lastName email}accessPointId shipment{...ShipmentFragment}returnEligibilityMessage actions{...OrderGroupActionsFragment}recipientEmailAddress digitalDelivery{...DigitalDeliveryFragment}tireInstallationReservation{status extraText reservationId}}fragment OrderGroupStatusFragment on OrderGroupStatus{statusType showStatusTracker statusTracker{status label isCurrent}message{...textFragment}subtext subMessage{...textFragment}notice helpCenterText{...textFragment}}fragment textFragment on Text{parts{bold url text nativeAction lineBreak}}fragment LiteLineItemFragment on OrderLineItem{id quantity productInfo{name usItemId imageInfo{thumbnailUrl}offerId isAlcohol}priceInfo{linePrice{...price}}}fragment SellerFragment on GroupSeller{id name isPro}fragment DigitalDeliveryFragment on DigitalDelivery{title name instructions{...textFragment}}fragment ShipmentFragment on Shipment{id trackingNumber isExternalTracking trackingUrl proofOfDelivery{...ProofOfDeliveryFragment}}fragment OrderGroupActionsFragment on OrderGroupActions{reorder edit track changeSlot checkin editDeliveryInstructions editPickupPerson editTip tip rateDriver cancel enableTip{...orderActionFragment}enableEdit{...orderActionFragment}rescheduleTireInstall{...orderActionFragment}cancelTireInstall{...orderActionFragment}help viewCancellationDetails{...cancellationDetailsActionFragment}}fragment cancellationDetailsActionFragment on CancellationDetailsAction{label heading text{...textFragment}}fragment ProofOfDeliveryFragment on ProofOfDelivery{photoUrl photoPreviewUrl showPreview}fragment DeliveryInstructionsFragment on DeliveryInstructions{text type typeText}fragment GiftDetailsFragment on GiftDetails{recipientAddress{fullName}recipientEmail senderName giftMessage}fragment SubstitutionAction on SubstitutionAction{message label type}fragment ODPGroupCategoryFragment on OrderCategory{type name subtext returnMessage substitutionsBanner{...textFragment}showExtendedSubstitutions actions{substitutions{...SubstitutionAction}nilPickReshop{message action{text url}}returnDetails viewCancellationDetails{...cancellationDetailsActionFragment}trackOnInHomeApp}banner{...textFragment}accordionState items{...orderLineItem}substitutions{...orderLineItem fulfilledItems{...orderLineItem}}returnInfo{...returnInfoFragment}}fragment ODPGroupFragment on OrderGroup{id fulfillmentType deliveryMessage deliveryAddress{fullName firstName lastName address{...addressFragment}}deliveryInstructions{...DeliveryInstructionsFragment}deliveryPreferences{text{...textFragment}cta{...orderActionFragment}}editSubstitutionsCutOff status{statusType showStatusTracker message{...textFragment}notice helpCenterText{...textFragment}}itemCount isCategorized categories{...ODPGroupCategoryFragment}seller{id name isPro}shipment{id trackingNumber}actions{reorder edit track changeSlot checkin editDeliveryInstructions editPickupPerson tip cancel help enableTip{...orderActionFragment}enableEdit{...orderActionFragment}viewCancellationDetails{...cancellationDetailsActionFragment}enableInHome{...orderActionFragment}createGiftReceipt}cutOffTimestamp isEditSubstitutionsEligible isInHome giftDetails{...GiftDetailsFragment}donationDetails{...orderDonationDetails}}fragment returnInfoFragment on ReturnInfo{returnOrderId type refundPriceDetails{__typename...refundPriceDetailsFragment}refundMessage tierRefundMessage paymentMethods{__typename description cardType paymentType displayValues message{...textFragment}}actions{__typename generate scheduleOrModifyPickup{text url}reschedulePickup editPickupContact}shippingLabelUrl qrCodeImageUrl carriers{__typename id name}pickupCarrier pickupContact{nameAndAddress{fullName firstName lastName address{addressString city state postalCode addressLineOne addressLineTwo country}}phone}pickupConfirmationNumber bannerMessage{...textFragment}}fragment refundPriceDetailsFragment on RefundPriceDetails{subTotal{__typename...orderPriceDetailRowFragment}fees{__typename...orderPriceDetailRowFragment}discounts{__typename...orderPriceDetailRowFragment}taxTotal{__typename...orderPriceDetailRowFragment}grandTotal{__typename...orderPriceDetailRowFragment}}fragment orderPriceDetailRowFragment on OrderPriceDetailRow{label displayValue value info{__typename title message}}fragment addressFragment on OrderAddress{addressString addressLineOne addressLineTwo state postalCode city}fragment ODPPickupInfo on OrderGroup{pickupInstructions pickupPerson{...person}alternatePickupPerson{...person}store{id name address{...addressFragment}}}fragment person on OrderPickupPerson{firstName lastName email}fragment ODPTippingInfo on OrderGroup{addTipMessage{...textFragment}driver{...DriverFragment}tipping{min{...price}max{...price}suggested{...price}preselected}subtotal{...price}}fragment orderActionFragment on Action{text url}fragment orderCustomer on OrderCustomer{id firstName lastName email isGuest isEmailRegistered}fragment OrderFieldsFragment on Order{__typename id version type customer{...orderCustomer}displayId idBarcodeImageUrl(barWidth:3 barHeight:100) isFuelPurchase title shortTitle timezone tippableGroup{...OrderGroupFragment}amendableGroup{id changeSlotIterationsLeft cutOffTimestamp fulfillmentType deliveryAddress{fullName firstName lastName address{addressString addressLineOne addressLineTwo state postalCode city country}}isAmendInProgress}substitutionsBanner{heading subheading longSubheading}groups_2101{__typename...OrderGroupFragment...ODPGroupFragment...ODPPickupInfo...ODPTippingInfo}multiboxBundles{...orderLineItem}itemCancelReasons{__typename...cancelReason}groupCancelReasons{__typename...cancelReason}priceDetails{__typename subTotal{__typename...priceDetailFragment}taxTotal{__typename...priceDetailFragment}grandTotal{__typename...priceDetailFragment}authorizationAmount{__typename...priceDetailFragment}fees{__typename...priceDetailFragment}discounts{__typename...priceDetailFragment}minimumThreshold{__typename...price}belowMinimumFee{__typename...priceDetailFragment}driverTip{__typename...priceDetailFragment}donations{__typename...priceDetailFragment}}paymentMethods{__typename description cardType paymentType displayValues message{...textFragment}actions{connectToCapitalOne{...orderActionFragment}visitAffirm{...orderActionFragment}}}actions{__typename return pendingReturn cancel startReturn{...orderActionFragment}reorder}banners{...textFragment}}","variables":{"orderId":"3392221869912","emailAddress":"sleighdan@gmail.com"}}' \
  --compressed`
 
  if [[ $curl28 =~ "blocked" ]]; then
    link28=`echo $curl28 | jq '.redirectUrl' | sed 's/"//g'`
    `open -n -a /Applications/Microsoft\ Edge.app --args --profile-directory=Default https://walmart.com$link28`
    read -n 1 -p "blocked"
  else
    break
  fi
done

if [[ $curl28 =~ "error" ]]; then
    echo "28-Sai info"
    echo "'3392221869912" >> track-OrderID.txt
    echo "sleighdan@gmail.com" >> track-email.txt
    echo "Sai info" >> track-usItemId.txt
    echo "Sai info" >> track-priceValue.txt
    echo "Sai info" >> track-fullName.txt
    echo "Sai info" >> track-address.txt
    echo "Sai info" >> track-status.txt
    echo "Sai info" >> track-number.txt
    echo "Sai info" >> track-url.txt
    echo "Sai info" >> track-categoriesType.txt
else
    sum28=`md5 track-OrderID.txt`
    for (( i=0; i<=4; i++ ))
    do
        for (( j=0; j<=4; j++))
        do
            if [[ `echo $curl28 | jq '.data.guestOrder.groups_2101['${i[@]}'].items['${j[@]}'].productInfo.usItemId'` == '"49001108"' ]]; then
                echo "'3392221869912" >> track-OrderID.txt
                echo sleighdan@gmail.com >> track-email.txt
                echo $curl28 | jq '.data.guestOrder.groups_2101['${i[@]}'].items['${j[@]}'].productInfo.usItemId' >> track-usItemId.txt
                echo $curl28 | jq '.data.guestOrder.groups_2101['${i[@]}'].items['${j[@]}'].priceInfo.linePrice.value' >> track-priceValue.txt
                echo $curl28 | jq '.data.guestOrder.groups_2101['${i[@]}'].deliveryAddress.fullName' >> track-fullName.txt
                echo $curl28 | jq '.data.guestOrder.groups_2101['${i[@]}'].deliveryAddress.address.addressString' >> track-address.txt
                echo $curl28 | jq '.data.guestOrder.groups_2101['${i[@]}'].status.message.parts[].text' >> track-status.txt
                echo $curl28 | jq '.data.guestOrder.groups_2101['${i[@]}'].shipment.trackingNumber' | sed 's/null//g' >> track-number.txt
                echo $curl28 | jq '.data.guestOrder.groups_2101['${i[@]}'].shipment.trackingUrl' | sed 's/null//g' >> track-url.txt
                echo $curl28 | jq '.data.guestOrder.groups_2101['${i[@]}'].categories[].type' >> track-categoriesType.txt

                break
            fi
        done
    done
    if [[ $sum28 == `md5 track-OrderID.txt` ]]; then
        echo "28-Khác Item"
        echo "'3392221869912" >> track-OrderID.txt
        echo "sleighdan@gmail.com" >> track-email.txt
        echo "Khác Item" >> track-usItemId.txt
        echo "Khác Item" >> track-priceValue.txt
        echo "Khác Item" >> track-fullName.txt
        echo "Khác Item" >> track-address.txt
        echo "Khác Item" >> track-status.txt
        echo "Khác Item" >> track-number.txt
        echo "Khác Item" >> track-url.txt
        echo "Khác Item" >> track-categoriesType.txt
    else
        echo "28"
    fi   
fi
while true
do
curl29=`curl -s 'https://www.walmart.com/orchestra/home/graphql' \
  -H 'authority: www.walmart.com' \
  -H 'sec-ch-ua: " Not;A Brand";v="99", "Microsoft Edge";v="97", "Chromium";v="97"' \
  -H 'x-o-platform: rweb' \
  -H 'dnt: 1' \
  -H 'x-o-correlation-id: pn9BnlEx0zDiyvRGJ6nL5BS9pDN7erB017Nf' \
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
  -H 'user-agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.51 Safari/537.36 Edg/99.0.1150.36' \
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
  --data-raw $'{"query":"query getGuestOrder($orderId:ID\u0021 $emailAddress:String\u0021){guestOrder(input:{id:$orderId emailAddress:$emailAddress}){...OrderFieldsFragment}}fragment cancelReason on OrderCancelReason{__typename subReasonCode subDescription}fragment priceDetailFragment on OrderPriceDetailRow{label value displayValue info{title message}rowInfo{...orderPriceDetailRowInfo}}fragment orderPriceDetailRowInfo on OrderPriceDetailRowInfo{title message{...textFragment}}fragment price on Price{displayValue value}fragment variants on MapEntry{name value}fragment OrderAddOn on OrderAddOn{lineId uniqueLineId productInfo{name usItemId offerId}quantityString quantityLabel type fulfillmentInstructions{...textFragment}actions{manageProtectionPlan{...orderActionFragment}cancel}priceInfo{linePrice{...price}}quantity isActive}fragment orderDonationDetails on OrderDonationDetails{message{...textFragment}emailReceipt emailReceiptToken status{...textFragment}errorStatus}fragment orderLineItem on OrderLineItem{id uniqueId actions{contactSeller cancel addToCart configureCake reviewItem resendEGiftCardToken protectionPlan{...orderActionFragment}manageProtectionPlan{...orderActionFragment}}isGift digitalDeliveryMessage quantity quantityString quantityLabel isSubstitutionSelected fulfilledItems{id quantityString priceInfo{itemPrice{value}}productInfo{usItemId name}}isReturnable returnEligibilityMessage productInfo{name usItemId imageInfo{thumbnailUrl}canonicalUrl offerId orderLimit orderMinLimit weightIncrement salesUnit salesUnitType isSubstitutionEligible isAlcohol}reshop{reshopMessage isShippingAvailable minPromiseDate maxPromiseDate}selectedVariants{...variants}variantAdditionalInfo{parts{text nativeAction}}priceInfo{priceDisplayCodes{showItemPrice priceDisplayCondition finalCostByWeight}itemPrice{...price}linePrice{...price}unitPrice{...price}preDiscountedLinePrice{...price}additionalLines{name value}}discounts{label labelText{...textFragment}}itemReviewed activationCodes{label code}protectionPlanMessage{...textFragment}showSeller isShippedByWalmart seller{id name isPro}digitalDeliveryPhoneNumber addOns{...OrderAddOn}multiboxBundleId}fragment DriverFragment on Driver{id firstName photoUrl}fragment OrderGroupFragment on OrderGroup{driver{...DriverFragment}deliveryDate fulfillmentType status{...OrderGroupStatusFragment}showSeller isShippedByWalmart seller{...SellerFragment}id itemCount items{...LiteLineItemFragment}pickupPerson{firstName lastName email}accessPointId shipment{...ShipmentFragment}returnEligibilityMessage actions{...OrderGroupActionsFragment}recipientEmailAddress digitalDelivery{...DigitalDeliveryFragment}tireInstallationReservation{status extraText reservationId}}fragment OrderGroupStatusFragment on OrderGroupStatus{statusType showStatusTracker statusTracker{status label isCurrent}message{...textFragment}subtext subMessage{...textFragment}notice helpCenterText{...textFragment}}fragment textFragment on Text{parts{bold url text nativeAction lineBreak}}fragment LiteLineItemFragment on OrderLineItem{id quantity productInfo{name usItemId imageInfo{thumbnailUrl}offerId isAlcohol}priceInfo{linePrice{...price}}}fragment SellerFragment on GroupSeller{id name isPro}fragment DigitalDeliveryFragment on DigitalDelivery{title name instructions{...textFragment}}fragment ShipmentFragment on Shipment{id trackingNumber isExternalTracking trackingUrl proofOfDelivery{...ProofOfDeliveryFragment}}fragment OrderGroupActionsFragment on OrderGroupActions{reorder edit track changeSlot checkin editDeliveryInstructions editPickupPerson editTip tip rateDriver cancel enableTip{...orderActionFragment}enableEdit{...orderActionFragment}rescheduleTireInstall{...orderActionFragment}cancelTireInstall{...orderActionFragment}help viewCancellationDetails{...cancellationDetailsActionFragment}}fragment cancellationDetailsActionFragment on CancellationDetailsAction{label heading text{...textFragment}}fragment ProofOfDeliveryFragment on ProofOfDelivery{photoUrl photoPreviewUrl showPreview}fragment DeliveryInstructionsFragment on DeliveryInstructions{text type typeText}fragment GiftDetailsFragment on GiftDetails{recipientAddress{fullName}recipientEmail senderName giftMessage}fragment SubstitutionAction on SubstitutionAction{message label type}fragment ODPGroupCategoryFragment on OrderCategory{type name subtext returnMessage substitutionsBanner{...textFragment}showExtendedSubstitutions actions{substitutions{...SubstitutionAction}nilPickReshop{message action{text url}}returnDetails viewCancellationDetails{...cancellationDetailsActionFragment}trackOnInHomeApp}banner{...textFragment}accordionState items{...orderLineItem}substitutions{...orderLineItem fulfilledItems{...orderLineItem}}returnInfo{...returnInfoFragment}}fragment ODPGroupFragment on OrderGroup{id fulfillmentType deliveryMessage deliveryAddress{fullName firstName lastName address{...addressFragment}}deliveryInstructions{...DeliveryInstructionsFragment}deliveryPreferences{text{...textFragment}cta{...orderActionFragment}}editSubstitutionsCutOff status{statusType showStatusTracker message{...textFragment}notice helpCenterText{...textFragment}}itemCount isCategorized categories{...ODPGroupCategoryFragment}seller{id name isPro}shipment{id trackingNumber}actions{reorder edit track changeSlot checkin editDeliveryInstructions editPickupPerson tip cancel help enableTip{...orderActionFragment}enableEdit{...orderActionFragment}viewCancellationDetails{...cancellationDetailsActionFragment}enableInHome{...orderActionFragment}createGiftReceipt}cutOffTimestamp isEditSubstitutionsEligible isInHome giftDetails{...GiftDetailsFragment}donationDetails{...orderDonationDetails}}fragment returnInfoFragment on ReturnInfo{returnOrderId type refundPriceDetails{__typename...refundPriceDetailsFragment}refundMessage tierRefundMessage paymentMethods{__typename description cardType paymentType displayValues message{...textFragment}}actions{__typename generate scheduleOrModifyPickup{text url}reschedulePickup editPickupContact}shippingLabelUrl qrCodeImageUrl carriers{__typename id name}pickupCarrier pickupContact{nameAndAddress{fullName firstName lastName address{addressString city state postalCode addressLineOne addressLineTwo country}}phone}pickupConfirmationNumber bannerMessage{...textFragment}}fragment refundPriceDetailsFragment on RefundPriceDetails{subTotal{__typename...orderPriceDetailRowFragment}fees{__typename...orderPriceDetailRowFragment}discounts{__typename...orderPriceDetailRowFragment}taxTotal{__typename...orderPriceDetailRowFragment}grandTotal{__typename...orderPriceDetailRowFragment}}fragment orderPriceDetailRowFragment on OrderPriceDetailRow{label displayValue value info{__typename title message}}fragment addressFragment on OrderAddress{addressString addressLineOne addressLineTwo state postalCode city}fragment ODPPickupInfo on OrderGroup{pickupInstructions pickupPerson{...person}alternatePickupPerson{...person}store{id name address{...addressFragment}}}fragment person on OrderPickupPerson{firstName lastName email}fragment ODPTippingInfo on OrderGroup{addTipMessage{...textFragment}driver{...DriverFragment}tipping{min{...price}max{...price}suggested{...price}preselected}subtotal{...price}}fragment orderActionFragment on Action{text url}fragment orderCustomer on OrderCustomer{id firstName lastName email isGuest isEmailRegistered}fragment OrderFieldsFragment on Order{__typename id version type customer{...orderCustomer}displayId idBarcodeImageUrl(barWidth:3 barHeight:100) isFuelPurchase title shortTitle timezone tippableGroup{...OrderGroupFragment}amendableGroup{id changeSlotIterationsLeft cutOffTimestamp fulfillmentType deliveryAddress{fullName firstName lastName address{addressString addressLineOne addressLineTwo state postalCode city country}}isAmendInProgress}substitutionsBanner{heading subheading longSubheading}groups_2101{__typename...OrderGroupFragment...ODPGroupFragment...ODPPickupInfo...ODPTippingInfo}multiboxBundles{...orderLineItem}itemCancelReasons{__typename...cancelReason}groupCancelReasons{__typename...cancelReason}priceDetails{__typename subTotal{__typename...priceDetailFragment}taxTotal{__typename...priceDetailFragment}grandTotal{__typename...priceDetailFragment}authorizationAmount{__typename...priceDetailFragment}fees{__typename...priceDetailFragment}discounts{__typename...priceDetailFragment}minimumThreshold{__typename...price}belowMinimumFee{__typename...priceDetailFragment}driverTip{__typename...priceDetailFragment}donations{__typename...priceDetailFragment}}paymentMethods{__typename description cardType paymentType displayValues message{...textFragment}actions{connectToCapitalOne{...orderActionFragment}visitAffirm{...orderActionFragment}}}actions{__typename return pendingReturn cancel startReturn{...orderActionFragment}reorder}banners{...textFragment}}","variables":{"orderId":"3382219755502","emailAddress":"cindihuston7@gmail.com"}}' \
  --compressed`
 
  if [[ $curl29 =~ "blocked" ]]; then
    link29=`echo $curl29 | jq '.redirectUrl' | sed 's/"//g'`
    `open -n -a /Applications/Microsoft\ Edge.app --args --profile-directory=Default https://walmart.com$link29`
    read -n 1 -p "blocked"
  else
    break
  fi
done

if [[ $curl29 =~ "error" ]]; then
    echo "29-Sai info"
    echo "'3382219755502" >> track-OrderID.txt
    echo "cindihuston7@gmail.com" >> track-email.txt
    echo "Sai info" >> track-usItemId.txt
    echo "Sai info" >> track-priceValue.txt
    echo "Sai info" >> track-fullName.txt
    echo "Sai info" >> track-address.txt
    echo "Sai info" >> track-status.txt
    echo "Sai info" >> track-number.txt
    echo "Sai info" >> track-url.txt
    echo "Sai info" >> track-categoriesType.txt
else
    sum29=`md5 track-OrderID.txt`
    for (( i=0; i<=4; i++ ))
    do
        for (( j=0; j<=4; j++))
        do
            if [[ `echo $curl29 | jq '.data.guestOrder.groups_2101['${i[@]}'].items['${j[@]}'].productInfo.usItemId'` == '"10752553"' ]]; then
                echo "'3382219755502" >> track-OrderID.txt
                echo cindihuston7@gmail.com >> track-email.txt
                echo $curl29 | jq '.data.guestOrder.groups_2101['${i[@]}'].items['${j[@]}'].productInfo.usItemId' >> track-usItemId.txt
                echo $curl29 | jq '.data.guestOrder.groups_2101['${i[@]}'].items['${j[@]}'].priceInfo.linePrice.value' >> track-priceValue.txt
                echo $curl29 | jq '.data.guestOrder.groups_2101['${i[@]}'].deliveryAddress.fullName' >> track-fullName.txt
                echo $curl29 | jq '.data.guestOrder.groups_2101['${i[@]}'].deliveryAddress.address.addressString' >> track-address.txt
                echo $curl29 | jq '.data.guestOrder.groups_2101['${i[@]}'].status.message.parts[].text' >> track-status.txt
                echo $curl29 | jq '.data.guestOrder.groups_2101['${i[@]}'].shipment.trackingNumber' | sed 's/null//g' >> track-number.txt
                echo $curl29 | jq '.data.guestOrder.groups_2101['${i[@]}'].shipment.trackingUrl' | sed 's/null//g' >> track-url.txt
                echo $curl29 | jq '.data.guestOrder.groups_2101['${i[@]}'].categories[].type' >> track-categoriesType.txt

                break
            fi
        done
    done
    if [[ $sum29 == `md5 track-OrderID.txt` ]]; then
        echo "29-Khác Item"
        echo "'3382219755502" >> track-OrderID.txt
        echo "cindihuston7@gmail.com" >> track-email.txt
        echo "Khác Item" >> track-usItemId.txt
        echo "Khác Item" >> track-priceValue.txt
        echo "Khác Item" >> track-fullName.txt
        echo "Khác Item" >> track-address.txt
        echo "Khác Item" >> track-status.txt
        echo "Khác Item" >> track-number.txt
        echo "Khác Item" >> track-url.txt
        echo "Khác Item" >> track-categoriesType.txt
    else
        echo "29"
    fi   
fi
while true
do
curl30=`curl -s 'https://www.walmart.com/orchestra/home/graphql' \
  -H 'authority: www.walmart.com' \
  -H 'sec-ch-ua: " Not;A Brand";v="99", "Microsoft Edge";v="97", "Chromium";v="97"' \
  -H 'x-o-platform: rweb' \
  -H 'dnt: 1' \
  -H 'x-o-correlation-id: pn9BnlEx0zDiyvRGJ6nL5BS9pDN7erB017Nf' \
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
  -H 'user-agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.51 Safari/537.36 Edg/99.0.1150.36' \
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
  --data-raw $'{"query":"query getGuestOrder($orderId:ID\u0021 $emailAddress:String\u0021){guestOrder(input:{id:$orderId emailAddress:$emailAddress}){...OrderFieldsFragment}}fragment cancelReason on OrderCancelReason{__typename subReasonCode subDescription}fragment priceDetailFragment on OrderPriceDetailRow{label value displayValue info{title message}rowInfo{...orderPriceDetailRowInfo}}fragment orderPriceDetailRowInfo on OrderPriceDetailRowInfo{title message{...textFragment}}fragment price on Price{displayValue value}fragment variants on MapEntry{name value}fragment OrderAddOn on OrderAddOn{lineId uniqueLineId productInfo{name usItemId offerId}quantityString quantityLabel type fulfillmentInstructions{...textFragment}actions{manageProtectionPlan{...orderActionFragment}cancel}priceInfo{linePrice{...price}}quantity isActive}fragment orderDonationDetails on OrderDonationDetails{message{...textFragment}emailReceipt emailReceiptToken status{...textFragment}errorStatus}fragment orderLineItem on OrderLineItem{id uniqueId actions{contactSeller cancel addToCart configureCake reviewItem resendEGiftCardToken protectionPlan{...orderActionFragment}manageProtectionPlan{...orderActionFragment}}isGift digitalDeliveryMessage quantity quantityString quantityLabel isSubstitutionSelected fulfilledItems{id quantityString priceInfo{itemPrice{value}}productInfo{usItemId name}}isReturnable returnEligibilityMessage productInfo{name usItemId imageInfo{thumbnailUrl}canonicalUrl offerId orderLimit orderMinLimit weightIncrement salesUnit salesUnitType isSubstitutionEligible isAlcohol}reshop{reshopMessage isShippingAvailable minPromiseDate maxPromiseDate}selectedVariants{...variants}variantAdditionalInfo{parts{text nativeAction}}priceInfo{priceDisplayCodes{showItemPrice priceDisplayCondition finalCostByWeight}itemPrice{...price}linePrice{...price}unitPrice{...price}preDiscountedLinePrice{...price}additionalLines{name value}}discounts{label labelText{...textFragment}}itemReviewed activationCodes{label code}protectionPlanMessage{...textFragment}showSeller isShippedByWalmart seller{id name isPro}digitalDeliveryPhoneNumber addOns{...OrderAddOn}multiboxBundleId}fragment DriverFragment on Driver{id firstName photoUrl}fragment OrderGroupFragment on OrderGroup{driver{...DriverFragment}deliveryDate fulfillmentType status{...OrderGroupStatusFragment}showSeller isShippedByWalmart seller{...SellerFragment}id itemCount items{...LiteLineItemFragment}pickupPerson{firstName lastName email}accessPointId shipment{...ShipmentFragment}returnEligibilityMessage actions{...OrderGroupActionsFragment}recipientEmailAddress digitalDelivery{...DigitalDeliveryFragment}tireInstallationReservation{status extraText reservationId}}fragment OrderGroupStatusFragment on OrderGroupStatus{statusType showStatusTracker statusTracker{status label isCurrent}message{...textFragment}subtext subMessage{...textFragment}notice helpCenterText{...textFragment}}fragment textFragment on Text{parts{bold url text nativeAction lineBreak}}fragment LiteLineItemFragment on OrderLineItem{id quantity productInfo{name usItemId imageInfo{thumbnailUrl}offerId isAlcohol}priceInfo{linePrice{...price}}}fragment SellerFragment on GroupSeller{id name isPro}fragment DigitalDeliveryFragment on DigitalDelivery{title name instructions{...textFragment}}fragment ShipmentFragment on Shipment{id trackingNumber isExternalTracking trackingUrl proofOfDelivery{...ProofOfDeliveryFragment}}fragment OrderGroupActionsFragment on OrderGroupActions{reorder edit track changeSlot checkin editDeliveryInstructions editPickupPerson editTip tip rateDriver cancel enableTip{...orderActionFragment}enableEdit{...orderActionFragment}rescheduleTireInstall{...orderActionFragment}cancelTireInstall{...orderActionFragment}help viewCancellationDetails{...cancellationDetailsActionFragment}}fragment cancellationDetailsActionFragment on CancellationDetailsAction{label heading text{...textFragment}}fragment ProofOfDeliveryFragment on ProofOfDelivery{photoUrl photoPreviewUrl showPreview}fragment DeliveryInstructionsFragment on DeliveryInstructions{text type typeText}fragment GiftDetailsFragment on GiftDetails{recipientAddress{fullName}recipientEmail senderName giftMessage}fragment SubstitutionAction on SubstitutionAction{message label type}fragment ODPGroupCategoryFragment on OrderCategory{type name subtext returnMessage substitutionsBanner{...textFragment}showExtendedSubstitutions actions{substitutions{...SubstitutionAction}nilPickReshop{message action{text url}}returnDetails viewCancellationDetails{...cancellationDetailsActionFragment}trackOnInHomeApp}banner{...textFragment}accordionState items{...orderLineItem}substitutions{...orderLineItem fulfilledItems{...orderLineItem}}returnInfo{...returnInfoFragment}}fragment ODPGroupFragment on OrderGroup{id fulfillmentType deliveryMessage deliveryAddress{fullName firstName lastName address{...addressFragment}}deliveryInstructions{...DeliveryInstructionsFragment}deliveryPreferences{text{...textFragment}cta{...orderActionFragment}}editSubstitutionsCutOff status{statusType showStatusTracker message{...textFragment}notice helpCenterText{...textFragment}}itemCount isCategorized categories{...ODPGroupCategoryFragment}seller{id name isPro}shipment{id trackingNumber}actions{reorder edit track changeSlot checkin editDeliveryInstructions editPickupPerson tip cancel help enableTip{...orderActionFragment}enableEdit{...orderActionFragment}viewCancellationDetails{...cancellationDetailsActionFragment}enableInHome{...orderActionFragment}createGiftReceipt}cutOffTimestamp isEditSubstitutionsEligible isInHome giftDetails{...GiftDetailsFragment}donationDetails{...orderDonationDetails}}fragment returnInfoFragment on ReturnInfo{returnOrderId type refundPriceDetails{__typename...refundPriceDetailsFragment}refundMessage tierRefundMessage paymentMethods{__typename description cardType paymentType displayValues message{...textFragment}}actions{__typename generate scheduleOrModifyPickup{text url}reschedulePickup editPickupContact}shippingLabelUrl qrCodeImageUrl carriers{__typename id name}pickupCarrier pickupContact{nameAndAddress{fullName firstName lastName address{addressString city state postalCode addressLineOne addressLineTwo country}}phone}pickupConfirmationNumber bannerMessage{...textFragment}}fragment refundPriceDetailsFragment on RefundPriceDetails{subTotal{__typename...orderPriceDetailRowFragment}fees{__typename...orderPriceDetailRowFragment}discounts{__typename...orderPriceDetailRowFragment}taxTotal{__typename...orderPriceDetailRowFragment}grandTotal{__typename...orderPriceDetailRowFragment}}fragment orderPriceDetailRowFragment on OrderPriceDetailRow{label displayValue value info{__typename title message}}fragment addressFragment on OrderAddress{addressString addressLineOne addressLineTwo state postalCode city}fragment ODPPickupInfo on OrderGroup{pickupInstructions pickupPerson{...person}alternatePickupPerson{...person}store{id name address{...addressFragment}}}fragment person on OrderPickupPerson{firstName lastName email}fragment ODPTippingInfo on OrderGroup{addTipMessage{...textFragment}driver{...DriverFragment}tipping{min{...price}max{...price}suggested{...price}preselected}subtotal{...price}}fragment orderActionFragment on Action{text url}fragment orderCustomer on OrderCustomer{id firstName lastName email isGuest isEmailRegistered}fragment OrderFieldsFragment on Order{__typename id version type customer{...orderCustomer}displayId idBarcodeImageUrl(barWidth:3 barHeight:100) isFuelPurchase title shortTitle timezone tippableGroup{...OrderGroupFragment}amendableGroup{id changeSlotIterationsLeft cutOffTimestamp fulfillmentType deliveryAddress{fullName firstName lastName address{addressString addressLineOne addressLineTwo state postalCode city country}}isAmendInProgress}substitutionsBanner{heading subheading longSubheading}groups_2101{__typename...OrderGroupFragment...ODPGroupFragment...ODPPickupInfo...ODPTippingInfo}multiboxBundles{...orderLineItem}itemCancelReasons{__typename...cancelReason}groupCancelReasons{__typename...cancelReason}priceDetails{__typename subTotal{__typename...priceDetailFragment}taxTotal{__typename...priceDetailFragment}grandTotal{__typename...priceDetailFragment}authorizationAmount{__typename...priceDetailFragment}fees{__typename...priceDetailFragment}discounts{__typename...priceDetailFragment}minimumThreshold{__typename...price}belowMinimumFee{__typename...priceDetailFragment}driverTip{__typename...priceDetailFragment}donations{__typename...priceDetailFragment}}paymentMethods{__typename description cardType paymentType displayValues message{...textFragment}actions{connectToCapitalOne{...orderActionFragment}visitAffirm{...orderActionFragment}}}actions{__typename return pendingReturn cancel startReturn{...orderActionFragment}reorder}banners{...textFragment}}","variables":{"orderId":"3302203146663","emailAddress":"crolly@cpapmyway.com"}}' \
  --compressed`
 
  if [[ $curl30 =~ "blocked" ]]; then
    link30=`echo $curl30 | jq '.redirectUrl' | sed 's/"//g'`
    `open -n -a /Applications/Microsoft\ Edge.app --args --profile-directory=Default https://walmart.com$link30`
    read -n 1 -p "blocked"
  else
    break
  fi
done

if [[ $curl30 =~ "error" ]]; then
    echo "30-Sai info"
    echo "'3302203146663" >> track-OrderID.txt
    echo "crolly@cpapmyway.com" >> track-email.txt
    echo "Sai info" >> track-usItemId.txt
    echo "Sai info" >> track-priceValue.txt
    echo "Sai info" >> track-fullName.txt
    echo "Sai info" >> track-address.txt
    echo "Sai info" >> track-status.txt
    echo "Sai info" >> track-number.txt
    echo "Sai info" >> track-url.txt
    echo "Sai info" >> track-categoriesType.txt
else
    sum30=`md5 track-OrderID.txt`
    for (( i=0; i<=4; i++ ))
    do
        for (( j=0; j<=4; j++))
        do
            if [[ `echo $curl30 | jq '.data.guestOrder.groups_2101['${i[@]}'].items['${j[@]}'].productInfo.usItemId'` == '"47062971"' ]]; then
                echo "'3302203146663" >> track-OrderID.txt
                echo crolly@cpapmyway.com >> track-email.txt
                echo $curl30 | jq '.data.guestOrder.groups_2101['${i[@]}'].items['${j[@]}'].productInfo.usItemId' >> track-usItemId.txt
                echo $curl30 | jq '.data.guestOrder.groups_2101['${i[@]}'].items['${j[@]}'].priceInfo.linePrice.value' >> track-priceValue.txt
                echo $curl30 | jq '.data.guestOrder.groups_2101['${i[@]}'].deliveryAddress.fullName' >> track-fullName.txt
                echo $curl30 | jq '.data.guestOrder.groups_2101['${i[@]}'].deliveryAddress.address.addressString' >> track-address.txt
                echo $curl30 | jq '.data.guestOrder.groups_2101['${i[@]}'].status.message.parts[].text' >> track-status.txt
                echo $curl30 | jq '.data.guestOrder.groups_2101['${i[@]}'].shipment.trackingNumber' | sed 's/null//g' >> track-number.txt
                echo $curl30 | jq '.data.guestOrder.groups_2101['${i[@]}'].shipment.trackingUrl' | sed 's/null//g' >> track-url.txt
                echo $curl30 | jq '.data.guestOrder.groups_2101['${i[@]}'].categories[].type' >> track-categoriesType.txt

                break
            fi
        done
    done
    if [[ $sum30 == `md5 track-OrderID.txt` ]]; then
        echo "30-Khác Item"
        echo "'3302203146663" >> track-OrderID.txt
        echo "crolly@cpapmyway.com" >> track-email.txt
        echo "Khác Item" >> track-usItemId.txt
        echo "Khác Item" >> track-priceValue.txt
        echo "Khác Item" >> track-fullName.txt
        echo "Khác Item" >> track-address.txt
        echo "Khác Item" >> track-status.txt
        echo "Khác Item" >> track-number.txt
        echo "Khác Item" >> track-url.txt
        echo "Khác Item" >> track-categoriesType.txt
    else
        echo "30"
    fi   
fi
while true
do
curl31=`curl -s 'https://www.walmart.com/orchestra/home/graphql' \
  -H 'authority: www.walmart.com' \
  -H 'sec-ch-ua: " Not;A Brand";v="99", "Microsoft Edge";v="97", "Chromium";v="97"' \
  -H 'x-o-platform: rweb' \
  -H 'dnt: 1' \
  -H 'x-o-correlation-id: pn9BnlEx0zDiyvRGJ6nL5BS9pDN7erB017Nf' \
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
  -H 'user-agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.51 Safari/537.36 Edg/99.0.1150.36' \
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
  --data-raw $'{"query":"query getGuestOrder($orderId:ID\u0021 $emailAddress:String\u0021){guestOrder(input:{id:$orderId emailAddress:$emailAddress}){...OrderFieldsFragment}}fragment cancelReason on OrderCancelReason{__typename subReasonCode subDescription}fragment priceDetailFragment on OrderPriceDetailRow{label value displayValue info{title message}rowInfo{...orderPriceDetailRowInfo}}fragment orderPriceDetailRowInfo on OrderPriceDetailRowInfo{title message{...textFragment}}fragment price on Price{displayValue value}fragment variants on MapEntry{name value}fragment OrderAddOn on OrderAddOn{lineId uniqueLineId productInfo{name usItemId offerId}quantityString quantityLabel type fulfillmentInstructions{...textFragment}actions{manageProtectionPlan{...orderActionFragment}cancel}priceInfo{linePrice{...price}}quantity isActive}fragment orderDonationDetails on OrderDonationDetails{message{...textFragment}emailReceipt emailReceiptToken status{...textFragment}errorStatus}fragment orderLineItem on OrderLineItem{id uniqueId actions{contactSeller cancel addToCart configureCake reviewItem resendEGiftCardToken protectionPlan{...orderActionFragment}manageProtectionPlan{...orderActionFragment}}isGift digitalDeliveryMessage quantity quantityString quantityLabel isSubstitutionSelected fulfilledItems{id quantityString priceInfo{itemPrice{value}}productInfo{usItemId name}}isReturnable returnEligibilityMessage productInfo{name usItemId imageInfo{thumbnailUrl}canonicalUrl offerId orderLimit orderMinLimit weightIncrement salesUnit salesUnitType isSubstitutionEligible isAlcohol}reshop{reshopMessage isShippingAvailable minPromiseDate maxPromiseDate}selectedVariants{...variants}variantAdditionalInfo{parts{text nativeAction}}priceInfo{priceDisplayCodes{showItemPrice priceDisplayCondition finalCostByWeight}itemPrice{...price}linePrice{...price}unitPrice{...price}preDiscountedLinePrice{...price}additionalLines{name value}}discounts{label labelText{...textFragment}}itemReviewed activationCodes{label code}protectionPlanMessage{...textFragment}showSeller isShippedByWalmart seller{id name isPro}digitalDeliveryPhoneNumber addOns{...OrderAddOn}multiboxBundleId}fragment DriverFragment on Driver{id firstName photoUrl}fragment OrderGroupFragment on OrderGroup{driver{...DriverFragment}deliveryDate fulfillmentType status{...OrderGroupStatusFragment}showSeller isShippedByWalmart seller{...SellerFragment}id itemCount items{...LiteLineItemFragment}pickupPerson{firstName lastName email}accessPointId shipment{...ShipmentFragment}returnEligibilityMessage actions{...OrderGroupActionsFragment}recipientEmailAddress digitalDelivery{...DigitalDeliveryFragment}tireInstallationReservation{status extraText reservationId}}fragment OrderGroupStatusFragment on OrderGroupStatus{statusType showStatusTracker statusTracker{status label isCurrent}message{...textFragment}subtext subMessage{...textFragment}notice helpCenterText{...textFragment}}fragment textFragment on Text{parts{bold url text nativeAction lineBreak}}fragment LiteLineItemFragment on OrderLineItem{id quantity productInfo{name usItemId imageInfo{thumbnailUrl}offerId isAlcohol}priceInfo{linePrice{...price}}}fragment SellerFragment on GroupSeller{id name isPro}fragment DigitalDeliveryFragment on DigitalDelivery{title name instructions{...textFragment}}fragment ShipmentFragment on Shipment{id trackingNumber isExternalTracking trackingUrl proofOfDelivery{...ProofOfDeliveryFragment}}fragment OrderGroupActionsFragment on OrderGroupActions{reorder edit track changeSlot checkin editDeliveryInstructions editPickupPerson editTip tip rateDriver cancel enableTip{...orderActionFragment}enableEdit{...orderActionFragment}rescheduleTireInstall{...orderActionFragment}cancelTireInstall{...orderActionFragment}help viewCancellationDetails{...cancellationDetailsActionFragment}}fragment cancellationDetailsActionFragment on CancellationDetailsAction{label heading text{...textFragment}}fragment ProofOfDeliveryFragment on ProofOfDelivery{photoUrl photoPreviewUrl showPreview}fragment DeliveryInstructionsFragment on DeliveryInstructions{text type typeText}fragment GiftDetailsFragment on GiftDetails{recipientAddress{fullName}recipientEmail senderName giftMessage}fragment SubstitutionAction on SubstitutionAction{message label type}fragment ODPGroupCategoryFragment on OrderCategory{type name subtext returnMessage substitutionsBanner{...textFragment}showExtendedSubstitutions actions{substitutions{...SubstitutionAction}nilPickReshop{message action{text url}}returnDetails viewCancellationDetails{...cancellationDetailsActionFragment}trackOnInHomeApp}banner{...textFragment}accordionState items{...orderLineItem}substitutions{...orderLineItem fulfilledItems{...orderLineItem}}returnInfo{...returnInfoFragment}}fragment ODPGroupFragment on OrderGroup{id fulfillmentType deliveryMessage deliveryAddress{fullName firstName lastName address{...addressFragment}}deliveryInstructions{...DeliveryInstructionsFragment}deliveryPreferences{text{...textFragment}cta{...orderActionFragment}}editSubstitutionsCutOff status{statusType showStatusTracker message{...textFragment}notice helpCenterText{...textFragment}}itemCount isCategorized categories{...ODPGroupCategoryFragment}seller{id name isPro}shipment{id trackingNumber}actions{reorder edit track changeSlot checkin editDeliveryInstructions editPickupPerson tip cancel help enableTip{...orderActionFragment}enableEdit{...orderActionFragment}viewCancellationDetails{...cancellationDetailsActionFragment}enableInHome{...orderActionFragment}createGiftReceipt}cutOffTimestamp isEditSubstitutionsEligible isInHome giftDetails{...GiftDetailsFragment}donationDetails{...orderDonationDetails}}fragment returnInfoFragment on ReturnInfo{returnOrderId type refundPriceDetails{__typename...refundPriceDetailsFragment}refundMessage tierRefundMessage paymentMethods{__typename description cardType paymentType displayValues message{...textFragment}}actions{__typename generate scheduleOrModifyPickup{text url}reschedulePickup editPickupContact}shippingLabelUrl qrCodeImageUrl carriers{__typename id name}pickupCarrier pickupContact{nameAndAddress{fullName firstName lastName address{addressString city state postalCode addressLineOne addressLineTwo country}}phone}pickupConfirmationNumber bannerMessage{...textFragment}}fragment refundPriceDetailsFragment on RefundPriceDetails{subTotal{__typename...orderPriceDetailRowFragment}fees{__typename...orderPriceDetailRowFragment}discounts{__typename...orderPriceDetailRowFragment}taxTotal{__typename...orderPriceDetailRowFragment}grandTotal{__typename...orderPriceDetailRowFragment}}fragment orderPriceDetailRowFragment on OrderPriceDetailRow{label displayValue value info{__typename title message}}fragment addressFragment on OrderAddress{addressString addressLineOne addressLineTwo state postalCode city}fragment ODPPickupInfo on OrderGroup{pickupInstructions pickupPerson{...person}alternatePickupPerson{...person}store{id name address{...addressFragment}}}fragment person on OrderPickupPerson{firstName lastName email}fragment ODPTippingInfo on OrderGroup{addTipMessage{...textFragment}driver{...DriverFragment}tipping{min{...price}max{...price}suggested{...price}preselected}subtotal{...price}}fragment orderActionFragment on Action{text url}fragment orderCustomer on OrderCustomer{id firstName lastName email isGuest isEmailRegistered}fragment OrderFieldsFragment on Order{__typename id version type customer{...orderCustomer}displayId idBarcodeImageUrl(barWidth:3 barHeight:100) isFuelPurchase title shortTitle timezone tippableGroup{...OrderGroupFragment}amendableGroup{id changeSlotIterationsLeft cutOffTimestamp fulfillmentType deliveryAddress{fullName firstName lastName address{addressString addressLineOne addressLineTwo state postalCode city country}}isAmendInProgress}substitutionsBanner{heading subheading longSubheading}groups_2101{__typename...OrderGroupFragment...ODPGroupFragment...ODPPickupInfo...ODPTippingInfo}multiboxBundles{...orderLineItem}itemCancelReasons{__typename...cancelReason}groupCancelReasons{__typename...cancelReason}priceDetails{__typename subTotal{__typename...priceDetailFragment}taxTotal{__typename...priceDetailFragment}grandTotal{__typename...priceDetailFragment}authorizationAmount{__typename...priceDetailFragment}fees{__typename...priceDetailFragment}discounts{__typename...priceDetailFragment}minimumThreshold{__typename...price}belowMinimumFee{__typename...priceDetailFragment}driverTip{__typename...priceDetailFragment}donations{__typename...priceDetailFragment}}paymentMethods{__typename description cardType paymentType displayValues message{...textFragment}actions{connectToCapitalOne{...orderActionFragment}visitAffirm{...orderActionFragment}}}actions{__typename return pendingReturn cancel startReturn{...orderActionFragment}reorder}banners{...textFragment}}","variables":{"orderId":"3382219771080","emailAddress":"kimberlywell@ymail.com"}}' \
  --compressed`
 
  if [[ $curl31 =~ "blocked" ]]; then
    link31=`echo $curl31 | jq '.redirectUrl' | sed 's/"//g'`
    `open -n -a /Applications/Microsoft\ Edge.app --args --profile-directory=Default https://walmart.com$link31`
    read -n 1 -p "blocked"
  else
    break
  fi
done

if [[ $curl31 =~ "error" ]]; then
    echo "31-Sai info"
    echo "'3382219771080" >> track-OrderID.txt
    echo "kimberlywell@ymail.com" >> track-email.txt
    echo "Sai info" >> track-usItemId.txt
    echo "Sai info" >> track-priceValue.txt
    echo "Sai info" >> track-fullName.txt
    echo "Sai info" >> track-address.txt
    echo "Sai info" >> track-status.txt
    echo "Sai info" >> track-number.txt
    echo "Sai info" >> track-url.txt
    echo "Sai info" >> track-categoriesType.txt
else
    sum31=`md5 track-OrderID.txt`
    for (( i=0; i<=4; i++ ))
    do
        for (( j=0; j<=4; j++))
        do
            if [[ `echo $curl31 | jq '.data.guestOrder.groups_2101['${i[@]}'].items['${j[@]}'].productInfo.usItemId'` == '"680614474"' ]]; then
                echo "'3382219771080" >> track-OrderID.txt
                echo kimberlywell@ymail.com >> track-email.txt
                echo $curl31 | jq '.data.guestOrder.groups_2101['${i[@]}'].items['${j[@]}'].productInfo.usItemId' >> track-usItemId.txt
                echo $curl31 | jq '.data.guestOrder.groups_2101['${i[@]}'].items['${j[@]}'].priceInfo.linePrice.value' >> track-priceValue.txt
                echo $curl31 | jq '.data.guestOrder.groups_2101['${i[@]}'].deliveryAddress.fullName' >> track-fullName.txt
                echo $curl31 | jq '.data.guestOrder.groups_2101['${i[@]}'].deliveryAddress.address.addressString' >> track-address.txt
                echo $curl31 | jq '.data.guestOrder.groups_2101['${i[@]}'].status.message.parts[].text' >> track-status.txt
                echo $curl31 | jq '.data.guestOrder.groups_2101['${i[@]}'].shipment.trackingNumber' | sed 's/null//g' >> track-number.txt
                echo $curl31 | jq '.data.guestOrder.groups_2101['${i[@]}'].shipment.trackingUrl' | sed 's/null//g' >> track-url.txt
                echo $curl31 | jq '.data.guestOrder.groups_2101['${i[@]}'].categories[].type' >> track-categoriesType.txt

                break
            fi
        done
    done
    if [[ $sum31 == `md5 track-OrderID.txt` ]]; then
        echo "31-Khác Item"
        echo "'3382219771080" >> track-OrderID.txt
        echo "kimberlywell@ymail.com" >> track-email.txt
        echo "Khác Item" >> track-usItemId.txt
        echo "Khác Item" >> track-priceValue.txt
        echo "Khác Item" >> track-fullName.txt
        echo "Khác Item" >> track-address.txt
        echo "Khác Item" >> track-status.txt
        echo "Khác Item" >> track-number.txt
        echo "Khác Item" >> track-url.txt
        echo "Khác Item" >> track-categoriesType.txt
    else
        echo "31"
    fi   
fi
while true
do
curl32=`curl -s 'https://www.walmart.com/orchestra/home/graphql' \
  -H 'authority: www.walmart.com' \
  -H 'sec-ch-ua: " Not;A Brand";v="99", "Microsoft Edge";v="97", "Chromium";v="97"' \
  -H 'x-o-platform: rweb' \
  -H 'dnt: 1' \
  -H 'x-o-correlation-id: pn9BnlEx0zDiyvRGJ6nL5BS9pDN7erB017Nf' \
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
  -H 'user-agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.51 Safari/537.36 Edg/99.0.1150.36' \
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
  --data-raw $'{"query":"query getGuestOrder($orderId:ID\u0021 $emailAddress:String\u0021){guestOrder(input:{id:$orderId emailAddress:$emailAddress}){...OrderFieldsFragment}}fragment cancelReason on OrderCancelReason{__typename subReasonCode subDescription}fragment priceDetailFragment on OrderPriceDetailRow{label value displayValue info{title message}rowInfo{...orderPriceDetailRowInfo}}fragment orderPriceDetailRowInfo on OrderPriceDetailRowInfo{title message{...textFragment}}fragment price on Price{displayValue value}fragment variants on MapEntry{name value}fragment OrderAddOn on OrderAddOn{lineId uniqueLineId productInfo{name usItemId offerId}quantityString quantityLabel type fulfillmentInstructions{...textFragment}actions{manageProtectionPlan{...orderActionFragment}cancel}priceInfo{linePrice{...price}}quantity isActive}fragment orderDonationDetails on OrderDonationDetails{message{...textFragment}emailReceipt emailReceiptToken status{...textFragment}errorStatus}fragment orderLineItem on OrderLineItem{id uniqueId actions{contactSeller cancel addToCart configureCake reviewItem resendEGiftCardToken protectionPlan{...orderActionFragment}manageProtectionPlan{...orderActionFragment}}isGift digitalDeliveryMessage quantity quantityString quantityLabel isSubstitutionSelected fulfilledItems{id quantityString priceInfo{itemPrice{value}}productInfo{usItemId name}}isReturnable returnEligibilityMessage productInfo{name usItemId imageInfo{thumbnailUrl}canonicalUrl offerId orderLimit orderMinLimit weightIncrement salesUnit salesUnitType isSubstitutionEligible isAlcohol}reshop{reshopMessage isShippingAvailable minPromiseDate maxPromiseDate}selectedVariants{...variants}variantAdditionalInfo{parts{text nativeAction}}priceInfo{priceDisplayCodes{showItemPrice priceDisplayCondition finalCostByWeight}itemPrice{...price}linePrice{...price}unitPrice{...price}preDiscountedLinePrice{...price}additionalLines{name value}}discounts{label labelText{...textFragment}}itemReviewed activationCodes{label code}protectionPlanMessage{...textFragment}showSeller isShippedByWalmart seller{id name isPro}digitalDeliveryPhoneNumber addOns{...OrderAddOn}multiboxBundleId}fragment DriverFragment on Driver{id firstName photoUrl}fragment OrderGroupFragment on OrderGroup{driver{...DriverFragment}deliveryDate fulfillmentType status{...OrderGroupStatusFragment}showSeller isShippedByWalmart seller{...SellerFragment}id itemCount items{...LiteLineItemFragment}pickupPerson{firstName lastName email}accessPointId shipment{...ShipmentFragment}returnEligibilityMessage actions{...OrderGroupActionsFragment}recipientEmailAddress digitalDelivery{...DigitalDeliveryFragment}tireInstallationReservation{status extraText reservationId}}fragment OrderGroupStatusFragment on OrderGroupStatus{statusType showStatusTracker statusTracker{status label isCurrent}message{...textFragment}subtext subMessage{...textFragment}notice helpCenterText{...textFragment}}fragment textFragment on Text{parts{bold url text nativeAction lineBreak}}fragment LiteLineItemFragment on OrderLineItem{id quantity productInfo{name usItemId imageInfo{thumbnailUrl}offerId isAlcohol}priceInfo{linePrice{...price}}}fragment SellerFragment on GroupSeller{id name isPro}fragment DigitalDeliveryFragment on DigitalDelivery{title name instructions{...textFragment}}fragment ShipmentFragment on Shipment{id trackingNumber isExternalTracking trackingUrl proofOfDelivery{...ProofOfDeliveryFragment}}fragment OrderGroupActionsFragment on OrderGroupActions{reorder edit track changeSlot checkin editDeliveryInstructions editPickupPerson editTip tip rateDriver cancel enableTip{...orderActionFragment}enableEdit{...orderActionFragment}rescheduleTireInstall{...orderActionFragment}cancelTireInstall{...orderActionFragment}help viewCancellationDetails{...cancellationDetailsActionFragment}}fragment cancellationDetailsActionFragment on CancellationDetailsAction{label heading text{...textFragment}}fragment ProofOfDeliveryFragment on ProofOfDelivery{photoUrl photoPreviewUrl showPreview}fragment DeliveryInstructionsFragment on DeliveryInstructions{text type typeText}fragment GiftDetailsFragment on GiftDetails{recipientAddress{fullName}recipientEmail senderName giftMessage}fragment SubstitutionAction on SubstitutionAction{message label type}fragment ODPGroupCategoryFragment on OrderCategory{type name subtext returnMessage substitutionsBanner{...textFragment}showExtendedSubstitutions actions{substitutions{...SubstitutionAction}nilPickReshop{message action{text url}}returnDetails viewCancellationDetails{...cancellationDetailsActionFragment}trackOnInHomeApp}banner{...textFragment}accordionState items{...orderLineItem}substitutions{...orderLineItem fulfilledItems{...orderLineItem}}returnInfo{...returnInfoFragment}}fragment ODPGroupFragment on OrderGroup{id fulfillmentType deliveryMessage deliveryAddress{fullName firstName lastName address{...addressFragment}}deliveryInstructions{...DeliveryInstructionsFragment}deliveryPreferences{text{...textFragment}cta{...orderActionFragment}}editSubstitutionsCutOff status{statusType showStatusTracker message{...textFragment}notice helpCenterText{...textFragment}}itemCount isCategorized categories{...ODPGroupCategoryFragment}seller{id name isPro}shipment{id trackingNumber}actions{reorder edit track changeSlot checkin editDeliveryInstructions editPickupPerson tip cancel help enableTip{...orderActionFragment}enableEdit{...orderActionFragment}viewCancellationDetails{...cancellationDetailsActionFragment}enableInHome{...orderActionFragment}createGiftReceipt}cutOffTimestamp isEditSubstitutionsEligible isInHome giftDetails{...GiftDetailsFragment}donationDetails{...orderDonationDetails}}fragment returnInfoFragment on ReturnInfo{returnOrderId type refundPriceDetails{__typename...refundPriceDetailsFragment}refundMessage tierRefundMessage paymentMethods{__typename description cardType paymentType displayValues message{...textFragment}}actions{__typename generate scheduleOrModifyPickup{text url}reschedulePickup editPickupContact}shippingLabelUrl qrCodeImageUrl carriers{__typename id name}pickupCarrier pickupContact{nameAndAddress{fullName firstName lastName address{addressString city state postalCode addressLineOne addressLineTwo country}}phone}pickupConfirmationNumber bannerMessage{...textFragment}}fragment refundPriceDetailsFragment on RefundPriceDetails{subTotal{__typename...orderPriceDetailRowFragment}fees{__typename...orderPriceDetailRowFragment}discounts{__typename...orderPriceDetailRowFragment}taxTotal{__typename...orderPriceDetailRowFragment}grandTotal{__typename...orderPriceDetailRowFragment}}fragment orderPriceDetailRowFragment on OrderPriceDetailRow{label displayValue value info{__typename title message}}fragment addressFragment on OrderAddress{addressString addressLineOne addressLineTwo state postalCode city}fragment ODPPickupInfo on OrderGroup{pickupInstructions pickupPerson{...person}alternatePickupPerson{...person}store{id name address{...addressFragment}}}fragment person on OrderPickupPerson{firstName lastName email}fragment ODPTippingInfo on OrderGroup{addTipMessage{...textFragment}driver{...DriverFragment}tipping{min{...price}max{...price}suggested{...price}preselected}subtotal{...price}}fragment orderActionFragment on Action{text url}fragment orderCustomer on OrderCustomer{id firstName lastName email isGuest isEmailRegistered}fragment OrderFieldsFragment on Order{__typename id version type customer{...orderCustomer}displayId idBarcodeImageUrl(barWidth:3 barHeight:100) isFuelPurchase title shortTitle timezone tippableGroup{...OrderGroupFragment}amendableGroup{id changeSlotIterationsLeft cutOffTimestamp fulfillmentType deliveryAddress{fullName firstName lastName address{addressString addressLineOne addressLineTwo state postalCode city country}}isAmendInProgress}substitutionsBanner{heading subheading longSubheading}groups_2101{__typename...OrderGroupFragment...ODPGroupFragment...ODPPickupInfo...ODPTippingInfo}multiboxBundles{...orderLineItem}itemCancelReasons{__typename...cancelReason}groupCancelReasons{__typename...cancelReason}priceDetails{__typename subTotal{__typename...priceDetailFragment}taxTotal{__typename...priceDetailFragment}grandTotal{__typename...priceDetailFragment}authorizationAmount{__typename...priceDetailFragment}fees{__typename...priceDetailFragment}discounts{__typename...priceDetailFragment}minimumThreshold{__typename...price}belowMinimumFee{__typename...priceDetailFragment}driverTip{__typename...priceDetailFragment}donations{__typename...priceDetailFragment}}paymentMethods{__typename description cardType paymentType displayValues message{...textFragment}actions{connectToCapitalOne{...orderActionFragment}visitAffirm{...orderActionFragment}}}actions{__typename return pendingReturn cancel startReturn{...orderActionFragment}reorder}banners{...textFragment}}","variables":{"orderId":"3392221278983","emailAddress":"ejay0880@gmail.com"}}' \
  --compressed`
 
  if [[ $curl32 =~ "blocked" ]]; then
    link32=`echo $curl32 | jq '.redirectUrl' | sed 's/"//g'`
    `open -n -a /Applications/Microsoft\ Edge.app --args --profile-directory=Default https://walmart.com$link32`
    read -n 1 -p "blocked"
  else
    break
  fi
done

if [[ $curl32 =~ "error" ]]; then
    echo "32-Sai info"
    echo "'3392221278983" >> track-OrderID.txt
    echo "ejay0880@gmail.com" >> track-email.txt
    echo "Sai info" >> track-usItemId.txt
    echo "Sai info" >> track-priceValue.txt
    echo "Sai info" >> track-fullName.txt
    echo "Sai info" >> track-address.txt
    echo "Sai info" >> track-status.txt
    echo "Sai info" >> track-number.txt
    echo "Sai info" >> track-url.txt
    echo "Sai info" >> track-categoriesType.txt
else
    sum32=`md5 track-OrderID.txt`
    for (( i=0; i<=4; i++ ))
    do
        for (( j=0; j<=4; j++))
        do
            if [[ `echo $curl32 | jq '.data.guestOrder.groups_2101['${i[@]}'].items['${j[@]}'].productInfo.usItemId'` == '"661171058"' ]]; then
                echo "'3392221278983" >> track-OrderID.txt
                echo ejay0880@gmail.com >> track-email.txt
                echo $curl32 | jq '.data.guestOrder.groups_2101['${i[@]}'].items['${j[@]}'].productInfo.usItemId' >> track-usItemId.txt
                echo $curl32 | jq '.data.guestOrder.groups_2101['${i[@]}'].items['${j[@]}'].priceInfo.linePrice.value' >> track-priceValue.txt
                echo $curl32 | jq '.data.guestOrder.groups_2101['${i[@]}'].deliveryAddress.fullName' >> track-fullName.txt
                echo $curl32 | jq '.data.guestOrder.groups_2101['${i[@]}'].deliveryAddress.address.addressString' >> track-address.txt
                echo $curl32 | jq '.data.guestOrder.groups_2101['${i[@]}'].status.message.parts[].text' >> track-status.txt
                echo $curl32 | jq '.data.guestOrder.groups_2101['${i[@]}'].shipment.trackingNumber' | sed 's/null//g' >> track-number.txt
                echo $curl32 | jq '.data.guestOrder.groups_2101['${i[@]}'].shipment.trackingUrl' | sed 's/null//g' >> track-url.txt
                echo $curl32 | jq '.data.guestOrder.groups_2101['${i[@]}'].categories[].type' >> track-categoriesType.txt

                break
            fi
        done
    done
    if [[ $sum32 == `md5 track-OrderID.txt` ]]; then
        echo "32-Khác Item"
        echo "'3392221278983" >> track-OrderID.txt
        echo "ejay0880@gmail.com" >> track-email.txt
        echo "Khác Item" >> track-usItemId.txt
        echo "Khác Item" >> track-priceValue.txt
        echo "Khác Item" >> track-fullName.txt
        echo "Khác Item" >> track-address.txt
        echo "Khác Item" >> track-status.txt
        echo "Khác Item" >> track-number.txt
        echo "Khác Item" >> track-url.txt
        echo "Khác Item" >> track-categoriesType.txt
    else
        echo "32"
    fi   
fi
while true
do
curl33=`curl -s 'https://www.walmart.com/orchestra/home/graphql' \
  -H 'authority: www.walmart.com' \
  -H 'sec-ch-ua: " Not;A Brand";v="99", "Microsoft Edge";v="97", "Chromium";v="97"' \
  -H 'x-o-platform: rweb' \
  -H 'dnt: 1' \
  -H 'x-o-correlation-id: pn9BnlEx0zDiyvRGJ6nL5BS9pDN7erB017Nf' \
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
  -H 'user-agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.51 Safari/537.36 Edg/99.0.1150.36' \
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
  --data-raw $'{"query":"query getGuestOrder($orderId:ID\u0021 $emailAddress:String\u0021){guestOrder(input:{id:$orderId emailAddress:$emailAddress}){...OrderFieldsFragment}}fragment cancelReason on OrderCancelReason{__typename subReasonCode subDescription}fragment priceDetailFragment on OrderPriceDetailRow{label value displayValue info{title message}rowInfo{...orderPriceDetailRowInfo}}fragment orderPriceDetailRowInfo on OrderPriceDetailRowInfo{title message{...textFragment}}fragment price on Price{displayValue value}fragment variants on MapEntry{name value}fragment OrderAddOn on OrderAddOn{lineId uniqueLineId productInfo{name usItemId offerId}quantityString quantityLabel type fulfillmentInstructions{...textFragment}actions{manageProtectionPlan{...orderActionFragment}cancel}priceInfo{linePrice{...price}}quantity isActive}fragment orderDonationDetails on OrderDonationDetails{message{...textFragment}emailReceipt emailReceiptToken status{...textFragment}errorStatus}fragment orderLineItem on OrderLineItem{id uniqueId actions{contactSeller cancel addToCart configureCake reviewItem resendEGiftCardToken protectionPlan{...orderActionFragment}manageProtectionPlan{...orderActionFragment}}isGift digitalDeliveryMessage quantity quantityString quantityLabel isSubstitutionSelected fulfilledItems{id quantityString priceInfo{itemPrice{value}}productInfo{usItemId name}}isReturnable returnEligibilityMessage productInfo{name usItemId imageInfo{thumbnailUrl}canonicalUrl offerId orderLimit orderMinLimit weightIncrement salesUnit salesUnitType isSubstitutionEligible isAlcohol}reshop{reshopMessage isShippingAvailable minPromiseDate maxPromiseDate}selectedVariants{...variants}variantAdditionalInfo{parts{text nativeAction}}priceInfo{priceDisplayCodes{showItemPrice priceDisplayCondition finalCostByWeight}itemPrice{...price}linePrice{...price}unitPrice{...price}preDiscountedLinePrice{...price}additionalLines{name value}}discounts{label labelText{...textFragment}}itemReviewed activationCodes{label code}protectionPlanMessage{...textFragment}showSeller isShippedByWalmart seller{id name isPro}digitalDeliveryPhoneNumber addOns{...OrderAddOn}multiboxBundleId}fragment DriverFragment on Driver{id firstName photoUrl}fragment OrderGroupFragment on OrderGroup{driver{...DriverFragment}deliveryDate fulfillmentType status{...OrderGroupStatusFragment}showSeller isShippedByWalmart seller{...SellerFragment}id itemCount items{...LiteLineItemFragment}pickupPerson{firstName lastName email}accessPointId shipment{...ShipmentFragment}returnEligibilityMessage actions{...OrderGroupActionsFragment}recipientEmailAddress digitalDelivery{...DigitalDeliveryFragment}tireInstallationReservation{status extraText reservationId}}fragment OrderGroupStatusFragment on OrderGroupStatus{statusType showStatusTracker statusTracker{status label isCurrent}message{...textFragment}subtext subMessage{...textFragment}notice helpCenterText{...textFragment}}fragment textFragment on Text{parts{bold url text nativeAction lineBreak}}fragment LiteLineItemFragment on OrderLineItem{id quantity productInfo{name usItemId imageInfo{thumbnailUrl}offerId isAlcohol}priceInfo{linePrice{...price}}}fragment SellerFragment on GroupSeller{id name isPro}fragment DigitalDeliveryFragment on DigitalDelivery{title name instructions{...textFragment}}fragment ShipmentFragment on Shipment{id trackingNumber isExternalTracking trackingUrl proofOfDelivery{...ProofOfDeliveryFragment}}fragment OrderGroupActionsFragment on OrderGroupActions{reorder edit track changeSlot checkin editDeliveryInstructions editPickupPerson editTip tip rateDriver cancel enableTip{...orderActionFragment}enableEdit{...orderActionFragment}rescheduleTireInstall{...orderActionFragment}cancelTireInstall{...orderActionFragment}help viewCancellationDetails{...cancellationDetailsActionFragment}}fragment cancellationDetailsActionFragment on CancellationDetailsAction{label heading text{...textFragment}}fragment ProofOfDeliveryFragment on ProofOfDelivery{photoUrl photoPreviewUrl showPreview}fragment DeliveryInstructionsFragment on DeliveryInstructions{text type typeText}fragment GiftDetailsFragment on GiftDetails{recipientAddress{fullName}recipientEmail senderName giftMessage}fragment SubstitutionAction on SubstitutionAction{message label type}fragment ODPGroupCategoryFragment on OrderCategory{type name subtext returnMessage substitutionsBanner{...textFragment}showExtendedSubstitutions actions{substitutions{...SubstitutionAction}nilPickReshop{message action{text url}}returnDetails viewCancellationDetails{...cancellationDetailsActionFragment}trackOnInHomeApp}banner{...textFragment}accordionState items{...orderLineItem}substitutions{...orderLineItem fulfilledItems{...orderLineItem}}returnInfo{...returnInfoFragment}}fragment ODPGroupFragment on OrderGroup{id fulfillmentType deliveryMessage deliveryAddress{fullName firstName lastName address{...addressFragment}}deliveryInstructions{...DeliveryInstructionsFragment}deliveryPreferences{text{...textFragment}cta{...orderActionFragment}}editSubstitutionsCutOff status{statusType showStatusTracker message{...textFragment}notice helpCenterText{...textFragment}}itemCount isCategorized categories{...ODPGroupCategoryFragment}seller{id name isPro}shipment{id trackingNumber}actions{reorder edit track changeSlot checkin editDeliveryInstructions editPickupPerson tip cancel help enableTip{...orderActionFragment}enableEdit{...orderActionFragment}viewCancellationDetails{...cancellationDetailsActionFragment}enableInHome{...orderActionFragment}createGiftReceipt}cutOffTimestamp isEditSubstitutionsEligible isInHome giftDetails{...GiftDetailsFragment}donationDetails{...orderDonationDetails}}fragment returnInfoFragment on ReturnInfo{returnOrderId type refundPriceDetails{__typename...refundPriceDetailsFragment}refundMessage tierRefundMessage paymentMethods{__typename description cardType paymentType displayValues message{...textFragment}}actions{__typename generate scheduleOrModifyPickup{text url}reschedulePickup editPickupContact}shippingLabelUrl qrCodeImageUrl carriers{__typename id name}pickupCarrier pickupContact{nameAndAddress{fullName firstName lastName address{addressString city state postalCode addressLineOne addressLineTwo country}}phone}pickupConfirmationNumber bannerMessage{...textFragment}}fragment refundPriceDetailsFragment on RefundPriceDetails{subTotal{__typename...orderPriceDetailRowFragment}fees{__typename...orderPriceDetailRowFragment}discounts{__typename...orderPriceDetailRowFragment}taxTotal{__typename...orderPriceDetailRowFragment}grandTotal{__typename...orderPriceDetailRowFragment}}fragment orderPriceDetailRowFragment on OrderPriceDetailRow{label displayValue value info{__typename title message}}fragment addressFragment on OrderAddress{addressString addressLineOne addressLineTwo state postalCode city}fragment ODPPickupInfo on OrderGroup{pickupInstructions pickupPerson{...person}alternatePickupPerson{...person}store{id name address{...addressFragment}}}fragment person on OrderPickupPerson{firstName lastName email}fragment ODPTippingInfo on OrderGroup{addTipMessage{...textFragment}driver{...DriverFragment}tipping{min{...price}max{...price}suggested{...price}preselected}subtotal{...price}}fragment orderActionFragment on Action{text url}fragment orderCustomer on OrderCustomer{id firstName lastName email isGuest isEmailRegistered}fragment OrderFieldsFragment on Order{__typename id version type customer{...orderCustomer}displayId idBarcodeImageUrl(barWidth:3 barHeight:100) isFuelPurchase title shortTitle timezone tippableGroup{...OrderGroupFragment}amendableGroup{id changeSlotIterationsLeft cutOffTimestamp fulfillmentType deliveryAddress{fullName firstName lastName address{addressString addressLineOne addressLineTwo state postalCode city country}}isAmendInProgress}substitutionsBanner{heading subheading longSubheading}groups_2101{__typename...OrderGroupFragment...ODPGroupFragment...ODPPickupInfo...ODPTippingInfo}multiboxBundles{...orderLineItem}itemCancelReasons{__typename...cancelReason}groupCancelReasons{__typename...cancelReason}priceDetails{__typename subTotal{__typename...priceDetailFragment}taxTotal{__typename...priceDetailFragment}grandTotal{__typename...priceDetailFragment}authorizationAmount{__typename...priceDetailFragment}fees{__typename...priceDetailFragment}discounts{__typename...priceDetailFragment}minimumThreshold{__typename...price}belowMinimumFee{__typename...priceDetailFragment}driverTip{__typename...priceDetailFragment}donations{__typename...priceDetailFragment}}paymentMethods{__typename description cardType paymentType displayValues message{...textFragment}actions{connectToCapitalOne{...orderActionFragment}visitAffirm{...orderActionFragment}}}actions{__typename return pendingReturn cancel startReturn{...orderActionFragment}reorder}banners{...textFragment}}","variables":{"orderId":"3392221844693","emailAddress":"dmdd1224@gmail.com"}}' \
  --compressed`
 
  if [[ $curl33 =~ "blocked" ]]; then
    link33=`echo $curl33 | jq '.redirectUrl' | sed 's/"//g'`
    `open -n -a /Applications/Microsoft\ Edge.app --args --profile-directory=Default https://walmart.com$link33`
    read -n 1 -p "blocked"
  else
    break
  fi
done

if [[ $curl33 =~ "error" ]]; then
    echo "33-Sai info"
    echo "'3392221844693" >> track-OrderID.txt
    echo "dmdd1224@gmail.com" >> track-email.txt
    echo "Sai info" >> track-usItemId.txt
    echo "Sai info" >> track-priceValue.txt
    echo "Sai info" >> track-fullName.txt
    echo "Sai info" >> track-address.txt
    echo "Sai info" >> track-status.txt
    echo "Sai info" >> track-number.txt
    echo "Sai info" >> track-url.txt
    echo "Sai info" >> track-categoriesType.txt
else
    sum33=`md5 track-OrderID.txt`
    for (( i=0; i<=4; i++ ))
    do
        for (( j=0; j<=4; j++))
        do
            if [[ `echo $curl33 | jq '.data.guestOrder.groups_2101['${i[@]}'].items['${j[@]}'].productInfo.usItemId'` == '"165694599"' ]]; then
                echo "'3392221844693" >> track-OrderID.txt
                echo dmdd1224@gmail.com >> track-email.txt
                echo $curl33 | jq '.data.guestOrder.groups_2101['${i[@]}'].items['${j[@]}'].productInfo.usItemId' >> track-usItemId.txt
                echo $curl33 | jq '.data.guestOrder.groups_2101['${i[@]}'].items['${j[@]}'].priceInfo.linePrice.value' >> track-priceValue.txt
                echo $curl33 | jq '.data.guestOrder.groups_2101['${i[@]}'].deliveryAddress.fullName' >> track-fullName.txt
                echo $curl33 | jq '.data.guestOrder.groups_2101['${i[@]}'].deliveryAddress.address.addressString' >> track-address.txt
                echo $curl33 | jq '.data.guestOrder.groups_2101['${i[@]}'].status.message.parts[].text' >> track-status.txt
                echo $curl33 | jq '.data.guestOrder.groups_2101['${i[@]}'].shipment.trackingNumber' | sed 's/null//g' >> track-number.txt
                echo $curl33 | jq '.data.guestOrder.groups_2101['${i[@]}'].shipment.trackingUrl' | sed 's/null//g' >> track-url.txt
                echo $curl33 | jq '.data.guestOrder.groups_2101['${i[@]}'].categories[].type' >> track-categoriesType.txt

                break
            fi
        done
    done
    if [[ $sum33 == `md5 track-OrderID.txt` ]]; then
        echo "33-Khác Item"
        echo "'3392221844693" >> track-OrderID.txt
        echo "dmdd1224@gmail.com" >> track-email.txt
        echo "Khác Item" >> track-usItemId.txt
        echo "Khác Item" >> track-priceValue.txt
        echo "Khác Item" >> track-fullName.txt
        echo "Khác Item" >> track-address.txt
        echo "Khác Item" >> track-status.txt
        echo "Khác Item" >> track-number.txt
        echo "Khác Item" >> track-url.txt
        echo "Khác Item" >> track-categoriesType.txt
    else
        echo "33"
    fi   
fi
while true
do
curl34=`curl -s 'https://www.walmart.com/orchestra/home/graphql' \
  -H 'authority: www.walmart.com' \
  -H 'sec-ch-ua: " Not;A Brand";v="99", "Microsoft Edge";v="97", "Chromium";v="97"' \
  -H 'x-o-platform: rweb' \
  -H 'dnt: 1' \
  -H 'x-o-correlation-id: pn9BnlEx0zDiyvRGJ6nL5BS9pDN7erB017Nf' \
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
  -H 'user-agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.51 Safari/537.36 Edg/99.0.1150.36' \
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
  --data-raw $'{"query":"query getGuestOrder($orderId:ID\u0021 $emailAddress:String\u0021){guestOrder(input:{id:$orderId emailAddress:$emailAddress}){...OrderFieldsFragment}}fragment cancelReason on OrderCancelReason{__typename subReasonCode subDescription}fragment priceDetailFragment on OrderPriceDetailRow{label value displayValue info{title message}rowInfo{...orderPriceDetailRowInfo}}fragment orderPriceDetailRowInfo on OrderPriceDetailRowInfo{title message{...textFragment}}fragment price on Price{displayValue value}fragment variants on MapEntry{name value}fragment OrderAddOn on OrderAddOn{lineId uniqueLineId productInfo{name usItemId offerId}quantityString quantityLabel type fulfillmentInstructions{...textFragment}actions{manageProtectionPlan{...orderActionFragment}cancel}priceInfo{linePrice{...price}}quantity isActive}fragment orderDonationDetails on OrderDonationDetails{message{...textFragment}emailReceipt emailReceiptToken status{...textFragment}errorStatus}fragment orderLineItem on OrderLineItem{id uniqueId actions{contactSeller cancel addToCart configureCake reviewItem resendEGiftCardToken protectionPlan{...orderActionFragment}manageProtectionPlan{...orderActionFragment}}isGift digitalDeliveryMessage quantity quantityString quantityLabel isSubstitutionSelected fulfilledItems{id quantityString priceInfo{itemPrice{value}}productInfo{usItemId name}}isReturnable returnEligibilityMessage productInfo{name usItemId imageInfo{thumbnailUrl}canonicalUrl offerId orderLimit orderMinLimit weightIncrement salesUnit salesUnitType isSubstitutionEligible isAlcohol}reshop{reshopMessage isShippingAvailable minPromiseDate maxPromiseDate}selectedVariants{...variants}variantAdditionalInfo{parts{text nativeAction}}priceInfo{priceDisplayCodes{showItemPrice priceDisplayCondition finalCostByWeight}itemPrice{...price}linePrice{...price}unitPrice{...price}preDiscountedLinePrice{...price}additionalLines{name value}}discounts{label labelText{...textFragment}}itemReviewed activationCodes{label code}protectionPlanMessage{...textFragment}showSeller isShippedByWalmart seller{id name isPro}digitalDeliveryPhoneNumber addOns{...OrderAddOn}multiboxBundleId}fragment DriverFragment on Driver{id firstName photoUrl}fragment OrderGroupFragment on OrderGroup{driver{...DriverFragment}deliveryDate fulfillmentType status{...OrderGroupStatusFragment}showSeller isShippedByWalmart seller{...SellerFragment}id itemCount items{...LiteLineItemFragment}pickupPerson{firstName lastName email}accessPointId shipment{...ShipmentFragment}returnEligibilityMessage actions{...OrderGroupActionsFragment}recipientEmailAddress digitalDelivery{...DigitalDeliveryFragment}tireInstallationReservation{status extraText reservationId}}fragment OrderGroupStatusFragment on OrderGroupStatus{statusType showStatusTracker statusTracker{status label isCurrent}message{...textFragment}subtext subMessage{...textFragment}notice helpCenterText{...textFragment}}fragment textFragment on Text{parts{bold url text nativeAction lineBreak}}fragment LiteLineItemFragment on OrderLineItem{id quantity productInfo{name usItemId imageInfo{thumbnailUrl}offerId isAlcohol}priceInfo{linePrice{...price}}}fragment SellerFragment on GroupSeller{id name isPro}fragment DigitalDeliveryFragment on DigitalDelivery{title name instructions{...textFragment}}fragment ShipmentFragment on Shipment{id trackingNumber isExternalTracking trackingUrl proofOfDelivery{...ProofOfDeliveryFragment}}fragment OrderGroupActionsFragment on OrderGroupActions{reorder edit track changeSlot checkin editDeliveryInstructions editPickupPerson editTip tip rateDriver cancel enableTip{...orderActionFragment}enableEdit{...orderActionFragment}rescheduleTireInstall{...orderActionFragment}cancelTireInstall{...orderActionFragment}help viewCancellationDetails{...cancellationDetailsActionFragment}}fragment cancellationDetailsActionFragment on CancellationDetailsAction{label heading text{...textFragment}}fragment ProofOfDeliveryFragment on ProofOfDelivery{photoUrl photoPreviewUrl showPreview}fragment DeliveryInstructionsFragment on DeliveryInstructions{text type typeText}fragment GiftDetailsFragment on GiftDetails{recipientAddress{fullName}recipientEmail senderName giftMessage}fragment SubstitutionAction on SubstitutionAction{message label type}fragment ODPGroupCategoryFragment on OrderCategory{type name subtext returnMessage substitutionsBanner{...textFragment}showExtendedSubstitutions actions{substitutions{...SubstitutionAction}nilPickReshop{message action{text url}}returnDetails viewCancellationDetails{...cancellationDetailsActionFragment}trackOnInHomeApp}banner{...textFragment}accordionState items{...orderLineItem}substitutions{...orderLineItem fulfilledItems{...orderLineItem}}returnInfo{...returnInfoFragment}}fragment ODPGroupFragment on OrderGroup{id fulfillmentType deliveryMessage deliveryAddress{fullName firstName lastName address{...addressFragment}}deliveryInstructions{...DeliveryInstructionsFragment}deliveryPreferences{text{...textFragment}cta{...orderActionFragment}}editSubstitutionsCutOff status{statusType showStatusTracker message{...textFragment}notice helpCenterText{...textFragment}}itemCount isCategorized categories{...ODPGroupCategoryFragment}seller{id name isPro}shipment{id trackingNumber}actions{reorder edit track changeSlot checkin editDeliveryInstructions editPickupPerson tip cancel help enableTip{...orderActionFragment}enableEdit{...orderActionFragment}viewCancellationDetails{...cancellationDetailsActionFragment}enableInHome{...orderActionFragment}createGiftReceipt}cutOffTimestamp isEditSubstitutionsEligible isInHome giftDetails{...GiftDetailsFragment}donationDetails{...orderDonationDetails}}fragment returnInfoFragment on ReturnInfo{returnOrderId type refundPriceDetails{__typename...refundPriceDetailsFragment}refundMessage tierRefundMessage paymentMethods{__typename description cardType paymentType displayValues message{...textFragment}}actions{__typename generate scheduleOrModifyPickup{text url}reschedulePickup editPickupContact}shippingLabelUrl qrCodeImageUrl carriers{__typename id name}pickupCarrier pickupContact{nameAndAddress{fullName firstName lastName address{addressString city state postalCode addressLineOne addressLineTwo country}}phone}pickupConfirmationNumber bannerMessage{...textFragment}}fragment refundPriceDetailsFragment on RefundPriceDetails{subTotal{__typename...orderPriceDetailRowFragment}fees{__typename...orderPriceDetailRowFragment}discounts{__typename...orderPriceDetailRowFragment}taxTotal{__typename...orderPriceDetailRowFragment}grandTotal{__typename...orderPriceDetailRowFragment}}fragment orderPriceDetailRowFragment on OrderPriceDetailRow{label displayValue value info{__typename title message}}fragment addressFragment on OrderAddress{addressString addressLineOne addressLineTwo state postalCode city}fragment ODPPickupInfo on OrderGroup{pickupInstructions pickupPerson{...person}alternatePickupPerson{...person}store{id name address{...addressFragment}}}fragment person on OrderPickupPerson{firstName lastName email}fragment ODPTippingInfo on OrderGroup{addTipMessage{...textFragment}driver{...DriverFragment}tipping{min{...price}max{...price}suggested{...price}preselected}subtotal{...price}}fragment orderActionFragment on Action{text url}fragment orderCustomer on OrderCustomer{id firstName lastName email isGuest isEmailRegistered}fragment OrderFieldsFragment on Order{__typename id version type customer{...orderCustomer}displayId idBarcodeImageUrl(barWidth:3 barHeight:100) isFuelPurchase title shortTitle timezone tippableGroup{...OrderGroupFragment}amendableGroup{id changeSlotIterationsLeft cutOffTimestamp fulfillmentType deliveryAddress{fullName firstName lastName address{addressString addressLineOne addressLineTwo state postalCode city country}}isAmendInProgress}substitutionsBanner{heading subheading longSubheading}groups_2101{__typename...OrderGroupFragment...ODPGroupFragment...ODPPickupInfo...ODPTippingInfo}multiboxBundles{...orderLineItem}itemCancelReasons{__typename...cancelReason}groupCancelReasons{__typename...cancelReason}priceDetails{__typename subTotal{__typename...priceDetailFragment}taxTotal{__typename...priceDetailFragment}grandTotal{__typename...priceDetailFragment}authorizationAmount{__typename...priceDetailFragment}fees{__typename...priceDetailFragment}discounts{__typename...priceDetailFragment}minimumThreshold{__typename...price}belowMinimumFee{__typename...priceDetailFragment}driverTip{__typename...priceDetailFragment}donations{__typename...priceDetailFragment}}paymentMethods{__typename description cardType paymentType displayValues message{...textFragment}actions{connectToCapitalOne{...orderActionFragment}visitAffirm{...orderActionFragment}}}actions{__typename return pendingReturn cancel startReturn{...orderActionFragment}reorder}banners{...textFragment}}","variables":{"orderId":"3372217480062","emailAddress":"dlstith001@aol.com"}}' \
  --compressed`
 
  if [[ $curl34 =~ "blocked" ]]; then
    link34=`echo $curl34 | jq '.redirectUrl' | sed 's/"//g'`
    `open -n -a /Applications/Microsoft\ Edge.app --args --profile-directory=Default https://walmart.com$link34`
    read -n 1 -p "blocked"
  else
    break
  fi
done

if [[ $curl34 =~ "error" ]]; then
    echo "34-Sai info"
    echo "'3372217480062" >> track-OrderID.txt
    echo "dlstith001@aol.com" >> track-email.txt
    echo "Sai info" >> track-usItemId.txt
    echo "Sai info" >> track-priceValue.txt
    echo "Sai info" >> track-fullName.txt
    echo "Sai info" >> track-address.txt
    echo "Sai info" >> track-status.txt
    echo "Sai info" >> track-number.txt
    echo "Sai info" >> track-url.txt
    echo "Sai info" >> track-categoriesType.txt
else
    sum34=`md5 track-OrderID.txt`
    for (( i=0; i<=4; i++ ))
    do
        for (( j=0; j<=4; j++))
        do
            if [[ `echo $curl34 | jq '.data.guestOrder.groups_2101['${i[@]}'].items['${j[@]}'].productInfo.usItemId'` == '"13997776"' ]]; then
                echo "'3372217480062" >> track-OrderID.txt
                echo dlstith001@aol.com >> track-email.txt
                echo $curl34 | jq '.data.guestOrder.groups_2101['${i[@]}'].items['${j[@]}'].productInfo.usItemId' >> track-usItemId.txt
                echo $curl34 | jq '.data.guestOrder.groups_2101['${i[@]}'].items['${j[@]}'].priceInfo.linePrice.value' >> track-priceValue.txt
                echo $curl34 | jq '.data.guestOrder.groups_2101['${i[@]}'].deliveryAddress.fullName' >> track-fullName.txt
                echo $curl34 | jq '.data.guestOrder.groups_2101['${i[@]}'].deliveryAddress.address.addressString' >> track-address.txt
                echo $curl34 | jq '.data.guestOrder.groups_2101['${i[@]}'].status.message.parts[].text' >> track-status.txt
                echo $curl34 | jq '.data.guestOrder.groups_2101['${i[@]}'].shipment.trackingNumber' | sed 's/null//g' >> track-number.txt
                echo $curl34 | jq '.data.guestOrder.groups_2101['${i[@]}'].shipment.trackingUrl' | sed 's/null//g' >> track-url.txt
                echo $curl34 | jq '.data.guestOrder.groups_2101['${i[@]}'].categories[].type' >> track-categoriesType.txt

                break
            fi
        done
    done
    if [[ $sum34 == `md5 track-OrderID.txt` ]]; then
        echo "34-Khác Item"
        echo "'3372217480062" >> track-OrderID.txt
        echo "dlstith001@aol.com" >> track-email.txt
        echo "Khác Item" >> track-usItemId.txt
        echo "Khác Item" >> track-priceValue.txt
        echo "Khác Item" >> track-fullName.txt
        echo "Khác Item" >> track-address.txt
        echo "Khác Item" >> track-status.txt
        echo "Khác Item" >> track-number.txt
        echo "Khác Item" >> track-url.txt
        echo "Khác Item" >> track-categoriesType.txt
    else
        echo "34"
    fi   
fi
while true
do
curl35=`curl -s 'https://www.walmart.com/orchestra/home/graphql' \
  -H 'authority: www.walmart.com' \
  -H 'sec-ch-ua: " Not;A Brand";v="99", "Microsoft Edge";v="97", "Chromium";v="97"' \
  -H 'x-o-platform: rweb' \
  -H 'dnt: 1' \
  -H 'x-o-correlation-id: pn9BnlEx0zDiyvRGJ6nL5BS9pDN7erB017Nf' \
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
  -H 'user-agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.51 Safari/537.36 Edg/99.0.1150.36' \
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
  --data-raw $'{"query":"query getGuestOrder($orderId:ID\u0021 $emailAddress:String\u0021){guestOrder(input:{id:$orderId emailAddress:$emailAddress}){...OrderFieldsFragment}}fragment cancelReason on OrderCancelReason{__typename subReasonCode subDescription}fragment priceDetailFragment on OrderPriceDetailRow{label value displayValue info{title message}rowInfo{...orderPriceDetailRowInfo}}fragment orderPriceDetailRowInfo on OrderPriceDetailRowInfo{title message{...textFragment}}fragment price on Price{displayValue value}fragment variants on MapEntry{name value}fragment OrderAddOn on OrderAddOn{lineId uniqueLineId productInfo{name usItemId offerId}quantityString quantityLabel type fulfillmentInstructions{...textFragment}actions{manageProtectionPlan{...orderActionFragment}cancel}priceInfo{linePrice{...price}}quantity isActive}fragment orderDonationDetails on OrderDonationDetails{message{...textFragment}emailReceipt emailReceiptToken status{...textFragment}errorStatus}fragment orderLineItem on OrderLineItem{id uniqueId actions{contactSeller cancel addToCart configureCake reviewItem resendEGiftCardToken protectionPlan{...orderActionFragment}manageProtectionPlan{...orderActionFragment}}isGift digitalDeliveryMessage quantity quantityString quantityLabel isSubstitutionSelected fulfilledItems{id quantityString priceInfo{itemPrice{value}}productInfo{usItemId name}}isReturnable returnEligibilityMessage productInfo{name usItemId imageInfo{thumbnailUrl}canonicalUrl offerId orderLimit orderMinLimit weightIncrement salesUnit salesUnitType isSubstitutionEligible isAlcohol}reshop{reshopMessage isShippingAvailable minPromiseDate maxPromiseDate}selectedVariants{...variants}variantAdditionalInfo{parts{text nativeAction}}priceInfo{priceDisplayCodes{showItemPrice priceDisplayCondition finalCostByWeight}itemPrice{...price}linePrice{...price}unitPrice{...price}preDiscountedLinePrice{...price}additionalLines{name value}}discounts{label labelText{...textFragment}}itemReviewed activationCodes{label code}protectionPlanMessage{...textFragment}showSeller isShippedByWalmart seller{id name isPro}digitalDeliveryPhoneNumber addOns{...OrderAddOn}multiboxBundleId}fragment DriverFragment on Driver{id firstName photoUrl}fragment OrderGroupFragment on OrderGroup{driver{...DriverFragment}deliveryDate fulfillmentType status{...OrderGroupStatusFragment}showSeller isShippedByWalmart seller{...SellerFragment}id itemCount items{...LiteLineItemFragment}pickupPerson{firstName lastName email}accessPointId shipment{...ShipmentFragment}returnEligibilityMessage actions{...OrderGroupActionsFragment}recipientEmailAddress digitalDelivery{...DigitalDeliveryFragment}tireInstallationReservation{status extraText reservationId}}fragment OrderGroupStatusFragment on OrderGroupStatus{statusType showStatusTracker statusTracker{status label isCurrent}message{...textFragment}subtext subMessage{...textFragment}notice helpCenterText{...textFragment}}fragment textFragment on Text{parts{bold url text nativeAction lineBreak}}fragment LiteLineItemFragment on OrderLineItem{id quantity productInfo{name usItemId imageInfo{thumbnailUrl}offerId isAlcohol}priceInfo{linePrice{...price}}}fragment SellerFragment on GroupSeller{id name isPro}fragment DigitalDeliveryFragment on DigitalDelivery{title name instructions{...textFragment}}fragment ShipmentFragment on Shipment{id trackingNumber isExternalTracking trackingUrl proofOfDelivery{...ProofOfDeliveryFragment}}fragment OrderGroupActionsFragment on OrderGroupActions{reorder edit track changeSlot checkin editDeliveryInstructions editPickupPerson editTip tip rateDriver cancel enableTip{...orderActionFragment}enableEdit{...orderActionFragment}rescheduleTireInstall{...orderActionFragment}cancelTireInstall{...orderActionFragment}help viewCancellationDetails{...cancellationDetailsActionFragment}}fragment cancellationDetailsActionFragment on CancellationDetailsAction{label heading text{...textFragment}}fragment ProofOfDeliveryFragment on ProofOfDelivery{photoUrl photoPreviewUrl showPreview}fragment DeliveryInstructionsFragment on DeliveryInstructions{text type typeText}fragment GiftDetailsFragment on GiftDetails{recipientAddress{fullName}recipientEmail senderName giftMessage}fragment SubstitutionAction on SubstitutionAction{message label type}fragment ODPGroupCategoryFragment on OrderCategory{type name subtext returnMessage substitutionsBanner{...textFragment}showExtendedSubstitutions actions{substitutions{...SubstitutionAction}nilPickReshop{message action{text url}}returnDetails viewCancellationDetails{...cancellationDetailsActionFragment}trackOnInHomeApp}banner{...textFragment}accordionState items{...orderLineItem}substitutions{...orderLineItem fulfilledItems{...orderLineItem}}returnInfo{...returnInfoFragment}}fragment ODPGroupFragment on OrderGroup{id fulfillmentType deliveryMessage deliveryAddress{fullName firstName lastName address{...addressFragment}}deliveryInstructions{...DeliveryInstructionsFragment}deliveryPreferences{text{...textFragment}cta{...orderActionFragment}}editSubstitutionsCutOff status{statusType showStatusTracker message{...textFragment}notice helpCenterText{...textFragment}}itemCount isCategorized categories{...ODPGroupCategoryFragment}seller{id name isPro}shipment{id trackingNumber}actions{reorder edit track changeSlot checkin editDeliveryInstructions editPickupPerson tip cancel help enableTip{...orderActionFragment}enableEdit{...orderActionFragment}viewCancellationDetails{...cancellationDetailsActionFragment}enableInHome{...orderActionFragment}createGiftReceipt}cutOffTimestamp isEditSubstitutionsEligible isInHome giftDetails{...GiftDetailsFragment}donationDetails{...orderDonationDetails}}fragment returnInfoFragment on ReturnInfo{returnOrderId type refundPriceDetails{__typename...refundPriceDetailsFragment}refundMessage tierRefundMessage paymentMethods{__typename description cardType paymentType displayValues message{...textFragment}}actions{__typename generate scheduleOrModifyPickup{text url}reschedulePickup editPickupContact}shippingLabelUrl qrCodeImageUrl carriers{__typename id name}pickupCarrier pickupContact{nameAndAddress{fullName firstName lastName address{addressString city state postalCode addressLineOne addressLineTwo country}}phone}pickupConfirmationNumber bannerMessage{...textFragment}}fragment refundPriceDetailsFragment on RefundPriceDetails{subTotal{__typename...orderPriceDetailRowFragment}fees{__typename...orderPriceDetailRowFragment}discounts{__typename...orderPriceDetailRowFragment}taxTotal{__typename...orderPriceDetailRowFragment}grandTotal{__typename...orderPriceDetailRowFragment}}fragment orderPriceDetailRowFragment on OrderPriceDetailRow{label displayValue value info{__typename title message}}fragment addressFragment on OrderAddress{addressString addressLineOne addressLineTwo state postalCode city}fragment ODPPickupInfo on OrderGroup{pickupInstructions pickupPerson{...person}alternatePickupPerson{...person}store{id name address{...addressFragment}}}fragment person on OrderPickupPerson{firstName lastName email}fragment ODPTippingInfo on OrderGroup{addTipMessage{...textFragment}driver{...DriverFragment}tipping{min{...price}max{...price}suggested{...price}preselected}subtotal{...price}}fragment orderActionFragment on Action{text url}fragment orderCustomer on OrderCustomer{id firstName lastName email isGuest isEmailRegistered}fragment OrderFieldsFragment on Order{__typename id version type customer{...orderCustomer}displayId idBarcodeImageUrl(barWidth:3 barHeight:100) isFuelPurchase title shortTitle timezone tippableGroup{...OrderGroupFragment}amendableGroup{id changeSlotIterationsLeft cutOffTimestamp fulfillmentType deliveryAddress{fullName firstName lastName address{addressString addressLineOne addressLineTwo state postalCode city country}}isAmendInProgress}substitutionsBanner{heading subheading longSubheading}groups_2101{__typename...OrderGroupFragment...ODPGroupFragment...ODPPickupInfo...ODPTippingInfo}multiboxBundles{...orderLineItem}itemCancelReasons{__typename...cancelReason}groupCancelReasons{__typename...cancelReason}priceDetails{__typename subTotal{__typename...priceDetailFragment}taxTotal{__typename...priceDetailFragment}grandTotal{__typename...priceDetailFragment}authorizationAmount{__typename...priceDetailFragment}fees{__typename...priceDetailFragment}discounts{__typename...priceDetailFragment}minimumThreshold{__typename...price}belowMinimumFee{__typename...priceDetailFragment}driverTip{__typename...priceDetailFragment}donations{__typename...priceDetailFragment}}paymentMethods{__typename description cardType paymentType displayValues message{...textFragment}actions{connectToCapitalOne{...orderActionFragment}visitAffirm{...orderActionFragment}}}actions{__typename return pendingReturn cancel startReturn{...orderActionFragment}reorder}banners{...textFragment}}","variables":{"orderId":"3382219569644","emailAddress":"cher6871@aol.com"}}' \
  --compressed`
 
  if [[ $curl35 =~ "blocked" ]]; then
    link35=`echo $curl35 | jq '.redirectUrl' | sed 's/"//g'`
    `open -n -a /Applications/Microsoft\ Edge.app --args --profile-directory=Default https://walmart.com$link35`
    read -n 1 -p "blocked"
  else
    break
  fi
done

if [[ $curl35 =~ "error" ]]; then
    echo "35-Sai info"
    echo "'3382219569644" >> track-OrderID.txt
    echo "cher6871@aol.com" >> track-email.txt
    echo "Sai info" >> track-usItemId.txt
    echo "Sai info" >> track-priceValue.txt
    echo "Sai info" >> track-fullName.txt
    echo "Sai info" >> track-address.txt
    echo "Sai info" >> track-status.txt
    echo "Sai info" >> track-number.txt
    echo "Sai info" >> track-url.txt
    echo "Sai info" >> track-categoriesType.txt
else
    sum35=`md5 track-OrderID.txt`
    for (( i=0; i<=4; i++ ))
    do
        for (( j=0; j<=4; j++))
        do
            if [[ `echo $curl35 | jq '.data.guestOrder.groups_2101['${i[@]}'].items['${j[@]}'].productInfo.usItemId'` == '"240828726"' ]]; then
                echo "'3382219569644" >> track-OrderID.txt
                echo cher6871@aol.com >> track-email.txt
                echo $curl35 | jq '.data.guestOrder.groups_2101['${i[@]}'].items['${j[@]}'].productInfo.usItemId' >> track-usItemId.txt
                echo $curl35 | jq '.data.guestOrder.groups_2101['${i[@]}'].items['${j[@]}'].priceInfo.linePrice.value' >> track-priceValue.txt
                echo $curl35 | jq '.data.guestOrder.groups_2101['${i[@]}'].deliveryAddress.fullName' >> track-fullName.txt
                echo $curl35 | jq '.data.guestOrder.groups_2101['${i[@]}'].deliveryAddress.address.addressString' >> track-address.txt
                echo $curl35 | jq '.data.guestOrder.groups_2101['${i[@]}'].status.message.parts[].text' >> track-status.txt
                echo $curl35 | jq '.data.guestOrder.groups_2101['${i[@]}'].shipment.trackingNumber' | sed 's/null//g' >> track-number.txt
                echo $curl35 | jq '.data.guestOrder.groups_2101['${i[@]}'].shipment.trackingUrl' | sed 's/null//g' >> track-url.txt
                echo $curl35 | jq '.data.guestOrder.groups_2101['${i[@]}'].categories[].type' >> track-categoriesType.txt

                break
            fi
        done
    done
    if [[ $sum35 == `md5 track-OrderID.txt` ]]; then
        echo "35-Khác Item"
        echo "'3382219569644" >> track-OrderID.txt
        echo "cher6871@aol.com" >> track-email.txt
        echo "Khác Item" >> track-usItemId.txt
        echo "Khác Item" >> track-priceValue.txt
        echo "Khác Item" >> track-fullName.txt
        echo "Khác Item" >> track-address.txt
        echo "Khác Item" >> track-status.txt
        echo "Khác Item" >> track-number.txt
        echo "Khác Item" >> track-url.txt
        echo "Khác Item" >> track-categoriesType.txt
    else
        echo "35"
    fi   
fi
while true
do
curl36=`curl -s 'https://www.walmart.com/orchestra/home/graphql' \
  -H 'authority: www.walmart.com' \
  -H 'sec-ch-ua: " Not;A Brand";v="99", "Microsoft Edge";v="97", "Chromium";v="97"' \
  -H 'x-o-platform: rweb' \
  -H 'dnt: 1' \
  -H 'x-o-correlation-id: pn9BnlEx0zDiyvRGJ6nL5BS9pDN7erB017Nf' \
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
  -H 'user-agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.51 Safari/537.36 Edg/99.0.1150.36' \
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
  --data-raw $'{"query":"query getGuestOrder($orderId:ID\u0021 $emailAddress:String\u0021){guestOrder(input:{id:$orderId emailAddress:$emailAddress}){...OrderFieldsFragment}}fragment cancelReason on OrderCancelReason{__typename subReasonCode subDescription}fragment priceDetailFragment on OrderPriceDetailRow{label value displayValue info{title message}rowInfo{...orderPriceDetailRowInfo}}fragment orderPriceDetailRowInfo on OrderPriceDetailRowInfo{title message{...textFragment}}fragment price on Price{displayValue value}fragment variants on MapEntry{name value}fragment OrderAddOn on OrderAddOn{lineId uniqueLineId productInfo{name usItemId offerId}quantityString quantityLabel type fulfillmentInstructions{...textFragment}actions{manageProtectionPlan{...orderActionFragment}cancel}priceInfo{linePrice{...price}}quantity isActive}fragment orderDonationDetails on OrderDonationDetails{message{...textFragment}emailReceipt emailReceiptToken status{...textFragment}errorStatus}fragment orderLineItem on OrderLineItem{id uniqueId actions{contactSeller cancel addToCart configureCake reviewItem resendEGiftCardToken protectionPlan{...orderActionFragment}manageProtectionPlan{...orderActionFragment}}isGift digitalDeliveryMessage quantity quantityString quantityLabel isSubstitutionSelected fulfilledItems{id quantityString priceInfo{itemPrice{value}}productInfo{usItemId name}}isReturnable returnEligibilityMessage productInfo{name usItemId imageInfo{thumbnailUrl}canonicalUrl offerId orderLimit orderMinLimit weightIncrement salesUnit salesUnitType isSubstitutionEligible isAlcohol}reshop{reshopMessage isShippingAvailable minPromiseDate maxPromiseDate}selectedVariants{...variants}variantAdditionalInfo{parts{text nativeAction}}priceInfo{priceDisplayCodes{showItemPrice priceDisplayCondition finalCostByWeight}itemPrice{...price}linePrice{...price}unitPrice{...price}preDiscountedLinePrice{...price}additionalLines{name value}}discounts{label labelText{...textFragment}}itemReviewed activationCodes{label code}protectionPlanMessage{...textFragment}showSeller isShippedByWalmart seller{id name isPro}digitalDeliveryPhoneNumber addOns{...OrderAddOn}multiboxBundleId}fragment DriverFragment on Driver{id firstName photoUrl}fragment OrderGroupFragment on OrderGroup{driver{...DriverFragment}deliveryDate fulfillmentType status{...OrderGroupStatusFragment}showSeller isShippedByWalmart seller{...SellerFragment}id itemCount items{...LiteLineItemFragment}pickupPerson{firstName lastName email}accessPointId shipment{...ShipmentFragment}returnEligibilityMessage actions{...OrderGroupActionsFragment}recipientEmailAddress digitalDelivery{...DigitalDeliveryFragment}tireInstallationReservation{status extraText reservationId}}fragment OrderGroupStatusFragment on OrderGroupStatus{statusType showStatusTracker statusTracker{status label isCurrent}message{...textFragment}subtext subMessage{...textFragment}notice helpCenterText{...textFragment}}fragment textFragment on Text{parts{bold url text nativeAction lineBreak}}fragment LiteLineItemFragment on OrderLineItem{id quantity productInfo{name usItemId imageInfo{thumbnailUrl}offerId isAlcohol}priceInfo{linePrice{...price}}}fragment SellerFragment on GroupSeller{id name isPro}fragment DigitalDeliveryFragment on DigitalDelivery{title name instructions{...textFragment}}fragment ShipmentFragment on Shipment{id trackingNumber isExternalTracking trackingUrl proofOfDelivery{...ProofOfDeliveryFragment}}fragment OrderGroupActionsFragment on OrderGroupActions{reorder edit track changeSlot checkin editDeliveryInstructions editPickupPerson editTip tip rateDriver cancel enableTip{...orderActionFragment}enableEdit{...orderActionFragment}rescheduleTireInstall{...orderActionFragment}cancelTireInstall{...orderActionFragment}help viewCancellationDetails{...cancellationDetailsActionFragment}}fragment cancellationDetailsActionFragment on CancellationDetailsAction{label heading text{...textFragment}}fragment ProofOfDeliveryFragment on ProofOfDelivery{photoUrl photoPreviewUrl showPreview}fragment DeliveryInstructionsFragment on DeliveryInstructions{text type typeText}fragment GiftDetailsFragment on GiftDetails{recipientAddress{fullName}recipientEmail senderName giftMessage}fragment SubstitutionAction on SubstitutionAction{message label type}fragment ODPGroupCategoryFragment on OrderCategory{type name subtext returnMessage substitutionsBanner{...textFragment}showExtendedSubstitutions actions{substitutions{...SubstitutionAction}nilPickReshop{message action{text url}}returnDetails viewCancellationDetails{...cancellationDetailsActionFragment}trackOnInHomeApp}banner{...textFragment}accordionState items{...orderLineItem}substitutions{...orderLineItem fulfilledItems{...orderLineItem}}returnInfo{...returnInfoFragment}}fragment ODPGroupFragment on OrderGroup{id fulfillmentType deliveryMessage deliveryAddress{fullName firstName lastName address{...addressFragment}}deliveryInstructions{...DeliveryInstructionsFragment}deliveryPreferences{text{...textFragment}cta{...orderActionFragment}}editSubstitutionsCutOff status{statusType showStatusTracker message{...textFragment}notice helpCenterText{...textFragment}}itemCount isCategorized categories{...ODPGroupCategoryFragment}seller{id name isPro}shipment{id trackingNumber}actions{reorder edit track changeSlot checkin editDeliveryInstructions editPickupPerson tip cancel help enableTip{...orderActionFragment}enableEdit{...orderActionFragment}viewCancellationDetails{...cancellationDetailsActionFragment}enableInHome{...orderActionFragment}createGiftReceipt}cutOffTimestamp isEditSubstitutionsEligible isInHome giftDetails{...GiftDetailsFragment}donationDetails{...orderDonationDetails}}fragment returnInfoFragment on ReturnInfo{returnOrderId type refundPriceDetails{__typename...refundPriceDetailsFragment}refundMessage tierRefundMessage paymentMethods{__typename description cardType paymentType displayValues message{...textFragment}}actions{__typename generate scheduleOrModifyPickup{text url}reschedulePickup editPickupContact}shippingLabelUrl qrCodeImageUrl carriers{__typename id name}pickupCarrier pickupContact{nameAndAddress{fullName firstName lastName address{addressString city state postalCode addressLineOne addressLineTwo country}}phone}pickupConfirmationNumber bannerMessage{...textFragment}}fragment refundPriceDetailsFragment on RefundPriceDetails{subTotal{__typename...orderPriceDetailRowFragment}fees{__typename...orderPriceDetailRowFragment}discounts{__typename...orderPriceDetailRowFragment}taxTotal{__typename...orderPriceDetailRowFragment}grandTotal{__typename...orderPriceDetailRowFragment}}fragment orderPriceDetailRowFragment on OrderPriceDetailRow{label displayValue value info{__typename title message}}fragment addressFragment on OrderAddress{addressString addressLineOne addressLineTwo state postalCode city}fragment ODPPickupInfo on OrderGroup{pickupInstructions pickupPerson{...person}alternatePickupPerson{...person}store{id name address{...addressFragment}}}fragment person on OrderPickupPerson{firstName lastName email}fragment ODPTippingInfo on OrderGroup{addTipMessage{...textFragment}driver{...DriverFragment}tipping{min{...price}max{...price}suggested{...price}preselected}subtotal{...price}}fragment orderActionFragment on Action{text url}fragment orderCustomer on OrderCustomer{id firstName lastName email isGuest isEmailRegistered}fragment OrderFieldsFragment on Order{__typename id version type customer{...orderCustomer}displayId idBarcodeImageUrl(barWidth:3 barHeight:100) isFuelPurchase title shortTitle timezone tippableGroup{...OrderGroupFragment}amendableGroup{id changeSlotIterationsLeft cutOffTimestamp fulfillmentType deliveryAddress{fullName firstName lastName address{addressString addressLineOne addressLineTwo state postalCode city country}}isAmendInProgress}substitutionsBanner{heading subheading longSubheading}groups_2101{__typename...OrderGroupFragment...ODPGroupFragment...ODPPickupInfo...ODPTippingInfo}multiboxBundles{...orderLineItem}itemCancelReasons{__typename...cancelReason}groupCancelReasons{__typename...cancelReason}priceDetails{__typename subTotal{__typename...priceDetailFragment}taxTotal{__typename...priceDetailFragment}grandTotal{__typename...priceDetailFragment}authorizationAmount{__typename...priceDetailFragment}fees{__typename...priceDetailFragment}discounts{__typename...priceDetailFragment}minimumThreshold{__typename...price}belowMinimumFee{__typename...priceDetailFragment}driverTip{__typename...priceDetailFragment}donations{__typename...priceDetailFragment}}paymentMethods{__typename description cardType paymentType displayValues message{...textFragment}actions{connectToCapitalOne{...orderActionFragment}visitAffirm{...orderActionFragment}}}actions{__typename return pendingReturn cancel startReturn{...orderActionFragment}reorder}banners{...textFragment}}","variables":{"orderId":"3392221871937","emailAddress":"huaquang@gmail.com"}}' \
  --compressed`
 
  if [[ $curl36 =~ "blocked" ]]; then
    link36=`echo $curl36 | jq '.redirectUrl' | sed 's/"//g'`
    `open -n -a /Applications/Microsoft\ Edge.app --args --profile-directory=Default https://walmart.com$link36`
    read -n 1 -p "blocked"
  else
    break
  fi
done

if [[ $curl36 =~ "error" ]]; then
    echo "36-Sai info"
    echo "'3392221871937" >> track-OrderID.txt
    echo "huaquang@gmail.com" >> track-email.txt
    echo "Sai info" >> track-usItemId.txt
    echo "Sai info" >> track-priceValue.txt
    echo "Sai info" >> track-fullName.txt
    echo "Sai info" >> track-address.txt
    echo "Sai info" >> track-status.txt
    echo "Sai info" >> track-number.txt
    echo "Sai info" >> track-url.txt
    echo "Sai info" >> track-categoriesType.txt
else
    sum36=`md5 track-OrderID.txt`
    for (( i=0; i<=4; i++ ))
    do
        for (( j=0; j<=4; j++))
        do
            if [[ `echo $curl36 | jq '.data.guestOrder.groups_2101['${i[@]}'].items['${j[@]}'].productInfo.usItemId'` == '"175041181"' ]]; then
                echo "'3392221871937" >> track-OrderID.txt
                echo huaquang@gmail.com >> track-email.txt
                echo $curl36 | jq '.data.guestOrder.groups_2101['${i[@]}'].items['${j[@]}'].productInfo.usItemId' >> track-usItemId.txt
                echo $curl36 | jq '.data.guestOrder.groups_2101['${i[@]}'].items['${j[@]}'].priceInfo.linePrice.value' >> track-priceValue.txt
                echo $curl36 | jq '.data.guestOrder.groups_2101['${i[@]}'].deliveryAddress.fullName' >> track-fullName.txt
                echo $curl36 | jq '.data.guestOrder.groups_2101['${i[@]}'].deliveryAddress.address.addressString' >> track-address.txt
                echo $curl36 | jq '.data.guestOrder.groups_2101['${i[@]}'].status.message.parts[].text' >> track-status.txt
                echo $curl36 | jq '.data.guestOrder.groups_2101['${i[@]}'].shipment.trackingNumber' | sed 's/null//g' >> track-number.txt
                echo $curl36 | jq '.data.guestOrder.groups_2101['${i[@]}'].shipment.trackingUrl' | sed 's/null//g' >> track-url.txt
                echo $curl36 | jq '.data.guestOrder.groups_2101['${i[@]}'].categories[].type' >> track-categoriesType.txt

                break
            fi
        done
    done
    if [[ $sum36 == `md5 track-OrderID.txt` ]]; then
        echo "36-Khác Item"
        echo "'3392221871937" >> track-OrderID.txt
        echo "huaquang@gmail.com" >> track-email.txt
        echo "Khác Item" >> track-usItemId.txt
        echo "Khác Item" >> track-priceValue.txt
        echo "Khác Item" >> track-fullName.txt
        echo "Khác Item" >> track-address.txt
        echo "Khác Item" >> track-status.txt
        echo "Khác Item" >> track-number.txt
        echo "Khác Item" >> track-url.txt
        echo "Khác Item" >> track-categoriesType.txt
    else
        echo "36"
    fi   
fi
while true
do
curl37=`curl -s 'https://www.walmart.com/orchestra/home/graphql' \
  -H 'authority: www.walmart.com' \
  -H 'sec-ch-ua: " Not;A Brand";v="99", "Microsoft Edge";v="97", "Chromium";v="97"' \
  -H 'x-o-platform: rweb' \
  -H 'dnt: 1' \
  -H 'x-o-correlation-id: pn9BnlEx0zDiyvRGJ6nL5BS9pDN7erB017Nf' \
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
  -H 'user-agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.51 Safari/537.36 Edg/99.0.1150.36' \
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
  --data-raw $'{"query":"query getGuestOrder($orderId:ID\u0021 $emailAddress:String\u0021){guestOrder(input:{id:$orderId emailAddress:$emailAddress}){...OrderFieldsFragment}}fragment cancelReason on OrderCancelReason{__typename subReasonCode subDescription}fragment priceDetailFragment on OrderPriceDetailRow{label value displayValue info{title message}rowInfo{...orderPriceDetailRowInfo}}fragment orderPriceDetailRowInfo on OrderPriceDetailRowInfo{title message{...textFragment}}fragment price on Price{displayValue value}fragment variants on MapEntry{name value}fragment OrderAddOn on OrderAddOn{lineId uniqueLineId productInfo{name usItemId offerId}quantityString quantityLabel type fulfillmentInstructions{...textFragment}actions{manageProtectionPlan{...orderActionFragment}cancel}priceInfo{linePrice{...price}}quantity isActive}fragment orderDonationDetails on OrderDonationDetails{message{...textFragment}emailReceipt emailReceiptToken status{...textFragment}errorStatus}fragment orderLineItem on OrderLineItem{id uniqueId actions{contactSeller cancel addToCart configureCake reviewItem resendEGiftCardToken protectionPlan{...orderActionFragment}manageProtectionPlan{...orderActionFragment}}isGift digitalDeliveryMessage quantity quantityString quantityLabel isSubstitutionSelected fulfilledItems{id quantityString priceInfo{itemPrice{value}}productInfo{usItemId name}}isReturnable returnEligibilityMessage productInfo{name usItemId imageInfo{thumbnailUrl}canonicalUrl offerId orderLimit orderMinLimit weightIncrement salesUnit salesUnitType isSubstitutionEligible isAlcohol}reshop{reshopMessage isShippingAvailable minPromiseDate maxPromiseDate}selectedVariants{...variants}variantAdditionalInfo{parts{text nativeAction}}priceInfo{priceDisplayCodes{showItemPrice priceDisplayCondition finalCostByWeight}itemPrice{...price}linePrice{...price}unitPrice{...price}preDiscountedLinePrice{...price}additionalLines{name value}}discounts{label labelText{...textFragment}}itemReviewed activationCodes{label code}protectionPlanMessage{...textFragment}showSeller isShippedByWalmart seller{id name isPro}digitalDeliveryPhoneNumber addOns{...OrderAddOn}multiboxBundleId}fragment DriverFragment on Driver{id firstName photoUrl}fragment OrderGroupFragment on OrderGroup{driver{...DriverFragment}deliveryDate fulfillmentType status{...OrderGroupStatusFragment}showSeller isShippedByWalmart seller{...SellerFragment}id itemCount items{...LiteLineItemFragment}pickupPerson{firstName lastName email}accessPointId shipment{...ShipmentFragment}returnEligibilityMessage actions{...OrderGroupActionsFragment}recipientEmailAddress digitalDelivery{...DigitalDeliveryFragment}tireInstallationReservation{status extraText reservationId}}fragment OrderGroupStatusFragment on OrderGroupStatus{statusType showStatusTracker statusTracker{status label isCurrent}message{...textFragment}subtext subMessage{...textFragment}notice helpCenterText{...textFragment}}fragment textFragment on Text{parts{bold url text nativeAction lineBreak}}fragment LiteLineItemFragment on OrderLineItem{id quantity productInfo{name usItemId imageInfo{thumbnailUrl}offerId isAlcohol}priceInfo{linePrice{...price}}}fragment SellerFragment on GroupSeller{id name isPro}fragment DigitalDeliveryFragment on DigitalDelivery{title name instructions{...textFragment}}fragment ShipmentFragment on Shipment{id trackingNumber isExternalTracking trackingUrl proofOfDelivery{...ProofOfDeliveryFragment}}fragment OrderGroupActionsFragment on OrderGroupActions{reorder edit track changeSlot checkin editDeliveryInstructions editPickupPerson editTip tip rateDriver cancel enableTip{...orderActionFragment}enableEdit{...orderActionFragment}rescheduleTireInstall{...orderActionFragment}cancelTireInstall{...orderActionFragment}help viewCancellationDetails{...cancellationDetailsActionFragment}}fragment cancellationDetailsActionFragment on CancellationDetailsAction{label heading text{...textFragment}}fragment ProofOfDeliveryFragment on ProofOfDelivery{photoUrl photoPreviewUrl showPreview}fragment DeliveryInstructionsFragment on DeliveryInstructions{text type typeText}fragment GiftDetailsFragment on GiftDetails{recipientAddress{fullName}recipientEmail senderName giftMessage}fragment SubstitutionAction on SubstitutionAction{message label type}fragment ODPGroupCategoryFragment on OrderCategory{type name subtext returnMessage substitutionsBanner{...textFragment}showExtendedSubstitutions actions{substitutions{...SubstitutionAction}nilPickReshop{message action{text url}}returnDetails viewCancellationDetails{...cancellationDetailsActionFragment}trackOnInHomeApp}banner{...textFragment}accordionState items{...orderLineItem}substitutions{...orderLineItem fulfilledItems{...orderLineItem}}returnInfo{...returnInfoFragment}}fragment ODPGroupFragment on OrderGroup{id fulfillmentType deliveryMessage deliveryAddress{fullName firstName lastName address{...addressFragment}}deliveryInstructions{...DeliveryInstructionsFragment}deliveryPreferences{text{...textFragment}cta{...orderActionFragment}}editSubstitutionsCutOff status{statusType showStatusTracker message{...textFragment}notice helpCenterText{...textFragment}}itemCount isCategorized categories{...ODPGroupCategoryFragment}seller{id name isPro}shipment{id trackingNumber}actions{reorder edit track changeSlot checkin editDeliveryInstructions editPickupPerson tip cancel help enableTip{...orderActionFragment}enableEdit{...orderActionFragment}viewCancellationDetails{...cancellationDetailsActionFragment}enableInHome{...orderActionFragment}createGiftReceipt}cutOffTimestamp isEditSubstitutionsEligible isInHome giftDetails{...GiftDetailsFragment}donationDetails{...orderDonationDetails}}fragment returnInfoFragment on ReturnInfo{returnOrderId type refundPriceDetails{__typename...refundPriceDetailsFragment}refundMessage tierRefundMessage paymentMethods{__typename description cardType paymentType displayValues message{...textFragment}}actions{__typename generate scheduleOrModifyPickup{text url}reschedulePickup editPickupContact}shippingLabelUrl qrCodeImageUrl carriers{__typename id name}pickupCarrier pickupContact{nameAndAddress{fullName firstName lastName address{addressString city state postalCode addressLineOne addressLineTwo country}}phone}pickupConfirmationNumber bannerMessage{...textFragment}}fragment refundPriceDetailsFragment on RefundPriceDetails{subTotal{__typename...orderPriceDetailRowFragment}fees{__typename...orderPriceDetailRowFragment}discounts{__typename...orderPriceDetailRowFragment}taxTotal{__typename...orderPriceDetailRowFragment}grandTotal{__typename...orderPriceDetailRowFragment}}fragment orderPriceDetailRowFragment on OrderPriceDetailRow{label displayValue value info{__typename title message}}fragment addressFragment on OrderAddress{addressString addressLineOne addressLineTwo state postalCode city}fragment ODPPickupInfo on OrderGroup{pickupInstructions pickupPerson{...person}alternatePickupPerson{...person}store{id name address{...addressFragment}}}fragment person on OrderPickupPerson{firstName lastName email}fragment ODPTippingInfo on OrderGroup{addTipMessage{...textFragment}driver{...DriverFragment}tipping{min{...price}max{...price}suggested{...price}preselected}subtotal{...price}}fragment orderActionFragment on Action{text url}fragment orderCustomer on OrderCustomer{id firstName lastName email isGuest isEmailRegistered}fragment OrderFieldsFragment on Order{__typename id version type customer{...orderCustomer}displayId idBarcodeImageUrl(barWidth:3 barHeight:100) isFuelPurchase title shortTitle timezone tippableGroup{...OrderGroupFragment}amendableGroup{id changeSlotIterationsLeft cutOffTimestamp fulfillmentType deliveryAddress{fullName firstName lastName address{addressString addressLineOne addressLineTwo state postalCode city country}}isAmendInProgress}substitutionsBanner{heading subheading longSubheading}groups_2101{__typename...OrderGroupFragment...ODPGroupFragment...ODPPickupInfo...ODPTippingInfo}multiboxBundles{...orderLineItem}itemCancelReasons{__typename...cancelReason}groupCancelReasons{__typename...cancelReason}priceDetails{__typename subTotal{__typename...priceDetailFragment}taxTotal{__typename...priceDetailFragment}grandTotal{__typename...priceDetailFragment}authorizationAmount{__typename...priceDetailFragment}fees{__typename...priceDetailFragment}discounts{__typename...priceDetailFragment}minimumThreshold{__typename...price}belowMinimumFee{__typename...priceDetailFragment}driverTip{__typename...priceDetailFragment}donations{__typename...priceDetailFragment}}paymentMethods{__typename description cardType paymentType displayValues message{...textFragment}actions{connectToCapitalOne{...orderActionFragment}visitAffirm{...orderActionFragment}}}actions{__typename return pendingReturn cancel startReturn{...orderActionFragment}reorder}banners{...textFragment}}","variables":{"orderId":"3342213778038","emailAddress":"13jwag@gmail.com"}}' \
  --compressed`
 
  if [[ $curl37 =~ "blocked" ]]; then
    link37=`echo $curl37 | jq '.redirectUrl' | sed 's/"//g'`
    `open -n -a /Applications/Microsoft\ Edge.app --args --profile-directory=Default https://walmart.com$link37`
    read -n 1 -p "blocked"
  else
    break
  fi
done

if [[ $curl37 =~ "error" ]]; then
    echo "37-Sai info"
    echo "'3342213778038" >> track-OrderID.txt
    echo "13jwag@gmail.com" >> track-email.txt
    echo "Sai info" >> track-usItemId.txt
    echo "Sai info" >> track-priceValue.txt
    echo "Sai info" >> track-fullName.txt
    echo "Sai info" >> track-address.txt
    echo "Sai info" >> track-status.txt
    echo "Sai info" >> track-number.txt
    echo "Sai info" >> track-url.txt
    echo "Sai info" >> track-categoriesType.txt
else
    sum37=`md5 track-OrderID.txt`
    for (( i=0; i<=4; i++ ))
    do
        for (( j=0; j<=4; j++))
        do
            if [[ `echo $curl37 | jq '.data.guestOrder.groups_2101['${i[@]}'].items['${j[@]}'].productInfo.usItemId'` == '"251382558"' ]]; then
                echo "'3342213778038" >> track-OrderID.txt
                echo 13jwag@gmail.com >> track-email.txt
                echo $curl37 | jq '.data.guestOrder.groups_2101['${i[@]}'].items['${j[@]}'].productInfo.usItemId' >> track-usItemId.txt
                echo $curl37 | jq '.data.guestOrder.groups_2101['${i[@]}'].items['${j[@]}'].priceInfo.linePrice.value' >> track-priceValue.txt
                echo $curl37 | jq '.data.guestOrder.groups_2101['${i[@]}'].deliveryAddress.fullName' >> track-fullName.txt
                echo $curl37 | jq '.data.guestOrder.groups_2101['${i[@]}'].deliveryAddress.address.addressString' >> track-address.txt
                echo $curl37 | jq '.data.guestOrder.groups_2101['${i[@]}'].status.message.parts[].text' >> track-status.txt
                echo $curl37 | jq '.data.guestOrder.groups_2101['${i[@]}'].shipment.trackingNumber' | sed 's/null//g' >> track-number.txt
                echo $curl37 | jq '.data.guestOrder.groups_2101['${i[@]}'].shipment.trackingUrl' | sed 's/null//g' >> track-url.txt
                echo $curl37 | jq '.data.guestOrder.groups_2101['${i[@]}'].categories[].type' >> track-categoriesType.txt

                break
            fi
        done
    done
    if [[ $sum37 == `md5 track-OrderID.txt` ]]; then
        echo "37-Khác Item"
        echo "'3342213778038" >> track-OrderID.txt
        echo "13jwag@gmail.com" >> track-email.txt
        echo "Khác Item" >> track-usItemId.txt
        echo "Khác Item" >> track-priceValue.txt
        echo "Khác Item" >> track-fullName.txt
        echo "Khác Item" >> track-address.txt
        echo "Khác Item" >> track-status.txt
        echo "Khác Item" >> track-number.txt
        echo "Khác Item" >> track-url.txt
        echo "Khác Item" >> track-categoriesType.txt
    else
        echo "37"
    fi   
fi
while true
do
curl38=`curl -s 'https://www.walmart.com/orchestra/home/graphql' \
  -H 'authority: www.walmart.com' \
  -H 'sec-ch-ua: " Not;A Brand";v="99", "Microsoft Edge";v="97", "Chromium";v="97"' \
  -H 'x-o-platform: rweb' \
  -H 'dnt: 1' \
  -H 'x-o-correlation-id: pn9BnlEx0zDiyvRGJ6nL5BS9pDN7erB017Nf' \
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
  -H 'user-agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.51 Safari/537.36 Edg/99.0.1150.36' \
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
  --data-raw $'{"query":"query getGuestOrder($orderId:ID\u0021 $emailAddress:String\u0021){guestOrder(input:{id:$orderId emailAddress:$emailAddress}){...OrderFieldsFragment}}fragment cancelReason on OrderCancelReason{__typename subReasonCode subDescription}fragment priceDetailFragment on OrderPriceDetailRow{label value displayValue info{title message}rowInfo{...orderPriceDetailRowInfo}}fragment orderPriceDetailRowInfo on OrderPriceDetailRowInfo{title message{...textFragment}}fragment price on Price{displayValue value}fragment variants on MapEntry{name value}fragment OrderAddOn on OrderAddOn{lineId uniqueLineId productInfo{name usItemId offerId}quantityString quantityLabel type fulfillmentInstructions{...textFragment}actions{manageProtectionPlan{...orderActionFragment}cancel}priceInfo{linePrice{...price}}quantity isActive}fragment orderDonationDetails on OrderDonationDetails{message{...textFragment}emailReceipt emailReceiptToken status{...textFragment}errorStatus}fragment orderLineItem on OrderLineItem{id uniqueId actions{contactSeller cancel addToCart configureCake reviewItem resendEGiftCardToken protectionPlan{...orderActionFragment}manageProtectionPlan{...orderActionFragment}}isGift digitalDeliveryMessage quantity quantityString quantityLabel isSubstitutionSelected fulfilledItems{id quantityString priceInfo{itemPrice{value}}productInfo{usItemId name}}isReturnable returnEligibilityMessage productInfo{name usItemId imageInfo{thumbnailUrl}canonicalUrl offerId orderLimit orderMinLimit weightIncrement salesUnit salesUnitType isSubstitutionEligible isAlcohol}reshop{reshopMessage isShippingAvailable minPromiseDate maxPromiseDate}selectedVariants{...variants}variantAdditionalInfo{parts{text nativeAction}}priceInfo{priceDisplayCodes{showItemPrice priceDisplayCondition finalCostByWeight}itemPrice{...price}linePrice{...price}unitPrice{...price}preDiscountedLinePrice{...price}additionalLines{name value}}discounts{label labelText{...textFragment}}itemReviewed activationCodes{label code}protectionPlanMessage{...textFragment}showSeller isShippedByWalmart seller{id name isPro}digitalDeliveryPhoneNumber addOns{...OrderAddOn}multiboxBundleId}fragment DriverFragment on Driver{id firstName photoUrl}fragment OrderGroupFragment on OrderGroup{driver{...DriverFragment}deliveryDate fulfillmentType status{...OrderGroupStatusFragment}showSeller isShippedByWalmart seller{...SellerFragment}id itemCount items{...LiteLineItemFragment}pickupPerson{firstName lastName email}accessPointId shipment{...ShipmentFragment}returnEligibilityMessage actions{...OrderGroupActionsFragment}recipientEmailAddress digitalDelivery{...DigitalDeliveryFragment}tireInstallationReservation{status extraText reservationId}}fragment OrderGroupStatusFragment on OrderGroupStatus{statusType showStatusTracker statusTracker{status label isCurrent}message{...textFragment}subtext subMessage{...textFragment}notice helpCenterText{...textFragment}}fragment textFragment on Text{parts{bold url text nativeAction lineBreak}}fragment LiteLineItemFragment on OrderLineItem{id quantity productInfo{name usItemId imageInfo{thumbnailUrl}offerId isAlcohol}priceInfo{linePrice{...price}}}fragment SellerFragment on GroupSeller{id name isPro}fragment DigitalDeliveryFragment on DigitalDelivery{title name instructions{...textFragment}}fragment ShipmentFragment on Shipment{id trackingNumber isExternalTracking trackingUrl proofOfDelivery{...ProofOfDeliveryFragment}}fragment OrderGroupActionsFragment on OrderGroupActions{reorder edit track changeSlot checkin editDeliveryInstructions editPickupPerson editTip tip rateDriver cancel enableTip{...orderActionFragment}enableEdit{...orderActionFragment}rescheduleTireInstall{...orderActionFragment}cancelTireInstall{...orderActionFragment}help viewCancellationDetails{...cancellationDetailsActionFragment}}fragment cancellationDetailsActionFragment on CancellationDetailsAction{label heading text{...textFragment}}fragment ProofOfDeliveryFragment on ProofOfDelivery{photoUrl photoPreviewUrl showPreview}fragment DeliveryInstructionsFragment on DeliveryInstructions{text type typeText}fragment GiftDetailsFragment on GiftDetails{recipientAddress{fullName}recipientEmail senderName giftMessage}fragment SubstitutionAction on SubstitutionAction{message label type}fragment ODPGroupCategoryFragment on OrderCategory{type name subtext returnMessage substitutionsBanner{...textFragment}showExtendedSubstitutions actions{substitutions{...SubstitutionAction}nilPickReshop{message action{text url}}returnDetails viewCancellationDetails{...cancellationDetailsActionFragment}trackOnInHomeApp}banner{...textFragment}accordionState items{...orderLineItem}substitutions{...orderLineItem fulfilledItems{...orderLineItem}}returnInfo{...returnInfoFragment}}fragment ODPGroupFragment on OrderGroup{id fulfillmentType deliveryMessage deliveryAddress{fullName firstName lastName address{...addressFragment}}deliveryInstructions{...DeliveryInstructionsFragment}deliveryPreferences{text{...textFragment}cta{...orderActionFragment}}editSubstitutionsCutOff status{statusType showStatusTracker message{...textFragment}notice helpCenterText{...textFragment}}itemCount isCategorized categories{...ODPGroupCategoryFragment}seller{id name isPro}shipment{id trackingNumber}actions{reorder edit track changeSlot checkin editDeliveryInstructions editPickupPerson tip cancel help enableTip{...orderActionFragment}enableEdit{...orderActionFragment}viewCancellationDetails{...cancellationDetailsActionFragment}enableInHome{...orderActionFragment}createGiftReceipt}cutOffTimestamp isEditSubstitutionsEligible isInHome giftDetails{...GiftDetailsFragment}donationDetails{...orderDonationDetails}}fragment returnInfoFragment on ReturnInfo{returnOrderId type refundPriceDetails{__typename...refundPriceDetailsFragment}refundMessage tierRefundMessage paymentMethods{__typename description cardType paymentType displayValues message{...textFragment}}actions{__typename generate scheduleOrModifyPickup{text url}reschedulePickup editPickupContact}shippingLabelUrl qrCodeImageUrl carriers{__typename id name}pickupCarrier pickupContact{nameAndAddress{fullName firstName lastName address{addressString city state postalCode addressLineOne addressLineTwo country}}phone}pickupConfirmationNumber bannerMessage{...textFragment}}fragment refundPriceDetailsFragment on RefundPriceDetails{subTotal{__typename...orderPriceDetailRowFragment}fees{__typename...orderPriceDetailRowFragment}discounts{__typename...orderPriceDetailRowFragment}taxTotal{__typename...orderPriceDetailRowFragment}grandTotal{__typename...orderPriceDetailRowFragment}}fragment orderPriceDetailRowFragment on OrderPriceDetailRow{label displayValue value info{__typename title message}}fragment addressFragment on OrderAddress{addressString addressLineOne addressLineTwo state postalCode city}fragment ODPPickupInfo on OrderGroup{pickupInstructions pickupPerson{...person}alternatePickupPerson{...person}store{id name address{...addressFragment}}}fragment person on OrderPickupPerson{firstName lastName email}fragment ODPTippingInfo on OrderGroup{addTipMessage{...textFragment}driver{...DriverFragment}tipping{min{...price}max{...price}suggested{...price}preselected}subtotal{...price}}fragment orderActionFragment on Action{text url}fragment orderCustomer on OrderCustomer{id firstName lastName email isGuest isEmailRegistered}fragment OrderFieldsFragment on Order{__typename id version type customer{...orderCustomer}displayId idBarcodeImageUrl(barWidth:3 barHeight:100) isFuelPurchase title shortTitle timezone tippableGroup{...OrderGroupFragment}amendableGroup{id changeSlotIterationsLeft cutOffTimestamp fulfillmentType deliveryAddress{fullName firstName lastName address{addressString addressLineOne addressLineTwo state postalCode city country}}isAmendInProgress}substitutionsBanner{heading subheading longSubheading}groups_2101{__typename...OrderGroupFragment...ODPGroupFragment...ODPPickupInfo...ODPTippingInfo}multiboxBundles{...orderLineItem}itemCancelReasons{__typename...cancelReason}groupCancelReasons{__typename...cancelReason}priceDetails{__typename subTotal{__typename...priceDetailFragment}taxTotal{__typename...priceDetailFragment}grandTotal{__typename...priceDetailFragment}authorizationAmount{__typename...priceDetailFragment}fees{__typename...priceDetailFragment}discounts{__typename...priceDetailFragment}minimumThreshold{__typename...price}belowMinimumFee{__typename...priceDetailFragment}driverTip{__typename...priceDetailFragment}donations{__typename...priceDetailFragment}}paymentMethods{__typename description cardType paymentType displayValues message{...textFragment}actions{connectToCapitalOne{...orderActionFragment}visitAffirm{...orderActionFragment}}}actions{__typename return pendingReturn cancel startReturn{...orderActionFragment}reorder}banners{...textFragment}}","variables":{"orderId":"3382219671233","emailAddress":"mikeandbecky03@comcast.net"}}' \
  --compressed`
 
  if [[ $curl38 =~ "blocked" ]]; then
    link38=`echo $curl38 | jq '.redirectUrl' | sed 's/"//g'`
    `open -n -a /Applications/Microsoft\ Edge.app --args --profile-directory=Default https://walmart.com$link38`
    read -n 1 -p "blocked"
  else
    break
  fi
done

if [[ $curl38 =~ "error" ]]; then
    echo "38-Sai info"
    echo "'3382219671233" >> track-OrderID.txt
    echo "mikeandbecky03@comcast.net" >> track-email.txt
    echo "Sai info" >> track-usItemId.txt
    echo "Sai info" >> track-priceValue.txt
    echo "Sai info" >> track-fullName.txt
    echo "Sai info" >> track-address.txt
    echo "Sai info" >> track-status.txt
    echo "Sai info" >> track-number.txt
    echo "Sai info" >> track-url.txt
    echo "Sai info" >> track-categoriesType.txt
else
    sum38=`md5 track-OrderID.txt`
    for (( i=0; i<=4; i++ ))
    do
        for (( j=0; j<=4; j++))
        do
            if [[ `echo $curl38 | jq '.data.guestOrder.groups_2101['${i[@]}'].items['${j[@]}'].productInfo.usItemId'` == '"311658658"' ]]; then
                echo "'3382219671233" >> track-OrderID.txt
                echo mikeandbecky03@comcast.net >> track-email.txt
                echo $curl38 | jq '.data.guestOrder.groups_2101['${i[@]}'].items['${j[@]}'].productInfo.usItemId' >> track-usItemId.txt
                echo $curl38 | jq '.data.guestOrder.groups_2101['${i[@]}'].items['${j[@]}'].priceInfo.linePrice.value' >> track-priceValue.txt
                echo $curl38 | jq '.data.guestOrder.groups_2101['${i[@]}'].deliveryAddress.fullName' >> track-fullName.txt
                echo $curl38 | jq '.data.guestOrder.groups_2101['${i[@]}'].deliveryAddress.address.addressString' >> track-address.txt
                echo $curl38 | jq '.data.guestOrder.groups_2101['${i[@]}'].status.message.parts[].text' >> track-status.txt
                echo $curl38 | jq '.data.guestOrder.groups_2101['${i[@]}'].shipment.trackingNumber' | sed 's/null//g' >> track-number.txt
                echo $curl38 | jq '.data.guestOrder.groups_2101['${i[@]}'].shipment.trackingUrl' | sed 's/null//g' >> track-url.txt
                echo $curl38 | jq '.data.guestOrder.groups_2101['${i[@]}'].categories[].type' >> track-categoriesType.txt

                break
            fi
        done
    done
    if [[ $sum38 == `md5 track-OrderID.txt` ]]; then
        echo "38-Khác Item"
        echo "'3382219671233" >> track-OrderID.txt
        echo "mikeandbecky03@comcast.net" >> track-email.txt
        echo "Khác Item" >> track-usItemId.txt
        echo "Khác Item" >> track-priceValue.txt
        echo "Khác Item" >> track-fullName.txt
        echo "Khác Item" >> track-address.txt
        echo "Khác Item" >> track-status.txt
        echo "Khác Item" >> track-number.txt
        echo "Khác Item" >> track-url.txt
        echo "Khác Item" >> track-categoriesType.txt
    else
        echo "38"
    fi   
fi
while true
do
curl39=`curl -s 'https://www.walmart.com/orchestra/home/graphql' \
  -H 'authority: www.walmart.com' \
  -H 'sec-ch-ua: " Not;A Brand";v="99", "Microsoft Edge";v="97", "Chromium";v="97"' \
  -H 'x-o-platform: rweb' \
  -H 'dnt: 1' \
  -H 'x-o-correlation-id: pn9BnlEx0zDiyvRGJ6nL5BS9pDN7erB017Nf' \
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
  -H 'user-agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.51 Safari/537.36 Edg/99.0.1150.36' \
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
  --data-raw $'{"query":"query getGuestOrder($orderId:ID\u0021 $emailAddress:String\u0021){guestOrder(input:{id:$orderId emailAddress:$emailAddress}){...OrderFieldsFragment}}fragment cancelReason on OrderCancelReason{__typename subReasonCode subDescription}fragment priceDetailFragment on OrderPriceDetailRow{label value displayValue info{title message}rowInfo{...orderPriceDetailRowInfo}}fragment orderPriceDetailRowInfo on OrderPriceDetailRowInfo{title message{...textFragment}}fragment price on Price{displayValue value}fragment variants on MapEntry{name value}fragment OrderAddOn on OrderAddOn{lineId uniqueLineId productInfo{name usItemId offerId}quantityString quantityLabel type fulfillmentInstructions{...textFragment}actions{manageProtectionPlan{...orderActionFragment}cancel}priceInfo{linePrice{...price}}quantity isActive}fragment orderDonationDetails on OrderDonationDetails{message{...textFragment}emailReceipt emailReceiptToken status{...textFragment}errorStatus}fragment orderLineItem on OrderLineItem{id uniqueId actions{contactSeller cancel addToCart configureCake reviewItem resendEGiftCardToken protectionPlan{...orderActionFragment}manageProtectionPlan{...orderActionFragment}}isGift digitalDeliveryMessage quantity quantityString quantityLabel isSubstitutionSelected fulfilledItems{id quantityString priceInfo{itemPrice{value}}productInfo{usItemId name}}isReturnable returnEligibilityMessage productInfo{name usItemId imageInfo{thumbnailUrl}canonicalUrl offerId orderLimit orderMinLimit weightIncrement salesUnit salesUnitType isSubstitutionEligible isAlcohol}reshop{reshopMessage isShippingAvailable minPromiseDate maxPromiseDate}selectedVariants{...variants}variantAdditionalInfo{parts{text nativeAction}}priceInfo{priceDisplayCodes{showItemPrice priceDisplayCondition finalCostByWeight}itemPrice{...price}linePrice{...price}unitPrice{...price}preDiscountedLinePrice{...price}additionalLines{name value}}discounts{label labelText{...textFragment}}itemReviewed activationCodes{label code}protectionPlanMessage{...textFragment}showSeller isShippedByWalmart seller{id name isPro}digitalDeliveryPhoneNumber addOns{...OrderAddOn}multiboxBundleId}fragment DriverFragment on Driver{id firstName photoUrl}fragment OrderGroupFragment on OrderGroup{driver{...DriverFragment}deliveryDate fulfillmentType status{...OrderGroupStatusFragment}showSeller isShippedByWalmart seller{...SellerFragment}id itemCount items{...LiteLineItemFragment}pickupPerson{firstName lastName email}accessPointId shipment{...ShipmentFragment}returnEligibilityMessage actions{...OrderGroupActionsFragment}recipientEmailAddress digitalDelivery{...DigitalDeliveryFragment}tireInstallationReservation{status extraText reservationId}}fragment OrderGroupStatusFragment on OrderGroupStatus{statusType showStatusTracker statusTracker{status label isCurrent}message{...textFragment}subtext subMessage{...textFragment}notice helpCenterText{...textFragment}}fragment textFragment on Text{parts{bold url text nativeAction lineBreak}}fragment LiteLineItemFragment on OrderLineItem{id quantity productInfo{name usItemId imageInfo{thumbnailUrl}offerId isAlcohol}priceInfo{linePrice{...price}}}fragment SellerFragment on GroupSeller{id name isPro}fragment DigitalDeliveryFragment on DigitalDelivery{title name instructions{...textFragment}}fragment ShipmentFragment on Shipment{id trackingNumber isExternalTracking trackingUrl proofOfDelivery{...ProofOfDeliveryFragment}}fragment OrderGroupActionsFragment on OrderGroupActions{reorder edit track changeSlot checkin editDeliveryInstructions editPickupPerson editTip tip rateDriver cancel enableTip{...orderActionFragment}enableEdit{...orderActionFragment}rescheduleTireInstall{...orderActionFragment}cancelTireInstall{...orderActionFragment}help viewCancellationDetails{...cancellationDetailsActionFragment}}fragment cancellationDetailsActionFragment on CancellationDetailsAction{label heading text{...textFragment}}fragment ProofOfDeliveryFragment on ProofOfDelivery{photoUrl photoPreviewUrl showPreview}fragment DeliveryInstructionsFragment on DeliveryInstructions{text type typeText}fragment GiftDetailsFragment on GiftDetails{recipientAddress{fullName}recipientEmail senderName giftMessage}fragment SubstitutionAction on SubstitutionAction{message label type}fragment ODPGroupCategoryFragment on OrderCategory{type name subtext returnMessage substitutionsBanner{...textFragment}showExtendedSubstitutions actions{substitutions{...SubstitutionAction}nilPickReshop{message action{text url}}returnDetails viewCancellationDetails{...cancellationDetailsActionFragment}trackOnInHomeApp}banner{...textFragment}accordionState items{...orderLineItem}substitutions{...orderLineItem fulfilledItems{...orderLineItem}}returnInfo{...returnInfoFragment}}fragment ODPGroupFragment on OrderGroup{id fulfillmentType deliveryMessage deliveryAddress{fullName firstName lastName address{...addressFragment}}deliveryInstructions{...DeliveryInstructionsFragment}deliveryPreferences{text{...textFragment}cta{...orderActionFragment}}editSubstitutionsCutOff status{statusType showStatusTracker message{...textFragment}notice helpCenterText{...textFragment}}itemCount isCategorized categories{...ODPGroupCategoryFragment}seller{id name isPro}shipment{id trackingNumber}actions{reorder edit track changeSlot checkin editDeliveryInstructions editPickupPerson tip cancel help enableTip{...orderActionFragment}enableEdit{...orderActionFragment}viewCancellationDetails{...cancellationDetailsActionFragment}enableInHome{...orderActionFragment}createGiftReceipt}cutOffTimestamp isEditSubstitutionsEligible isInHome giftDetails{...GiftDetailsFragment}donationDetails{...orderDonationDetails}}fragment returnInfoFragment on ReturnInfo{returnOrderId type refundPriceDetails{__typename...refundPriceDetailsFragment}refundMessage tierRefundMessage paymentMethods{__typename description cardType paymentType displayValues message{...textFragment}}actions{__typename generate scheduleOrModifyPickup{text url}reschedulePickup editPickupContact}shippingLabelUrl qrCodeImageUrl carriers{__typename id name}pickupCarrier pickupContact{nameAndAddress{fullName firstName lastName address{addressString city state postalCode addressLineOne addressLineTwo country}}phone}pickupConfirmationNumber bannerMessage{...textFragment}}fragment refundPriceDetailsFragment on RefundPriceDetails{subTotal{__typename...orderPriceDetailRowFragment}fees{__typename...orderPriceDetailRowFragment}discounts{__typename...orderPriceDetailRowFragment}taxTotal{__typename...orderPriceDetailRowFragment}grandTotal{__typename...orderPriceDetailRowFragment}}fragment orderPriceDetailRowFragment on OrderPriceDetailRow{label displayValue value info{__typename title message}}fragment addressFragment on OrderAddress{addressString addressLineOne addressLineTwo state postalCode city}fragment ODPPickupInfo on OrderGroup{pickupInstructions pickupPerson{...person}alternatePickupPerson{...person}store{id name address{...addressFragment}}}fragment person on OrderPickupPerson{firstName lastName email}fragment ODPTippingInfo on OrderGroup{addTipMessage{...textFragment}driver{...DriverFragment}tipping{min{...price}max{...price}suggested{...price}preselected}subtotal{...price}}fragment orderActionFragment on Action{text url}fragment orderCustomer on OrderCustomer{id firstName lastName email isGuest isEmailRegistered}fragment OrderFieldsFragment on Order{__typename id version type customer{...orderCustomer}displayId idBarcodeImageUrl(barWidth:3 barHeight:100) isFuelPurchase title shortTitle timezone tippableGroup{...OrderGroupFragment}amendableGroup{id changeSlotIterationsLeft cutOffTimestamp fulfillmentType deliveryAddress{fullName firstName lastName address{addressString addressLineOne addressLineTwo state postalCode city country}}isAmendInProgress}substitutionsBanner{heading subheading longSubheading}groups_2101{__typename...OrderGroupFragment...ODPGroupFragment...ODPPickupInfo...ODPTippingInfo}multiboxBundles{...orderLineItem}itemCancelReasons{__typename...cancelReason}groupCancelReasons{__typename...cancelReason}priceDetails{__typename subTotal{__typename...priceDetailFragment}taxTotal{__typename...priceDetailFragment}grandTotal{__typename...priceDetailFragment}authorizationAmount{__typename...priceDetailFragment}fees{__typename...priceDetailFragment}discounts{__typename...priceDetailFragment}minimumThreshold{__typename...price}belowMinimumFee{__typename...priceDetailFragment}driverTip{__typename...priceDetailFragment}donations{__typename...priceDetailFragment}}paymentMethods{__typename description cardType paymentType displayValues message{...textFragment}actions{connectToCapitalOne{...orderActionFragment}visitAffirm{...orderActionFragment}}}actions{__typename return pendingReturn cancel startReturn{...orderActionFragment}reorder}banners{...textFragment}}","variables":{"orderId":"3372217093202","emailAddress":"schmidj06@gmail.com"}}' \
  --compressed`
 
  if [[ $curl39 =~ "blocked" ]]; then
    link39=`echo $curl39 | jq '.redirectUrl' | sed 's/"//g'`
    `open -n -a /Applications/Microsoft\ Edge.app --args --profile-directory=Default https://walmart.com$link39`
    read -n 1 -p "blocked"
  else
    break
  fi
done

if [[ $curl39 =~ "error" ]]; then
    echo "39-Sai info"
    echo "'3372217093202" >> track-OrderID.txt
    echo "schmidj06@gmail.com" >> track-email.txt
    echo "Sai info" >> track-usItemId.txt
    echo "Sai info" >> track-priceValue.txt
    echo "Sai info" >> track-fullName.txt
    echo "Sai info" >> track-address.txt
    echo "Sai info" >> track-status.txt
    echo "Sai info" >> track-number.txt
    echo "Sai info" >> track-url.txt
    echo "Sai info" >> track-categoriesType.txt
else
    sum39=`md5 track-OrderID.txt`
    for (( i=0; i<=4; i++ ))
    do
        for (( j=0; j<=4; j++))
        do
            if [[ `echo $curl39 | jq '.data.guestOrder.groups_2101['${i[@]}'].items['${j[@]}'].productInfo.usItemId'` == '"190326511"' ]]; then
                echo "'3372217093202" >> track-OrderID.txt
                echo schmidj06@gmail.com >> track-email.txt
                echo $curl39 | jq '.data.guestOrder.groups_2101['${i[@]}'].items['${j[@]}'].productInfo.usItemId' >> track-usItemId.txt
                echo $curl39 | jq '.data.guestOrder.groups_2101['${i[@]}'].items['${j[@]}'].priceInfo.linePrice.value' >> track-priceValue.txt
                echo $curl39 | jq '.data.guestOrder.groups_2101['${i[@]}'].deliveryAddress.fullName' >> track-fullName.txt
                echo $curl39 | jq '.data.guestOrder.groups_2101['${i[@]}'].deliveryAddress.address.addressString' >> track-address.txt
                echo $curl39 | jq '.data.guestOrder.groups_2101['${i[@]}'].status.message.parts[].text' >> track-status.txt
                echo $curl39 | jq '.data.guestOrder.groups_2101['${i[@]}'].shipment.trackingNumber' | sed 's/null//g' >> track-number.txt
                echo $curl39 | jq '.data.guestOrder.groups_2101['${i[@]}'].shipment.trackingUrl' | sed 's/null//g' >> track-url.txt
                echo $curl39 | jq '.data.guestOrder.groups_2101['${i[@]}'].categories[].type' >> track-categoriesType.txt

                break
            fi
        done
    done
    if [[ $sum39 == `md5 track-OrderID.txt` ]]; then
        echo "39-Khác Item"
        echo "'3372217093202" >> track-OrderID.txt
        echo "schmidj06@gmail.com" >> track-email.txt
        echo "Khác Item" >> track-usItemId.txt
        echo "Khác Item" >> track-priceValue.txt
        echo "Khác Item" >> track-fullName.txt
        echo "Khác Item" >> track-address.txt
        echo "Khác Item" >> track-status.txt
        echo "Khác Item" >> track-number.txt
        echo "Khác Item" >> track-url.txt
        echo "Khác Item" >> track-categoriesType.txt
    else
        echo "39"
    fi   
fi
while true
do
curl40=`curl -s 'https://www.walmart.com/orchestra/home/graphql' \
  -H 'authority: www.walmart.com' \
  -H 'sec-ch-ua: " Not;A Brand";v="99", "Microsoft Edge";v="97", "Chromium";v="97"' \
  -H 'x-o-platform: rweb' \
  -H 'dnt: 1' \
  -H 'x-o-correlation-id: pn9BnlEx0zDiyvRGJ6nL5BS9pDN7erB017Nf' \
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
  -H 'user-agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.51 Safari/537.36 Edg/99.0.1150.36' \
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
  --data-raw $'{"query":"query getGuestOrder($orderId:ID\u0021 $emailAddress:String\u0021){guestOrder(input:{id:$orderId emailAddress:$emailAddress}){...OrderFieldsFragment}}fragment cancelReason on OrderCancelReason{__typename subReasonCode subDescription}fragment priceDetailFragment on OrderPriceDetailRow{label value displayValue info{title message}rowInfo{...orderPriceDetailRowInfo}}fragment orderPriceDetailRowInfo on OrderPriceDetailRowInfo{title message{...textFragment}}fragment price on Price{displayValue value}fragment variants on MapEntry{name value}fragment OrderAddOn on OrderAddOn{lineId uniqueLineId productInfo{name usItemId offerId}quantityString quantityLabel type fulfillmentInstructions{...textFragment}actions{manageProtectionPlan{...orderActionFragment}cancel}priceInfo{linePrice{...price}}quantity isActive}fragment orderDonationDetails on OrderDonationDetails{message{...textFragment}emailReceipt emailReceiptToken status{...textFragment}errorStatus}fragment orderLineItem on OrderLineItem{id uniqueId actions{contactSeller cancel addToCart configureCake reviewItem resendEGiftCardToken protectionPlan{...orderActionFragment}manageProtectionPlan{...orderActionFragment}}isGift digitalDeliveryMessage quantity quantityString quantityLabel isSubstitutionSelected fulfilledItems{id quantityString priceInfo{itemPrice{value}}productInfo{usItemId name}}isReturnable returnEligibilityMessage productInfo{name usItemId imageInfo{thumbnailUrl}canonicalUrl offerId orderLimit orderMinLimit weightIncrement salesUnit salesUnitType isSubstitutionEligible isAlcohol}reshop{reshopMessage isShippingAvailable minPromiseDate maxPromiseDate}selectedVariants{...variants}variantAdditionalInfo{parts{text nativeAction}}priceInfo{priceDisplayCodes{showItemPrice priceDisplayCondition finalCostByWeight}itemPrice{...price}linePrice{...price}unitPrice{...price}preDiscountedLinePrice{...price}additionalLines{name value}}discounts{label labelText{...textFragment}}itemReviewed activationCodes{label code}protectionPlanMessage{...textFragment}showSeller isShippedByWalmart seller{id name isPro}digitalDeliveryPhoneNumber addOns{...OrderAddOn}multiboxBundleId}fragment DriverFragment on Driver{id firstName photoUrl}fragment OrderGroupFragment on OrderGroup{driver{...DriverFragment}deliveryDate fulfillmentType status{...OrderGroupStatusFragment}showSeller isShippedByWalmart seller{...SellerFragment}id itemCount items{...LiteLineItemFragment}pickupPerson{firstName lastName email}accessPointId shipment{...ShipmentFragment}returnEligibilityMessage actions{...OrderGroupActionsFragment}recipientEmailAddress digitalDelivery{...DigitalDeliveryFragment}tireInstallationReservation{status extraText reservationId}}fragment OrderGroupStatusFragment on OrderGroupStatus{statusType showStatusTracker statusTracker{status label isCurrent}message{...textFragment}subtext subMessage{...textFragment}notice helpCenterText{...textFragment}}fragment textFragment on Text{parts{bold url text nativeAction lineBreak}}fragment LiteLineItemFragment on OrderLineItem{id quantity productInfo{name usItemId imageInfo{thumbnailUrl}offerId isAlcohol}priceInfo{linePrice{...price}}}fragment SellerFragment on GroupSeller{id name isPro}fragment DigitalDeliveryFragment on DigitalDelivery{title name instructions{...textFragment}}fragment ShipmentFragment on Shipment{id trackingNumber isExternalTracking trackingUrl proofOfDelivery{...ProofOfDeliveryFragment}}fragment OrderGroupActionsFragment on OrderGroupActions{reorder edit track changeSlot checkin editDeliveryInstructions editPickupPerson editTip tip rateDriver cancel enableTip{...orderActionFragment}enableEdit{...orderActionFragment}rescheduleTireInstall{...orderActionFragment}cancelTireInstall{...orderActionFragment}help viewCancellationDetails{...cancellationDetailsActionFragment}}fragment cancellationDetailsActionFragment on CancellationDetailsAction{label heading text{...textFragment}}fragment ProofOfDeliveryFragment on ProofOfDelivery{photoUrl photoPreviewUrl showPreview}fragment DeliveryInstructionsFragment on DeliveryInstructions{text type typeText}fragment GiftDetailsFragment on GiftDetails{recipientAddress{fullName}recipientEmail senderName giftMessage}fragment SubstitutionAction on SubstitutionAction{message label type}fragment ODPGroupCategoryFragment on OrderCategory{type name subtext returnMessage substitutionsBanner{...textFragment}showExtendedSubstitutions actions{substitutions{...SubstitutionAction}nilPickReshop{message action{text url}}returnDetails viewCancellationDetails{...cancellationDetailsActionFragment}trackOnInHomeApp}banner{...textFragment}accordionState items{...orderLineItem}substitutions{...orderLineItem fulfilledItems{...orderLineItem}}returnInfo{...returnInfoFragment}}fragment ODPGroupFragment on OrderGroup{id fulfillmentType deliveryMessage deliveryAddress{fullName firstName lastName address{...addressFragment}}deliveryInstructions{...DeliveryInstructionsFragment}deliveryPreferences{text{...textFragment}cta{...orderActionFragment}}editSubstitutionsCutOff status{statusType showStatusTracker message{...textFragment}notice helpCenterText{...textFragment}}itemCount isCategorized categories{...ODPGroupCategoryFragment}seller{id name isPro}shipment{id trackingNumber}actions{reorder edit track changeSlot checkin editDeliveryInstructions editPickupPerson tip cancel help enableTip{...orderActionFragment}enableEdit{...orderActionFragment}viewCancellationDetails{...cancellationDetailsActionFragment}enableInHome{...orderActionFragment}createGiftReceipt}cutOffTimestamp isEditSubstitutionsEligible isInHome giftDetails{...GiftDetailsFragment}donationDetails{...orderDonationDetails}}fragment returnInfoFragment on ReturnInfo{returnOrderId type refundPriceDetails{__typename...refundPriceDetailsFragment}refundMessage tierRefundMessage paymentMethods{__typename description cardType paymentType displayValues message{...textFragment}}actions{__typename generate scheduleOrModifyPickup{text url}reschedulePickup editPickupContact}shippingLabelUrl qrCodeImageUrl carriers{__typename id name}pickupCarrier pickupContact{nameAndAddress{fullName firstName lastName address{addressString city state postalCode addressLineOne addressLineTwo country}}phone}pickupConfirmationNumber bannerMessage{...textFragment}}fragment refundPriceDetailsFragment on RefundPriceDetails{subTotal{__typename...orderPriceDetailRowFragment}fees{__typename...orderPriceDetailRowFragment}discounts{__typename...orderPriceDetailRowFragment}taxTotal{__typename...orderPriceDetailRowFragment}grandTotal{__typename...orderPriceDetailRowFragment}}fragment orderPriceDetailRowFragment on OrderPriceDetailRow{label displayValue value info{__typename title message}}fragment addressFragment on OrderAddress{addressString addressLineOne addressLineTwo state postalCode city}fragment ODPPickupInfo on OrderGroup{pickupInstructions pickupPerson{...person}alternatePickupPerson{...person}store{id name address{...addressFragment}}}fragment person on OrderPickupPerson{firstName lastName email}fragment ODPTippingInfo on OrderGroup{addTipMessage{...textFragment}driver{...DriverFragment}tipping{min{...price}max{...price}suggested{...price}preselected}subtotal{...price}}fragment orderActionFragment on Action{text url}fragment orderCustomer on OrderCustomer{id firstName lastName email isGuest isEmailRegistered}fragment OrderFieldsFragment on Order{__typename id version type customer{...orderCustomer}displayId idBarcodeImageUrl(barWidth:3 barHeight:100) isFuelPurchase title shortTitle timezone tippableGroup{...OrderGroupFragment}amendableGroup{id changeSlotIterationsLeft cutOffTimestamp fulfillmentType deliveryAddress{fullName firstName lastName address{addressString addressLineOne addressLineTwo state postalCode city country}}isAmendInProgress}substitutionsBanner{heading subheading longSubheading}groups_2101{__typename...OrderGroupFragment...ODPGroupFragment...ODPPickupInfo...ODPTippingInfo}multiboxBundles{...orderLineItem}itemCancelReasons{__typename...cancelReason}groupCancelReasons{__typename...cancelReason}priceDetails{__typename subTotal{__typename...priceDetailFragment}taxTotal{__typename...priceDetailFragment}grandTotal{__typename...priceDetailFragment}authorizationAmount{__typename...priceDetailFragment}fees{__typename...priceDetailFragment}discounts{__typename...priceDetailFragment}minimumThreshold{__typename...price}belowMinimumFee{__typename...priceDetailFragment}driverTip{__typename...priceDetailFragment}donations{__typename...priceDetailFragment}}paymentMethods{__typename description cardType paymentType displayValues message{...textFragment}actions{connectToCapitalOne{...orderActionFragment}visitAffirm{...orderActionFragment}}}actions{__typename return pendingReturn cancel startReturn{...orderActionFragment}reorder}banners{...textFragment}}","variables":{"orderId":"3372217594764","emailAddress":"valeriepierr@gmail.com"}}' \
  --compressed`
 
  if [[ $curl40 =~ "blocked" ]]; then
    link40=`echo $curl40 | jq '.redirectUrl' | sed 's/"//g'`
    `open -n -a /Applications/Microsoft\ Edge.app --args --profile-directory=Default https://walmart.com$link40`
    read -n 1 -p "blocked"
  else
    break
  fi
done

if [[ $curl40 =~ "error" ]]; then
    echo "40-Sai info"
    echo "'3372217594764" >> track-OrderID.txt
    echo "valeriepierr@gmail.com" >> track-email.txt
    echo "Sai info" >> track-usItemId.txt
    echo "Sai info" >> track-priceValue.txt
    echo "Sai info" >> track-fullName.txt
    echo "Sai info" >> track-address.txt
    echo "Sai info" >> track-status.txt
    echo "Sai info" >> track-number.txt
    echo "Sai info" >> track-url.txt
    echo "Sai info" >> track-categoriesType.txt
else
    sum40=`md5 track-OrderID.txt`
    for (( i=0; i<=4; i++ ))
    do
        for (( j=0; j<=4; j++))
        do
            if [[ `echo $curl40 | jq '.data.guestOrder.groups_2101['${i[@]}'].items['${j[@]}'].productInfo.usItemId'` == '"54316097"' ]]; then
                echo "'3372217594764" >> track-OrderID.txt
                echo valeriepierr@gmail.com >> track-email.txt
                echo $curl40 | jq '.data.guestOrder.groups_2101['${i[@]}'].items['${j[@]}'].productInfo.usItemId' >> track-usItemId.txt
                echo $curl40 | jq '.data.guestOrder.groups_2101['${i[@]}'].items['${j[@]}'].priceInfo.linePrice.value' >> track-priceValue.txt
                echo $curl40 | jq '.data.guestOrder.groups_2101['${i[@]}'].deliveryAddress.fullName' >> track-fullName.txt
                echo $curl40 | jq '.data.guestOrder.groups_2101['${i[@]}'].deliveryAddress.address.addressString' >> track-address.txt
                echo $curl40 | jq '.data.guestOrder.groups_2101['${i[@]}'].status.message.parts[].text' >> track-status.txt
                echo $curl40 | jq '.data.guestOrder.groups_2101['${i[@]}'].shipment.trackingNumber' | sed 's/null//g' >> track-number.txt
                echo $curl40 | jq '.data.guestOrder.groups_2101['${i[@]}'].shipment.trackingUrl' | sed 's/null//g' >> track-url.txt
                echo $curl40 | jq '.data.guestOrder.groups_2101['${i[@]}'].categories[].type' >> track-categoriesType.txt

                break
            fi
        done
    done
    if [[ $sum40 == `md5 track-OrderID.txt` ]]; then
        echo "40-Khác Item"
        echo "'3372217594764" >> track-OrderID.txt
        echo "valeriepierr@gmail.com" >> track-email.txt
        echo "Khác Item" >> track-usItemId.txt
        echo "Khác Item" >> track-priceValue.txt
        echo "Khác Item" >> track-fullName.txt
        echo "Khác Item" >> track-address.txt
        echo "Khác Item" >> track-status.txt
        echo "Khác Item" >> track-number.txt
        echo "Khác Item" >> track-url.txt
        echo "Khác Item" >> track-categoriesType.txt
    else
        echo "40"
    fi   
fi
while true
do
curl41=`curl -s 'https://www.walmart.com/orchestra/home/graphql' \
  -H 'authority: www.walmart.com' \
  -H 'sec-ch-ua: " Not;A Brand";v="99", "Microsoft Edge";v="97", "Chromium";v="97"' \
  -H 'x-o-platform: rweb' \
  -H 'dnt: 1' \
  -H 'x-o-correlation-id: pn9BnlEx0zDiyvRGJ6nL5BS9pDN7erB017Nf' \
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
  -H 'user-agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.51 Safari/537.36 Edg/99.0.1150.36' \
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
  --data-raw $'{"query":"query getGuestOrder($orderId:ID\u0021 $emailAddress:String\u0021){guestOrder(input:{id:$orderId emailAddress:$emailAddress}){...OrderFieldsFragment}}fragment cancelReason on OrderCancelReason{__typename subReasonCode subDescription}fragment priceDetailFragment on OrderPriceDetailRow{label value displayValue info{title message}rowInfo{...orderPriceDetailRowInfo}}fragment orderPriceDetailRowInfo on OrderPriceDetailRowInfo{title message{...textFragment}}fragment price on Price{displayValue value}fragment variants on MapEntry{name value}fragment OrderAddOn on OrderAddOn{lineId uniqueLineId productInfo{name usItemId offerId}quantityString quantityLabel type fulfillmentInstructions{...textFragment}actions{manageProtectionPlan{...orderActionFragment}cancel}priceInfo{linePrice{...price}}quantity isActive}fragment orderDonationDetails on OrderDonationDetails{message{...textFragment}emailReceipt emailReceiptToken status{...textFragment}errorStatus}fragment orderLineItem on OrderLineItem{id uniqueId actions{contactSeller cancel addToCart configureCake reviewItem resendEGiftCardToken protectionPlan{...orderActionFragment}manageProtectionPlan{...orderActionFragment}}isGift digitalDeliveryMessage quantity quantityString quantityLabel isSubstitutionSelected fulfilledItems{id quantityString priceInfo{itemPrice{value}}productInfo{usItemId name}}isReturnable returnEligibilityMessage productInfo{name usItemId imageInfo{thumbnailUrl}canonicalUrl offerId orderLimit orderMinLimit weightIncrement salesUnit salesUnitType isSubstitutionEligible isAlcohol}reshop{reshopMessage isShippingAvailable minPromiseDate maxPromiseDate}selectedVariants{...variants}variantAdditionalInfo{parts{text nativeAction}}priceInfo{priceDisplayCodes{showItemPrice priceDisplayCondition finalCostByWeight}itemPrice{...price}linePrice{...price}unitPrice{...price}preDiscountedLinePrice{...price}additionalLines{name value}}discounts{label labelText{...textFragment}}itemReviewed activationCodes{label code}protectionPlanMessage{...textFragment}showSeller isShippedByWalmart seller{id name isPro}digitalDeliveryPhoneNumber addOns{...OrderAddOn}multiboxBundleId}fragment DriverFragment on Driver{id firstName photoUrl}fragment OrderGroupFragment on OrderGroup{driver{...DriverFragment}deliveryDate fulfillmentType status{...OrderGroupStatusFragment}showSeller isShippedByWalmart seller{...SellerFragment}id itemCount items{...LiteLineItemFragment}pickupPerson{firstName lastName email}accessPointId shipment{...ShipmentFragment}returnEligibilityMessage actions{...OrderGroupActionsFragment}recipientEmailAddress digitalDelivery{...DigitalDeliveryFragment}tireInstallationReservation{status extraText reservationId}}fragment OrderGroupStatusFragment on OrderGroupStatus{statusType showStatusTracker statusTracker{status label isCurrent}message{...textFragment}subtext subMessage{...textFragment}notice helpCenterText{...textFragment}}fragment textFragment on Text{parts{bold url text nativeAction lineBreak}}fragment LiteLineItemFragment on OrderLineItem{id quantity productInfo{name usItemId imageInfo{thumbnailUrl}offerId isAlcohol}priceInfo{linePrice{...price}}}fragment SellerFragment on GroupSeller{id name isPro}fragment DigitalDeliveryFragment on DigitalDelivery{title name instructions{...textFragment}}fragment ShipmentFragment on Shipment{id trackingNumber isExternalTracking trackingUrl proofOfDelivery{...ProofOfDeliveryFragment}}fragment OrderGroupActionsFragment on OrderGroupActions{reorder edit track changeSlot checkin editDeliveryInstructions editPickupPerson editTip tip rateDriver cancel enableTip{...orderActionFragment}enableEdit{...orderActionFragment}rescheduleTireInstall{...orderActionFragment}cancelTireInstall{...orderActionFragment}help viewCancellationDetails{...cancellationDetailsActionFragment}}fragment cancellationDetailsActionFragment on CancellationDetailsAction{label heading text{...textFragment}}fragment ProofOfDeliveryFragment on ProofOfDelivery{photoUrl photoPreviewUrl showPreview}fragment DeliveryInstructionsFragment on DeliveryInstructions{text type typeText}fragment GiftDetailsFragment on GiftDetails{recipientAddress{fullName}recipientEmail senderName giftMessage}fragment SubstitutionAction on SubstitutionAction{message label type}fragment ODPGroupCategoryFragment on OrderCategory{type name subtext returnMessage substitutionsBanner{...textFragment}showExtendedSubstitutions actions{substitutions{...SubstitutionAction}nilPickReshop{message action{text url}}returnDetails viewCancellationDetails{...cancellationDetailsActionFragment}trackOnInHomeApp}banner{...textFragment}accordionState items{...orderLineItem}substitutions{...orderLineItem fulfilledItems{...orderLineItem}}returnInfo{...returnInfoFragment}}fragment ODPGroupFragment on OrderGroup{id fulfillmentType deliveryMessage deliveryAddress{fullName firstName lastName address{...addressFragment}}deliveryInstructions{...DeliveryInstructionsFragment}deliveryPreferences{text{...textFragment}cta{...orderActionFragment}}editSubstitutionsCutOff status{statusType showStatusTracker message{...textFragment}notice helpCenterText{...textFragment}}itemCount isCategorized categories{...ODPGroupCategoryFragment}seller{id name isPro}shipment{id trackingNumber}actions{reorder edit track changeSlot checkin editDeliveryInstructions editPickupPerson tip cancel help enableTip{...orderActionFragment}enableEdit{...orderActionFragment}viewCancellationDetails{...cancellationDetailsActionFragment}enableInHome{...orderActionFragment}createGiftReceipt}cutOffTimestamp isEditSubstitutionsEligible isInHome giftDetails{...GiftDetailsFragment}donationDetails{...orderDonationDetails}}fragment returnInfoFragment on ReturnInfo{returnOrderId type refundPriceDetails{__typename...refundPriceDetailsFragment}refundMessage tierRefundMessage paymentMethods{__typename description cardType paymentType displayValues message{...textFragment}}actions{__typename generate scheduleOrModifyPickup{text url}reschedulePickup editPickupContact}shippingLabelUrl qrCodeImageUrl carriers{__typename id name}pickupCarrier pickupContact{nameAndAddress{fullName firstName lastName address{addressString city state postalCode addressLineOne addressLineTwo country}}phone}pickupConfirmationNumber bannerMessage{...textFragment}}fragment refundPriceDetailsFragment on RefundPriceDetails{subTotal{__typename...orderPriceDetailRowFragment}fees{__typename...orderPriceDetailRowFragment}discounts{__typename...orderPriceDetailRowFragment}taxTotal{__typename...orderPriceDetailRowFragment}grandTotal{__typename...orderPriceDetailRowFragment}}fragment orderPriceDetailRowFragment on OrderPriceDetailRow{label displayValue value info{__typename title message}}fragment addressFragment on OrderAddress{addressString addressLineOne addressLineTwo state postalCode city}fragment ODPPickupInfo on OrderGroup{pickupInstructions pickupPerson{...person}alternatePickupPerson{...person}store{id name address{...addressFragment}}}fragment person on OrderPickupPerson{firstName lastName email}fragment ODPTippingInfo on OrderGroup{addTipMessage{...textFragment}driver{...DriverFragment}tipping{min{...price}max{...price}suggested{...price}preselected}subtotal{...price}}fragment orderActionFragment on Action{text url}fragment orderCustomer on OrderCustomer{id firstName lastName email isGuest isEmailRegistered}fragment OrderFieldsFragment on Order{__typename id version type customer{...orderCustomer}displayId idBarcodeImageUrl(barWidth:3 barHeight:100) isFuelPurchase title shortTitle timezone tippableGroup{...OrderGroupFragment}amendableGroup{id changeSlotIterationsLeft cutOffTimestamp fulfillmentType deliveryAddress{fullName firstName lastName address{addressString addressLineOne addressLineTwo state postalCode city country}}isAmendInProgress}substitutionsBanner{heading subheading longSubheading}groups_2101{__typename...OrderGroupFragment...ODPGroupFragment...ODPPickupInfo...ODPTippingInfo}multiboxBundles{...orderLineItem}itemCancelReasons{__typename...cancelReason}groupCancelReasons{__typename...cancelReason}priceDetails{__typename subTotal{__typename...priceDetailFragment}taxTotal{__typename...priceDetailFragment}grandTotal{__typename...priceDetailFragment}authorizationAmount{__typename...priceDetailFragment}fees{__typename...priceDetailFragment}discounts{__typename...priceDetailFragment}minimumThreshold{__typename...price}belowMinimumFee{__typename...priceDetailFragment}driverTip{__typename...priceDetailFragment}donations{__typename...priceDetailFragment}}paymentMethods{__typename description cardType paymentType displayValues message{...textFragment}actions{connectToCapitalOne{...orderActionFragment}visitAffirm{...orderActionFragment}}}actions{__typename return pendingReturn cancel startReturn{...orderActionFragment}reorder}banners{...textFragment}}","variables":{"orderId":"3402223523553","emailAddress":"aviles742@yahoo.com"}}' \
  --compressed`
 
  if [[ $curl41 =~ "blocked" ]]; then
    link41=`echo $curl41 | jq '.redirectUrl' | sed 's/"//g'`
    `open -n -a /Applications/Microsoft\ Edge.app --args --profile-directory=Default https://walmart.com$link41`
    read -n 1 -p "blocked"
  else
    break
  fi
done

if [[ $curl41 =~ "error" ]]; then
    echo "41-Sai info"
    echo "'3402223523553" >> track-OrderID.txt
    echo "aviles742@yahoo.com" >> track-email.txt
    echo "Sai info" >> track-usItemId.txt
    echo "Sai info" >> track-priceValue.txt
    echo "Sai info" >> track-fullName.txt
    echo "Sai info" >> track-address.txt
    echo "Sai info" >> track-status.txt
    echo "Sai info" >> track-number.txt
    echo "Sai info" >> track-url.txt
    echo "Sai info" >> track-categoriesType.txt
else
    sum41=`md5 track-OrderID.txt`
    for (( i=0; i<=4; i++ ))
    do
        for (( j=0; j<=4; j++))
        do
            if [[ `echo $curl41 | jq '.data.guestOrder.groups_2101['${i[@]}'].items['${j[@]}'].productInfo.usItemId'` == '"514921600"' ]]; then
                echo "'3402223523553" >> track-OrderID.txt
                echo aviles742@yahoo.com >> track-email.txt
                echo $curl41 | jq '.data.guestOrder.groups_2101['${i[@]}'].items['${j[@]}'].productInfo.usItemId' >> track-usItemId.txt
                echo $curl41 | jq '.data.guestOrder.groups_2101['${i[@]}'].items['${j[@]}'].priceInfo.linePrice.value' >> track-priceValue.txt
                echo $curl41 | jq '.data.guestOrder.groups_2101['${i[@]}'].deliveryAddress.fullName' >> track-fullName.txt
                echo $curl41 | jq '.data.guestOrder.groups_2101['${i[@]}'].deliveryAddress.address.addressString' >> track-address.txt
                echo $curl41 | jq '.data.guestOrder.groups_2101['${i[@]}'].status.message.parts[].text' >> track-status.txt
                echo $curl41 | jq '.data.guestOrder.groups_2101['${i[@]}'].shipment.trackingNumber' | sed 's/null//g' >> track-number.txt
                echo $curl41 | jq '.data.guestOrder.groups_2101['${i[@]}'].shipment.trackingUrl' | sed 's/null//g' >> track-url.txt
                echo $curl41 | jq '.data.guestOrder.groups_2101['${i[@]}'].categories[].type' >> track-categoriesType.txt

                break
            fi
        done
    done
    if [[ $sum41 == `md5 track-OrderID.txt` ]]; then
        echo "41-Khác Item"
        echo "'3402223523553" >> track-OrderID.txt
        echo "aviles742@yahoo.com" >> track-email.txt
        echo "Khác Item" >> track-usItemId.txt
        echo "Khác Item" >> track-priceValue.txt
        echo "Khác Item" >> track-fullName.txt
        echo "Khác Item" >> track-address.txt
        echo "Khác Item" >> track-status.txt
        echo "Khác Item" >> track-number.txt
        echo "Khác Item" >> track-url.txt
        echo "Khác Item" >> track-categoriesType.txt
    else
        echo "41"
    fi   
fi
while true
do
curl42=`curl -s 'https://www.walmart.com/orchestra/home/graphql' \
  -H 'authority: www.walmart.com' \
  -H 'sec-ch-ua: " Not;A Brand";v="99", "Microsoft Edge";v="97", "Chromium";v="97"' \
  -H 'x-o-platform: rweb' \
  -H 'dnt: 1' \
  -H 'x-o-correlation-id: pn9BnlEx0zDiyvRGJ6nL5BS9pDN7erB017Nf' \
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
  -H 'user-agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.51 Safari/537.36 Edg/99.0.1150.36' \
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
  --data-raw $'{"query":"query getGuestOrder($orderId:ID\u0021 $emailAddress:String\u0021){guestOrder(input:{id:$orderId emailAddress:$emailAddress}){...OrderFieldsFragment}}fragment cancelReason on OrderCancelReason{__typename subReasonCode subDescription}fragment priceDetailFragment on OrderPriceDetailRow{label value displayValue info{title message}rowInfo{...orderPriceDetailRowInfo}}fragment orderPriceDetailRowInfo on OrderPriceDetailRowInfo{title message{...textFragment}}fragment price on Price{displayValue value}fragment variants on MapEntry{name value}fragment OrderAddOn on OrderAddOn{lineId uniqueLineId productInfo{name usItemId offerId}quantityString quantityLabel type fulfillmentInstructions{...textFragment}actions{manageProtectionPlan{...orderActionFragment}cancel}priceInfo{linePrice{...price}}quantity isActive}fragment orderDonationDetails on OrderDonationDetails{message{...textFragment}emailReceipt emailReceiptToken status{...textFragment}errorStatus}fragment orderLineItem on OrderLineItem{id uniqueId actions{contactSeller cancel addToCart configureCake reviewItem resendEGiftCardToken protectionPlan{...orderActionFragment}manageProtectionPlan{...orderActionFragment}}isGift digitalDeliveryMessage quantity quantityString quantityLabel isSubstitutionSelected fulfilledItems{id quantityString priceInfo{itemPrice{value}}productInfo{usItemId name}}isReturnable returnEligibilityMessage productInfo{name usItemId imageInfo{thumbnailUrl}canonicalUrl offerId orderLimit orderMinLimit weightIncrement salesUnit salesUnitType isSubstitutionEligible isAlcohol}reshop{reshopMessage isShippingAvailable minPromiseDate maxPromiseDate}selectedVariants{...variants}variantAdditionalInfo{parts{text nativeAction}}priceInfo{priceDisplayCodes{showItemPrice priceDisplayCondition finalCostByWeight}itemPrice{...price}linePrice{...price}unitPrice{...price}preDiscountedLinePrice{...price}additionalLines{name value}}discounts{label labelText{...textFragment}}itemReviewed activationCodes{label code}protectionPlanMessage{...textFragment}showSeller isShippedByWalmart seller{id name isPro}digitalDeliveryPhoneNumber addOns{...OrderAddOn}multiboxBundleId}fragment DriverFragment on Driver{id firstName photoUrl}fragment OrderGroupFragment on OrderGroup{driver{...DriverFragment}deliveryDate fulfillmentType status{...OrderGroupStatusFragment}showSeller isShippedByWalmart seller{...SellerFragment}id itemCount items{...LiteLineItemFragment}pickupPerson{firstName lastName email}accessPointId shipment{...ShipmentFragment}returnEligibilityMessage actions{...OrderGroupActionsFragment}recipientEmailAddress digitalDelivery{...DigitalDeliveryFragment}tireInstallationReservation{status extraText reservationId}}fragment OrderGroupStatusFragment on OrderGroupStatus{statusType showStatusTracker statusTracker{status label isCurrent}message{...textFragment}subtext subMessage{...textFragment}notice helpCenterText{...textFragment}}fragment textFragment on Text{parts{bold url text nativeAction lineBreak}}fragment LiteLineItemFragment on OrderLineItem{id quantity productInfo{name usItemId imageInfo{thumbnailUrl}offerId isAlcohol}priceInfo{linePrice{...price}}}fragment SellerFragment on GroupSeller{id name isPro}fragment DigitalDeliveryFragment on DigitalDelivery{title name instructions{...textFragment}}fragment ShipmentFragment on Shipment{id trackingNumber isExternalTracking trackingUrl proofOfDelivery{...ProofOfDeliveryFragment}}fragment OrderGroupActionsFragment on OrderGroupActions{reorder edit track changeSlot checkin editDeliveryInstructions editPickupPerson editTip tip rateDriver cancel enableTip{...orderActionFragment}enableEdit{...orderActionFragment}rescheduleTireInstall{...orderActionFragment}cancelTireInstall{...orderActionFragment}help viewCancellationDetails{...cancellationDetailsActionFragment}}fragment cancellationDetailsActionFragment on CancellationDetailsAction{label heading text{...textFragment}}fragment ProofOfDeliveryFragment on ProofOfDelivery{photoUrl photoPreviewUrl showPreview}fragment DeliveryInstructionsFragment on DeliveryInstructions{text type typeText}fragment GiftDetailsFragment on GiftDetails{recipientAddress{fullName}recipientEmail senderName giftMessage}fragment SubstitutionAction on SubstitutionAction{message label type}fragment ODPGroupCategoryFragment on OrderCategory{type name subtext returnMessage substitutionsBanner{...textFragment}showExtendedSubstitutions actions{substitutions{...SubstitutionAction}nilPickReshop{message action{text url}}returnDetails viewCancellationDetails{...cancellationDetailsActionFragment}trackOnInHomeApp}banner{...textFragment}accordionState items{...orderLineItem}substitutions{...orderLineItem fulfilledItems{...orderLineItem}}returnInfo{...returnInfoFragment}}fragment ODPGroupFragment on OrderGroup{id fulfillmentType deliveryMessage deliveryAddress{fullName firstName lastName address{...addressFragment}}deliveryInstructions{...DeliveryInstructionsFragment}deliveryPreferences{text{...textFragment}cta{...orderActionFragment}}editSubstitutionsCutOff status{statusType showStatusTracker message{...textFragment}notice helpCenterText{...textFragment}}itemCount isCategorized categories{...ODPGroupCategoryFragment}seller{id name isPro}shipment{id trackingNumber}actions{reorder edit track changeSlot checkin editDeliveryInstructions editPickupPerson tip cancel help enableTip{...orderActionFragment}enableEdit{...orderActionFragment}viewCancellationDetails{...cancellationDetailsActionFragment}enableInHome{...orderActionFragment}createGiftReceipt}cutOffTimestamp isEditSubstitutionsEligible isInHome giftDetails{...GiftDetailsFragment}donationDetails{...orderDonationDetails}}fragment returnInfoFragment on ReturnInfo{returnOrderId type refundPriceDetails{__typename...refundPriceDetailsFragment}refundMessage tierRefundMessage paymentMethods{__typename description cardType paymentType displayValues message{...textFragment}}actions{__typename generate scheduleOrModifyPickup{text url}reschedulePickup editPickupContact}shippingLabelUrl qrCodeImageUrl carriers{__typename id name}pickupCarrier pickupContact{nameAndAddress{fullName firstName lastName address{addressString city state postalCode addressLineOne addressLineTwo country}}phone}pickupConfirmationNumber bannerMessage{...textFragment}}fragment refundPriceDetailsFragment on RefundPriceDetails{subTotal{__typename...orderPriceDetailRowFragment}fees{__typename...orderPriceDetailRowFragment}discounts{__typename...orderPriceDetailRowFragment}taxTotal{__typename...orderPriceDetailRowFragment}grandTotal{__typename...orderPriceDetailRowFragment}}fragment orderPriceDetailRowFragment on OrderPriceDetailRow{label displayValue value info{__typename title message}}fragment addressFragment on OrderAddress{addressString addressLineOne addressLineTwo state postalCode city}fragment ODPPickupInfo on OrderGroup{pickupInstructions pickupPerson{...person}alternatePickupPerson{...person}store{id name address{...addressFragment}}}fragment person on OrderPickupPerson{firstName lastName email}fragment ODPTippingInfo on OrderGroup{addTipMessage{...textFragment}driver{...DriverFragment}tipping{min{...price}max{...price}suggested{...price}preselected}subtotal{...price}}fragment orderActionFragment on Action{text url}fragment orderCustomer on OrderCustomer{id firstName lastName email isGuest isEmailRegistered}fragment OrderFieldsFragment on Order{__typename id version type customer{...orderCustomer}displayId idBarcodeImageUrl(barWidth:3 barHeight:100) isFuelPurchase title shortTitle timezone tippableGroup{...OrderGroupFragment}amendableGroup{id changeSlotIterationsLeft cutOffTimestamp fulfillmentType deliveryAddress{fullName firstName lastName address{addressString addressLineOne addressLineTwo state postalCode city country}}isAmendInProgress}substitutionsBanner{heading subheading longSubheading}groups_2101{__typename...OrderGroupFragment...ODPGroupFragment...ODPPickupInfo...ODPTippingInfo}multiboxBundles{...orderLineItem}itemCancelReasons{__typename...cancelReason}groupCancelReasons{__typename...cancelReason}priceDetails{__typename subTotal{__typename...priceDetailFragment}taxTotal{__typename...priceDetailFragment}grandTotal{__typename...priceDetailFragment}authorizationAmount{__typename...priceDetailFragment}fees{__typename...priceDetailFragment}discounts{__typename...priceDetailFragment}minimumThreshold{__typename...price}belowMinimumFee{__typename...priceDetailFragment}driverTip{__typename...priceDetailFragment}donations{__typename...priceDetailFragment}}paymentMethods{__typename description cardType paymentType displayValues message{...textFragment}actions{connectToCapitalOne{...orderActionFragment}visitAffirm{...orderActionFragment}}}actions{__typename return pendingReturn cancel startReturn{...orderActionFragment}reorder}banners{...textFragment}}","variables":{"orderId":"3372217394043","emailAddress":"russarmes@yahoo.com"}}' \
  --compressed`
 
  if [[ $curl42 =~ "blocked" ]]; then
    link42=`echo $curl42 | jq '.redirectUrl' | sed 's/"//g'`
    `open -n -a /Applications/Microsoft\ Edge.app --args --profile-directory=Default https://walmart.com$link42`
    read -n 1 -p "blocked"
  else
    break
  fi
done

if [[ $curl42 =~ "error" ]]; then
    echo "42-Sai info"
    echo "'3372217394043" >> track-OrderID.txt
    echo "russarmes@yahoo.com" >> track-email.txt
    echo "Sai info" >> track-usItemId.txt
    echo "Sai info" >> track-priceValue.txt
    echo "Sai info" >> track-fullName.txt
    echo "Sai info" >> track-address.txt
    echo "Sai info" >> track-status.txt
    echo "Sai info" >> track-number.txt
    echo "Sai info" >> track-url.txt
    echo "Sai info" >> track-categoriesType.txt
else
    sum42=`md5 track-OrderID.txt`
    for (( i=0; i<=4; i++ ))
    do
        for (( j=0; j<=4; j++))
        do
            if [[ `echo $curl42 | jq '.data.guestOrder.groups_2101['${i[@]}'].items['${j[@]}'].productInfo.usItemId'` == '"240828726"' ]]; then
                echo "'3372217394043" >> track-OrderID.txt
                echo russarmes@yahoo.com >> track-email.txt
                echo $curl42 | jq '.data.guestOrder.groups_2101['${i[@]}'].items['${j[@]}'].productInfo.usItemId' >> track-usItemId.txt
                echo $curl42 | jq '.data.guestOrder.groups_2101['${i[@]}'].items['${j[@]}'].priceInfo.linePrice.value' >> track-priceValue.txt
                echo $curl42 | jq '.data.guestOrder.groups_2101['${i[@]}'].deliveryAddress.fullName' >> track-fullName.txt
                echo $curl42 | jq '.data.guestOrder.groups_2101['${i[@]}'].deliveryAddress.address.addressString' >> track-address.txt
                echo $curl42 | jq '.data.guestOrder.groups_2101['${i[@]}'].status.message.parts[].text' >> track-status.txt
                echo $curl42 | jq '.data.guestOrder.groups_2101['${i[@]}'].shipment.trackingNumber' | sed 's/null//g' >> track-number.txt
                echo $curl42 | jq '.data.guestOrder.groups_2101['${i[@]}'].shipment.trackingUrl' | sed 's/null//g' >> track-url.txt
                echo $curl42 | jq '.data.guestOrder.groups_2101['${i[@]}'].categories[].type' >> track-categoriesType.txt

                break
            fi
        done
    done
    if [[ $sum42 == `md5 track-OrderID.txt` ]]; then
        echo "42-Khác Item"
        echo "'3372217394043" >> track-OrderID.txt
        echo "russarmes@yahoo.com" >> track-email.txt
        echo "Khác Item" >> track-usItemId.txt
        echo "Khác Item" >> track-priceValue.txt
        echo "Khác Item" >> track-fullName.txt
        echo "Khác Item" >> track-address.txt
        echo "Khác Item" >> track-status.txt
        echo "Khác Item" >> track-number.txt
        echo "Khác Item" >> track-url.txt
        echo "Khác Item" >> track-categoriesType.txt
    else
        echo "42"
    fi   
fi
while true
do
curl43=`curl -s 'https://www.walmart.com/orchestra/home/graphql' \
  -H 'authority: www.walmart.com' \
  -H 'sec-ch-ua: " Not;A Brand";v="99", "Microsoft Edge";v="97", "Chromium";v="97"' \
  -H 'x-o-platform: rweb' \
  -H 'dnt: 1' \
  -H 'x-o-correlation-id: pn9BnlEx0zDiyvRGJ6nL5BS9pDN7erB017Nf' \
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
  -H 'user-agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.51 Safari/537.36 Edg/99.0.1150.36' \
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
  --data-raw $'{"query":"query getGuestOrder($orderId:ID\u0021 $emailAddress:String\u0021){guestOrder(input:{id:$orderId emailAddress:$emailAddress}){...OrderFieldsFragment}}fragment cancelReason on OrderCancelReason{__typename subReasonCode subDescription}fragment priceDetailFragment on OrderPriceDetailRow{label value displayValue info{title message}rowInfo{...orderPriceDetailRowInfo}}fragment orderPriceDetailRowInfo on OrderPriceDetailRowInfo{title message{...textFragment}}fragment price on Price{displayValue value}fragment variants on MapEntry{name value}fragment OrderAddOn on OrderAddOn{lineId uniqueLineId productInfo{name usItemId offerId}quantityString quantityLabel type fulfillmentInstructions{...textFragment}actions{manageProtectionPlan{...orderActionFragment}cancel}priceInfo{linePrice{...price}}quantity isActive}fragment orderDonationDetails on OrderDonationDetails{message{...textFragment}emailReceipt emailReceiptToken status{...textFragment}errorStatus}fragment orderLineItem on OrderLineItem{id uniqueId actions{contactSeller cancel addToCart configureCake reviewItem resendEGiftCardToken protectionPlan{...orderActionFragment}manageProtectionPlan{...orderActionFragment}}isGift digitalDeliveryMessage quantity quantityString quantityLabel isSubstitutionSelected fulfilledItems{id quantityString priceInfo{itemPrice{value}}productInfo{usItemId name}}isReturnable returnEligibilityMessage productInfo{name usItemId imageInfo{thumbnailUrl}canonicalUrl offerId orderLimit orderMinLimit weightIncrement salesUnit salesUnitType isSubstitutionEligible isAlcohol}reshop{reshopMessage isShippingAvailable minPromiseDate maxPromiseDate}selectedVariants{...variants}variantAdditionalInfo{parts{text nativeAction}}priceInfo{priceDisplayCodes{showItemPrice priceDisplayCondition finalCostByWeight}itemPrice{...price}linePrice{...price}unitPrice{...price}preDiscountedLinePrice{...price}additionalLines{name value}}discounts{label labelText{...textFragment}}itemReviewed activationCodes{label code}protectionPlanMessage{...textFragment}showSeller isShippedByWalmart seller{id name isPro}digitalDeliveryPhoneNumber addOns{...OrderAddOn}multiboxBundleId}fragment DriverFragment on Driver{id firstName photoUrl}fragment OrderGroupFragment on OrderGroup{driver{...DriverFragment}deliveryDate fulfillmentType status{...OrderGroupStatusFragment}showSeller isShippedByWalmart seller{...SellerFragment}id itemCount items{...LiteLineItemFragment}pickupPerson{firstName lastName email}accessPointId shipment{...ShipmentFragment}returnEligibilityMessage actions{...OrderGroupActionsFragment}recipientEmailAddress digitalDelivery{...DigitalDeliveryFragment}tireInstallationReservation{status extraText reservationId}}fragment OrderGroupStatusFragment on OrderGroupStatus{statusType showStatusTracker statusTracker{status label isCurrent}message{...textFragment}subtext subMessage{...textFragment}notice helpCenterText{...textFragment}}fragment textFragment on Text{parts{bold url text nativeAction lineBreak}}fragment LiteLineItemFragment on OrderLineItem{id quantity productInfo{name usItemId imageInfo{thumbnailUrl}offerId isAlcohol}priceInfo{linePrice{...price}}}fragment SellerFragment on GroupSeller{id name isPro}fragment DigitalDeliveryFragment on DigitalDelivery{title name instructions{...textFragment}}fragment ShipmentFragment on Shipment{id trackingNumber isExternalTracking trackingUrl proofOfDelivery{...ProofOfDeliveryFragment}}fragment OrderGroupActionsFragment on OrderGroupActions{reorder edit track changeSlot checkin editDeliveryInstructions editPickupPerson editTip tip rateDriver cancel enableTip{...orderActionFragment}enableEdit{...orderActionFragment}rescheduleTireInstall{...orderActionFragment}cancelTireInstall{...orderActionFragment}help viewCancellationDetails{...cancellationDetailsActionFragment}}fragment cancellationDetailsActionFragment on CancellationDetailsAction{label heading text{...textFragment}}fragment ProofOfDeliveryFragment on ProofOfDelivery{photoUrl photoPreviewUrl showPreview}fragment DeliveryInstructionsFragment on DeliveryInstructions{text type typeText}fragment GiftDetailsFragment on GiftDetails{recipientAddress{fullName}recipientEmail senderName giftMessage}fragment SubstitutionAction on SubstitutionAction{message label type}fragment ODPGroupCategoryFragment on OrderCategory{type name subtext returnMessage substitutionsBanner{...textFragment}showExtendedSubstitutions actions{substitutions{...SubstitutionAction}nilPickReshop{message action{text url}}returnDetails viewCancellationDetails{...cancellationDetailsActionFragment}trackOnInHomeApp}banner{...textFragment}accordionState items{...orderLineItem}substitutions{...orderLineItem fulfilledItems{...orderLineItem}}returnInfo{...returnInfoFragment}}fragment ODPGroupFragment on OrderGroup{id fulfillmentType deliveryMessage deliveryAddress{fullName firstName lastName address{...addressFragment}}deliveryInstructions{...DeliveryInstructionsFragment}deliveryPreferences{text{...textFragment}cta{...orderActionFragment}}editSubstitutionsCutOff status{statusType showStatusTracker message{...textFragment}notice helpCenterText{...textFragment}}itemCount isCategorized categories{...ODPGroupCategoryFragment}seller{id name isPro}shipment{id trackingNumber}actions{reorder edit track changeSlot checkin editDeliveryInstructions editPickupPerson tip cancel help enableTip{...orderActionFragment}enableEdit{...orderActionFragment}viewCancellationDetails{...cancellationDetailsActionFragment}enableInHome{...orderActionFragment}createGiftReceipt}cutOffTimestamp isEditSubstitutionsEligible isInHome giftDetails{...GiftDetailsFragment}donationDetails{...orderDonationDetails}}fragment returnInfoFragment on ReturnInfo{returnOrderId type refundPriceDetails{__typename...refundPriceDetailsFragment}refundMessage tierRefundMessage paymentMethods{__typename description cardType paymentType displayValues message{...textFragment}}actions{__typename generate scheduleOrModifyPickup{text url}reschedulePickup editPickupContact}shippingLabelUrl qrCodeImageUrl carriers{__typename id name}pickupCarrier pickupContact{nameAndAddress{fullName firstName lastName address{addressString city state postalCode addressLineOne addressLineTwo country}}phone}pickupConfirmationNumber bannerMessage{...textFragment}}fragment refundPriceDetailsFragment on RefundPriceDetails{subTotal{__typename...orderPriceDetailRowFragment}fees{__typename...orderPriceDetailRowFragment}discounts{__typename...orderPriceDetailRowFragment}taxTotal{__typename...orderPriceDetailRowFragment}grandTotal{__typename...orderPriceDetailRowFragment}}fragment orderPriceDetailRowFragment on OrderPriceDetailRow{label displayValue value info{__typename title message}}fragment addressFragment on OrderAddress{addressString addressLineOne addressLineTwo state postalCode city}fragment ODPPickupInfo on OrderGroup{pickupInstructions pickupPerson{...person}alternatePickupPerson{...person}store{id name address{...addressFragment}}}fragment person on OrderPickupPerson{firstName lastName email}fragment ODPTippingInfo on OrderGroup{addTipMessage{...textFragment}driver{...DriverFragment}tipping{min{...price}max{...price}suggested{...price}preselected}subtotal{...price}}fragment orderActionFragment on Action{text url}fragment orderCustomer on OrderCustomer{id firstName lastName email isGuest isEmailRegistered}fragment OrderFieldsFragment on Order{__typename id version type customer{...orderCustomer}displayId idBarcodeImageUrl(barWidth:3 barHeight:100) isFuelPurchase title shortTitle timezone tippableGroup{...OrderGroupFragment}amendableGroup{id changeSlotIterationsLeft cutOffTimestamp fulfillmentType deliveryAddress{fullName firstName lastName address{addressString addressLineOne addressLineTwo state postalCode city country}}isAmendInProgress}substitutionsBanner{heading subheading longSubheading}groups_2101{__typename...OrderGroupFragment...ODPGroupFragment...ODPPickupInfo...ODPTippingInfo}multiboxBundles{...orderLineItem}itemCancelReasons{__typename...cancelReason}groupCancelReasons{__typename...cancelReason}priceDetails{__typename subTotal{__typename...priceDetailFragment}taxTotal{__typename...priceDetailFragment}grandTotal{__typename...priceDetailFragment}authorizationAmount{__typename...priceDetailFragment}fees{__typename...priceDetailFragment}discounts{__typename...priceDetailFragment}minimumThreshold{__typename...price}belowMinimumFee{__typename...priceDetailFragment}driverTip{__typename...priceDetailFragment}donations{__typename...priceDetailFragment}}paymentMethods{__typename description cardType paymentType displayValues message{...textFragment}actions{connectToCapitalOne{...orderActionFragment}visitAffirm{...orderActionFragment}}}actions{__typename return pendingReturn cancel startReturn{...orderActionFragment}reorder}banners{...textFragment}}","variables":{"orderId":"3392221973688","emailAddress":"lachowitzerdennispaul@gmail.com"}}' \
  --compressed`
 
  if [[ $curl43 =~ "blocked" ]]; then
    link43=`echo $curl43 | jq '.redirectUrl' | sed 's/"//g'`
    `open -n -a /Applications/Microsoft\ Edge.app --args --profile-directory=Default https://walmart.com$link43`
    read -n 1 -p "blocked"
  else
    break
  fi
done

if [[ $curl43 =~ "error" ]]; then
    echo "43-Sai info"
    echo "'3392221973688" >> track-OrderID.txt
    echo "lachowitzerdennispaul@gmail.com" >> track-email.txt
    echo "Sai info" >> track-usItemId.txt
    echo "Sai info" >> track-priceValue.txt
    echo "Sai info" >> track-fullName.txt
    echo "Sai info" >> track-address.txt
    echo "Sai info" >> track-status.txt
    echo "Sai info" >> track-number.txt
    echo "Sai info" >> track-url.txt
    echo "Sai info" >> track-categoriesType.txt
else
    sum43=`md5 track-OrderID.txt`
    for (( i=0; i<=4; i++ ))
    do
        for (( j=0; j<=4; j++))
        do
            if [[ `echo $curl43 | jq '.data.guestOrder.groups_2101['${i[@]}'].items['${j[@]}'].productInfo.usItemId'` == '"227338487"' ]]; then
                echo "'3392221973688" >> track-OrderID.txt
                echo lachowitzerdennispaul@gmail.com >> track-email.txt
                echo $curl43 | jq '.data.guestOrder.groups_2101['${i[@]}'].items['${j[@]}'].productInfo.usItemId' >> track-usItemId.txt
                echo $curl43 | jq '.data.guestOrder.groups_2101['${i[@]}'].items['${j[@]}'].priceInfo.linePrice.value' >> track-priceValue.txt
                echo $curl43 | jq '.data.guestOrder.groups_2101['${i[@]}'].deliveryAddress.fullName' >> track-fullName.txt
                echo $curl43 | jq '.data.guestOrder.groups_2101['${i[@]}'].deliveryAddress.address.addressString' >> track-address.txt
                echo $curl43 | jq '.data.guestOrder.groups_2101['${i[@]}'].status.message.parts[].text' >> track-status.txt
                echo $curl43 | jq '.data.guestOrder.groups_2101['${i[@]}'].shipment.trackingNumber' | sed 's/null//g' >> track-number.txt
                echo $curl43 | jq '.data.guestOrder.groups_2101['${i[@]}'].shipment.trackingUrl' | sed 's/null//g' >> track-url.txt
                echo $curl43 | jq '.data.guestOrder.groups_2101['${i[@]}'].categories[].type' >> track-categoriesType.txt

                break
            fi
        done
    done
    if [[ $sum43 == `md5 track-OrderID.txt` ]]; then
        echo "43-Khác Item"
        echo "'3392221973688" >> track-OrderID.txt
        echo "lachowitzerdennispaul@gmail.com" >> track-email.txt
        echo "Khác Item" >> track-usItemId.txt
        echo "Khác Item" >> track-priceValue.txt
        echo "Khác Item" >> track-fullName.txt
        echo "Khác Item" >> track-address.txt
        echo "Khác Item" >> track-status.txt
        echo "Khác Item" >> track-number.txt
        echo "Khác Item" >> track-url.txt
        echo "Khác Item" >> track-categoriesType.txt
    else
        echo "43"
    fi   
fi
while true
do
curl44=`curl -s 'https://www.walmart.com/orchestra/home/graphql' \
  -H 'authority: www.walmart.com' \
  -H 'sec-ch-ua: " Not;A Brand";v="99", "Microsoft Edge";v="97", "Chromium";v="97"' \
  -H 'x-o-platform: rweb' \
  -H 'dnt: 1' \
  -H 'x-o-correlation-id: pn9BnlEx0zDiyvRGJ6nL5BS9pDN7erB017Nf' \
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
  -H 'user-agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.51 Safari/537.36 Edg/99.0.1150.36' \
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
  --data-raw $'{"query":"query getGuestOrder($orderId:ID\u0021 $emailAddress:String\u0021){guestOrder(input:{id:$orderId emailAddress:$emailAddress}){...OrderFieldsFragment}}fragment cancelReason on OrderCancelReason{__typename subReasonCode subDescription}fragment priceDetailFragment on OrderPriceDetailRow{label value displayValue info{title message}rowInfo{...orderPriceDetailRowInfo}}fragment orderPriceDetailRowInfo on OrderPriceDetailRowInfo{title message{...textFragment}}fragment price on Price{displayValue value}fragment variants on MapEntry{name value}fragment OrderAddOn on OrderAddOn{lineId uniqueLineId productInfo{name usItemId offerId}quantityString quantityLabel type fulfillmentInstructions{...textFragment}actions{manageProtectionPlan{...orderActionFragment}cancel}priceInfo{linePrice{...price}}quantity isActive}fragment orderDonationDetails on OrderDonationDetails{message{...textFragment}emailReceipt emailReceiptToken status{...textFragment}errorStatus}fragment orderLineItem on OrderLineItem{id uniqueId actions{contactSeller cancel addToCart configureCake reviewItem resendEGiftCardToken protectionPlan{...orderActionFragment}manageProtectionPlan{...orderActionFragment}}isGift digitalDeliveryMessage quantity quantityString quantityLabel isSubstitutionSelected fulfilledItems{id quantityString priceInfo{itemPrice{value}}productInfo{usItemId name}}isReturnable returnEligibilityMessage productInfo{name usItemId imageInfo{thumbnailUrl}canonicalUrl offerId orderLimit orderMinLimit weightIncrement salesUnit salesUnitType isSubstitutionEligible isAlcohol}reshop{reshopMessage isShippingAvailable minPromiseDate maxPromiseDate}selectedVariants{...variants}variantAdditionalInfo{parts{text nativeAction}}priceInfo{priceDisplayCodes{showItemPrice priceDisplayCondition finalCostByWeight}itemPrice{...price}linePrice{...price}unitPrice{...price}preDiscountedLinePrice{...price}additionalLines{name value}}discounts{label labelText{...textFragment}}itemReviewed activationCodes{label code}protectionPlanMessage{...textFragment}showSeller isShippedByWalmart seller{id name isPro}digitalDeliveryPhoneNumber addOns{...OrderAddOn}multiboxBundleId}fragment DriverFragment on Driver{id firstName photoUrl}fragment OrderGroupFragment on OrderGroup{driver{...DriverFragment}deliveryDate fulfillmentType status{...OrderGroupStatusFragment}showSeller isShippedByWalmart seller{...SellerFragment}id itemCount items{...LiteLineItemFragment}pickupPerson{firstName lastName email}accessPointId shipment{...ShipmentFragment}returnEligibilityMessage actions{...OrderGroupActionsFragment}recipientEmailAddress digitalDelivery{...DigitalDeliveryFragment}tireInstallationReservation{status extraText reservationId}}fragment OrderGroupStatusFragment on OrderGroupStatus{statusType showStatusTracker statusTracker{status label isCurrent}message{...textFragment}subtext subMessage{...textFragment}notice helpCenterText{...textFragment}}fragment textFragment on Text{parts{bold url text nativeAction lineBreak}}fragment LiteLineItemFragment on OrderLineItem{id quantity productInfo{name usItemId imageInfo{thumbnailUrl}offerId isAlcohol}priceInfo{linePrice{...price}}}fragment SellerFragment on GroupSeller{id name isPro}fragment DigitalDeliveryFragment on DigitalDelivery{title name instructions{...textFragment}}fragment ShipmentFragment on Shipment{id trackingNumber isExternalTracking trackingUrl proofOfDelivery{...ProofOfDeliveryFragment}}fragment OrderGroupActionsFragment on OrderGroupActions{reorder edit track changeSlot checkin editDeliveryInstructions editPickupPerson editTip tip rateDriver cancel enableTip{...orderActionFragment}enableEdit{...orderActionFragment}rescheduleTireInstall{...orderActionFragment}cancelTireInstall{...orderActionFragment}help viewCancellationDetails{...cancellationDetailsActionFragment}}fragment cancellationDetailsActionFragment on CancellationDetailsAction{label heading text{...textFragment}}fragment ProofOfDeliveryFragment on ProofOfDelivery{photoUrl photoPreviewUrl showPreview}fragment DeliveryInstructionsFragment on DeliveryInstructions{text type typeText}fragment GiftDetailsFragment on GiftDetails{recipientAddress{fullName}recipientEmail senderName giftMessage}fragment SubstitutionAction on SubstitutionAction{message label type}fragment ODPGroupCategoryFragment on OrderCategory{type name subtext returnMessage substitutionsBanner{...textFragment}showExtendedSubstitutions actions{substitutions{...SubstitutionAction}nilPickReshop{message action{text url}}returnDetails viewCancellationDetails{...cancellationDetailsActionFragment}trackOnInHomeApp}banner{...textFragment}accordionState items{...orderLineItem}substitutions{...orderLineItem fulfilledItems{...orderLineItem}}returnInfo{...returnInfoFragment}}fragment ODPGroupFragment on OrderGroup{id fulfillmentType deliveryMessage deliveryAddress{fullName firstName lastName address{...addressFragment}}deliveryInstructions{...DeliveryInstructionsFragment}deliveryPreferences{text{...textFragment}cta{...orderActionFragment}}editSubstitutionsCutOff status{statusType showStatusTracker message{...textFragment}notice helpCenterText{...textFragment}}itemCount isCategorized categories{...ODPGroupCategoryFragment}seller{id name isPro}shipment{id trackingNumber}actions{reorder edit track changeSlot checkin editDeliveryInstructions editPickupPerson tip cancel help enableTip{...orderActionFragment}enableEdit{...orderActionFragment}viewCancellationDetails{...cancellationDetailsActionFragment}enableInHome{...orderActionFragment}createGiftReceipt}cutOffTimestamp isEditSubstitutionsEligible isInHome giftDetails{...GiftDetailsFragment}donationDetails{...orderDonationDetails}}fragment returnInfoFragment on ReturnInfo{returnOrderId type refundPriceDetails{__typename...refundPriceDetailsFragment}refundMessage tierRefundMessage paymentMethods{__typename description cardType paymentType displayValues message{...textFragment}}actions{__typename generate scheduleOrModifyPickup{text url}reschedulePickup editPickupContact}shippingLabelUrl qrCodeImageUrl carriers{__typename id name}pickupCarrier pickupContact{nameAndAddress{fullName firstName lastName address{addressString city state postalCode addressLineOne addressLineTwo country}}phone}pickupConfirmationNumber bannerMessage{...textFragment}}fragment refundPriceDetailsFragment on RefundPriceDetails{subTotal{__typename...orderPriceDetailRowFragment}fees{__typename...orderPriceDetailRowFragment}discounts{__typename...orderPriceDetailRowFragment}taxTotal{__typename...orderPriceDetailRowFragment}grandTotal{__typename...orderPriceDetailRowFragment}}fragment orderPriceDetailRowFragment on OrderPriceDetailRow{label displayValue value info{__typename title message}}fragment addressFragment on OrderAddress{addressString addressLineOne addressLineTwo state postalCode city}fragment ODPPickupInfo on OrderGroup{pickupInstructions pickupPerson{...person}alternatePickupPerson{...person}store{id name address{...addressFragment}}}fragment person on OrderPickupPerson{firstName lastName email}fragment ODPTippingInfo on OrderGroup{addTipMessage{...textFragment}driver{...DriverFragment}tipping{min{...price}max{...price}suggested{...price}preselected}subtotal{...price}}fragment orderActionFragment on Action{text url}fragment orderCustomer on OrderCustomer{id firstName lastName email isGuest isEmailRegistered}fragment OrderFieldsFragment on Order{__typename id version type customer{...orderCustomer}displayId idBarcodeImageUrl(barWidth:3 barHeight:100) isFuelPurchase title shortTitle timezone tippableGroup{...OrderGroupFragment}amendableGroup{id changeSlotIterationsLeft cutOffTimestamp fulfillmentType deliveryAddress{fullName firstName lastName address{addressString addressLineOne addressLineTwo state postalCode city country}}isAmendInProgress}substitutionsBanner{heading subheading longSubheading}groups_2101{__typename...OrderGroupFragment...ODPGroupFragment...ODPPickupInfo...ODPTippingInfo}multiboxBundles{...orderLineItem}itemCancelReasons{__typename...cancelReason}groupCancelReasons{__typename...cancelReason}priceDetails{__typename subTotal{__typename...priceDetailFragment}taxTotal{__typename...priceDetailFragment}grandTotal{__typename...priceDetailFragment}authorizationAmount{__typename...priceDetailFragment}fees{__typename...priceDetailFragment}discounts{__typename...priceDetailFragment}minimumThreshold{__typename...price}belowMinimumFee{__typename...priceDetailFragment}driverTip{__typename...priceDetailFragment}donations{__typename...priceDetailFragment}}paymentMethods{__typename description cardType paymentType displayValues message{...textFragment}actions{connectToCapitalOne{...orderActionFragment}visitAffirm{...orderActionFragment}}}actions{__typename return pendingReturn cancel startReturn{...orderActionFragment}reorder}banners{...textFragment}}","variables":{"orderId":"3372217887504","emailAddress":"m_klar@hotmail.com"}}' \
  --compressed`
 
  if [[ $curl44 =~ "blocked" ]]; then
    link44=`echo $curl44 | jq '.redirectUrl' | sed 's/"//g'`
    `open -n -a /Applications/Microsoft\ Edge.app --args --profile-directory=Default https://walmart.com$link44`
    read -n 1 -p "blocked"
  else
    break
  fi
done

if [[ $curl44 =~ "error" ]]; then
    echo "44-Sai info"
    echo "'3372217887504" >> track-OrderID.txt
    echo "m_klar@hotmail.com" >> track-email.txt
    echo "Sai info" >> track-usItemId.txt
    echo "Sai info" >> track-priceValue.txt
    echo "Sai info" >> track-fullName.txt
    echo "Sai info" >> track-address.txt
    echo "Sai info" >> track-status.txt
    echo "Sai info" >> track-number.txt
    echo "Sai info" >> track-url.txt
    echo "Sai info" >> track-categoriesType.txt
else
    sum44=`md5 track-OrderID.txt`
    for (( i=0; i<=4; i++ ))
    do
        for (( j=0; j<=4; j++))
        do
            if [[ `echo $curl44 | jq '.data.guestOrder.groups_2101['${i[@]}'].items['${j[@]}'].productInfo.usItemId'` == '"13997776"' ]]; then
                echo "'3372217887504" >> track-OrderID.txt
                echo m_klar@hotmail.com >> track-email.txt
                echo $curl44 | jq '.data.guestOrder.groups_2101['${i[@]}'].items['${j[@]}'].productInfo.usItemId' >> track-usItemId.txt
                echo $curl44 | jq '.data.guestOrder.groups_2101['${i[@]}'].items['${j[@]}'].priceInfo.linePrice.value' >> track-priceValue.txt
                echo $curl44 | jq '.data.guestOrder.groups_2101['${i[@]}'].deliveryAddress.fullName' >> track-fullName.txt
                echo $curl44 | jq '.data.guestOrder.groups_2101['${i[@]}'].deliveryAddress.address.addressString' >> track-address.txt
                echo $curl44 | jq '.data.guestOrder.groups_2101['${i[@]}'].status.message.parts[].text' >> track-status.txt
                echo $curl44 | jq '.data.guestOrder.groups_2101['${i[@]}'].shipment.trackingNumber' | sed 's/null//g' >> track-number.txt
                echo $curl44 | jq '.data.guestOrder.groups_2101['${i[@]}'].shipment.trackingUrl' | sed 's/null//g' >> track-url.txt
                echo $curl44 | jq '.data.guestOrder.groups_2101['${i[@]}'].categories[].type' >> track-categoriesType.txt

                break
            fi
        done
    done
    if [[ $sum44 == `md5 track-OrderID.txt` ]]; then
        echo "44-Khác Item"
        echo "'3372217887504" >> track-OrderID.txt
        echo "m_klar@hotmail.com" >> track-email.txt
        echo "Khác Item" >> track-usItemId.txt
        echo "Khác Item" >> track-priceValue.txt
        echo "Khác Item" >> track-fullName.txt
        echo "Khác Item" >> track-address.txt
        echo "Khác Item" >> track-status.txt
        echo "Khác Item" >> track-number.txt
        echo "Khác Item" >> track-url.txt
        echo "Khác Item" >> track-categoriesType.txt
    else
        echo "44"
    fi   
fi
while true
do
curl45=`curl -s 'https://www.walmart.com/orchestra/home/graphql' \
  -H 'authority: www.walmart.com' \
  -H 'sec-ch-ua: " Not;A Brand";v="99", "Microsoft Edge";v="97", "Chromium";v="97"' \
  -H 'x-o-platform: rweb' \
  -H 'dnt: 1' \
  -H 'x-o-correlation-id: pn9BnlEx0zDiyvRGJ6nL5BS9pDN7erB017Nf' \
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
  -H 'user-agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.51 Safari/537.36 Edg/99.0.1150.36' \
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
  --data-raw $'{"query":"query getGuestOrder($orderId:ID\u0021 $emailAddress:String\u0021){guestOrder(input:{id:$orderId emailAddress:$emailAddress}){...OrderFieldsFragment}}fragment cancelReason on OrderCancelReason{__typename subReasonCode subDescription}fragment priceDetailFragment on OrderPriceDetailRow{label value displayValue info{title message}rowInfo{...orderPriceDetailRowInfo}}fragment orderPriceDetailRowInfo on OrderPriceDetailRowInfo{title message{...textFragment}}fragment price on Price{displayValue value}fragment variants on MapEntry{name value}fragment OrderAddOn on OrderAddOn{lineId uniqueLineId productInfo{name usItemId offerId}quantityString quantityLabel type fulfillmentInstructions{...textFragment}actions{manageProtectionPlan{...orderActionFragment}cancel}priceInfo{linePrice{...price}}quantity isActive}fragment orderDonationDetails on OrderDonationDetails{message{...textFragment}emailReceipt emailReceiptToken status{...textFragment}errorStatus}fragment orderLineItem on OrderLineItem{id uniqueId actions{contactSeller cancel addToCart configureCake reviewItem resendEGiftCardToken protectionPlan{...orderActionFragment}manageProtectionPlan{...orderActionFragment}}isGift digitalDeliveryMessage quantity quantityString quantityLabel isSubstitutionSelected fulfilledItems{id quantityString priceInfo{itemPrice{value}}productInfo{usItemId name}}isReturnable returnEligibilityMessage productInfo{name usItemId imageInfo{thumbnailUrl}canonicalUrl offerId orderLimit orderMinLimit weightIncrement salesUnit salesUnitType isSubstitutionEligible isAlcohol}reshop{reshopMessage isShippingAvailable minPromiseDate maxPromiseDate}selectedVariants{...variants}variantAdditionalInfo{parts{text nativeAction}}priceInfo{priceDisplayCodes{showItemPrice priceDisplayCondition finalCostByWeight}itemPrice{...price}linePrice{...price}unitPrice{...price}preDiscountedLinePrice{...price}additionalLines{name value}}discounts{label labelText{...textFragment}}itemReviewed activationCodes{label code}protectionPlanMessage{...textFragment}showSeller isShippedByWalmart seller{id name isPro}digitalDeliveryPhoneNumber addOns{...OrderAddOn}multiboxBundleId}fragment DriverFragment on Driver{id firstName photoUrl}fragment OrderGroupFragment on OrderGroup{driver{...DriverFragment}deliveryDate fulfillmentType status{...OrderGroupStatusFragment}showSeller isShippedByWalmart seller{...SellerFragment}id itemCount items{...LiteLineItemFragment}pickupPerson{firstName lastName email}accessPointId shipment{...ShipmentFragment}returnEligibilityMessage actions{...OrderGroupActionsFragment}recipientEmailAddress digitalDelivery{...DigitalDeliveryFragment}tireInstallationReservation{status extraText reservationId}}fragment OrderGroupStatusFragment on OrderGroupStatus{statusType showStatusTracker statusTracker{status label isCurrent}message{...textFragment}subtext subMessage{...textFragment}notice helpCenterText{...textFragment}}fragment textFragment on Text{parts{bold url text nativeAction lineBreak}}fragment LiteLineItemFragment on OrderLineItem{id quantity productInfo{name usItemId imageInfo{thumbnailUrl}offerId isAlcohol}priceInfo{linePrice{...price}}}fragment SellerFragment on GroupSeller{id name isPro}fragment DigitalDeliveryFragment on DigitalDelivery{title name instructions{...textFragment}}fragment ShipmentFragment on Shipment{id trackingNumber isExternalTracking trackingUrl proofOfDelivery{...ProofOfDeliveryFragment}}fragment OrderGroupActionsFragment on OrderGroupActions{reorder edit track changeSlot checkin editDeliveryInstructions editPickupPerson editTip tip rateDriver cancel enableTip{...orderActionFragment}enableEdit{...orderActionFragment}rescheduleTireInstall{...orderActionFragment}cancelTireInstall{...orderActionFragment}help viewCancellationDetails{...cancellationDetailsActionFragment}}fragment cancellationDetailsActionFragment on CancellationDetailsAction{label heading text{...textFragment}}fragment ProofOfDeliveryFragment on ProofOfDelivery{photoUrl photoPreviewUrl showPreview}fragment DeliveryInstructionsFragment on DeliveryInstructions{text type typeText}fragment GiftDetailsFragment on GiftDetails{recipientAddress{fullName}recipientEmail senderName giftMessage}fragment SubstitutionAction on SubstitutionAction{message label type}fragment ODPGroupCategoryFragment on OrderCategory{type name subtext returnMessage substitutionsBanner{...textFragment}showExtendedSubstitutions actions{substitutions{...SubstitutionAction}nilPickReshop{message action{text url}}returnDetails viewCancellationDetails{...cancellationDetailsActionFragment}trackOnInHomeApp}banner{...textFragment}accordionState items{...orderLineItem}substitutions{...orderLineItem fulfilledItems{...orderLineItem}}returnInfo{...returnInfoFragment}}fragment ODPGroupFragment on OrderGroup{id fulfillmentType deliveryMessage deliveryAddress{fullName firstName lastName address{...addressFragment}}deliveryInstructions{...DeliveryInstructionsFragment}deliveryPreferences{text{...textFragment}cta{...orderActionFragment}}editSubstitutionsCutOff status{statusType showStatusTracker message{...textFragment}notice helpCenterText{...textFragment}}itemCount isCategorized categories{...ODPGroupCategoryFragment}seller{id name isPro}shipment{id trackingNumber}actions{reorder edit track changeSlot checkin editDeliveryInstructions editPickupPerson tip cancel help enableTip{...orderActionFragment}enableEdit{...orderActionFragment}viewCancellationDetails{...cancellationDetailsActionFragment}enableInHome{...orderActionFragment}createGiftReceipt}cutOffTimestamp isEditSubstitutionsEligible isInHome giftDetails{...GiftDetailsFragment}donationDetails{...orderDonationDetails}}fragment returnInfoFragment on ReturnInfo{returnOrderId type refundPriceDetails{__typename...refundPriceDetailsFragment}refundMessage tierRefundMessage paymentMethods{__typename description cardType paymentType displayValues message{...textFragment}}actions{__typename generate scheduleOrModifyPickup{text url}reschedulePickup editPickupContact}shippingLabelUrl qrCodeImageUrl carriers{__typename id name}pickupCarrier pickupContact{nameAndAddress{fullName firstName lastName address{addressString city state postalCode addressLineOne addressLineTwo country}}phone}pickupConfirmationNumber bannerMessage{...textFragment}}fragment refundPriceDetailsFragment on RefundPriceDetails{subTotal{__typename...orderPriceDetailRowFragment}fees{__typename...orderPriceDetailRowFragment}discounts{__typename...orderPriceDetailRowFragment}taxTotal{__typename...orderPriceDetailRowFragment}grandTotal{__typename...orderPriceDetailRowFragment}}fragment orderPriceDetailRowFragment on OrderPriceDetailRow{label displayValue value info{__typename title message}}fragment addressFragment on OrderAddress{addressString addressLineOne addressLineTwo state postalCode city}fragment ODPPickupInfo on OrderGroup{pickupInstructions pickupPerson{...person}alternatePickupPerson{...person}store{id name address{...addressFragment}}}fragment person on OrderPickupPerson{firstName lastName email}fragment ODPTippingInfo on OrderGroup{addTipMessage{...textFragment}driver{...DriverFragment}tipping{min{...price}max{...price}suggested{...price}preselected}subtotal{...price}}fragment orderActionFragment on Action{text url}fragment orderCustomer on OrderCustomer{id firstName lastName email isGuest isEmailRegistered}fragment OrderFieldsFragment on Order{__typename id version type customer{...orderCustomer}displayId idBarcodeImageUrl(barWidth:3 barHeight:100) isFuelPurchase title shortTitle timezone tippableGroup{...OrderGroupFragment}amendableGroup{id changeSlotIterationsLeft cutOffTimestamp fulfillmentType deliveryAddress{fullName firstName lastName address{addressString addressLineOne addressLineTwo state postalCode city country}}isAmendInProgress}substitutionsBanner{heading subheading longSubheading}groups_2101{__typename...OrderGroupFragment...ODPGroupFragment...ODPPickupInfo...ODPTippingInfo}multiboxBundles{...orderLineItem}itemCancelReasons{__typename...cancelReason}groupCancelReasons{__typename...cancelReason}priceDetails{__typename subTotal{__typename...priceDetailFragment}taxTotal{__typename...priceDetailFragment}grandTotal{__typename...priceDetailFragment}authorizationAmount{__typename...priceDetailFragment}fees{__typename...priceDetailFragment}discounts{__typename...priceDetailFragment}minimumThreshold{__typename...price}belowMinimumFee{__typename...priceDetailFragment}driverTip{__typename...priceDetailFragment}donations{__typename...priceDetailFragment}}paymentMethods{__typename description cardType paymentType displayValues message{...textFragment}actions{connectToCapitalOne{...orderActionFragment}visitAffirm{...orderActionFragment}}}actions{__typename return pendingReturn cancel startReturn{...orderActionFragment}reorder}banners{...textFragment}}","variables":{"orderId":"3382219654772","emailAddress":"chrisfiser@msn.com"}}' \
  --compressed`
 
  if [[ $curl45 =~ "blocked" ]]; then
    link45=`echo $curl45 | jq '.redirectUrl' | sed 's/"//g'`
    `open -n -a /Applications/Microsoft\ Edge.app --args --profile-directory=Default https://walmart.com$link45`
    read -n 1 -p "blocked"
  else
    break
  fi
done

if [[ $curl45 =~ "error" ]]; then
    echo "45-Sai info"
    echo "'3382219654772" >> track-OrderID.txt
    echo "chrisfiser@msn.com" >> track-email.txt
    echo "Sai info" >> track-usItemId.txt
    echo "Sai info" >> track-priceValue.txt
    echo "Sai info" >> track-fullName.txt
    echo "Sai info" >> track-address.txt
    echo "Sai info" >> track-status.txt
    echo "Sai info" >> track-number.txt
    echo "Sai info" >> track-url.txt
    echo "Sai info" >> track-categoriesType.txt
else
    sum45=`md5 track-OrderID.txt`
    for (( i=0; i<=4; i++ ))
    do
        for (( j=0; j<=4; j++))
        do
            if [[ `echo $curl45 | jq '.data.guestOrder.groups_2101['${i[@]}'].items['${j[@]}'].productInfo.usItemId'` == '"993572228"' ]]; then
                echo "'3382219654772" >> track-OrderID.txt
                echo chrisfiser@msn.com >> track-email.txt
                echo $curl45 | jq '.data.guestOrder.groups_2101['${i[@]}'].items['${j[@]}'].productInfo.usItemId' >> track-usItemId.txt
                echo $curl45 | jq '.data.guestOrder.groups_2101['${i[@]}'].items['${j[@]}'].priceInfo.linePrice.value' >> track-priceValue.txt
                echo $curl45 | jq '.data.guestOrder.groups_2101['${i[@]}'].deliveryAddress.fullName' >> track-fullName.txt
                echo $curl45 | jq '.data.guestOrder.groups_2101['${i[@]}'].deliveryAddress.address.addressString' >> track-address.txt
                echo $curl45 | jq '.data.guestOrder.groups_2101['${i[@]}'].status.message.parts[].text' >> track-status.txt
                echo $curl45 | jq '.data.guestOrder.groups_2101['${i[@]}'].shipment.trackingNumber' | sed 's/null//g' >> track-number.txt
                echo $curl45 | jq '.data.guestOrder.groups_2101['${i[@]}'].shipment.trackingUrl' | sed 's/null//g' >> track-url.txt
                echo $curl45 | jq '.data.guestOrder.groups_2101['${i[@]}'].categories[].type' >> track-categoriesType.txt

                break
            fi
        done
    done
    if [[ $sum45 == `md5 track-OrderID.txt` ]]; then
        echo "45-Khác Item"
        echo "'3382219654772" >> track-OrderID.txt
        echo "chrisfiser@msn.com" >> track-email.txt
        echo "Khác Item" >> track-usItemId.txt
        echo "Khác Item" >> track-priceValue.txt
        echo "Khác Item" >> track-fullName.txt
        echo "Khác Item" >> track-address.txt
        echo "Khác Item" >> track-status.txt
        echo "Khác Item" >> track-number.txt
        echo "Khác Item" >> track-url.txt
        echo "Khác Item" >> track-categoriesType.txt
    else
        echo "45"
    fi   
fi
while true
do
curl46=`curl -s 'https://www.walmart.com/orchestra/home/graphql' \
  -H 'authority: www.walmart.com' \
  -H 'sec-ch-ua: " Not;A Brand";v="99", "Microsoft Edge";v="97", "Chromium";v="97"' \
  -H 'x-o-platform: rweb' \
  -H 'dnt: 1' \
  -H 'x-o-correlation-id: pn9BnlEx0zDiyvRGJ6nL5BS9pDN7erB017Nf' \
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
  -H 'user-agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.51 Safari/537.36 Edg/99.0.1150.36' \
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
  --data-raw $'{"query":"query getGuestOrder($orderId:ID\u0021 $emailAddress:String\u0021){guestOrder(input:{id:$orderId emailAddress:$emailAddress}){...OrderFieldsFragment}}fragment cancelReason on OrderCancelReason{__typename subReasonCode subDescription}fragment priceDetailFragment on OrderPriceDetailRow{label value displayValue info{title message}rowInfo{...orderPriceDetailRowInfo}}fragment orderPriceDetailRowInfo on OrderPriceDetailRowInfo{title message{...textFragment}}fragment price on Price{displayValue value}fragment variants on MapEntry{name value}fragment OrderAddOn on OrderAddOn{lineId uniqueLineId productInfo{name usItemId offerId}quantityString quantityLabel type fulfillmentInstructions{...textFragment}actions{manageProtectionPlan{...orderActionFragment}cancel}priceInfo{linePrice{...price}}quantity isActive}fragment orderDonationDetails on OrderDonationDetails{message{...textFragment}emailReceipt emailReceiptToken status{...textFragment}errorStatus}fragment orderLineItem on OrderLineItem{id uniqueId actions{contactSeller cancel addToCart configureCake reviewItem resendEGiftCardToken protectionPlan{...orderActionFragment}manageProtectionPlan{...orderActionFragment}}isGift digitalDeliveryMessage quantity quantityString quantityLabel isSubstitutionSelected fulfilledItems{id quantityString priceInfo{itemPrice{value}}productInfo{usItemId name}}isReturnable returnEligibilityMessage productInfo{name usItemId imageInfo{thumbnailUrl}canonicalUrl offerId orderLimit orderMinLimit weightIncrement salesUnit salesUnitType isSubstitutionEligible isAlcohol}reshop{reshopMessage isShippingAvailable minPromiseDate maxPromiseDate}selectedVariants{...variants}variantAdditionalInfo{parts{text nativeAction}}priceInfo{priceDisplayCodes{showItemPrice priceDisplayCondition finalCostByWeight}itemPrice{...price}linePrice{...price}unitPrice{...price}preDiscountedLinePrice{...price}additionalLines{name value}}discounts{label labelText{...textFragment}}itemReviewed activationCodes{label code}protectionPlanMessage{...textFragment}showSeller isShippedByWalmart seller{id name isPro}digitalDeliveryPhoneNumber addOns{...OrderAddOn}multiboxBundleId}fragment DriverFragment on Driver{id firstName photoUrl}fragment OrderGroupFragment on OrderGroup{driver{...DriverFragment}deliveryDate fulfillmentType status{...OrderGroupStatusFragment}showSeller isShippedByWalmart seller{...SellerFragment}id itemCount items{...LiteLineItemFragment}pickupPerson{firstName lastName email}accessPointId shipment{...ShipmentFragment}returnEligibilityMessage actions{...OrderGroupActionsFragment}recipientEmailAddress digitalDelivery{...DigitalDeliveryFragment}tireInstallationReservation{status extraText reservationId}}fragment OrderGroupStatusFragment on OrderGroupStatus{statusType showStatusTracker statusTracker{status label isCurrent}message{...textFragment}subtext subMessage{...textFragment}notice helpCenterText{...textFragment}}fragment textFragment on Text{parts{bold url text nativeAction lineBreak}}fragment LiteLineItemFragment on OrderLineItem{id quantity productInfo{name usItemId imageInfo{thumbnailUrl}offerId isAlcohol}priceInfo{linePrice{...price}}}fragment SellerFragment on GroupSeller{id name isPro}fragment DigitalDeliveryFragment on DigitalDelivery{title name instructions{...textFragment}}fragment ShipmentFragment on Shipment{id trackingNumber isExternalTracking trackingUrl proofOfDelivery{...ProofOfDeliveryFragment}}fragment OrderGroupActionsFragment on OrderGroupActions{reorder edit track changeSlot checkin editDeliveryInstructions editPickupPerson editTip tip rateDriver cancel enableTip{...orderActionFragment}enableEdit{...orderActionFragment}rescheduleTireInstall{...orderActionFragment}cancelTireInstall{...orderActionFragment}help viewCancellationDetails{...cancellationDetailsActionFragment}}fragment cancellationDetailsActionFragment on CancellationDetailsAction{label heading text{...textFragment}}fragment ProofOfDeliveryFragment on ProofOfDelivery{photoUrl photoPreviewUrl showPreview}fragment DeliveryInstructionsFragment on DeliveryInstructions{text type typeText}fragment GiftDetailsFragment on GiftDetails{recipientAddress{fullName}recipientEmail senderName giftMessage}fragment SubstitutionAction on SubstitutionAction{message label type}fragment ODPGroupCategoryFragment on OrderCategory{type name subtext returnMessage substitutionsBanner{...textFragment}showExtendedSubstitutions actions{substitutions{...SubstitutionAction}nilPickReshop{message action{text url}}returnDetails viewCancellationDetails{...cancellationDetailsActionFragment}trackOnInHomeApp}banner{...textFragment}accordionState items{...orderLineItem}substitutions{...orderLineItem fulfilledItems{...orderLineItem}}returnInfo{...returnInfoFragment}}fragment ODPGroupFragment on OrderGroup{id fulfillmentType deliveryMessage deliveryAddress{fullName firstName lastName address{...addressFragment}}deliveryInstructions{...DeliveryInstructionsFragment}deliveryPreferences{text{...textFragment}cta{...orderActionFragment}}editSubstitutionsCutOff status{statusType showStatusTracker message{...textFragment}notice helpCenterText{...textFragment}}itemCount isCategorized categories{...ODPGroupCategoryFragment}seller{id name isPro}shipment{id trackingNumber}actions{reorder edit track changeSlot checkin editDeliveryInstructions editPickupPerson tip cancel help enableTip{...orderActionFragment}enableEdit{...orderActionFragment}viewCancellationDetails{...cancellationDetailsActionFragment}enableInHome{...orderActionFragment}createGiftReceipt}cutOffTimestamp isEditSubstitutionsEligible isInHome giftDetails{...GiftDetailsFragment}donationDetails{...orderDonationDetails}}fragment returnInfoFragment on ReturnInfo{returnOrderId type refundPriceDetails{__typename...refundPriceDetailsFragment}refundMessage tierRefundMessage paymentMethods{__typename description cardType paymentType displayValues message{...textFragment}}actions{__typename generate scheduleOrModifyPickup{text url}reschedulePickup editPickupContact}shippingLabelUrl qrCodeImageUrl carriers{__typename id name}pickupCarrier pickupContact{nameAndAddress{fullName firstName lastName address{addressString city state postalCode addressLineOne addressLineTwo country}}phone}pickupConfirmationNumber bannerMessage{...textFragment}}fragment refundPriceDetailsFragment on RefundPriceDetails{subTotal{__typename...orderPriceDetailRowFragment}fees{__typename...orderPriceDetailRowFragment}discounts{__typename...orderPriceDetailRowFragment}taxTotal{__typename...orderPriceDetailRowFragment}grandTotal{__typename...orderPriceDetailRowFragment}}fragment orderPriceDetailRowFragment on OrderPriceDetailRow{label displayValue value info{__typename title message}}fragment addressFragment on OrderAddress{addressString addressLineOne addressLineTwo state postalCode city}fragment ODPPickupInfo on OrderGroup{pickupInstructions pickupPerson{...person}alternatePickupPerson{...person}store{id name address{...addressFragment}}}fragment person on OrderPickupPerson{firstName lastName email}fragment ODPTippingInfo on OrderGroup{addTipMessage{...textFragment}driver{...DriverFragment}tipping{min{...price}max{...price}suggested{...price}preselected}subtotal{...price}}fragment orderActionFragment on Action{text url}fragment orderCustomer on OrderCustomer{id firstName lastName email isGuest isEmailRegistered}fragment OrderFieldsFragment on Order{__typename id version type customer{...orderCustomer}displayId idBarcodeImageUrl(barWidth:3 barHeight:100) isFuelPurchase title shortTitle timezone tippableGroup{...OrderGroupFragment}amendableGroup{id changeSlotIterationsLeft cutOffTimestamp fulfillmentType deliveryAddress{fullName firstName lastName address{addressString addressLineOne addressLineTwo state postalCode city country}}isAmendInProgress}substitutionsBanner{heading subheading longSubheading}groups_2101{__typename...OrderGroupFragment...ODPGroupFragment...ODPPickupInfo...ODPTippingInfo}multiboxBundles{...orderLineItem}itemCancelReasons{__typename...cancelReason}groupCancelReasons{__typename...cancelReason}priceDetails{__typename subTotal{__typename...priceDetailFragment}taxTotal{__typename...priceDetailFragment}grandTotal{__typename...priceDetailFragment}authorizationAmount{__typename...priceDetailFragment}fees{__typename...priceDetailFragment}discounts{__typename...priceDetailFragment}minimumThreshold{__typename...price}belowMinimumFee{__typename...priceDetailFragment}driverTip{__typename...priceDetailFragment}donations{__typename...priceDetailFragment}}paymentMethods{__typename description cardType paymentType displayValues message{...textFragment}actions{connectToCapitalOne{...orderActionFragment}visitAffirm{...orderActionFragment}}}actions{__typename return pendingReturn cancel startReturn{...orderActionFragment}reorder}banners{...textFragment}}","variables":{"orderId":"3382219571070","emailAddress":"lzmolek@comcast.net"}}' \
  --compressed`
 
  if [[ $curl46 =~ "blocked" ]]; then
    link46=`echo $curl46 | jq '.redirectUrl' | sed 's/"//g'`
    `open -n -a /Applications/Microsoft\ Edge.app --args --profile-directory=Default https://walmart.com$link46`
    read -n 1 -p "blocked"
  else
    break
  fi
done

if [[ $curl46 =~ "error" ]]; then
    echo "46-Sai info"
    echo "'3382219571070" >> track-OrderID.txt
    echo "lzmolek@comcast.net" >> track-email.txt
    echo "Sai info" >> track-usItemId.txt
    echo "Sai info" >> track-priceValue.txt
    echo "Sai info" >> track-fullName.txt
    echo "Sai info" >> track-address.txt
    echo "Sai info" >> track-status.txt
    echo "Sai info" >> track-number.txt
    echo "Sai info" >> track-url.txt
    echo "Sai info" >> track-categoriesType.txt
else
    sum46=`md5 track-OrderID.txt`
    for (( i=0; i<=4; i++ ))
    do
        for (( j=0; j<=4; j++))
        do
            if [[ `echo $curl46 | jq '.data.guestOrder.groups_2101['${i[@]}'].items['${j[@]}'].productInfo.usItemId'` == '"680614474"' ]]; then
                echo "'3382219571070" >> track-OrderID.txt
                echo lzmolek@comcast.net >> track-email.txt
                echo $curl46 | jq '.data.guestOrder.groups_2101['${i[@]}'].items['${j[@]}'].productInfo.usItemId' >> track-usItemId.txt
                echo $curl46 | jq '.data.guestOrder.groups_2101['${i[@]}'].items['${j[@]}'].priceInfo.linePrice.value' >> track-priceValue.txt
                echo $curl46 | jq '.data.guestOrder.groups_2101['${i[@]}'].deliveryAddress.fullName' >> track-fullName.txt
                echo $curl46 | jq '.data.guestOrder.groups_2101['${i[@]}'].deliveryAddress.address.addressString' >> track-address.txt
                echo $curl46 | jq '.data.guestOrder.groups_2101['${i[@]}'].status.message.parts[].text' >> track-status.txt
                echo $curl46 | jq '.data.guestOrder.groups_2101['${i[@]}'].shipment.trackingNumber' | sed 's/null//g' >> track-number.txt
                echo $curl46 | jq '.data.guestOrder.groups_2101['${i[@]}'].shipment.trackingUrl' | sed 's/null//g' >> track-url.txt
                echo $curl46 | jq '.data.guestOrder.groups_2101['${i[@]}'].categories[].type' >> track-categoriesType.txt

                break
            fi
        done
    done
    if [[ $sum46 == `md5 track-OrderID.txt` ]]; then
        echo "46-Khác Item"
        echo "'3382219571070" >> track-OrderID.txt
        echo "lzmolek@comcast.net" >> track-email.txt
        echo "Khác Item" >> track-usItemId.txt
        echo "Khác Item" >> track-priceValue.txt
        echo "Khác Item" >> track-fullName.txt
        echo "Khác Item" >> track-address.txt
        echo "Khác Item" >> track-status.txt
        echo "Khác Item" >> track-number.txt
        echo "Khác Item" >> track-url.txt
        echo "Khác Item" >> track-categoriesType.txt
    else
        echo "46"
    fi   
fi
while true
do
curl47=`curl -s 'https://www.walmart.com/orchestra/home/graphql' \
  -H 'authority: www.walmart.com' \
  -H 'sec-ch-ua: " Not;A Brand";v="99", "Microsoft Edge";v="97", "Chromium";v="97"' \
  -H 'x-o-platform: rweb' \
  -H 'dnt: 1' \
  -H 'x-o-correlation-id: pn9BnlEx0zDiyvRGJ6nL5BS9pDN7erB017Nf' \
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
  -H 'user-agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.51 Safari/537.36 Edg/99.0.1150.36' \
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
  --data-raw $'{"query":"query getGuestOrder($orderId:ID\u0021 $emailAddress:String\u0021){guestOrder(input:{id:$orderId emailAddress:$emailAddress}){...OrderFieldsFragment}}fragment cancelReason on OrderCancelReason{__typename subReasonCode subDescription}fragment priceDetailFragment on OrderPriceDetailRow{label value displayValue info{title message}rowInfo{...orderPriceDetailRowInfo}}fragment orderPriceDetailRowInfo on OrderPriceDetailRowInfo{title message{...textFragment}}fragment price on Price{displayValue value}fragment variants on MapEntry{name value}fragment OrderAddOn on OrderAddOn{lineId uniqueLineId productInfo{name usItemId offerId}quantityString quantityLabel type fulfillmentInstructions{...textFragment}actions{manageProtectionPlan{...orderActionFragment}cancel}priceInfo{linePrice{...price}}quantity isActive}fragment orderDonationDetails on OrderDonationDetails{message{...textFragment}emailReceipt emailReceiptToken status{...textFragment}errorStatus}fragment orderLineItem on OrderLineItem{id uniqueId actions{contactSeller cancel addToCart configureCake reviewItem resendEGiftCardToken protectionPlan{...orderActionFragment}manageProtectionPlan{...orderActionFragment}}isGift digitalDeliveryMessage quantity quantityString quantityLabel isSubstitutionSelected fulfilledItems{id quantityString priceInfo{itemPrice{value}}productInfo{usItemId name}}isReturnable returnEligibilityMessage productInfo{name usItemId imageInfo{thumbnailUrl}canonicalUrl offerId orderLimit orderMinLimit weightIncrement salesUnit salesUnitType isSubstitutionEligible isAlcohol}reshop{reshopMessage isShippingAvailable minPromiseDate maxPromiseDate}selectedVariants{...variants}variantAdditionalInfo{parts{text nativeAction}}priceInfo{priceDisplayCodes{showItemPrice priceDisplayCondition finalCostByWeight}itemPrice{...price}linePrice{...price}unitPrice{...price}preDiscountedLinePrice{...price}additionalLines{name value}}discounts{label labelText{...textFragment}}itemReviewed activationCodes{label code}protectionPlanMessage{...textFragment}showSeller isShippedByWalmart seller{id name isPro}digitalDeliveryPhoneNumber addOns{...OrderAddOn}multiboxBundleId}fragment DriverFragment on Driver{id firstName photoUrl}fragment OrderGroupFragment on OrderGroup{driver{...DriverFragment}deliveryDate fulfillmentType status{...OrderGroupStatusFragment}showSeller isShippedByWalmart seller{...SellerFragment}id itemCount items{...LiteLineItemFragment}pickupPerson{firstName lastName email}accessPointId shipment{...ShipmentFragment}returnEligibilityMessage actions{...OrderGroupActionsFragment}recipientEmailAddress digitalDelivery{...DigitalDeliveryFragment}tireInstallationReservation{status extraText reservationId}}fragment OrderGroupStatusFragment on OrderGroupStatus{statusType showStatusTracker statusTracker{status label isCurrent}message{...textFragment}subtext subMessage{...textFragment}notice helpCenterText{...textFragment}}fragment textFragment on Text{parts{bold url text nativeAction lineBreak}}fragment LiteLineItemFragment on OrderLineItem{id quantity productInfo{name usItemId imageInfo{thumbnailUrl}offerId isAlcohol}priceInfo{linePrice{...price}}}fragment SellerFragment on GroupSeller{id name isPro}fragment DigitalDeliveryFragment on DigitalDelivery{title name instructions{...textFragment}}fragment ShipmentFragment on Shipment{id trackingNumber isExternalTracking trackingUrl proofOfDelivery{...ProofOfDeliveryFragment}}fragment OrderGroupActionsFragment on OrderGroupActions{reorder edit track changeSlot checkin editDeliveryInstructions editPickupPerson editTip tip rateDriver cancel enableTip{...orderActionFragment}enableEdit{...orderActionFragment}rescheduleTireInstall{...orderActionFragment}cancelTireInstall{...orderActionFragment}help viewCancellationDetails{...cancellationDetailsActionFragment}}fragment cancellationDetailsActionFragment on CancellationDetailsAction{label heading text{...textFragment}}fragment ProofOfDeliveryFragment on ProofOfDelivery{photoUrl photoPreviewUrl showPreview}fragment DeliveryInstructionsFragment on DeliveryInstructions{text type typeText}fragment GiftDetailsFragment on GiftDetails{recipientAddress{fullName}recipientEmail senderName giftMessage}fragment SubstitutionAction on SubstitutionAction{message label type}fragment ODPGroupCategoryFragment on OrderCategory{type name subtext returnMessage substitutionsBanner{...textFragment}showExtendedSubstitutions actions{substitutions{...SubstitutionAction}nilPickReshop{message action{text url}}returnDetails viewCancellationDetails{...cancellationDetailsActionFragment}trackOnInHomeApp}banner{...textFragment}accordionState items{...orderLineItem}substitutions{...orderLineItem fulfilledItems{...orderLineItem}}returnInfo{...returnInfoFragment}}fragment ODPGroupFragment on OrderGroup{id fulfillmentType deliveryMessage deliveryAddress{fullName firstName lastName address{...addressFragment}}deliveryInstructions{...DeliveryInstructionsFragment}deliveryPreferences{text{...textFragment}cta{...orderActionFragment}}editSubstitutionsCutOff status{statusType showStatusTracker message{...textFragment}notice helpCenterText{...textFragment}}itemCount isCategorized categories{...ODPGroupCategoryFragment}seller{id name isPro}shipment{id trackingNumber}actions{reorder edit track changeSlot checkin editDeliveryInstructions editPickupPerson tip cancel help enableTip{...orderActionFragment}enableEdit{...orderActionFragment}viewCancellationDetails{...cancellationDetailsActionFragment}enableInHome{...orderActionFragment}createGiftReceipt}cutOffTimestamp isEditSubstitutionsEligible isInHome giftDetails{...GiftDetailsFragment}donationDetails{...orderDonationDetails}}fragment returnInfoFragment on ReturnInfo{returnOrderId type refundPriceDetails{__typename...refundPriceDetailsFragment}refundMessage tierRefundMessage paymentMethods{__typename description cardType paymentType displayValues message{...textFragment}}actions{__typename generate scheduleOrModifyPickup{text url}reschedulePickup editPickupContact}shippingLabelUrl qrCodeImageUrl carriers{__typename id name}pickupCarrier pickupContact{nameAndAddress{fullName firstName lastName address{addressString city state postalCode addressLineOne addressLineTwo country}}phone}pickupConfirmationNumber bannerMessage{...textFragment}}fragment refundPriceDetailsFragment on RefundPriceDetails{subTotal{__typename...orderPriceDetailRowFragment}fees{__typename...orderPriceDetailRowFragment}discounts{__typename...orderPriceDetailRowFragment}taxTotal{__typename...orderPriceDetailRowFragment}grandTotal{__typename...orderPriceDetailRowFragment}}fragment orderPriceDetailRowFragment on OrderPriceDetailRow{label displayValue value info{__typename title message}}fragment addressFragment on OrderAddress{addressString addressLineOne addressLineTwo state postalCode city}fragment ODPPickupInfo on OrderGroup{pickupInstructions pickupPerson{...person}alternatePickupPerson{...person}store{id name address{...addressFragment}}}fragment person on OrderPickupPerson{firstName lastName email}fragment ODPTippingInfo on OrderGroup{addTipMessage{...textFragment}driver{...DriverFragment}tipping{min{...price}max{...price}suggested{...price}preselected}subtotal{...price}}fragment orderActionFragment on Action{text url}fragment orderCustomer on OrderCustomer{id firstName lastName email isGuest isEmailRegistered}fragment OrderFieldsFragment on Order{__typename id version type customer{...orderCustomer}displayId idBarcodeImageUrl(barWidth:3 barHeight:100) isFuelPurchase title shortTitle timezone tippableGroup{...OrderGroupFragment}amendableGroup{id changeSlotIterationsLeft cutOffTimestamp fulfillmentType deliveryAddress{fullName firstName lastName address{addressString addressLineOne addressLineTwo state postalCode city country}}isAmendInProgress}substitutionsBanner{heading subheading longSubheading}groups_2101{__typename...OrderGroupFragment...ODPGroupFragment...ODPPickupInfo...ODPTippingInfo}multiboxBundles{...orderLineItem}itemCancelReasons{__typename...cancelReason}groupCancelReasons{__typename...cancelReason}priceDetails{__typename subTotal{__typename...priceDetailFragment}taxTotal{__typename...priceDetailFragment}grandTotal{__typename...priceDetailFragment}authorizationAmount{__typename...priceDetailFragment}fees{__typename...priceDetailFragment}discounts{__typename...priceDetailFragment}minimumThreshold{__typename...price}belowMinimumFee{__typename...priceDetailFragment}driverTip{__typename...priceDetailFragment}donations{__typename...priceDetailFragment}}paymentMethods{__typename description cardType paymentType displayValues message{...textFragment}actions{connectToCapitalOne{...orderActionFragment}visitAffirm{...orderActionFragment}}}actions{__typename return pendingReturn cancel startReturn{...orderActionFragment}reorder}banners{...textFragment}}","variables":{"orderId":"3372217996875","emailAddress":"rew115@aol.com"}}' \
  --compressed`
 
  if [[ $curl47 =~ "blocked" ]]; then
    link47=`echo $curl47 | jq '.redirectUrl' | sed 's/"//g'`
    `open -n -a /Applications/Microsoft\ Edge.app --args --profile-directory=Default https://walmart.com$link47`
    read -n 1 -p "blocked"
  else
    break
  fi
done

if [[ $curl47 =~ "error" ]]; then
    echo "47-Sai info"
    echo "'3372217996875" >> track-OrderID.txt
    echo "rew115@aol.com" >> track-email.txt
    echo "Sai info" >> track-usItemId.txt
    echo "Sai info" >> track-priceValue.txt
    echo "Sai info" >> track-fullName.txt
    echo "Sai info" >> track-address.txt
    echo "Sai info" >> track-status.txt
    echo "Sai info" >> track-number.txt
    echo "Sai info" >> track-url.txt
    echo "Sai info" >> track-categoriesType.txt
else
    sum47=`md5 track-OrderID.txt`
    for (( i=0; i<=4; i++ ))
    do
        for (( j=0; j<=4; j++))
        do
            if [[ `echo $curl47 | jq '.data.guestOrder.groups_2101['${i[@]}'].items['${j[@]}'].productInfo.usItemId'` == '"36611908"' ]]; then
                echo "'3372217996875" >> track-OrderID.txt
                echo rew115@aol.com >> track-email.txt
                echo $curl47 | jq '.data.guestOrder.groups_2101['${i[@]}'].items['${j[@]}'].productInfo.usItemId' >> track-usItemId.txt
                echo $curl47 | jq '.data.guestOrder.groups_2101['${i[@]}'].items['${j[@]}'].priceInfo.linePrice.value' >> track-priceValue.txt
                echo $curl47 | jq '.data.guestOrder.groups_2101['${i[@]}'].deliveryAddress.fullName' >> track-fullName.txt
                echo $curl47 | jq '.data.guestOrder.groups_2101['${i[@]}'].deliveryAddress.address.addressString' >> track-address.txt
                echo $curl47 | jq '.data.guestOrder.groups_2101['${i[@]}'].status.message.parts[].text' >> track-status.txt
                echo $curl47 | jq '.data.guestOrder.groups_2101['${i[@]}'].shipment.trackingNumber' | sed 's/null//g' >> track-number.txt
                echo $curl47 | jq '.data.guestOrder.groups_2101['${i[@]}'].shipment.trackingUrl' | sed 's/null//g' >> track-url.txt
                echo $curl47 | jq '.data.guestOrder.groups_2101['${i[@]}'].categories[].type' >> track-categoriesType.txt

                break
            fi
        done
    done
    if [[ $sum47 == `md5 track-OrderID.txt` ]]; then
        echo "47-Khác Item"
        echo "'3372217996875" >> track-OrderID.txt
        echo "rew115@aol.com" >> track-email.txt
        echo "Khác Item" >> track-usItemId.txt
        echo "Khác Item" >> track-priceValue.txt
        echo "Khác Item" >> track-fullName.txt
        echo "Khác Item" >> track-address.txt
        echo "Khác Item" >> track-status.txt
        echo "Khác Item" >> track-number.txt
        echo "Khác Item" >> track-url.txt
        echo "Khác Item" >> track-categoriesType.txt
    else
        echo "47"
    fi   
fi
while true
do
curl48=`curl -s 'https://www.walmart.com/orchestra/home/graphql' \
  -H 'authority: www.walmart.com' \
  -H 'sec-ch-ua: " Not;A Brand";v="99", "Microsoft Edge";v="97", "Chromium";v="97"' \
  -H 'x-o-platform: rweb' \
  -H 'dnt: 1' \
  -H 'x-o-correlation-id: pn9BnlEx0zDiyvRGJ6nL5BS9pDN7erB017Nf' \
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
  -H 'user-agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.51 Safari/537.36 Edg/99.0.1150.36' \
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
  --data-raw $'{"query":"query getGuestOrder($orderId:ID\u0021 $emailAddress:String\u0021){guestOrder(input:{id:$orderId emailAddress:$emailAddress}){...OrderFieldsFragment}}fragment cancelReason on OrderCancelReason{__typename subReasonCode subDescription}fragment priceDetailFragment on OrderPriceDetailRow{label value displayValue info{title message}rowInfo{...orderPriceDetailRowInfo}}fragment orderPriceDetailRowInfo on OrderPriceDetailRowInfo{title message{...textFragment}}fragment price on Price{displayValue value}fragment variants on MapEntry{name value}fragment OrderAddOn on OrderAddOn{lineId uniqueLineId productInfo{name usItemId offerId}quantityString quantityLabel type fulfillmentInstructions{...textFragment}actions{manageProtectionPlan{...orderActionFragment}cancel}priceInfo{linePrice{...price}}quantity isActive}fragment orderDonationDetails on OrderDonationDetails{message{...textFragment}emailReceipt emailReceiptToken status{...textFragment}errorStatus}fragment orderLineItem on OrderLineItem{id uniqueId actions{contactSeller cancel addToCart configureCake reviewItem resendEGiftCardToken protectionPlan{...orderActionFragment}manageProtectionPlan{...orderActionFragment}}isGift digitalDeliveryMessage quantity quantityString quantityLabel isSubstitutionSelected fulfilledItems{id quantityString priceInfo{itemPrice{value}}productInfo{usItemId name}}isReturnable returnEligibilityMessage productInfo{name usItemId imageInfo{thumbnailUrl}canonicalUrl offerId orderLimit orderMinLimit weightIncrement salesUnit salesUnitType isSubstitutionEligible isAlcohol}reshop{reshopMessage isShippingAvailable minPromiseDate maxPromiseDate}selectedVariants{...variants}variantAdditionalInfo{parts{text nativeAction}}priceInfo{priceDisplayCodes{showItemPrice priceDisplayCondition finalCostByWeight}itemPrice{...price}linePrice{...price}unitPrice{...price}preDiscountedLinePrice{...price}additionalLines{name value}}discounts{label labelText{...textFragment}}itemReviewed activationCodes{label code}protectionPlanMessage{...textFragment}showSeller isShippedByWalmart seller{id name isPro}digitalDeliveryPhoneNumber addOns{...OrderAddOn}multiboxBundleId}fragment DriverFragment on Driver{id firstName photoUrl}fragment OrderGroupFragment on OrderGroup{driver{...DriverFragment}deliveryDate fulfillmentType status{...OrderGroupStatusFragment}showSeller isShippedByWalmart seller{...SellerFragment}id itemCount items{...LiteLineItemFragment}pickupPerson{firstName lastName email}accessPointId shipment{...ShipmentFragment}returnEligibilityMessage actions{...OrderGroupActionsFragment}recipientEmailAddress digitalDelivery{...DigitalDeliveryFragment}tireInstallationReservation{status extraText reservationId}}fragment OrderGroupStatusFragment on OrderGroupStatus{statusType showStatusTracker statusTracker{status label isCurrent}message{...textFragment}subtext subMessage{...textFragment}notice helpCenterText{...textFragment}}fragment textFragment on Text{parts{bold url text nativeAction lineBreak}}fragment LiteLineItemFragment on OrderLineItem{id quantity productInfo{name usItemId imageInfo{thumbnailUrl}offerId isAlcohol}priceInfo{linePrice{...price}}}fragment SellerFragment on GroupSeller{id name isPro}fragment DigitalDeliveryFragment on DigitalDelivery{title name instructions{...textFragment}}fragment ShipmentFragment on Shipment{id trackingNumber isExternalTracking trackingUrl proofOfDelivery{...ProofOfDeliveryFragment}}fragment OrderGroupActionsFragment on OrderGroupActions{reorder edit track changeSlot checkin editDeliveryInstructions editPickupPerson editTip tip rateDriver cancel enableTip{...orderActionFragment}enableEdit{...orderActionFragment}rescheduleTireInstall{...orderActionFragment}cancelTireInstall{...orderActionFragment}help viewCancellationDetails{...cancellationDetailsActionFragment}}fragment cancellationDetailsActionFragment on CancellationDetailsAction{label heading text{...textFragment}}fragment ProofOfDeliveryFragment on ProofOfDelivery{photoUrl photoPreviewUrl showPreview}fragment DeliveryInstructionsFragment on DeliveryInstructions{text type typeText}fragment GiftDetailsFragment on GiftDetails{recipientAddress{fullName}recipientEmail senderName giftMessage}fragment SubstitutionAction on SubstitutionAction{message label type}fragment ODPGroupCategoryFragment on OrderCategory{type name subtext returnMessage substitutionsBanner{...textFragment}showExtendedSubstitutions actions{substitutions{...SubstitutionAction}nilPickReshop{message action{text url}}returnDetails viewCancellationDetails{...cancellationDetailsActionFragment}trackOnInHomeApp}banner{...textFragment}accordionState items{...orderLineItem}substitutions{...orderLineItem fulfilledItems{...orderLineItem}}returnInfo{...returnInfoFragment}}fragment ODPGroupFragment on OrderGroup{id fulfillmentType deliveryMessage deliveryAddress{fullName firstName lastName address{...addressFragment}}deliveryInstructions{...DeliveryInstructionsFragment}deliveryPreferences{text{...textFragment}cta{...orderActionFragment}}editSubstitutionsCutOff status{statusType showStatusTracker message{...textFragment}notice helpCenterText{...textFragment}}itemCount isCategorized categories{...ODPGroupCategoryFragment}seller{id name isPro}shipment{id trackingNumber}actions{reorder edit track changeSlot checkin editDeliveryInstructions editPickupPerson tip cancel help enableTip{...orderActionFragment}enableEdit{...orderActionFragment}viewCancellationDetails{...cancellationDetailsActionFragment}enableInHome{...orderActionFragment}createGiftReceipt}cutOffTimestamp isEditSubstitutionsEligible isInHome giftDetails{...GiftDetailsFragment}donationDetails{...orderDonationDetails}}fragment returnInfoFragment on ReturnInfo{returnOrderId type refundPriceDetails{__typename...refundPriceDetailsFragment}refundMessage tierRefundMessage paymentMethods{__typename description cardType paymentType displayValues message{...textFragment}}actions{__typename generate scheduleOrModifyPickup{text url}reschedulePickup editPickupContact}shippingLabelUrl qrCodeImageUrl carriers{__typename id name}pickupCarrier pickupContact{nameAndAddress{fullName firstName lastName address{addressString city state postalCode addressLineOne addressLineTwo country}}phone}pickupConfirmationNumber bannerMessage{...textFragment}}fragment refundPriceDetailsFragment on RefundPriceDetails{subTotal{__typename...orderPriceDetailRowFragment}fees{__typename...orderPriceDetailRowFragment}discounts{__typename...orderPriceDetailRowFragment}taxTotal{__typename...orderPriceDetailRowFragment}grandTotal{__typename...orderPriceDetailRowFragment}}fragment orderPriceDetailRowFragment on OrderPriceDetailRow{label displayValue value info{__typename title message}}fragment addressFragment on OrderAddress{addressString addressLineOne addressLineTwo state postalCode city}fragment ODPPickupInfo on OrderGroup{pickupInstructions pickupPerson{...person}alternatePickupPerson{...person}store{id name address{...addressFragment}}}fragment person on OrderPickupPerson{firstName lastName email}fragment ODPTippingInfo on OrderGroup{addTipMessage{...textFragment}driver{...DriverFragment}tipping{min{...price}max{...price}suggested{...price}preselected}subtotal{...price}}fragment orderActionFragment on Action{text url}fragment orderCustomer on OrderCustomer{id firstName lastName email isGuest isEmailRegistered}fragment OrderFieldsFragment on Order{__typename id version type customer{...orderCustomer}displayId idBarcodeImageUrl(barWidth:3 barHeight:100) isFuelPurchase title shortTitle timezone tippableGroup{...OrderGroupFragment}amendableGroup{id changeSlotIterationsLeft cutOffTimestamp fulfillmentType deliveryAddress{fullName firstName lastName address{addressString addressLineOne addressLineTwo state postalCode city country}}isAmendInProgress}substitutionsBanner{heading subheading longSubheading}groups_2101{__typename...OrderGroupFragment...ODPGroupFragment...ODPPickupInfo...ODPTippingInfo}multiboxBundles{...orderLineItem}itemCancelReasons{__typename...cancelReason}groupCancelReasons{__typename...cancelReason}priceDetails{__typename subTotal{__typename...priceDetailFragment}taxTotal{__typename...priceDetailFragment}grandTotal{__typename...priceDetailFragment}authorizationAmount{__typename...priceDetailFragment}fees{__typename...priceDetailFragment}discounts{__typename...priceDetailFragment}minimumThreshold{__typename...price}belowMinimumFee{__typename...priceDetailFragment}driverTip{__typename...priceDetailFragment}donations{__typename...priceDetailFragment}}paymentMethods{__typename description cardType paymentType displayValues message{...textFragment}actions{connectToCapitalOne{...orderActionFragment}visitAffirm{...orderActionFragment}}}actions{__typename return pendingReturn cancel startReturn{...orderActionFragment}reorder}banners{...textFragment}}","variables":{"orderId":"3382219866159","emailAddress":"dottiegmc@aol.com"}}' \
  --compressed`
 
  if [[ $curl48 =~ "blocked" ]]; then
    link48=`echo $curl48 | jq '.redirectUrl' | sed 's/"//g'`
    `open -n -a /Applications/Microsoft\ Edge.app --args --profile-directory=Default https://walmart.com$link48`
    read -n 1 -p "blocked"
  else
    break
  fi
done

if [[ $curl48 =~ "error" ]]; then
    echo "48-Sai info"
    echo "'3382219866159" >> track-OrderID.txt
    echo "dottiegmc@aol.com" >> track-email.txt
    echo "Sai info" >> track-usItemId.txt
    echo "Sai info" >> track-priceValue.txt
    echo "Sai info" >> track-fullName.txt
    echo "Sai info" >> track-address.txt
    echo "Sai info" >> track-status.txt
    echo "Sai info" >> track-number.txt
    echo "Sai info" >> track-url.txt
    echo "Sai info" >> track-categoriesType.txt
else
    sum48=`md5 track-OrderID.txt`
    for (( i=0; i<=4; i++ ))
    do
        for (( j=0; j<=4; j++))
        do
            if [[ `echo $curl48 | jq '.data.guestOrder.groups_2101['${i[@]}'].items['${j[@]}'].productInfo.usItemId'` == '"853813286"' ]]; then
                echo "'3382219866159" >> track-OrderID.txt
                echo dottiegmc@aol.com >> track-email.txt
                echo $curl48 | jq '.data.guestOrder.groups_2101['${i[@]}'].items['${j[@]}'].productInfo.usItemId' >> track-usItemId.txt
                echo $curl48 | jq '.data.guestOrder.groups_2101['${i[@]}'].items['${j[@]}'].priceInfo.linePrice.value' >> track-priceValue.txt
                echo $curl48 | jq '.data.guestOrder.groups_2101['${i[@]}'].deliveryAddress.fullName' >> track-fullName.txt
                echo $curl48 | jq '.data.guestOrder.groups_2101['${i[@]}'].deliveryAddress.address.addressString' >> track-address.txt
                echo $curl48 | jq '.data.guestOrder.groups_2101['${i[@]}'].status.message.parts[].text' >> track-status.txt
                echo $curl48 | jq '.data.guestOrder.groups_2101['${i[@]}'].shipment.trackingNumber' | sed 's/null//g' >> track-number.txt
                echo $curl48 | jq '.data.guestOrder.groups_2101['${i[@]}'].shipment.trackingUrl' | sed 's/null//g' >> track-url.txt
                echo $curl48 | jq '.data.guestOrder.groups_2101['${i[@]}'].categories[].type' >> track-categoriesType.txt

                break
            fi
        done
    done
    if [[ $sum48 == `md5 track-OrderID.txt` ]]; then
        echo "48-Khác Item"
        echo "'3382219866159" >> track-OrderID.txt
        echo "dottiegmc@aol.com" >> track-email.txt
        echo "Khác Item" >> track-usItemId.txt
        echo "Khác Item" >> track-priceValue.txt
        echo "Khác Item" >> track-fullName.txt
        echo "Khác Item" >> track-address.txt
        echo "Khác Item" >> track-status.txt
        echo "Khác Item" >> track-number.txt
        echo "Khác Item" >> track-url.txt
        echo "Khác Item" >> track-categoriesType.txt
    else
        echo "48"
    fi   
fi
while true
do
curl49=`curl -s 'https://www.walmart.com/orchestra/home/graphql' \
  -H 'authority: www.walmart.com' \
  -H 'sec-ch-ua: " Not;A Brand";v="99", "Microsoft Edge";v="97", "Chromium";v="97"' \
  -H 'x-o-platform: rweb' \
  -H 'dnt: 1' \
  -H 'x-o-correlation-id: pn9BnlEx0zDiyvRGJ6nL5BS9pDN7erB017Nf' \
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
  -H 'user-agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.51 Safari/537.36 Edg/99.0.1150.36' \
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
  --data-raw $'{"query":"query getGuestOrder($orderId:ID\u0021 $emailAddress:String\u0021){guestOrder(input:{id:$orderId emailAddress:$emailAddress}){...OrderFieldsFragment}}fragment cancelReason on OrderCancelReason{__typename subReasonCode subDescription}fragment priceDetailFragment on OrderPriceDetailRow{label value displayValue info{title message}rowInfo{...orderPriceDetailRowInfo}}fragment orderPriceDetailRowInfo on OrderPriceDetailRowInfo{title message{...textFragment}}fragment price on Price{displayValue value}fragment variants on MapEntry{name value}fragment OrderAddOn on OrderAddOn{lineId uniqueLineId productInfo{name usItemId offerId}quantityString quantityLabel type fulfillmentInstructions{...textFragment}actions{manageProtectionPlan{...orderActionFragment}cancel}priceInfo{linePrice{...price}}quantity isActive}fragment orderDonationDetails on OrderDonationDetails{message{...textFragment}emailReceipt emailReceiptToken status{...textFragment}errorStatus}fragment orderLineItem on OrderLineItem{id uniqueId actions{contactSeller cancel addToCart configureCake reviewItem resendEGiftCardToken protectionPlan{...orderActionFragment}manageProtectionPlan{...orderActionFragment}}isGift digitalDeliveryMessage quantity quantityString quantityLabel isSubstitutionSelected fulfilledItems{id quantityString priceInfo{itemPrice{value}}productInfo{usItemId name}}isReturnable returnEligibilityMessage productInfo{name usItemId imageInfo{thumbnailUrl}canonicalUrl offerId orderLimit orderMinLimit weightIncrement salesUnit salesUnitType isSubstitutionEligible isAlcohol}reshop{reshopMessage isShippingAvailable minPromiseDate maxPromiseDate}selectedVariants{...variants}variantAdditionalInfo{parts{text nativeAction}}priceInfo{priceDisplayCodes{showItemPrice priceDisplayCondition finalCostByWeight}itemPrice{...price}linePrice{...price}unitPrice{...price}preDiscountedLinePrice{...price}additionalLines{name value}}discounts{label labelText{...textFragment}}itemReviewed activationCodes{label code}protectionPlanMessage{...textFragment}showSeller isShippedByWalmart seller{id name isPro}digitalDeliveryPhoneNumber addOns{...OrderAddOn}multiboxBundleId}fragment DriverFragment on Driver{id firstName photoUrl}fragment OrderGroupFragment on OrderGroup{driver{...DriverFragment}deliveryDate fulfillmentType status{...OrderGroupStatusFragment}showSeller isShippedByWalmart seller{...SellerFragment}id itemCount items{...LiteLineItemFragment}pickupPerson{firstName lastName email}accessPointId shipment{...ShipmentFragment}returnEligibilityMessage actions{...OrderGroupActionsFragment}recipientEmailAddress digitalDelivery{...DigitalDeliveryFragment}tireInstallationReservation{status extraText reservationId}}fragment OrderGroupStatusFragment on OrderGroupStatus{statusType showStatusTracker statusTracker{status label isCurrent}message{...textFragment}subtext subMessage{...textFragment}notice helpCenterText{...textFragment}}fragment textFragment on Text{parts{bold url text nativeAction lineBreak}}fragment LiteLineItemFragment on OrderLineItem{id quantity productInfo{name usItemId imageInfo{thumbnailUrl}offerId isAlcohol}priceInfo{linePrice{...price}}}fragment SellerFragment on GroupSeller{id name isPro}fragment DigitalDeliveryFragment on DigitalDelivery{title name instructions{...textFragment}}fragment ShipmentFragment on Shipment{id trackingNumber isExternalTracking trackingUrl proofOfDelivery{...ProofOfDeliveryFragment}}fragment OrderGroupActionsFragment on OrderGroupActions{reorder edit track changeSlot checkin editDeliveryInstructions editPickupPerson editTip tip rateDriver cancel enableTip{...orderActionFragment}enableEdit{...orderActionFragment}rescheduleTireInstall{...orderActionFragment}cancelTireInstall{...orderActionFragment}help viewCancellationDetails{...cancellationDetailsActionFragment}}fragment cancellationDetailsActionFragment on CancellationDetailsAction{label heading text{...textFragment}}fragment ProofOfDeliveryFragment on ProofOfDelivery{photoUrl photoPreviewUrl showPreview}fragment DeliveryInstructionsFragment on DeliveryInstructions{text type typeText}fragment GiftDetailsFragment on GiftDetails{recipientAddress{fullName}recipientEmail senderName giftMessage}fragment SubstitutionAction on SubstitutionAction{message label type}fragment ODPGroupCategoryFragment on OrderCategory{type name subtext returnMessage substitutionsBanner{...textFragment}showExtendedSubstitutions actions{substitutions{...SubstitutionAction}nilPickReshop{message action{text url}}returnDetails viewCancellationDetails{...cancellationDetailsActionFragment}trackOnInHomeApp}banner{...textFragment}accordionState items{...orderLineItem}substitutions{...orderLineItem fulfilledItems{...orderLineItem}}returnInfo{...returnInfoFragment}}fragment ODPGroupFragment on OrderGroup{id fulfillmentType deliveryMessage deliveryAddress{fullName firstName lastName address{...addressFragment}}deliveryInstructions{...DeliveryInstructionsFragment}deliveryPreferences{text{...textFragment}cta{...orderActionFragment}}editSubstitutionsCutOff status{statusType showStatusTracker message{...textFragment}notice helpCenterText{...textFragment}}itemCount isCategorized categories{...ODPGroupCategoryFragment}seller{id name isPro}shipment{id trackingNumber}actions{reorder edit track changeSlot checkin editDeliveryInstructions editPickupPerson tip cancel help enableTip{...orderActionFragment}enableEdit{...orderActionFragment}viewCancellationDetails{...cancellationDetailsActionFragment}enableInHome{...orderActionFragment}createGiftReceipt}cutOffTimestamp isEditSubstitutionsEligible isInHome giftDetails{...GiftDetailsFragment}donationDetails{...orderDonationDetails}}fragment returnInfoFragment on ReturnInfo{returnOrderId type refundPriceDetails{__typename...refundPriceDetailsFragment}refundMessage tierRefundMessage paymentMethods{__typename description cardType paymentType displayValues message{...textFragment}}actions{__typename generate scheduleOrModifyPickup{text url}reschedulePickup editPickupContact}shippingLabelUrl qrCodeImageUrl carriers{__typename id name}pickupCarrier pickupContact{nameAndAddress{fullName firstName lastName address{addressString city state postalCode addressLineOne addressLineTwo country}}phone}pickupConfirmationNumber bannerMessage{...textFragment}}fragment refundPriceDetailsFragment on RefundPriceDetails{subTotal{__typename...orderPriceDetailRowFragment}fees{__typename...orderPriceDetailRowFragment}discounts{__typename...orderPriceDetailRowFragment}taxTotal{__typename...orderPriceDetailRowFragment}grandTotal{__typename...orderPriceDetailRowFragment}}fragment orderPriceDetailRowFragment on OrderPriceDetailRow{label displayValue value info{__typename title message}}fragment addressFragment on OrderAddress{addressString addressLineOne addressLineTwo state postalCode city}fragment ODPPickupInfo on OrderGroup{pickupInstructions pickupPerson{...person}alternatePickupPerson{...person}store{id name address{...addressFragment}}}fragment person on OrderPickupPerson{firstName lastName email}fragment ODPTippingInfo on OrderGroup{addTipMessage{...textFragment}driver{...DriverFragment}tipping{min{...price}max{...price}suggested{...price}preselected}subtotal{...price}}fragment orderActionFragment on Action{text url}fragment orderCustomer on OrderCustomer{id firstName lastName email isGuest isEmailRegistered}fragment OrderFieldsFragment on Order{__typename id version type customer{...orderCustomer}displayId idBarcodeImageUrl(barWidth:3 barHeight:100) isFuelPurchase title shortTitle timezone tippableGroup{...OrderGroupFragment}amendableGroup{id changeSlotIterationsLeft cutOffTimestamp fulfillmentType deliveryAddress{fullName firstName lastName address{addressString addressLineOne addressLineTwo state postalCode city country}}isAmendInProgress}substitutionsBanner{heading subheading longSubheading}groups_2101{__typename...OrderGroupFragment...ODPGroupFragment...ODPPickupInfo...ODPTippingInfo}multiboxBundles{...orderLineItem}itemCancelReasons{__typename...cancelReason}groupCancelReasons{__typename...cancelReason}priceDetails{__typename subTotal{__typename...priceDetailFragment}taxTotal{__typename...priceDetailFragment}grandTotal{__typename...priceDetailFragment}authorizationAmount{__typename...priceDetailFragment}fees{__typename...priceDetailFragment}discounts{__typename...priceDetailFragment}minimumThreshold{__typename...price}belowMinimumFee{__typename...priceDetailFragment}driverTip{__typename...priceDetailFragment}donations{__typename...priceDetailFragment}}paymentMethods{__typename description cardType paymentType displayValues message{...textFragment}actions{connectToCapitalOne{...orderActionFragment}visitAffirm{...orderActionFragment}}}actions{__typename return pendingReturn cancel startReturn{...orderActionFragment}reorder}banners{...textFragment}}","variables":{"orderId":"3382219454884","emailAddress":"Mellyh2@gmail.com"}}' \
  --compressed`
 
  if [[ $curl49 =~ "blocked" ]]; then
    link49=`echo $curl49 | jq '.redirectUrl' | sed 's/"//g'`
    `open -n -a /Applications/Microsoft\ Edge.app --args --profile-directory=Default https://walmart.com$link49`
    read -n 1 -p "blocked"
  else
    break
  fi
done

if [[ $curl49 =~ "error" ]]; then
    echo "49-Sai info"
    echo "'3382219454884" >> track-OrderID.txt
    echo "Mellyh2@gmail.com" >> track-email.txt
    echo "Sai info" >> track-usItemId.txt
    echo "Sai info" >> track-priceValue.txt
    echo "Sai info" >> track-fullName.txt
    echo "Sai info" >> track-address.txt
    echo "Sai info" >> track-status.txt
    echo "Sai info" >> track-number.txt
    echo "Sai info" >> track-url.txt
    echo "Sai info" >> track-categoriesType.txt
else
    sum49=`md5 track-OrderID.txt`
    for (( i=0; i<=4; i++ ))
    do
        for (( j=0; j<=4; j++))
        do
            if [[ `echo $curl49 | jq '.data.guestOrder.groups_2101['${i[@]}'].items['${j[@]}'].productInfo.usItemId'` == '"185648664"' ]]; then
                echo "'3382219454884" >> track-OrderID.txt
                echo Mellyh2@gmail.com >> track-email.txt
                echo $curl49 | jq '.data.guestOrder.groups_2101['${i[@]}'].items['${j[@]}'].productInfo.usItemId' >> track-usItemId.txt
                echo $curl49 | jq '.data.guestOrder.groups_2101['${i[@]}'].items['${j[@]}'].priceInfo.linePrice.value' >> track-priceValue.txt
                echo $curl49 | jq '.data.guestOrder.groups_2101['${i[@]}'].deliveryAddress.fullName' >> track-fullName.txt
                echo $curl49 | jq '.data.guestOrder.groups_2101['${i[@]}'].deliveryAddress.address.addressString' >> track-address.txt
                echo $curl49 | jq '.data.guestOrder.groups_2101['${i[@]}'].status.message.parts[].text' >> track-status.txt
                echo $curl49 | jq '.data.guestOrder.groups_2101['${i[@]}'].shipment.trackingNumber' | sed 's/null//g' >> track-number.txt
                echo $curl49 | jq '.data.guestOrder.groups_2101['${i[@]}'].shipment.trackingUrl' | sed 's/null//g' >> track-url.txt
                echo $curl49 | jq '.data.guestOrder.groups_2101['${i[@]}'].categories[].type' >> track-categoriesType.txt

                break
            fi
        done
    done
    if [[ $sum49 == `md5 track-OrderID.txt` ]]; then
        echo "49-Khác Item"
        echo "'3382219454884" >> track-OrderID.txt
        echo "Mellyh2@gmail.com" >> track-email.txt
        echo "Khác Item" >> track-usItemId.txt
        echo "Khác Item" >> track-priceValue.txt
        echo "Khác Item" >> track-fullName.txt
        echo "Khác Item" >> track-address.txt
        echo "Khác Item" >> track-status.txt
        echo "Khác Item" >> track-number.txt
        echo "Khác Item" >> track-url.txt
        echo "Khác Item" >> track-categoriesType.txt
    else
        echo "49"
    fi   
fi
while true
do
curl50=`curl -s 'https://www.walmart.com/orchestra/home/graphql' \
  -H 'authority: www.walmart.com' \
  -H 'sec-ch-ua: " Not;A Brand";v="99", "Microsoft Edge";v="97", "Chromium";v="97"' \
  -H 'x-o-platform: rweb' \
  -H 'dnt: 1' \
  -H 'x-o-correlation-id: pn9BnlEx0zDiyvRGJ6nL5BS9pDN7erB017Nf' \
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
  -H 'user-agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.51 Safari/537.36 Edg/99.0.1150.36' \
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
  --data-raw $'{"query":"query getGuestOrder($orderId:ID\u0021 $emailAddress:String\u0021){guestOrder(input:{id:$orderId emailAddress:$emailAddress}){...OrderFieldsFragment}}fragment cancelReason on OrderCancelReason{__typename subReasonCode subDescription}fragment priceDetailFragment on OrderPriceDetailRow{label value displayValue info{title message}rowInfo{...orderPriceDetailRowInfo}}fragment orderPriceDetailRowInfo on OrderPriceDetailRowInfo{title message{...textFragment}}fragment price on Price{displayValue value}fragment variants on MapEntry{name value}fragment OrderAddOn on OrderAddOn{lineId uniqueLineId productInfo{name usItemId offerId}quantityString quantityLabel type fulfillmentInstructions{...textFragment}actions{manageProtectionPlan{...orderActionFragment}cancel}priceInfo{linePrice{...price}}quantity isActive}fragment orderDonationDetails on OrderDonationDetails{message{...textFragment}emailReceipt emailReceiptToken status{...textFragment}errorStatus}fragment orderLineItem on OrderLineItem{id uniqueId actions{contactSeller cancel addToCart configureCake reviewItem resendEGiftCardToken protectionPlan{...orderActionFragment}manageProtectionPlan{...orderActionFragment}}isGift digitalDeliveryMessage quantity quantityString quantityLabel isSubstitutionSelected fulfilledItems{id quantityString priceInfo{itemPrice{value}}productInfo{usItemId name}}isReturnable returnEligibilityMessage productInfo{name usItemId imageInfo{thumbnailUrl}canonicalUrl offerId orderLimit orderMinLimit weightIncrement salesUnit salesUnitType isSubstitutionEligible isAlcohol}reshop{reshopMessage isShippingAvailable minPromiseDate maxPromiseDate}selectedVariants{...variants}variantAdditionalInfo{parts{text nativeAction}}priceInfo{priceDisplayCodes{showItemPrice priceDisplayCondition finalCostByWeight}itemPrice{...price}linePrice{...price}unitPrice{...price}preDiscountedLinePrice{...price}additionalLines{name value}}discounts{label labelText{...textFragment}}itemReviewed activationCodes{label code}protectionPlanMessage{...textFragment}showSeller isShippedByWalmart seller{id name isPro}digitalDeliveryPhoneNumber addOns{...OrderAddOn}multiboxBundleId}fragment DriverFragment on Driver{id firstName photoUrl}fragment OrderGroupFragment on OrderGroup{driver{...DriverFragment}deliveryDate fulfillmentType status{...OrderGroupStatusFragment}showSeller isShippedByWalmart seller{...SellerFragment}id itemCount items{...LiteLineItemFragment}pickupPerson{firstName lastName email}accessPointId shipment{...ShipmentFragment}returnEligibilityMessage actions{...OrderGroupActionsFragment}recipientEmailAddress digitalDelivery{...DigitalDeliveryFragment}tireInstallationReservation{status extraText reservationId}}fragment OrderGroupStatusFragment on OrderGroupStatus{statusType showStatusTracker statusTracker{status label isCurrent}message{...textFragment}subtext subMessage{...textFragment}notice helpCenterText{...textFragment}}fragment textFragment on Text{parts{bold url text nativeAction lineBreak}}fragment LiteLineItemFragment on OrderLineItem{id quantity productInfo{name usItemId imageInfo{thumbnailUrl}offerId isAlcohol}priceInfo{linePrice{...price}}}fragment SellerFragment on GroupSeller{id name isPro}fragment DigitalDeliveryFragment on DigitalDelivery{title name instructions{...textFragment}}fragment ShipmentFragment on Shipment{id trackingNumber isExternalTracking trackingUrl proofOfDelivery{...ProofOfDeliveryFragment}}fragment OrderGroupActionsFragment on OrderGroupActions{reorder edit track changeSlot checkin editDeliveryInstructions editPickupPerson editTip tip rateDriver cancel enableTip{...orderActionFragment}enableEdit{...orderActionFragment}rescheduleTireInstall{...orderActionFragment}cancelTireInstall{...orderActionFragment}help viewCancellationDetails{...cancellationDetailsActionFragment}}fragment cancellationDetailsActionFragment on CancellationDetailsAction{label heading text{...textFragment}}fragment ProofOfDeliveryFragment on ProofOfDelivery{photoUrl photoPreviewUrl showPreview}fragment DeliveryInstructionsFragment on DeliveryInstructions{text type typeText}fragment GiftDetailsFragment on GiftDetails{recipientAddress{fullName}recipientEmail senderName giftMessage}fragment SubstitutionAction on SubstitutionAction{message label type}fragment ODPGroupCategoryFragment on OrderCategory{type name subtext returnMessage substitutionsBanner{...textFragment}showExtendedSubstitutions actions{substitutions{...SubstitutionAction}nilPickReshop{message action{text url}}returnDetails viewCancellationDetails{...cancellationDetailsActionFragment}trackOnInHomeApp}banner{...textFragment}accordionState items{...orderLineItem}substitutions{...orderLineItem fulfilledItems{...orderLineItem}}returnInfo{...returnInfoFragment}}fragment ODPGroupFragment on OrderGroup{id fulfillmentType deliveryMessage deliveryAddress{fullName firstName lastName address{...addressFragment}}deliveryInstructions{...DeliveryInstructionsFragment}deliveryPreferences{text{...textFragment}cta{...orderActionFragment}}editSubstitutionsCutOff status{statusType showStatusTracker message{...textFragment}notice helpCenterText{...textFragment}}itemCount isCategorized categories{...ODPGroupCategoryFragment}seller{id name isPro}shipment{id trackingNumber}actions{reorder edit track changeSlot checkin editDeliveryInstructions editPickupPerson tip cancel help enableTip{...orderActionFragment}enableEdit{...orderActionFragment}viewCancellationDetails{...cancellationDetailsActionFragment}enableInHome{...orderActionFragment}createGiftReceipt}cutOffTimestamp isEditSubstitutionsEligible isInHome giftDetails{...GiftDetailsFragment}donationDetails{...orderDonationDetails}}fragment returnInfoFragment on ReturnInfo{returnOrderId type refundPriceDetails{__typename...refundPriceDetailsFragment}refundMessage tierRefundMessage paymentMethods{__typename description cardType paymentType displayValues message{...textFragment}}actions{__typename generate scheduleOrModifyPickup{text url}reschedulePickup editPickupContact}shippingLabelUrl qrCodeImageUrl carriers{__typename id name}pickupCarrier pickupContact{nameAndAddress{fullName firstName lastName address{addressString city state postalCode addressLineOne addressLineTwo country}}phone}pickupConfirmationNumber bannerMessage{...textFragment}}fragment refundPriceDetailsFragment on RefundPriceDetails{subTotal{__typename...orderPriceDetailRowFragment}fees{__typename...orderPriceDetailRowFragment}discounts{__typename...orderPriceDetailRowFragment}taxTotal{__typename...orderPriceDetailRowFragment}grandTotal{__typename...orderPriceDetailRowFragment}}fragment orderPriceDetailRowFragment on OrderPriceDetailRow{label displayValue value info{__typename title message}}fragment addressFragment on OrderAddress{addressString addressLineOne addressLineTwo state postalCode city}fragment ODPPickupInfo on OrderGroup{pickupInstructions pickupPerson{...person}alternatePickupPerson{...person}store{id name address{...addressFragment}}}fragment person on OrderPickupPerson{firstName lastName email}fragment ODPTippingInfo on OrderGroup{addTipMessage{...textFragment}driver{...DriverFragment}tipping{min{...price}max{...price}suggested{...price}preselected}subtotal{...price}}fragment orderActionFragment on Action{text url}fragment orderCustomer on OrderCustomer{id firstName lastName email isGuest isEmailRegistered}fragment OrderFieldsFragment on Order{__typename id version type customer{...orderCustomer}displayId idBarcodeImageUrl(barWidth:3 barHeight:100) isFuelPurchase title shortTitle timezone tippableGroup{...OrderGroupFragment}amendableGroup{id changeSlotIterationsLeft cutOffTimestamp fulfillmentType deliveryAddress{fullName firstName lastName address{addressString addressLineOne addressLineTwo state postalCode city country}}isAmendInProgress}substitutionsBanner{heading subheading longSubheading}groups_2101{__typename...OrderGroupFragment...ODPGroupFragment...ODPPickupInfo...ODPTippingInfo}multiboxBundles{...orderLineItem}itemCancelReasons{__typename...cancelReason}groupCancelReasons{__typename...cancelReason}priceDetails{__typename subTotal{__typename...priceDetailFragment}taxTotal{__typename...priceDetailFragment}grandTotal{__typename...priceDetailFragment}authorizationAmount{__typename...priceDetailFragment}fees{__typename...priceDetailFragment}discounts{__typename...priceDetailFragment}minimumThreshold{__typename...price}belowMinimumFee{__typename...priceDetailFragment}driverTip{__typename...priceDetailFragment}donations{__typename...priceDetailFragment}}paymentMethods{__typename description cardType paymentType displayValues message{...textFragment}actions{connectToCapitalOne{...orderActionFragment}visitAffirm{...orderActionFragment}}}actions{__typename return pendingReturn cancel startReturn{...orderActionFragment}reorder}banners{...textFragment}}","variables":{"orderId":"3382219855831","emailAddress":"Kennethraycoatesjr@gmail.com"}}' \
  --compressed`
 
  if [[ $curl50 =~ "blocked" ]]; then
    link50=`echo $curl50 | jq '.redirectUrl' | sed 's/"//g'`
    `open -n -a /Applications/Microsoft\ Edge.app --args --profile-directory=Default https://walmart.com$link50`
    read -n 1 -p "blocked"
  else
    break
  fi
done

if [[ $curl50 =~ "error" ]]; then
    echo "50-Sai info"
    echo "'3382219855831" >> track-OrderID.txt
    echo "Kennethraycoatesjr@gmail.com" >> track-email.txt
    echo "Sai info" >> track-usItemId.txt
    echo "Sai info" >> track-priceValue.txt
    echo "Sai info" >> track-fullName.txt
    echo "Sai info" >> track-address.txt
    echo "Sai info" >> track-status.txt
    echo "Sai info" >> track-number.txt
    echo "Sai info" >> track-url.txt
    echo "Sai info" >> track-categoriesType.txt
else
    sum50=`md5 track-OrderID.txt`
    for (( i=0; i<=4; i++ ))
    do
        for (( j=0; j<=4; j++))
        do
            if [[ `echo $curl50 | jq '.data.guestOrder.groups_2101['${i[@]}'].items['${j[@]}'].productInfo.usItemId'` == '"112794035"' ]]; then
                echo "'3382219855831" >> track-OrderID.txt
                echo Kennethraycoatesjr@gmail.com >> track-email.txt
                echo $curl50 | jq '.data.guestOrder.groups_2101['${i[@]}'].items['${j[@]}'].productInfo.usItemId' >> track-usItemId.txt
                echo $curl50 | jq '.data.guestOrder.groups_2101['${i[@]}'].items['${j[@]}'].priceInfo.linePrice.value' >> track-priceValue.txt
                echo $curl50 | jq '.data.guestOrder.groups_2101['${i[@]}'].deliveryAddress.fullName' >> track-fullName.txt
                echo $curl50 | jq '.data.guestOrder.groups_2101['${i[@]}'].deliveryAddress.address.addressString' >> track-address.txt
                echo $curl50 | jq '.data.guestOrder.groups_2101['${i[@]}'].status.message.parts[].text' >> track-status.txt
                echo $curl50 | jq '.data.guestOrder.groups_2101['${i[@]}'].shipment.trackingNumber' | sed 's/null//g' >> track-number.txt
                echo $curl50 | jq '.data.guestOrder.groups_2101['${i[@]}'].shipment.trackingUrl' | sed 's/null//g' >> track-url.txt
                echo $curl50 | jq '.data.guestOrder.groups_2101['${i[@]}'].categories[].type' >> track-categoriesType.txt

                break
            fi
        done
    done
    if [[ $sum50 == `md5 track-OrderID.txt` ]]; then
        echo "50-Khác Item"
        echo "'3382219855831" >> track-OrderID.txt
        echo "Kennethraycoatesjr@gmail.com" >> track-email.txt
        echo "Khác Item" >> track-usItemId.txt
        echo "Khác Item" >> track-priceValue.txt
        echo "Khác Item" >> track-fullName.txt
        echo "Khác Item" >> track-address.txt
        echo "Khác Item" >> track-status.txt
        echo "Khác Item" >> track-number.txt
        echo "Khác Item" >> track-url.txt
        echo "Khác Item" >> track-categoriesType.txt
    else
        echo "50"
    fi   
fi
while true
do
curl51=`curl -s 'https://www.walmart.com/orchestra/home/graphql' \
  -H 'authority: www.walmart.com' \
  -H 'sec-ch-ua: " Not;A Brand";v="99", "Microsoft Edge";v="97", "Chromium";v="97"' \
  -H 'x-o-platform: rweb' \
  -H 'dnt: 1' \
  -H 'x-o-correlation-id: pn9BnlEx0zDiyvRGJ6nL5BS9pDN7erB017Nf' \
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
  -H 'user-agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.51 Safari/537.36 Edg/99.0.1150.36' \
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
  --data-raw $'{"query":"query getGuestOrder($orderId:ID\u0021 $emailAddress:String\u0021){guestOrder(input:{id:$orderId emailAddress:$emailAddress}){...OrderFieldsFragment}}fragment cancelReason on OrderCancelReason{__typename subReasonCode subDescription}fragment priceDetailFragment on OrderPriceDetailRow{label value displayValue info{title message}rowInfo{...orderPriceDetailRowInfo}}fragment orderPriceDetailRowInfo on OrderPriceDetailRowInfo{title message{...textFragment}}fragment price on Price{displayValue value}fragment variants on MapEntry{name value}fragment OrderAddOn on OrderAddOn{lineId uniqueLineId productInfo{name usItemId offerId}quantityString quantityLabel type fulfillmentInstructions{...textFragment}actions{manageProtectionPlan{...orderActionFragment}cancel}priceInfo{linePrice{...price}}quantity isActive}fragment orderDonationDetails on OrderDonationDetails{message{...textFragment}emailReceipt emailReceiptToken status{...textFragment}errorStatus}fragment orderLineItem on OrderLineItem{id uniqueId actions{contactSeller cancel addToCart configureCake reviewItem resendEGiftCardToken protectionPlan{...orderActionFragment}manageProtectionPlan{...orderActionFragment}}isGift digitalDeliveryMessage quantity quantityString quantityLabel isSubstitutionSelected fulfilledItems{id quantityString priceInfo{itemPrice{value}}productInfo{usItemId name}}isReturnable returnEligibilityMessage productInfo{name usItemId imageInfo{thumbnailUrl}canonicalUrl offerId orderLimit orderMinLimit weightIncrement salesUnit salesUnitType isSubstitutionEligible isAlcohol}reshop{reshopMessage isShippingAvailable minPromiseDate maxPromiseDate}selectedVariants{...variants}variantAdditionalInfo{parts{text nativeAction}}priceInfo{priceDisplayCodes{showItemPrice priceDisplayCondition finalCostByWeight}itemPrice{...price}linePrice{...price}unitPrice{...price}preDiscountedLinePrice{...price}additionalLines{name value}}discounts{label labelText{...textFragment}}itemReviewed activationCodes{label code}protectionPlanMessage{...textFragment}showSeller isShippedByWalmart seller{id name isPro}digitalDeliveryPhoneNumber addOns{...OrderAddOn}multiboxBundleId}fragment DriverFragment on Driver{id firstName photoUrl}fragment OrderGroupFragment on OrderGroup{driver{...DriverFragment}deliveryDate fulfillmentType status{...OrderGroupStatusFragment}showSeller isShippedByWalmart seller{...SellerFragment}id itemCount items{...LiteLineItemFragment}pickupPerson{firstName lastName email}accessPointId shipment{...ShipmentFragment}returnEligibilityMessage actions{...OrderGroupActionsFragment}recipientEmailAddress digitalDelivery{...DigitalDeliveryFragment}tireInstallationReservation{status extraText reservationId}}fragment OrderGroupStatusFragment on OrderGroupStatus{statusType showStatusTracker statusTracker{status label isCurrent}message{...textFragment}subtext subMessage{...textFragment}notice helpCenterText{...textFragment}}fragment textFragment on Text{parts{bold url text nativeAction lineBreak}}fragment LiteLineItemFragment on OrderLineItem{id quantity productInfo{name usItemId imageInfo{thumbnailUrl}offerId isAlcohol}priceInfo{linePrice{...price}}}fragment SellerFragment on GroupSeller{id name isPro}fragment DigitalDeliveryFragment on DigitalDelivery{title name instructions{...textFragment}}fragment ShipmentFragment on Shipment{id trackingNumber isExternalTracking trackingUrl proofOfDelivery{...ProofOfDeliveryFragment}}fragment OrderGroupActionsFragment on OrderGroupActions{reorder edit track changeSlot checkin editDeliveryInstructions editPickupPerson editTip tip rateDriver cancel enableTip{...orderActionFragment}enableEdit{...orderActionFragment}rescheduleTireInstall{...orderActionFragment}cancelTireInstall{...orderActionFragment}help viewCancellationDetails{...cancellationDetailsActionFragment}}fragment cancellationDetailsActionFragment on CancellationDetailsAction{label heading text{...textFragment}}fragment ProofOfDeliveryFragment on ProofOfDelivery{photoUrl photoPreviewUrl showPreview}fragment DeliveryInstructionsFragment on DeliveryInstructions{text type typeText}fragment GiftDetailsFragment on GiftDetails{recipientAddress{fullName}recipientEmail senderName giftMessage}fragment SubstitutionAction on SubstitutionAction{message label type}fragment ODPGroupCategoryFragment on OrderCategory{type name subtext returnMessage substitutionsBanner{...textFragment}showExtendedSubstitutions actions{substitutions{...SubstitutionAction}nilPickReshop{message action{text url}}returnDetails viewCancellationDetails{...cancellationDetailsActionFragment}trackOnInHomeApp}banner{...textFragment}accordionState items{...orderLineItem}substitutions{...orderLineItem fulfilledItems{...orderLineItem}}returnInfo{...returnInfoFragment}}fragment ODPGroupFragment on OrderGroup{id fulfillmentType deliveryMessage deliveryAddress{fullName firstName lastName address{...addressFragment}}deliveryInstructions{...DeliveryInstructionsFragment}deliveryPreferences{text{...textFragment}cta{...orderActionFragment}}editSubstitutionsCutOff status{statusType showStatusTracker message{...textFragment}notice helpCenterText{...textFragment}}itemCount isCategorized categories{...ODPGroupCategoryFragment}seller{id name isPro}shipment{id trackingNumber}actions{reorder edit track changeSlot checkin editDeliveryInstructions editPickupPerson tip cancel help enableTip{...orderActionFragment}enableEdit{...orderActionFragment}viewCancellationDetails{...cancellationDetailsActionFragment}enableInHome{...orderActionFragment}createGiftReceipt}cutOffTimestamp isEditSubstitutionsEligible isInHome giftDetails{...GiftDetailsFragment}donationDetails{...orderDonationDetails}}fragment returnInfoFragment on ReturnInfo{returnOrderId type refundPriceDetails{__typename...refundPriceDetailsFragment}refundMessage tierRefundMessage paymentMethods{__typename description cardType paymentType displayValues message{...textFragment}}actions{__typename generate scheduleOrModifyPickup{text url}reschedulePickup editPickupContact}shippingLabelUrl qrCodeImageUrl carriers{__typename id name}pickupCarrier pickupContact{nameAndAddress{fullName firstName lastName address{addressString city state postalCode addressLineOne addressLineTwo country}}phone}pickupConfirmationNumber bannerMessage{...textFragment}}fragment refundPriceDetailsFragment on RefundPriceDetails{subTotal{__typename...orderPriceDetailRowFragment}fees{__typename...orderPriceDetailRowFragment}discounts{__typename...orderPriceDetailRowFragment}taxTotal{__typename...orderPriceDetailRowFragment}grandTotal{__typename...orderPriceDetailRowFragment}}fragment orderPriceDetailRowFragment on OrderPriceDetailRow{label displayValue value info{__typename title message}}fragment addressFragment on OrderAddress{addressString addressLineOne addressLineTwo state postalCode city}fragment ODPPickupInfo on OrderGroup{pickupInstructions pickupPerson{...person}alternatePickupPerson{...person}store{id name address{...addressFragment}}}fragment person on OrderPickupPerson{firstName lastName email}fragment ODPTippingInfo on OrderGroup{addTipMessage{...textFragment}driver{...DriverFragment}tipping{min{...price}max{...price}suggested{...price}preselected}subtotal{...price}}fragment orderActionFragment on Action{text url}fragment orderCustomer on OrderCustomer{id firstName lastName email isGuest isEmailRegistered}fragment OrderFieldsFragment on Order{__typename id version type customer{...orderCustomer}displayId idBarcodeImageUrl(barWidth:3 barHeight:100) isFuelPurchase title shortTitle timezone tippableGroup{...OrderGroupFragment}amendableGroup{id changeSlotIterationsLeft cutOffTimestamp fulfillmentType deliveryAddress{fullName firstName lastName address{addressString addressLineOne addressLineTwo state postalCode city country}}isAmendInProgress}substitutionsBanner{heading subheading longSubheading}groups_2101{__typename...OrderGroupFragment...ODPGroupFragment...ODPPickupInfo...ODPTippingInfo}multiboxBundles{...orderLineItem}itemCancelReasons{__typename...cancelReason}groupCancelReasons{__typename...cancelReason}priceDetails{__typename subTotal{__typename...priceDetailFragment}taxTotal{__typename...priceDetailFragment}grandTotal{__typename...priceDetailFragment}authorizationAmount{__typename...priceDetailFragment}fees{__typename...priceDetailFragment}discounts{__typename...priceDetailFragment}minimumThreshold{__typename...price}belowMinimumFee{__typename...priceDetailFragment}driverTip{__typename...priceDetailFragment}donations{__typename...priceDetailFragment}}paymentMethods{__typename description cardType paymentType displayValues message{...textFragment}actions{connectToCapitalOne{...orderActionFragment}visitAffirm{...orderActionFragment}}}actions{__typename return pendingReturn cancel startReturn{...orderActionFragment}reorder}banners{...textFragment}}","variables":{"orderId":"3382220255830","emailAddress":"Sarah7hone@gmail.com"}}' \
  --compressed`
 
  if [[ $curl51 =~ "blocked" ]]; then
    link51=`echo $curl51 | jq '.redirectUrl' | sed 's/"//g'`
    `open -n -a /Applications/Microsoft\ Edge.app --args --profile-directory=Default https://walmart.com$link51`
    read -n 1 -p "blocked"
  else
    break
  fi
done

if [[ $curl51 =~ "error" ]]; then
    echo "51-Sai info"
    echo "'3382220255830" >> track-OrderID.txt
    echo "Sarah7hone@gmail.com" >> track-email.txt
    echo "Sai info" >> track-usItemId.txt
    echo "Sai info" >> track-priceValue.txt
    echo "Sai info" >> track-fullName.txt
    echo "Sai info" >> track-address.txt
    echo "Sai info" >> track-status.txt
    echo "Sai info" >> track-number.txt
    echo "Sai info" >> track-url.txt
    echo "Sai info" >> track-categoriesType.txt
else
    sum51=`md5 track-OrderID.txt`
    for (( i=0; i<=4; i++ ))
    do
        for (( j=0; j<=4; j++))
        do
            if [[ `echo $curl51 | jq '.data.guestOrder.groups_2101['${i[@]}'].items['${j[@]}'].productInfo.usItemId'` == '"223404599"' ]]; then
                echo "'3382220255830" >> track-OrderID.txt
                echo Sarah7hone@gmail.com >> track-email.txt
                echo $curl51 | jq '.data.guestOrder.groups_2101['${i[@]}'].items['${j[@]}'].productInfo.usItemId' >> track-usItemId.txt
                echo $curl51 | jq '.data.guestOrder.groups_2101['${i[@]}'].items['${j[@]}'].priceInfo.linePrice.value' >> track-priceValue.txt
                echo $curl51 | jq '.data.guestOrder.groups_2101['${i[@]}'].deliveryAddress.fullName' >> track-fullName.txt
                echo $curl51 | jq '.data.guestOrder.groups_2101['${i[@]}'].deliveryAddress.address.addressString' >> track-address.txt
                echo $curl51 | jq '.data.guestOrder.groups_2101['${i[@]}'].status.message.parts[].text' >> track-status.txt
                echo $curl51 | jq '.data.guestOrder.groups_2101['${i[@]}'].shipment.trackingNumber' | sed 's/null//g' >> track-number.txt
                echo $curl51 | jq '.data.guestOrder.groups_2101['${i[@]}'].shipment.trackingUrl' | sed 's/null//g' >> track-url.txt
                echo $curl51 | jq '.data.guestOrder.groups_2101['${i[@]}'].categories[].type' >> track-categoriesType.txt

                break
            fi
        done
    done
    if [[ $sum51 == `md5 track-OrderID.txt` ]]; then
        echo "51-Khác Item"
        echo "'3382220255830" >> track-OrderID.txt
        echo "Sarah7hone@gmail.com" >> track-email.txt
        echo "Khác Item" >> track-usItemId.txt
        echo "Khác Item" >> track-priceValue.txt
        echo "Khác Item" >> track-fullName.txt
        echo "Khác Item" >> track-address.txt
        echo "Khác Item" >> track-status.txt
        echo "Khác Item" >> track-number.txt
        echo "Khác Item" >> track-url.txt
        echo "Khác Item" >> track-categoriesType.txt
    else
        echo "51"
    fi   
fi
while true
do
curl52=`curl -s 'https://www.walmart.com/orchestra/home/graphql' \
  -H 'authority: www.walmart.com' \
  -H 'sec-ch-ua: " Not;A Brand";v="99", "Microsoft Edge";v="97", "Chromium";v="97"' \
  -H 'x-o-platform: rweb' \
  -H 'dnt: 1' \
  -H 'x-o-correlation-id: pn9BnlEx0zDiyvRGJ6nL5BS9pDN7erB017Nf' \
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
  -H 'user-agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.51 Safari/537.36 Edg/99.0.1150.36' \
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
  --data-raw $'{"query":"query getGuestOrder($orderId:ID\u0021 $emailAddress:String\u0021){guestOrder(input:{id:$orderId emailAddress:$emailAddress}){...OrderFieldsFragment}}fragment cancelReason on OrderCancelReason{__typename subReasonCode subDescription}fragment priceDetailFragment on OrderPriceDetailRow{label value displayValue info{title message}rowInfo{...orderPriceDetailRowInfo}}fragment orderPriceDetailRowInfo on OrderPriceDetailRowInfo{title message{...textFragment}}fragment price on Price{displayValue value}fragment variants on MapEntry{name value}fragment OrderAddOn on OrderAddOn{lineId uniqueLineId productInfo{name usItemId offerId}quantityString quantityLabel type fulfillmentInstructions{...textFragment}actions{manageProtectionPlan{...orderActionFragment}cancel}priceInfo{linePrice{...price}}quantity isActive}fragment orderDonationDetails on OrderDonationDetails{message{...textFragment}emailReceipt emailReceiptToken status{...textFragment}errorStatus}fragment orderLineItem on OrderLineItem{id uniqueId actions{contactSeller cancel addToCart configureCake reviewItem resendEGiftCardToken protectionPlan{...orderActionFragment}manageProtectionPlan{...orderActionFragment}}isGift digitalDeliveryMessage quantity quantityString quantityLabel isSubstitutionSelected fulfilledItems{id quantityString priceInfo{itemPrice{value}}productInfo{usItemId name}}isReturnable returnEligibilityMessage productInfo{name usItemId imageInfo{thumbnailUrl}canonicalUrl offerId orderLimit orderMinLimit weightIncrement salesUnit salesUnitType isSubstitutionEligible isAlcohol}reshop{reshopMessage isShippingAvailable minPromiseDate maxPromiseDate}selectedVariants{...variants}variantAdditionalInfo{parts{text nativeAction}}priceInfo{priceDisplayCodes{showItemPrice priceDisplayCondition finalCostByWeight}itemPrice{...price}linePrice{...price}unitPrice{...price}preDiscountedLinePrice{...price}additionalLines{name value}}discounts{label labelText{...textFragment}}itemReviewed activationCodes{label code}protectionPlanMessage{...textFragment}showSeller isShippedByWalmart seller{id name isPro}digitalDeliveryPhoneNumber addOns{...OrderAddOn}multiboxBundleId}fragment DriverFragment on Driver{id firstName photoUrl}fragment OrderGroupFragment on OrderGroup{driver{...DriverFragment}deliveryDate fulfillmentType status{...OrderGroupStatusFragment}showSeller isShippedByWalmart seller{...SellerFragment}id itemCount items{...LiteLineItemFragment}pickupPerson{firstName lastName email}accessPointId shipment{...ShipmentFragment}returnEligibilityMessage actions{...OrderGroupActionsFragment}recipientEmailAddress digitalDelivery{...DigitalDeliveryFragment}tireInstallationReservation{status extraText reservationId}}fragment OrderGroupStatusFragment on OrderGroupStatus{statusType showStatusTracker statusTracker{status label isCurrent}message{...textFragment}subtext subMessage{...textFragment}notice helpCenterText{...textFragment}}fragment textFragment on Text{parts{bold url text nativeAction lineBreak}}fragment LiteLineItemFragment on OrderLineItem{id quantity productInfo{name usItemId imageInfo{thumbnailUrl}offerId isAlcohol}priceInfo{linePrice{...price}}}fragment SellerFragment on GroupSeller{id name isPro}fragment DigitalDeliveryFragment on DigitalDelivery{title name instructions{...textFragment}}fragment ShipmentFragment on Shipment{id trackingNumber isExternalTracking trackingUrl proofOfDelivery{...ProofOfDeliveryFragment}}fragment OrderGroupActionsFragment on OrderGroupActions{reorder edit track changeSlot checkin editDeliveryInstructions editPickupPerson editTip tip rateDriver cancel enableTip{...orderActionFragment}enableEdit{...orderActionFragment}rescheduleTireInstall{...orderActionFragment}cancelTireInstall{...orderActionFragment}help viewCancellationDetails{...cancellationDetailsActionFragment}}fragment cancellationDetailsActionFragment on CancellationDetailsAction{label heading text{...textFragment}}fragment ProofOfDeliveryFragment on ProofOfDelivery{photoUrl photoPreviewUrl showPreview}fragment DeliveryInstructionsFragment on DeliveryInstructions{text type typeText}fragment GiftDetailsFragment on GiftDetails{recipientAddress{fullName}recipientEmail senderName giftMessage}fragment SubstitutionAction on SubstitutionAction{message label type}fragment ODPGroupCategoryFragment on OrderCategory{type name subtext returnMessage substitutionsBanner{...textFragment}showExtendedSubstitutions actions{substitutions{...SubstitutionAction}nilPickReshop{message action{text url}}returnDetails viewCancellationDetails{...cancellationDetailsActionFragment}trackOnInHomeApp}banner{...textFragment}accordionState items{...orderLineItem}substitutions{...orderLineItem fulfilledItems{...orderLineItem}}returnInfo{...returnInfoFragment}}fragment ODPGroupFragment on OrderGroup{id fulfillmentType deliveryMessage deliveryAddress{fullName firstName lastName address{...addressFragment}}deliveryInstructions{...DeliveryInstructionsFragment}deliveryPreferences{text{...textFragment}cta{...orderActionFragment}}editSubstitutionsCutOff status{statusType showStatusTracker message{...textFragment}notice helpCenterText{...textFragment}}itemCount isCategorized categories{...ODPGroupCategoryFragment}seller{id name isPro}shipment{id trackingNumber}actions{reorder edit track changeSlot checkin editDeliveryInstructions editPickupPerson tip cancel help enableTip{...orderActionFragment}enableEdit{...orderActionFragment}viewCancellationDetails{...cancellationDetailsActionFragment}enableInHome{...orderActionFragment}createGiftReceipt}cutOffTimestamp isEditSubstitutionsEligible isInHome giftDetails{...GiftDetailsFragment}donationDetails{...orderDonationDetails}}fragment returnInfoFragment on ReturnInfo{returnOrderId type refundPriceDetails{__typename...refundPriceDetailsFragment}refundMessage tierRefundMessage paymentMethods{__typename description cardType paymentType displayValues message{...textFragment}}actions{__typename generate scheduleOrModifyPickup{text url}reschedulePickup editPickupContact}shippingLabelUrl qrCodeImageUrl carriers{__typename id name}pickupCarrier pickupContact{nameAndAddress{fullName firstName lastName address{addressString city state postalCode addressLineOne addressLineTwo country}}phone}pickupConfirmationNumber bannerMessage{...textFragment}}fragment refundPriceDetailsFragment on RefundPriceDetails{subTotal{__typename...orderPriceDetailRowFragment}fees{__typename...orderPriceDetailRowFragment}discounts{__typename...orderPriceDetailRowFragment}taxTotal{__typename...orderPriceDetailRowFragment}grandTotal{__typename...orderPriceDetailRowFragment}}fragment orderPriceDetailRowFragment on OrderPriceDetailRow{label displayValue value info{__typename title message}}fragment addressFragment on OrderAddress{addressString addressLineOne addressLineTwo state postalCode city}fragment ODPPickupInfo on OrderGroup{pickupInstructions pickupPerson{...person}alternatePickupPerson{...person}store{id name address{...addressFragment}}}fragment person on OrderPickupPerson{firstName lastName email}fragment ODPTippingInfo on OrderGroup{addTipMessage{...textFragment}driver{...DriverFragment}tipping{min{...price}max{...price}suggested{...price}preselected}subtotal{...price}}fragment orderActionFragment on Action{text url}fragment orderCustomer on OrderCustomer{id firstName lastName email isGuest isEmailRegistered}fragment OrderFieldsFragment on Order{__typename id version type customer{...orderCustomer}displayId idBarcodeImageUrl(barWidth:3 barHeight:100) isFuelPurchase title shortTitle timezone tippableGroup{...OrderGroupFragment}amendableGroup{id changeSlotIterationsLeft cutOffTimestamp fulfillmentType deliveryAddress{fullName firstName lastName address{addressString addressLineOne addressLineTwo state postalCode city country}}isAmendInProgress}substitutionsBanner{heading subheading longSubheading}groups_2101{__typename...OrderGroupFragment...ODPGroupFragment...ODPPickupInfo...ODPTippingInfo}multiboxBundles{...orderLineItem}itemCancelReasons{__typename...cancelReason}groupCancelReasons{__typename...cancelReason}priceDetails{__typename subTotal{__typename...priceDetailFragment}taxTotal{__typename...priceDetailFragment}grandTotal{__typename...priceDetailFragment}authorizationAmount{__typename...priceDetailFragment}fees{__typename...priceDetailFragment}discounts{__typename...priceDetailFragment}minimumThreshold{__typename...price}belowMinimumFee{__typename...priceDetailFragment}driverTip{__typename...priceDetailFragment}donations{__typename...priceDetailFragment}}paymentMethods{__typename description cardType paymentType displayValues message{...textFragment}actions{connectToCapitalOne{...orderActionFragment}visitAffirm{...orderActionFragment}}}actions{__typename return pendingReturn cancel startReturn{...orderActionFragment}reorder}banners{...textFragment}}","variables":{"orderId":"3392221765734","emailAddress":"mnapolitani@yahoo.com"}}' \
  --compressed`
 
  if [[ $curl52 =~ "blocked" ]]; then
    link52=`echo $curl52 | jq '.redirectUrl' | sed 's/"//g'`
    `open -n -a /Applications/Microsoft\ Edge.app --args --profile-directory=Default https://walmart.com$link52`
    read -n 1 -p "blocked"
  else
    break
  fi
done

if [[ $curl52 =~ "error" ]]; then
    echo "52-Sai info"
    echo "'3392221765734" >> track-OrderID.txt
    echo "mnapolitani@yahoo.com" >> track-email.txt
    echo "Sai info" >> track-usItemId.txt
    echo "Sai info" >> track-priceValue.txt
    echo "Sai info" >> track-fullName.txt
    echo "Sai info" >> track-address.txt
    echo "Sai info" >> track-status.txt
    echo "Sai info" >> track-number.txt
    echo "Sai info" >> track-url.txt
    echo "Sai info" >> track-categoriesType.txt
else
    sum52=`md5 track-OrderID.txt`
    for (( i=0; i<=4; i++ ))
    do
        for (( j=0; j<=4; j++))
        do
            if [[ `echo $curl52 | jq '.data.guestOrder.groups_2101['${i[@]}'].items['${j[@]}'].productInfo.usItemId'` == '"706890153"' ]]; then
                echo "'3392221765734" >> track-OrderID.txt
                echo mnapolitani@yahoo.com >> track-email.txt
                echo $curl52 | jq '.data.guestOrder.groups_2101['${i[@]}'].items['${j[@]}'].productInfo.usItemId' >> track-usItemId.txt
                echo $curl52 | jq '.data.guestOrder.groups_2101['${i[@]}'].items['${j[@]}'].priceInfo.linePrice.value' >> track-priceValue.txt
                echo $curl52 | jq '.data.guestOrder.groups_2101['${i[@]}'].deliveryAddress.fullName' >> track-fullName.txt
                echo $curl52 | jq '.data.guestOrder.groups_2101['${i[@]}'].deliveryAddress.address.addressString' >> track-address.txt
                echo $curl52 | jq '.data.guestOrder.groups_2101['${i[@]}'].status.message.parts[].text' >> track-status.txt
                echo $curl52 | jq '.data.guestOrder.groups_2101['${i[@]}'].shipment.trackingNumber' | sed 's/null//g' >> track-number.txt
                echo $curl52 | jq '.data.guestOrder.groups_2101['${i[@]}'].shipment.trackingUrl' | sed 's/null//g' >> track-url.txt
                echo $curl52 | jq '.data.guestOrder.groups_2101['${i[@]}'].categories[].type' >> track-categoriesType.txt

                break
            fi
        done
    done
    if [[ $sum52 == `md5 track-OrderID.txt` ]]; then
        echo "52-Khác Item"
        echo "'3392221765734" >> track-OrderID.txt
        echo "mnapolitani@yahoo.com" >> track-email.txt
        echo "Khác Item" >> track-usItemId.txt
        echo "Khác Item" >> track-priceValue.txt
        echo "Khác Item" >> track-fullName.txt
        echo "Khác Item" >> track-address.txt
        echo "Khác Item" >> track-status.txt
        echo "Khác Item" >> track-number.txt
        echo "Khác Item" >> track-url.txt
        echo "Khác Item" >> track-categoriesType.txt
    else
        echo "52"
    fi   
fi
while true
do
curl53=`curl -s 'https://www.walmart.com/orchestra/home/graphql' \
  -H 'authority: www.walmart.com' \
  -H 'sec-ch-ua: " Not;A Brand";v="99", "Microsoft Edge";v="97", "Chromium";v="97"' \
  -H 'x-o-platform: rweb' \
  -H 'dnt: 1' \
  -H 'x-o-correlation-id: pn9BnlEx0zDiyvRGJ6nL5BS9pDN7erB017Nf' \
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
  -H 'user-agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.51 Safari/537.36 Edg/99.0.1150.36' \
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
  --data-raw $'{"query":"query getGuestOrder($orderId:ID\u0021 $emailAddress:String\u0021){guestOrder(input:{id:$orderId emailAddress:$emailAddress}){...OrderFieldsFragment}}fragment cancelReason on OrderCancelReason{__typename subReasonCode subDescription}fragment priceDetailFragment on OrderPriceDetailRow{label value displayValue info{title message}rowInfo{...orderPriceDetailRowInfo}}fragment orderPriceDetailRowInfo on OrderPriceDetailRowInfo{title message{...textFragment}}fragment price on Price{displayValue value}fragment variants on MapEntry{name value}fragment OrderAddOn on OrderAddOn{lineId uniqueLineId productInfo{name usItemId offerId}quantityString quantityLabel type fulfillmentInstructions{...textFragment}actions{manageProtectionPlan{...orderActionFragment}cancel}priceInfo{linePrice{...price}}quantity isActive}fragment orderDonationDetails on OrderDonationDetails{message{...textFragment}emailReceipt emailReceiptToken status{...textFragment}errorStatus}fragment orderLineItem on OrderLineItem{id uniqueId actions{contactSeller cancel addToCart configureCake reviewItem resendEGiftCardToken protectionPlan{...orderActionFragment}manageProtectionPlan{...orderActionFragment}}isGift digitalDeliveryMessage quantity quantityString quantityLabel isSubstitutionSelected fulfilledItems{id quantityString priceInfo{itemPrice{value}}productInfo{usItemId name}}isReturnable returnEligibilityMessage productInfo{name usItemId imageInfo{thumbnailUrl}canonicalUrl offerId orderLimit orderMinLimit weightIncrement salesUnit salesUnitType isSubstitutionEligible isAlcohol}reshop{reshopMessage isShippingAvailable minPromiseDate maxPromiseDate}selectedVariants{...variants}variantAdditionalInfo{parts{text nativeAction}}priceInfo{priceDisplayCodes{showItemPrice priceDisplayCondition finalCostByWeight}itemPrice{...price}linePrice{...price}unitPrice{...price}preDiscountedLinePrice{...price}additionalLines{name value}}discounts{label labelText{...textFragment}}itemReviewed activationCodes{label code}protectionPlanMessage{...textFragment}showSeller isShippedByWalmart seller{id name isPro}digitalDeliveryPhoneNumber addOns{...OrderAddOn}multiboxBundleId}fragment DriverFragment on Driver{id firstName photoUrl}fragment OrderGroupFragment on OrderGroup{driver{...DriverFragment}deliveryDate fulfillmentType status{...OrderGroupStatusFragment}showSeller isShippedByWalmart seller{...SellerFragment}id itemCount items{...LiteLineItemFragment}pickupPerson{firstName lastName email}accessPointId shipment{...ShipmentFragment}returnEligibilityMessage actions{...OrderGroupActionsFragment}recipientEmailAddress digitalDelivery{...DigitalDeliveryFragment}tireInstallationReservation{status extraText reservationId}}fragment OrderGroupStatusFragment on OrderGroupStatus{statusType showStatusTracker statusTracker{status label isCurrent}message{...textFragment}subtext subMessage{...textFragment}notice helpCenterText{...textFragment}}fragment textFragment on Text{parts{bold url text nativeAction lineBreak}}fragment LiteLineItemFragment on OrderLineItem{id quantity productInfo{name usItemId imageInfo{thumbnailUrl}offerId isAlcohol}priceInfo{linePrice{...price}}}fragment SellerFragment on GroupSeller{id name isPro}fragment DigitalDeliveryFragment on DigitalDelivery{title name instructions{...textFragment}}fragment ShipmentFragment on Shipment{id trackingNumber isExternalTracking trackingUrl proofOfDelivery{...ProofOfDeliveryFragment}}fragment OrderGroupActionsFragment on OrderGroupActions{reorder edit track changeSlot checkin editDeliveryInstructions editPickupPerson editTip tip rateDriver cancel enableTip{...orderActionFragment}enableEdit{...orderActionFragment}rescheduleTireInstall{...orderActionFragment}cancelTireInstall{...orderActionFragment}help viewCancellationDetails{...cancellationDetailsActionFragment}}fragment cancellationDetailsActionFragment on CancellationDetailsAction{label heading text{...textFragment}}fragment ProofOfDeliveryFragment on ProofOfDelivery{photoUrl photoPreviewUrl showPreview}fragment DeliveryInstructionsFragment on DeliveryInstructions{text type typeText}fragment GiftDetailsFragment on GiftDetails{recipientAddress{fullName}recipientEmail senderName giftMessage}fragment SubstitutionAction on SubstitutionAction{message label type}fragment ODPGroupCategoryFragment on OrderCategory{type name subtext returnMessage substitutionsBanner{...textFragment}showExtendedSubstitutions actions{substitutions{...SubstitutionAction}nilPickReshop{message action{text url}}returnDetails viewCancellationDetails{...cancellationDetailsActionFragment}trackOnInHomeApp}banner{...textFragment}accordionState items{...orderLineItem}substitutions{...orderLineItem fulfilledItems{...orderLineItem}}returnInfo{...returnInfoFragment}}fragment ODPGroupFragment on OrderGroup{id fulfillmentType deliveryMessage deliveryAddress{fullName firstName lastName address{...addressFragment}}deliveryInstructions{...DeliveryInstructionsFragment}deliveryPreferences{text{...textFragment}cta{...orderActionFragment}}editSubstitutionsCutOff status{statusType showStatusTracker message{...textFragment}notice helpCenterText{...textFragment}}itemCount isCategorized categories{...ODPGroupCategoryFragment}seller{id name isPro}shipment{id trackingNumber}actions{reorder edit track changeSlot checkin editDeliveryInstructions editPickupPerson tip cancel help enableTip{...orderActionFragment}enableEdit{...orderActionFragment}viewCancellationDetails{...cancellationDetailsActionFragment}enableInHome{...orderActionFragment}createGiftReceipt}cutOffTimestamp isEditSubstitutionsEligible isInHome giftDetails{...GiftDetailsFragment}donationDetails{...orderDonationDetails}}fragment returnInfoFragment on ReturnInfo{returnOrderId type refundPriceDetails{__typename...refundPriceDetailsFragment}refundMessage tierRefundMessage paymentMethods{__typename description cardType paymentType displayValues message{...textFragment}}actions{__typename generate scheduleOrModifyPickup{text url}reschedulePickup editPickupContact}shippingLabelUrl qrCodeImageUrl carriers{__typename id name}pickupCarrier pickupContact{nameAndAddress{fullName firstName lastName address{addressString city state postalCode addressLineOne addressLineTwo country}}phone}pickupConfirmationNumber bannerMessage{...textFragment}}fragment refundPriceDetailsFragment on RefundPriceDetails{subTotal{__typename...orderPriceDetailRowFragment}fees{__typename...orderPriceDetailRowFragment}discounts{__typename...orderPriceDetailRowFragment}taxTotal{__typename...orderPriceDetailRowFragment}grandTotal{__typename...orderPriceDetailRowFragment}}fragment orderPriceDetailRowFragment on OrderPriceDetailRow{label displayValue value info{__typename title message}}fragment addressFragment on OrderAddress{addressString addressLineOne addressLineTwo state postalCode city}fragment ODPPickupInfo on OrderGroup{pickupInstructions pickupPerson{...person}alternatePickupPerson{...person}store{id name address{...addressFragment}}}fragment person on OrderPickupPerson{firstName lastName email}fragment ODPTippingInfo on OrderGroup{addTipMessage{...textFragment}driver{...DriverFragment}tipping{min{...price}max{...price}suggested{...price}preselected}subtotal{...price}}fragment orderActionFragment on Action{text url}fragment orderCustomer on OrderCustomer{id firstName lastName email isGuest isEmailRegistered}fragment OrderFieldsFragment on Order{__typename id version type customer{...orderCustomer}displayId idBarcodeImageUrl(barWidth:3 barHeight:100) isFuelPurchase title shortTitle timezone tippableGroup{...OrderGroupFragment}amendableGroup{id changeSlotIterationsLeft cutOffTimestamp fulfillmentType deliveryAddress{fullName firstName lastName address{addressString addressLineOne addressLineTwo state postalCode city country}}isAmendInProgress}substitutionsBanner{heading subheading longSubheading}groups_2101{__typename...OrderGroupFragment...ODPGroupFragment...ODPPickupInfo...ODPTippingInfo}multiboxBundles{...orderLineItem}itemCancelReasons{__typename...cancelReason}groupCancelReasons{__typename...cancelReason}priceDetails{__typename subTotal{__typename...priceDetailFragment}taxTotal{__typename...priceDetailFragment}grandTotal{__typename...priceDetailFragment}authorizationAmount{__typename...priceDetailFragment}fees{__typename...priceDetailFragment}discounts{__typename...priceDetailFragment}minimumThreshold{__typename...price}belowMinimumFee{__typename...priceDetailFragment}driverTip{__typename...priceDetailFragment}donations{__typename...priceDetailFragment}}paymentMethods{__typename description cardType paymentType displayValues message{...textFragment}actions{connectToCapitalOne{...orderActionFragment}visitAffirm{...orderActionFragment}}}actions{__typename return pendingReturn cancel startReturn{...orderActionFragment}reorder}banners{...textFragment}}","variables":{"orderId":"3402223129589","emailAddress":"Mikefrederickltd@msn.com"}}' \
  --compressed`
 
  if [[ $curl53 =~ "blocked" ]]; then
    link53=`echo $curl53 | jq '.redirectUrl' | sed 's/"//g'`
    `open -n -a /Applications/Microsoft\ Edge.app --args --profile-directory=Default https://walmart.com$link53`
    read -n 1 -p "blocked"
  else
    break
  fi
done

if [[ $curl53 =~ "error" ]]; then
    echo "53-Sai info"
    echo "'3402223129589" >> track-OrderID.txt
    echo "Mikefrederickltd@msn.com" >> track-email.txt
    echo "Sai info" >> track-usItemId.txt
    echo "Sai info" >> track-priceValue.txt
    echo "Sai info" >> track-fullName.txt
    echo "Sai info" >> track-address.txt
    echo "Sai info" >> track-status.txt
    echo "Sai info" >> track-number.txt
    echo "Sai info" >> track-url.txt
    echo "Sai info" >> track-categoriesType.txt
else
    sum53=`md5 track-OrderID.txt`
    for (( i=0; i<=4; i++ ))
    do
        for (( j=0; j<=4; j++))
        do
            if [[ `echo $curl53 | jq '.data.guestOrder.groups_2101['${i[@]}'].items['${j[@]}'].productInfo.usItemId'` == '"599495878"' ]]; then
                echo "'3402223129589" >> track-OrderID.txt
                echo Mikefrederickltd@msn.com >> track-email.txt
                echo $curl53 | jq '.data.guestOrder.groups_2101['${i[@]}'].items['${j[@]}'].productInfo.usItemId' >> track-usItemId.txt
                echo $curl53 | jq '.data.guestOrder.groups_2101['${i[@]}'].items['${j[@]}'].priceInfo.linePrice.value' >> track-priceValue.txt
                echo $curl53 | jq '.data.guestOrder.groups_2101['${i[@]}'].deliveryAddress.fullName' >> track-fullName.txt
                echo $curl53 | jq '.data.guestOrder.groups_2101['${i[@]}'].deliveryAddress.address.addressString' >> track-address.txt
                echo $curl53 | jq '.data.guestOrder.groups_2101['${i[@]}'].status.message.parts[].text' >> track-status.txt
                echo $curl53 | jq '.data.guestOrder.groups_2101['${i[@]}'].shipment.trackingNumber' | sed 's/null//g' >> track-number.txt
                echo $curl53 | jq '.data.guestOrder.groups_2101['${i[@]}'].shipment.trackingUrl' | sed 's/null//g' >> track-url.txt
                echo $curl53 | jq '.data.guestOrder.groups_2101['${i[@]}'].categories[].type' >> track-categoriesType.txt

                break
            fi
        done
    done
    if [[ $sum53 == `md5 track-OrderID.txt` ]]; then
        echo "53-Khác Item"
        echo "'3402223129589" >> track-OrderID.txt
        echo "Mikefrederickltd@msn.com" >> track-email.txt
        echo "Khác Item" >> track-usItemId.txt
        echo "Khác Item" >> track-priceValue.txt
        echo "Khác Item" >> track-fullName.txt
        echo "Khác Item" >> track-address.txt
        echo "Khác Item" >> track-status.txt
        echo "Khác Item" >> track-number.txt
        echo "Khác Item" >> track-url.txt
        echo "Khác Item" >> track-categoriesType.txt
    else
        echo "53"
    fi   
fi
while true
do
curl54=`curl -s 'https://www.walmart.com/orchestra/home/graphql' \
  -H 'authority: www.walmart.com' \
  -H 'sec-ch-ua: " Not;A Brand";v="99", "Microsoft Edge";v="97", "Chromium";v="97"' \
  -H 'x-o-platform: rweb' \
  -H 'dnt: 1' \
  -H 'x-o-correlation-id: pn9BnlEx0zDiyvRGJ6nL5BS9pDN7erB017Nf' \
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
  -H 'user-agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.51 Safari/537.36 Edg/99.0.1150.36' \
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
  --data-raw $'{"query":"query getGuestOrder($orderId:ID\u0021 $emailAddress:String\u0021){guestOrder(input:{id:$orderId emailAddress:$emailAddress}){...OrderFieldsFragment}}fragment cancelReason on OrderCancelReason{__typename subReasonCode subDescription}fragment priceDetailFragment on OrderPriceDetailRow{label value displayValue info{title message}rowInfo{...orderPriceDetailRowInfo}}fragment orderPriceDetailRowInfo on OrderPriceDetailRowInfo{title message{...textFragment}}fragment price on Price{displayValue value}fragment variants on MapEntry{name value}fragment OrderAddOn on OrderAddOn{lineId uniqueLineId productInfo{name usItemId offerId}quantityString quantityLabel type fulfillmentInstructions{...textFragment}actions{manageProtectionPlan{...orderActionFragment}cancel}priceInfo{linePrice{...price}}quantity isActive}fragment orderDonationDetails on OrderDonationDetails{message{...textFragment}emailReceipt emailReceiptToken status{...textFragment}errorStatus}fragment orderLineItem on OrderLineItem{id uniqueId actions{contactSeller cancel addToCart configureCake reviewItem resendEGiftCardToken protectionPlan{...orderActionFragment}manageProtectionPlan{...orderActionFragment}}isGift digitalDeliveryMessage quantity quantityString quantityLabel isSubstitutionSelected fulfilledItems{id quantityString priceInfo{itemPrice{value}}productInfo{usItemId name}}isReturnable returnEligibilityMessage productInfo{name usItemId imageInfo{thumbnailUrl}canonicalUrl offerId orderLimit orderMinLimit weightIncrement salesUnit salesUnitType isSubstitutionEligible isAlcohol}reshop{reshopMessage isShippingAvailable minPromiseDate maxPromiseDate}selectedVariants{...variants}variantAdditionalInfo{parts{text nativeAction}}priceInfo{priceDisplayCodes{showItemPrice priceDisplayCondition finalCostByWeight}itemPrice{...price}linePrice{...price}unitPrice{...price}preDiscountedLinePrice{...price}additionalLines{name value}}discounts{label labelText{...textFragment}}itemReviewed activationCodes{label code}protectionPlanMessage{...textFragment}showSeller isShippedByWalmart seller{id name isPro}digitalDeliveryPhoneNumber addOns{...OrderAddOn}multiboxBundleId}fragment DriverFragment on Driver{id firstName photoUrl}fragment OrderGroupFragment on OrderGroup{driver{...DriverFragment}deliveryDate fulfillmentType status{...OrderGroupStatusFragment}showSeller isShippedByWalmart seller{...SellerFragment}id itemCount items{...LiteLineItemFragment}pickupPerson{firstName lastName email}accessPointId shipment{...ShipmentFragment}returnEligibilityMessage actions{...OrderGroupActionsFragment}recipientEmailAddress digitalDelivery{...DigitalDeliveryFragment}tireInstallationReservation{status extraText reservationId}}fragment OrderGroupStatusFragment on OrderGroupStatus{statusType showStatusTracker statusTracker{status label isCurrent}message{...textFragment}subtext subMessage{...textFragment}notice helpCenterText{...textFragment}}fragment textFragment on Text{parts{bold url text nativeAction lineBreak}}fragment LiteLineItemFragment on OrderLineItem{id quantity productInfo{name usItemId imageInfo{thumbnailUrl}offerId isAlcohol}priceInfo{linePrice{...price}}}fragment SellerFragment on GroupSeller{id name isPro}fragment DigitalDeliveryFragment on DigitalDelivery{title name instructions{...textFragment}}fragment ShipmentFragment on Shipment{id trackingNumber isExternalTracking trackingUrl proofOfDelivery{...ProofOfDeliveryFragment}}fragment OrderGroupActionsFragment on OrderGroupActions{reorder edit track changeSlot checkin editDeliveryInstructions editPickupPerson editTip tip rateDriver cancel enableTip{...orderActionFragment}enableEdit{...orderActionFragment}rescheduleTireInstall{...orderActionFragment}cancelTireInstall{...orderActionFragment}help viewCancellationDetails{...cancellationDetailsActionFragment}}fragment cancellationDetailsActionFragment on CancellationDetailsAction{label heading text{...textFragment}}fragment ProofOfDeliveryFragment on ProofOfDelivery{photoUrl photoPreviewUrl showPreview}fragment DeliveryInstructionsFragment on DeliveryInstructions{text type typeText}fragment GiftDetailsFragment on GiftDetails{recipientAddress{fullName}recipientEmail senderName giftMessage}fragment SubstitutionAction on SubstitutionAction{message label type}fragment ODPGroupCategoryFragment on OrderCategory{type name subtext returnMessage substitutionsBanner{...textFragment}showExtendedSubstitutions actions{substitutions{...SubstitutionAction}nilPickReshop{message action{text url}}returnDetails viewCancellationDetails{...cancellationDetailsActionFragment}trackOnInHomeApp}banner{...textFragment}accordionState items{...orderLineItem}substitutions{...orderLineItem fulfilledItems{...orderLineItem}}returnInfo{...returnInfoFragment}}fragment ODPGroupFragment on OrderGroup{id fulfillmentType deliveryMessage deliveryAddress{fullName firstName lastName address{...addressFragment}}deliveryInstructions{...DeliveryInstructionsFragment}deliveryPreferences{text{...textFragment}cta{...orderActionFragment}}editSubstitutionsCutOff status{statusType showStatusTracker message{...textFragment}notice helpCenterText{...textFragment}}itemCount isCategorized categories{...ODPGroupCategoryFragment}seller{id name isPro}shipment{id trackingNumber}actions{reorder edit track changeSlot checkin editDeliveryInstructions editPickupPerson tip cancel help enableTip{...orderActionFragment}enableEdit{...orderActionFragment}viewCancellationDetails{...cancellationDetailsActionFragment}enableInHome{...orderActionFragment}createGiftReceipt}cutOffTimestamp isEditSubstitutionsEligible isInHome giftDetails{...GiftDetailsFragment}donationDetails{...orderDonationDetails}}fragment returnInfoFragment on ReturnInfo{returnOrderId type refundPriceDetails{__typename...refundPriceDetailsFragment}refundMessage tierRefundMessage paymentMethods{__typename description cardType paymentType displayValues message{...textFragment}}actions{__typename generate scheduleOrModifyPickup{text url}reschedulePickup editPickupContact}shippingLabelUrl qrCodeImageUrl carriers{__typename id name}pickupCarrier pickupContact{nameAndAddress{fullName firstName lastName address{addressString city state postalCode addressLineOne addressLineTwo country}}phone}pickupConfirmationNumber bannerMessage{...textFragment}}fragment refundPriceDetailsFragment on RefundPriceDetails{subTotal{__typename...orderPriceDetailRowFragment}fees{__typename...orderPriceDetailRowFragment}discounts{__typename...orderPriceDetailRowFragment}taxTotal{__typename...orderPriceDetailRowFragment}grandTotal{__typename...orderPriceDetailRowFragment}}fragment orderPriceDetailRowFragment on OrderPriceDetailRow{label displayValue value info{__typename title message}}fragment addressFragment on OrderAddress{addressString addressLineOne addressLineTwo state postalCode city}fragment ODPPickupInfo on OrderGroup{pickupInstructions pickupPerson{...person}alternatePickupPerson{...person}store{id name address{...addressFragment}}}fragment person on OrderPickupPerson{firstName lastName email}fragment ODPTippingInfo on OrderGroup{addTipMessage{...textFragment}driver{...DriverFragment}tipping{min{...price}max{...price}suggested{...price}preselected}subtotal{...price}}fragment orderActionFragment on Action{text url}fragment orderCustomer on OrderCustomer{id firstName lastName email isGuest isEmailRegistered}fragment OrderFieldsFragment on Order{__typename id version type customer{...orderCustomer}displayId idBarcodeImageUrl(barWidth:3 barHeight:100) isFuelPurchase title shortTitle timezone tippableGroup{...OrderGroupFragment}amendableGroup{id changeSlotIterationsLeft cutOffTimestamp fulfillmentType deliveryAddress{fullName firstName lastName address{addressString addressLineOne addressLineTwo state postalCode city country}}isAmendInProgress}substitutionsBanner{heading subheading longSubheading}groups_2101{__typename...OrderGroupFragment...ODPGroupFragment...ODPPickupInfo...ODPTippingInfo}multiboxBundles{...orderLineItem}itemCancelReasons{__typename...cancelReason}groupCancelReasons{__typename...cancelReason}priceDetails{__typename subTotal{__typename...priceDetailFragment}taxTotal{__typename...priceDetailFragment}grandTotal{__typename...priceDetailFragment}authorizationAmount{__typename...priceDetailFragment}fees{__typename...priceDetailFragment}discounts{__typename...priceDetailFragment}minimumThreshold{__typename...price}belowMinimumFee{__typename...priceDetailFragment}driverTip{__typename...priceDetailFragment}donations{__typename...priceDetailFragment}}paymentMethods{__typename description cardType paymentType displayValues message{...textFragment}actions{connectToCapitalOne{...orderActionFragment}visitAffirm{...orderActionFragment}}}actions{__typename return pendingReturn cancel startReturn{...orderActionFragment}reorder}banners{...textFragment}}","variables":{"orderId":"3392222361030","emailAddress":"Maria.hutch@Verizon.net"}}' \
  --compressed`
 
  if [[ $curl54 =~ "blocked" ]]; then
    link54=`echo $curl54 | jq '.redirectUrl' | sed 's/"//g'`
    `open -n -a /Applications/Microsoft\ Edge.app --args --profile-directory=Default https://walmart.com$link54`
    read -n 1 -p "blocked"
  else
    break
  fi
done

if [[ $curl54 =~ "error" ]]; then
    echo "54-Sai info"
    echo "'3392222361030" >> track-OrderID.txt
    echo "Maria.hutch@Verizon.net" >> track-email.txt
    echo "Sai info" >> track-usItemId.txt
    echo "Sai info" >> track-priceValue.txt
    echo "Sai info" >> track-fullName.txt
    echo "Sai info" >> track-address.txt
    echo "Sai info" >> track-status.txt
    echo "Sai info" >> track-number.txt
    echo "Sai info" >> track-url.txt
    echo "Sai info" >> track-categoriesType.txt
else
    sum54=`md5 track-OrderID.txt`
    for (( i=0; i<=4; i++ ))
    do
        for (( j=0; j<=4; j++))
        do
            if [[ `echo $curl54 | jq '.data.guestOrder.groups_2101['${i[@]}'].items['${j[@]}'].productInfo.usItemId'` == '"950352380"' ]]; then
                echo "'3392222361030" >> track-OrderID.txt
                echo Maria.hutch@Verizon.net >> track-email.txt
                echo $curl54 | jq '.data.guestOrder.groups_2101['${i[@]}'].items['${j[@]}'].productInfo.usItemId' >> track-usItemId.txt
                echo $curl54 | jq '.data.guestOrder.groups_2101['${i[@]}'].items['${j[@]}'].priceInfo.linePrice.value' >> track-priceValue.txt
                echo $curl54 | jq '.data.guestOrder.groups_2101['${i[@]}'].deliveryAddress.fullName' >> track-fullName.txt
                echo $curl54 | jq '.data.guestOrder.groups_2101['${i[@]}'].deliveryAddress.address.addressString' >> track-address.txt
                echo $curl54 | jq '.data.guestOrder.groups_2101['${i[@]}'].status.message.parts[].text' >> track-status.txt
                echo $curl54 | jq '.data.guestOrder.groups_2101['${i[@]}'].shipment.trackingNumber' | sed 's/null//g' >> track-number.txt
                echo $curl54 | jq '.data.guestOrder.groups_2101['${i[@]}'].shipment.trackingUrl' | sed 's/null//g' >> track-url.txt
                echo $curl54 | jq '.data.guestOrder.groups_2101['${i[@]}'].categories[].type' >> track-categoriesType.txt

                break
            fi
        done
    done
    if [[ $sum54 == `md5 track-OrderID.txt` ]]; then
        echo "54-Khác Item"
        echo "'3392222361030" >> track-OrderID.txt
        echo "Maria.hutch@Verizon.net" >> track-email.txt
        echo "Khác Item" >> track-usItemId.txt
        echo "Khác Item" >> track-priceValue.txt
        echo "Khác Item" >> track-fullName.txt
        echo "Khác Item" >> track-address.txt
        echo "Khác Item" >> track-status.txt
        echo "Khác Item" >> track-number.txt
        echo "Khác Item" >> track-url.txt
        echo "Khác Item" >> track-categoriesType.txt
    else
        echo "54"
    fi   
fi
while true
do
curl55=`curl -s 'https://www.walmart.com/orchestra/home/graphql' \
  -H 'authority: www.walmart.com' \
  -H 'sec-ch-ua: " Not;A Brand";v="99", "Microsoft Edge";v="97", "Chromium";v="97"' \
  -H 'x-o-platform: rweb' \
  -H 'dnt: 1' \
  -H 'x-o-correlation-id: pn9BnlEx0zDiyvRGJ6nL5BS9pDN7erB017Nf' \
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
  -H 'user-agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.51 Safari/537.36 Edg/99.0.1150.36' \
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
  --data-raw $'{"query":"query getGuestOrder($orderId:ID\u0021 $emailAddress:String\u0021){guestOrder(input:{id:$orderId emailAddress:$emailAddress}){...OrderFieldsFragment}}fragment cancelReason on OrderCancelReason{__typename subReasonCode subDescription}fragment priceDetailFragment on OrderPriceDetailRow{label value displayValue info{title message}rowInfo{...orderPriceDetailRowInfo}}fragment orderPriceDetailRowInfo on OrderPriceDetailRowInfo{title message{...textFragment}}fragment price on Price{displayValue value}fragment variants on MapEntry{name value}fragment OrderAddOn on OrderAddOn{lineId uniqueLineId productInfo{name usItemId offerId}quantityString quantityLabel type fulfillmentInstructions{...textFragment}actions{manageProtectionPlan{...orderActionFragment}cancel}priceInfo{linePrice{...price}}quantity isActive}fragment orderDonationDetails on OrderDonationDetails{message{...textFragment}emailReceipt emailReceiptToken status{...textFragment}errorStatus}fragment orderLineItem on OrderLineItem{id uniqueId actions{contactSeller cancel addToCart configureCake reviewItem resendEGiftCardToken protectionPlan{...orderActionFragment}manageProtectionPlan{...orderActionFragment}}isGift digitalDeliveryMessage quantity quantityString quantityLabel isSubstitutionSelected fulfilledItems{id quantityString priceInfo{itemPrice{value}}productInfo{usItemId name}}isReturnable returnEligibilityMessage productInfo{name usItemId imageInfo{thumbnailUrl}canonicalUrl offerId orderLimit orderMinLimit weightIncrement salesUnit salesUnitType isSubstitutionEligible isAlcohol}reshop{reshopMessage isShippingAvailable minPromiseDate maxPromiseDate}selectedVariants{...variants}variantAdditionalInfo{parts{text nativeAction}}priceInfo{priceDisplayCodes{showItemPrice priceDisplayCondition finalCostByWeight}itemPrice{...price}linePrice{...price}unitPrice{...price}preDiscountedLinePrice{...price}additionalLines{name value}}discounts{label labelText{...textFragment}}itemReviewed activationCodes{label code}protectionPlanMessage{...textFragment}showSeller isShippedByWalmart seller{id name isPro}digitalDeliveryPhoneNumber addOns{...OrderAddOn}multiboxBundleId}fragment DriverFragment on Driver{id firstName photoUrl}fragment OrderGroupFragment on OrderGroup{driver{...DriverFragment}deliveryDate fulfillmentType status{...OrderGroupStatusFragment}showSeller isShippedByWalmart seller{...SellerFragment}id itemCount items{...LiteLineItemFragment}pickupPerson{firstName lastName email}accessPointId shipment{...ShipmentFragment}returnEligibilityMessage actions{...OrderGroupActionsFragment}recipientEmailAddress digitalDelivery{...DigitalDeliveryFragment}tireInstallationReservation{status extraText reservationId}}fragment OrderGroupStatusFragment on OrderGroupStatus{statusType showStatusTracker statusTracker{status label isCurrent}message{...textFragment}subtext subMessage{...textFragment}notice helpCenterText{...textFragment}}fragment textFragment on Text{parts{bold url text nativeAction lineBreak}}fragment LiteLineItemFragment on OrderLineItem{id quantity productInfo{name usItemId imageInfo{thumbnailUrl}offerId isAlcohol}priceInfo{linePrice{...price}}}fragment SellerFragment on GroupSeller{id name isPro}fragment DigitalDeliveryFragment on DigitalDelivery{title name instructions{...textFragment}}fragment ShipmentFragment on Shipment{id trackingNumber isExternalTracking trackingUrl proofOfDelivery{...ProofOfDeliveryFragment}}fragment OrderGroupActionsFragment on OrderGroupActions{reorder edit track changeSlot checkin editDeliveryInstructions editPickupPerson editTip tip rateDriver cancel enableTip{...orderActionFragment}enableEdit{...orderActionFragment}rescheduleTireInstall{...orderActionFragment}cancelTireInstall{...orderActionFragment}help viewCancellationDetails{...cancellationDetailsActionFragment}}fragment cancellationDetailsActionFragment on CancellationDetailsAction{label heading text{...textFragment}}fragment ProofOfDeliveryFragment on ProofOfDelivery{photoUrl photoPreviewUrl showPreview}fragment DeliveryInstructionsFragment on DeliveryInstructions{text type typeText}fragment GiftDetailsFragment on GiftDetails{recipientAddress{fullName}recipientEmail senderName giftMessage}fragment SubstitutionAction on SubstitutionAction{message label type}fragment ODPGroupCategoryFragment on OrderCategory{type name subtext returnMessage substitutionsBanner{...textFragment}showExtendedSubstitutions actions{substitutions{...SubstitutionAction}nilPickReshop{message action{text url}}returnDetails viewCancellationDetails{...cancellationDetailsActionFragment}trackOnInHomeApp}banner{...textFragment}accordionState items{...orderLineItem}substitutions{...orderLineItem fulfilledItems{...orderLineItem}}returnInfo{...returnInfoFragment}}fragment ODPGroupFragment on OrderGroup{id fulfillmentType deliveryMessage deliveryAddress{fullName firstName lastName address{...addressFragment}}deliveryInstructions{...DeliveryInstructionsFragment}deliveryPreferences{text{...textFragment}cta{...orderActionFragment}}editSubstitutionsCutOff status{statusType showStatusTracker message{...textFragment}notice helpCenterText{...textFragment}}itemCount isCategorized categories{...ODPGroupCategoryFragment}seller{id name isPro}shipment{id trackingNumber}actions{reorder edit track changeSlot checkin editDeliveryInstructions editPickupPerson tip cancel help enableTip{...orderActionFragment}enableEdit{...orderActionFragment}viewCancellationDetails{...cancellationDetailsActionFragment}enableInHome{...orderActionFragment}createGiftReceipt}cutOffTimestamp isEditSubstitutionsEligible isInHome giftDetails{...GiftDetailsFragment}donationDetails{...orderDonationDetails}}fragment returnInfoFragment on ReturnInfo{returnOrderId type refundPriceDetails{__typename...refundPriceDetailsFragment}refundMessage tierRefundMessage paymentMethods{__typename description cardType paymentType displayValues message{...textFragment}}actions{__typename generate scheduleOrModifyPickup{text url}reschedulePickup editPickupContact}shippingLabelUrl qrCodeImageUrl carriers{__typename id name}pickupCarrier pickupContact{nameAndAddress{fullName firstName lastName address{addressString city state postalCode addressLineOne addressLineTwo country}}phone}pickupConfirmationNumber bannerMessage{...textFragment}}fragment refundPriceDetailsFragment on RefundPriceDetails{subTotal{__typename...orderPriceDetailRowFragment}fees{__typename...orderPriceDetailRowFragment}discounts{__typename...orderPriceDetailRowFragment}taxTotal{__typename...orderPriceDetailRowFragment}grandTotal{__typename...orderPriceDetailRowFragment}}fragment orderPriceDetailRowFragment on OrderPriceDetailRow{label displayValue value info{__typename title message}}fragment addressFragment on OrderAddress{addressString addressLineOne addressLineTwo state postalCode city}fragment ODPPickupInfo on OrderGroup{pickupInstructions pickupPerson{...person}alternatePickupPerson{...person}store{id name address{...addressFragment}}}fragment person on OrderPickupPerson{firstName lastName email}fragment ODPTippingInfo on OrderGroup{addTipMessage{...textFragment}driver{...DriverFragment}tipping{min{...price}max{...price}suggested{...price}preselected}subtotal{...price}}fragment orderActionFragment on Action{text url}fragment orderCustomer on OrderCustomer{id firstName lastName email isGuest isEmailRegistered}fragment OrderFieldsFragment on Order{__typename id version type customer{...orderCustomer}displayId idBarcodeImageUrl(barWidth:3 barHeight:100) isFuelPurchase title shortTitle timezone tippableGroup{...OrderGroupFragment}amendableGroup{id changeSlotIterationsLeft cutOffTimestamp fulfillmentType deliveryAddress{fullName firstName lastName address{addressString addressLineOne addressLineTwo state postalCode city country}}isAmendInProgress}substitutionsBanner{heading subheading longSubheading}groups_2101{__typename...OrderGroupFragment...ODPGroupFragment...ODPPickupInfo...ODPTippingInfo}multiboxBundles{...orderLineItem}itemCancelReasons{__typename...cancelReason}groupCancelReasons{__typename...cancelReason}priceDetails{__typename subTotal{__typename...priceDetailFragment}taxTotal{__typename...priceDetailFragment}grandTotal{__typename...priceDetailFragment}authorizationAmount{__typename...priceDetailFragment}fees{__typename...priceDetailFragment}discounts{__typename...priceDetailFragment}minimumThreshold{__typename...price}belowMinimumFee{__typename...priceDetailFragment}driverTip{__typename...priceDetailFragment}donations{__typename...priceDetailFragment}}paymentMethods{__typename description cardType paymentType displayValues message{...textFragment}actions{connectToCapitalOne{...orderActionFragment}visitAffirm{...orderActionFragment}}}actions{__typename return pendingReturn cancel startReturn{...orderActionFragment}reorder}banners{...textFragment}}","variables":{"orderId":"3402223021346","emailAddress":"Katiehendrie12@gmail.com"}}' \
  --compressed`
 
  if [[ $curl55 =~ "blocked" ]]; then
    link55=`echo $curl55 | jq '.redirectUrl' | sed 's/"//g'`
    `open -n -a /Applications/Microsoft\ Edge.app --args --profile-directory=Default https://walmart.com$link55`
    read -n 1 -p "blocked"
  else
    break
  fi
done

if [[ $curl55 =~ "error" ]]; then
    echo "55-Sai info"
    echo "'3402223021346" >> track-OrderID.txt
    echo "Katiehendrie12@gmail.com" >> track-email.txt
    echo "Sai info" >> track-usItemId.txt
    echo "Sai info" >> track-priceValue.txt
    echo "Sai info" >> track-fullName.txt
    echo "Sai info" >> track-address.txt
    echo "Sai info" >> track-status.txt
    echo "Sai info" >> track-number.txt
    echo "Sai info" >> track-url.txt
    echo "Sai info" >> track-categoriesType.txt
else
    sum55=`md5 track-OrderID.txt`
    for (( i=0; i<=4; i++ ))
    do
        for (( j=0; j<=4; j++))
        do
            if [[ `echo $curl55 | jq '.data.guestOrder.groups_2101['${i[@]}'].items['${j[@]}'].productInfo.usItemId'` == '"251382558"' ]]; then
                echo "'3402223021346" >> track-OrderID.txt
                echo Katiehendrie12@gmail.com >> track-email.txt
                echo $curl55 | jq '.data.guestOrder.groups_2101['${i[@]}'].items['${j[@]}'].productInfo.usItemId' >> track-usItemId.txt
                echo $curl55 | jq '.data.guestOrder.groups_2101['${i[@]}'].items['${j[@]}'].priceInfo.linePrice.value' >> track-priceValue.txt
                echo $curl55 | jq '.data.guestOrder.groups_2101['${i[@]}'].deliveryAddress.fullName' >> track-fullName.txt
                echo $curl55 | jq '.data.guestOrder.groups_2101['${i[@]}'].deliveryAddress.address.addressString' >> track-address.txt
                echo $curl55 | jq '.data.guestOrder.groups_2101['${i[@]}'].status.message.parts[].text' >> track-status.txt
                echo $curl55 | jq '.data.guestOrder.groups_2101['${i[@]}'].shipment.trackingNumber' | sed 's/null//g' >> track-number.txt
                echo $curl55 | jq '.data.guestOrder.groups_2101['${i[@]}'].shipment.trackingUrl' | sed 's/null//g' >> track-url.txt
                echo $curl55 | jq '.data.guestOrder.groups_2101['${i[@]}'].categories[].type' >> track-categoriesType.txt

                break
            fi
        done
    done
    if [[ $sum55 == `md5 track-OrderID.txt` ]]; then
        echo "55-Khác Item"
        echo "'3402223021346" >> track-OrderID.txt
        echo "Katiehendrie12@gmail.com" >> track-email.txt
        echo "Khác Item" >> track-usItemId.txt
        echo "Khác Item" >> track-priceValue.txt
        echo "Khác Item" >> track-fullName.txt
        echo "Khác Item" >> track-address.txt
        echo "Khác Item" >> track-status.txt
        echo "Khác Item" >> track-number.txt
        echo "Khác Item" >> track-url.txt
        echo "Khác Item" >> track-categoriesType.txt
    else
        echo "55"
    fi   
fi
git add -A .
git commit -m --allow-empty
git push
git push origin HEAD -f
gitCommit=`git rev-parse HEAD`
linkGit=`echo https://raw.githubusercontent.com/DungSherlock/eBay/`$gitCommit`echo /`
linkApi=`echo https://script.google.com/macros/s/AKfycbxTUZPtaHbpL6Sdf4PXWLmCg1PcRotJWSyJQ-cKMC9AxPb-du0q4h3mmFAICVNeGp8GNQ/exec?`
linkPost=$linkApi`echo Item ID==IMPORTDATA\(\"`$linkGit`echo track-usItemId.txt\"\)\&Giá==IMPORTDATA\(\"`$linkGit`echo track-priceValue.txt\"\)\&Tên==IMPORTDATA\(\"`$linkGit`echo track-fullName.txt\"\)\&Địa chỉ==index\(IMPORTDATA\(\"`$linkGit`echo track-address.txt\"\),,1\)\&Status==IMPORTDATA\(\"`$linkGit`echo track-status.txt\"\)\&Tracking Number==IMPORTDATA\(\"`$linkGit`echo track-number.txt\"\)\&Tracking URL==IMPORTDATA\(\"`$linkGit`echo track-url.txt\"\)\&Email==IMPORTDATA\(\"`$linkGit`echo track-email.txt\"\)\&Order==IMPORTDATA\(\"`$linkGit`echo track-OrderID.txt\"\)\&categoriesType==IMPORTDATA\(\"`$linkGit`echo track-categoriesType.txt\"\)`
echo $linkPost
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
  -H 'user-agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/98.0.4758.102 Safari/537.36 Edg/98.0.1108.62' \
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
  -H 'user-agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/98.0.4758.102 Safari/537.36 Edg/98.0.1108.62' \
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
  -H 'user-agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/98.0.4758.102 Safari/537.36 Edg/98.0.1108.62' \
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
  -H 'user-agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/98.0.4758.102 Safari/537.36 Edg/98.0.1108.62' \
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
  --data-raw $'{"query":"query getGuestOrder($orderId:ID\u0021 $emailAddress:String\u0021){guestOrder(input:{id:$orderId emailAddress:$emailAddress}){...OrderFieldsFragment}}fragment cancelReason on OrderCancelReason{__typename subReasonCode subDescription}fragment priceDetailFragment on OrderPriceDetailRow{label value displayValue info{title message}rowInfo{...orderPriceDetailRowInfo}}fragment orderPriceDetailRowInfo on OrderPriceDetailRowInfo{title message{...textFragment}}fragment price on Price{displayValue value}fragment variants on MapEntry{name value}fragment OrderAddOn on OrderAddOn{lineId uniqueLineId productInfo{name usItemId offerId}quantityString quantityLabel type fulfillmentInstructions{...textFragment}actions{manageProtectionPlan{...orderActionFragment}cancel}priceInfo{linePrice{...price}}quantity isActive}fragment orderDonationDetails on OrderDonationDetails{message{...textFragment}emailReceipt emailReceiptToken status{...textFragment}errorStatus}fragment orderLineItem on OrderLineItem{id uniqueId actions{contactSeller cancel addToCart configureCake reviewItem resendEGiftCardToken protectionPlan{...orderActionFragment}manageProtectionPlan{...orderActionFragment}}isGift digitalDeliveryMessage quantity quantityString quantityLabel isSubstitutionSelected fulfilledItems{id quantityString priceInfo{itemPrice{value}}productInfo{usItemId name}}isReturnable returnEligibilityMessage productInfo{name usItemId imageInfo{thumbnailUrl}canonicalUrl offerId orderLimit orderMinLimit weightIncrement salesUnit salesUnitType isSubstitutionEligible isAlcohol}reshop{reshopMessage isShippingAvailable minPromiseDate maxPromiseDate}selectedVariants{...variants}variantAdditionalInfo{parts{text nativeAction}}priceInfo{priceDisplayCodes{showItemPrice priceDisplayCondition finalCostByWeight}itemPrice{...price}linePrice{...price}unitPrice{...price}preDiscountedLinePrice{...price}additionalLines{name value}}discounts{label labelText{...textFragment}}itemReviewed activationCodes{label code}protectionPlanMessage{...textFragment}showSeller isShippedByWalmart seller{id name isPro}digitalDeliveryPhoneNumber addOns{...OrderAddOn}multiboxBundleId}fragment DriverFragment on Driver{id firstName photoUrl}fragment OrderGroupFragment on OrderGroup{driver{...DriverFragment}deliveryDate fulfillmentType status{...OrderGroupStatusFragment}showSeller isShippedByWalmart seller{...SellerFragment}id itemCount items{...LiteLineItemFragment}pickupPerson{firstName lastName email}accessPointId shipment{...ShipmentFragment}returnEligibilityMessage actions{...OrderGroupActionsFragment}recipientEmailAddress digitalDelivery{...DigitalDeliveryFragment}tireInstallationReservation{status extraText reservationId}}fragment OrderGroupStatusFragment on OrderGroupStatus{statusType showStatusTracker statusTracker{status label isCurrent}message{...textFragment}subtext subMessage{...textFragment}notice helpCenterText{...textFragment}}fragment textFragment on Text{parts{bold url text nativeAction lineBreak}}fragment LiteLineItemFragment on OrderLineItem{id quantity productInfo{name usItemId imageInfo{thumbnailUrl}offerId isAlcohol}priceInfo{linePrice{...price}}}fragment SellerFragment on GroupSeller{id name isPro}fragment DigitalDeliveryFragment on DigitalDelivery{title name instructions{...textFragment}}fragment ShipmentFragment on Shipment{id trackingNumber isExternalTracking trackingUrl proofOfDelivery{...ProofOfDeliveryFragment}}fragment OrderGroupActionsFragment on OrderGroupActions{reorder edit track changeSlot checkin editDeliveryInstructions editPickupPerson editTip tip rateDriver cancel enableTip{...orderActionFragment}enableEdit{...orderActionFragment}rescheduleTireInstall{...orderActionFragment}cancelTireInstall{...orderActionFragment}help viewCancellationDetails{...cancellationDetailsActionFragment}}fragment cancellationDetailsActionFragment on CancellationDetailsAction{label heading text{...textFragment}}fragment ProofOfDeliveryFragment on ProofOfDelivery{photoUrl photoPreviewUrl showPreview}fragment DeliveryInstructionsFragment on DeliveryInstructions{text type typeText}fragment GiftDetailsFragment on GiftDetails{recipientAddress{fullName}recipientEmail senderName giftMessage}fragment SubstitutionAction on SubstitutionAction{message label type}fragment ODPGroupCategoryFragment on OrderCategory{type name subtext returnMessage substitutionsBanner{...textFragment}showExtendedSubstitutions actions{substitutions{...SubstitutionAction}nilPickReshop{message action{text url}}returnDetails viewCancellationDetails{...cancellationDetailsActionFragment}trackOnInHomeApp}banner{...textFragment}accordionState items{...orderLineItem}substitutions{...orderLineItem fulfilledItems{...orderLineItem}}returnInfo{...returnInfoFragment}}fragment ODPGroupFragment on OrderGroup{id fulfillmentType deliveryMessage deliveryAddress{fullName firstName lastName address{...addressFragment}}deliveryInstructions{...DeliveryInstructionsFragment}deliveryPreferences{text{...textFragment}cta{...orderActionFragment}}editSubstitutionsCutOff status{statusType showStatusTracker message{...textFragment}notice helpCenterText{...textFragment}}itemCount isCategorized categories{...ODPGroupCategoryFragment}seller{id name isPro}shipment{id trackingNumber}actions{reorder edit track changeSlot checkin editDeliveryInstructions editPickupPerson tip cancel help enableTip{...orderActionFragment}enableEdit{...orderActionFragment}viewCancellationDetails{...cancellationDetailsActionFragment}enableInHome{...orderActionFragment}createGiftReceipt}cutOffTimestamp isEditSubstitutionsEligible isInHome giftDetails{...GiftDetailsFragment}donationDetails{...orderDonationDetails}}fragment returnInfoFragment on ReturnInfo{returnOrderId type refundPriceDetails{__typename...refundPriceDetailsFragment}refundMessage tierRefundMessage paymentMethods{__typename description cardType paymentType displayValues message{...textFragment}}actions{__typename generate scheduleOrModifyPickup{text url}reschedulePickup editPickupContact}shippingLabelUrl qrCodeImageUrl carriers{__typename id name}pickupCarrier pickupContact{nameAndAddress{fullName firstName lastName address{addressString city state postalCode addressLineOne addressLineTwo country}}phone}pickupConfirmationNumber bannerMessage{...textFragment}}fragment refundPriceDetailsFragment on RefundPriceDetails{subTotal{__typename...orderPriceDetailRowFragment}fees{__typename...orderPriceDetailRowFragment}discounts{__typename...orderPriceDetailRowFragment}taxTotal{__typename...orderPriceDetailRowFragment}grandTotal{__typename...orderPriceDetailRowFragment}}fragment orderPriceDetailRowFragment on OrderPriceDetailRow{label displayValue value info{__typename title message}}fragment addressFragment on OrderAddress{addressString addressLineOne addressLineTwo state postalCode city}fragment ODPPickupInfo on OrderGroup{pickupInstructions pickupPerson{...person}alternatePickupPerson{...person}store{id name address{...addressFragment}}}fragment person on OrderPickupPerson{firstName lastName email}fragment ODPTippingInfo on OrderGroup{addTipMessage{...textFragment}driver{...DriverFragment}tipping{min{...price}max{...price}suggested{...price}preselected}subtotal{...price}}fragment orderActionFragment on Action{text url}fragment orderCustomer on OrderCustomer{id firstName lastName email isGuest isEmailRegistered}fragment OrderFieldsFragment on Order{__typename id version type customer{...orderCustomer}displayId idBarcodeImageUrl(barWidth:3 barHeight:100) isFuelPurchase title shortTitle timezone tippableGroup{...OrderGroupFragment}amendableGroup{id changeSlotIterationsLeft cutOffTimestamp fulfillmentType deliveryAddress{fullName firstName lastName address{addressString addressLineOne addressLineTwo state postalCode city country}}isAmendInProgress}substitutionsBanner{heading subheading longSubheading}groups_2101{__typename...OrderGroupFragment...ODPGroupFragment...ODPPickupInfo...ODPTippingInfo}multiboxBundles{...orderLineItem}itemCancelReasons{__typename...cancelReason}groupCancelReasons{__typename...cancelReason}priceDetails{__typename subTotal{__typename...priceDetailFragment}taxTotal{__typename...priceDetailFragment}grandTotal{__typename...priceDetailFragment}authorizationAmount{__typename...priceDetailFragment}fees{__typename...priceDetailFragment}discounts{__typename...priceDetailFragment}minimumThreshold{__typename...price}belowMinimumFee{__typename...priceDetailFragment}driverTip{__typename...priceDetailFragment}donations{__typename...priceDetailFragment}}paymentMethods{__typename description cardType paymentType displayValues message{...textFragment}actions{connectToCapitalOne{...orderActionFragment}visitAffirm{...orderActionFragment}}}actions{__typename return pendingReturn cancel startReturn{...orderActionFragment}reorder}banners{...textFragment}}","variables":{"orderId":"3352214096852","emailAddress":"Hungkdl0@gmail.com"}}' \
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
    echo "'3352214096852" >> track-OrderID.txt
    echo "Hungkdl0@gmail.com" >> track-email.txt
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
            if [[ `echo $curl4 | jq '.data.guestOrder.groups_2101['${i[@]}'].items['${j[@]}'].productInfo.usItemId'` == '"240828726"' ]]; then
                echo "'3352214096852" >> track-OrderID.txt
                echo Hungkdl0@gmail.com >> track-email.txt
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
        echo "'3352214096852" >> track-OrderID.txt
        echo "Hungkdl0@gmail.com" >> track-email.txt
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
  -H 'user-agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/98.0.4758.102 Safari/537.36 Edg/98.0.1108.62' \
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
    sum5=`md5 track-OrderID.txt`
    for (( i=0; i<=4; i++ ))
    do
        for (( j=0; j<=4; j++))
        do
            if [[ `echo $curl5 | jq '.data.guestOrder.groups_2101['${i[@]}'].items['${j[@]}'].productInfo.usItemId'` == '"958476019"' ]]; then
                echo "'3332211081452" >> track-OrderID.txt
                echo alexnanajan@yahoo.com >> track-email.txt
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
  -H 'user-agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/98.0.4758.102 Safari/537.36 Edg/98.0.1108.62' \
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
  --data-raw $'{"query":"query getGuestOrder($orderId:ID\u0021 $emailAddress:String\u0021){guestOrder(input:{id:$orderId emailAddress:$emailAddress}){...OrderFieldsFragment}}fragment cancelReason on OrderCancelReason{__typename subReasonCode subDescription}fragment priceDetailFragment on OrderPriceDetailRow{label value displayValue info{title message}rowInfo{...orderPriceDetailRowInfo}}fragment orderPriceDetailRowInfo on OrderPriceDetailRowInfo{title message{...textFragment}}fragment price on Price{displayValue value}fragment variants on MapEntry{name value}fragment OrderAddOn on OrderAddOn{lineId uniqueLineId productInfo{name usItemId offerId}quantityString quantityLabel type fulfillmentInstructions{...textFragment}actions{manageProtectionPlan{...orderActionFragment}cancel}priceInfo{linePrice{...price}}quantity isActive}fragment orderDonationDetails on OrderDonationDetails{message{...textFragment}emailReceipt emailReceiptToken status{...textFragment}errorStatus}fragment orderLineItem on OrderLineItem{id uniqueId actions{contactSeller cancel addToCart configureCake reviewItem resendEGiftCardToken protectionPlan{...orderActionFragment}manageProtectionPlan{...orderActionFragment}}isGift digitalDeliveryMessage quantity quantityString quantityLabel isSubstitutionSelected fulfilledItems{id quantityString priceInfo{itemPrice{value}}productInfo{usItemId name}}isReturnable returnEligibilityMessage productInfo{name usItemId imageInfo{thumbnailUrl}canonicalUrl offerId orderLimit orderMinLimit weightIncrement salesUnit salesUnitType isSubstitutionEligible isAlcohol}reshop{reshopMessage isShippingAvailable minPromiseDate maxPromiseDate}selectedVariants{...variants}variantAdditionalInfo{parts{text nativeAction}}priceInfo{priceDisplayCodes{showItemPrice priceDisplayCondition finalCostByWeight}itemPrice{...price}linePrice{...price}unitPrice{...price}preDiscountedLinePrice{...price}additionalLines{name value}}discounts{label labelText{...textFragment}}itemReviewed activationCodes{label code}protectionPlanMessage{...textFragment}showSeller isShippedByWalmart seller{id name isPro}digitalDeliveryPhoneNumber addOns{...OrderAddOn}multiboxBundleId}fragment DriverFragment on Driver{id firstName photoUrl}fragment OrderGroupFragment on OrderGroup{driver{...DriverFragment}deliveryDate fulfillmentType status{...OrderGroupStatusFragment}showSeller isShippedByWalmart seller{...SellerFragment}id itemCount items{...LiteLineItemFragment}pickupPerson{firstName lastName email}accessPointId shipment{...ShipmentFragment}returnEligibilityMessage actions{...OrderGroupActionsFragment}recipientEmailAddress digitalDelivery{...DigitalDeliveryFragment}tireInstallationReservation{status extraText reservationId}}fragment OrderGroupStatusFragment on OrderGroupStatus{statusType showStatusTracker statusTracker{status label isCurrent}message{...textFragment}subtext subMessage{...textFragment}notice helpCenterText{...textFragment}}fragment textFragment on Text{parts{bold url text nativeAction lineBreak}}fragment LiteLineItemFragment on OrderLineItem{id quantity productInfo{name usItemId imageInfo{thumbnailUrl}offerId isAlcohol}priceInfo{linePrice{...price}}}fragment SellerFragment on GroupSeller{id name isPro}fragment DigitalDeliveryFragment on DigitalDelivery{title name instructions{...textFragment}}fragment ShipmentFragment on Shipment{id trackingNumber isExternalTracking trackingUrl proofOfDelivery{...ProofOfDeliveryFragment}}fragment OrderGroupActionsFragment on OrderGroupActions{reorder edit track changeSlot checkin editDeliveryInstructions editPickupPerson editTip tip rateDriver cancel enableTip{...orderActionFragment}enableEdit{...orderActionFragment}rescheduleTireInstall{...orderActionFragment}cancelTireInstall{...orderActionFragment}help viewCancellationDetails{...cancellationDetailsActionFragment}}fragment cancellationDetailsActionFragment on CancellationDetailsAction{label heading text{...textFragment}}fragment ProofOfDeliveryFragment on ProofOfDelivery{photoUrl photoPreviewUrl showPreview}fragment DeliveryInstructionsFragment on DeliveryInstructions{text type typeText}fragment GiftDetailsFragment on GiftDetails{recipientAddress{fullName}recipientEmail senderName giftMessage}fragment SubstitutionAction on SubstitutionAction{message label type}fragment ODPGroupCategoryFragment on OrderCategory{type name subtext returnMessage substitutionsBanner{...textFragment}showExtendedSubstitutions actions{substitutions{...SubstitutionAction}nilPickReshop{message action{text url}}returnDetails viewCancellationDetails{...cancellationDetailsActionFragment}trackOnInHomeApp}banner{...textFragment}accordionState items{...orderLineItem}substitutions{...orderLineItem fulfilledItems{...orderLineItem}}returnInfo{...returnInfoFragment}}fragment ODPGroupFragment on OrderGroup{id fulfillmentType deliveryMessage deliveryAddress{fullName firstName lastName address{...addressFragment}}deliveryInstructions{...DeliveryInstructionsFragment}deliveryPreferences{text{...textFragment}cta{...orderActionFragment}}editSubstitutionsCutOff status{statusType showStatusTracker message{...textFragment}notice helpCenterText{...textFragment}}itemCount isCategorized categories{...ODPGroupCategoryFragment}seller{id name isPro}shipment{id trackingNumber}actions{reorder edit track changeSlot checkin editDeliveryInstructions editPickupPerson tip cancel help enableTip{...orderActionFragment}enableEdit{...orderActionFragment}viewCancellationDetails{...cancellationDetailsActionFragment}enableInHome{...orderActionFragment}createGiftReceipt}cutOffTimestamp isEditSubstitutionsEligible isInHome giftDetails{...GiftDetailsFragment}donationDetails{...orderDonationDetails}}fragment returnInfoFragment on ReturnInfo{returnOrderId type refundPriceDetails{__typename...refundPriceDetailsFragment}refundMessage tierRefundMessage paymentMethods{__typename description cardType paymentType displayValues message{...textFragment}}actions{__typename generate scheduleOrModifyPickup{text url}reschedulePickup editPickupContact}shippingLabelUrl qrCodeImageUrl carriers{__typename id name}pickupCarrier pickupContact{nameAndAddress{fullName firstName lastName address{addressString city state postalCode addressLineOne addressLineTwo country}}phone}pickupConfirmationNumber bannerMessage{...textFragment}}fragment refundPriceDetailsFragment on RefundPriceDetails{subTotal{__typename...orderPriceDetailRowFragment}fees{__typename...orderPriceDetailRowFragment}discounts{__typename...orderPriceDetailRowFragment}taxTotal{__typename...orderPriceDetailRowFragment}grandTotal{__typename...orderPriceDetailRowFragment}}fragment orderPriceDetailRowFragment on OrderPriceDetailRow{label displayValue value info{__typename title message}}fragment addressFragment on OrderAddress{addressString addressLineOne addressLineTwo state postalCode city}fragment ODPPickupInfo on OrderGroup{pickupInstructions pickupPerson{...person}alternatePickupPerson{...person}store{id name address{...addressFragment}}}fragment person on OrderPickupPerson{firstName lastName email}fragment ODPTippingInfo on OrderGroup{addTipMessage{...textFragment}driver{...DriverFragment}tipping{min{...price}max{...price}suggested{...price}preselected}subtotal{...price}}fragment orderActionFragment on Action{text url}fragment orderCustomer on OrderCustomer{id firstName lastName email isGuest isEmailRegistered}fragment OrderFieldsFragment on Order{__typename id version type customer{...orderCustomer}displayId idBarcodeImageUrl(barWidth:3 barHeight:100) isFuelPurchase title shortTitle timezone tippableGroup{...OrderGroupFragment}amendableGroup{id changeSlotIterationsLeft cutOffTimestamp fulfillmentType deliveryAddress{fullName firstName lastName address{addressString addressLineOne addressLineTwo state postalCode city country}}isAmendInProgress}substitutionsBanner{heading subheading longSubheading}groups_2101{__typename...OrderGroupFragment...ODPGroupFragment...ODPPickupInfo...ODPTippingInfo}multiboxBundles{...orderLineItem}itemCancelReasons{__typename...cancelReason}groupCancelReasons{__typename...cancelReason}priceDetails{__typename subTotal{__typename...priceDetailFragment}taxTotal{__typename...priceDetailFragment}grandTotal{__typename...priceDetailFragment}authorizationAmount{__typename...priceDetailFragment}fees{__typename...priceDetailFragment}discounts{__typename...priceDetailFragment}minimumThreshold{__typename...price}belowMinimumFee{__typename...priceDetailFragment}driverTip{__typename...priceDetailFragment}donations{__typename...priceDetailFragment}}paymentMethods{__typename description cardType paymentType displayValues message{...textFragment}actions{connectToCapitalOne{...orderActionFragment}visitAffirm{...orderActionFragment}}}actions{__typename return pendingReturn cancel startReturn{...orderActionFragment}reorder}banners{...textFragment}}","variables":{"orderId":"3372218744014","emailAddress":"trucvinh05.nguyen@gmail.com"}}' \
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
    echo "'3372218744014" >> track-OrderID.txt
    echo "trucvinh05.nguyen@gmail.com" >> track-email.txt
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
            if [[ `echo $curl6 | jq '.data.guestOrder.groups_2101['${i[@]}'].items['${j[@]}'].productInfo.usItemId'` == '"580231229"' ]]; then
                echo "'3372218744014" >> track-OrderID.txt
                echo trucvinh05.nguyen@gmail.com >> track-email.txt
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
        echo "'3372218744014" >> track-OrderID.txt
        echo "trucvinh05.nguyen@gmail.com" >> track-email.txt
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
  -H 'user-agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/98.0.4758.102 Safari/537.36 Edg/98.0.1108.62' \
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
    sum7=`md5 track-OrderID.txt`
    for (( i=0; i<=4; i++ ))
    do
        for (( j=0; j<=4; j++))
        do
            if [[ `echo $curl7 | jq '.data.guestOrder.groups_2101['${i[@]}'].items['${j[@]}'].productInfo.usItemId'` == '"520551642"' ]]; then
                echo "'3352214797141" >> track-OrderID.txt
                echo Leexjckjd1@gmail.com >> track-email.txt
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
  -H 'user-agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/98.0.4758.102 Safari/537.36 Edg/98.0.1108.62' \
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
  --data-raw $'{"query":"query getGuestOrder($orderId:ID\u0021 $emailAddress:String\u0021){guestOrder(input:{id:$orderId emailAddress:$emailAddress}){...OrderFieldsFragment}}fragment cancelReason on OrderCancelReason{__typename subReasonCode subDescription}fragment priceDetailFragment on OrderPriceDetailRow{label value displayValue info{title message}rowInfo{...orderPriceDetailRowInfo}}fragment orderPriceDetailRowInfo on OrderPriceDetailRowInfo{title message{...textFragment}}fragment price on Price{displayValue value}fragment variants on MapEntry{name value}fragment OrderAddOn on OrderAddOn{lineId uniqueLineId productInfo{name usItemId offerId}quantityString quantityLabel type fulfillmentInstructions{...textFragment}actions{manageProtectionPlan{...orderActionFragment}cancel}priceInfo{linePrice{...price}}quantity isActive}fragment orderDonationDetails on OrderDonationDetails{message{...textFragment}emailReceipt emailReceiptToken status{...textFragment}errorStatus}fragment orderLineItem on OrderLineItem{id uniqueId actions{contactSeller cancel addToCart configureCake reviewItem resendEGiftCardToken protectionPlan{...orderActionFragment}manageProtectionPlan{...orderActionFragment}}isGift digitalDeliveryMessage quantity quantityString quantityLabel isSubstitutionSelected fulfilledItems{id quantityString priceInfo{itemPrice{value}}productInfo{usItemId name}}isReturnable returnEligibilityMessage productInfo{name usItemId imageInfo{thumbnailUrl}canonicalUrl offerId orderLimit orderMinLimit weightIncrement salesUnit salesUnitType isSubstitutionEligible isAlcohol}reshop{reshopMessage isShippingAvailable minPromiseDate maxPromiseDate}selectedVariants{...variants}variantAdditionalInfo{parts{text nativeAction}}priceInfo{priceDisplayCodes{showItemPrice priceDisplayCondition finalCostByWeight}itemPrice{...price}linePrice{...price}unitPrice{...price}preDiscountedLinePrice{...price}additionalLines{name value}}discounts{label labelText{...textFragment}}itemReviewed activationCodes{label code}protectionPlanMessage{...textFragment}showSeller isShippedByWalmart seller{id name isPro}digitalDeliveryPhoneNumber addOns{...OrderAddOn}multiboxBundleId}fragment DriverFragment on Driver{id firstName photoUrl}fragment OrderGroupFragment on OrderGroup{driver{...DriverFragment}deliveryDate fulfillmentType status{...OrderGroupStatusFragment}showSeller isShippedByWalmart seller{...SellerFragment}id itemCount items{...LiteLineItemFragment}pickupPerson{firstName lastName email}accessPointId shipment{...ShipmentFragment}returnEligibilityMessage actions{...OrderGroupActionsFragment}recipientEmailAddress digitalDelivery{...DigitalDeliveryFragment}tireInstallationReservation{status extraText reservationId}}fragment OrderGroupStatusFragment on OrderGroupStatus{statusType showStatusTracker statusTracker{status label isCurrent}message{...textFragment}subtext subMessage{...textFragment}notice helpCenterText{...textFragment}}fragment textFragment on Text{parts{bold url text nativeAction lineBreak}}fragment LiteLineItemFragment on OrderLineItem{id quantity productInfo{name usItemId imageInfo{thumbnailUrl}offerId isAlcohol}priceInfo{linePrice{...price}}}fragment SellerFragment on GroupSeller{id name isPro}fragment DigitalDeliveryFragment on DigitalDelivery{title name instructions{...textFragment}}fragment ShipmentFragment on Shipment{id trackingNumber isExternalTracking trackingUrl proofOfDelivery{...ProofOfDeliveryFragment}}fragment OrderGroupActionsFragment on OrderGroupActions{reorder edit track changeSlot checkin editDeliveryInstructions editPickupPerson editTip tip rateDriver cancel enableTip{...orderActionFragment}enableEdit{...orderActionFragment}rescheduleTireInstall{...orderActionFragment}cancelTireInstall{...orderActionFragment}help viewCancellationDetails{...cancellationDetailsActionFragment}}fragment cancellationDetailsActionFragment on CancellationDetailsAction{label heading text{...textFragment}}fragment ProofOfDeliveryFragment on ProofOfDelivery{photoUrl photoPreviewUrl showPreview}fragment DeliveryInstructionsFragment on DeliveryInstructions{text type typeText}fragment GiftDetailsFragment on GiftDetails{recipientAddress{fullName}recipientEmail senderName giftMessage}fragment SubstitutionAction on SubstitutionAction{message label type}fragment ODPGroupCategoryFragment on OrderCategory{type name subtext returnMessage substitutionsBanner{...textFragment}showExtendedSubstitutions actions{substitutions{...SubstitutionAction}nilPickReshop{message action{text url}}returnDetails viewCancellationDetails{...cancellationDetailsActionFragment}trackOnInHomeApp}banner{...textFragment}accordionState items{...orderLineItem}substitutions{...orderLineItem fulfilledItems{...orderLineItem}}returnInfo{...returnInfoFragment}}fragment ODPGroupFragment on OrderGroup{id fulfillmentType deliveryMessage deliveryAddress{fullName firstName lastName address{...addressFragment}}deliveryInstructions{...DeliveryInstructionsFragment}deliveryPreferences{text{...textFragment}cta{...orderActionFragment}}editSubstitutionsCutOff status{statusType showStatusTracker message{...textFragment}notice helpCenterText{...textFragment}}itemCount isCategorized categories{...ODPGroupCategoryFragment}seller{id name isPro}shipment{id trackingNumber}actions{reorder edit track changeSlot checkin editDeliveryInstructions editPickupPerson tip cancel help enableTip{...orderActionFragment}enableEdit{...orderActionFragment}viewCancellationDetails{...cancellationDetailsActionFragment}enableInHome{...orderActionFragment}createGiftReceipt}cutOffTimestamp isEditSubstitutionsEligible isInHome giftDetails{...GiftDetailsFragment}donationDetails{...orderDonationDetails}}fragment returnInfoFragment on ReturnInfo{returnOrderId type refundPriceDetails{__typename...refundPriceDetailsFragment}refundMessage tierRefundMessage paymentMethods{__typename description cardType paymentType displayValues message{...textFragment}}actions{__typename generate scheduleOrModifyPickup{text url}reschedulePickup editPickupContact}shippingLabelUrl qrCodeImageUrl carriers{__typename id name}pickupCarrier pickupContact{nameAndAddress{fullName firstName lastName address{addressString city state postalCode addressLineOne addressLineTwo country}}phone}pickupConfirmationNumber bannerMessage{...textFragment}}fragment refundPriceDetailsFragment on RefundPriceDetails{subTotal{__typename...orderPriceDetailRowFragment}fees{__typename...orderPriceDetailRowFragment}discounts{__typename...orderPriceDetailRowFragment}taxTotal{__typename...orderPriceDetailRowFragment}grandTotal{__typename...orderPriceDetailRowFragment}}fragment orderPriceDetailRowFragment on OrderPriceDetailRow{label displayValue value info{__typename title message}}fragment addressFragment on OrderAddress{addressString addressLineOne addressLineTwo state postalCode city}fragment ODPPickupInfo on OrderGroup{pickupInstructions pickupPerson{...person}alternatePickupPerson{...person}store{id name address{...addressFragment}}}fragment person on OrderPickupPerson{firstName lastName email}fragment ODPTippingInfo on OrderGroup{addTipMessage{...textFragment}driver{...DriverFragment}tipping{min{...price}max{...price}suggested{...price}preselected}subtotal{...price}}fragment orderActionFragment on Action{text url}fragment orderCustomer on OrderCustomer{id firstName lastName email isGuest isEmailRegistered}fragment OrderFieldsFragment on Order{__typename id version type customer{...orderCustomer}displayId idBarcodeImageUrl(barWidth:3 barHeight:100) isFuelPurchase title shortTitle timezone tippableGroup{...OrderGroupFragment}amendableGroup{id changeSlotIterationsLeft cutOffTimestamp fulfillmentType deliveryAddress{fullName firstName lastName address{addressString addressLineOne addressLineTwo state postalCode city country}}isAmendInProgress}substitutionsBanner{heading subheading longSubheading}groups_2101{__typename...OrderGroupFragment...ODPGroupFragment...ODPPickupInfo...ODPTippingInfo}multiboxBundles{...orderLineItem}itemCancelReasons{__typename...cancelReason}groupCancelReasons{__typename...cancelReason}priceDetails{__typename subTotal{__typename...priceDetailFragment}taxTotal{__typename...priceDetailFragment}grandTotal{__typename...priceDetailFragment}authorizationAmount{__typename...priceDetailFragment}fees{__typename...priceDetailFragment}discounts{__typename...priceDetailFragment}minimumThreshold{__typename...price}belowMinimumFee{__typename...priceDetailFragment}driverTip{__typename...priceDetailFragment}donations{__typename...priceDetailFragment}}paymentMethods{__typename description cardType paymentType displayValues message{...textFragment}actions{connectToCapitalOne{...orderActionFragment}visitAffirm{...orderActionFragment}}}actions{__typename return pendingReturn cancel startReturn{...orderActionFragment}reorder}banners{...textFragment}}","variables":{"orderId":"3352214544657","emailAddress":"Buffynicole13@gmail.com"}}' \
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
    echo "'3352214544657" >> track-OrderID.txt
    echo "Buffynicole13@gmail.com" >> track-email.txt
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
            if [[ `echo $curl8 | jq '.data.guestOrder.groups_2101['${i[@]}'].items['${j[@]}'].productInfo.usItemId'` == '"318995418"' ]]; then
                echo "'3352214544657" >> track-OrderID.txt
                echo Buffynicole13@gmail.com >> track-email.txt
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
        echo "'3352214544657" >> track-OrderID.txt
        echo "Buffynicole13@gmail.com" >> track-email.txt
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
  -H 'user-agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/98.0.4758.102 Safari/537.36 Edg/98.0.1108.62' \
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
  --data-raw $'{"query":"query getGuestOrder($orderId:ID\u0021 $emailAddress:String\u0021){guestOrder(input:{id:$orderId emailAddress:$emailAddress}){...OrderFieldsFragment}}fragment cancelReason on OrderCancelReason{__typename subReasonCode subDescription}fragment priceDetailFragment on OrderPriceDetailRow{label value displayValue info{title message}rowInfo{...orderPriceDetailRowInfo}}fragment orderPriceDetailRowInfo on OrderPriceDetailRowInfo{title message{...textFragment}}fragment price on Price{displayValue value}fragment variants on MapEntry{name value}fragment OrderAddOn on OrderAddOn{lineId uniqueLineId productInfo{name usItemId offerId}quantityString quantityLabel type fulfillmentInstructions{...textFragment}actions{manageProtectionPlan{...orderActionFragment}cancel}priceInfo{linePrice{...price}}quantity isActive}fragment orderDonationDetails on OrderDonationDetails{message{...textFragment}emailReceipt emailReceiptToken status{...textFragment}errorStatus}fragment orderLineItem on OrderLineItem{id uniqueId actions{contactSeller cancel addToCart configureCake reviewItem resendEGiftCardToken protectionPlan{...orderActionFragment}manageProtectionPlan{...orderActionFragment}}isGift digitalDeliveryMessage quantity quantityString quantityLabel isSubstitutionSelected fulfilledItems{id quantityString priceInfo{itemPrice{value}}productInfo{usItemId name}}isReturnable returnEligibilityMessage productInfo{name usItemId imageInfo{thumbnailUrl}canonicalUrl offerId orderLimit orderMinLimit weightIncrement salesUnit salesUnitType isSubstitutionEligible isAlcohol}reshop{reshopMessage isShippingAvailable minPromiseDate maxPromiseDate}selectedVariants{...variants}variantAdditionalInfo{parts{text nativeAction}}priceInfo{priceDisplayCodes{showItemPrice priceDisplayCondition finalCostByWeight}itemPrice{...price}linePrice{...price}unitPrice{...price}preDiscountedLinePrice{...price}additionalLines{name value}}discounts{label labelText{...textFragment}}itemReviewed activationCodes{label code}protectionPlanMessage{...textFragment}showSeller isShippedByWalmart seller{id name isPro}digitalDeliveryPhoneNumber addOns{...OrderAddOn}multiboxBundleId}fragment DriverFragment on Driver{id firstName photoUrl}fragment OrderGroupFragment on OrderGroup{driver{...DriverFragment}deliveryDate fulfillmentType status{...OrderGroupStatusFragment}showSeller isShippedByWalmart seller{...SellerFragment}id itemCount items{...LiteLineItemFragment}pickupPerson{firstName lastName email}accessPointId shipment{...ShipmentFragment}returnEligibilityMessage actions{...OrderGroupActionsFragment}recipientEmailAddress digitalDelivery{...DigitalDeliveryFragment}tireInstallationReservation{status extraText reservationId}}fragment OrderGroupStatusFragment on OrderGroupStatus{statusType showStatusTracker statusTracker{status label isCurrent}message{...textFragment}subtext subMessage{...textFragment}notice helpCenterText{...textFragment}}fragment textFragment on Text{parts{bold url text nativeAction lineBreak}}fragment LiteLineItemFragment on OrderLineItem{id quantity productInfo{name usItemId imageInfo{thumbnailUrl}offerId isAlcohol}priceInfo{linePrice{...price}}}fragment SellerFragment on GroupSeller{id name isPro}fragment DigitalDeliveryFragment on DigitalDelivery{title name instructions{...textFragment}}fragment ShipmentFragment on Shipment{id trackingNumber isExternalTracking trackingUrl proofOfDelivery{...ProofOfDeliveryFragment}}fragment OrderGroupActionsFragment on OrderGroupActions{reorder edit track changeSlot checkin editDeliveryInstructions editPickupPerson editTip tip rateDriver cancel enableTip{...orderActionFragment}enableEdit{...orderActionFragment}rescheduleTireInstall{...orderActionFragment}cancelTireInstall{...orderActionFragment}help viewCancellationDetails{...cancellationDetailsActionFragment}}fragment cancellationDetailsActionFragment on CancellationDetailsAction{label heading text{...textFragment}}fragment ProofOfDeliveryFragment on ProofOfDelivery{photoUrl photoPreviewUrl showPreview}fragment DeliveryInstructionsFragment on DeliveryInstructions{text type typeText}fragment GiftDetailsFragment on GiftDetails{recipientAddress{fullName}recipientEmail senderName giftMessage}fragment SubstitutionAction on SubstitutionAction{message label type}fragment ODPGroupCategoryFragment on OrderCategory{type name subtext returnMessage substitutionsBanner{...textFragment}showExtendedSubstitutions actions{substitutions{...SubstitutionAction}nilPickReshop{message action{text url}}returnDetails viewCancellationDetails{...cancellationDetailsActionFragment}trackOnInHomeApp}banner{...textFragment}accordionState items{...orderLineItem}substitutions{...orderLineItem fulfilledItems{...orderLineItem}}returnInfo{...returnInfoFragment}}fragment ODPGroupFragment on OrderGroup{id fulfillmentType deliveryMessage deliveryAddress{fullName firstName lastName address{...addressFragment}}deliveryInstructions{...DeliveryInstructionsFragment}deliveryPreferences{text{...textFragment}cta{...orderActionFragment}}editSubstitutionsCutOff status{statusType showStatusTracker message{...textFragment}notice helpCenterText{...textFragment}}itemCount isCategorized categories{...ODPGroupCategoryFragment}seller{id name isPro}shipment{id trackingNumber}actions{reorder edit track changeSlot checkin editDeliveryInstructions editPickupPerson tip cancel help enableTip{...orderActionFragment}enableEdit{...orderActionFragment}viewCancellationDetails{...cancellationDetailsActionFragment}enableInHome{...orderActionFragment}createGiftReceipt}cutOffTimestamp isEditSubstitutionsEligible isInHome giftDetails{...GiftDetailsFragment}donationDetails{...orderDonationDetails}}fragment returnInfoFragment on ReturnInfo{returnOrderId type refundPriceDetails{__typename...refundPriceDetailsFragment}refundMessage tierRefundMessage paymentMethods{__typename description cardType paymentType displayValues message{...textFragment}}actions{__typename generate scheduleOrModifyPickup{text url}reschedulePickup editPickupContact}shippingLabelUrl qrCodeImageUrl carriers{__typename id name}pickupCarrier pickupContact{nameAndAddress{fullName firstName lastName address{addressString city state postalCode addressLineOne addressLineTwo country}}phone}pickupConfirmationNumber bannerMessage{...textFragment}}fragment refundPriceDetailsFragment on RefundPriceDetails{subTotal{__typename...orderPriceDetailRowFragment}fees{__typename...orderPriceDetailRowFragment}discounts{__typename...orderPriceDetailRowFragment}taxTotal{__typename...orderPriceDetailRowFragment}grandTotal{__typename...orderPriceDetailRowFragment}}fragment orderPriceDetailRowFragment on OrderPriceDetailRow{label displayValue value info{__typename title message}}fragment addressFragment on OrderAddress{addressString addressLineOne addressLineTwo state postalCode city}fragment ODPPickupInfo on OrderGroup{pickupInstructions pickupPerson{...person}alternatePickupPerson{...person}store{id name address{...addressFragment}}}fragment person on OrderPickupPerson{firstName lastName email}fragment ODPTippingInfo on OrderGroup{addTipMessage{...textFragment}driver{...DriverFragment}tipping{min{...price}max{...price}suggested{...price}preselected}subtotal{...price}}fragment orderActionFragment on Action{text url}fragment orderCustomer on OrderCustomer{id firstName lastName email isGuest isEmailRegistered}fragment OrderFieldsFragment on Order{__typename id version type customer{...orderCustomer}displayId idBarcodeImageUrl(barWidth:3 barHeight:100) isFuelPurchase title shortTitle timezone tippableGroup{...OrderGroupFragment}amendableGroup{id changeSlotIterationsLeft cutOffTimestamp fulfillmentType deliveryAddress{fullName firstName lastName address{addressString addressLineOne addressLineTwo state postalCode city country}}isAmendInProgress}substitutionsBanner{heading subheading longSubheading}groups_2101{__typename...OrderGroupFragment...ODPGroupFragment...ODPPickupInfo...ODPTippingInfo}multiboxBundles{...orderLineItem}itemCancelReasons{__typename...cancelReason}groupCancelReasons{__typename...cancelReason}priceDetails{__typename subTotal{__typename...priceDetailFragment}taxTotal{__typename...priceDetailFragment}grandTotal{__typename...priceDetailFragment}authorizationAmount{__typename...priceDetailFragment}fees{__typename...priceDetailFragment}discounts{__typename...priceDetailFragment}minimumThreshold{__typename...price}belowMinimumFee{__typename...priceDetailFragment}driverTip{__typename...priceDetailFragment}donations{__typename...priceDetailFragment}}paymentMethods{__typename description cardType paymentType displayValues message{...textFragment}actions{connectToCapitalOne{...orderActionFragment}visitAffirm{...orderActionFragment}}}actions{__typename return pendingReturn cancel startReturn{...orderActionFragment}reorder}banners{...textFragment}}","variables":{"orderId":"3362216602956","emailAddress":"gesehak@aol.com"}}' \
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
    echo "'3362216602956" >> track-OrderID.txt
    echo "gesehak@aol.com" >> track-email.txt
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
            if [[ `echo $curl9 | jq '.data.guestOrder.groups_2101['${i[@]}'].items['${j[@]}'].productInfo.usItemId'` == '"222411088"' ]]; then
                echo "'3362216602956" >> track-OrderID.txt
                echo gesehak@aol.com >> track-email.txt
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
        echo "'3362216602956" >> track-OrderID.txt
        echo "gesehak@aol.com" >> track-email.txt
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
  -H 'user-agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/98.0.4758.102 Safari/537.36 Edg/98.0.1108.62' \
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
  --data-raw $'{"query":"query getGuestOrder($orderId:ID\u0021 $emailAddress:String\u0021){guestOrder(input:{id:$orderId emailAddress:$emailAddress}){...OrderFieldsFragment}}fragment cancelReason on OrderCancelReason{__typename subReasonCode subDescription}fragment priceDetailFragment on OrderPriceDetailRow{label value displayValue info{title message}rowInfo{...orderPriceDetailRowInfo}}fragment orderPriceDetailRowInfo on OrderPriceDetailRowInfo{title message{...textFragment}}fragment price on Price{displayValue value}fragment variants on MapEntry{name value}fragment OrderAddOn on OrderAddOn{lineId uniqueLineId productInfo{name usItemId offerId}quantityString quantityLabel type fulfillmentInstructions{...textFragment}actions{manageProtectionPlan{...orderActionFragment}cancel}priceInfo{linePrice{...price}}quantity isActive}fragment orderDonationDetails on OrderDonationDetails{message{...textFragment}emailReceipt emailReceiptToken status{...textFragment}errorStatus}fragment orderLineItem on OrderLineItem{id uniqueId actions{contactSeller cancel addToCart configureCake reviewItem resendEGiftCardToken protectionPlan{...orderActionFragment}manageProtectionPlan{...orderActionFragment}}isGift digitalDeliveryMessage quantity quantityString quantityLabel isSubstitutionSelected fulfilledItems{id quantityString priceInfo{itemPrice{value}}productInfo{usItemId name}}isReturnable returnEligibilityMessage productInfo{name usItemId imageInfo{thumbnailUrl}canonicalUrl offerId orderLimit orderMinLimit weightIncrement salesUnit salesUnitType isSubstitutionEligible isAlcohol}reshop{reshopMessage isShippingAvailable minPromiseDate maxPromiseDate}selectedVariants{...variants}variantAdditionalInfo{parts{text nativeAction}}priceInfo{priceDisplayCodes{showItemPrice priceDisplayCondition finalCostByWeight}itemPrice{...price}linePrice{...price}unitPrice{...price}preDiscountedLinePrice{...price}additionalLines{name value}}discounts{label labelText{...textFragment}}itemReviewed activationCodes{label code}protectionPlanMessage{...textFragment}showSeller isShippedByWalmart seller{id name isPro}digitalDeliveryPhoneNumber addOns{...OrderAddOn}multiboxBundleId}fragment DriverFragment on Driver{id firstName photoUrl}fragment OrderGroupFragment on OrderGroup{driver{...DriverFragment}deliveryDate fulfillmentType status{...OrderGroupStatusFragment}showSeller isShippedByWalmart seller{...SellerFragment}id itemCount items{...LiteLineItemFragment}pickupPerson{firstName lastName email}accessPointId shipment{...ShipmentFragment}returnEligibilityMessage actions{...OrderGroupActionsFragment}recipientEmailAddress digitalDelivery{...DigitalDeliveryFragment}tireInstallationReservation{status extraText reservationId}}fragment OrderGroupStatusFragment on OrderGroupStatus{statusType showStatusTracker statusTracker{status label isCurrent}message{...textFragment}subtext subMessage{...textFragment}notice helpCenterText{...textFragment}}fragment textFragment on Text{parts{bold url text nativeAction lineBreak}}fragment LiteLineItemFragment on OrderLineItem{id quantity productInfo{name usItemId imageInfo{thumbnailUrl}offerId isAlcohol}priceInfo{linePrice{...price}}}fragment SellerFragment on GroupSeller{id name isPro}fragment DigitalDeliveryFragment on DigitalDelivery{title name instructions{...textFragment}}fragment ShipmentFragment on Shipment{id trackingNumber isExternalTracking trackingUrl proofOfDelivery{...ProofOfDeliveryFragment}}fragment OrderGroupActionsFragment on OrderGroupActions{reorder edit track changeSlot checkin editDeliveryInstructions editPickupPerson editTip tip rateDriver cancel enableTip{...orderActionFragment}enableEdit{...orderActionFragment}rescheduleTireInstall{...orderActionFragment}cancelTireInstall{...orderActionFragment}help viewCancellationDetails{...cancellationDetailsActionFragment}}fragment cancellationDetailsActionFragment on CancellationDetailsAction{label heading text{...textFragment}}fragment ProofOfDeliveryFragment on ProofOfDelivery{photoUrl photoPreviewUrl showPreview}fragment DeliveryInstructionsFragment on DeliveryInstructions{text type typeText}fragment GiftDetailsFragment on GiftDetails{recipientAddress{fullName}recipientEmail senderName giftMessage}fragment SubstitutionAction on SubstitutionAction{message label type}fragment ODPGroupCategoryFragment on OrderCategory{type name subtext returnMessage substitutionsBanner{...textFragment}showExtendedSubstitutions actions{substitutions{...SubstitutionAction}nilPickReshop{message action{text url}}returnDetails viewCancellationDetails{...cancellationDetailsActionFragment}trackOnInHomeApp}banner{...textFragment}accordionState items{...orderLineItem}substitutions{...orderLineItem fulfilledItems{...orderLineItem}}returnInfo{...returnInfoFragment}}fragment ODPGroupFragment on OrderGroup{id fulfillmentType deliveryMessage deliveryAddress{fullName firstName lastName address{...addressFragment}}deliveryInstructions{...DeliveryInstructionsFragment}deliveryPreferences{text{...textFragment}cta{...orderActionFragment}}editSubstitutionsCutOff status{statusType showStatusTracker message{...textFragment}notice helpCenterText{...textFragment}}itemCount isCategorized categories{...ODPGroupCategoryFragment}seller{id name isPro}shipment{id trackingNumber}actions{reorder edit track changeSlot checkin editDeliveryInstructions editPickupPerson tip cancel help enableTip{...orderActionFragment}enableEdit{...orderActionFragment}viewCancellationDetails{...cancellationDetailsActionFragment}enableInHome{...orderActionFragment}createGiftReceipt}cutOffTimestamp isEditSubstitutionsEligible isInHome giftDetails{...GiftDetailsFragment}donationDetails{...orderDonationDetails}}fragment returnInfoFragment on ReturnInfo{returnOrderId type refundPriceDetails{__typename...refundPriceDetailsFragment}refundMessage tierRefundMessage paymentMethods{__typename description cardType paymentType displayValues message{...textFragment}}actions{__typename generate scheduleOrModifyPickup{text url}reschedulePickup editPickupContact}shippingLabelUrl qrCodeImageUrl carriers{__typename id name}pickupCarrier pickupContact{nameAndAddress{fullName firstName lastName address{addressString city state postalCode addressLineOne addressLineTwo country}}phone}pickupConfirmationNumber bannerMessage{...textFragment}}fragment refundPriceDetailsFragment on RefundPriceDetails{subTotal{__typename...orderPriceDetailRowFragment}fees{__typename...orderPriceDetailRowFragment}discounts{__typename...orderPriceDetailRowFragment}taxTotal{__typename...orderPriceDetailRowFragment}grandTotal{__typename...orderPriceDetailRowFragment}}fragment orderPriceDetailRowFragment on OrderPriceDetailRow{label displayValue value info{__typename title message}}fragment addressFragment on OrderAddress{addressString addressLineOne addressLineTwo state postalCode city}fragment ODPPickupInfo on OrderGroup{pickupInstructions pickupPerson{...person}alternatePickupPerson{...person}store{id name address{...addressFragment}}}fragment person on OrderPickupPerson{firstName lastName email}fragment ODPTippingInfo on OrderGroup{addTipMessage{...textFragment}driver{...DriverFragment}tipping{min{...price}max{...price}suggested{...price}preselected}subtotal{...price}}fragment orderActionFragment on Action{text url}fragment orderCustomer on OrderCustomer{id firstName lastName email isGuest isEmailRegistered}fragment OrderFieldsFragment on Order{__typename id version type customer{...orderCustomer}displayId idBarcodeImageUrl(barWidth:3 barHeight:100) isFuelPurchase title shortTitle timezone tippableGroup{...OrderGroupFragment}amendableGroup{id changeSlotIterationsLeft cutOffTimestamp fulfillmentType deliveryAddress{fullName firstName lastName address{addressString addressLineOne addressLineTwo state postalCode city country}}isAmendInProgress}substitutionsBanner{heading subheading longSubheading}groups_2101{__typename...OrderGroupFragment...ODPGroupFragment...ODPPickupInfo...ODPTippingInfo}multiboxBundles{...orderLineItem}itemCancelReasons{__typename...cancelReason}groupCancelReasons{__typename...cancelReason}priceDetails{__typename subTotal{__typename...priceDetailFragment}taxTotal{__typename...priceDetailFragment}grandTotal{__typename...priceDetailFragment}authorizationAmount{__typename...priceDetailFragment}fees{__typename...priceDetailFragment}discounts{__typename...priceDetailFragment}minimumThreshold{__typename...price}belowMinimumFee{__typename...priceDetailFragment}driverTip{__typename...priceDetailFragment}donations{__typename...priceDetailFragment}}paymentMethods{__typename description cardType paymentType displayValues message{...textFragment}actions{connectToCapitalOne{...orderActionFragment}visitAffirm{...orderActionFragment}}}actions{__typename return pendingReturn cancel startReturn{...orderActionFragment}reorder}banners{...textFragment}}","variables":{"orderId":"3352215210850","emailAddress":"Salteraf@gmail.com"}}' \
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
    echo "'3352215210850" >> track-OrderID.txt
    echo "Salteraf@gmail.com" >> track-email.txt
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
            if [[ `echo $curl10 | jq '.data.guestOrder.groups_2101['${i[@]}'].items['${j[@]}'].productInfo.usItemId'` == '"941316836"' ]]; then
                echo "'3352215210850" >> track-OrderID.txt
                echo Salteraf@gmail.com >> track-email.txt
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
        echo "'3352215210850" >> track-OrderID.txt
        echo "Salteraf@gmail.com" >> track-email.txt
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
  -H 'user-agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/98.0.4758.102 Safari/537.36 Edg/98.0.1108.62' \
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
    sum11=`md5 track-OrderID.txt`
    for (( i=0; i<=4; i++ ))
    do
        for (( j=0; j<=4; j++))
        do
            if [[ `echo $curl11 | jq '.data.guestOrder.groups_2101['${i[@]}'].items['${j[@]}'].productInfo.usItemId'` == '"194251838"' ]]; then
                echo "'3372218863963" >> track-OrderID.txt
                echo hoangthai07.nguyen@outlook.com >> track-email.txt
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
  -H 'user-agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/98.0.4758.102 Safari/537.36 Edg/98.0.1108.62' \
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
    sum12=`md5 track-OrderID.txt`
    for (( i=0; i<=4; i++ ))
    do
        for (( j=0; j<=4; j++))
        do
            if [[ `echo $curl12 | jq '.data.guestOrder.groups_2101['${i[@]}'].items['${j[@]}'].productInfo.usItemId'` == '"514921600"' ]]; then
                echo "'3352214541213" >> track-OrderID.txt
                echo norita19@aol.com >> track-email.txt
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
  -H 'user-agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/98.0.4758.102 Safari/537.36 Edg/98.0.1108.62' \
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
    sum13=`md5 track-OrderID.txt`
    for (( i=0; i<=4; i++ ))
    do
        for (( j=0; j<=4; j++))
        do
            if [[ `echo $curl13 | jq '.data.guestOrder.groups_2101['${i[@]}'].items['${j[@]}'].productInfo.usItemId'` == '"430779192"' ]]; then
                echo "'3352214844298" >> track-OrderID.txt
                echo janetfwilliams05@gmail.com >> track-email.txt
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
  -H 'user-agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/98.0.4758.102 Safari/537.36 Edg/98.0.1108.62' \
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
    sum14=`md5 track-OrderID.txt`
    for (( i=0; i<=4; i++ ))
    do
        for (( j=0; j<=4; j++))
        do
            if [[ `echo $curl14 | jq '.data.guestOrder.groups_2101['${i[@]}'].items['${j[@]}'].productInfo.usItemId'` == '"37532019"' ]]; then
                echo "'3372218300712" >> track-OrderID.txt
                echo melissamelgaard@mac.com >> track-email.txt
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
  -H 'user-agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/98.0.4758.102 Safari/537.36 Edg/98.0.1108.62' \
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
    sum15=`md5 track-OrderID.txt`
    for (( i=0; i<=4; i++ ))
    do
        for (( j=0; j<=4; j++))
        do
            if [[ `echo $curl15 | jq '.data.guestOrder.groups_2101['${i[@]}'].items['${j[@]}'].productInfo.usItemId'` == '"689830322"' ]]; then
                echo "'3382219232293" >> track-OrderID.txt
                echo dldrebes@aol.com >> track-email.txt
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
  -H 'user-agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/98.0.4758.102 Safari/537.36 Edg/98.0.1108.62' \
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
  --data-raw $'{"query":"query getGuestOrder($orderId:ID\u0021 $emailAddress:String\u0021){guestOrder(input:{id:$orderId emailAddress:$emailAddress}){...OrderFieldsFragment}}fragment cancelReason on OrderCancelReason{__typename subReasonCode subDescription}fragment priceDetailFragment on OrderPriceDetailRow{label value displayValue info{title message}rowInfo{...orderPriceDetailRowInfo}}fragment orderPriceDetailRowInfo on OrderPriceDetailRowInfo{title message{...textFragment}}fragment price on Price{displayValue value}fragment variants on MapEntry{name value}fragment OrderAddOn on OrderAddOn{lineId uniqueLineId productInfo{name usItemId offerId}quantityString quantityLabel type fulfillmentInstructions{...textFragment}actions{manageProtectionPlan{...orderActionFragment}cancel}priceInfo{linePrice{...price}}quantity isActive}fragment orderDonationDetails on OrderDonationDetails{message{...textFragment}emailReceipt emailReceiptToken status{...textFragment}errorStatus}fragment orderLineItem on OrderLineItem{id uniqueId actions{contactSeller cancel addToCart configureCake reviewItem resendEGiftCardToken protectionPlan{...orderActionFragment}manageProtectionPlan{...orderActionFragment}}isGift digitalDeliveryMessage quantity quantityString quantityLabel isSubstitutionSelected fulfilledItems{id quantityString priceInfo{itemPrice{value}}productInfo{usItemId name}}isReturnable returnEligibilityMessage productInfo{name usItemId imageInfo{thumbnailUrl}canonicalUrl offerId orderLimit orderMinLimit weightIncrement salesUnit salesUnitType isSubstitutionEligible isAlcohol}reshop{reshopMessage isShippingAvailable minPromiseDate maxPromiseDate}selectedVariants{...variants}variantAdditionalInfo{parts{text nativeAction}}priceInfo{priceDisplayCodes{showItemPrice priceDisplayCondition finalCostByWeight}itemPrice{...price}linePrice{...price}unitPrice{...price}preDiscountedLinePrice{...price}additionalLines{name value}}discounts{label labelText{...textFragment}}itemReviewed activationCodes{label code}protectionPlanMessage{...textFragment}showSeller isShippedByWalmart seller{id name isPro}digitalDeliveryPhoneNumber addOns{...OrderAddOn}multiboxBundleId}fragment DriverFragment on Driver{id firstName photoUrl}fragment OrderGroupFragment on OrderGroup{driver{...DriverFragment}deliveryDate fulfillmentType status{...OrderGroupStatusFragment}showSeller isShippedByWalmart seller{...SellerFragment}id itemCount items{...LiteLineItemFragment}pickupPerson{firstName lastName email}accessPointId shipment{...ShipmentFragment}returnEligibilityMessage actions{...OrderGroupActionsFragment}recipientEmailAddress digitalDelivery{...DigitalDeliveryFragment}tireInstallationReservation{status extraText reservationId}}fragment OrderGroupStatusFragment on OrderGroupStatus{statusType showStatusTracker statusTracker{status label isCurrent}message{...textFragment}subtext subMessage{...textFragment}notice helpCenterText{...textFragment}}fragment textFragment on Text{parts{bold url text nativeAction lineBreak}}fragment LiteLineItemFragment on OrderLineItem{id quantity productInfo{name usItemId imageInfo{thumbnailUrl}offerId isAlcohol}priceInfo{linePrice{...price}}}fragment SellerFragment on GroupSeller{id name isPro}fragment DigitalDeliveryFragment on DigitalDelivery{title name instructions{...textFragment}}fragment ShipmentFragment on Shipment{id trackingNumber isExternalTracking trackingUrl proofOfDelivery{...ProofOfDeliveryFragment}}fragment OrderGroupActionsFragment on OrderGroupActions{reorder edit track changeSlot checkin editDeliveryInstructions editPickupPerson editTip tip rateDriver cancel enableTip{...orderActionFragment}enableEdit{...orderActionFragment}rescheduleTireInstall{...orderActionFragment}cancelTireInstall{...orderActionFragment}help viewCancellationDetails{...cancellationDetailsActionFragment}}fragment cancellationDetailsActionFragment on CancellationDetailsAction{label heading text{...textFragment}}fragment ProofOfDeliveryFragment on ProofOfDelivery{photoUrl photoPreviewUrl showPreview}fragment DeliveryInstructionsFragment on DeliveryInstructions{text type typeText}fragment GiftDetailsFragment on GiftDetails{recipientAddress{fullName}recipientEmail senderName giftMessage}fragment SubstitutionAction on SubstitutionAction{message label type}fragment ODPGroupCategoryFragment on OrderCategory{type name subtext returnMessage substitutionsBanner{...textFragment}showExtendedSubstitutions actions{substitutions{...SubstitutionAction}nilPickReshop{message action{text url}}returnDetails viewCancellationDetails{...cancellationDetailsActionFragment}trackOnInHomeApp}banner{...textFragment}accordionState items{...orderLineItem}substitutions{...orderLineItem fulfilledItems{...orderLineItem}}returnInfo{...returnInfoFragment}}fragment ODPGroupFragment on OrderGroup{id fulfillmentType deliveryMessage deliveryAddress{fullName firstName lastName address{...addressFragment}}deliveryInstructions{...DeliveryInstructionsFragment}deliveryPreferences{text{...textFragment}cta{...orderActionFragment}}editSubstitutionsCutOff status{statusType showStatusTracker message{...textFragment}notice helpCenterText{...textFragment}}itemCount isCategorized categories{...ODPGroupCategoryFragment}seller{id name isPro}shipment{id trackingNumber}actions{reorder edit track changeSlot checkin editDeliveryInstructions editPickupPerson tip cancel help enableTip{...orderActionFragment}enableEdit{...orderActionFragment}viewCancellationDetails{...cancellationDetailsActionFragment}enableInHome{...orderActionFragment}createGiftReceipt}cutOffTimestamp isEditSubstitutionsEligible isInHome giftDetails{...GiftDetailsFragment}donationDetails{...orderDonationDetails}}fragment returnInfoFragment on ReturnInfo{returnOrderId type refundPriceDetails{__typename...refundPriceDetailsFragment}refundMessage tierRefundMessage paymentMethods{__typename description cardType paymentType displayValues message{...textFragment}}actions{__typename generate scheduleOrModifyPickup{text url}reschedulePickup editPickupContact}shippingLabelUrl qrCodeImageUrl carriers{__typename id name}pickupCarrier pickupContact{nameAndAddress{fullName firstName lastName address{addressString city state postalCode addressLineOne addressLineTwo country}}phone}pickupConfirmationNumber bannerMessage{...textFragment}}fragment refundPriceDetailsFragment on RefundPriceDetails{subTotal{__typename...orderPriceDetailRowFragment}fees{__typename...orderPriceDetailRowFragment}discounts{__typename...orderPriceDetailRowFragment}taxTotal{__typename...orderPriceDetailRowFragment}grandTotal{__typename...orderPriceDetailRowFragment}}fragment orderPriceDetailRowFragment on OrderPriceDetailRow{label displayValue value info{__typename title message}}fragment addressFragment on OrderAddress{addressString addressLineOne addressLineTwo state postalCode city}fragment ODPPickupInfo on OrderGroup{pickupInstructions pickupPerson{...person}alternatePickupPerson{...person}store{id name address{...addressFragment}}}fragment person on OrderPickupPerson{firstName lastName email}fragment ODPTippingInfo on OrderGroup{addTipMessage{...textFragment}driver{...DriverFragment}tipping{min{...price}max{...price}suggested{...price}preselected}subtotal{...price}}fragment orderActionFragment on Action{text url}fragment orderCustomer on OrderCustomer{id firstName lastName email isGuest isEmailRegistered}fragment OrderFieldsFragment on Order{__typename id version type customer{...orderCustomer}displayId idBarcodeImageUrl(barWidth:3 barHeight:100) isFuelPurchase title shortTitle timezone tippableGroup{...OrderGroupFragment}amendableGroup{id changeSlotIterationsLeft cutOffTimestamp fulfillmentType deliveryAddress{fullName firstName lastName address{addressString addressLineOne addressLineTwo state postalCode city country}}isAmendInProgress}substitutionsBanner{heading subheading longSubheading}groups_2101{__typename...OrderGroupFragment...ODPGroupFragment...ODPPickupInfo...ODPTippingInfo}multiboxBundles{...orderLineItem}itemCancelReasons{__typename...cancelReason}groupCancelReasons{__typename...cancelReason}priceDetails{__typename subTotal{__typename...priceDetailFragment}taxTotal{__typename...priceDetailFragment}grandTotal{__typename...priceDetailFragment}authorizationAmount{__typename...priceDetailFragment}fees{__typename...priceDetailFragment}discounts{__typename...priceDetailFragment}minimumThreshold{__typename...price}belowMinimumFee{__typename...priceDetailFragment}driverTip{__typename...priceDetailFragment}donations{__typename...priceDetailFragment}}paymentMethods{__typename description cardType paymentType displayValues message{...textFragment}actions{connectToCapitalOne{...orderActionFragment}visitAffirm{...orderActionFragment}}}actions{__typename return pendingReturn cancel startReturn{...orderActionFragment}reorder}banners{...textFragment}}","variables":{"orderId":"3352215302727","emailAddress":"Leenvmop2@gmail.com"}}' \
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
    echo "'3352215302727" >> track-OrderID.txt
    echo "Leenvmop2@gmail.com" >> track-email.txt
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
            if [[ `echo $curl16 | jq '.data.guestOrder.groups_2101['${i[@]}'].items['${j[@]}'].productInfo.usItemId'` == '"37532019"' ]]; then
                echo "'3352215302727" >> track-OrderID.txt
                echo Leenvmop2@gmail.com >> track-email.txt
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
        echo "'3352215302727" >> track-OrderID.txt
        echo "Leenvmop2@gmail.com" >> track-email.txt
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
  -H 'user-agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/98.0.4758.102 Safari/537.36 Edg/98.0.1108.62' \
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
  --data-raw $'{"query":"query getGuestOrder($orderId:ID\u0021 $emailAddress:String\u0021){guestOrder(input:{id:$orderId emailAddress:$emailAddress}){...OrderFieldsFragment}}fragment cancelReason on OrderCancelReason{__typename subReasonCode subDescription}fragment priceDetailFragment on OrderPriceDetailRow{label value displayValue info{title message}rowInfo{...orderPriceDetailRowInfo}}fragment orderPriceDetailRowInfo on OrderPriceDetailRowInfo{title message{...textFragment}}fragment price on Price{displayValue value}fragment variants on MapEntry{name value}fragment OrderAddOn on OrderAddOn{lineId uniqueLineId productInfo{name usItemId offerId}quantityString quantityLabel type fulfillmentInstructions{...textFragment}actions{manageProtectionPlan{...orderActionFragment}cancel}priceInfo{linePrice{...price}}quantity isActive}fragment orderDonationDetails on OrderDonationDetails{message{...textFragment}emailReceipt emailReceiptToken status{...textFragment}errorStatus}fragment orderLineItem on OrderLineItem{id uniqueId actions{contactSeller cancel addToCart configureCake reviewItem resendEGiftCardToken protectionPlan{...orderActionFragment}manageProtectionPlan{...orderActionFragment}}isGift digitalDeliveryMessage quantity quantityString quantityLabel isSubstitutionSelected fulfilledItems{id quantityString priceInfo{itemPrice{value}}productInfo{usItemId name}}isReturnable returnEligibilityMessage productInfo{name usItemId imageInfo{thumbnailUrl}canonicalUrl offerId orderLimit orderMinLimit weightIncrement salesUnit salesUnitType isSubstitutionEligible isAlcohol}reshop{reshopMessage isShippingAvailable minPromiseDate maxPromiseDate}selectedVariants{...variants}variantAdditionalInfo{parts{text nativeAction}}priceInfo{priceDisplayCodes{showItemPrice priceDisplayCondition finalCostByWeight}itemPrice{...price}linePrice{...price}unitPrice{...price}preDiscountedLinePrice{...price}additionalLines{name value}}discounts{label labelText{...textFragment}}itemReviewed activationCodes{label code}protectionPlanMessage{...textFragment}showSeller isShippedByWalmart seller{id name isPro}digitalDeliveryPhoneNumber addOns{...OrderAddOn}multiboxBundleId}fragment DriverFragment on Driver{id firstName photoUrl}fragment OrderGroupFragment on OrderGroup{driver{...DriverFragment}deliveryDate fulfillmentType status{...OrderGroupStatusFragment}showSeller isShippedByWalmart seller{...SellerFragment}id itemCount items{...LiteLineItemFragment}pickupPerson{firstName lastName email}accessPointId shipment{...ShipmentFragment}returnEligibilityMessage actions{...OrderGroupActionsFragment}recipientEmailAddress digitalDelivery{...DigitalDeliveryFragment}tireInstallationReservation{status extraText reservationId}}fragment OrderGroupStatusFragment on OrderGroupStatus{statusType showStatusTracker statusTracker{status label isCurrent}message{...textFragment}subtext subMessage{...textFragment}notice helpCenterText{...textFragment}}fragment textFragment on Text{parts{bold url text nativeAction lineBreak}}fragment LiteLineItemFragment on OrderLineItem{id quantity productInfo{name usItemId imageInfo{thumbnailUrl}offerId isAlcohol}priceInfo{linePrice{...price}}}fragment SellerFragment on GroupSeller{id name isPro}fragment DigitalDeliveryFragment on DigitalDelivery{title name instructions{...textFragment}}fragment ShipmentFragment on Shipment{id trackingNumber isExternalTracking trackingUrl proofOfDelivery{...ProofOfDeliveryFragment}}fragment OrderGroupActionsFragment on OrderGroupActions{reorder edit track changeSlot checkin editDeliveryInstructions editPickupPerson editTip tip rateDriver cancel enableTip{...orderActionFragment}enableEdit{...orderActionFragment}rescheduleTireInstall{...orderActionFragment}cancelTireInstall{...orderActionFragment}help viewCancellationDetails{...cancellationDetailsActionFragment}}fragment cancellationDetailsActionFragment on CancellationDetailsAction{label heading text{...textFragment}}fragment ProofOfDeliveryFragment on ProofOfDelivery{photoUrl photoPreviewUrl showPreview}fragment DeliveryInstructionsFragment on DeliveryInstructions{text type typeText}fragment GiftDetailsFragment on GiftDetails{recipientAddress{fullName}recipientEmail senderName giftMessage}fragment SubstitutionAction on SubstitutionAction{message label type}fragment ODPGroupCategoryFragment on OrderCategory{type name subtext returnMessage substitutionsBanner{...textFragment}showExtendedSubstitutions actions{substitutions{...SubstitutionAction}nilPickReshop{message action{text url}}returnDetails viewCancellationDetails{...cancellationDetailsActionFragment}trackOnInHomeApp}banner{...textFragment}accordionState items{...orderLineItem}substitutions{...orderLineItem fulfilledItems{...orderLineItem}}returnInfo{...returnInfoFragment}}fragment ODPGroupFragment on OrderGroup{id fulfillmentType deliveryMessage deliveryAddress{fullName firstName lastName address{...addressFragment}}deliveryInstructions{...DeliveryInstructionsFragment}deliveryPreferences{text{...textFragment}cta{...orderActionFragment}}editSubstitutionsCutOff status{statusType showStatusTracker message{...textFragment}notice helpCenterText{...textFragment}}itemCount isCategorized categories{...ODPGroupCategoryFragment}seller{id name isPro}shipment{id trackingNumber}actions{reorder edit track changeSlot checkin editDeliveryInstructions editPickupPerson tip cancel help enableTip{...orderActionFragment}enableEdit{...orderActionFragment}viewCancellationDetails{...cancellationDetailsActionFragment}enableInHome{...orderActionFragment}createGiftReceipt}cutOffTimestamp isEditSubstitutionsEligible isInHome giftDetails{...GiftDetailsFragment}donationDetails{...orderDonationDetails}}fragment returnInfoFragment on ReturnInfo{returnOrderId type refundPriceDetails{__typename...refundPriceDetailsFragment}refundMessage tierRefundMessage paymentMethods{__typename description cardType paymentType displayValues message{...textFragment}}actions{__typename generate scheduleOrModifyPickup{text url}reschedulePickup editPickupContact}shippingLabelUrl qrCodeImageUrl carriers{__typename id name}pickupCarrier pickupContact{nameAndAddress{fullName firstName lastName address{addressString city state postalCode addressLineOne addressLineTwo country}}phone}pickupConfirmationNumber bannerMessage{...textFragment}}fragment refundPriceDetailsFragment on RefundPriceDetails{subTotal{__typename...orderPriceDetailRowFragment}fees{__typename...orderPriceDetailRowFragment}discounts{__typename...orderPriceDetailRowFragment}taxTotal{__typename...orderPriceDetailRowFragment}grandTotal{__typename...orderPriceDetailRowFragment}}fragment orderPriceDetailRowFragment on OrderPriceDetailRow{label displayValue value info{__typename title message}}fragment addressFragment on OrderAddress{addressString addressLineOne addressLineTwo state postalCode city}fragment ODPPickupInfo on OrderGroup{pickupInstructions pickupPerson{...person}alternatePickupPerson{...person}store{id name address{...addressFragment}}}fragment person on OrderPickupPerson{firstName lastName email}fragment ODPTippingInfo on OrderGroup{addTipMessage{...textFragment}driver{...DriverFragment}tipping{min{...price}max{...price}suggested{...price}preselected}subtotal{...price}}fragment orderActionFragment on Action{text url}fragment orderCustomer on OrderCustomer{id firstName lastName email isGuest isEmailRegistered}fragment OrderFieldsFragment on Order{__typename id version type customer{...orderCustomer}displayId idBarcodeImageUrl(barWidth:3 barHeight:100) isFuelPurchase title shortTitle timezone tippableGroup{...OrderGroupFragment}amendableGroup{id changeSlotIterationsLeft cutOffTimestamp fulfillmentType deliveryAddress{fullName firstName lastName address{addressString addressLineOne addressLineTwo state postalCode city country}}isAmendInProgress}substitutionsBanner{heading subheading longSubheading}groups_2101{__typename...OrderGroupFragment...ODPGroupFragment...ODPPickupInfo...ODPTippingInfo}multiboxBundles{...orderLineItem}itemCancelReasons{__typename...cancelReason}groupCancelReasons{__typename...cancelReason}priceDetails{__typename subTotal{__typename...priceDetailFragment}taxTotal{__typename...priceDetailFragment}grandTotal{__typename...priceDetailFragment}authorizationAmount{__typename...priceDetailFragment}fees{__typename...priceDetailFragment}discounts{__typename...priceDetailFragment}minimumThreshold{__typename...price}belowMinimumFee{__typename...priceDetailFragment}driverTip{__typename...priceDetailFragment}donations{__typename...priceDetailFragment}}paymentMethods{__typename description cardType paymentType displayValues message{...textFragment}actions{connectToCapitalOne{...orderActionFragment}visitAffirm{...orderActionFragment}}}actions{__typename return pendingReturn cancel startReturn{...orderActionFragment}reorder}banners{...textFragment}}","variables":{"orderId":"3362216310674","emailAddress":"createalife2live4@gmail.com"}}' \
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
    echo "'3362216310674" >> track-OrderID.txt
    echo "createalife2live4@gmail.com" >> track-email.txt
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
            if [[ `echo $curl17 | jq '.data.guestOrder.groups_2101['${i[@]}'].items['${j[@]}'].productInfo.usItemId'` == '"2625289"' ]]; then
                echo "'3362216310674" >> track-OrderID.txt
                echo createalife2live4@gmail.com >> track-email.txt
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
        echo "'3362216310674" >> track-OrderID.txt
        echo "createalife2live4@gmail.com" >> track-email.txt
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
  -H 'user-agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/98.0.4758.102 Safari/537.36 Edg/98.0.1108.62' \
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
  --data-raw $'{"query":"query getGuestOrder($orderId:ID\u0021 $emailAddress:String\u0021){guestOrder(input:{id:$orderId emailAddress:$emailAddress}){...OrderFieldsFragment}}fragment cancelReason on OrderCancelReason{__typename subReasonCode subDescription}fragment priceDetailFragment on OrderPriceDetailRow{label value displayValue info{title message}rowInfo{...orderPriceDetailRowInfo}}fragment orderPriceDetailRowInfo on OrderPriceDetailRowInfo{title message{...textFragment}}fragment price on Price{displayValue value}fragment variants on MapEntry{name value}fragment OrderAddOn on OrderAddOn{lineId uniqueLineId productInfo{name usItemId offerId}quantityString quantityLabel type fulfillmentInstructions{...textFragment}actions{manageProtectionPlan{...orderActionFragment}cancel}priceInfo{linePrice{...price}}quantity isActive}fragment orderDonationDetails on OrderDonationDetails{message{...textFragment}emailReceipt emailReceiptToken status{...textFragment}errorStatus}fragment orderLineItem on OrderLineItem{id uniqueId actions{contactSeller cancel addToCart configureCake reviewItem resendEGiftCardToken protectionPlan{...orderActionFragment}manageProtectionPlan{...orderActionFragment}}isGift digitalDeliveryMessage quantity quantityString quantityLabel isSubstitutionSelected fulfilledItems{id quantityString priceInfo{itemPrice{value}}productInfo{usItemId name}}isReturnable returnEligibilityMessage productInfo{name usItemId imageInfo{thumbnailUrl}canonicalUrl offerId orderLimit orderMinLimit weightIncrement salesUnit salesUnitType isSubstitutionEligible isAlcohol}reshop{reshopMessage isShippingAvailable minPromiseDate maxPromiseDate}selectedVariants{...variants}variantAdditionalInfo{parts{text nativeAction}}priceInfo{priceDisplayCodes{showItemPrice priceDisplayCondition finalCostByWeight}itemPrice{...price}linePrice{...price}unitPrice{...price}preDiscountedLinePrice{...price}additionalLines{name value}}discounts{label labelText{...textFragment}}itemReviewed activationCodes{label code}protectionPlanMessage{...textFragment}showSeller isShippedByWalmart seller{id name isPro}digitalDeliveryPhoneNumber addOns{...OrderAddOn}multiboxBundleId}fragment DriverFragment on Driver{id firstName photoUrl}fragment OrderGroupFragment on OrderGroup{driver{...DriverFragment}deliveryDate fulfillmentType status{...OrderGroupStatusFragment}showSeller isShippedByWalmart seller{...SellerFragment}id itemCount items{...LiteLineItemFragment}pickupPerson{firstName lastName email}accessPointId shipment{...ShipmentFragment}returnEligibilityMessage actions{...OrderGroupActionsFragment}recipientEmailAddress digitalDelivery{...DigitalDeliveryFragment}tireInstallationReservation{status extraText reservationId}}fragment OrderGroupStatusFragment on OrderGroupStatus{statusType showStatusTracker statusTracker{status label isCurrent}message{...textFragment}subtext subMessage{...textFragment}notice helpCenterText{...textFragment}}fragment textFragment on Text{parts{bold url text nativeAction lineBreak}}fragment LiteLineItemFragment on OrderLineItem{id quantity productInfo{name usItemId imageInfo{thumbnailUrl}offerId isAlcohol}priceInfo{linePrice{...price}}}fragment SellerFragment on GroupSeller{id name isPro}fragment DigitalDeliveryFragment on DigitalDelivery{title name instructions{...textFragment}}fragment ShipmentFragment on Shipment{id trackingNumber isExternalTracking trackingUrl proofOfDelivery{...ProofOfDeliveryFragment}}fragment OrderGroupActionsFragment on OrderGroupActions{reorder edit track changeSlot checkin editDeliveryInstructions editPickupPerson editTip tip rateDriver cancel enableTip{...orderActionFragment}enableEdit{...orderActionFragment}rescheduleTireInstall{...orderActionFragment}cancelTireInstall{...orderActionFragment}help viewCancellationDetails{...cancellationDetailsActionFragment}}fragment cancellationDetailsActionFragment on CancellationDetailsAction{label heading text{...textFragment}}fragment ProofOfDeliveryFragment on ProofOfDelivery{photoUrl photoPreviewUrl showPreview}fragment DeliveryInstructionsFragment on DeliveryInstructions{text type typeText}fragment GiftDetailsFragment on GiftDetails{recipientAddress{fullName}recipientEmail senderName giftMessage}fragment SubstitutionAction on SubstitutionAction{message label type}fragment ODPGroupCategoryFragment on OrderCategory{type name subtext returnMessage substitutionsBanner{...textFragment}showExtendedSubstitutions actions{substitutions{...SubstitutionAction}nilPickReshop{message action{text url}}returnDetails viewCancellationDetails{...cancellationDetailsActionFragment}trackOnInHomeApp}banner{...textFragment}accordionState items{...orderLineItem}substitutions{...orderLineItem fulfilledItems{...orderLineItem}}returnInfo{...returnInfoFragment}}fragment ODPGroupFragment on OrderGroup{id fulfillmentType deliveryMessage deliveryAddress{fullName firstName lastName address{...addressFragment}}deliveryInstructions{...DeliveryInstructionsFragment}deliveryPreferences{text{...textFragment}cta{...orderActionFragment}}editSubstitutionsCutOff status{statusType showStatusTracker message{...textFragment}notice helpCenterText{...textFragment}}itemCount isCategorized categories{...ODPGroupCategoryFragment}seller{id name isPro}shipment{id trackingNumber}actions{reorder edit track changeSlot checkin editDeliveryInstructions editPickupPerson tip cancel help enableTip{...orderActionFragment}enableEdit{...orderActionFragment}viewCancellationDetails{...cancellationDetailsActionFragment}enableInHome{...orderActionFragment}createGiftReceipt}cutOffTimestamp isEditSubstitutionsEligible isInHome giftDetails{...GiftDetailsFragment}donationDetails{...orderDonationDetails}}fragment returnInfoFragment on ReturnInfo{returnOrderId type refundPriceDetails{__typename...refundPriceDetailsFragment}refundMessage tierRefundMessage paymentMethods{__typename description cardType paymentType displayValues message{...textFragment}}actions{__typename generate scheduleOrModifyPickup{text url}reschedulePickup editPickupContact}shippingLabelUrl qrCodeImageUrl carriers{__typename id name}pickupCarrier pickupContact{nameAndAddress{fullName firstName lastName address{addressString city state postalCode addressLineOne addressLineTwo country}}phone}pickupConfirmationNumber bannerMessage{...textFragment}}fragment refundPriceDetailsFragment on RefundPriceDetails{subTotal{__typename...orderPriceDetailRowFragment}fees{__typename...orderPriceDetailRowFragment}discounts{__typename...orderPriceDetailRowFragment}taxTotal{__typename...orderPriceDetailRowFragment}grandTotal{__typename...orderPriceDetailRowFragment}}fragment orderPriceDetailRowFragment on OrderPriceDetailRow{label displayValue value info{__typename title message}}fragment addressFragment on OrderAddress{addressString addressLineOne addressLineTwo state postalCode city}fragment ODPPickupInfo on OrderGroup{pickupInstructions pickupPerson{...person}alternatePickupPerson{...person}store{id name address{...addressFragment}}}fragment person on OrderPickupPerson{firstName lastName email}fragment ODPTippingInfo on OrderGroup{addTipMessage{...textFragment}driver{...DriverFragment}tipping{min{...price}max{...price}suggested{...price}preselected}subtotal{...price}}fragment orderActionFragment on Action{text url}fragment orderCustomer on OrderCustomer{id firstName lastName email isGuest isEmailRegistered}fragment OrderFieldsFragment on Order{__typename id version type customer{...orderCustomer}displayId idBarcodeImageUrl(barWidth:3 barHeight:100) isFuelPurchase title shortTitle timezone tippableGroup{...OrderGroupFragment}amendableGroup{id changeSlotIterationsLeft cutOffTimestamp fulfillmentType deliveryAddress{fullName firstName lastName address{addressString addressLineOne addressLineTwo state postalCode city country}}isAmendInProgress}substitutionsBanner{heading subheading longSubheading}groups_2101{__typename...OrderGroupFragment...ODPGroupFragment...ODPPickupInfo...ODPTippingInfo}multiboxBundles{...orderLineItem}itemCancelReasons{__typename...cancelReason}groupCancelReasons{__typename...cancelReason}priceDetails{__typename subTotal{__typename...priceDetailFragment}taxTotal{__typename...priceDetailFragment}grandTotal{__typename...priceDetailFragment}authorizationAmount{__typename...priceDetailFragment}fees{__typename...priceDetailFragment}discounts{__typename...priceDetailFragment}minimumThreshold{__typename...price}belowMinimumFee{__typename...priceDetailFragment}driverTip{__typename...priceDetailFragment}donations{__typename...priceDetailFragment}}paymentMethods{__typename description cardType paymentType displayValues message{...textFragment}actions{connectToCapitalOne{...orderActionFragment}visitAffirm{...orderActionFragment}}}actions{__typename return pendingReturn cancel startReturn{...orderActionFragment}reorder}banners{...textFragment}}","variables":{"orderId":"3372217488886","emailAddress":"pstewart@atlanticbb.net"}}' \
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
    echo "'3372217488886" >> track-OrderID.txt
    echo "pstewart@atlanticbb.net" >> track-email.txt
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
            if [[ `echo $curl18 | jq '.data.guestOrder.groups_2101['${i[@]}'].items['${j[@]}'].productInfo.usItemId'` == '"526913580"' ]]; then
                echo "'3372217488886" >> track-OrderID.txt
                echo pstewart@atlanticbb.net >> track-email.txt
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
        echo "'3372217488886" >> track-OrderID.txt
        echo "pstewart@atlanticbb.net" >> track-email.txt
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
  -H 'user-agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/98.0.4758.102 Safari/537.36 Edg/98.0.1108.62' \
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
    sum19=`md5 track-OrderID.txt`
    for (( i=0; i<=4; i++ ))
    do
        for (( j=0; j<=4; j++))
        do
            if [[ `echo $curl19 | jq '.data.guestOrder.groups_2101['${i[@]}'].items['${j[@]}'].productInfo.usItemId'` == '"811638922"' ]]; then
                echo "'3362216604530" >> track-OrderID.txt
                echo juliebean2006@yahoo.com >> track-email.txt
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
  -H 'user-agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/98.0.4758.102 Safari/537.36 Edg/98.0.1108.62' \
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
    sum20=`md5 track-OrderID.txt`
    for (( i=0; i<=4; i++ ))
    do
        for (( j=0; j<=4; j++))
        do
            if [[ `echo $curl20 | jq '.data.guestOrder.groups_2101['${i[@]}'].items['${j[@]}'].productInfo.usItemId'` == '"924227821"' ]]; then
                echo "'3362216909653" >> track-OrderID.txt
                echo brendajky@hotmail.com >> track-email.txt
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
  -H 'user-agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/98.0.4758.102 Safari/537.36 Edg/98.0.1108.62' \
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
  -H 'user-agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/98.0.4758.102 Safari/537.36 Edg/98.0.1108.62' \
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
    sum22=`md5 track-OrderID.txt`
    for (( i=0; i<=4; i++ ))
    do
        for (( j=0; j<=4; j++))
        do
            if [[ `echo $curl22 | jq '.data.guestOrder.groups_2101['${i[@]}'].items['${j[@]}'].productInfo.usItemId'` == '"171173804"' ]]; then
                echo "'3372217775315" >> track-OrderID.txt
                echo cremeans.j.i@gmail.com >> track-email.txt
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
  -H 'user-agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/98.0.4758.102 Safari/537.36 Edg/98.0.1108.62' \
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
  --data-raw $'{"query":"query getGuestOrder($orderId:ID\u0021 $emailAddress:String\u0021){guestOrder(input:{id:$orderId emailAddress:$emailAddress}){...OrderFieldsFragment}}fragment cancelReason on OrderCancelReason{__typename subReasonCode subDescription}fragment priceDetailFragment on OrderPriceDetailRow{label value displayValue info{title message}rowInfo{...orderPriceDetailRowInfo}}fragment orderPriceDetailRowInfo on OrderPriceDetailRowInfo{title message{...textFragment}}fragment price on Price{displayValue value}fragment variants on MapEntry{name value}fragment OrderAddOn on OrderAddOn{lineId uniqueLineId productInfo{name usItemId offerId}quantityString quantityLabel type fulfillmentInstructions{...textFragment}actions{manageProtectionPlan{...orderActionFragment}cancel}priceInfo{linePrice{...price}}quantity isActive}fragment orderDonationDetails on OrderDonationDetails{message{...textFragment}emailReceipt emailReceiptToken status{...textFragment}errorStatus}fragment orderLineItem on OrderLineItem{id uniqueId actions{contactSeller cancel addToCart configureCake reviewItem resendEGiftCardToken protectionPlan{...orderActionFragment}manageProtectionPlan{...orderActionFragment}}isGift digitalDeliveryMessage quantity quantityString quantityLabel isSubstitutionSelected fulfilledItems{id quantityString priceInfo{itemPrice{value}}productInfo{usItemId name}}isReturnable returnEligibilityMessage productInfo{name usItemId imageInfo{thumbnailUrl}canonicalUrl offerId orderLimit orderMinLimit weightIncrement salesUnit salesUnitType isSubstitutionEligible isAlcohol}reshop{reshopMessage isShippingAvailable minPromiseDate maxPromiseDate}selectedVariants{...variants}variantAdditionalInfo{parts{text nativeAction}}priceInfo{priceDisplayCodes{showItemPrice priceDisplayCondition finalCostByWeight}itemPrice{...price}linePrice{...price}unitPrice{...price}preDiscountedLinePrice{...price}additionalLines{name value}}discounts{label labelText{...textFragment}}itemReviewed activationCodes{label code}protectionPlanMessage{...textFragment}showSeller isShippedByWalmart seller{id name isPro}digitalDeliveryPhoneNumber addOns{...OrderAddOn}multiboxBundleId}fragment DriverFragment on Driver{id firstName photoUrl}fragment OrderGroupFragment on OrderGroup{driver{...DriverFragment}deliveryDate fulfillmentType status{...OrderGroupStatusFragment}showSeller isShippedByWalmart seller{...SellerFragment}id itemCount items{...LiteLineItemFragment}pickupPerson{firstName lastName email}accessPointId shipment{...ShipmentFragment}returnEligibilityMessage actions{...OrderGroupActionsFragment}recipientEmailAddress digitalDelivery{...DigitalDeliveryFragment}tireInstallationReservation{status extraText reservationId}}fragment OrderGroupStatusFragment on OrderGroupStatus{statusType showStatusTracker statusTracker{status label isCurrent}message{...textFragment}subtext subMessage{...textFragment}notice helpCenterText{...textFragment}}fragment textFragment on Text{parts{bold url text nativeAction lineBreak}}fragment LiteLineItemFragment on OrderLineItem{id quantity productInfo{name usItemId imageInfo{thumbnailUrl}offerId isAlcohol}priceInfo{linePrice{...price}}}fragment SellerFragment on GroupSeller{id name isPro}fragment DigitalDeliveryFragment on DigitalDelivery{title name instructions{...textFragment}}fragment ShipmentFragment on Shipment{id trackingNumber isExternalTracking trackingUrl proofOfDelivery{...ProofOfDeliveryFragment}}fragment OrderGroupActionsFragment on OrderGroupActions{reorder edit track changeSlot checkin editDeliveryInstructions editPickupPerson editTip tip rateDriver cancel enableTip{...orderActionFragment}enableEdit{...orderActionFragment}rescheduleTireInstall{...orderActionFragment}cancelTireInstall{...orderActionFragment}help viewCancellationDetails{...cancellationDetailsActionFragment}}fragment cancellationDetailsActionFragment on CancellationDetailsAction{label heading text{...textFragment}}fragment ProofOfDeliveryFragment on ProofOfDelivery{photoUrl photoPreviewUrl showPreview}fragment DeliveryInstructionsFragment on DeliveryInstructions{text type typeText}fragment GiftDetailsFragment on GiftDetails{recipientAddress{fullName}recipientEmail senderName giftMessage}fragment SubstitutionAction on SubstitutionAction{message label type}fragment ODPGroupCategoryFragment on OrderCategory{type name subtext returnMessage substitutionsBanner{...textFragment}showExtendedSubstitutions actions{substitutions{...SubstitutionAction}nilPickReshop{message action{text url}}returnDetails viewCancellationDetails{...cancellationDetailsActionFragment}trackOnInHomeApp}banner{...textFragment}accordionState items{...orderLineItem}substitutions{...orderLineItem fulfilledItems{...orderLineItem}}returnInfo{...returnInfoFragment}}fragment ODPGroupFragment on OrderGroup{id fulfillmentType deliveryMessage deliveryAddress{fullName firstName lastName address{...addressFragment}}deliveryInstructions{...DeliveryInstructionsFragment}deliveryPreferences{text{...textFragment}cta{...orderActionFragment}}editSubstitutionsCutOff status{statusType showStatusTracker message{...textFragment}notice helpCenterText{...textFragment}}itemCount isCategorized categories{...ODPGroupCategoryFragment}seller{id name isPro}shipment{id trackingNumber}actions{reorder edit track changeSlot checkin editDeliveryInstructions editPickupPerson tip cancel help enableTip{...orderActionFragment}enableEdit{...orderActionFragment}viewCancellationDetails{...cancellationDetailsActionFragment}enableInHome{...orderActionFragment}createGiftReceipt}cutOffTimestamp isEditSubstitutionsEligible isInHome giftDetails{...GiftDetailsFragment}donationDetails{...orderDonationDetails}}fragment returnInfoFragment on ReturnInfo{returnOrderId type refundPriceDetails{__typename...refundPriceDetailsFragment}refundMessage tierRefundMessage paymentMethods{__typename description cardType paymentType displayValues message{...textFragment}}actions{__typename generate scheduleOrModifyPickup{text url}reschedulePickup editPickupContact}shippingLabelUrl qrCodeImageUrl carriers{__typename id name}pickupCarrier pickupContact{nameAndAddress{fullName firstName lastName address{addressString city state postalCode addressLineOne addressLineTwo country}}phone}pickupConfirmationNumber bannerMessage{...textFragment}}fragment refundPriceDetailsFragment on RefundPriceDetails{subTotal{__typename...orderPriceDetailRowFragment}fees{__typename...orderPriceDetailRowFragment}discounts{__typename...orderPriceDetailRowFragment}taxTotal{__typename...orderPriceDetailRowFragment}grandTotal{__typename...orderPriceDetailRowFragment}}fragment orderPriceDetailRowFragment on OrderPriceDetailRow{label displayValue value info{__typename title message}}fragment addressFragment on OrderAddress{addressString addressLineOne addressLineTwo state postalCode city}fragment ODPPickupInfo on OrderGroup{pickupInstructions pickupPerson{...person}alternatePickupPerson{...person}store{id name address{...addressFragment}}}fragment person on OrderPickupPerson{firstName lastName email}fragment ODPTippingInfo on OrderGroup{addTipMessage{...textFragment}driver{...DriverFragment}tipping{min{...price}max{...price}suggested{...price}preselected}subtotal{...price}}fragment orderActionFragment on Action{text url}fragment orderCustomer on OrderCustomer{id firstName lastName email isGuest isEmailRegistered}fragment OrderFieldsFragment on Order{__typename id version type customer{...orderCustomer}displayId idBarcodeImageUrl(barWidth:3 barHeight:100) isFuelPurchase title shortTitle timezone tippableGroup{...OrderGroupFragment}amendableGroup{id changeSlotIterationsLeft cutOffTimestamp fulfillmentType deliveryAddress{fullName firstName lastName address{addressString addressLineOne addressLineTwo state postalCode city country}}isAmendInProgress}substitutionsBanner{heading subheading longSubheading}groups_2101{__typename...OrderGroupFragment...ODPGroupFragment...ODPPickupInfo...ODPTippingInfo}multiboxBundles{...orderLineItem}itemCancelReasons{__typename...cancelReason}groupCancelReasons{__typename...cancelReason}priceDetails{__typename subTotal{__typename...priceDetailFragment}taxTotal{__typename...priceDetailFragment}grandTotal{__typename...priceDetailFragment}authorizationAmount{__typename...priceDetailFragment}fees{__typename...priceDetailFragment}discounts{__typename...priceDetailFragment}minimumThreshold{__typename...price}belowMinimumFee{__typename...priceDetailFragment}driverTip{__typename...priceDetailFragment}donations{__typename...priceDetailFragment}}paymentMethods{__typename description cardType paymentType displayValues message{...textFragment}actions{connectToCapitalOne{...orderActionFragment}visitAffirm{...orderActionFragment}}}actions{__typename return pendingReturn cancel startReturn{...orderActionFragment}reorder}banners{...textFragment}}","variables":{"orderId":"3362216010689","emailAddress":"steph.stover78@gmail.com"}}' \
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
    echo "'3362216010689" >> track-OrderID.txt
    echo "steph.stover78@gmail.com" >> track-email.txt
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
            if [[ `echo $curl23 | jq '.data.guestOrder.groups_2101['${i[@]}'].items['${j[@]}'].productInfo.usItemId'` == '"759758517"' ]]; then
                echo "'3362216010689" >> track-OrderID.txt
                echo steph.stover78@gmail.com >> track-email.txt
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
        echo "'3362216010689" >> track-OrderID.txt
        echo "steph.stover78@gmail.com" >> track-email.txt
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
  -H 'user-agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/98.0.4758.102 Safari/537.36 Edg/98.0.1108.62' \
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
  --data-raw $'{"query":"query getGuestOrder($orderId:ID\u0021 $emailAddress:String\u0021){guestOrder(input:{id:$orderId emailAddress:$emailAddress}){...OrderFieldsFragment}}fragment cancelReason on OrderCancelReason{__typename subReasonCode subDescription}fragment priceDetailFragment on OrderPriceDetailRow{label value displayValue info{title message}rowInfo{...orderPriceDetailRowInfo}}fragment orderPriceDetailRowInfo on OrderPriceDetailRowInfo{title message{...textFragment}}fragment price on Price{displayValue value}fragment variants on MapEntry{name value}fragment OrderAddOn on OrderAddOn{lineId uniqueLineId productInfo{name usItemId offerId}quantityString quantityLabel type fulfillmentInstructions{...textFragment}actions{manageProtectionPlan{...orderActionFragment}cancel}priceInfo{linePrice{...price}}quantity isActive}fragment orderDonationDetails on OrderDonationDetails{message{...textFragment}emailReceipt emailReceiptToken status{...textFragment}errorStatus}fragment orderLineItem on OrderLineItem{id uniqueId actions{contactSeller cancel addToCart configureCake reviewItem resendEGiftCardToken protectionPlan{...orderActionFragment}manageProtectionPlan{...orderActionFragment}}isGift digitalDeliveryMessage quantity quantityString quantityLabel isSubstitutionSelected fulfilledItems{id quantityString priceInfo{itemPrice{value}}productInfo{usItemId name}}isReturnable returnEligibilityMessage productInfo{name usItemId imageInfo{thumbnailUrl}canonicalUrl offerId orderLimit orderMinLimit weightIncrement salesUnit salesUnitType isSubstitutionEligible isAlcohol}reshop{reshopMessage isShippingAvailable minPromiseDate maxPromiseDate}selectedVariants{...variants}variantAdditionalInfo{parts{text nativeAction}}priceInfo{priceDisplayCodes{showItemPrice priceDisplayCondition finalCostByWeight}itemPrice{...price}linePrice{...price}unitPrice{...price}preDiscountedLinePrice{...price}additionalLines{name value}}discounts{label labelText{...textFragment}}itemReviewed activationCodes{label code}protectionPlanMessage{...textFragment}showSeller isShippedByWalmart seller{id name isPro}digitalDeliveryPhoneNumber addOns{...OrderAddOn}multiboxBundleId}fragment DriverFragment on Driver{id firstName photoUrl}fragment OrderGroupFragment on OrderGroup{driver{...DriverFragment}deliveryDate fulfillmentType status{...OrderGroupStatusFragment}showSeller isShippedByWalmart seller{...SellerFragment}id itemCount items{...LiteLineItemFragment}pickupPerson{firstName lastName email}accessPointId shipment{...ShipmentFragment}returnEligibilityMessage actions{...OrderGroupActionsFragment}recipientEmailAddress digitalDelivery{...DigitalDeliveryFragment}tireInstallationReservation{status extraText reservationId}}fragment OrderGroupStatusFragment on OrderGroupStatus{statusType showStatusTracker statusTracker{status label isCurrent}message{...textFragment}subtext subMessage{...textFragment}notice helpCenterText{...textFragment}}fragment textFragment on Text{parts{bold url text nativeAction lineBreak}}fragment LiteLineItemFragment on OrderLineItem{id quantity productInfo{name usItemId imageInfo{thumbnailUrl}offerId isAlcohol}priceInfo{linePrice{...price}}}fragment SellerFragment on GroupSeller{id name isPro}fragment DigitalDeliveryFragment on DigitalDelivery{title name instructions{...textFragment}}fragment ShipmentFragment on Shipment{id trackingNumber isExternalTracking trackingUrl proofOfDelivery{...ProofOfDeliveryFragment}}fragment OrderGroupActionsFragment on OrderGroupActions{reorder edit track changeSlot checkin editDeliveryInstructions editPickupPerson editTip tip rateDriver cancel enableTip{...orderActionFragment}enableEdit{...orderActionFragment}rescheduleTireInstall{...orderActionFragment}cancelTireInstall{...orderActionFragment}help viewCancellationDetails{...cancellationDetailsActionFragment}}fragment cancellationDetailsActionFragment on CancellationDetailsAction{label heading text{...textFragment}}fragment ProofOfDeliveryFragment on ProofOfDelivery{photoUrl photoPreviewUrl showPreview}fragment DeliveryInstructionsFragment on DeliveryInstructions{text type typeText}fragment GiftDetailsFragment on GiftDetails{recipientAddress{fullName}recipientEmail senderName giftMessage}fragment SubstitutionAction on SubstitutionAction{message label type}fragment ODPGroupCategoryFragment on OrderCategory{type name subtext returnMessage substitutionsBanner{...textFragment}showExtendedSubstitutions actions{substitutions{...SubstitutionAction}nilPickReshop{message action{text url}}returnDetails viewCancellationDetails{...cancellationDetailsActionFragment}trackOnInHomeApp}banner{...textFragment}accordionState items{...orderLineItem}substitutions{...orderLineItem fulfilledItems{...orderLineItem}}returnInfo{...returnInfoFragment}}fragment ODPGroupFragment on OrderGroup{id fulfillmentType deliveryMessage deliveryAddress{fullName firstName lastName address{...addressFragment}}deliveryInstructions{...DeliveryInstructionsFragment}deliveryPreferences{text{...textFragment}cta{...orderActionFragment}}editSubstitutionsCutOff status{statusType showStatusTracker message{...textFragment}notice helpCenterText{...textFragment}}itemCount isCategorized categories{...ODPGroupCategoryFragment}seller{id name isPro}shipment{id trackingNumber}actions{reorder edit track changeSlot checkin editDeliveryInstructions editPickupPerson tip cancel help enableTip{...orderActionFragment}enableEdit{...orderActionFragment}viewCancellationDetails{...cancellationDetailsActionFragment}enableInHome{...orderActionFragment}createGiftReceipt}cutOffTimestamp isEditSubstitutionsEligible isInHome giftDetails{...GiftDetailsFragment}donationDetails{...orderDonationDetails}}fragment returnInfoFragment on ReturnInfo{returnOrderId type refundPriceDetails{__typename...refundPriceDetailsFragment}refundMessage tierRefundMessage paymentMethods{__typename description cardType paymentType displayValues message{...textFragment}}actions{__typename generate scheduleOrModifyPickup{text url}reschedulePickup editPickupContact}shippingLabelUrl qrCodeImageUrl carriers{__typename id name}pickupCarrier pickupContact{nameAndAddress{fullName firstName lastName address{addressString city state postalCode addressLineOne addressLineTwo country}}phone}pickupConfirmationNumber bannerMessage{...textFragment}}fragment refundPriceDetailsFragment on RefundPriceDetails{subTotal{__typename...orderPriceDetailRowFragment}fees{__typename...orderPriceDetailRowFragment}discounts{__typename...orderPriceDetailRowFragment}taxTotal{__typename...orderPriceDetailRowFragment}grandTotal{__typename...orderPriceDetailRowFragment}}fragment orderPriceDetailRowFragment on OrderPriceDetailRow{label displayValue value info{__typename title message}}fragment addressFragment on OrderAddress{addressString addressLineOne addressLineTwo state postalCode city}fragment ODPPickupInfo on OrderGroup{pickupInstructions pickupPerson{...person}alternatePickupPerson{...person}store{id name address{...addressFragment}}}fragment person on OrderPickupPerson{firstName lastName email}fragment ODPTippingInfo on OrderGroup{addTipMessage{...textFragment}driver{...DriverFragment}tipping{min{...price}max{...price}suggested{...price}preselected}subtotal{...price}}fragment orderActionFragment on Action{text url}fragment orderCustomer on OrderCustomer{id firstName lastName email isGuest isEmailRegistered}fragment OrderFieldsFragment on Order{__typename id version type customer{...orderCustomer}displayId idBarcodeImageUrl(barWidth:3 barHeight:100) isFuelPurchase title shortTitle timezone tippableGroup{...OrderGroupFragment}amendableGroup{id changeSlotIterationsLeft cutOffTimestamp fulfillmentType deliveryAddress{fullName firstName lastName address{addressString addressLineOne addressLineTwo state postalCode city country}}isAmendInProgress}substitutionsBanner{heading subheading longSubheading}groups_2101{__typename...OrderGroupFragment...ODPGroupFragment...ODPPickupInfo...ODPTippingInfo}multiboxBundles{...orderLineItem}itemCancelReasons{__typename...cancelReason}groupCancelReasons{__typename...cancelReason}priceDetails{__typename subTotal{__typename...priceDetailFragment}taxTotal{__typename...priceDetailFragment}grandTotal{__typename...priceDetailFragment}authorizationAmount{__typename...priceDetailFragment}fees{__typename...priceDetailFragment}discounts{__typename...priceDetailFragment}minimumThreshold{__typename...price}belowMinimumFee{__typename...priceDetailFragment}driverTip{__typename...priceDetailFragment}donations{__typename...priceDetailFragment}}paymentMethods{__typename description cardType paymentType displayValues message{...textFragment}actions{connectToCapitalOne{...orderActionFragment}visitAffirm{...orderActionFragment}}}actions{__typename return pendingReturn cancel startReturn{...orderActionFragment}reorder}banners{...textFragment}}","variables":{"orderId":"3362216415609","emailAddress":"dixbelladix@gmail.com"}}' \
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
    echo "'3362216415609" >> track-OrderID.txt
    echo "dixbelladix@gmail.com" >> track-email.txt
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
            if [[ `echo $curl24 | jq '.data.guestOrder.groups_2101['${i[@]}'].items['${j[@]}'].productInfo.usItemId'` == '"823244432"' ]]; then
                echo "'3362216415609" >> track-OrderID.txt
                echo dixbelladix@gmail.com >> track-email.txt
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
        echo "'3362216415609" >> track-OrderID.txt
        echo "dixbelladix@gmail.com" >> track-email.txt
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
  -H 'user-agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/98.0.4758.102 Safari/537.36 Edg/98.0.1108.62' \
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
  --data-raw $'{"query":"query getGuestOrder($orderId:ID\u0021 $emailAddress:String\u0021){guestOrder(input:{id:$orderId emailAddress:$emailAddress}){...OrderFieldsFragment}}fragment cancelReason on OrderCancelReason{__typename subReasonCode subDescription}fragment priceDetailFragment on OrderPriceDetailRow{label value displayValue info{title message}rowInfo{...orderPriceDetailRowInfo}}fragment orderPriceDetailRowInfo on OrderPriceDetailRowInfo{title message{...textFragment}}fragment price on Price{displayValue value}fragment variants on MapEntry{name value}fragment OrderAddOn on OrderAddOn{lineId uniqueLineId productInfo{name usItemId offerId}quantityString quantityLabel type fulfillmentInstructions{...textFragment}actions{manageProtectionPlan{...orderActionFragment}cancel}priceInfo{linePrice{...price}}quantity isActive}fragment orderDonationDetails on OrderDonationDetails{message{...textFragment}emailReceipt emailReceiptToken status{...textFragment}errorStatus}fragment orderLineItem on OrderLineItem{id uniqueId actions{contactSeller cancel addToCart configureCake reviewItem resendEGiftCardToken protectionPlan{...orderActionFragment}manageProtectionPlan{...orderActionFragment}}isGift digitalDeliveryMessage quantity quantityString quantityLabel isSubstitutionSelected fulfilledItems{id quantityString priceInfo{itemPrice{value}}productInfo{usItemId name}}isReturnable returnEligibilityMessage productInfo{name usItemId imageInfo{thumbnailUrl}canonicalUrl offerId orderLimit orderMinLimit weightIncrement salesUnit salesUnitType isSubstitutionEligible isAlcohol}reshop{reshopMessage isShippingAvailable minPromiseDate maxPromiseDate}selectedVariants{...variants}variantAdditionalInfo{parts{text nativeAction}}priceInfo{priceDisplayCodes{showItemPrice priceDisplayCondition finalCostByWeight}itemPrice{...price}linePrice{...price}unitPrice{...price}preDiscountedLinePrice{...price}additionalLines{name value}}discounts{label labelText{...textFragment}}itemReviewed activationCodes{label code}protectionPlanMessage{...textFragment}showSeller isShippedByWalmart seller{id name isPro}digitalDeliveryPhoneNumber addOns{...OrderAddOn}multiboxBundleId}fragment DriverFragment on Driver{id firstName photoUrl}fragment OrderGroupFragment on OrderGroup{driver{...DriverFragment}deliveryDate fulfillmentType status{...OrderGroupStatusFragment}showSeller isShippedByWalmart seller{...SellerFragment}id itemCount items{...LiteLineItemFragment}pickupPerson{firstName lastName email}accessPointId shipment{...ShipmentFragment}returnEligibilityMessage actions{...OrderGroupActionsFragment}recipientEmailAddress digitalDelivery{...DigitalDeliveryFragment}tireInstallationReservation{status extraText reservationId}}fragment OrderGroupStatusFragment on OrderGroupStatus{statusType showStatusTracker statusTracker{status label isCurrent}message{...textFragment}subtext subMessage{...textFragment}notice helpCenterText{...textFragment}}fragment textFragment on Text{parts{bold url text nativeAction lineBreak}}fragment LiteLineItemFragment on OrderLineItem{id quantity productInfo{name usItemId imageInfo{thumbnailUrl}offerId isAlcohol}priceInfo{linePrice{...price}}}fragment SellerFragment on GroupSeller{id name isPro}fragment DigitalDeliveryFragment on DigitalDelivery{title name instructions{...textFragment}}fragment ShipmentFragment on Shipment{id trackingNumber isExternalTracking trackingUrl proofOfDelivery{...ProofOfDeliveryFragment}}fragment OrderGroupActionsFragment on OrderGroupActions{reorder edit track changeSlot checkin editDeliveryInstructions editPickupPerson editTip tip rateDriver cancel enableTip{...orderActionFragment}enableEdit{...orderActionFragment}rescheduleTireInstall{...orderActionFragment}cancelTireInstall{...orderActionFragment}help viewCancellationDetails{...cancellationDetailsActionFragment}}fragment cancellationDetailsActionFragment on CancellationDetailsAction{label heading text{...textFragment}}fragment ProofOfDeliveryFragment on ProofOfDelivery{photoUrl photoPreviewUrl showPreview}fragment DeliveryInstructionsFragment on DeliveryInstructions{text type typeText}fragment GiftDetailsFragment on GiftDetails{recipientAddress{fullName}recipientEmail senderName giftMessage}fragment SubstitutionAction on SubstitutionAction{message label type}fragment ODPGroupCategoryFragment on OrderCategory{type name subtext returnMessage substitutionsBanner{...textFragment}showExtendedSubstitutions actions{substitutions{...SubstitutionAction}nilPickReshop{message action{text url}}returnDetails viewCancellationDetails{...cancellationDetailsActionFragment}trackOnInHomeApp}banner{...textFragment}accordionState items{...orderLineItem}substitutions{...orderLineItem fulfilledItems{...orderLineItem}}returnInfo{...returnInfoFragment}}fragment ODPGroupFragment on OrderGroup{id fulfillmentType deliveryMessage deliveryAddress{fullName firstName lastName address{...addressFragment}}deliveryInstructions{...DeliveryInstructionsFragment}deliveryPreferences{text{...textFragment}cta{...orderActionFragment}}editSubstitutionsCutOff status{statusType showStatusTracker message{...textFragment}notice helpCenterText{...textFragment}}itemCount isCategorized categories{...ODPGroupCategoryFragment}seller{id name isPro}shipment{id trackingNumber}actions{reorder edit track changeSlot checkin editDeliveryInstructions editPickupPerson tip cancel help enableTip{...orderActionFragment}enableEdit{...orderActionFragment}viewCancellationDetails{...cancellationDetailsActionFragment}enableInHome{...orderActionFragment}createGiftReceipt}cutOffTimestamp isEditSubstitutionsEligible isInHome giftDetails{...GiftDetailsFragment}donationDetails{...orderDonationDetails}}fragment returnInfoFragment on ReturnInfo{returnOrderId type refundPriceDetails{__typename...refundPriceDetailsFragment}refundMessage tierRefundMessage paymentMethods{__typename description cardType paymentType displayValues message{...textFragment}}actions{__typename generate scheduleOrModifyPickup{text url}reschedulePickup editPickupContact}shippingLabelUrl qrCodeImageUrl carriers{__typename id name}pickupCarrier pickupContact{nameAndAddress{fullName firstName lastName address{addressString city state postalCode addressLineOne addressLineTwo country}}phone}pickupConfirmationNumber bannerMessage{...textFragment}}fragment refundPriceDetailsFragment on RefundPriceDetails{subTotal{__typename...orderPriceDetailRowFragment}fees{__typename...orderPriceDetailRowFragment}discounts{__typename...orderPriceDetailRowFragment}taxTotal{__typename...orderPriceDetailRowFragment}grandTotal{__typename...orderPriceDetailRowFragment}}fragment orderPriceDetailRowFragment on OrderPriceDetailRow{label displayValue value info{__typename title message}}fragment addressFragment on OrderAddress{addressString addressLineOne addressLineTwo state postalCode city}fragment ODPPickupInfo on OrderGroup{pickupInstructions pickupPerson{...person}alternatePickupPerson{...person}store{id name address{...addressFragment}}}fragment person on OrderPickupPerson{firstName lastName email}fragment ODPTippingInfo on OrderGroup{addTipMessage{...textFragment}driver{...DriverFragment}tipping{min{...price}max{...price}suggested{...price}preselected}subtotal{...price}}fragment orderActionFragment on Action{text url}fragment orderCustomer on OrderCustomer{id firstName lastName email isGuest isEmailRegistered}fragment OrderFieldsFragment on Order{__typename id version type customer{...orderCustomer}displayId idBarcodeImageUrl(barWidth:3 barHeight:100) isFuelPurchase title shortTitle timezone tippableGroup{...OrderGroupFragment}amendableGroup{id changeSlotIterationsLeft cutOffTimestamp fulfillmentType deliveryAddress{fullName firstName lastName address{addressString addressLineOne addressLineTwo state postalCode city country}}isAmendInProgress}substitutionsBanner{heading subheading longSubheading}groups_2101{__typename...OrderGroupFragment...ODPGroupFragment...ODPPickupInfo...ODPTippingInfo}multiboxBundles{...orderLineItem}itemCancelReasons{__typename...cancelReason}groupCancelReasons{__typename...cancelReason}priceDetails{__typename subTotal{__typename...priceDetailFragment}taxTotal{__typename...priceDetailFragment}grandTotal{__typename...priceDetailFragment}authorizationAmount{__typename...priceDetailFragment}fees{__typename...priceDetailFragment}discounts{__typename...priceDetailFragment}minimumThreshold{__typename...price}belowMinimumFee{__typename...priceDetailFragment}driverTip{__typename...priceDetailFragment}donations{__typename...priceDetailFragment}}paymentMethods{__typename description cardType paymentType displayValues message{...textFragment}actions{connectToCapitalOne{...orderActionFragment}visitAffirm{...orderActionFragment}}}actions{__typename return pendingReturn cancel startReturn{...orderActionFragment}reorder}banners{...textFragment}}","variables":{"orderId":"3302203238152","emailAddress":"b21daking@gmail.com"}}' \
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
    echo "'3302203238152" >> track-OrderID.txt
    echo "b21daking@gmail.com" >> track-email.txt
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
            if [[ `echo $curl25 | jq '.data.guestOrder.groups_2101['${i[@]}'].items['${j[@]}'].productInfo.usItemId'` == '"645052254"' ]]; then
                echo "'3302203238152" >> track-OrderID.txt
                echo b21daking@gmail.com >> track-email.txt
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
        echo "'3302203238152" >> track-OrderID.txt
        echo "b21daking@gmail.com" >> track-email.txt
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
  -H 'user-agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/98.0.4758.102 Safari/537.36 Edg/98.0.1108.62' \
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
    sum26=`md5 track-OrderID.txt`
    for (( i=0; i<=4; i++ ))
    do
        for (( j=0; j<=4; j++))
        do
            if [[ `echo $curl26 | jq '.data.guestOrder.groups_2101['${i[@]}'].items['${j[@]}'].productInfo.usItemId'` == '"47063125"' ]]; then
                echo "'3302203146663" >> track-OrderID.txt
                echo crolly@cpapmyway.com >> track-email.txt
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
  -H 'user-agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/98.0.4758.102 Safari/537.36 Edg/98.0.1108.62' \
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
    sum27=`md5 track-OrderID.txt`
    for (( i=0; i<=4; i++ ))
    do
        for (( j=0; j<=4; j++))
        do
            if [[ `echo $curl27 | jq '.data.guestOrder.groups_2101['${i[@]}'].items['${j[@]}'].productInfo.usItemId'` == '"47062971"' ]]; then
                echo "'3302203146663" >> track-OrderID.txt
                echo crolly@cpapmyway.com >> track-email.txt
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
  -H 'user-agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/98.0.4758.102 Safari/537.36 Edg/98.0.1108.62' \
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
    sum28=`md5 track-OrderID.txt`
    for (( i=0; i<=4; i++ ))
    do
        for (( j=0; j<=4; j++))
        do
            if [[ `echo $curl28 | jq '.data.guestOrder.groups_2101['${i[@]}'].items['${j[@]}'].productInfo.usItemId'` == '"13997776"' ]]; then
                echo "'3372217480062" >> track-OrderID.txt
                echo dlstith001@aol.com >> track-email.txt
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
  -H 'user-agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/98.0.4758.102 Safari/537.36 Edg/98.0.1108.62' \
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
  --data-raw $'{"query":"query getGuestOrder($orderId:ID\u0021 $emailAddress:String\u0021){guestOrder(input:{id:$orderId emailAddress:$emailAddress}){...OrderFieldsFragment}}fragment cancelReason on OrderCancelReason{__typename subReasonCode subDescription}fragment priceDetailFragment on OrderPriceDetailRow{label value displayValue info{title message}rowInfo{...orderPriceDetailRowInfo}}fragment orderPriceDetailRowInfo on OrderPriceDetailRowInfo{title message{...textFragment}}fragment price on Price{displayValue value}fragment variants on MapEntry{name value}fragment OrderAddOn on OrderAddOn{lineId uniqueLineId productInfo{name usItemId offerId}quantityString quantityLabel type fulfillmentInstructions{...textFragment}actions{manageProtectionPlan{...orderActionFragment}cancel}priceInfo{linePrice{...price}}quantity isActive}fragment orderDonationDetails on OrderDonationDetails{message{...textFragment}emailReceipt emailReceiptToken status{...textFragment}errorStatus}fragment orderLineItem on OrderLineItem{id uniqueId actions{contactSeller cancel addToCart configureCake reviewItem resendEGiftCardToken protectionPlan{...orderActionFragment}manageProtectionPlan{...orderActionFragment}}isGift digitalDeliveryMessage quantity quantityString quantityLabel isSubstitutionSelected fulfilledItems{id quantityString priceInfo{itemPrice{value}}productInfo{usItemId name}}isReturnable returnEligibilityMessage productInfo{name usItemId imageInfo{thumbnailUrl}canonicalUrl offerId orderLimit orderMinLimit weightIncrement salesUnit salesUnitType isSubstitutionEligible isAlcohol}reshop{reshopMessage isShippingAvailable minPromiseDate maxPromiseDate}selectedVariants{...variants}variantAdditionalInfo{parts{text nativeAction}}priceInfo{priceDisplayCodes{showItemPrice priceDisplayCondition finalCostByWeight}itemPrice{...price}linePrice{...price}unitPrice{...price}preDiscountedLinePrice{...price}additionalLines{name value}}discounts{label labelText{...textFragment}}itemReviewed activationCodes{label code}protectionPlanMessage{...textFragment}showSeller isShippedByWalmart seller{id name isPro}digitalDeliveryPhoneNumber addOns{...OrderAddOn}multiboxBundleId}fragment DriverFragment on Driver{id firstName photoUrl}fragment OrderGroupFragment on OrderGroup{driver{...DriverFragment}deliveryDate fulfillmentType status{...OrderGroupStatusFragment}showSeller isShippedByWalmart seller{...SellerFragment}id itemCount items{...LiteLineItemFragment}pickupPerson{firstName lastName email}accessPointId shipment{...ShipmentFragment}returnEligibilityMessage actions{...OrderGroupActionsFragment}recipientEmailAddress digitalDelivery{...DigitalDeliveryFragment}tireInstallationReservation{status extraText reservationId}}fragment OrderGroupStatusFragment on OrderGroupStatus{statusType showStatusTracker statusTracker{status label isCurrent}message{...textFragment}subtext subMessage{...textFragment}notice helpCenterText{...textFragment}}fragment textFragment on Text{parts{bold url text nativeAction lineBreak}}fragment LiteLineItemFragment on OrderLineItem{id quantity productInfo{name usItemId imageInfo{thumbnailUrl}offerId isAlcohol}priceInfo{linePrice{...price}}}fragment SellerFragment on GroupSeller{id name isPro}fragment DigitalDeliveryFragment on DigitalDelivery{title name instructions{...textFragment}}fragment ShipmentFragment on Shipment{id trackingNumber isExternalTracking trackingUrl proofOfDelivery{...ProofOfDeliveryFragment}}fragment OrderGroupActionsFragment on OrderGroupActions{reorder edit track changeSlot checkin editDeliveryInstructions editPickupPerson editTip tip rateDriver cancel enableTip{...orderActionFragment}enableEdit{...orderActionFragment}rescheduleTireInstall{...orderActionFragment}cancelTireInstall{...orderActionFragment}help viewCancellationDetails{...cancellationDetailsActionFragment}}fragment cancellationDetailsActionFragment on CancellationDetailsAction{label heading text{...textFragment}}fragment ProofOfDeliveryFragment on ProofOfDelivery{photoUrl photoPreviewUrl showPreview}fragment DeliveryInstructionsFragment on DeliveryInstructions{text type typeText}fragment GiftDetailsFragment on GiftDetails{recipientAddress{fullName}recipientEmail senderName giftMessage}fragment SubstitutionAction on SubstitutionAction{message label type}fragment ODPGroupCategoryFragment on OrderCategory{type name subtext returnMessage substitutionsBanner{...textFragment}showExtendedSubstitutions actions{substitutions{...SubstitutionAction}nilPickReshop{message action{text url}}returnDetails viewCancellationDetails{...cancellationDetailsActionFragment}trackOnInHomeApp}banner{...textFragment}accordionState items{...orderLineItem}substitutions{...orderLineItem fulfilledItems{...orderLineItem}}returnInfo{...returnInfoFragment}}fragment ODPGroupFragment on OrderGroup{id fulfillmentType deliveryMessage deliveryAddress{fullName firstName lastName address{...addressFragment}}deliveryInstructions{...DeliveryInstructionsFragment}deliveryPreferences{text{...textFragment}cta{...orderActionFragment}}editSubstitutionsCutOff status{statusType showStatusTracker message{...textFragment}notice helpCenterText{...textFragment}}itemCount isCategorized categories{...ODPGroupCategoryFragment}seller{id name isPro}shipment{id trackingNumber}actions{reorder edit track changeSlot checkin editDeliveryInstructions editPickupPerson tip cancel help enableTip{...orderActionFragment}enableEdit{...orderActionFragment}viewCancellationDetails{...cancellationDetailsActionFragment}enableInHome{...orderActionFragment}createGiftReceipt}cutOffTimestamp isEditSubstitutionsEligible isInHome giftDetails{...GiftDetailsFragment}donationDetails{...orderDonationDetails}}fragment returnInfoFragment on ReturnInfo{returnOrderId type refundPriceDetails{__typename...refundPriceDetailsFragment}refundMessage tierRefundMessage paymentMethods{__typename description cardType paymentType displayValues message{...textFragment}}actions{__typename generate scheduleOrModifyPickup{text url}reschedulePickup editPickupContact}shippingLabelUrl qrCodeImageUrl carriers{__typename id name}pickupCarrier pickupContact{nameAndAddress{fullName firstName lastName address{addressString city state postalCode addressLineOne addressLineTwo country}}phone}pickupConfirmationNumber bannerMessage{...textFragment}}fragment refundPriceDetailsFragment on RefundPriceDetails{subTotal{__typename...orderPriceDetailRowFragment}fees{__typename...orderPriceDetailRowFragment}discounts{__typename...orderPriceDetailRowFragment}taxTotal{__typename...orderPriceDetailRowFragment}grandTotal{__typename...orderPriceDetailRowFragment}}fragment orderPriceDetailRowFragment on OrderPriceDetailRow{label displayValue value info{__typename title message}}fragment addressFragment on OrderAddress{addressString addressLineOne addressLineTwo state postalCode city}fragment ODPPickupInfo on OrderGroup{pickupInstructions pickupPerson{...person}alternatePickupPerson{...person}store{id name address{...addressFragment}}}fragment person on OrderPickupPerson{firstName lastName email}fragment ODPTippingInfo on OrderGroup{addTipMessage{...textFragment}driver{...DriverFragment}tipping{min{...price}max{...price}suggested{...price}preselected}subtotal{...price}}fragment orderActionFragment on Action{text url}fragment orderCustomer on OrderCustomer{id firstName lastName email isGuest isEmailRegistered}fragment OrderFieldsFragment on Order{__typename id version type customer{...orderCustomer}displayId idBarcodeImageUrl(barWidth:3 barHeight:100) isFuelPurchase title shortTitle timezone tippableGroup{...OrderGroupFragment}amendableGroup{id changeSlotIterationsLeft cutOffTimestamp fulfillmentType deliveryAddress{fullName firstName lastName address{addressString addressLineOne addressLineTwo state postalCode city country}}isAmendInProgress}substitutionsBanner{heading subheading longSubheading}groups_2101{__typename...OrderGroupFragment...ODPGroupFragment...ODPPickupInfo...ODPTippingInfo}multiboxBundles{...orderLineItem}itemCancelReasons{__typename...cancelReason}groupCancelReasons{__typename...cancelReason}priceDetails{__typename subTotal{__typename...priceDetailFragment}taxTotal{__typename...priceDetailFragment}grandTotal{__typename...priceDetailFragment}authorizationAmount{__typename...priceDetailFragment}fees{__typename...priceDetailFragment}discounts{__typename...priceDetailFragment}minimumThreshold{__typename...price}belowMinimumFee{__typename...priceDetailFragment}driverTip{__typename...priceDetailFragment}donations{__typename...priceDetailFragment}}paymentMethods{__typename description cardType paymentType displayValues message{...textFragment}actions{connectToCapitalOne{...orderActionFragment}visitAffirm{...orderActionFragment}}}actions{__typename return pendingReturn cancel startReturn{...orderActionFragment}reorder}banners{...textFragment}}","variables":{"orderId":"3372217699685","emailAddress":"lauren4134@aol.com"}}' \
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
    echo "'3372217699685" >> track-OrderID.txt
    echo "lauren4134@aol.com" >> track-email.txt
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
            if [[ `echo $curl29 | jq '.data.guestOrder.groups_2101['${i[@]}'].items['${j[@]}'].productInfo.usItemId'` == '"175041181"' ]]; then
                echo "'3372217699685" >> track-OrderID.txt
                echo lauren4134@aol.com >> track-email.txt
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
        echo "'3372217699685" >> track-OrderID.txt
        echo "lauren4134@aol.com" >> track-email.txt
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
  -H 'user-agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/98.0.4758.102 Safari/537.36 Edg/98.0.1108.62' \
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
  --data-raw $'{"query":"query getGuestOrder($orderId:ID\u0021 $emailAddress:String\u0021){guestOrder(input:{id:$orderId emailAddress:$emailAddress}){...OrderFieldsFragment}}fragment cancelReason on OrderCancelReason{__typename subReasonCode subDescription}fragment priceDetailFragment on OrderPriceDetailRow{label value displayValue info{title message}rowInfo{...orderPriceDetailRowInfo}}fragment orderPriceDetailRowInfo on OrderPriceDetailRowInfo{title message{...textFragment}}fragment price on Price{displayValue value}fragment variants on MapEntry{name value}fragment OrderAddOn on OrderAddOn{lineId uniqueLineId productInfo{name usItemId offerId}quantityString quantityLabel type fulfillmentInstructions{...textFragment}actions{manageProtectionPlan{...orderActionFragment}cancel}priceInfo{linePrice{...price}}quantity isActive}fragment orderDonationDetails on OrderDonationDetails{message{...textFragment}emailReceipt emailReceiptToken status{...textFragment}errorStatus}fragment orderLineItem on OrderLineItem{id uniqueId actions{contactSeller cancel addToCart configureCake reviewItem resendEGiftCardToken protectionPlan{...orderActionFragment}manageProtectionPlan{...orderActionFragment}}isGift digitalDeliveryMessage quantity quantityString quantityLabel isSubstitutionSelected fulfilledItems{id quantityString priceInfo{itemPrice{value}}productInfo{usItemId name}}isReturnable returnEligibilityMessage productInfo{name usItemId imageInfo{thumbnailUrl}canonicalUrl offerId orderLimit orderMinLimit weightIncrement salesUnit salesUnitType isSubstitutionEligible isAlcohol}reshop{reshopMessage isShippingAvailable minPromiseDate maxPromiseDate}selectedVariants{...variants}variantAdditionalInfo{parts{text nativeAction}}priceInfo{priceDisplayCodes{showItemPrice priceDisplayCondition finalCostByWeight}itemPrice{...price}linePrice{...price}unitPrice{...price}preDiscountedLinePrice{...price}additionalLines{name value}}discounts{label labelText{...textFragment}}itemReviewed activationCodes{label code}protectionPlanMessage{...textFragment}showSeller isShippedByWalmart seller{id name isPro}digitalDeliveryPhoneNumber addOns{...OrderAddOn}multiboxBundleId}fragment DriverFragment on Driver{id firstName photoUrl}fragment OrderGroupFragment on OrderGroup{driver{...DriverFragment}deliveryDate fulfillmentType status{...OrderGroupStatusFragment}showSeller isShippedByWalmart seller{...SellerFragment}id itemCount items{...LiteLineItemFragment}pickupPerson{firstName lastName email}accessPointId shipment{...ShipmentFragment}returnEligibilityMessage actions{...OrderGroupActionsFragment}recipientEmailAddress digitalDelivery{...DigitalDeliveryFragment}tireInstallationReservation{status extraText reservationId}}fragment OrderGroupStatusFragment on OrderGroupStatus{statusType showStatusTracker statusTracker{status label isCurrent}message{...textFragment}subtext subMessage{...textFragment}notice helpCenterText{...textFragment}}fragment textFragment on Text{parts{bold url text nativeAction lineBreak}}fragment LiteLineItemFragment on OrderLineItem{id quantity productInfo{name usItemId imageInfo{thumbnailUrl}offerId isAlcohol}priceInfo{linePrice{...price}}}fragment SellerFragment on GroupSeller{id name isPro}fragment DigitalDeliveryFragment on DigitalDelivery{title name instructions{...textFragment}}fragment ShipmentFragment on Shipment{id trackingNumber isExternalTracking trackingUrl proofOfDelivery{...ProofOfDeliveryFragment}}fragment OrderGroupActionsFragment on OrderGroupActions{reorder edit track changeSlot checkin editDeliveryInstructions editPickupPerson editTip tip rateDriver cancel enableTip{...orderActionFragment}enableEdit{...orderActionFragment}rescheduleTireInstall{...orderActionFragment}cancelTireInstall{...orderActionFragment}help viewCancellationDetails{...cancellationDetailsActionFragment}}fragment cancellationDetailsActionFragment on CancellationDetailsAction{label heading text{...textFragment}}fragment ProofOfDeliveryFragment on ProofOfDelivery{photoUrl photoPreviewUrl showPreview}fragment DeliveryInstructionsFragment on DeliveryInstructions{text type typeText}fragment GiftDetailsFragment on GiftDetails{recipientAddress{fullName}recipientEmail senderName giftMessage}fragment SubstitutionAction on SubstitutionAction{message label type}fragment ODPGroupCategoryFragment on OrderCategory{type name subtext returnMessage substitutionsBanner{...textFragment}showExtendedSubstitutions actions{substitutions{...SubstitutionAction}nilPickReshop{message action{text url}}returnDetails viewCancellationDetails{...cancellationDetailsActionFragment}trackOnInHomeApp}banner{...textFragment}accordionState items{...orderLineItem}substitutions{...orderLineItem fulfilledItems{...orderLineItem}}returnInfo{...returnInfoFragment}}fragment ODPGroupFragment on OrderGroup{id fulfillmentType deliveryMessage deliveryAddress{fullName firstName lastName address{...addressFragment}}deliveryInstructions{...DeliveryInstructionsFragment}deliveryPreferences{text{...textFragment}cta{...orderActionFragment}}editSubstitutionsCutOff status{statusType showStatusTracker message{...textFragment}notice helpCenterText{...textFragment}}itemCount isCategorized categories{...ODPGroupCategoryFragment}seller{id name isPro}shipment{id trackingNumber}actions{reorder edit track changeSlot checkin editDeliveryInstructions editPickupPerson tip cancel help enableTip{...orderActionFragment}enableEdit{...orderActionFragment}viewCancellationDetails{...cancellationDetailsActionFragment}enableInHome{...orderActionFragment}createGiftReceipt}cutOffTimestamp isEditSubstitutionsEligible isInHome giftDetails{...GiftDetailsFragment}donationDetails{...orderDonationDetails}}fragment returnInfoFragment on ReturnInfo{returnOrderId type refundPriceDetails{__typename...refundPriceDetailsFragment}refundMessage tierRefundMessage paymentMethods{__typename description cardType paymentType displayValues message{...textFragment}}actions{__typename generate scheduleOrModifyPickup{text url}reschedulePickup editPickupContact}shippingLabelUrl qrCodeImageUrl carriers{__typename id name}pickupCarrier pickupContact{nameAndAddress{fullName firstName lastName address{addressString city state postalCode addressLineOne addressLineTwo country}}phone}pickupConfirmationNumber bannerMessage{...textFragment}}fragment refundPriceDetailsFragment on RefundPriceDetails{subTotal{__typename...orderPriceDetailRowFragment}fees{__typename...orderPriceDetailRowFragment}discounts{__typename...orderPriceDetailRowFragment}taxTotal{__typename...orderPriceDetailRowFragment}grandTotal{__typename...orderPriceDetailRowFragment}}fragment orderPriceDetailRowFragment on OrderPriceDetailRow{label displayValue value info{__typename title message}}fragment addressFragment on OrderAddress{addressString addressLineOne addressLineTwo state postalCode city}fragment ODPPickupInfo on OrderGroup{pickupInstructions pickupPerson{...person}alternatePickupPerson{...person}store{id name address{...addressFragment}}}fragment person on OrderPickupPerson{firstName lastName email}fragment ODPTippingInfo on OrderGroup{addTipMessage{...textFragment}driver{...DriverFragment}tipping{min{...price}max{...price}suggested{...price}preselected}subtotal{...price}}fragment orderActionFragment on Action{text url}fragment orderCustomer on OrderCustomer{id firstName lastName email isGuest isEmailRegistered}fragment OrderFieldsFragment on Order{__typename id version type customer{...orderCustomer}displayId idBarcodeImageUrl(barWidth:3 barHeight:100) isFuelPurchase title shortTitle timezone tippableGroup{...OrderGroupFragment}amendableGroup{id changeSlotIterationsLeft cutOffTimestamp fulfillmentType deliveryAddress{fullName firstName lastName address{addressString addressLineOne addressLineTwo state postalCode city country}}isAmendInProgress}substitutionsBanner{heading subheading longSubheading}groups_2101{__typename...OrderGroupFragment...ODPGroupFragment...ODPPickupInfo...ODPTippingInfo}multiboxBundles{...orderLineItem}itemCancelReasons{__typename...cancelReason}groupCancelReasons{__typename...cancelReason}priceDetails{__typename subTotal{__typename...priceDetailFragment}taxTotal{__typename...priceDetailFragment}grandTotal{__typename...priceDetailFragment}authorizationAmount{__typename...priceDetailFragment}fees{__typename...priceDetailFragment}discounts{__typename...priceDetailFragment}minimumThreshold{__typename...price}belowMinimumFee{__typename...priceDetailFragment}driverTip{__typename...priceDetailFragment}donations{__typename...priceDetailFragment}}paymentMethods{__typename description cardType paymentType displayValues message{...textFragment}actions{connectToCapitalOne{...orderActionFragment}visitAffirm{...orderActionFragment}}}actions{__typename return pendingReturn cancel startReturn{...orderActionFragment}reorder}banners{...textFragment}}","variables":{"orderId":"3352214074054","emailAddress":"autumndancer9@gmail.com"}}' \
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
    echo "'3352214074054" >> track-OrderID.txt
    echo "autumndancer9@gmail.com" >> track-email.txt
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
            if [[ `echo $curl30 | jq '.data.guestOrder.groups_2101['${i[@]}'].items['${j[@]}'].productInfo.usItemId'` == '"680614474"' ]]; then
                echo "'3352214074054" >> track-OrderID.txt
                echo autumndancer9@gmail.com >> track-email.txt
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
        echo "'3352214074054" >> track-OrderID.txt
        echo "autumndancer9@gmail.com" >> track-email.txt
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
  -H 'user-agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/98.0.4758.102 Safari/537.36 Edg/98.0.1108.62' \
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
  --data-raw $'{"query":"query getGuestOrder($orderId:ID\u0021 $emailAddress:String\u0021){guestOrder(input:{id:$orderId emailAddress:$emailAddress}){...OrderFieldsFragment}}fragment cancelReason on OrderCancelReason{__typename subReasonCode subDescription}fragment priceDetailFragment on OrderPriceDetailRow{label value displayValue info{title message}rowInfo{...orderPriceDetailRowInfo}}fragment orderPriceDetailRowInfo on OrderPriceDetailRowInfo{title message{...textFragment}}fragment price on Price{displayValue value}fragment variants on MapEntry{name value}fragment OrderAddOn on OrderAddOn{lineId uniqueLineId productInfo{name usItemId offerId}quantityString quantityLabel type fulfillmentInstructions{...textFragment}actions{manageProtectionPlan{...orderActionFragment}cancel}priceInfo{linePrice{...price}}quantity isActive}fragment orderDonationDetails on OrderDonationDetails{message{...textFragment}emailReceipt emailReceiptToken status{...textFragment}errorStatus}fragment orderLineItem on OrderLineItem{id uniqueId actions{contactSeller cancel addToCart configureCake reviewItem resendEGiftCardToken protectionPlan{...orderActionFragment}manageProtectionPlan{...orderActionFragment}}isGift digitalDeliveryMessage quantity quantityString quantityLabel isSubstitutionSelected fulfilledItems{id quantityString priceInfo{itemPrice{value}}productInfo{usItemId name}}isReturnable returnEligibilityMessage productInfo{name usItemId imageInfo{thumbnailUrl}canonicalUrl offerId orderLimit orderMinLimit weightIncrement salesUnit salesUnitType isSubstitutionEligible isAlcohol}reshop{reshopMessage isShippingAvailable minPromiseDate maxPromiseDate}selectedVariants{...variants}variantAdditionalInfo{parts{text nativeAction}}priceInfo{priceDisplayCodes{showItemPrice priceDisplayCondition finalCostByWeight}itemPrice{...price}linePrice{...price}unitPrice{...price}preDiscountedLinePrice{...price}additionalLines{name value}}discounts{label labelText{...textFragment}}itemReviewed activationCodes{label code}protectionPlanMessage{...textFragment}showSeller isShippedByWalmart seller{id name isPro}digitalDeliveryPhoneNumber addOns{...OrderAddOn}multiboxBundleId}fragment DriverFragment on Driver{id firstName photoUrl}fragment OrderGroupFragment on OrderGroup{driver{...DriverFragment}deliveryDate fulfillmentType status{...OrderGroupStatusFragment}showSeller isShippedByWalmart seller{...SellerFragment}id itemCount items{...LiteLineItemFragment}pickupPerson{firstName lastName email}accessPointId shipment{...ShipmentFragment}returnEligibilityMessage actions{...OrderGroupActionsFragment}recipientEmailAddress digitalDelivery{...DigitalDeliveryFragment}tireInstallationReservation{status extraText reservationId}}fragment OrderGroupStatusFragment on OrderGroupStatus{statusType showStatusTracker statusTracker{status label isCurrent}message{...textFragment}subtext subMessage{...textFragment}notice helpCenterText{...textFragment}}fragment textFragment on Text{parts{bold url text nativeAction lineBreak}}fragment LiteLineItemFragment on OrderLineItem{id quantity productInfo{name usItemId imageInfo{thumbnailUrl}offerId isAlcohol}priceInfo{linePrice{...price}}}fragment SellerFragment on GroupSeller{id name isPro}fragment DigitalDeliveryFragment on DigitalDelivery{title name instructions{...textFragment}}fragment ShipmentFragment on Shipment{id trackingNumber isExternalTracking trackingUrl proofOfDelivery{...ProofOfDeliveryFragment}}fragment OrderGroupActionsFragment on OrderGroupActions{reorder edit track changeSlot checkin editDeliveryInstructions editPickupPerson editTip tip rateDriver cancel enableTip{...orderActionFragment}enableEdit{...orderActionFragment}rescheduleTireInstall{...orderActionFragment}cancelTireInstall{...orderActionFragment}help viewCancellationDetails{...cancellationDetailsActionFragment}}fragment cancellationDetailsActionFragment on CancellationDetailsAction{label heading text{...textFragment}}fragment ProofOfDeliveryFragment on ProofOfDelivery{photoUrl photoPreviewUrl showPreview}fragment DeliveryInstructionsFragment on DeliveryInstructions{text type typeText}fragment GiftDetailsFragment on GiftDetails{recipientAddress{fullName}recipientEmail senderName giftMessage}fragment SubstitutionAction on SubstitutionAction{message label type}fragment ODPGroupCategoryFragment on OrderCategory{type name subtext returnMessage substitutionsBanner{...textFragment}showExtendedSubstitutions actions{substitutions{...SubstitutionAction}nilPickReshop{message action{text url}}returnDetails viewCancellationDetails{...cancellationDetailsActionFragment}trackOnInHomeApp}banner{...textFragment}accordionState items{...orderLineItem}substitutions{...orderLineItem fulfilledItems{...orderLineItem}}returnInfo{...returnInfoFragment}}fragment ODPGroupFragment on OrderGroup{id fulfillmentType deliveryMessage deliveryAddress{fullName firstName lastName address{...addressFragment}}deliveryInstructions{...DeliveryInstructionsFragment}deliveryPreferences{text{...textFragment}cta{...orderActionFragment}}editSubstitutionsCutOff status{statusType showStatusTracker message{...textFragment}notice helpCenterText{...textFragment}}itemCount isCategorized categories{...ODPGroupCategoryFragment}seller{id name isPro}shipment{id trackingNumber}actions{reorder edit track changeSlot checkin editDeliveryInstructions editPickupPerson tip cancel help enableTip{...orderActionFragment}enableEdit{...orderActionFragment}viewCancellationDetails{...cancellationDetailsActionFragment}enableInHome{...orderActionFragment}createGiftReceipt}cutOffTimestamp isEditSubstitutionsEligible isInHome giftDetails{...GiftDetailsFragment}donationDetails{...orderDonationDetails}}fragment returnInfoFragment on ReturnInfo{returnOrderId type refundPriceDetails{__typename...refundPriceDetailsFragment}refundMessage tierRefundMessage paymentMethods{__typename description cardType paymentType displayValues message{...textFragment}}actions{__typename generate scheduleOrModifyPickup{text url}reschedulePickup editPickupContact}shippingLabelUrl qrCodeImageUrl carriers{__typename id name}pickupCarrier pickupContact{nameAndAddress{fullName firstName lastName address{addressString city state postalCode addressLineOne addressLineTwo country}}phone}pickupConfirmationNumber bannerMessage{...textFragment}}fragment refundPriceDetailsFragment on RefundPriceDetails{subTotal{__typename...orderPriceDetailRowFragment}fees{__typename...orderPriceDetailRowFragment}discounts{__typename...orderPriceDetailRowFragment}taxTotal{__typename...orderPriceDetailRowFragment}grandTotal{__typename...orderPriceDetailRowFragment}}fragment orderPriceDetailRowFragment on OrderPriceDetailRow{label displayValue value info{__typename title message}}fragment addressFragment on OrderAddress{addressString addressLineOne addressLineTwo state postalCode city}fragment ODPPickupInfo on OrderGroup{pickupInstructions pickupPerson{...person}alternatePickupPerson{...person}store{id name address{...addressFragment}}}fragment person on OrderPickupPerson{firstName lastName email}fragment ODPTippingInfo on OrderGroup{addTipMessage{...textFragment}driver{...DriverFragment}tipping{min{...price}max{...price}suggested{...price}preselected}subtotal{...price}}fragment orderActionFragment on Action{text url}fragment orderCustomer on OrderCustomer{id firstName lastName email isGuest isEmailRegistered}fragment OrderFieldsFragment on Order{__typename id version type customer{...orderCustomer}displayId idBarcodeImageUrl(barWidth:3 barHeight:100) isFuelPurchase title shortTitle timezone tippableGroup{...OrderGroupFragment}amendableGroup{id changeSlotIterationsLeft cutOffTimestamp fulfillmentType deliveryAddress{fullName firstName lastName address{addressString addressLineOne addressLineTwo state postalCode city country}}isAmendInProgress}substitutionsBanner{heading subheading longSubheading}groups_2101{__typename...OrderGroupFragment...ODPGroupFragment...ODPPickupInfo...ODPTippingInfo}multiboxBundles{...orderLineItem}itemCancelReasons{__typename...cancelReason}groupCancelReasons{__typename...cancelReason}priceDetails{__typename subTotal{__typename...priceDetailFragment}taxTotal{__typename...priceDetailFragment}grandTotal{__typename...priceDetailFragment}authorizationAmount{__typename...priceDetailFragment}fees{__typename...priceDetailFragment}discounts{__typename...priceDetailFragment}minimumThreshold{__typename...price}belowMinimumFee{__typename...priceDetailFragment}driverTip{__typename...priceDetailFragment}donations{__typename...priceDetailFragment}}paymentMethods{__typename description cardType paymentType displayValues message{...textFragment}actions{connectToCapitalOne{...orderActionFragment}visitAffirm{...orderActionFragment}}}actions{__typename return pendingReturn cancel startReturn{...orderActionFragment}reorder}banners{...textFragment}}","variables":{"orderId":"3352214559893","emailAddress":"elreid1999@gmail.com"}}' \
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
    echo "'3352214559893" >> track-OrderID.txt
    echo "elreid1999@gmail.com" >> track-email.txt
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
            if [[ `echo $curl31 | jq '.data.guestOrder.groups_2101['${i[@]}'].items['${j[@]}'].productInfo.usItemId'` == '"947870483"' ]]; then
                echo "'3352214559893" >> track-OrderID.txt
                echo elreid1999@gmail.com >> track-email.txt
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
        echo "'3352214559893" >> track-OrderID.txt
        echo "elreid1999@gmail.com" >> track-email.txt
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
  -H 'user-agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/98.0.4758.102 Safari/537.36 Edg/98.0.1108.62' \
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
  --data-raw $'{"query":"query getGuestOrder($orderId:ID\u0021 $emailAddress:String\u0021){guestOrder(input:{id:$orderId emailAddress:$emailAddress}){...OrderFieldsFragment}}fragment cancelReason on OrderCancelReason{__typename subReasonCode subDescription}fragment priceDetailFragment on OrderPriceDetailRow{label value displayValue info{title message}rowInfo{...orderPriceDetailRowInfo}}fragment orderPriceDetailRowInfo on OrderPriceDetailRowInfo{title message{...textFragment}}fragment price on Price{displayValue value}fragment variants on MapEntry{name value}fragment OrderAddOn on OrderAddOn{lineId uniqueLineId productInfo{name usItemId offerId}quantityString quantityLabel type fulfillmentInstructions{...textFragment}actions{manageProtectionPlan{...orderActionFragment}cancel}priceInfo{linePrice{...price}}quantity isActive}fragment orderDonationDetails on OrderDonationDetails{message{...textFragment}emailReceipt emailReceiptToken status{...textFragment}errorStatus}fragment orderLineItem on OrderLineItem{id uniqueId actions{contactSeller cancel addToCart configureCake reviewItem resendEGiftCardToken protectionPlan{...orderActionFragment}manageProtectionPlan{...orderActionFragment}}isGift digitalDeliveryMessage quantity quantityString quantityLabel isSubstitutionSelected fulfilledItems{id quantityString priceInfo{itemPrice{value}}productInfo{usItemId name}}isReturnable returnEligibilityMessage productInfo{name usItemId imageInfo{thumbnailUrl}canonicalUrl offerId orderLimit orderMinLimit weightIncrement salesUnit salesUnitType isSubstitutionEligible isAlcohol}reshop{reshopMessage isShippingAvailable minPromiseDate maxPromiseDate}selectedVariants{...variants}variantAdditionalInfo{parts{text nativeAction}}priceInfo{priceDisplayCodes{showItemPrice priceDisplayCondition finalCostByWeight}itemPrice{...price}linePrice{...price}unitPrice{...price}preDiscountedLinePrice{...price}additionalLines{name value}}discounts{label labelText{...textFragment}}itemReviewed activationCodes{label code}protectionPlanMessage{...textFragment}showSeller isShippedByWalmart seller{id name isPro}digitalDeliveryPhoneNumber addOns{...OrderAddOn}multiboxBundleId}fragment DriverFragment on Driver{id firstName photoUrl}fragment OrderGroupFragment on OrderGroup{driver{...DriverFragment}deliveryDate fulfillmentType status{...OrderGroupStatusFragment}showSeller isShippedByWalmart seller{...SellerFragment}id itemCount items{...LiteLineItemFragment}pickupPerson{firstName lastName email}accessPointId shipment{...ShipmentFragment}returnEligibilityMessage actions{...OrderGroupActionsFragment}recipientEmailAddress digitalDelivery{...DigitalDeliveryFragment}tireInstallationReservation{status extraText reservationId}}fragment OrderGroupStatusFragment on OrderGroupStatus{statusType showStatusTracker statusTracker{status label isCurrent}message{...textFragment}subtext subMessage{...textFragment}notice helpCenterText{...textFragment}}fragment textFragment on Text{parts{bold url text nativeAction lineBreak}}fragment LiteLineItemFragment on OrderLineItem{id quantity productInfo{name usItemId imageInfo{thumbnailUrl}offerId isAlcohol}priceInfo{linePrice{...price}}}fragment SellerFragment on GroupSeller{id name isPro}fragment DigitalDeliveryFragment on DigitalDelivery{title name instructions{...textFragment}}fragment ShipmentFragment on Shipment{id trackingNumber isExternalTracking trackingUrl proofOfDelivery{...ProofOfDeliveryFragment}}fragment OrderGroupActionsFragment on OrderGroupActions{reorder edit track changeSlot checkin editDeliveryInstructions editPickupPerson editTip tip rateDriver cancel enableTip{...orderActionFragment}enableEdit{...orderActionFragment}rescheduleTireInstall{...orderActionFragment}cancelTireInstall{...orderActionFragment}help viewCancellationDetails{...cancellationDetailsActionFragment}}fragment cancellationDetailsActionFragment on CancellationDetailsAction{label heading text{...textFragment}}fragment ProofOfDeliveryFragment on ProofOfDelivery{photoUrl photoPreviewUrl showPreview}fragment DeliveryInstructionsFragment on DeliveryInstructions{text type typeText}fragment GiftDetailsFragment on GiftDetails{recipientAddress{fullName}recipientEmail senderName giftMessage}fragment SubstitutionAction on SubstitutionAction{message label type}fragment ODPGroupCategoryFragment on OrderCategory{type name subtext returnMessage substitutionsBanner{...textFragment}showExtendedSubstitutions actions{substitutions{...SubstitutionAction}nilPickReshop{message action{text url}}returnDetails viewCancellationDetails{...cancellationDetailsActionFragment}trackOnInHomeApp}banner{...textFragment}accordionState items{...orderLineItem}substitutions{...orderLineItem fulfilledItems{...orderLineItem}}returnInfo{...returnInfoFragment}}fragment ODPGroupFragment on OrderGroup{id fulfillmentType deliveryMessage deliveryAddress{fullName firstName lastName address{...addressFragment}}deliveryInstructions{...DeliveryInstructionsFragment}deliveryPreferences{text{...textFragment}cta{...orderActionFragment}}editSubstitutionsCutOff status{statusType showStatusTracker message{...textFragment}notice helpCenterText{...textFragment}}itemCount isCategorized categories{...ODPGroupCategoryFragment}seller{id name isPro}shipment{id trackingNumber}actions{reorder edit track changeSlot checkin editDeliveryInstructions editPickupPerson tip cancel help enableTip{...orderActionFragment}enableEdit{...orderActionFragment}viewCancellationDetails{...cancellationDetailsActionFragment}enableInHome{...orderActionFragment}createGiftReceipt}cutOffTimestamp isEditSubstitutionsEligible isInHome giftDetails{...GiftDetailsFragment}donationDetails{...orderDonationDetails}}fragment returnInfoFragment on ReturnInfo{returnOrderId type refundPriceDetails{__typename...refundPriceDetailsFragment}refundMessage tierRefundMessage paymentMethods{__typename description cardType paymentType displayValues message{...textFragment}}actions{__typename generate scheduleOrModifyPickup{text url}reschedulePickup editPickupContact}shippingLabelUrl qrCodeImageUrl carriers{__typename id name}pickupCarrier pickupContact{nameAndAddress{fullName firstName lastName address{addressString city state postalCode addressLineOne addressLineTwo country}}phone}pickupConfirmationNumber bannerMessage{...textFragment}}fragment refundPriceDetailsFragment on RefundPriceDetails{subTotal{__typename...orderPriceDetailRowFragment}fees{__typename...orderPriceDetailRowFragment}discounts{__typename...orderPriceDetailRowFragment}taxTotal{__typename...orderPriceDetailRowFragment}grandTotal{__typename...orderPriceDetailRowFragment}}fragment orderPriceDetailRowFragment on OrderPriceDetailRow{label displayValue value info{__typename title message}}fragment addressFragment on OrderAddress{addressString addressLineOne addressLineTwo state postalCode city}fragment ODPPickupInfo on OrderGroup{pickupInstructions pickupPerson{...person}alternatePickupPerson{...person}store{id name address{...addressFragment}}}fragment person on OrderPickupPerson{firstName lastName email}fragment ODPTippingInfo on OrderGroup{addTipMessage{...textFragment}driver{...DriverFragment}tipping{min{...price}max{...price}suggested{...price}preselected}subtotal{...price}}fragment orderActionFragment on Action{text url}fragment orderCustomer on OrderCustomer{id firstName lastName email isGuest isEmailRegistered}fragment OrderFieldsFragment on Order{__typename id version type customer{...orderCustomer}displayId idBarcodeImageUrl(barWidth:3 barHeight:100) isFuelPurchase title shortTitle timezone tippableGroup{...OrderGroupFragment}amendableGroup{id changeSlotIterationsLeft cutOffTimestamp fulfillmentType deliveryAddress{fullName firstName lastName address{addressString addressLineOne addressLineTwo state postalCode city country}}isAmendInProgress}substitutionsBanner{heading subheading longSubheading}groups_2101{__typename...OrderGroupFragment...ODPGroupFragment...ODPPickupInfo...ODPTippingInfo}multiboxBundles{...orderLineItem}itemCancelReasons{__typename...cancelReason}groupCancelReasons{__typename...cancelReason}priceDetails{__typename subTotal{__typename...priceDetailFragment}taxTotal{__typename...priceDetailFragment}grandTotal{__typename...priceDetailFragment}authorizationAmount{__typename...priceDetailFragment}fees{__typename...priceDetailFragment}discounts{__typename...priceDetailFragment}minimumThreshold{__typename...price}belowMinimumFee{__typename...priceDetailFragment}driverTip{__typename...priceDetailFragment}donations{__typename...priceDetailFragment}}paymentMethods{__typename description cardType paymentType displayValues message{...textFragment}actions{connectToCapitalOne{...orderActionFragment}visitAffirm{...orderActionFragment}}}actions{__typename return pendingReturn cancel startReturn{...orderActionFragment}reorder}banners{...textFragment}}","variables":{"orderId":"3332211760429","emailAddress":"alexnanajan@yahoo.com"}}' \
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
    echo "'3332211760429" >> track-OrderID.txt
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
    sum32=`md5 track-OrderID.txt`
    for (( i=0; i<=4; i++ ))
    do
        for (( j=0; j<=4; j++))
        do
            if [[ `echo $curl32 | jq '.data.guestOrder.groups_2101['${i[@]}'].items['${j[@]}'].productInfo.usItemId'` == '"947870483"' ]]; then
                echo "'3332211760429" >> track-OrderID.txt
                echo alexnanajan@yahoo.com >> track-email.txt
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
        echo "'3332211760429" >> track-OrderID.txt
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
  -H 'user-agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/98.0.4758.102 Safari/537.36 Edg/98.0.1108.62' \
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
    sum33=`md5 track-OrderID.txt`
    for (( i=0; i<=4; i++ ))
    do
        for (( j=0; j<=4; j++))
        do
            if [[ `echo $curl33 | jq '.data.guestOrder.groups_2101['${i[@]}'].items['${j[@]}'].productInfo.usItemId'` == '"251382558"' ]]; then
                echo "'3342213778038" >> track-OrderID.txt
                echo 13jwag@gmail.com >> track-email.txt
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
  -H 'user-agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/98.0.4758.102 Safari/537.36 Edg/98.0.1108.62' \
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
  --data-raw $'{"query":"query getGuestOrder($orderId:ID\u0021 $emailAddress:String\u0021){guestOrder(input:{id:$orderId emailAddress:$emailAddress}){...OrderFieldsFragment}}fragment cancelReason on OrderCancelReason{__typename subReasonCode subDescription}fragment priceDetailFragment on OrderPriceDetailRow{label value displayValue info{title message}rowInfo{...orderPriceDetailRowInfo}}fragment orderPriceDetailRowInfo on OrderPriceDetailRowInfo{title message{...textFragment}}fragment price on Price{displayValue value}fragment variants on MapEntry{name value}fragment OrderAddOn on OrderAddOn{lineId uniqueLineId productInfo{name usItemId offerId}quantityString quantityLabel type fulfillmentInstructions{...textFragment}actions{manageProtectionPlan{...orderActionFragment}cancel}priceInfo{linePrice{...price}}quantity isActive}fragment orderDonationDetails on OrderDonationDetails{message{...textFragment}emailReceipt emailReceiptToken status{...textFragment}errorStatus}fragment orderLineItem on OrderLineItem{id uniqueId actions{contactSeller cancel addToCart configureCake reviewItem resendEGiftCardToken protectionPlan{...orderActionFragment}manageProtectionPlan{...orderActionFragment}}isGift digitalDeliveryMessage quantity quantityString quantityLabel isSubstitutionSelected fulfilledItems{id quantityString priceInfo{itemPrice{value}}productInfo{usItemId name}}isReturnable returnEligibilityMessage productInfo{name usItemId imageInfo{thumbnailUrl}canonicalUrl offerId orderLimit orderMinLimit weightIncrement salesUnit salesUnitType isSubstitutionEligible isAlcohol}reshop{reshopMessage isShippingAvailable minPromiseDate maxPromiseDate}selectedVariants{...variants}variantAdditionalInfo{parts{text nativeAction}}priceInfo{priceDisplayCodes{showItemPrice priceDisplayCondition finalCostByWeight}itemPrice{...price}linePrice{...price}unitPrice{...price}preDiscountedLinePrice{...price}additionalLines{name value}}discounts{label labelText{...textFragment}}itemReviewed activationCodes{label code}protectionPlanMessage{...textFragment}showSeller isShippedByWalmart seller{id name isPro}digitalDeliveryPhoneNumber addOns{...OrderAddOn}multiboxBundleId}fragment DriverFragment on Driver{id firstName photoUrl}fragment OrderGroupFragment on OrderGroup{driver{...DriverFragment}deliveryDate fulfillmentType status{...OrderGroupStatusFragment}showSeller isShippedByWalmart seller{...SellerFragment}id itemCount items{...LiteLineItemFragment}pickupPerson{firstName lastName email}accessPointId shipment{...ShipmentFragment}returnEligibilityMessage actions{...OrderGroupActionsFragment}recipientEmailAddress digitalDelivery{...DigitalDeliveryFragment}tireInstallationReservation{status extraText reservationId}}fragment OrderGroupStatusFragment on OrderGroupStatus{statusType showStatusTracker statusTracker{status label isCurrent}message{...textFragment}subtext subMessage{...textFragment}notice helpCenterText{...textFragment}}fragment textFragment on Text{parts{bold url text nativeAction lineBreak}}fragment LiteLineItemFragment on OrderLineItem{id quantity productInfo{name usItemId imageInfo{thumbnailUrl}offerId isAlcohol}priceInfo{linePrice{...price}}}fragment SellerFragment on GroupSeller{id name isPro}fragment DigitalDeliveryFragment on DigitalDelivery{title name instructions{...textFragment}}fragment ShipmentFragment on Shipment{id trackingNumber isExternalTracking trackingUrl proofOfDelivery{...ProofOfDeliveryFragment}}fragment OrderGroupActionsFragment on OrderGroupActions{reorder edit track changeSlot checkin editDeliveryInstructions editPickupPerson editTip tip rateDriver cancel enableTip{...orderActionFragment}enableEdit{...orderActionFragment}rescheduleTireInstall{...orderActionFragment}cancelTireInstall{...orderActionFragment}help viewCancellationDetails{...cancellationDetailsActionFragment}}fragment cancellationDetailsActionFragment on CancellationDetailsAction{label heading text{...textFragment}}fragment ProofOfDeliveryFragment on ProofOfDelivery{photoUrl photoPreviewUrl showPreview}fragment DeliveryInstructionsFragment on DeliveryInstructions{text type typeText}fragment GiftDetailsFragment on GiftDetails{recipientAddress{fullName}recipientEmail senderName giftMessage}fragment SubstitutionAction on SubstitutionAction{message label type}fragment ODPGroupCategoryFragment on OrderCategory{type name subtext returnMessage substitutionsBanner{...textFragment}showExtendedSubstitutions actions{substitutions{...SubstitutionAction}nilPickReshop{message action{text url}}returnDetails viewCancellationDetails{...cancellationDetailsActionFragment}trackOnInHomeApp}banner{...textFragment}accordionState items{...orderLineItem}substitutions{...orderLineItem fulfilledItems{...orderLineItem}}returnInfo{...returnInfoFragment}}fragment ODPGroupFragment on OrderGroup{id fulfillmentType deliveryMessage deliveryAddress{fullName firstName lastName address{...addressFragment}}deliveryInstructions{...DeliveryInstructionsFragment}deliveryPreferences{text{...textFragment}cta{...orderActionFragment}}editSubstitutionsCutOff status{statusType showStatusTracker message{...textFragment}notice helpCenterText{...textFragment}}itemCount isCategorized categories{...ODPGroupCategoryFragment}seller{id name isPro}shipment{id trackingNumber}actions{reorder edit track changeSlot checkin editDeliveryInstructions editPickupPerson tip cancel help enableTip{...orderActionFragment}enableEdit{...orderActionFragment}viewCancellationDetails{...cancellationDetailsActionFragment}enableInHome{...orderActionFragment}createGiftReceipt}cutOffTimestamp isEditSubstitutionsEligible isInHome giftDetails{...GiftDetailsFragment}donationDetails{...orderDonationDetails}}fragment returnInfoFragment on ReturnInfo{returnOrderId type refundPriceDetails{__typename...refundPriceDetailsFragment}refundMessage tierRefundMessage paymentMethods{__typename description cardType paymentType displayValues message{...textFragment}}actions{__typename generate scheduleOrModifyPickup{text url}reschedulePickup editPickupContact}shippingLabelUrl qrCodeImageUrl carriers{__typename id name}pickupCarrier pickupContact{nameAndAddress{fullName firstName lastName address{addressString city state postalCode addressLineOne addressLineTwo country}}phone}pickupConfirmationNumber bannerMessage{...textFragment}}fragment refundPriceDetailsFragment on RefundPriceDetails{subTotal{__typename...orderPriceDetailRowFragment}fees{__typename...orderPriceDetailRowFragment}discounts{__typename...orderPriceDetailRowFragment}taxTotal{__typename...orderPriceDetailRowFragment}grandTotal{__typename...orderPriceDetailRowFragment}}fragment orderPriceDetailRowFragment on OrderPriceDetailRow{label displayValue value info{__typename title message}}fragment addressFragment on OrderAddress{addressString addressLineOne addressLineTwo state postalCode city}fragment ODPPickupInfo on OrderGroup{pickupInstructions pickupPerson{...person}alternatePickupPerson{...person}store{id name address{...addressFragment}}}fragment person on OrderPickupPerson{firstName lastName email}fragment ODPTippingInfo on OrderGroup{addTipMessage{...textFragment}driver{...DriverFragment}tipping{min{...price}max{...price}suggested{...price}preselected}subtotal{...price}}fragment orderActionFragment on Action{text url}fragment orderCustomer on OrderCustomer{id firstName lastName email isGuest isEmailRegistered}fragment OrderFieldsFragment on Order{__typename id version type customer{...orderCustomer}displayId idBarcodeImageUrl(barWidth:3 barHeight:100) isFuelPurchase title shortTitle timezone tippableGroup{...OrderGroupFragment}amendableGroup{id changeSlotIterationsLeft cutOffTimestamp fulfillmentType deliveryAddress{fullName firstName lastName address{addressString addressLineOne addressLineTwo state postalCode city country}}isAmendInProgress}substitutionsBanner{heading subheading longSubheading}groups_2101{__typename...OrderGroupFragment...ODPGroupFragment...ODPPickupInfo...ODPTippingInfo}multiboxBundles{...orderLineItem}itemCancelReasons{__typename...cancelReason}groupCancelReasons{__typename...cancelReason}priceDetails{__typename subTotal{__typename...priceDetailFragment}taxTotal{__typename...priceDetailFragment}grandTotal{__typename...priceDetailFragment}authorizationAmount{__typename...priceDetailFragment}fees{__typename...priceDetailFragment}discounts{__typename...priceDetailFragment}minimumThreshold{__typename...price}belowMinimumFee{__typename...priceDetailFragment}driverTip{__typename...priceDetailFragment}donations{__typename...priceDetailFragment}}paymentMethods{__typename description cardType paymentType displayValues message{...textFragment}actions{connectToCapitalOne{...orderActionFragment}visitAffirm{...orderActionFragment}}}actions{__typename return pendingReturn cancel startReturn{...orderActionFragment}reorder}banners{...textFragment}}","variables":{"orderId":"3362216310295","emailAddress":"weezie3513@aol.com"}}' \
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
    echo "'3362216310295" >> track-OrderID.txt
    echo "weezie3513@aol.com" >> track-email.txt
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
            if [[ `echo $curl34 | jq '.data.guestOrder.groups_2101['${i[@]}'].items['${j[@]}'].productInfo.usItemId'` == '"311658658"' ]]; then
                echo "'3362216310295" >> track-OrderID.txt
                echo weezie3513@aol.com >> track-email.txt
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
        echo "'3362216310295" >> track-OrderID.txt
        echo "weezie3513@aol.com" >> track-email.txt
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
  -H 'user-agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/98.0.4758.102 Safari/537.36 Edg/98.0.1108.62' \
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
    sum35=`md5 track-OrderID.txt`
    for (( i=0; i<=4; i++ ))
    do
        for (( j=0; j<=4; j++))
        do
            if [[ `echo $curl35 | jq '.data.guestOrder.groups_2101['${i[@]}'].items['${j[@]}'].productInfo.usItemId'` == '"54316097"' ]]; then
                echo "'3372217594764" >> track-OrderID.txt
                echo valeriepierr@gmail.com >> track-email.txt
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
  -H 'user-agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/98.0.4758.102 Safari/537.36 Edg/98.0.1108.62' \
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
    sum36=`md5 track-OrderID.txt`
    for (( i=0; i<=4; i++ ))
    do
        for (( j=0; j<=4; j++))
        do
            if [[ `echo $curl36 | jq '.data.guestOrder.groups_2101['${i[@]}'].items['${j[@]}'].productInfo.usItemId'` == '"240828726"' ]]; then
                echo "'3372217394043" >> track-OrderID.txt
                echo russarmes@yahoo.com >> track-email.txt
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
  -H 'user-agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/98.0.4758.102 Safari/537.36 Edg/98.0.1108.62' \
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
  --data-raw $'{"query":"query getGuestOrder($orderId:ID\u0021 $emailAddress:String\u0021){guestOrder(input:{id:$orderId emailAddress:$emailAddress}){...OrderFieldsFragment}}fragment cancelReason on OrderCancelReason{__typename subReasonCode subDescription}fragment priceDetailFragment on OrderPriceDetailRow{label value displayValue info{title message}rowInfo{...orderPriceDetailRowInfo}}fragment orderPriceDetailRowInfo on OrderPriceDetailRowInfo{title message{...textFragment}}fragment price on Price{displayValue value}fragment variants on MapEntry{name value}fragment OrderAddOn on OrderAddOn{lineId uniqueLineId productInfo{name usItemId offerId}quantityString quantityLabel type fulfillmentInstructions{...textFragment}actions{manageProtectionPlan{...orderActionFragment}cancel}priceInfo{linePrice{...price}}quantity isActive}fragment orderDonationDetails on OrderDonationDetails{message{...textFragment}emailReceipt emailReceiptToken status{...textFragment}errorStatus}fragment orderLineItem on OrderLineItem{id uniqueId actions{contactSeller cancel addToCart configureCake reviewItem resendEGiftCardToken protectionPlan{...orderActionFragment}manageProtectionPlan{...orderActionFragment}}isGift digitalDeliveryMessage quantity quantityString quantityLabel isSubstitutionSelected fulfilledItems{id quantityString priceInfo{itemPrice{value}}productInfo{usItemId name}}isReturnable returnEligibilityMessage productInfo{name usItemId imageInfo{thumbnailUrl}canonicalUrl offerId orderLimit orderMinLimit weightIncrement salesUnit salesUnitType isSubstitutionEligible isAlcohol}reshop{reshopMessage isShippingAvailable minPromiseDate maxPromiseDate}selectedVariants{...variants}variantAdditionalInfo{parts{text nativeAction}}priceInfo{priceDisplayCodes{showItemPrice priceDisplayCondition finalCostByWeight}itemPrice{...price}linePrice{...price}unitPrice{...price}preDiscountedLinePrice{...price}additionalLines{name value}}discounts{label labelText{...textFragment}}itemReviewed activationCodes{label code}protectionPlanMessage{...textFragment}showSeller isShippedByWalmart seller{id name isPro}digitalDeliveryPhoneNumber addOns{...OrderAddOn}multiboxBundleId}fragment DriverFragment on Driver{id firstName photoUrl}fragment OrderGroupFragment on OrderGroup{driver{...DriverFragment}deliveryDate fulfillmentType status{...OrderGroupStatusFragment}showSeller isShippedByWalmart seller{...SellerFragment}id itemCount items{...LiteLineItemFragment}pickupPerson{firstName lastName email}accessPointId shipment{...ShipmentFragment}returnEligibilityMessage actions{...OrderGroupActionsFragment}recipientEmailAddress digitalDelivery{...DigitalDeliveryFragment}tireInstallationReservation{status extraText reservationId}}fragment OrderGroupStatusFragment on OrderGroupStatus{statusType showStatusTracker statusTracker{status label isCurrent}message{...textFragment}subtext subMessage{...textFragment}notice helpCenterText{...textFragment}}fragment textFragment on Text{parts{bold url text nativeAction lineBreak}}fragment LiteLineItemFragment on OrderLineItem{id quantity productInfo{name usItemId imageInfo{thumbnailUrl}offerId isAlcohol}priceInfo{linePrice{...price}}}fragment SellerFragment on GroupSeller{id name isPro}fragment DigitalDeliveryFragment on DigitalDelivery{title name instructions{...textFragment}}fragment ShipmentFragment on Shipment{id trackingNumber isExternalTracking trackingUrl proofOfDelivery{...ProofOfDeliveryFragment}}fragment OrderGroupActionsFragment on OrderGroupActions{reorder edit track changeSlot checkin editDeliveryInstructions editPickupPerson editTip tip rateDriver cancel enableTip{...orderActionFragment}enableEdit{...orderActionFragment}rescheduleTireInstall{...orderActionFragment}cancelTireInstall{...orderActionFragment}help viewCancellationDetails{...cancellationDetailsActionFragment}}fragment cancellationDetailsActionFragment on CancellationDetailsAction{label heading text{...textFragment}}fragment ProofOfDeliveryFragment on ProofOfDelivery{photoUrl photoPreviewUrl showPreview}fragment DeliveryInstructionsFragment on DeliveryInstructions{text type typeText}fragment GiftDetailsFragment on GiftDetails{recipientAddress{fullName}recipientEmail senderName giftMessage}fragment SubstitutionAction on SubstitutionAction{message label type}fragment ODPGroupCategoryFragment on OrderCategory{type name subtext returnMessage substitutionsBanner{...textFragment}showExtendedSubstitutions actions{substitutions{...SubstitutionAction}nilPickReshop{message action{text url}}returnDetails viewCancellationDetails{...cancellationDetailsActionFragment}trackOnInHomeApp}banner{...textFragment}accordionState items{...orderLineItem}substitutions{...orderLineItem fulfilledItems{...orderLineItem}}returnInfo{...returnInfoFragment}}fragment ODPGroupFragment on OrderGroup{id fulfillmentType deliveryMessage deliveryAddress{fullName firstName lastName address{...addressFragment}}deliveryInstructions{...DeliveryInstructionsFragment}deliveryPreferences{text{...textFragment}cta{...orderActionFragment}}editSubstitutionsCutOff status{statusType showStatusTracker message{...textFragment}notice helpCenterText{...textFragment}}itemCount isCategorized categories{...ODPGroupCategoryFragment}seller{id name isPro}shipment{id trackingNumber}actions{reorder edit track changeSlot checkin editDeliveryInstructions editPickupPerson tip cancel help enableTip{...orderActionFragment}enableEdit{...orderActionFragment}viewCancellationDetails{...cancellationDetailsActionFragment}enableInHome{...orderActionFragment}createGiftReceipt}cutOffTimestamp isEditSubstitutionsEligible isInHome giftDetails{...GiftDetailsFragment}donationDetails{...orderDonationDetails}}fragment returnInfoFragment on ReturnInfo{returnOrderId type refundPriceDetails{__typename...refundPriceDetailsFragment}refundMessage tierRefundMessage paymentMethods{__typename description cardType paymentType displayValues message{...textFragment}}actions{__typename generate scheduleOrModifyPickup{text url}reschedulePickup editPickupContact}shippingLabelUrl qrCodeImageUrl carriers{__typename id name}pickupCarrier pickupContact{nameAndAddress{fullName firstName lastName address{addressString city state postalCode addressLineOne addressLineTwo country}}phone}pickupConfirmationNumber bannerMessage{...textFragment}}fragment refundPriceDetailsFragment on RefundPriceDetails{subTotal{__typename...orderPriceDetailRowFragment}fees{__typename...orderPriceDetailRowFragment}discounts{__typename...orderPriceDetailRowFragment}taxTotal{__typename...orderPriceDetailRowFragment}grandTotal{__typename...orderPriceDetailRowFragment}}fragment orderPriceDetailRowFragment on OrderPriceDetailRow{label displayValue value info{__typename title message}}fragment addressFragment on OrderAddress{addressString addressLineOne addressLineTwo state postalCode city}fragment ODPPickupInfo on OrderGroup{pickupInstructions pickupPerson{...person}alternatePickupPerson{...person}store{id name address{...addressFragment}}}fragment person on OrderPickupPerson{firstName lastName email}fragment ODPTippingInfo on OrderGroup{addTipMessage{...textFragment}driver{...DriverFragment}tipping{min{...price}max{...price}suggested{...price}preselected}subtotal{...price}}fragment orderActionFragment on Action{text url}fragment orderCustomer on OrderCustomer{id firstName lastName email isGuest isEmailRegistered}fragment OrderFieldsFragment on Order{__typename id version type customer{...orderCustomer}displayId idBarcodeImageUrl(barWidth:3 barHeight:100) isFuelPurchase title shortTitle timezone tippableGroup{...OrderGroupFragment}amendableGroup{id changeSlotIterationsLeft cutOffTimestamp fulfillmentType deliveryAddress{fullName firstName lastName address{addressString addressLineOne addressLineTwo state postalCode city country}}isAmendInProgress}substitutionsBanner{heading subheading longSubheading}groups_2101{__typename...OrderGroupFragment...ODPGroupFragment...ODPPickupInfo...ODPTippingInfo}multiboxBundles{...orderLineItem}itemCancelReasons{__typename...cancelReason}groupCancelReasons{__typename...cancelReason}priceDetails{__typename subTotal{__typename...priceDetailFragment}taxTotal{__typename...priceDetailFragment}grandTotal{__typename...priceDetailFragment}authorizationAmount{__typename...priceDetailFragment}fees{__typename...priceDetailFragment}discounts{__typename...priceDetailFragment}minimumThreshold{__typename...price}belowMinimumFee{__typename...priceDetailFragment}driverTip{__typename...priceDetailFragment}donations{__typename...priceDetailFragment}}paymentMethods{__typename description cardType paymentType displayValues message{...textFragment}actions{connectToCapitalOne{...orderActionFragment}visitAffirm{...orderActionFragment}}}actions{__typename return pendingReturn cancel startReturn{...orderActionFragment}reorder}banners{...textFragment}}","variables":{"orderId":"3372217595273","emailAddress":"giannaventers@gmail.com"}}' \
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
    echo "'3372217595273" >> track-OrderID.txt
    echo "giannaventers@gmail.com" >> track-email.txt
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
            if [[ `echo $curl37 | jq '.data.guestOrder.groups_2101['${i[@]}'].items['${j[@]}'].productInfo.usItemId'` == '"46368979"' ]]; then
                echo "'3372217595273" >> track-OrderID.txt
                echo giannaventers@gmail.com >> track-email.txt
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
        echo "'3372217595273" >> track-OrderID.txt
        echo "giannaventers@gmail.com" >> track-email.txt
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
  -H 'user-agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/98.0.4758.102 Safari/537.36 Edg/98.0.1108.62' \
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
    sum38=`md5 track-OrderID.txt`
    for (( i=0; i<=4; i++ ))
    do
        for (( j=0; j<=4; j++))
        do
            if [[ `echo $curl38 | jq '.data.guestOrder.groups_2101['${i[@]}'].items['${j[@]}'].productInfo.usItemId'` == '"13997776"' ]]; then
                echo "'3372217887504" >> track-OrderID.txt
                echo m_klar@hotmail.com >> track-email.txt
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
  -H 'user-agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/98.0.4758.102 Safari/537.36 Edg/98.0.1108.62' \
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
    sum39=`md5 track-OrderID.txt`
    for (( i=0; i<=4; i++ ))
    do
        for (( j=0; j<=4; j++))
        do
            if [[ `echo $curl39 | jq '.data.guestOrder.groups_2101['${i[@]}'].items['${j[@]}'].productInfo.usItemId'` == '"36611908"' ]]; then
                echo "'3372217996875" >> track-OrderID.txt
                echo rew115@aol.com >> track-email.txt
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
  -H 'user-agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/98.0.4758.102 Safari/537.36 Edg/98.0.1108.62' \
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
  --data-raw $'{"query":"query getGuestOrder($orderId:ID\u0021 $emailAddress:String\u0021){guestOrder(input:{id:$orderId emailAddress:$emailAddress}){...OrderFieldsFragment}}fragment cancelReason on OrderCancelReason{__typename subReasonCode subDescription}fragment priceDetailFragment on OrderPriceDetailRow{label value displayValue info{title message}rowInfo{...orderPriceDetailRowInfo}}fragment orderPriceDetailRowInfo on OrderPriceDetailRowInfo{title message{...textFragment}}fragment price on Price{displayValue value}fragment variants on MapEntry{name value}fragment OrderAddOn on OrderAddOn{lineId uniqueLineId productInfo{name usItemId offerId}quantityString quantityLabel type fulfillmentInstructions{...textFragment}actions{manageProtectionPlan{...orderActionFragment}cancel}priceInfo{linePrice{...price}}quantity isActive}fragment orderDonationDetails on OrderDonationDetails{message{...textFragment}emailReceipt emailReceiptToken status{...textFragment}errorStatus}fragment orderLineItem on OrderLineItem{id uniqueId actions{contactSeller cancel addToCart configureCake reviewItem resendEGiftCardToken protectionPlan{...orderActionFragment}manageProtectionPlan{...orderActionFragment}}isGift digitalDeliveryMessage quantity quantityString quantityLabel isSubstitutionSelected fulfilledItems{id quantityString priceInfo{itemPrice{value}}productInfo{usItemId name}}isReturnable returnEligibilityMessage productInfo{name usItemId imageInfo{thumbnailUrl}canonicalUrl offerId orderLimit orderMinLimit weightIncrement salesUnit salesUnitType isSubstitutionEligible isAlcohol}reshop{reshopMessage isShippingAvailable minPromiseDate maxPromiseDate}selectedVariants{...variants}variantAdditionalInfo{parts{text nativeAction}}priceInfo{priceDisplayCodes{showItemPrice priceDisplayCondition finalCostByWeight}itemPrice{...price}linePrice{...price}unitPrice{...price}preDiscountedLinePrice{...price}additionalLines{name value}}discounts{label labelText{...textFragment}}itemReviewed activationCodes{label code}protectionPlanMessage{...textFragment}showSeller isShippedByWalmart seller{id name isPro}digitalDeliveryPhoneNumber addOns{...OrderAddOn}multiboxBundleId}fragment DriverFragment on Driver{id firstName photoUrl}fragment OrderGroupFragment on OrderGroup{driver{...DriverFragment}deliveryDate fulfillmentType status{...OrderGroupStatusFragment}showSeller isShippedByWalmart seller{...SellerFragment}id itemCount items{...LiteLineItemFragment}pickupPerson{firstName lastName email}accessPointId shipment{...ShipmentFragment}returnEligibilityMessage actions{...OrderGroupActionsFragment}recipientEmailAddress digitalDelivery{...DigitalDeliveryFragment}tireInstallationReservation{status extraText reservationId}}fragment OrderGroupStatusFragment on OrderGroupStatus{statusType showStatusTracker statusTracker{status label isCurrent}message{...textFragment}subtext subMessage{...textFragment}notice helpCenterText{...textFragment}}fragment textFragment on Text{parts{bold url text nativeAction lineBreak}}fragment LiteLineItemFragment on OrderLineItem{id quantity productInfo{name usItemId imageInfo{thumbnailUrl}offerId isAlcohol}priceInfo{linePrice{...price}}}fragment SellerFragment on GroupSeller{id name isPro}fragment DigitalDeliveryFragment on DigitalDelivery{title name instructions{...textFragment}}fragment ShipmentFragment on Shipment{id trackingNumber isExternalTracking trackingUrl proofOfDelivery{...ProofOfDeliveryFragment}}fragment OrderGroupActionsFragment on OrderGroupActions{reorder edit track changeSlot checkin editDeliveryInstructions editPickupPerson editTip tip rateDriver cancel enableTip{...orderActionFragment}enableEdit{...orderActionFragment}rescheduleTireInstall{...orderActionFragment}cancelTireInstall{...orderActionFragment}help viewCancellationDetails{...cancellationDetailsActionFragment}}fragment cancellationDetailsActionFragment on CancellationDetailsAction{label heading text{...textFragment}}fragment ProofOfDeliveryFragment on ProofOfDelivery{photoUrl photoPreviewUrl showPreview}fragment DeliveryInstructionsFragment on DeliveryInstructions{text type typeText}fragment GiftDetailsFragment on GiftDetails{recipientAddress{fullName}recipientEmail senderName giftMessage}fragment SubstitutionAction on SubstitutionAction{message label type}fragment ODPGroupCategoryFragment on OrderCategory{type name subtext returnMessage substitutionsBanner{...textFragment}showExtendedSubstitutions actions{substitutions{...SubstitutionAction}nilPickReshop{message action{text url}}returnDetails viewCancellationDetails{...cancellationDetailsActionFragment}trackOnInHomeApp}banner{...textFragment}accordionState items{...orderLineItem}substitutions{...orderLineItem fulfilledItems{...orderLineItem}}returnInfo{...returnInfoFragment}}fragment ODPGroupFragment on OrderGroup{id fulfillmentType deliveryMessage deliveryAddress{fullName firstName lastName address{...addressFragment}}deliveryInstructions{...DeliveryInstructionsFragment}deliveryPreferences{text{...textFragment}cta{...orderActionFragment}}editSubstitutionsCutOff status{statusType showStatusTracker message{...textFragment}notice helpCenterText{...textFragment}}itemCount isCategorized categories{...ODPGroupCategoryFragment}seller{id name isPro}shipment{id trackingNumber}actions{reorder edit track changeSlot checkin editDeliveryInstructions editPickupPerson tip cancel help enableTip{...orderActionFragment}enableEdit{...orderActionFragment}viewCancellationDetails{...cancellationDetailsActionFragment}enableInHome{...orderActionFragment}createGiftReceipt}cutOffTimestamp isEditSubstitutionsEligible isInHome giftDetails{...GiftDetailsFragment}donationDetails{...orderDonationDetails}}fragment returnInfoFragment on ReturnInfo{returnOrderId type refundPriceDetails{__typename...refundPriceDetailsFragment}refundMessage tierRefundMessage paymentMethods{__typename description cardType paymentType displayValues message{...textFragment}}actions{__typename generate scheduleOrModifyPickup{text url}reschedulePickup editPickupContact}shippingLabelUrl qrCodeImageUrl carriers{__typename id name}pickupCarrier pickupContact{nameAndAddress{fullName firstName lastName address{addressString city state postalCode addressLineOne addressLineTwo country}}phone}pickupConfirmationNumber bannerMessage{...textFragment}}fragment refundPriceDetailsFragment on RefundPriceDetails{subTotal{__typename...orderPriceDetailRowFragment}fees{__typename...orderPriceDetailRowFragment}discounts{__typename...orderPriceDetailRowFragment}taxTotal{__typename...orderPriceDetailRowFragment}grandTotal{__typename...orderPriceDetailRowFragment}}fragment orderPriceDetailRowFragment on OrderPriceDetailRow{label displayValue value info{__typename title message}}fragment addressFragment on OrderAddress{addressString addressLineOne addressLineTwo state postalCode city}fragment ODPPickupInfo on OrderGroup{pickupInstructions pickupPerson{...person}alternatePickupPerson{...person}store{id name address{...addressFragment}}}fragment person on OrderPickupPerson{firstName lastName email}fragment ODPTippingInfo on OrderGroup{addTipMessage{...textFragment}driver{...DriverFragment}tipping{min{...price}max{...price}suggested{...price}preselected}subtotal{...price}}fragment orderActionFragment on Action{text url}fragment orderCustomer on OrderCustomer{id firstName lastName email isGuest isEmailRegistered}fragment OrderFieldsFragment on Order{__typename id version type customer{...orderCustomer}displayId idBarcodeImageUrl(barWidth:3 barHeight:100) isFuelPurchase title shortTitle timezone tippableGroup{...OrderGroupFragment}amendableGroup{id changeSlotIterationsLeft cutOffTimestamp fulfillmentType deliveryAddress{fullName firstName lastName address{addressString addressLineOne addressLineTwo state postalCode city country}}isAmendInProgress}substitutionsBanner{heading subheading longSubheading}groups_2101{__typename...OrderGroupFragment...ODPGroupFragment...ODPPickupInfo...ODPTippingInfo}multiboxBundles{...orderLineItem}itemCancelReasons{__typename...cancelReason}groupCancelReasons{__typename...cancelReason}priceDetails{__typename subTotal{__typename...priceDetailFragment}taxTotal{__typename...priceDetailFragment}grandTotal{__typename...priceDetailFragment}authorizationAmount{__typename...priceDetailFragment}fees{__typename...priceDetailFragment}discounts{__typename...priceDetailFragment}minimumThreshold{__typename...price}belowMinimumFee{__typename...priceDetailFragment}driverTip{__typename...priceDetailFragment}donations{__typename...priceDetailFragment}}paymentMethods{__typename description cardType paymentType displayValues message{...textFragment}actions{connectToCapitalOne{...orderActionFragment}visitAffirm{...orderActionFragment}}}actions{__typename return pendingReturn cancel startReturn{...orderActionFragment}reorder}banners{...textFragment}}","variables":{"orderId":"3372217999535","emailAddress":"gibwel98@aol.com"}}' \
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
    echo "'3372217999535" >> track-OrderID.txt
    echo "gibwel98@aol.com" >> track-email.txt
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
            if [[ `echo $curl40 | jq '.data.guestOrder.groups_2101['${i[@]}'].items['${j[@]}'].productInfo.usItemId'` == '"746021606"' ]]; then
                echo "'3372217999535" >> track-OrderID.txt
                echo gibwel98@aol.com >> track-email.txt
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
        echo "'3372217999535" >> track-OrderID.txt
        echo "gibwel98@aol.com" >> track-email.txt
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
git add -A .
git commit -m --allow-empty
git push
git push origin HEAD -f
gitCommit=`git rev-parse HEAD`
linkGit=`echo https://raw.githubusercontent.com/DungSherlock/eBay/`$gitCommit`echo /`
linkApi=`echo https://script.google.com/macros/s/AKfycbxTUZPtaHbpL6Sdf4PXWLmCg1PcRotJWSyJQ-cKMC9AxPb-du0q4h3mmFAICVNeGp8GNQ/exec?`
linkPost=$linkApi`echo Item ID==IMPORTDATA\(\"`$linkGit`echo track-usItemId.txt\"\)\&Giá==IMPORTDATA\(\"`$linkGit`echo track-priceValue.txt\"\)\&Tên==IMPORTDATA\(\"`$linkGit`echo track-fullName.txt\"\)\&Địa chỉ==index\(IMPORTDATA\(\"`$linkGit`echo track-address.txt\"\),,1\)\&Status==IMPORTDATA\(\"`$linkGit`echo track-status.txt\"\)\&Tracking Number==IMPORTDATA\(\"`$linkGit`echo track-number.txt\"\)\&Tracking URL==IMPORTDATA\(\"`$linkGit`echo track-url.txt\"\)\&Email==IMPORTDATA\(\"`$linkGit`echo track-email.txt\"\)\&Order==IMPORTDATA\(\"`$linkGit`echo track-OrderID.txt\"\)\&categoriesType==IMPORTDATA\(\"`$linkGit`echo track-categoriesType.txt\"\)`
echo $linkPost
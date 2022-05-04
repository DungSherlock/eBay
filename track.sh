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
  -H 'user-agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.51 Safari/537.36 Edg/99.0.1150.39' \
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
  --data-raw $'{"query":"query getGuestOrder($orderId:ID\u0021 $emailAddress:String\u0021){guestOrder(input:{id:$orderId emailAddress:$emailAddress}){...OrderFieldsFragment}}fragment cancelReason on OrderCancelReason{__typename subReasonCode subDescription}fragment priceDetailFragment on OrderPriceDetailRow{label value displayValue info{title message}rowInfo{...orderPriceDetailRowInfo}}fragment orderPriceDetailRowInfo on OrderPriceDetailRowInfo{title message{...textFragment}}fragment price on Price{displayValue value}fragment variants on MapEntry{name value}fragment OrderAddOn on OrderAddOn{lineId uniqueLineId productInfo{name usItemId offerId}quantityString quantityLabel type fulfillmentInstructions{...textFragment}actions{manageProtectionPlan{...orderActionFragment}cancel}priceInfo{linePrice{...price}}quantity isActive}fragment orderDonationDetails on OrderDonationDetails{message{...textFragment}emailReceipt emailReceiptToken status{...textFragment}errorStatus}fragment orderLineItem on OrderLineItem{id uniqueId actions{contactSeller cancel addToCart configureCake reviewItem resendEGiftCardToken protectionPlan{...orderActionFragment}manageProtectionPlan{...orderActionFragment}}isGift digitalDeliveryMessage quantity quantityString quantityLabel isSubstitutionSelected fulfilledItems{id quantityString priceInfo{itemPrice{value}}productInfo{usItemId name}}isReturnable returnEligibilityMessage productInfo{name usItemId imageInfo{thumbnailUrl}canonicalUrl offerId orderLimit orderMinLimit weightIncrement salesUnit salesUnitType isSubstitutionEligible isAlcohol}reshop{reshopMessage isShippingAvailable minPromiseDate maxPromiseDate}selectedVariants{...variants}variantAdditionalInfo{parts{text nativeAction}}priceInfo{priceDisplayCodes{showItemPrice priceDisplayCondition finalCostByWeight}itemPrice{...price}linePrice{...price}unitPrice{...price}preDiscountedLinePrice{...price}additionalLines{name value}}discounts{label labelText{...textFragment}}itemReviewed activationCodes{label code}protectionPlanMessage{...textFragment}showSeller isShippedByWalmart seller{id name isPro}digitalDeliveryPhoneNumber addOns{...OrderAddOn}multiboxBundleId}fragment DriverFragment on Driver{id firstName photoUrl}fragment OrderGroupFragment on OrderGroup{driver{...DriverFragment}deliveryDate fulfillmentType status{...OrderGroupStatusFragment}showSeller isShippedByWalmart seller{...SellerFragment}id itemCount items{...LiteLineItemFragment}pickupPerson{firstName lastName email}accessPointId shipment{...ShipmentFragment}returnEligibilityMessage actions{...OrderGroupActionsFragment}recipientEmailAddress digitalDelivery{...DigitalDeliveryFragment}tireInstallationReservation{status extraText reservationId}}fragment OrderGroupStatusFragment on OrderGroupStatus{statusType showStatusTracker statusTracker{status label isCurrent}message{...textFragment}subtext subMessage{...textFragment}notice helpCenterText{...textFragment}}fragment textFragment on Text{parts{bold url text nativeAction lineBreak}}fragment LiteLineItemFragment on OrderLineItem{id quantity productInfo{name usItemId imageInfo{thumbnailUrl}offerId isAlcohol}priceInfo{linePrice{...price}}}fragment SellerFragment on GroupSeller{id name isPro}fragment DigitalDeliveryFragment on DigitalDelivery{title name instructions{...textFragment}}fragment ShipmentFragment on Shipment{id trackingNumber isExternalTracking trackingUrl proofOfDelivery{...ProofOfDeliveryFragment}}fragment OrderGroupActionsFragment on OrderGroupActions{reorder edit track changeSlot checkin editDeliveryInstructions editPickupPerson editTip tip rateDriver cancel enableTip{...orderActionFragment}enableEdit{...orderActionFragment}rescheduleTireInstall{...orderActionFragment}cancelTireInstall{...orderActionFragment}help viewCancellationDetails{...cancellationDetailsActionFragment}}fragment cancellationDetailsActionFragment on CancellationDetailsAction{label heading text{...textFragment}}fragment ProofOfDeliveryFragment on ProofOfDelivery{photoUrl photoPreviewUrl showPreview}fragment DeliveryInstructionsFragment on DeliveryInstructions{text type typeText}fragment GiftDetailsFragment on GiftDetails{recipientAddress{fullName}recipientEmail senderName giftMessage}fragment SubstitutionAction on SubstitutionAction{message label type}fragment ODPGroupCategoryFragment on OrderCategory{type name subtext returnMessage substitutionsBanner{...textFragment}showExtendedSubstitutions actions{substitutions{...SubstitutionAction}nilPickReshop{message action{text url}}returnDetails viewCancellationDetails{...cancellationDetailsActionFragment}trackOnInHomeApp}banner{...textFragment}accordionState items{...orderLineItem}substitutions{...orderLineItem fulfilledItems{...orderLineItem}}returnInfo{...returnInfoFragment}}fragment ODPGroupFragment on OrderGroup{id fulfillmentType deliveryMessage deliveryAddress{fullName firstName lastName address{...addressFragment}}deliveryInstructions{...DeliveryInstructionsFragment}deliveryPreferences{text{...textFragment}cta{...orderActionFragment}}editSubstitutionsCutOff status{statusType showStatusTracker message{...textFragment}notice helpCenterText{...textFragment}}itemCount isCategorized categories{...ODPGroupCategoryFragment}seller{id name isPro}shipment{id trackingNumber}actions{reorder edit track changeSlot checkin editDeliveryInstructions editPickupPerson tip cancel help enableTip{...orderActionFragment}enableEdit{...orderActionFragment}viewCancellationDetails{...cancellationDetailsActionFragment}enableInHome{...orderActionFragment}createGiftReceipt}cutOffTimestamp isEditSubstitutionsEligible isInHome giftDetails{...GiftDetailsFragment}donationDetails{...orderDonationDetails}}fragment returnInfoFragment on ReturnInfo{returnOrderId type refundPriceDetails{__typename...refundPriceDetailsFragment}refundMessage tierRefundMessage paymentMethods{__typename description cardType paymentType displayValues message{...textFragment}}actions{__typename generate scheduleOrModifyPickup{text url}reschedulePickup editPickupContact}shippingLabelUrl qrCodeImageUrl carriers{__typename id name}pickupCarrier pickupContact{nameAndAddress{fullName firstName lastName address{addressString city state postalCode addressLineOne addressLineTwo country}}phone}pickupConfirmationNumber bannerMessage{...textFragment}}fragment refundPriceDetailsFragment on RefundPriceDetails{subTotal{__typename...orderPriceDetailRowFragment}fees{__typename...orderPriceDetailRowFragment}discounts{__typename...orderPriceDetailRowFragment}taxTotal{__typename...orderPriceDetailRowFragment}grandTotal{__typename...orderPriceDetailRowFragment}}fragment orderPriceDetailRowFragment on OrderPriceDetailRow{label displayValue value info{__typename title message}}fragment addressFragment on OrderAddress{addressString addressLineOne addressLineTwo state postalCode city}fragment ODPPickupInfo on OrderGroup{pickupInstructions pickupPerson{...person}alternatePickupPerson{...person}store{id name address{...addressFragment}}}fragment person on OrderPickupPerson{firstName lastName email}fragment ODPTippingInfo on OrderGroup{addTipMessage{...textFragment}driver{...DriverFragment}tipping{min{...price}max{...price}suggested{...price}preselected}subtotal{...price}}fragment orderActionFragment on Action{text url}fragment orderCustomer on OrderCustomer{id firstName lastName email isGuest isEmailRegistered}fragment OrderFieldsFragment on Order{__typename id version type customer{...orderCustomer}displayId idBarcodeImageUrl(barWidth:3 barHeight:100) isFuelPurchase title shortTitle timezone tippableGroup{...OrderGroupFragment}amendableGroup{id changeSlotIterationsLeft cutOffTimestamp fulfillmentType deliveryAddress{fullName firstName lastName address{addressString addressLineOne addressLineTwo state postalCode city country}}isAmendInProgress}substitutionsBanner{heading subheading longSubheading}groups_2101{__typename...OrderGroupFragment...ODPGroupFragment...ODPPickupInfo...ODPTippingInfo}multiboxBundles{...orderLineItem}itemCancelReasons{__typename...cancelReason}groupCancelReasons{__typename...cancelReason}priceDetails{__typename subTotal{__typename...priceDetailFragment}taxTotal{__typename...priceDetailFragment}grandTotal{__typename...priceDetailFragment}authorizationAmount{__typename...priceDetailFragment}fees{__typename...priceDetailFragment}discounts{__typename...priceDetailFragment}minimumThreshold{__typename...price}belowMinimumFee{__typename...priceDetailFragment}driverTip{__typename...priceDetailFragment}donations{__typename...priceDetailFragment}}paymentMethods{__typename description cardType paymentType displayValues message{...textFragment}actions{connectToCapitalOne{...orderActionFragment}visitAffirm{...orderActionFragment}}}actions{__typename return pendingReturn cancel startReturn{...orderActionFragment}reorder}banners{...textFragment}}","variables":{"orderId":"3932252074543","emailAddress":"livingston3676@charter.net"}}' \
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
    echo "'3932252074543" >> track-OrderID.txt
    echo "livingston3676@charter.net" >> track-email.txt
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
            if [[ `echo $curl1 | jq '.data.guestOrder.groups_2101['${i[@]}'].items['${j[@]}'].productInfo.usItemId'` == '"768720631"' ]]; then
                echo "'3932252074543" >> track-OrderID.txt
                echo livingston3676@charter.net >> track-email.txt
                echo $curl1 | jq '.data.guestOrder.groups_2101['${i[@]}'].items['${j[@]}'].productInfo.usItemId' >> track-usItemId.txt
                echo $curl1 | jq '.data.guestOrder.groups_2101['${i[@]}'].items['${j[@]}'].priceInfo.linePrice.value' >> track-priceValue.txt
                echo $curl1 | jq '.data.guestOrder.groups_2101['${i[@]}'].deliveryAddress.fullName' >> track-fullName.txt
                echo $curl1 | jq '.data.guestOrder.groups_2101['${i[@]}'].deliveryAddress.address.addressString' >> track-address.txt
                echo $curl1 | jq '.data.guestOrder.groups_2101['${i[@]}'].status.message.parts[].text' >> track-status.txt
                echo $curl1 | jq '.data.guestOrder.groups_2101['${i[@]}'].shipment.trackingNumber' | sed 's/null//g' >> track-number.txt
                echo $curl1 | jq '.data.guestOrder.groups_2101['${i[@]}'].shipment.trackingUrl' | sed 's/null//g' >> track-url.txt
                echo $curl1 | jq '.data.guestOrder.groups_2101['${i[@]}'].categories[].type' >> track-categoriesType.txt
                echo $curl1 | jq '.data.guestOrder.groups_2101['${i[@]}'].status.subtext' >> track-subtext.txt
                break
            fi
        done
    done
    if [[ $sum1 == `md5 track-OrderID.txt` ]]; then
        echo "1-Khác Item"
        echo "'3932252074543" >> track-OrderID.txt
        echo "livingston3676@charter.net" >> track-email.txt
        echo "Khác Item" >> track-usItemId.txt
        echo "Khác Item" >> track-priceValue.txt
        echo "Khác Item" >> track-fullName.txt
        echo "Khác Item" >> track-address.txt
        echo "Khác Item" >> track-status.txt
        echo "Khác Item" >> track-number.txt
        echo "Khác Item" >> track-url.txt
        echo "Khác Item" >> track-categoriesType.txt
        echo "Khác Item" >> track-subtext.txt
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
  -H 'user-agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.51 Safari/537.36 Edg/99.0.1150.39' \
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
  --data-raw $'{"query":"query getGuestOrder($orderId:ID\u0021 $emailAddress:String\u0021){guestOrder(input:{id:$orderId emailAddress:$emailAddress}){...OrderFieldsFragment}}fragment cancelReason on OrderCancelReason{__typename subReasonCode subDescription}fragment priceDetailFragment on OrderPriceDetailRow{label value displayValue info{title message}rowInfo{...orderPriceDetailRowInfo}}fragment orderPriceDetailRowInfo on OrderPriceDetailRowInfo{title message{...textFragment}}fragment price on Price{displayValue value}fragment variants on MapEntry{name value}fragment OrderAddOn on OrderAddOn{lineId uniqueLineId productInfo{name usItemId offerId}quantityString quantityLabel type fulfillmentInstructions{...textFragment}actions{manageProtectionPlan{...orderActionFragment}cancel}priceInfo{linePrice{...price}}quantity isActive}fragment orderDonationDetails on OrderDonationDetails{message{...textFragment}emailReceipt emailReceiptToken status{...textFragment}errorStatus}fragment orderLineItem on OrderLineItem{id uniqueId actions{contactSeller cancel addToCart configureCake reviewItem resendEGiftCardToken protectionPlan{...orderActionFragment}manageProtectionPlan{...orderActionFragment}}isGift digitalDeliveryMessage quantity quantityString quantityLabel isSubstitutionSelected fulfilledItems{id quantityString priceInfo{itemPrice{value}}productInfo{usItemId name}}isReturnable returnEligibilityMessage productInfo{name usItemId imageInfo{thumbnailUrl}canonicalUrl offerId orderLimit orderMinLimit weightIncrement salesUnit salesUnitType isSubstitutionEligible isAlcohol}reshop{reshopMessage isShippingAvailable minPromiseDate maxPromiseDate}selectedVariants{...variants}variantAdditionalInfo{parts{text nativeAction}}priceInfo{priceDisplayCodes{showItemPrice priceDisplayCondition finalCostByWeight}itemPrice{...price}linePrice{...price}unitPrice{...price}preDiscountedLinePrice{...price}additionalLines{name value}}discounts{label labelText{...textFragment}}itemReviewed activationCodes{label code}protectionPlanMessage{...textFragment}showSeller isShippedByWalmart seller{id name isPro}digitalDeliveryPhoneNumber addOns{...OrderAddOn}multiboxBundleId}fragment DriverFragment on Driver{id firstName photoUrl}fragment OrderGroupFragment on OrderGroup{driver{...DriverFragment}deliveryDate fulfillmentType status{...OrderGroupStatusFragment}showSeller isShippedByWalmart seller{...SellerFragment}id itemCount items{...LiteLineItemFragment}pickupPerson{firstName lastName email}accessPointId shipment{...ShipmentFragment}returnEligibilityMessage actions{...OrderGroupActionsFragment}recipientEmailAddress digitalDelivery{...DigitalDeliveryFragment}tireInstallationReservation{status extraText reservationId}}fragment OrderGroupStatusFragment on OrderGroupStatus{statusType showStatusTracker statusTracker{status label isCurrent}message{...textFragment}subtext subMessage{...textFragment}notice helpCenterText{...textFragment}}fragment textFragment on Text{parts{bold url text nativeAction lineBreak}}fragment LiteLineItemFragment on OrderLineItem{id quantity productInfo{name usItemId imageInfo{thumbnailUrl}offerId isAlcohol}priceInfo{linePrice{...price}}}fragment SellerFragment on GroupSeller{id name isPro}fragment DigitalDeliveryFragment on DigitalDelivery{title name instructions{...textFragment}}fragment ShipmentFragment on Shipment{id trackingNumber isExternalTracking trackingUrl proofOfDelivery{...ProofOfDeliveryFragment}}fragment OrderGroupActionsFragment on OrderGroupActions{reorder edit track changeSlot checkin editDeliveryInstructions editPickupPerson editTip tip rateDriver cancel enableTip{...orderActionFragment}enableEdit{...orderActionFragment}rescheduleTireInstall{...orderActionFragment}cancelTireInstall{...orderActionFragment}help viewCancellationDetails{...cancellationDetailsActionFragment}}fragment cancellationDetailsActionFragment on CancellationDetailsAction{label heading text{...textFragment}}fragment ProofOfDeliveryFragment on ProofOfDelivery{photoUrl photoPreviewUrl showPreview}fragment DeliveryInstructionsFragment on DeliveryInstructions{text type typeText}fragment GiftDetailsFragment on GiftDetails{recipientAddress{fullName}recipientEmail senderName giftMessage}fragment SubstitutionAction on SubstitutionAction{message label type}fragment ODPGroupCategoryFragment on OrderCategory{type name subtext returnMessage substitutionsBanner{...textFragment}showExtendedSubstitutions actions{substitutions{...SubstitutionAction}nilPickReshop{message action{text url}}returnDetails viewCancellationDetails{...cancellationDetailsActionFragment}trackOnInHomeApp}banner{...textFragment}accordionState items{...orderLineItem}substitutions{...orderLineItem fulfilledItems{...orderLineItem}}returnInfo{...returnInfoFragment}}fragment ODPGroupFragment on OrderGroup{id fulfillmentType deliveryMessage deliveryAddress{fullName firstName lastName address{...addressFragment}}deliveryInstructions{...DeliveryInstructionsFragment}deliveryPreferences{text{...textFragment}cta{...orderActionFragment}}editSubstitutionsCutOff status{statusType showStatusTracker message{...textFragment}notice helpCenterText{...textFragment}}itemCount isCategorized categories{...ODPGroupCategoryFragment}seller{id name isPro}shipment{id trackingNumber}actions{reorder edit track changeSlot checkin editDeliveryInstructions editPickupPerson tip cancel help enableTip{...orderActionFragment}enableEdit{...orderActionFragment}viewCancellationDetails{...cancellationDetailsActionFragment}enableInHome{...orderActionFragment}createGiftReceipt}cutOffTimestamp isEditSubstitutionsEligible isInHome giftDetails{...GiftDetailsFragment}donationDetails{...orderDonationDetails}}fragment returnInfoFragment on ReturnInfo{returnOrderId type refundPriceDetails{__typename...refundPriceDetailsFragment}refundMessage tierRefundMessage paymentMethods{__typename description cardType paymentType displayValues message{...textFragment}}actions{__typename generate scheduleOrModifyPickup{text url}reschedulePickup editPickupContact}shippingLabelUrl qrCodeImageUrl carriers{__typename id name}pickupCarrier pickupContact{nameAndAddress{fullName firstName lastName address{addressString city state postalCode addressLineOne addressLineTwo country}}phone}pickupConfirmationNumber bannerMessage{...textFragment}}fragment refundPriceDetailsFragment on RefundPriceDetails{subTotal{__typename...orderPriceDetailRowFragment}fees{__typename...orderPriceDetailRowFragment}discounts{__typename...orderPriceDetailRowFragment}taxTotal{__typename...orderPriceDetailRowFragment}grandTotal{__typename...orderPriceDetailRowFragment}}fragment orderPriceDetailRowFragment on OrderPriceDetailRow{label displayValue value info{__typename title message}}fragment addressFragment on OrderAddress{addressString addressLineOne addressLineTwo state postalCode city}fragment ODPPickupInfo on OrderGroup{pickupInstructions pickupPerson{...person}alternatePickupPerson{...person}store{id name address{...addressFragment}}}fragment person on OrderPickupPerson{firstName lastName email}fragment ODPTippingInfo on OrderGroup{addTipMessage{...textFragment}driver{...DriverFragment}tipping{min{...price}max{...price}suggested{...price}preselected}subtotal{...price}}fragment orderActionFragment on Action{text url}fragment orderCustomer on OrderCustomer{id firstName lastName email isGuest isEmailRegistered}fragment OrderFieldsFragment on Order{__typename id version type customer{...orderCustomer}displayId idBarcodeImageUrl(barWidth:3 barHeight:100) isFuelPurchase title shortTitle timezone tippableGroup{...OrderGroupFragment}amendableGroup{id changeSlotIterationsLeft cutOffTimestamp fulfillmentType deliveryAddress{fullName firstName lastName address{addressString addressLineOne addressLineTwo state postalCode city country}}isAmendInProgress}substitutionsBanner{heading subheading longSubheading}groups_2101{__typename...OrderGroupFragment...ODPGroupFragment...ODPPickupInfo...ODPTippingInfo}multiboxBundles{...orderLineItem}itemCancelReasons{__typename...cancelReason}groupCancelReasons{__typename...cancelReason}priceDetails{__typename subTotal{__typename...priceDetailFragment}taxTotal{__typename...priceDetailFragment}grandTotal{__typename...priceDetailFragment}authorizationAmount{__typename...priceDetailFragment}fees{__typename...priceDetailFragment}discounts{__typename...priceDetailFragment}minimumThreshold{__typename...price}belowMinimumFee{__typename...priceDetailFragment}driverTip{__typename...priceDetailFragment}donations{__typename...priceDetailFragment}}paymentMethods{__typename description cardType paymentType displayValues message{...textFragment}actions{connectToCapitalOne{...orderActionFragment}visitAffirm{...orderActionFragment}}}actions{__typename return pendingReturn cancel startReturn{...orderActionFragment}reorder}banners{...textFragment}}","variables":{"orderId":"3942254207389","emailAddress":"carrucini616@gmail.com"}}' \
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
    echo "'3942254207389" >> track-OrderID.txt
    echo "carrucini616@gmail.com" >> track-email.txt
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
            if [[ `echo $curl2 | jq '.data.guestOrder.groups_2101['${i[@]}'].items['${j[@]}'].productInfo.usItemId'` == '"21474150"' ]]; then
                echo "'3942254207389" >> track-OrderID.txt
                echo carrucini616@gmail.com >> track-email.txt
                echo $curl2 | jq '.data.guestOrder.groups_2101['${i[@]}'].items['${j[@]}'].productInfo.usItemId' >> track-usItemId.txt
                echo $curl2 | jq '.data.guestOrder.groups_2101['${i[@]}'].items['${j[@]}'].priceInfo.linePrice.value' >> track-priceValue.txt
                echo $curl2 | jq '.data.guestOrder.groups_2101['${i[@]}'].deliveryAddress.fullName' >> track-fullName.txt
                echo $curl2 | jq '.data.guestOrder.groups_2101['${i[@]}'].deliveryAddress.address.addressString' >> track-address.txt
                echo $curl2 | jq '.data.guestOrder.groups_2101['${i[@]}'].status.message.parts[].text' >> track-status.txt
                echo $curl2 | jq '.data.guestOrder.groups_2101['${i[@]}'].shipment.trackingNumber' | sed 's/null//g' >> track-number.txt
                echo $curl2 | jq '.data.guestOrder.groups_2101['${i[@]}'].shipment.trackingUrl' | sed 's/null//g' >> track-url.txt
                echo $curl2 | jq '.data.guestOrder.groups_2101['${i[@]}'].categories[].type' >> track-categoriesType.txt
                echo $curl2 | jq '.data.guestOrder.groups_2101['${i[@]}'].status.subtext' >> track-subtext.txt
                break
            fi
        done
    done
    if [[ $sum2 == `md5 track-OrderID.txt` ]]; then
        echo "2-Khác Item"
        echo "'3942254207389" >> track-OrderID.txt
        echo "carrucini616@gmail.com" >> track-email.txt
        echo "Khác Item" >> track-usItemId.txt
        echo "Khác Item" >> track-priceValue.txt
        echo "Khác Item" >> track-fullName.txt
        echo "Khác Item" >> track-address.txt
        echo "Khác Item" >> track-status.txt
        echo "Khác Item" >> track-number.txt
        echo "Khác Item" >> track-url.txt
        echo "Khác Item" >> track-categoriesType.txt
        echo "Khác Item" >> track-subtext.txt
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
  -H 'user-agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.51 Safari/537.36 Edg/99.0.1150.39' \
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
  --data-raw $'{"query":"query getGuestOrder($orderId:ID\u0021 $emailAddress:String\u0021){guestOrder(input:{id:$orderId emailAddress:$emailAddress}){...OrderFieldsFragment}}fragment cancelReason on OrderCancelReason{__typename subReasonCode subDescription}fragment priceDetailFragment on OrderPriceDetailRow{label value displayValue info{title message}rowInfo{...orderPriceDetailRowInfo}}fragment orderPriceDetailRowInfo on OrderPriceDetailRowInfo{title message{...textFragment}}fragment price on Price{displayValue value}fragment variants on MapEntry{name value}fragment OrderAddOn on OrderAddOn{lineId uniqueLineId productInfo{name usItemId offerId}quantityString quantityLabel type fulfillmentInstructions{...textFragment}actions{manageProtectionPlan{...orderActionFragment}cancel}priceInfo{linePrice{...price}}quantity isActive}fragment orderDonationDetails on OrderDonationDetails{message{...textFragment}emailReceipt emailReceiptToken status{...textFragment}errorStatus}fragment orderLineItem on OrderLineItem{id uniqueId actions{contactSeller cancel addToCart configureCake reviewItem resendEGiftCardToken protectionPlan{...orderActionFragment}manageProtectionPlan{...orderActionFragment}}isGift digitalDeliveryMessage quantity quantityString quantityLabel isSubstitutionSelected fulfilledItems{id quantityString priceInfo{itemPrice{value}}productInfo{usItemId name}}isReturnable returnEligibilityMessage productInfo{name usItemId imageInfo{thumbnailUrl}canonicalUrl offerId orderLimit orderMinLimit weightIncrement salesUnit salesUnitType isSubstitutionEligible isAlcohol}reshop{reshopMessage isShippingAvailable minPromiseDate maxPromiseDate}selectedVariants{...variants}variantAdditionalInfo{parts{text nativeAction}}priceInfo{priceDisplayCodes{showItemPrice priceDisplayCondition finalCostByWeight}itemPrice{...price}linePrice{...price}unitPrice{...price}preDiscountedLinePrice{...price}additionalLines{name value}}discounts{label labelText{...textFragment}}itemReviewed activationCodes{label code}protectionPlanMessage{...textFragment}showSeller isShippedByWalmart seller{id name isPro}digitalDeliveryPhoneNumber addOns{...OrderAddOn}multiboxBundleId}fragment DriverFragment on Driver{id firstName photoUrl}fragment OrderGroupFragment on OrderGroup{driver{...DriverFragment}deliveryDate fulfillmentType status{...OrderGroupStatusFragment}showSeller isShippedByWalmart seller{...SellerFragment}id itemCount items{...LiteLineItemFragment}pickupPerson{firstName lastName email}accessPointId shipment{...ShipmentFragment}returnEligibilityMessage actions{...OrderGroupActionsFragment}recipientEmailAddress digitalDelivery{...DigitalDeliveryFragment}tireInstallationReservation{status extraText reservationId}}fragment OrderGroupStatusFragment on OrderGroupStatus{statusType showStatusTracker statusTracker{status label isCurrent}message{...textFragment}subtext subMessage{...textFragment}notice helpCenterText{...textFragment}}fragment textFragment on Text{parts{bold url text nativeAction lineBreak}}fragment LiteLineItemFragment on OrderLineItem{id quantity productInfo{name usItemId imageInfo{thumbnailUrl}offerId isAlcohol}priceInfo{linePrice{...price}}}fragment SellerFragment on GroupSeller{id name isPro}fragment DigitalDeliveryFragment on DigitalDelivery{title name instructions{...textFragment}}fragment ShipmentFragment on Shipment{id trackingNumber isExternalTracking trackingUrl proofOfDelivery{...ProofOfDeliveryFragment}}fragment OrderGroupActionsFragment on OrderGroupActions{reorder edit track changeSlot checkin editDeliveryInstructions editPickupPerson editTip tip rateDriver cancel enableTip{...orderActionFragment}enableEdit{...orderActionFragment}rescheduleTireInstall{...orderActionFragment}cancelTireInstall{...orderActionFragment}help viewCancellationDetails{...cancellationDetailsActionFragment}}fragment cancellationDetailsActionFragment on CancellationDetailsAction{label heading text{...textFragment}}fragment ProofOfDeliveryFragment on ProofOfDelivery{photoUrl photoPreviewUrl showPreview}fragment DeliveryInstructionsFragment on DeliveryInstructions{text type typeText}fragment GiftDetailsFragment on GiftDetails{recipientAddress{fullName}recipientEmail senderName giftMessage}fragment SubstitutionAction on SubstitutionAction{message label type}fragment ODPGroupCategoryFragment on OrderCategory{type name subtext returnMessage substitutionsBanner{...textFragment}showExtendedSubstitutions actions{substitutions{...SubstitutionAction}nilPickReshop{message action{text url}}returnDetails viewCancellationDetails{...cancellationDetailsActionFragment}trackOnInHomeApp}banner{...textFragment}accordionState items{...orderLineItem}substitutions{...orderLineItem fulfilledItems{...orderLineItem}}returnInfo{...returnInfoFragment}}fragment ODPGroupFragment on OrderGroup{id fulfillmentType deliveryMessage deliveryAddress{fullName firstName lastName address{...addressFragment}}deliveryInstructions{...DeliveryInstructionsFragment}deliveryPreferences{text{...textFragment}cta{...orderActionFragment}}editSubstitutionsCutOff status{statusType showStatusTracker message{...textFragment}notice helpCenterText{...textFragment}}itemCount isCategorized categories{...ODPGroupCategoryFragment}seller{id name isPro}shipment{id trackingNumber}actions{reorder edit track changeSlot checkin editDeliveryInstructions editPickupPerson tip cancel help enableTip{...orderActionFragment}enableEdit{...orderActionFragment}viewCancellationDetails{...cancellationDetailsActionFragment}enableInHome{...orderActionFragment}createGiftReceipt}cutOffTimestamp isEditSubstitutionsEligible isInHome giftDetails{...GiftDetailsFragment}donationDetails{...orderDonationDetails}}fragment returnInfoFragment on ReturnInfo{returnOrderId type refundPriceDetails{__typename...refundPriceDetailsFragment}refundMessage tierRefundMessage paymentMethods{__typename description cardType paymentType displayValues message{...textFragment}}actions{__typename generate scheduleOrModifyPickup{text url}reschedulePickup editPickupContact}shippingLabelUrl qrCodeImageUrl carriers{__typename id name}pickupCarrier pickupContact{nameAndAddress{fullName firstName lastName address{addressString city state postalCode addressLineOne addressLineTwo country}}phone}pickupConfirmationNumber bannerMessage{...textFragment}}fragment refundPriceDetailsFragment on RefundPriceDetails{subTotal{__typename...orderPriceDetailRowFragment}fees{__typename...orderPriceDetailRowFragment}discounts{__typename...orderPriceDetailRowFragment}taxTotal{__typename...orderPriceDetailRowFragment}grandTotal{__typename...orderPriceDetailRowFragment}}fragment orderPriceDetailRowFragment on OrderPriceDetailRow{label displayValue value info{__typename title message}}fragment addressFragment on OrderAddress{addressString addressLineOne addressLineTwo state postalCode city}fragment ODPPickupInfo on OrderGroup{pickupInstructions pickupPerson{...person}alternatePickupPerson{...person}store{id name address{...addressFragment}}}fragment person on OrderPickupPerson{firstName lastName email}fragment ODPTippingInfo on OrderGroup{addTipMessage{...textFragment}driver{...DriverFragment}tipping{min{...price}max{...price}suggested{...price}preselected}subtotal{...price}}fragment orderActionFragment on Action{text url}fragment orderCustomer on OrderCustomer{id firstName lastName email isGuest isEmailRegistered}fragment OrderFieldsFragment on Order{__typename id version type customer{...orderCustomer}displayId idBarcodeImageUrl(barWidth:3 barHeight:100) isFuelPurchase title shortTitle timezone tippableGroup{...OrderGroupFragment}amendableGroup{id changeSlotIterationsLeft cutOffTimestamp fulfillmentType deliveryAddress{fullName firstName lastName address{addressString addressLineOne addressLineTwo state postalCode city country}}isAmendInProgress}substitutionsBanner{heading subheading longSubheading}groups_2101{__typename...OrderGroupFragment...ODPGroupFragment...ODPPickupInfo...ODPTippingInfo}multiboxBundles{...orderLineItem}itemCancelReasons{__typename...cancelReason}groupCancelReasons{__typename...cancelReason}priceDetails{__typename subTotal{__typename...priceDetailFragment}taxTotal{__typename...priceDetailFragment}grandTotal{__typename...priceDetailFragment}authorizationAmount{__typename...priceDetailFragment}fees{__typename...priceDetailFragment}discounts{__typename...priceDetailFragment}minimumThreshold{__typename...price}belowMinimumFee{__typename...priceDetailFragment}driverTip{__typename...priceDetailFragment}donations{__typename...priceDetailFragment}}paymentMethods{__typename description cardType paymentType displayValues message{...textFragment}actions{connectToCapitalOne{...orderActionFragment}visitAffirm{...orderActionFragment}}}actions{__typename return pendingReturn cancel startReturn{...orderActionFragment}reorder}banners{...textFragment}}","variables":{"orderId":"3942254568536","emailAddress":"openbox2@charter.net"}}' \
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
    echo "'3942254568536" >> track-OrderID.txt
    echo "openbox2@charter.net" >> track-email.txt
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
            if [[ `echo $curl3 | jq '.data.guestOrder.groups_2101['${i[@]}'].items['${j[@]}'].productInfo.usItemId'` == '"313546419"' ]]; then
                echo "'3942254568536" >> track-OrderID.txt
                echo openbox2@charter.net >> track-email.txt
                echo $curl3 | jq '.data.guestOrder.groups_2101['${i[@]}'].items['${j[@]}'].productInfo.usItemId' >> track-usItemId.txt
                echo $curl3 | jq '.data.guestOrder.groups_2101['${i[@]}'].items['${j[@]}'].priceInfo.linePrice.value' >> track-priceValue.txt
                echo $curl3 | jq '.data.guestOrder.groups_2101['${i[@]}'].deliveryAddress.fullName' >> track-fullName.txt
                echo $curl3 | jq '.data.guestOrder.groups_2101['${i[@]}'].deliveryAddress.address.addressString' >> track-address.txt
                echo $curl3 | jq '.data.guestOrder.groups_2101['${i[@]}'].status.message.parts[].text' >> track-status.txt
                echo $curl3 | jq '.data.guestOrder.groups_2101['${i[@]}'].shipment.trackingNumber' | sed 's/null//g' >> track-number.txt
                echo $curl3 | jq '.data.guestOrder.groups_2101['${i[@]}'].shipment.trackingUrl' | sed 's/null//g' >> track-url.txt
                echo $curl3 | jq '.data.guestOrder.groups_2101['${i[@]}'].categories[].type' >> track-categoriesType.txt
                echo $curl3 | jq '.data.guestOrder.groups_2101['${i[@]}'].status.subtext' >> track-subtext.txt
                break
            fi
        done
    done
    if [[ $sum3 == `md5 track-OrderID.txt` ]]; then
        echo "3-Khác Item"
        echo "'3942254568536" >> track-OrderID.txt
        echo "openbox2@charter.net" >> track-email.txt
        echo "Khác Item" >> track-usItemId.txt
        echo "Khác Item" >> track-priceValue.txt
        echo "Khác Item" >> track-fullName.txt
        echo "Khác Item" >> track-address.txt
        echo "Khác Item" >> track-status.txt
        echo "Khác Item" >> track-number.txt
        echo "Khác Item" >> track-url.txt
        echo "Khác Item" >> track-categoriesType.txt
        echo "Khác Item" >> track-subtext.txt
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
  -H 'user-agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.51 Safari/537.36 Edg/99.0.1150.39' \
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
  --data-raw $'{"query":"query getGuestOrder($orderId:ID\u0021 $emailAddress:String\u0021){guestOrder(input:{id:$orderId emailAddress:$emailAddress}){...OrderFieldsFragment}}fragment cancelReason on OrderCancelReason{__typename subReasonCode subDescription}fragment priceDetailFragment on OrderPriceDetailRow{label value displayValue info{title message}rowInfo{...orderPriceDetailRowInfo}}fragment orderPriceDetailRowInfo on OrderPriceDetailRowInfo{title message{...textFragment}}fragment price on Price{displayValue value}fragment variants on MapEntry{name value}fragment OrderAddOn on OrderAddOn{lineId uniqueLineId productInfo{name usItemId offerId}quantityString quantityLabel type fulfillmentInstructions{...textFragment}actions{manageProtectionPlan{...orderActionFragment}cancel}priceInfo{linePrice{...price}}quantity isActive}fragment orderDonationDetails on OrderDonationDetails{message{...textFragment}emailReceipt emailReceiptToken status{...textFragment}errorStatus}fragment orderLineItem on OrderLineItem{id uniqueId actions{contactSeller cancel addToCart configureCake reviewItem resendEGiftCardToken protectionPlan{...orderActionFragment}manageProtectionPlan{...orderActionFragment}}isGift digitalDeliveryMessage quantity quantityString quantityLabel isSubstitutionSelected fulfilledItems{id quantityString priceInfo{itemPrice{value}}productInfo{usItemId name}}isReturnable returnEligibilityMessage productInfo{name usItemId imageInfo{thumbnailUrl}canonicalUrl offerId orderLimit orderMinLimit weightIncrement salesUnit salesUnitType isSubstitutionEligible isAlcohol}reshop{reshopMessage isShippingAvailable minPromiseDate maxPromiseDate}selectedVariants{...variants}variantAdditionalInfo{parts{text nativeAction}}priceInfo{priceDisplayCodes{showItemPrice priceDisplayCondition finalCostByWeight}itemPrice{...price}linePrice{...price}unitPrice{...price}preDiscountedLinePrice{...price}additionalLines{name value}}discounts{label labelText{...textFragment}}itemReviewed activationCodes{label code}protectionPlanMessage{...textFragment}showSeller isShippedByWalmart seller{id name isPro}digitalDeliveryPhoneNumber addOns{...OrderAddOn}multiboxBundleId}fragment DriverFragment on Driver{id firstName photoUrl}fragment OrderGroupFragment on OrderGroup{driver{...DriverFragment}deliveryDate fulfillmentType status{...OrderGroupStatusFragment}showSeller isShippedByWalmart seller{...SellerFragment}id itemCount items{...LiteLineItemFragment}pickupPerson{firstName lastName email}accessPointId shipment{...ShipmentFragment}returnEligibilityMessage actions{...OrderGroupActionsFragment}recipientEmailAddress digitalDelivery{...DigitalDeliveryFragment}tireInstallationReservation{status extraText reservationId}}fragment OrderGroupStatusFragment on OrderGroupStatus{statusType showStatusTracker statusTracker{status label isCurrent}message{...textFragment}subtext subMessage{...textFragment}notice helpCenterText{...textFragment}}fragment textFragment on Text{parts{bold url text nativeAction lineBreak}}fragment LiteLineItemFragment on OrderLineItem{id quantity productInfo{name usItemId imageInfo{thumbnailUrl}offerId isAlcohol}priceInfo{linePrice{...price}}}fragment SellerFragment on GroupSeller{id name isPro}fragment DigitalDeliveryFragment on DigitalDelivery{title name instructions{...textFragment}}fragment ShipmentFragment on Shipment{id trackingNumber isExternalTracking trackingUrl proofOfDelivery{...ProofOfDeliveryFragment}}fragment OrderGroupActionsFragment on OrderGroupActions{reorder edit track changeSlot checkin editDeliveryInstructions editPickupPerson editTip tip rateDriver cancel enableTip{...orderActionFragment}enableEdit{...orderActionFragment}rescheduleTireInstall{...orderActionFragment}cancelTireInstall{...orderActionFragment}help viewCancellationDetails{...cancellationDetailsActionFragment}}fragment cancellationDetailsActionFragment on CancellationDetailsAction{label heading text{...textFragment}}fragment ProofOfDeliveryFragment on ProofOfDelivery{photoUrl photoPreviewUrl showPreview}fragment DeliveryInstructionsFragment on DeliveryInstructions{text type typeText}fragment GiftDetailsFragment on GiftDetails{recipientAddress{fullName}recipientEmail senderName giftMessage}fragment SubstitutionAction on SubstitutionAction{message label type}fragment ODPGroupCategoryFragment on OrderCategory{type name subtext returnMessage substitutionsBanner{...textFragment}showExtendedSubstitutions actions{substitutions{...SubstitutionAction}nilPickReshop{message action{text url}}returnDetails viewCancellationDetails{...cancellationDetailsActionFragment}trackOnInHomeApp}banner{...textFragment}accordionState items{...orderLineItem}substitutions{...orderLineItem fulfilledItems{...orderLineItem}}returnInfo{...returnInfoFragment}}fragment ODPGroupFragment on OrderGroup{id fulfillmentType deliveryMessage deliveryAddress{fullName firstName lastName address{...addressFragment}}deliveryInstructions{...DeliveryInstructionsFragment}deliveryPreferences{text{...textFragment}cta{...orderActionFragment}}editSubstitutionsCutOff status{statusType showStatusTracker message{...textFragment}notice helpCenterText{...textFragment}}itemCount isCategorized categories{...ODPGroupCategoryFragment}seller{id name isPro}shipment{id trackingNumber}actions{reorder edit track changeSlot checkin editDeliveryInstructions editPickupPerson tip cancel help enableTip{...orderActionFragment}enableEdit{...orderActionFragment}viewCancellationDetails{...cancellationDetailsActionFragment}enableInHome{...orderActionFragment}createGiftReceipt}cutOffTimestamp isEditSubstitutionsEligible isInHome giftDetails{...GiftDetailsFragment}donationDetails{...orderDonationDetails}}fragment returnInfoFragment on ReturnInfo{returnOrderId type refundPriceDetails{__typename...refundPriceDetailsFragment}refundMessage tierRefundMessage paymentMethods{__typename description cardType paymentType displayValues message{...textFragment}}actions{__typename generate scheduleOrModifyPickup{text url}reschedulePickup editPickupContact}shippingLabelUrl qrCodeImageUrl carriers{__typename id name}pickupCarrier pickupContact{nameAndAddress{fullName firstName lastName address{addressString city state postalCode addressLineOne addressLineTwo country}}phone}pickupConfirmationNumber bannerMessage{...textFragment}}fragment refundPriceDetailsFragment on RefundPriceDetails{subTotal{__typename...orderPriceDetailRowFragment}fees{__typename...orderPriceDetailRowFragment}discounts{__typename...orderPriceDetailRowFragment}taxTotal{__typename...orderPriceDetailRowFragment}grandTotal{__typename...orderPriceDetailRowFragment}}fragment orderPriceDetailRowFragment on OrderPriceDetailRow{label displayValue value info{__typename title message}}fragment addressFragment on OrderAddress{addressString addressLineOne addressLineTwo state postalCode city}fragment ODPPickupInfo on OrderGroup{pickupInstructions pickupPerson{...person}alternatePickupPerson{...person}store{id name address{...addressFragment}}}fragment person on OrderPickupPerson{firstName lastName email}fragment ODPTippingInfo on OrderGroup{addTipMessage{...textFragment}driver{...DriverFragment}tipping{min{...price}max{...price}suggested{...price}preselected}subtotal{...price}}fragment orderActionFragment on Action{text url}fragment orderCustomer on OrderCustomer{id firstName lastName email isGuest isEmailRegistered}fragment OrderFieldsFragment on Order{__typename id version type customer{...orderCustomer}displayId idBarcodeImageUrl(barWidth:3 barHeight:100) isFuelPurchase title shortTitle timezone tippableGroup{...OrderGroupFragment}amendableGroup{id changeSlotIterationsLeft cutOffTimestamp fulfillmentType deliveryAddress{fullName firstName lastName address{addressString addressLineOne addressLineTwo state postalCode city country}}isAmendInProgress}substitutionsBanner{heading subheading longSubheading}groups_2101{__typename...OrderGroupFragment...ODPGroupFragment...ODPPickupInfo...ODPTippingInfo}multiboxBundles{...orderLineItem}itemCancelReasons{__typename...cancelReason}groupCancelReasons{__typename...cancelReason}priceDetails{__typename subTotal{__typename...priceDetailFragment}taxTotal{__typename...priceDetailFragment}grandTotal{__typename...priceDetailFragment}authorizationAmount{__typename...priceDetailFragment}fees{__typename...priceDetailFragment}discounts{__typename...priceDetailFragment}minimumThreshold{__typename...price}belowMinimumFee{__typename...priceDetailFragment}driverTip{__typename...priceDetailFragment}donations{__typename...priceDetailFragment}}paymentMethods{__typename description cardType paymentType displayValues message{...textFragment}actions{connectToCapitalOne{...orderActionFragment}visitAffirm{...orderActionFragment}}}actions{__typename return pendingReturn cancel startReturn{...orderActionFragment}reorder}banners{...textFragment}}","variables":{"orderId":"3942254086837","emailAddress":"steinj@ptd.net"}}' \
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
    echo "'3942254086837" >> track-OrderID.txt
    echo "steinj@ptd.net" >> track-email.txt
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
            if [[ `echo $curl4 | jq '.data.guestOrder.groups_2101['${i[@]}'].items['${j[@]}'].productInfo.usItemId'` == '"348284886"' ]]; then
                echo "'3942254086837" >> track-OrderID.txt
                echo steinj@ptd.net >> track-email.txt
                echo $curl4 | jq '.data.guestOrder.groups_2101['${i[@]}'].items['${j[@]}'].productInfo.usItemId' >> track-usItemId.txt
                echo $curl4 | jq '.data.guestOrder.groups_2101['${i[@]}'].items['${j[@]}'].priceInfo.linePrice.value' >> track-priceValue.txt
                echo $curl4 | jq '.data.guestOrder.groups_2101['${i[@]}'].deliveryAddress.fullName' >> track-fullName.txt
                echo $curl4 | jq '.data.guestOrder.groups_2101['${i[@]}'].deliveryAddress.address.addressString' >> track-address.txt
                echo $curl4 | jq '.data.guestOrder.groups_2101['${i[@]}'].status.message.parts[].text' >> track-status.txt
                echo $curl4 | jq '.data.guestOrder.groups_2101['${i[@]}'].shipment.trackingNumber' | sed 's/null//g' >> track-number.txt
                echo $curl4 | jq '.data.guestOrder.groups_2101['${i[@]}'].shipment.trackingUrl' | sed 's/null//g' >> track-url.txt
                echo $curl4 | jq '.data.guestOrder.groups_2101['${i[@]}'].categories[].type' >> track-categoriesType.txt
                echo $curl4 | jq '.data.guestOrder.groups_2101['${i[@]}'].status.subtext' >> track-subtext.txt
                break
            fi
        done
    done
    if [[ $sum4 == `md5 track-OrderID.txt` ]]; then
        echo "4-Khác Item"
        echo "'3942254086837" >> track-OrderID.txt
        echo "steinj@ptd.net" >> track-email.txt
        echo "Khác Item" >> track-usItemId.txt
        echo "Khác Item" >> track-priceValue.txt
        echo "Khác Item" >> track-fullName.txt
        echo "Khác Item" >> track-address.txt
        echo "Khác Item" >> track-status.txt
        echo "Khác Item" >> track-number.txt
        echo "Khác Item" >> track-url.txt
        echo "Khác Item" >> track-categoriesType.txt
        echo "Khác Item" >> track-subtext.txt
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
  -H 'user-agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.51 Safari/537.36 Edg/99.0.1150.39' \
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
  --data-raw $'{"query":"query getGuestOrder($orderId:ID\u0021 $emailAddress:String\u0021){guestOrder(input:{id:$orderId emailAddress:$emailAddress}){...OrderFieldsFragment}}fragment cancelReason on OrderCancelReason{__typename subReasonCode subDescription}fragment priceDetailFragment on OrderPriceDetailRow{label value displayValue info{title message}rowInfo{...orderPriceDetailRowInfo}}fragment orderPriceDetailRowInfo on OrderPriceDetailRowInfo{title message{...textFragment}}fragment price on Price{displayValue value}fragment variants on MapEntry{name value}fragment OrderAddOn on OrderAddOn{lineId uniqueLineId productInfo{name usItemId offerId}quantityString quantityLabel type fulfillmentInstructions{...textFragment}actions{manageProtectionPlan{...orderActionFragment}cancel}priceInfo{linePrice{...price}}quantity isActive}fragment orderDonationDetails on OrderDonationDetails{message{...textFragment}emailReceipt emailReceiptToken status{...textFragment}errorStatus}fragment orderLineItem on OrderLineItem{id uniqueId actions{contactSeller cancel addToCart configureCake reviewItem resendEGiftCardToken protectionPlan{...orderActionFragment}manageProtectionPlan{...orderActionFragment}}isGift digitalDeliveryMessage quantity quantityString quantityLabel isSubstitutionSelected fulfilledItems{id quantityString priceInfo{itemPrice{value}}productInfo{usItemId name}}isReturnable returnEligibilityMessage productInfo{name usItemId imageInfo{thumbnailUrl}canonicalUrl offerId orderLimit orderMinLimit weightIncrement salesUnit salesUnitType isSubstitutionEligible isAlcohol}reshop{reshopMessage isShippingAvailable minPromiseDate maxPromiseDate}selectedVariants{...variants}variantAdditionalInfo{parts{text nativeAction}}priceInfo{priceDisplayCodes{showItemPrice priceDisplayCondition finalCostByWeight}itemPrice{...price}linePrice{...price}unitPrice{...price}preDiscountedLinePrice{...price}additionalLines{name value}}discounts{label labelText{...textFragment}}itemReviewed activationCodes{label code}protectionPlanMessage{...textFragment}showSeller isShippedByWalmart seller{id name isPro}digitalDeliveryPhoneNumber addOns{...OrderAddOn}multiboxBundleId}fragment DriverFragment on Driver{id firstName photoUrl}fragment OrderGroupFragment on OrderGroup{driver{...DriverFragment}deliveryDate fulfillmentType status{...OrderGroupStatusFragment}showSeller isShippedByWalmart seller{...SellerFragment}id itemCount items{...LiteLineItemFragment}pickupPerson{firstName lastName email}accessPointId shipment{...ShipmentFragment}returnEligibilityMessage actions{...OrderGroupActionsFragment}recipientEmailAddress digitalDelivery{...DigitalDeliveryFragment}tireInstallationReservation{status extraText reservationId}}fragment OrderGroupStatusFragment on OrderGroupStatus{statusType showStatusTracker statusTracker{status label isCurrent}message{...textFragment}subtext subMessage{...textFragment}notice helpCenterText{...textFragment}}fragment textFragment on Text{parts{bold url text nativeAction lineBreak}}fragment LiteLineItemFragment on OrderLineItem{id quantity productInfo{name usItemId imageInfo{thumbnailUrl}offerId isAlcohol}priceInfo{linePrice{...price}}}fragment SellerFragment on GroupSeller{id name isPro}fragment DigitalDeliveryFragment on DigitalDelivery{title name instructions{...textFragment}}fragment ShipmentFragment on Shipment{id trackingNumber isExternalTracking trackingUrl proofOfDelivery{...ProofOfDeliveryFragment}}fragment OrderGroupActionsFragment on OrderGroupActions{reorder edit track changeSlot checkin editDeliveryInstructions editPickupPerson editTip tip rateDriver cancel enableTip{...orderActionFragment}enableEdit{...orderActionFragment}rescheduleTireInstall{...orderActionFragment}cancelTireInstall{...orderActionFragment}help viewCancellationDetails{...cancellationDetailsActionFragment}}fragment cancellationDetailsActionFragment on CancellationDetailsAction{label heading text{...textFragment}}fragment ProofOfDeliveryFragment on ProofOfDelivery{photoUrl photoPreviewUrl showPreview}fragment DeliveryInstructionsFragment on DeliveryInstructions{text type typeText}fragment GiftDetailsFragment on GiftDetails{recipientAddress{fullName}recipientEmail senderName giftMessage}fragment SubstitutionAction on SubstitutionAction{message label type}fragment ODPGroupCategoryFragment on OrderCategory{type name subtext returnMessage substitutionsBanner{...textFragment}showExtendedSubstitutions actions{substitutions{...SubstitutionAction}nilPickReshop{message action{text url}}returnDetails viewCancellationDetails{...cancellationDetailsActionFragment}trackOnInHomeApp}banner{...textFragment}accordionState items{...orderLineItem}substitutions{...orderLineItem fulfilledItems{...orderLineItem}}returnInfo{...returnInfoFragment}}fragment ODPGroupFragment on OrderGroup{id fulfillmentType deliveryMessage deliveryAddress{fullName firstName lastName address{...addressFragment}}deliveryInstructions{...DeliveryInstructionsFragment}deliveryPreferences{text{...textFragment}cta{...orderActionFragment}}editSubstitutionsCutOff status{statusType showStatusTracker message{...textFragment}notice helpCenterText{...textFragment}}itemCount isCategorized categories{...ODPGroupCategoryFragment}seller{id name isPro}shipment{id trackingNumber}actions{reorder edit track changeSlot checkin editDeliveryInstructions editPickupPerson tip cancel help enableTip{...orderActionFragment}enableEdit{...orderActionFragment}viewCancellationDetails{...cancellationDetailsActionFragment}enableInHome{...orderActionFragment}createGiftReceipt}cutOffTimestamp isEditSubstitutionsEligible isInHome giftDetails{...GiftDetailsFragment}donationDetails{...orderDonationDetails}}fragment returnInfoFragment on ReturnInfo{returnOrderId type refundPriceDetails{__typename...refundPriceDetailsFragment}refundMessage tierRefundMessage paymentMethods{__typename description cardType paymentType displayValues message{...textFragment}}actions{__typename generate scheduleOrModifyPickup{text url}reschedulePickup editPickupContact}shippingLabelUrl qrCodeImageUrl carriers{__typename id name}pickupCarrier pickupContact{nameAndAddress{fullName firstName lastName address{addressString city state postalCode addressLineOne addressLineTwo country}}phone}pickupConfirmationNumber bannerMessage{...textFragment}}fragment refundPriceDetailsFragment on RefundPriceDetails{subTotal{__typename...orderPriceDetailRowFragment}fees{__typename...orderPriceDetailRowFragment}discounts{__typename...orderPriceDetailRowFragment}taxTotal{__typename...orderPriceDetailRowFragment}grandTotal{__typename...orderPriceDetailRowFragment}}fragment orderPriceDetailRowFragment on OrderPriceDetailRow{label displayValue value info{__typename title message}}fragment addressFragment on OrderAddress{addressString addressLineOne addressLineTwo state postalCode city}fragment ODPPickupInfo on OrderGroup{pickupInstructions pickupPerson{...person}alternatePickupPerson{...person}store{id name address{...addressFragment}}}fragment person on OrderPickupPerson{firstName lastName email}fragment ODPTippingInfo on OrderGroup{addTipMessage{...textFragment}driver{...DriverFragment}tipping{min{...price}max{...price}suggested{...price}preselected}subtotal{...price}}fragment orderActionFragment on Action{text url}fragment orderCustomer on OrderCustomer{id firstName lastName email isGuest isEmailRegistered}fragment OrderFieldsFragment on Order{__typename id version type customer{...orderCustomer}displayId idBarcodeImageUrl(barWidth:3 barHeight:100) isFuelPurchase title shortTitle timezone tippableGroup{...OrderGroupFragment}amendableGroup{id changeSlotIterationsLeft cutOffTimestamp fulfillmentType deliveryAddress{fullName firstName lastName address{addressString addressLineOne addressLineTwo state postalCode city country}}isAmendInProgress}substitutionsBanner{heading subheading longSubheading}groups_2101{__typename...OrderGroupFragment...ODPGroupFragment...ODPPickupInfo...ODPTippingInfo}multiboxBundles{...orderLineItem}itemCancelReasons{__typename...cancelReason}groupCancelReasons{__typename...cancelReason}priceDetails{__typename subTotal{__typename...priceDetailFragment}taxTotal{__typename...priceDetailFragment}grandTotal{__typename...priceDetailFragment}authorizationAmount{__typename...priceDetailFragment}fees{__typename...priceDetailFragment}discounts{__typename...priceDetailFragment}minimumThreshold{__typename...price}belowMinimumFee{__typename...priceDetailFragment}driverTip{__typename...priceDetailFragment}donations{__typename...priceDetailFragment}}paymentMethods{__typename description cardType paymentType displayValues message{...textFragment}actions{connectToCapitalOne{...orderActionFragment}visitAffirm{...orderActionFragment}}}actions{__typename return pendingReturn cancel startReturn{...orderActionFragment}reorder}banners{...textFragment}}","variables":{"orderId":"3942254380473","emailAddress":"tommyrickettjr1968@gmail.com"}}' \
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
    echo "'3942254380473" >> track-OrderID.txt
    echo "tommyrickettjr1968@gmail.com" >> track-email.txt
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
            if [[ `echo $curl5 | jq '.data.guestOrder.groups_2101['${i[@]}'].items['${j[@]}'].productInfo.usItemId'` == '"348284886"' ]]; then
                echo "'3942254380473" >> track-OrderID.txt
                echo tommyrickettjr1968@gmail.com >> track-email.txt
                echo $curl5 | jq '.data.guestOrder.groups_2101['${i[@]}'].items['${j[@]}'].productInfo.usItemId' >> track-usItemId.txt
                echo $curl5 | jq '.data.guestOrder.groups_2101['${i[@]}'].items['${j[@]}'].priceInfo.linePrice.value' >> track-priceValue.txt
                echo $curl5 | jq '.data.guestOrder.groups_2101['${i[@]}'].deliveryAddress.fullName' >> track-fullName.txt
                echo $curl5 | jq '.data.guestOrder.groups_2101['${i[@]}'].deliveryAddress.address.addressString' >> track-address.txt
                echo $curl5 | jq '.data.guestOrder.groups_2101['${i[@]}'].status.message.parts[].text' >> track-status.txt
                echo $curl5 | jq '.data.guestOrder.groups_2101['${i[@]}'].shipment.trackingNumber' | sed 's/null//g' >> track-number.txt
                echo $curl5 | jq '.data.guestOrder.groups_2101['${i[@]}'].shipment.trackingUrl' | sed 's/null//g' >> track-url.txt
                echo $curl5 | jq '.data.guestOrder.groups_2101['${i[@]}'].categories[].type' >> track-categoriesType.txt
                echo $curl5 | jq '.data.guestOrder.groups_2101['${i[@]}'].status.subtext' >> track-subtext.txt
                break
            fi
        done
    done
    if [[ $sum5 == `md5 track-OrderID.txt` ]]; then
        echo "5-Khác Item"
        echo "'3942254380473" >> track-OrderID.txt
        echo "tommyrickettjr1968@gmail.com" >> track-email.txt
        echo "Khác Item" >> track-usItemId.txt
        echo "Khác Item" >> track-priceValue.txt
        echo "Khác Item" >> track-fullName.txt
        echo "Khác Item" >> track-address.txt
        echo "Khác Item" >> track-status.txt
        echo "Khác Item" >> track-number.txt
        echo "Khác Item" >> track-url.txt
        echo "Khác Item" >> track-categoriesType.txt
        echo "Khác Item" >> track-subtext.txt
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
  -H 'user-agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.51 Safari/537.36 Edg/99.0.1150.39' \
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
  --data-raw $'{"query":"query getGuestOrder($orderId:ID\u0021 $emailAddress:String\u0021){guestOrder(input:{id:$orderId emailAddress:$emailAddress}){...OrderFieldsFragment}}fragment cancelReason on OrderCancelReason{__typename subReasonCode subDescription}fragment priceDetailFragment on OrderPriceDetailRow{label value displayValue info{title message}rowInfo{...orderPriceDetailRowInfo}}fragment orderPriceDetailRowInfo on OrderPriceDetailRowInfo{title message{...textFragment}}fragment price on Price{displayValue value}fragment variants on MapEntry{name value}fragment OrderAddOn on OrderAddOn{lineId uniqueLineId productInfo{name usItemId offerId}quantityString quantityLabel type fulfillmentInstructions{...textFragment}actions{manageProtectionPlan{...orderActionFragment}cancel}priceInfo{linePrice{...price}}quantity isActive}fragment orderDonationDetails on OrderDonationDetails{message{...textFragment}emailReceipt emailReceiptToken status{...textFragment}errorStatus}fragment orderLineItem on OrderLineItem{id uniqueId actions{contactSeller cancel addToCart configureCake reviewItem resendEGiftCardToken protectionPlan{...orderActionFragment}manageProtectionPlan{...orderActionFragment}}isGift digitalDeliveryMessage quantity quantityString quantityLabel isSubstitutionSelected fulfilledItems{id quantityString priceInfo{itemPrice{value}}productInfo{usItemId name}}isReturnable returnEligibilityMessage productInfo{name usItemId imageInfo{thumbnailUrl}canonicalUrl offerId orderLimit orderMinLimit weightIncrement salesUnit salesUnitType isSubstitutionEligible isAlcohol}reshop{reshopMessage isShippingAvailable minPromiseDate maxPromiseDate}selectedVariants{...variants}variantAdditionalInfo{parts{text nativeAction}}priceInfo{priceDisplayCodes{showItemPrice priceDisplayCondition finalCostByWeight}itemPrice{...price}linePrice{...price}unitPrice{...price}preDiscountedLinePrice{...price}additionalLines{name value}}discounts{label labelText{...textFragment}}itemReviewed activationCodes{label code}protectionPlanMessage{...textFragment}showSeller isShippedByWalmart seller{id name isPro}digitalDeliveryPhoneNumber addOns{...OrderAddOn}multiboxBundleId}fragment DriverFragment on Driver{id firstName photoUrl}fragment OrderGroupFragment on OrderGroup{driver{...DriverFragment}deliveryDate fulfillmentType status{...OrderGroupStatusFragment}showSeller isShippedByWalmart seller{...SellerFragment}id itemCount items{...LiteLineItemFragment}pickupPerson{firstName lastName email}accessPointId shipment{...ShipmentFragment}returnEligibilityMessage actions{...OrderGroupActionsFragment}recipientEmailAddress digitalDelivery{...DigitalDeliveryFragment}tireInstallationReservation{status extraText reservationId}}fragment OrderGroupStatusFragment on OrderGroupStatus{statusType showStatusTracker statusTracker{status label isCurrent}message{...textFragment}subtext subMessage{...textFragment}notice helpCenterText{...textFragment}}fragment textFragment on Text{parts{bold url text nativeAction lineBreak}}fragment LiteLineItemFragment on OrderLineItem{id quantity productInfo{name usItemId imageInfo{thumbnailUrl}offerId isAlcohol}priceInfo{linePrice{...price}}}fragment SellerFragment on GroupSeller{id name isPro}fragment DigitalDeliveryFragment on DigitalDelivery{title name instructions{...textFragment}}fragment ShipmentFragment on Shipment{id trackingNumber isExternalTracking trackingUrl proofOfDelivery{...ProofOfDeliveryFragment}}fragment OrderGroupActionsFragment on OrderGroupActions{reorder edit track changeSlot checkin editDeliveryInstructions editPickupPerson editTip tip rateDriver cancel enableTip{...orderActionFragment}enableEdit{...orderActionFragment}rescheduleTireInstall{...orderActionFragment}cancelTireInstall{...orderActionFragment}help viewCancellationDetails{...cancellationDetailsActionFragment}}fragment cancellationDetailsActionFragment on CancellationDetailsAction{label heading text{...textFragment}}fragment ProofOfDeliveryFragment on ProofOfDelivery{photoUrl photoPreviewUrl showPreview}fragment DeliveryInstructionsFragment on DeliveryInstructions{text type typeText}fragment GiftDetailsFragment on GiftDetails{recipientAddress{fullName}recipientEmail senderName giftMessage}fragment SubstitutionAction on SubstitutionAction{message label type}fragment ODPGroupCategoryFragment on OrderCategory{type name subtext returnMessage substitutionsBanner{...textFragment}showExtendedSubstitutions actions{substitutions{...SubstitutionAction}nilPickReshop{message action{text url}}returnDetails viewCancellationDetails{...cancellationDetailsActionFragment}trackOnInHomeApp}banner{...textFragment}accordionState items{...orderLineItem}substitutions{...orderLineItem fulfilledItems{...orderLineItem}}returnInfo{...returnInfoFragment}}fragment ODPGroupFragment on OrderGroup{id fulfillmentType deliveryMessage deliveryAddress{fullName firstName lastName address{...addressFragment}}deliveryInstructions{...DeliveryInstructionsFragment}deliveryPreferences{text{...textFragment}cta{...orderActionFragment}}editSubstitutionsCutOff status{statusType showStatusTracker message{...textFragment}notice helpCenterText{...textFragment}}itemCount isCategorized categories{...ODPGroupCategoryFragment}seller{id name isPro}shipment{id trackingNumber}actions{reorder edit track changeSlot checkin editDeliveryInstructions editPickupPerson tip cancel help enableTip{...orderActionFragment}enableEdit{...orderActionFragment}viewCancellationDetails{...cancellationDetailsActionFragment}enableInHome{...orderActionFragment}createGiftReceipt}cutOffTimestamp isEditSubstitutionsEligible isInHome giftDetails{...GiftDetailsFragment}donationDetails{...orderDonationDetails}}fragment returnInfoFragment on ReturnInfo{returnOrderId type refundPriceDetails{__typename...refundPriceDetailsFragment}refundMessage tierRefundMessage paymentMethods{__typename description cardType paymentType displayValues message{...textFragment}}actions{__typename generate scheduleOrModifyPickup{text url}reschedulePickup editPickupContact}shippingLabelUrl qrCodeImageUrl carriers{__typename id name}pickupCarrier pickupContact{nameAndAddress{fullName firstName lastName address{addressString city state postalCode addressLineOne addressLineTwo country}}phone}pickupConfirmationNumber bannerMessage{...textFragment}}fragment refundPriceDetailsFragment on RefundPriceDetails{subTotal{__typename...orderPriceDetailRowFragment}fees{__typename...orderPriceDetailRowFragment}discounts{__typename...orderPriceDetailRowFragment}taxTotal{__typename...orderPriceDetailRowFragment}grandTotal{__typename...orderPriceDetailRowFragment}}fragment orderPriceDetailRowFragment on OrderPriceDetailRow{label displayValue value info{__typename title message}}fragment addressFragment on OrderAddress{addressString addressLineOne addressLineTwo state postalCode city}fragment ODPPickupInfo on OrderGroup{pickupInstructions pickupPerson{...person}alternatePickupPerson{...person}store{id name address{...addressFragment}}}fragment person on OrderPickupPerson{firstName lastName email}fragment ODPTippingInfo on OrderGroup{addTipMessage{...textFragment}driver{...DriverFragment}tipping{min{...price}max{...price}suggested{...price}preselected}subtotal{...price}}fragment orderActionFragment on Action{text url}fragment orderCustomer on OrderCustomer{id firstName lastName email isGuest isEmailRegistered}fragment OrderFieldsFragment on Order{__typename id version type customer{...orderCustomer}displayId idBarcodeImageUrl(barWidth:3 barHeight:100) isFuelPurchase title shortTitle timezone tippableGroup{...OrderGroupFragment}amendableGroup{id changeSlotIterationsLeft cutOffTimestamp fulfillmentType deliveryAddress{fullName firstName lastName address{addressString addressLineOne addressLineTwo state postalCode city country}}isAmendInProgress}substitutionsBanner{heading subheading longSubheading}groups_2101{__typename...OrderGroupFragment...ODPGroupFragment...ODPPickupInfo...ODPTippingInfo}multiboxBundles{...orderLineItem}itemCancelReasons{__typename...cancelReason}groupCancelReasons{__typename...cancelReason}priceDetails{__typename subTotal{__typename...priceDetailFragment}taxTotal{__typename...priceDetailFragment}grandTotal{__typename...priceDetailFragment}authorizationAmount{__typename...priceDetailFragment}fees{__typename...priceDetailFragment}discounts{__typename...priceDetailFragment}minimumThreshold{__typename...price}belowMinimumFee{__typename...priceDetailFragment}driverTip{__typename...priceDetailFragment}donations{__typename...priceDetailFragment}}paymentMethods{__typename description cardType paymentType displayValues message{...textFragment}actions{connectToCapitalOne{...orderActionFragment}visitAffirm{...orderActionFragment}}}actions{__typename return pendingReturn cancel startReturn{...orderActionFragment}reorder}banners{...textFragment}}","variables":{"orderId":"3942254879259","emailAddress":"tonicrochet@msn.com"}}' \
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
    echo "'3942254879259" >> track-OrderID.txt
    echo "tonicrochet@msn.com" >> track-email.txt
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
            if [[ `echo $curl6 | jq '.data.guestOrder.groups_2101['${i[@]}'].items['${j[@]}'].productInfo.usItemId'` == '"970197920"' ]]; then
                echo "'3942254879259" >> track-OrderID.txt
                echo tonicrochet@msn.com >> track-email.txt
                echo $curl6 | jq '.data.guestOrder.groups_2101['${i[@]}'].items['${j[@]}'].productInfo.usItemId' >> track-usItemId.txt
                echo $curl6 | jq '.data.guestOrder.groups_2101['${i[@]}'].items['${j[@]}'].priceInfo.linePrice.value' >> track-priceValue.txt
                echo $curl6 | jq '.data.guestOrder.groups_2101['${i[@]}'].deliveryAddress.fullName' >> track-fullName.txt
                echo $curl6 | jq '.data.guestOrder.groups_2101['${i[@]}'].deliveryAddress.address.addressString' >> track-address.txt
                echo $curl6 | jq '.data.guestOrder.groups_2101['${i[@]}'].status.message.parts[].text' >> track-status.txt
                echo $curl6 | jq '.data.guestOrder.groups_2101['${i[@]}'].shipment.trackingNumber' | sed 's/null//g' >> track-number.txt
                echo $curl6 | jq '.data.guestOrder.groups_2101['${i[@]}'].shipment.trackingUrl' | sed 's/null//g' >> track-url.txt
                echo $curl6 | jq '.data.guestOrder.groups_2101['${i[@]}'].categories[].type' >> track-categoriesType.txt
                echo $curl6 | jq '.data.guestOrder.groups_2101['${i[@]}'].status.subtext' >> track-subtext.txt
                break
            fi
        done
    done
    if [[ $sum6 == `md5 track-OrderID.txt` ]]; then
        echo "6-Khác Item"
        echo "'3942254879259" >> track-OrderID.txt
        echo "tonicrochet@msn.com" >> track-email.txt
        echo "Khác Item" >> track-usItemId.txt
        echo "Khác Item" >> track-priceValue.txt
        echo "Khác Item" >> track-fullName.txt
        echo "Khác Item" >> track-address.txt
        echo "Khác Item" >> track-status.txt
        echo "Khác Item" >> track-number.txt
        echo "Khác Item" >> track-url.txt
        echo "Khác Item" >> track-categoriesType.txt
        echo "Khác Item" >> track-subtext.txt
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
  -H 'user-agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.51 Safari/537.36 Edg/99.0.1150.39' \
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
  --data-raw $'{"query":"query getGuestOrder($orderId:ID\u0021 $emailAddress:String\u0021){guestOrder(input:{id:$orderId emailAddress:$emailAddress}){...OrderFieldsFragment}}fragment cancelReason on OrderCancelReason{__typename subReasonCode subDescription}fragment priceDetailFragment on OrderPriceDetailRow{label value displayValue info{title message}rowInfo{...orderPriceDetailRowInfo}}fragment orderPriceDetailRowInfo on OrderPriceDetailRowInfo{title message{...textFragment}}fragment price on Price{displayValue value}fragment variants on MapEntry{name value}fragment OrderAddOn on OrderAddOn{lineId uniqueLineId productInfo{name usItemId offerId}quantityString quantityLabel type fulfillmentInstructions{...textFragment}actions{manageProtectionPlan{...orderActionFragment}cancel}priceInfo{linePrice{...price}}quantity isActive}fragment orderDonationDetails on OrderDonationDetails{message{...textFragment}emailReceipt emailReceiptToken status{...textFragment}errorStatus}fragment orderLineItem on OrderLineItem{id uniqueId actions{contactSeller cancel addToCart configureCake reviewItem resendEGiftCardToken protectionPlan{...orderActionFragment}manageProtectionPlan{...orderActionFragment}}isGift digitalDeliveryMessage quantity quantityString quantityLabel isSubstitutionSelected fulfilledItems{id quantityString priceInfo{itemPrice{value}}productInfo{usItemId name}}isReturnable returnEligibilityMessage productInfo{name usItemId imageInfo{thumbnailUrl}canonicalUrl offerId orderLimit orderMinLimit weightIncrement salesUnit salesUnitType isSubstitutionEligible isAlcohol}reshop{reshopMessage isShippingAvailable minPromiseDate maxPromiseDate}selectedVariants{...variants}variantAdditionalInfo{parts{text nativeAction}}priceInfo{priceDisplayCodes{showItemPrice priceDisplayCondition finalCostByWeight}itemPrice{...price}linePrice{...price}unitPrice{...price}preDiscountedLinePrice{...price}additionalLines{name value}}discounts{label labelText{...textFragment}}itemReviewed activationCodes{label code}protectionPlanMessage{...textFragment}showSeller isShippedByWalmart seller{id name isPro}digitalDeliveryPhoneNumber addOns{...OrderAddOn}multiboxBundleId}fragment DriverFragment on Driver{id firstName photoUrl}fragment OrderGroupFragment on OrderGroup{driver{...DriverFragment}deliveryDate fulfillmentType status{...OrderGroupStatusFragment}showSeller isShippedByWalmart seller{...SellerFragment}id itemCount items{...LiteLineItemFragment}pickupPerson{firstName lastName email}accessPointId shipment{...ShipmentFragment}returnEligibilityMessage actions{...OrderGroupActionsFragment}recipientEmailAddress digitalDelivery{...DigitalDeliveryFragment}tireInstallationReservation{status extraText reservationId}}fragment OrderGroupStatusFragment on OrderGroupStatus{statusType showStatusTracker statusTracker{status label isCurrent}message{...textFragment}subtext subMessage{...textFragment}notice helpCenterText{...textFragment}}fragment textFragment on Text{parts{bold url text nativeAction lineBreak}}fragment LiteLineItemFragment on OrderLineItem{id quantity productInfo{name usItemId imageInfo{thumbnailUrl}offerId isAlcohol}priceInfo{linePrice{...price}}}fragment SellerFragment on GroupSeller{id name isPro}fragment DigitalDeliveryFragment on DigitalDelivery{title name instructions{...textFragment}}fragment ShipmentFragment on Shipment{id trackingNumber isExternalTracking trackingUrl proofOfDelivery{...ProofOfDeliveryFragment}}fragment OrderGroupActionsFragment on OrderGroupActions{reorder edit track changeSlot checkin editDeliveryInstructions editPickupPerson editTip tip rateDriver cancel enableTip{...orderActionFragment}enableEdit{...orderActionFragment}rescheduleTireInstall{...orderActionFragment}cancelTireInstall{...orderActionFragment}help viewCancellationDetails{...cancellationDetailsActionFragment}}fragment cancellationDetailsActionFragment on CancellationDetailsAction{label heading text{...textFragment}}fragment ProofOfDeliveryFragment on ProofOfDelivery{photoUrl photoPreviewUrl showPreview}fragment DeliveryInstructionsFragment on DeliveryInstructions{text type typeText}fragment GiftDetailsFragment on GiftDetails{recipientAddress{fullName}recipientEmail senderName giftMessage}fragment SubstitutionAction on SubstitutionAction{message label type}fragment ODPGroupCategoryFragment on OrderCategory{type name subtext returnMessage substitutionsBanner{...textFragment}showExtendedSubstitutions actions{substitutions{...SubstitutionAction}nilPickReshop{message action{text url}}returnDetails viewCancellationDetails{...cancellationDetailsActionFragment}trackOnInHomeApp}banner{...textFragment}accordionState items{...orderLineItem}substitutions{...orderLineItem fulfilledItems{...orderLineItem}}returnInfo{...returnInfoFragment}}fragment ODPGroupFragment on OrderGroup{id fulfillmentType deliveryMessage deliveryAddress{fullName firstName lastName address{...addressFragment}}deliveryInstructions{...DeliveryInstructionsFragment}deliveryPreferences{text{...textFragment}cta{...orderActionFragment}}editSubstitutionsCutOff status{statusType showStatusTracker message{...textFragment}notice helpCenterText{...textFragment}}itemCount isCategorized categories{...ODPGroupCategoryFragment}seller{id name isPro}shipment{id trackingNumber}actions{reorder edit track changeSlot checkin editDeliveryInstructions editPickupPerson tip cancel help enableTip{...orderActionFragment}enableEdit{...orderActionFragment}viewCancellationDetails{...cancellationDetailsActionFragment}enableInHome{...orderActionFragment}createGiftReceipt}cutOffTimestamp isEditSubstitutionsEligible isInHome giftDetails{...GiftDetailsFragment}donationDetails{...orderDonationDetails}}fragment returnInfoFragment on ReturnInfo{returnOrderId type refundPriceDetails{__typename...refundPriceDetailsFragment}refundMessage tierRefundMessage paymentMethods{__typename description cardType paymentType displayValues message{...textFragment}}actions{__typename generate scheduleOrModifyPickup{text url}reschedulePickup editPickupContact}shippingLabelUrl qrCodeImageUrl carriers{__typename id name}pickupCarrier pickupContact{nameAndAddress{fullName firstName lastName address{addressString city state postalCode addressLineOne addressLineTwo country}}phone}pickupConfirmationNumber bannerMessage{...textFragment}}fragment refundPriceDetailsFragment on RefundPriceDetails{subTotal{__typename...orderPriceDetailRowFragment}fees{__typename...orderPriceDetailRowFragment}discounts{__typename...orderPriceDetailRowFragment}taxTotal{__typename...orderPriceDetailRowFragment}grandTotal{__typename...orderPriceDetailRowFragment}}fragment orderPriceDetailRowFragment on OrderPriceDetailRow{label displayValue value info{__typename title message}}fragment addressFragment on OrderAddress{addressString addressLineOne addressLineTwo state postalCode city}fragment ODPPickupInfo on OrderGroup{pickupInstructions pickupPerson{...person}alternatePickupPerson{...person}store{id name address{...addressFragment}}}fragment person on OrderPickupPerson{firstName lastName email}fragment ODPTippingInfo on OrderGroup{addTipMessage{...textFragment}driver{...DriverFragment}tipping{min{...price}max{...price}suggested{...price}preselected}subtotal{...price}}fragment orderActionFragment on Action{text url}fragment orderCustomer on OrderCustomer{id firstName lastName email isGuest isEmailRegistered}fragment OrderFieldsFragment on Order{__typename id version type customer{...orderCustomer}displayId idBarcodeImageUrl(barWidth:3 barHeight:100) isFuelPurchase title shortTitle timezone tippableGroup{...OrderGroupFragment}amendableGroup{id changeSlotIterationsLeft cutOffTimestamp fulfillmentType deliveryAddress{fullName firstName lastName address{addressString addressLineOne addressLineTwo state postalCode city country}}isAmendInProgress}substitutionsBanner{heading subheading longSubheading}groups_2101{__typename...OrderGroupFragment...ODPGroupFragment...ODPPickupInfo...ODPTippingInfo}multiboxBundles{...orderLineItem}itemCancelReasons{__typename...cancelReason}groupCancelReasons{__typename...cancelReason}priceDetails{__typename subTotal{__typename...priceDetailFragment}taxTotal{__typename...priceDetailFragment}grandTotal{__typename...priceDetailFragment}authorizationAmount{__typename...priceDetailFragment}fees{__typename...priceDetailFragment}discounts{__typename...priceDetailFragment}minimumThreshold{__typename...price}belowMinimumFee{__typename...priceDetailFragment}driverTip{__typename...priceDetailFragment}donations{__typename...priceDetailFragment}}paymentMethods{__typename description cardType paymentType displayValues message{...textFragment}actions{connectToCapitalOne{...orderActionFragment}visitAffirm{...orderActionFragment}}}actions{__typename return pendingReturn cancel startReturn{...orderActionFragment}reorder}banners{...textFragment}}","variables":{"orderId":"3942254779131","emailAddress":"judyt317@gmail.com"}}' \
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
    echo "'3942254779131" >> track-OrderID.txt
    echo "judyt317@gmail.com" >> track-email.txt
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
            if [[ `echo $curl7 | jq '.data.guestOrder.groups_2101['${i[@]}'].items['${j[@]}'].productInfo.usItemId'` == '"377870589"' ]]; then
                echo "'3942254779131" >> track-OrderID.txt
                echo judyt317@gmail.com >> track-email.txt
                echo $curl7 | jq '.data.guestOrder.groups_2101['${i[@]}'].items['${j[@]}'].productInfo.usItemId' >> track-usItemId.txt
                echo $curl7 | jq '.data.guestOrder.groups_2101['${i[@]}'].items['${j[@]}'].priceInfo.linePrice.value' >> track-priceValue.txt
                echo $curl7 | jq '.data.guestOrder.groups_2101['${i[@]}'].deliveryAddress.fullName' >> track-fullName.txt
                echo $curl7 | jq '.data.guestOrder.groups_2101['${i[@]}'].deliveryAddress.address.addressString' >> track-address.txt
                echo $curl7 | jq '.data.guestOrder.groups_2101['${i[@]}'].status.message.parts[].text' >> track-status.txt
                echo $curl7 | jq '.data.guestOrder.groups_2101['${i[@]}'].shipment.trackingNumber' | sed 's/null//g' >> track-number.txt
                echo $curl7 | jq '.data.guestOrder.groups_2101['${i[@]}'].shipment.trackingUrl' | sed 's/null//g' >> track-url.txt
                echo $curl7 | jq '.data.guestOrder.groups_2101['${i[@]}'].categories[].type' >> track-categoriesType.txt
                echo $curl7 | jq '.data.guestOrder.groups_2101['${i[@]}'].status.subtext' >> track-subtext.txt
                break
            fi
        done
    done
    if [[ $sum7 == `md5 track-OrderID.txt` ]]; then
        echo "7-Khác Item"
        echo "'3942254779131" >> track-OrderID.txt
        echo "judyt317@gmail.com" >> track-email.txt
        echo "Khác Item" >> track-usItemId.txt
        echo "Khác Item" >> track-priceValue.txt
        echo "Khác Item" >> track-fullName.txt
        echo "Khác Item" >> track-address.txt
        echo "Khác Item" >> track-status.txt
        echo "Khác Item" >> track-number.txt
        echo "Khác Item" >> track-url.txt
        echo "Khác Item" >> track-categoriesType.txt
        echo "Khác Item" >> track-subtext.txt
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
  -H 'user-agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.51 Safari/537.36 Edg/99.0.1150.39' \
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
  --data-raw $'{"query":"query getGuestOrder($orderId:ID\u0021 $emailAddress:String\u0021){guestOrder(input:{id:$orderId emailAddress:$emailAddress}){...OrderFieldsFragment}}fragment cancelReason on OrderCancelReason{__typename subReasonCode subDescription}fragment priceDetailFragment on OrderPriceDetailRow{label value displayValue info{title message}rowInfo{...orderPriceDetailRowInfo}}fragment orderPriceDetailRowInfo on OrderPriceDetailRowInfo{title message{...textFragment}}fragment price on Price{displayValue value}fragment variants on MapEntry{name value}fragment OrderAddOn on OrderAddOn{lineId uniqueLineId productInfo{name usItemId offerId}quantityString quantityLabel type fulfillmentInstructions{...textFragment}actions{manageProtectionPlan{...orderActionFragment}cancel}priceInfo{linePrice{...price}}quantity isActive}fragment orderDonationDetails on OrderDonationDetails{message{...textFragment}emailReceipt emailReceiptToken status{...textFragment}errorStatus}fragment orderLineItem on OrderLineItem{id uniqueId actions{contactSeller cancel addToCart configureCake reviewItem resendEGiftCardToken protectionPlan{...orderActionFragment}manageProtectionPlan{...orderActionFragment}}isGift digitalDeliveryMessage quantity quantityString quantityLabel isSubstitutionSelected fulfilledItems{id quantityString priceInfo{itemPrice{value}}productInfo{usItemId name}}isReturnable returnEligibilityMessage productInfo{name usItemId imageInfo{thumbnailUrl}canonicalUrl offerId orderLimit orderMinLimit weightIncrement salesUnit salesUnitType isSubstitutionEligible isAlcohol}reshop{reshopMessage isShippingAvailable minPromiseDate maxPromiseDate}selectedVariants{...variants}variantAdditionalInfo{parts{text nativeAction}}priceInfo{priceDisplayCodes{showItemPrice priceDisplayCondition finalCostByWeight}itemPrice{...price}linePrice{...price}unitPrice{...price}preDiscountedLinePrice{...price}additionalLines{name value}}discounts{label labelText{...textFragment}}itemReviewed activationCodes{label code}protectionPlanMessage{...textFragment}showSeller isShippedByWalmart seller{id name isPro}digitalDeliveryPhoneNumber addOns{...OrderAddOn}multiboxBundleId}fragment DriverFragment on Driver{id firstName photoUrl}fragment OrderGroupFragment on OrderGroup{driver{...DriverFragment}deliveryDate fulfillmentType status{...OrderGroupStatusFragment}showSeller isShippedByWalmart seller{...SellerFragment}id itemCount items{...LiteLineItemFragment}pickupPerson{firstName lastName email}accessPointId shipment{...ShipmentFragment}returnEligibilityMessage actions{...OrderGroupActionsFragment}recipientEmailAddress digitalDelivery{...DigitalDeliveryFragment}tireInstallationReservation{status extraText reservationId}}fragment OrderGroupStatusFragment on OrderGroupStatus{statusType showStatusTracker statusTracker{status label isCurrent}message{...textFragment}subtext subMessage{...textFragment}notice helpCenterText{...textFragment}}fragment textFragment on Text{parts{bold url text nativeAction lineBreak}}fragment LiteLineItemFragment on OrderLineItem{id quantity productInfo{name usItemId imageInfo{thumbnailUrl}offerId isAlcohol}priceInfo{linePrice{...price}}}fragment SellerFragment on GroupSeller{id name isPro}fragment DigitalDeliveryFragment on DigitalDelivery{title name instructions{...textFragment}}fragment ShipmentFragment on Shipment{id trackingNumber isExternalTracking trackingUrl proofOfDelivery{...ProofOfDeliveryFragment}}fragment OrderGroupActionsFragment on OrderGroupActions{reorder edit track changeSlot checkin editDeliveryInstructions editPickupPerson editTip tip rateDriver cancel enableTip{...orderActionFragment}enableEdit{...orderActionFragment}rescheduleTireInstall{...orderActionFragment}cancelTireInstall{...orderActionFragment}help viewCancellationDetails{...cancellationDetailsActionFragment}}fragment cancellationDetailsActionFragment on CancellationDetailsAction{label heading text{...textFragment}}fragment ProofOfDeliveryFragment on ProofOfDelivery{photoUrl photoPreviewUrl showPreview}fragment DeliveryInstructionsFragment on DeliveryInstructions{text type typeText}fragment GiftDetailsFragment on GiftDetails{recipientAddress{fullName}recipientEmail senderName giftMessage}fragment SubstitutionAction on SubstitutionAction{message label type}fragment ODPGroupCategoryFragment on OrderCategory{type name subtext returnMessage substitutionsBanner{...textFragment}showExtendedSubstitutions actions{substitutions{...SubstitutionAction}nilPickReshop{message action{text url}}returnDetails viewCancellationDetails{...cancellationDetailsActionFragment}trackOnInHomeApp}banner{...textFragment}accordionState items{...orderLineItem}substitutions{...orderLineItem fulfilledItems{...orderLineItem}}returnInfo{...returnInfoFragment}}fragment ODPGroupFragment on OrderGroup{id fulfillmentType deliveryMessage deliveryAddress{fullName firstName lastName address{...addressFragment}}deliveryInstructions{...DeliveryInstructionsFragment}deliveryPreferences{text{...textFragment}cta{...orderActionFragment}}editSubstitutionsCutOff status{statusType showStatusTracker message{...textFragment}notice helpCenterText{...textFragment}}itemCount isCategorized categories{...ODPGroupCategoryFragment}seller{id name isPro}shipment{id trackingNumber}actions{reorder edit track changeSlot checkin editDeliveryInstructions editPickupPerson tip cancel help enableTip{...orderActionFragment}enableEdit{...orderActionFragment}viewCancellationDetails{...cancellationDetailsActionFragment}enableInHome{...orderActionFragment}createGiftReceipt}cutOffTimestamp isEditSubstitutionsEligible isInHome giftDetails{...GiftDetailsFragment}donationDetails{...orderDonationDetails}}fragment returnInfoFragment on ReturnInfo{returnOrderId type refundPriceDetails{__typename...refundPriceDetailsFragment}refundMessage tierRefundMessage paymentMethods{__typename description cardType paymentType displayValues message{...textFragment}}actions{__typename generate scheduleOrModifyPickup{text url}reschedulePickup editPickupContact}shippingLabelUrl qrCodeImageUrl carriers{__typename id name}pickupCarrier pickupContact{nameAndAddress{fullName firstName lastName address{addressString city state postalCode addressLineOne addressLineTwo country}}phone}pickupConfirmationNumber bannerMessage{...textFragment}}fragment refundPriceDetailsFragment on RefundPriceDetails{subTotal{__typename...orderPriceDetailRowFragment}fees{__typename...orderPriceDetailRowFragment}discounts{__typename...orderPriceDetailRowFragment}taxTotal{__typename...orderPriceDetailRowFragment}grandTotal{__typename...orderPriceDetailRowFragment}}fragment orderPriceDetailRowFragment on OrderPriceDetailRow{label displayValue value info{__typename title message}}fragment addressFragment on OrderAddress{addressString addressLineOne addressLineTwo state postalCode city}fragment ODPPickupInfo on OrderGroup{pickupInstructions pickupPerson{...person}alternatePickupPerson{...person}store{id name address{...addressFragment}}}fragment person on OrderPickupPerson{firstName lastName email}fragment ODPTippingInfo on OrderGroup{addTipMessage{...textFragment}driver{...DriverFragment}tipping{min{...price}max{...price}suggested{...price}preselected}subtotal{...price}}fragment orderActionFragment on Action{text url}fragment orderCustomer on OrderCustomer{id firstName lastName email isGuest isEmailRegistered}fragment OrderFieldsFragment on Order{__typename id version type customer{...orderCustomer}displayId idBarcodeImageUrl(barWidth:3 barHeight:100) isFuelPurchase title shortTitle timezone tippableGroup{...OrderGroupFragment}amendableGroup{id changeSlotIterationsLeft cutOffTimestamp fulfillmentType deliveryAddress{fullName firstName lastName address{addressString addressLineOne addressLineTwo state postalCode city country}}isAmendInProgress}substitutionsBanner{heading subheading longSubheading}groups_2101{__typename...OrderGroupFragment...ODPGroupFragment...ODPPickupInfo...ODPTippingInfo}multiboxBundles{...orderLineItem}itemCancelReasons{__typename...cancelReason}groupCancelReasons{__typename...cancelReason}priceDetails{__typename subTotal{__typename...priceDetailFragment}taxTotal{__typename...priceDetailFragment}grandTotal{__typename...priceDetailFragment}authorizationAmount{__typename...priceDetailFragment}fees{__typename...priceDetailFragment}discounts{__typename...priceDetailFragment}minimumThreshold{__typename...price}belowMinimumFee{__typename...priceDetailFragment}driverTip{__typename...priceDetailFragment}donations{__typename...priceDetailFragment}}paymentMethods{__typename description cardType paymentType displayValues message{...textFragment}actions{connectToCapitalOne{...orderActionFragment}visitAffirm{...orderActionFragment}}}actions{__typename return pendingReturn cancel startReturn{...orderActionFragment}reorder}banners{...textFragment}}","variables":{"orderId":"3942254077870","emailAddress":"daioncrawford@gmail.com"}}' \
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
    echo "'3942254077870" >> track-OrderID.txt
    echo "daioncrawford@gmail.com" >> track-email.txt
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
            if [[ `echo $curl8 | jq '.data.guestOrder.groups_2101['${i[@]}'].items['${j[@]}'].productInfo.usItemId'` == '"939529312"' ]]; then
                echo "'3942254077870" >> track-OrderID.txt
                echo daioncrawford@gmail.com >> track-email.txt
                echo $curl8 | jq '.data.guestOrder.groups_2101['${i[@]}'].items['${j[@]}'].productInfo.usItemId' >> track-usItemId.txt
                echo $curl8 | jq '.data.guestOrder.groups_2101['${i[@]}'].items['${j[@]}'].priceInfo.linePrice.value' >> track-priceValue.txt
                echo $curl8 | jq '.data.guestOrder.groups_2101['${i[@]}'].deliveryAddress.fullName' >> track-fullName.txt
                echo $curl8 | jq '.data.guestOrder.groups_2101['${i[@]}'].deliveryAddress.address.addressString' >> track-address.txt
                echo $curl8 | jq '.data.guestOrder.groups_2101['${i[@]}'].status.message.parts[].text' >> track-status.txt
                echo $curl8 | jq '.data.guestOrder.groups_2101['${i[@]}'].shipment.trackingNumber' | sed 's/null//g' >> track-number.txt
                echo $curl8 | jq '.data.guestOrder.groups_2101['${i[@]}'].shipment.trackingUrl' | sed 's/null//g' >> track-url.txt
                echo $curl8 | jq '.data.guestOrder.groups_2101['${i[@]}'].categories[].type' >> track-categoriesType.txt
                echo $curl8 | jq '.data.guestOrder.groups_2101['${i[@]}'].status.subtext' >> track-subtext.txt
                break
            fi
        done
    done
    if [[ $sum8 == `md5 track-OrderID.txt` ]]; then
        echo "8-Khác Item"
        echo "'3942254077870" >> track-OrderID.txt
        echo "daioncrawford@gmail.com" >> track-email.txt
        echo "Khác Item" >> track-usItemId.txt
        echo "Khác Item" >> track-priceValue.txt
        echo "Khác Item" >> track-fullName.txt
        echo "Khác Item" >> track-address.txt
        echo "Khác Item" >> track-status.txt
        echo "Khác Item" >> track-number.txt
        echo "Khác Item" >> track-url.txt
        echo "Khác Item" >> track-categoriesType.txt
        echo "Khác Item" >> track-subtext.txt
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
  -H 'user-agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.51 Safari/537.36 Edg/99.0.1150.39' \
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
  --data-raw $'{"query":"query getGuestOrder($orderId:ID\u0021 $emailAddress:String\u0021){guestOrder(input:{id:$orderId emailAddress:$emailAddress}){...OrderFieldsFragment}}fragment cancelReason on OrderCancelReason{__typename subReasonCode subDescription}fragment priceDetailFragment on OrderPriceDetailRow{label value displayValue info{title message}rowInfo{...orderPriceDetailRowInfo}}fragment orderPriceDetailRowInfo on OrderPriceDetailRowInfo{title message{...textFragment}}fragment price on Price{displayValue value}fragment variants on MapEntry{name value}fragment OrderAddOn on OrderAddOn{lineId uniqueLineId productInfo{name usItemId offerId}quantityString quantityLabel type fulfillmentInstructions{...textFragment}actions{manageProtectionPlan{...orderActionFragment}cancel}priceInfo{linePrice{...price}}quantity isActive}fragment orderDonationDetails on OrderDonationDetails{message{...textFragment}emailReceipt emailReceiptToken status{...textFragment}errorStatus}fragment orderLineItem on OrderLineItem{id uniqueId actions{contactSeller cancel addToCart configureCake reviewItem resendEGiftCardToken protectionPlan{...orderActionFragment}manageProtectionPlan{...orderActionFragment}}isGift digitalDeliveryMessage quantity quantityString quantityLabel isSubstitutionSelected fulfilledItems{id quantityString priceInfo{itemPrice{value}}productInfo{usItemId name}}isReturnable returnEligibilityMessage productInfo{name usItemId imageInfo{thumbnailUrl}canonicalUrl offerId orderLimit orderMinLimit weightIncrement salesUnit salesUnitType isSubstitutionEligible isAlcohol}reshop{reshopMessage isShippingAvailable minPromiseDate maxPromiseDate}selectedVariants{...variants}variantAdditionalInfo{parts{text nativeAction}}priceInfo{priceDisplayCodes{showItemPrice priceDisplayCondition finalCostByWeight}itemPrice{...price}linePrice{...price}unitPrice{...price}preDiscountedLinePrice{...price}additionalLines{name value}}discounts{label labelText{...textFragment}}itemReviewed activationCodes{label code}protectionPlanMessage{...textFragment}showSeller isShippedByWalmart seller{id name isPro}digitalDeliveryPhoneNumber addOns{...OrderAddOn}multiboxBundleId}fragment DriverFragment on Driver{id firstName photoUrl}fragment OrderGroupFragment on OrderGroup{driver{...DriverFragment}deliveryDate fulfillmentType status{...OrderGroupStatusFragment}showSeller isShippedByWalmart seller{...SellerFragment}id itemCount items{...LiteLineItemFragment}pickupPerson{firstName lastName email}accessPointId shipment{...ShipmentFragment}returnEligibilityMessage actions{...OrderGroupActionsFragment}recipientEmailAddress digitalDelivery{...DigitalDeliveryFragment}tireInstallationReservation{status extraText reservationId}}fragment OrderGroupStatusFragment on OrderGroupStatus{statusType showStatusTracker statusTracker{status label isCurrent}message{...textFragment}subtext subMessage{...textFragment}notice helpCenterText{...textFragment}}fragment textFragment on Text{parts{bold url text nativeAction lineBreak}}fragment LiteLineItemFragment on OrderLineItem{id quantity productInfo{name usItemId imageInfo{thumbnailUrl}offerId isAlcohol}priceInfo{linePrice{...price}}}fragment SellerFragment on GroupSeller{id name isPro}fragment DigitalDeliveryFragment on DigitalDelivery{title name instructions{...textFragment}}fragment ShipmentFragment on Shipment{id trackingNumber isExternalTracking trackingUrl proofOfDelivery{...ProofOfDeliveryFragment}}fragment OrderGroupActionsFragment on OrderGroupActions{reorder edit track changeSlot checkin editDeliveryInstructions editPickupPerson editTip tip rateDriver cancel enableTip{...orderActionFragment}enableEdit{...orderActionFragment}rescheduleTireInstall{...orderActionFragment}cancelTireInstall{...orderActionFragment}help viewCancellationDetails{...cancellationDetailsActionFragment}}fragment cancellationDetailsActionFragment on CancellationDetailsAction{label heading text{...textFragment}}fragment ProofOfDeliveryFragment on ProofOfDelivery{photoUrl photoPreviewUrl showPreview}fragment DeliveryInstructionsFragment on DeliveryInstructions{text type typeText}fragment GiftDetailsFragment on GiftDetails{recipientAddress{fullName}recipientEmail senderName giftMessage}fragment SubstitutionAction on SubstitutionAction{message label type}fragment ODPGroupCategoryFragment on OrderCategory{type name subtext returnMessage substitutionsBanner{...textFragment}showExtendedSubstitutions actions{substitutions{...SubstitutionAction}nilPickReshop{message action{text url}}returnDetails viewCancellationDetails{...cancellationDetailsActionFragment}trackOnInHomeApp}banner{...textFragment}accordionState items{...orderLineItem}substitutions{...orderLineItem fulfilledItems{...orderLineItem}}returnInfo{...returnInfoFragment}}fragment ODPGroupFragment on OrderGroup{id fulfillmentType deliveryMessage deliveryAddress{fullName firstName lastName address{...addressFragment}}deliveryInstructions{...DeliveryInstructionsFragment}deliveryPreferences{text{...textFragment}cta{...orderActionFragment}}editSubstitutionsCutOff status{statusType showStatusTracker message{...textFragment}notice helpCenterText{...textFragment}}itemCount isCategorized categories{...ODPGroupCategoryFragment}seller{id name isPro}shipment{id trackingNumber}actions{reorder edit track changeSlot checkin editDeliveryInstructions editPickupPerson tip cancel help enableTip{...orderActionFragment}enableEdit{...orderActionFragment}viewCancellationDetails{...cancellationDetailsActionFragment}enableInHome{...orderActionFragment}createGiftReceipt}cutOffTimestamp isEditSubstitutionsEligible isInHome giftDetails{...GiftDetailsFragment}donationDetails{...orderDonationDetails}}fragment returnInfoFragment on ReturnInfo{returnOrderId type refundPriceDetails{__typename...refundPriceDetailsFragment}refundMessage tierRefundMessage paymentMethods{__typename description cardType paymentType displayValues message{...textFragment}}actions{__typename generate scheduleOrModifyPickup{text url}reschedulePickup editPickupContact}shippingLabelUrl qrCodeImageUrl carriers{__typename id name}pickupCarrier pickupContact{nameAndAddress{fullName firstName lastName address{addressString city state postalCode addressLineOne addressLineTwo country}}phone}pickupConfirmationNumber bannerMessage{...textFragment}}fragment refundPriceDetailsFragment on RefundPriceDetails{subTotal{__typename...orderPriceDetailRowFragment}fees{__typename...orderPriceDetailRowFragment}discounts{__typename...orderPriceDetailRowFragment}taxTotal{__typename...orderPriceDetailRowFragment}grandTotal{__typename...orderPriceDetailRowFragment}}fragment orderPriceDetailRowFragment on OrderPriceDetailRow{label displayValue value info{__typename title message}}fragment addressFragment on OrderAddress{addressString addressLineOne addressLineTwo state postalCode city}fragment ODPPickupInfo on OrderGroup{pickupInstructions pickupPerson{...person}alternatePickupPerson{...person}store{id name address{...addressFragment}}}fragment person on OrderPickupPerson{firstName lastName email}fragment ODPTippingInfo on OrderGroup{addTipMessage{...textFragment}driver{...DriverFragment}tipping{min{...price}max{...price}suggested{...price}preselected}subtotal{...price}}fragment orderActionFragment on Action{text url}fragment orderCustomer on OrderCustomer{id firstName lastName email isGuest isEmailRegistered}fragment OrderFieldsFragment on Order{__typename id version type customer{...orderCustomer}displayId idBarcodeImageUrl(barWidth:3 barHeight:100) isFuelPurchase title shortTitle timezone tippableGroup{...OrderGroupFragment}amendableGroup{id changeSlotIterationsLeft cutOffTimestamp fulfillmentType deliveryAddress{fullName firstName lastName address{addressString addressLineOne addressLineTwo state postalCode city country}}isAmendInProgress}substitutionsBanner{heading subheading longSubheading}groups_2101{__typename...OrderGroupFragment...ODPGroupFragment...ODPPickupInfo...ODPTippingInfo}multiboxBundles{...orderLineItem}itemCancelReasons{__typename...cancelReason}groupCancelReasons{__typename...cancelReason}priceDetails{__typename subTotal{__typename...priceDetailFragment}taxTotal{__typename...priceDetailFragment}grandTotal{__typename...priceDetailFragment}authorizationAmount{__typename...priceDetailFragment}fees{__typename...priceDetailFragment}discounts{__typename...priceDetailFragment}minimumThreshold{__typename...price}belowMinimumFee{__typename...priceDetailFragment}driverTip{__typename...priceDetailFragment}donations{__typename...priceDetailFragment}}paymentMethods{__typename description cardType paymentType displayValues message{...textFragment}actions{connectToCapitalOne{...orderActionFragment}visitAffirm{...orderActionFragment}}}actions{__typename return pendingReturn cancel startReturn{...orderActionFragment}reorder}banners{...textFragment}}","variables":{"orderId":"3942254872517","emailAddress":"pope.sheryl@gmail.com"}}' \
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
    echo "'3942254872517" >> track-OrderID.txt
    echo "pope.sheryl@gmail.com" >> track-email.txt
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
            if [[ `echo $curl9 | jq '.data.guestOrder.groups_2101['${i[@]}'].items['${j[@]}'].productInfo.usItemId'` == '"5606333"' ]]; then
                echo "'3942254872517" >> track-OrderID.txt
                echo pope.sheryl@gmail.com >> track-email.txt
                echo $curl9 | jq '.data.guestOrder.groups_2101['${i[@]}'].items['${j[@]}'].productInfo.usItemId' >> track-usItemId.txt
                echo $curl9 | jq '.data.guestOrder.groups_2101['${i[@]}'].items['${j[@]}'].priceInfo.linePrice.value' >> track-priceValue.txt
                echo $curl9 | jq '.data.guestOrder.groups_2101['${i[@]}'].deliveryAddress.fullName' >> track-fullName.txt
                echo $curl9 | jq '.data.guestOrder.groups_2101['${i[@]}'].deliveryAddress.address.addressString' >> track-address.txt
                echo $curl9 | jq '.data.guestOrder.groups_2101['${i[@]}'].status.message.parts[].text' >> track-status.txt
                echo $curl9 | jq '.data.guestOrder.groups_2101['${i[@]}'].shipment.trackingNumber' | sed 's/null//g' >> track-number.txt
                echo $curl9 | jq '.data.guestOrder.groups_2101['${i[@]}'].shipment.trackingUrl' | sed 's/null//g' >> track-url.txt
                echo $curl9 | jq '.data.guestOrder.groups_2101['${i[@]}'].categories[].type' >> track-categoriesType.txt
                echo $curl9 | jq '.data.guestOrder.groups_2101['${i[@]}'].status.subtext' >> track-subtext.txt
                break
            fi
        done
    done
    if [[ $sum9 == `md5 track-OrderID.txt` ]]; then
        echo "9-Khác Item"
        echo "'3942254872517" >> track-OrderID.txt
        echo "pope.sheryl@gmail.com" >> track-email.txt
        echo "Khác Item" >> track-usItemId.txt
        echo "Khác Item" >> track-priceValue.txt
        echo "Khác Item" >> track-fullName.txt
        echo "Khác Item" >> track-address.txt
        echo "Khác Item" >> track-status.txt
        echo "Khác Item" >> track-number.txt
        echo "Khác Item" >> track-url.txt
        echo "Khác Item" >> track-categoriesType.txt
        echo "Khác Item" >> track-subtext.txt
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
  -H 'user-agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.51 Safari/537.36 Edg/99.0.1150.39' \
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
  --data-raw $'{"query":"query getGuestOrder($orderId:ID\u0021 $emailAddress:String\u0021){guestOrder(input:{id:$orderId emailAddress:$emailAddress}){...OrderFieldsFragment}}fragment cancelReason on OrderCancelReason{__typename subReasonCode subDescription}fragment priceDetailFragment on OrderPriceDetailRow{label value displayValue info{title message}rowInfo{...orderPriceDetailRowInfo}}fragment orderPriceDetailRowInfo on OrderPriceDetailRowInfo{title message{...textFragment}}fragment price on Price{displayValue value}fragment variants on MapEntry{name value}fragment OrderAddOn on OrderAddOn{lineId uniqueLineId productInfo{name usItemId offerId}quantityString quantityLabel type fulfillmentInstructions{...textFragment}actions{manageProtectionPlan{...orderActionFragment}cancel}priceInfo{linePrice{...price}}quantity isActive}fragment orderDonationDetails on OrderDonationDetails{message{...textFragment}emailReceipt emailReceiptToken status{...textFragment}errorStatus}fragment orderLineItem on OrderLineItem{id uniqueId actions{contactSeller cancel addToCart configureCake reviewItem resendEGiftCardToken protectionPlan{...orderActionFragment}manageProtectionPlan{...orderActionFragment}}isGift digitalDeliveryMessage quantity quantityString quantityLabel isSubstitutionSelected fulfilledItems{id quantityString priceInfo{itemPrice{value}}productInfo{usItemId name}}isReturnable returnEligibilityMessage productInfo{name usItemId imageInfo{thumbnailUrl}canonicalUrl offerId orderLimit orderMinLimit weightIncrement salesUnit salesUnitType isSubstitutionEligible isAlcohol}reshop{reshopMessage isShippingAvailable minPromiseDate maxPromiseDate}selectedVariants{...variants}variantAdditionalInfo{parts{text nativeAction}}priceInfo{priceDisplayCodes{showItemPrice priceDisplayCondition finalCostByWeight}itemPrice{...price}linePrice{...price}unitPrice{...price}preDiscountedLinePrice{...price}additionalLines{name value}}discounts{label labelText{...textFragment}}itemReviewed activationCodes{label code}protectionPlanMessage{...textFragment}showSeller isShippedByWalmart seller{id name isPro}digitalDeliveryPhoneNumber addOns{...OrderAddOn}multiboxBundleId}fragment DriverFragment on Driver{id firstName photoUrl}fragment OrderGroupFragment on OrderGroup{driver{...DriverFragment}deliveryDate fulfillmentType status{...OrderGroupStatusFragment}showSeller isShippedByWalmart seller{...SellerFragment}id itemCount items{...LiteLineItemFragment}pickupPerson{firstName lastName email}accessPointId shipment{...ShipmentFragment}returnEligibilityMessage actions{...OrderGroupActionsFragment}recipientEmailAddress digitalDelivery{...DigitalDeliveryFragment}tireInstallationReservation{status extraText reservationId}}fragment OrderGroupStatusFragment on OrderGroupStatus{statusType showStatusTracker statusTracker{status label isCurrent}message{...textFragment}subtext subMessage{...textFragment}notice helpCenterText{...textFragment}}fragment textFragment on Text{parts{bold url text nativeAction lineBreak}}fragment LiteLineItemFragment on OrderLineItem{id quantity productInfo{name usItemId imageInfo{thumbnailUrl}offerId isAlcohol}priceInfo{linePrice{...price}}}fragment SellerFragment on GroupSeller{id name isPro}fragment DigitalDeliveryFragment on DigitalDelivery{title name instructions{...textFragment}}fragment ShipmentFragment on Shipment{id trackingNumber isExternalTracking trackingUrl proofOfDelivery{...ProofOfDeliveryFragment}}fragment OrderGroupActionsFragment on OrderGroupActions{reorder edit track changeSlot checkin editDeliveryInstructions editPickupPerson editTip tip rateDriver cancel enableTip{...orderActionFragment}enableEdit{...orderActionFragment}rescheduleTireInstall{...orderActionFragment}cancelTireInstall{...orderActionFragment}help viewCancellationDetails{...cancellationDetailsActionFragment}}fragment cancellationDetailsActionFragment on CancellationDetailsAction{label heading text{...textFragment}}fragment ProofOfDeliveryFragment on ProofOfDelivery{photoUrl photoPreviewUrl showPreview}fragment DeliveryInstructionsFragment on DeliveryInstructions{text type typeText}fragment GiftDetailsFragment on GiftDetails{recipientAddress{fullName}recipientEmail senderName giftMessage}fragment SubstitutionAction on SubstitutionAction{message label type}fragment ODPGroupCategoryFragment on OrderCategory{type name subtext returnMessage substitutionsBanner{...textFragment}showExtendedSubstitutions actions{substitutions{...SubstitutionAction}nilPickReshop{message action{text url}}returnDetails viewCancellationDetails{...cancellationDetailsActionFragment}trackOnInHomeApp}banner{...textFragment}accordionState items{...orderLineItem}substitutions{...orderLineItem fulfilledItems{...orderLineItem}}returnInfo{...returnInfoFragment}}fragment ODPGroupFragment on OrderGroup{id fulfillmentType deliveryMessage deliveryAddress{fullName firstName lastName address{...addressFragment}}deliveryInstructions{...DeliveryInstructionsFragment}deliveryPreferences{text{...textFragment}cta{...orderActionFragment}}editSubstitutionsCutOff status{statusType showStatusTracker message{...textFragment}notice helpCenterText{...textFragment}}itemCount isCategorized categories{...ODPGroupCategoryFragment}seller{id name isPro}shipment{id trackingNumber}actions{reorder edit track changeSlot checkin editDeliveryInstructions editPickupPerson tip cancel help enableTip{...orderActionFragment}enableEdit{...orderActionFragment}viewCancellationDetails{...cancellationDetailsActionFragment}enableInHome{...orderActionFragment}createGiftReceipt}cutOffTimestamp isEditSubstitutionsEligible isInHome giftDetails{...GiftDetailsFragment}donationDetails{...orderDonationDetails}}fragment returnInfoFragment on ReturnInfo{returnOrderId type refundPriceDetails{__typename...refundPriceDetailsFragment}refundMessage tierRefundMessage paymentMethods{__typename description cardType paymentType displayValues message{...textFragment}}actions{__typename generate scheduleOrModifyPickup{text url}reschedulePickup editPickupContact}shippingLabelUrl qrCodeImageUrl carriers{__typename id name}pickupCarrier pickupContact{nameAndAddress{fullName firstName lastName address{addressString city state postalCode addressLineOne addressLineTwo country}}phone}pickupConfirmationNumber bannerMessage{...textFragment}}fragment refundPriceDetailsFragment on RefundPriceDetails{subTotal{__typename...orderPriceDetailRowFragment}fees{__typename...orderPriceDetailRowFragment}discounts{__typename...orderPriceDetailRowFragment}taxTotal{__typename...orderPriceDetailRowFragment}grandTotal{__typename...orderPriceDetailRowFragment}}fragment orderPriceDetailRowFragment on OrderPriceDetailRow{label displayValue value info{__typename title message}}fragment addressFragment on OrderAddress{addressString addressLineOne addressLineTwo state postalCode city}fragment ODPPickupInfo on OrderGroup{pickupInstructions pickupPerson{...person}alternatePickupPerson{...person}store{id name address{...addressFragment}}}fragment person on OrderPickupPerson{firstName lastName email}fragment ODPTippingInfo on OrderGroup{addTipMessage{...textFragment}driver{...DriverFragment}tipping{min{...price}max{...price}suggested{...price}preselected}subtotal{...price}}fragment orderActionFragment on Action{text url}fragment orderCustomer on OrderCustomer{id firstName lastName email isGuest isEmailRegistered}fragment OrderFieldsFragment on Order{__typename id version type customer{...orderCustomer}displayId idBarcodeImageUrl(barWidth:3 barHeight:100) isFuelPurchase title shortTitle timezone tippableGroup{...OrderGroupFragment}amendableGroup{id changeSlotIterationsLeft cutOffTimestamp fulfillmentType deliveryAddress{fullName firstName lastName address{addressString addressLineOne addressLineTwo state postalCode city country}}isAmendInProgress}substitutionsBanner{heading subheading longSubheading}groups_2101{__typename...OrderGroupFragment...ODPGroupFragment...ODPPickupInfo...ODPTippingInfo}multiboxBundles{...orderLineItem}itemCancelReasons{__typename...cancelReason}groupCancelReasons{__typename...cancelReason}priceDetails{__typename subTotal{__typename...priceDetailFragment}taxTotal{__typename...priceDetailFragment}grandTotal{__typename...priceDetailFragment}authorizationAmount{__typename...priceDetailFragment}fees{__typename...priceDetailFragment}discounts{__typename...priceDetailFragment}minimumThreshold{__typename...price}belowMinimumFee{__typename...priceDetailFragment}driverTip{__typename...priceDetailFragment}donations{__typename...priceDetailFragment}}paymentMethods{__typename description cardType paymentType displayValues message{...textFragment}actions{connectToCapitalOne{...orderActionFragment}visitAffirm{...orderActionFragment}}}actions{__typename return pendingReturn cancel startReturn{...orderActionFragment}reorder}banners{...textFragment}}","variables":{"orderId":"3942254784218","emailAddress":"cindibutcher@gmail.com"}}' \
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
    echo "'3942254784218" >> track-OrderID.txt
    echo "cindibutcher@gmail.com" >> track-email.txt
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
            if [[ `echo $curl10 | jq '.data.guestOrder.groups_2101['${i[@]}'].items['${j[@]}'].productInfo.usItemId'` == '"285333157"' ]]; then
                echo "'3942254784218" >> track-OrderID.txt
                echo cindibutcher@gmail.com >> track-email.txt
                echo $curl10 | jq '.data.guestOrder.groups_2101['${i[@]}'].items['${j[@]}'].productInfo.usItemId' >> track-usItemId.txt
                echo $curl10 | jq '.data.guestOrder.groups_2101['${i[@]}'].items['${j[@]}'].priceInfo.linePrice.value' >> track-priceValue.txt
                echo $curl10 | jq '.data.guestOrder.groups_2101['${i[@]}'].deliveryAddress.fullName' >> track-fullName.txt
                echo $curl10 | jq '.data.guestOrder.groups_2101['${i[@]}'].deliveryAddress.address.addressString' >> track-address.txt
                echo $curl10 | jq '.data.guestOrder.groups_2101['${i[@]}'].status.message.parts[].text' >> track-status.txt
                echo $curl10 | jq '.data.guestOrder.groups_2101['${i[@]}'].shipment.trackingNumber' | sed 's/null//g' >> track-number.txt
                echo $curl10 | jq '.data.guestOrder.groups_2101['${i[@]}'].shipment.trackingUrl' | sed 's/null//g' >> track-url.txt
                echo $curl10 | jq '.data.guestOrder.groups_2101['${i[@]}'].categories[].type' >> track-categoriesType.txt
                echo $curl10 | jq '.data.guestOrder.groups_2101['${i[@]}'].status.subtext' >> track-subtext.txt
                break
            fi
        done
    done
    if [[ $sum10 == `md5 track-OrderID.txt` ]]; then
        echo "10-Khác Item"
        echo "'3942254784218" >> track-OrderID.txt
        echo "cindibutcher@gmail.com" >> track-email.txt
        echo "Khác Item" >> track-usItemId.txt
        echo "Khác Item" >> track-priceValue.txt
        echo "Khác Item" >> track-fullName.txt
        echo "Khác Item" >> track-address.txt
        echo "Khác Item" >> track-status.txt
        echo "Khác Item" >> track-number.txt
        echo "Khác Item" >> track-url.txt
        echo "Khác Item" >> track-categoriesType.txt
        echo "Khác Item" >> track-subtext.txt
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
  -H 'user-agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.51 Safari/537.36 Edg/99.0.1150.39' \
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
  --data-raw $'{"query":"query getGuestOrder($orderId:ID\u0021 $emailAddress:String\u0021){guestOrder(input:{id:$orderId emailAddress:$emailAddress}){...OrderFieldsFragment}}fragment cancelReason on OrderCancelReason{__typename subReasonCode subDescription}fragment priceDetailFragment on OrderPriceDetailRow{label value displayValue info{title message}rowInfo{...orderPriceDetailRowInfo}}fragment orderPriceDetailRowInfo on OrderPriceDetailRowInfo{title message{...textFragment}}fragment price on Price{displayValue value}fragment variants on MapEntry{name value}fragment OrderAddOn on OrderAddOn{lineId uniqueLineId productInfo{name usItemId offerId}quantityString quantityLabel type fulfillmentInstructions{...textFragment}actions{manageProtectionPlan{...orderActionFragment}cancel}priceInfo{linePrice{...price}}quantity isActive}fragment orderDonationDetails on OrderDonationDetails{message{...textFragment}emailReceipt emailReceiptToken status{...textFragment}errorStatus}fragment orderLineItem on OrderLineItem{id uniqueId actions{contactSeller cancel addToCart configureCake reviewItem resendEGiftCardToken protectionPlan{...orderActionFragment}manageProtectionPlan{...orderActionFragment}}isGift digitalDeliveryMessage quantity quantityString quantityLabel isSubstitutionSelected fulfilledItems{id quantityString priceInfo{itemPrice{value}}productInfo{usItemId name}}isReturnable returnEligibilityMessage productInfo{name usItemId imageInfo{thumbnailUrl}canonicalUrl offerId orderLimit orderMinLimit weightIncrement salesUnit salesUnitType isSubstitutionEligible isAlcohol}reshop{reshopMessage isShippingAvailable minPromiseDate maxPromiseDate}selectedVariants{...variants}variantAdditionalInfo{parts{text nativeAction}}priceInfo{priceDisplayCodes{showItemPrice priceDisplayCondition finalCostByWeight}itemPrice{...price}linePrice{...price}unitPrice{...price}preDiscountedLinePrice{...price}additionalLines{name value}}discounts{label labelText{...textFragment}}itemReviewed activationCodes{label code}protectionPlanMessage{...textFragment}showSeller isShippedByWalmart seller{id name isPro}digitalDeliveryPhoneNumber addOns{...OrderAddOn}multiboxBundleId}fragment DriverFragment on Driver{id firstName photoUrl}fragment OrderGroupFragment on OrderGroup{driver{...DriverFragment}deliveryDate fulfillmentType status{...OrderGroupStatusFragment}showSeller isShippedByWalmart seller{...SellerFragment}id itemCount items{...LiteLineItemFragment}pickupPerson{firstName lastName email}accessPointId shipment{...ShipmentFragment}returnEligibilityMessage actions{...OrderGroupActionsFragment}recipientEmailAddress digitalDelivery{...DigitalDeliveryFragment}tireInstallationReservation{status extraText reservationId}}fragment OrderGroupStatusFragment on OrderGroupStatus{statusType showStatusTracker statusTracker{status label isCurrent}message{...textFragment}subtext subMessage{...textFragment}notice helpCenterText{...textFragment}}fragment textFragment on Text{parts{bold url text nativeAction lineBreak}}fragment LiteLineItemFragment on OrderLineItem{id quantity productInfo{name usItemId imageInfo{thumbnailUrl}offerId isAlcohol}priceInfo{linePrice{...price}}}fragment SellerFragment on GroupSeller{id name isPro}fragment DigitalDeliveryFragment on DigitalDelivery{title name instructions{...textFragment}}fragment ShipmentFragment on Shipment{id trackingNumber isExternalTracking trackingUrl proofOfDelivery{...ProofOfDeliveryFragment}}fragment OrderGroupActionsFragment on OrderGroupActions{reorder edit track changeSlot checkin editDeliveryInstructions editPickupPerson editTip tip rateDriver cancel enableTip{...orderActionFragment}enableEdit{...orderActionFragment}rescheduleTireInstall{...orderActionFragment}cancelTireInstall{...orderActionFragment}help viewCancellationDetails{...cancellationDetailsActionFragment}}fragment cancellationDetailsActionFragment on CancellationDetailsAction{label heading text{...textFragment}}fragment ProofOfDeliveryFragment on ProofOfDelivery{photoUrl photoPreviewUrl showPreview}fragment DeliveryInstructionsFragment on DeliveryInstructions{text type typeText}fragment GiftDetailsFragment on GiftDetails{recipientAddress{fullName}recipientEmail senderName giftMessage}fragment SubstitutionAction on SubstitutionAction{message label type}fragment ODPGroupCategoryFragment on OrderCategory{type name subtext returnMessage substitutionsBanner{...textFragment}showExtendedSubstitutions actions{substitutions{...SubstitutionAction}nilPickReshop{message action{text url}}returnDetails viewCancellationDetails{...cancellationDetailsActionFragment}trackOnInHomeApp}banner{...textFragment}accordionState items{...orderLineItem}substitutions{...orderLineItem fulfilledItems{...orderLineItem}}returnInfo{...returnInfoFragment}}fragment ODPGroupFragment on OrderGroup{id fulfillmentType deliveryMessage deliveryAddress{fullName firstName lastName address{...addressFragment}}deliveryInstructions{...DeliveryInstructionsFragment}deliveryPreferences{text{...textFragment}cta{...orderActionFragment}}editSubstitutionsCutOff status{statusType showStatusTracker message{...textFragment}notice helpCenterText{...textFragment}}itemCount isCategorized categories{...ODPGroupCategoryFragment}seller{id name isPro}shipment{id trackingNumber}actions{reorder edit track changeSlot checkin editDeliveryInstructions editPickupPerson tip cancel help enableTip{...orderActionFragment}enableEdit{...orderActionFragment}viewCancellationDetails{...cancellationDetailsActionFragment}enableInHome{...orderActionFragment}createGiftReceipt}cutOffTimestamp isEditSubstitutionsEligible isInHome giftDetails{...GiftDetailsFragment}donationDetails{...orderDonationDetails}}fragment returnInfoFragment on ReturnInfo{returnOrderId type refundPriceDetails{__typename...refundPriceDetailsFragment}refundMessage tierRefundMessage paymentMethods{__typename description cardType paymentType displayValues message{...textFragment}}actions{__typename generate scheduleOrModifyPickup{text url}reschedulePickup editPickupContact}shippingLabelUrl qrCodeImageUrl carriers{__typename id name}pickupCarrier pickupContact{nameAndAddress{fullName firstName lastName address{addressString city state postalCode addressLineOne addressLineTwo country}}phone}pickupConfirmationNumber bannerMessage{...textFragment}}fragment refundPriceDetailsFragment on RefundPriceDetails{subTotal{__typename...orderPriceDetailRowFragment}fees{__typename...orderPriceDetailRowFragment}discounts{__typename...orderPriceDetailRowFragment}taxTotal{__typename...orderPriceDetailRowFragment}grandTotal{__typename...orderPriceDetailRowFragment}}fragment orderPriceDetailRowFragment on OrderPriceDetailRow{label displayValue value info{__typename title message}}fragment addressFragment on OrderAddress{addressString addressLineOne addressLineTwo state postalCode city}fragment ODPPickupInfo on OrderGroup{pickupInstructions pickupPerson{...person}alternatePickupPerson{...person}store{id name address{...addressFragment}}}fragment person on OrderPickupPerson{firstName lastName email}fragment ODPTippingInfo on OrderGroup{addTipMessage{...textFragment}driver{...DriverFragment}tipping{min{...price}max{...price}suggested{...price}preselected}subtotal{...price}}fragment orderActionFragment on Action{text url}fragment orderCustomer on OrderCustomer{id firstName lastName email isGuest isEmailRegistered}fragment OrderFieldsFragment on Order{__typename id version type customer{...orderCustomer}displayId idBarcodeImageUrl(barWidth:3 barHeight:100) isFuelPurchase title shortTitle timezone tippableGroup{...OrderGroupFragment}amendableGroup{id changeSlotIterationsLeft cutOffTimestamp fulfillmentType deliveryAddress{fullName firstName lastName address{addressString addressLineOne addressLineTwo state postalCode city country}}isAmendInProgress}substitutionsBanner{heading subheading longSubheading}groups_2101{__typename...OrderGroupFragment...ODPGroupFragment...ODPPickupInfo...ODPTippingInfo}multiboxBundles{...orderLineItem}itemCancelReasons{__typename...cancelReason}groupCancelReasons{__typename...cancelReason}priceDetails{__typename subTotal{__typename...priceDetailFragment}taxTotal{__typename...priceDetailFragment}grandTotal{__typename...priceDetailFragment}authorizationAmount{__typename...priceDetailFragment}fees{__typename...priceDetailFragment}discounts{__typename...priceDetailFragment}minimumThreshold{__typename...price}belowMinimumFee{__typename...priceDetailFragment}driverTip{__typename...priceDetailFragment}donations{__typename...priceDetailFragment}}paymentMethods{__typename description cardType paymentType displayValues message{...textFragment}actions{connectToCapitalOne{...orderActionFragment}visitAffirm{...orderActionFragment}}}actions{__typename return pendingReturn cancel startReturn{...orderActionFragment}reorder}banners{...textFragment}}","variables":{"orderId":"3952256908309","emailAddress":"delaneymilbraney@gmail.com"}}' \
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
    echo "'3952256908309" >> track-OrderID.txt
    echo "delaneymilbraney@gmail.com" >> track-email.txt
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
            if [[ `echo $curl11 | jq '.data.guestOrder.groups_2101['${i[@]}'].items['${j[@]}'].productInfo.usItemId'` == '"818068049"' ]]; then
                echo "'3952256908309" >> track-OrderID.txt
                echo delaneymilbraney@gmail.com >> track-email.txt
                echo $curl11 | jq '.data.guestOrder.groups_2101['${i[@]}'].items['${j[@]}'].productInfo.usItemId' >> track-usItemId.txt
                echo $curl11 | jq '.data.guestOrder.groups_2101['${i[@]}'].items['${j[@]}'].priceInfo.linePrice.value' >> track-priceValue.txt
                echo $curl11 | jq '.data.guestOrder.groups_2101['${i[@]}'].deliveryAddress.fullName' >> track-fullName.txt
                echo $curl11 | jq '.data.guestOrder.groups_2101['${i[@]}'].deliveryAddress.address.addressString' >> track-address.txt
                echo $curl11 | jq '.data.guestOrder.groups_2101['${i[@]}'].status.message.parts[].text' >> track-status.txt
                echo $curl11 | jq '.data.guestOrder.groups_2101['${i[@]}'].shipment.trackingNumber' | sed 's/null//g' >> track-number.txt
                echo $curl11 | jq '.data.guestOrder.groups_2101['${i[@]}'].shipment.trackingUrl' | sed 's/null//g' >> track-url.txt
                echo $curl11 | jq '.data.guestOrder.groups_2101['${i[@]}'].categories[].type' >> track-categoriesType.txt
                echo $curl11 | jq '.data.guestOrder.groups_2101['${i[@]}'].status.subtext' >> track-subtext.txt
                break
            fi
        done
    done
    if [[ $sum11 == `md5 track-OrderID.txt` ]]; then
        echo "11-Khác Item"
        echo "'3952256908309" >> track-OrderID.txt
        echo "delaneymilbraney@gmail.com" >> track-email.txt
        echo "Khác Item" >> track-usItemId.txt
        echo "Khác Item" >> track-priceValue.txt
        echo "Khác Item" >> track-fullName.txt
        echo "Khác Item" >> track-address.txt
        echo "Khác Item" >> track-status.txt
        echo "Khác Item" >> track-number.txt
        echo "Khác Item" >> track-url.txt
        echo "Khác Item" >> track-categoriesType.txt
        echo "Khác Item" >> track-subtext.txt
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
  -H 'user-agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.51 Safari/537.36 Edg/99.0.1150.39' \
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
  --data-raw $'{"query":"query getGuestOrder($orderId:ID\u0021 $emailAddress:String\u0021){guestOrder(input:{id:$orderId emailAddress:$emailAddress}){...OrderFieldsFragment}}fragment cancelReason on OrderCancelReason{__typename subReasonCode subDescription}fragment priceDetailFragment on OrderPriceDetailRow{label value displayValue info{title message}rowInfo{...orderPriceDetailRowInfo}}fragment orderPriceDetailRowInfo on OrderPriceDetailRowInfo{title message{...textFragment}}fragment price on Price{displayValue value}fragment variants on MapEntry{name value}fragment OrderAddOn on OrderAddOn{lineId uniqueLineId productInfo{name usItemId offerId}quantityString quantityLabel type fulfillmentInstructions{...textFragment}actions{manageProtectionPlan{...orderActionFragment}cancel}priceInfo{linePrice{...price}}quantity isActive}fragment orderDonationDetails on OrderDonationDetails{message{...textFragment}emailReceipt emailReceiptToken status{...textFragment}errorStatus}fragment orderLineItem on OrderLineItem{id uniqueId actions{contactSeller cancel addToCart configureCake reviewItem resendEGiftCardToken protectionPlan{...orderActionFragment}manageProtectionPlan{...orderActionFragment}}isGift digitalDeliveryMessage quantity quantityString quantityLabel isSubstitutionSelected fulfilledItems{id quantityString priceInfo{itemPrice{value}}productInfo{usItemId name}}isReturnable returnEligibilityMessage productInfo{name usItemId imageInfo{thumbnailUrl}canonicalUrl offerId orderLimit orderMinLimit weightIncrement salesUnit salesUnitType isSubstitutionEligible isAlcohol}reshop{reshopMessage isShippingAvailable minPromiseDate maxPromiseDate}selectedVariants{...variants}variantAdditionalInfo{parts{text nativeAction}}priceInfo{priceDisplayCodes{showItemPrice priceDisplayCondition finalCostByWeight}itemPrice{...price}linePrice{...price}unitPrice{...price}preDiscountedLinePrice{...price}additionalLines{name value}}discounts{label labelText{...textFragment}}itemReviewed activationCodes{label code}protectionPlanMessage{...textFragment}showSeller isShippedByWalmart seller{id name isPro}digitalDeliveryPhoneNumber addOns{...OrderAddOn}multiboxBundleId}fragment DriverFragment on Driver{id firstName photoUrl}fragment OrderGroupFragment on OrderGroup{driver{...DriverFragment}deliveryDate fulfillmentType status{...OrderGroupStatusFragment}showSeller isShippedByWalmart seller{...SellerFragment}id itemCount items{...LiteLineItemFragment}pickupPerson{firstName lastName email}accessPointId shipment{...ShipmentFragment}returnEligibilityMessage actions{...OrderGroupActionsFragment}recipientEmailAddress digitalDelivery{...DigitalDeliveryFragment}tireInstallationReservation{status extraText reservationId}}fragment OrderGroupStatusFragment on OrderGroupStatus{statusType showStatusTracker statusTracker{status label isCurrent}message{...textFragment}subtext subMessage{...textFragment}notice helpCenterText{...textFragment}}fragment textFragment on Text{parts{bold url text nativeAction lineBreak}}fragment LiteLineItemFragment on OrderLineItem{id quantity productInfo{name usItemId imageInfo{thumbnailUrl}offerId isAlcohol}priceInfo{linePrice{...price}}}fragment SellerFragment on GroupSeller{id name isPro}fragment DigitalDeliveryFragment on DigitalDelivery{title name instructions{...textFragment}}fragment ShipmentFragment on Shipment{id trackingNumber isExternalTracking trackingUrl proofOfDelivery{...ProofOfDeliveryFragment}}fragment OrderGroupActionsFragment on OrderGroupActions{reorder edit track changeSlot checkin editDeliveryInstructions editPickupPerson editTip tip rateDriver cancel enableTip{...orderActionFragment}enableEdit{...orderActionFragment}rescheduleTireInstall{...orderActionFragment}cancelTireInstall{...orderActionFragment}help viewCancellationDetails{...cancellationDetailsActionFragment}}fragment cancellationDetailsActionFragment on CancellationDetailsAction{label heading text{...textFragment}}fragment ProofOfDeliveryFragment on ProofOfDelivery{photoUrl photoPreviewUrl showPreview}fragment DeliveryInstructionsFragment on DeliveryInstructions{text type typeText}fragment GiftDetailsFragment on GiftDetails{recipientAddress{fullName}recipientEmail senderName giftMessage}fragment SubstitutionAction on SubstitutionAction{message label type}fragment ODPGroupCategoryFragment on OrderCategory{type name subtext returnMessage substitutionsBanner{...textFragment}showExtendedSubstitutions actions{substitutions{...SubstitutionAction}nilPickReshop{message action{text url}}returnDetails viewCancellationDetails{...cancellationDetailsActionFragment}trackOnInHomeApp}banner{...textFragment}accordionState items{...orderLineItem}substitutions{...orderLineItem fulfilledItems{...orderLineItem}}returnInfo{...returnInfoFragment}}fragment ODPGroupFragment on OrderGroup{id fulfillmentType deliveryMessage deliveryAddress{fullName firstName lastName address{...addressFragment}}deliveryInstructions{...DeliveryInstructionsFragment}deliveryPreferences{text{...textFragment}cta{...orderActionFragment}}editSubstitutionsCutOff status{statusType showStatusTracker message{...textFragment}notice helpCenterText{...textFragment}}itemCount isCategorized categories{...ODPGroupCategoryFragment}seller{id name isPro}shipment{id trackingNumber}actions{reorder edit track changeSlot checkin editDeliveryInstructions editPickupPerson tip cancel help enableTip{...orderActionFragment}enableEdit{...orderActionFragment}viewCancellationDetails{...cancellationDetailsActionFragment}enableInHome{...orderActionFragment}createGiftReceipt}cutOffTimestamp isEditSubstitutionsEligible isInHome giftDetails{...GiftDetailsFragment}donationDetails{...orderDonationDetails}}fragment returnInfoFragment on ReturnInfo{returnOrderId type refundPriceDetails{__typename...refundPriceDetailsFragment}refundMessage tierRefundMessage paymentMethods{__typename description cardType paymentType displayValues message{...textFragment}}actions{__typename generate scheduleOrModifyPickup{text url}reschedulePickup editPickupContact}shippingLabelUrl qrCodeImageUrl carriers{__typename id name}pickupCarrier pickupContact{nameAndAddress{fullName firstName lastName address{addressString city state postalCode addressLineOne addressLineTwo country}}phone}pickupConfirmationNumber bannerMessage{...textFragment}}fragment refundPriceDetailsFragment on RefundPriceDetails{subTotal{__typename...orderPriceDetailRowFragment}fees{__typename...orderPriceDetailRowFragment}discounts{__typename...orderPriceDetailRowFragment}taxTotal{__typename...orderPriceDetailRowFragment}grandTotal{__typename...orderPriceDetailRowFragment}}fragment orderPriceDetailRowFragment on OrderPriceDetailRow{label displayValue value info{__typename title message}}fragment addressFragment on OrderAddress{addressString addressLineOne addressLineTwo state postalCode city}fragment ODPPickupInfo on OrderGroup{pickupInstructions pickupPerson{...person}alternatePickupPerson{...person}store{id name address{...addressFragment}}}fragment person on OrderPickupPerson{firstName lastName email}fragment ODPTippingInfo on OrderGroup{addTipMessage{...textFragment}driver{...DriverFragment}tipping{min{...price}max{...price}suggested{...price}preselected}subtotal{...price}}fragment orderActionFragment on Action{text url}fragment orderCustomer on OrderCustomer{id firstName lastName email isGuest isEmailRegistered}fragment OrderFieldsFragment on Order{__typename id version type customer{...orderCustomer}displayId idBarcodeImageUrl(barWidth:3 barHeight:100) isFuelPurchase title shortTitle timezone tippableGroup{...OrderGroupFragment}amendableGroup{id changeSlotIterationsLeft cutOffTimestamp fulfillmentType deliveryAddress{fullName firstName lastName address{addressString addressLineOne addressLineTwo state postalCode city country}}isAmendInProgress}substitutionsBanner{heading subheading longSubheading}groups_2101{__typename...OrderGroupFragment...ODPGroupFragment...ODPPickupInfo...ODPTippingInfo}multiboxBundles{...orderLineItem}itemCancelReasons{__typename...cancelReason}groupCancelReasons{__typename...cancelReason}priceDetails{__typename subTotal{__typename...priceDetailFragment}taxTotal{__typename...priceDetailFragment}grandTotal{__typename...priceDetailFragment}authorizationAmount{__typename...priceDetailFragment}fees{__typename...priceDetailFragment}discounts{__typename...priceDetailFragment}minimumThreshold{__typename...price}belowMinimumFee{__typename...priceDetailFragment}driverTip{__typename...priceDetailFragment}donations{__typename...priceDetailFragment}}paymentMethods{__typename description cardType paymentType displayValues message{...textFragment}actions{connectToCapitalOne{...orderActionFragment}visitAffirm{...orderActionFragment}}}actions{__typename return pendingReturn cancel startReturn{...orderActionFragment}reorder}banners{...textFragment}}","variables":{"orderId":"3952256617408","emailAddress":"antoniomendez51287@gmail.com"}}' \
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
    echo "'3952256617408" >> track-OrderID.txt
    echo "antoniomendez51287@gmail.com" >> track-email.txt
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
            if [[ `echo $curl12 | jq '.data.guestOrder.groups_2101['${i[@]}'].items['${j[@]}'].productInfo.usItemId'` == '"686978279"' ]]; then
                echo "'3952256617408" >> track-OrderID.txt
                echo antoniomendez51287@gmail.com >> track-email.txt
                echo $curl12 | jq '.data.guestOrder.groups_2101['${i[@]}'].items['${j[@]}'].productInfo.usItemId' >> track-usItemId.txt
                echo $curl12 | jq '.data.guestOrder.groups_2101['${i[@]}'].items['${j[@]}'].priceInfo.linePrice.value' >> track-priceValue.txt
                echo $curl12 | jq '.data.guestOrder.groups_2101['${i[@]}'].deliveryAddress.fullName' >> track-fullName.txt
                echo $curl12 | jq '.data.guestOrder.groups_2101['${i[@]}'].deliveryAddress.address.addressString' >> track-address.txt
                echo $curl12 | jq '.data.guestOrder.groups_2101['${i[@]}'].status.message.parts[].text' >> track-status.txt
                echo $curl12 | jq '.data.guestOrder.groups_2101['${i[@]}'].shipment.trackingNumber' | sed 's/null//g' >> track-number.txt
                echo $curl12 | jq '.data.guestOrder.groups_2101['${i[@]}'].shipment.trackingUrl' | sed 's/null//g' >> track-url.txt
                echo $curl12 | jq '.data.guestOrder.groups_2101['${i[@]}'].categories[].type' >> track-categoriesType.txt
                echo $curl12 | jq '.data.guestOrder.groups_2101['${i[@]}'].status.subtext' >> track-subtext.txt
                break
            fi
        done
    done
    if [[ $sum12 == `md5 track-OrderID.txt` ]]; then
        echo "12-Khác Item"
        echo "'3952256617408" >> track-OrderID.txt
        echo "antoniomendez51287@gmail.com" >> track-email.txt
        echo "Khác Item" >> track-usItemId.txt
        echo "Khác Item" >> track-priceValue.txt
        echo "Khác Item" >> track-fullName.txt
        echo "Khác Item" >> track-address.txt
        echo "Khác Item" >> track-status.txt
        echo "Khác Item" >> track-number.txt
        echo "Khác Item" >> track-url.txt
        echo "Khác Item" >> track-categoriesType.txt
        echo "Khác Item" >> track-subtext.txt
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
  -H 'user-agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.51 Safari/537.36 Edg/99.0.1150.39' \
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
  --data-raw $'{"query":"query getGuestOrder($orderId:ID\u0021 $emailAddress:String\u0021){guestOrder(input:{id:$orderId emailAddress:$emailAddress}){...OrderFieldsFragment}}fragment cancelReason on OrderCancelReason{__typename subReasonCode subDescription}fragment priceDetailFragment on OrderPriceDetailRow{label value displayValue info{title message}rowInfo{...orderPriceDetailRowInfo}}fragment orderPriceDetailRowInfo on OrderPriceDetailRowInfo{title message{...textFragment}}fragment price on Price{displayValue value}fragment variants on MapEntry{name value}fragment OrderAddOn on OrderAddOn{lineId uniqueLineId productInfo{name usItemId offerId}quantityString quantityLabel type fulfillmentInstructions{...textFragment}actions{manageProtectionPlan{...orderActionFragment}cancel}priceInfo{linePrice{...price}}quantity isActive}fragment orderDonationDetails on OrderDonationDetails{message{...textFragment}emailReceipt emailReceiptToken status{...textFragment}errorStatus}fragment orderLineItem on OrderLineItem{id uniqueId actions{contactSeller cancel addToCart configureCake reviewItem resendEGiftCardToken protectionPlan{...orderActionFragment}manageProtectionPlan{...orderActionFragment}}isGift digitalDeliveryMessage quantity quantityString quantityLabel isSubstitutionSelected fulfilledItems{id quantityString priceInfo{itemPrice{value}}productInfo{usItemId name}}isReturnable returnEligibilityMessage productInfo{name usItemId imageInfo{thumbnailUrl}canonicalUrl offerId orderLimit orderMinLimit weightIncrement salesUnit salesUnitType isSubstitutionEligible isAlcohol}reshop{reshopMessage isShippingAvailable minPromiseDate maxPromiseDate}selectedVariants{...variants}variantAdditionalInfo{parts{text nativeAction}}priceInfo{priceDisplayCodes{showItemPrice priceDisplayCondition finalCostByWeight}itemPrice{...price}linePrice{...price}unitPrice{...price}preDiscountedLinePrice{...price}additionalLines{name value}}discounts{label labelText{...textFragment}}itemReviewed activationCodes{label code}protectionPlanMessage{...textFragment}showSeller isShippedByWalmart seller{id name isPro}digitalDeliveryPhoneNumber addOns{...OrderAddOn}multiboxBundleId}fragment DriverFragment on Driver{id firstName photoUrl}fragment OrderGroupFragment on OrderGroup{driver{...DriverFragment}deliveryDate fulfillmentType status{...OrderGroupStatusFragment}showSeller isShippedByWalmart seller{...SellerFragment}id itemCount items{...LiteLineItemFragment}pickupPerson{firstName lastName email}accessPointId shipment{...ShipmentFragment}returnEligibilityMessage actions{...OrderGroupActionsFragment}recipientEmailAddress digitalDelivery{...DigitalDeliveryFragment}tireInstallationReservation{status extraText reservationId}}fragment OrderGroupStatusFragment on OrderGroupStatus{statusType showStatusTracker statusTracker{status label isCurrent}message{...textFragment}subtext subMessage{...textFragment}notice helpCenterText{...textFragment}}fragment textFragment on Text{parts{bold url text nativeAction lineBreak}}fragment LiteLineItemFragment on OrderLineItem{id quantity productInfo{name usItemId imageInfo{thumbnailUrl}offerId isAlcohol}priceInfo{linePrice{...price}}}fragment SellerFragment on GroupSeller{id name isPro}fragment DigitalDeliveryFragment on DigitalDelivery{title name instructions{...textFragment}}fragment ShipmentFragment on Shipment{id trackingNumber isExternalTracking trackingUrl proofOfDelivery{...ProofOfDeliveryFragment}}fragment OrderGroupActionsFragment on OrderGroupActions{reorder edit track changeSlot checkin editDeliveryInstructions editPickupPerson editTip tip rateDriver cancel enableTip{...orderActionFragment}enableEdit{...orderActionFragment}rescheduleTireInstall{...orderActionFragment}cancelTireInstall{...orderActionFragment}help viewCancellationDetails{...cancellationDetailsActionFragment}}fragment cancellationDetailsActionFragment on CancellationDetailsAction{label heading text{...textFragment}}fragment ProofOfDeliveryFragment on ProofOfDelivery{photoUrl photoPreviewUrl showPreview}fragment DeliveryInstructionsFragment on DeliveryInstructions{text type typeText}fragment GiftDetailsFragment on GiftDetails{recipientAddress{fullName}recipientEmail senderName giftMessage}fragment SubstitutionAction on SubstitutionAction{message label type}fragment ODPGroupCategoryFragment on OrderCategory{type name subtext returnMessage substitutionsBanner{...textFragment}showExtendedSubstitutions actions{substitutions{...SubstitutionAction}nilPickReshop{message action{text url}}returnDetails viewCancellationDetails{...cancellationDetailsActionFragment}trackOnInHomeApp}banner{...textFragment}accordionState items{...orderLineItem}substitutions{...orderLineItem fulfilledItems{...orderLineItem}}returnInfo{...returnInfoFragment}}fragment ODPGroupFragment on OrderGroup{id fulfillmentType deliveryMessage deliveryAddress{fullName firstName lastName address{...addressFragment}}deliveryInstructions{...DeliveryInstructionsFragment}deliveryPreferences{text{...textFragment}cta{...orderActionFragment}}editSubstitutionsCutOff status{statusType showStatusTracker message{...textFragment}notice helpCenterText{...textFragment}}itemCount isCategorized categories{...ODPGroupCategoryFragment}seller{id name isPro}shipment{id trackingNumber}actions{reorder edit track changeSlot checkin editDeliveryInstructions editPickupPerson tip cancel help enableTip{...orderActionFragment}enableEdit{...orderActionFragment}viewCancellationDetails{...cancellationDetailsActionFragment}enableInHome{...orderActionFragment}createGiftReceipt}cutOffTimestamp isEditSubstitutionsEligible isInHome giftDetails{...GiftDetailsFragment}donationDetails{...orderDonationDetails}}fragment returnInfoFragment on ReturnInfo{returnOrderId type refundPriceDetails{__typename...refundPriceDetailsFragment}refundMessage tierRefundMessage paymentMethods{__typename description cardType paymentType displayValues message{...textFragment}}actions{__typename generate scheduleOrModifyPickup{text url}reschedulePickup editPickupContact}shippingLabelUrl qrCodeImageUrl carriers{__typename id name}pickupCarrier pickupContact{nameAndAddress{fullName firstName lastName address{addressString city state postalCode addressLineOne addressLineTwo country}}phone}pickupConfirmationNumber bannerMessage{...textFragment}}fragment refundPriceDetailsFragment on RefundPriceDetails{subTotal{__typename...orderPriceDetailRowFragment}fees{__typename...orderPriceDetailRowFragment}discounts{__typename...orderPriceDetailRowFragment}taxTotal{__typename...orderPriceDetailRowFragment}grandTotal{__typename...orderPriceDetailRowFragment}}fragment orderPriceDetailRowFragment on OrderPriceDetailRow{label displayValue value info{__typename title message}}fragment addressFragment on OrderAddress{addressString addressLineOne addressLineTwo state postalCode city}fragment ODPPickupInfo on OrderGroup{pickupInstructions pickupPerson{...person}alternatePickupPerson{...person}store{id name address{...addressFragment}}}fragment person on OrderPickupPerson{firstName lastName email}fragment ODPTippingInfo on OrderGroup{addTipMessage{...textFragment}driver{...DriverFragment}tipping{min{...price}max{...price}suggested{...price}preselected}subtotal{...price}}fragment orderActionFragment on Action{text url}fragment orderCustomer on OrderCustomer{id firstName lastName email isGuest isEmailRegistered}fragment OrderFieldsFragment on Order{__typename id version type customer{...orderCustomer}displayId idBarcodeImageUrl(barWidth:3 barHeight:100) isFuelPurchase title shortTitle timezone tippableGroup{...OrderGroupFragment}amendableGroup{id changeSlotIterationsLeft cutOffTimestamp fulfillmentType deliveryAddress{fullName firstName lastName address{addressString addressLineOne addressLineTwo state postalCode city country}}isAmendInProgress}substitutionsBanner{heading subheading longSubheading}groups_2101{__typename...OrderGroupFragment...ODPGroupFragment...ODPPickupInfo...ODPTippingInfo}multiboxBundles{...orderLineItem}itemCancelReasons{__typename...cancelReason}groupCancelReasons{__typename...cancelReason}priceDetails{__typename subTotal{__typename...priceDetailFragment}taxTotal{__typename...priceDetailFragment}grandTotal{__typename...priceDetailFragment}authorizationAmount{__typename...priceDetailFragment}fees{__typename...priceDetailFragment}discounts{__typename...priceDetailFragment}minimumThreshold{__typename...price}belowMinimumFee{__typename...priceDetailFragment}driverTip{__typename...priceDetailFragment}donations{__typename...priceDetailFragment}}paymentMethods{__typename description cardType paymentType displayValues message{...textFragment}actions{connectToCapitalOne{...orderActionFragment}visitAffirm{...orderActionFragment}}}actions{__typename return pendingReturn cancel startReturn{...orderActionFragment}reorder}banners{...textFragment}}","variables":{"orderId":"3952256522972","emailAddress":"Samanthadarnell2010@gmail.com"}}' \
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
    echo "'3952256522972" >> track-OrderID.txt
    echo "Samanthadarnell2010@gmail.com" >> track-email.txt
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
            if [[ `echo $curl13 | jq '.data.guestOrder.groups_2101['${i[@]}'].items['${j[@]}'].productInfo.usItemId'` == '"37550884"' ]]; then
                echo "'3952256522972" >> track-OrderID.txt
                echo Samanthadarnell2010@gmail.com >> track-email.txt
                echo $curl13 | jq '.data.guestOrder.groups_2101['${i[@]}'].items['${j[@]}'].productInfo.usItemId' >> track-usItemId.txt
                echo $curl13 | jq '.data.guestOrder.groups_2101['${i[@]}'].items['${j[@]}'].priceInfo.linePrice.value' >> track-priceValue.txt
                echo $curl13 | jq '.data.guestOrder.groups_2101['${i[@]}'].deliveryAddress.fullName' >> track-fullName.txt
                echo $curl13 | jq '.data.guestOrder.groups_2101['${i[@]}'].deliveryAddress.address.addressString' >> track-address.txt
                echo $curl13 | jq '.data.guestOrder.groups_2101['${i[@]}'].status.message.parts[].text' >> track-status.txt
                echo $curl13 | jq '.data.guestOrder.groups_2101['${i[@]}'].shipment.trackingNumber' | sed 's/null//g' >> track-number.txt
                echo $curl13 | jq '.data.guestOrder.groups_2101['${i[@]}'].shipment.trackingUrl' | sed 's/null//g' >> track-url.txt
                echo $curl13 | jq '.data.guestOrder.groups_2101['${i[@]}'].categories[].type' >> track-categoriesType.txt
                echo $curl13 | jq '.data.guestOrder.groups_2101['${i[@]}'].status.subtext' >> track-subtext.txt
                break
            fi
        done
    done
    if [[ $sum13 == `md5 track-OrderID.txt` ]]; then
        echo "13-Khác Item"
        echo "'3952256522972" >> track-OrderID.txt
        echo "Samanthadarnell2010@gmail.com" >> track-email.txt
        echo "Khác Item" >> track-usItemId.txt
        echo "Khác Item" >> track-priceValue.txt
        echo "Khác Item" >> track-fullName.txt
        echo "Khác Item" >> track-address.txt
        echo "Khác Item" >> track-status.txt
        echo "Khác Item" >> track-number.txt
        echo "Khác Item" >> track-url.txt
        echo "Khác Item" >> track-categoriesType.txt
        echo "Khác Item" >> track-subtext.txt
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
  -H 'user-agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.51 Safari/537.36 Edg/99.0.1150.39' \
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
  --data-raw $'{"query":"query getGuestOrder($orderId:ID\u0021 $emailAddress:String\u0021){guestOrder(input:{id:$orderId emailAddress:$emailAddress}){...OrderFieldsFragment}}fragment cancelReason on OrderCancelReason{__typename subReasonCode subDescription}fragment priceDetailFragment on OrderPriceDetailRow{label value displayValue info{title message}rowInfo{...orderPriceDetailRowInfo}}fragment orderPriceDetailRowInfo on OrderPriceDetailRowInfo{title message{...textFragment}}fragment price on Price{displayValue value}fragment variants on MapEntry{name value}fragment OrderAddOn on OrderAddOn{lineId uniqueLineId productInfo{name usItemId offerId}quantityString quantityLabel type fulfillmentInstructions{...textFragment}actions{manageProtectionPlan{...orderActionFragment}cancel}priceInfo{linePrice{...price}}quantity isActive}fragment orderDonationDetails on OrderDonationDetails{message{...textFragment}emailReceipt emailReceiptToken status{...textFragment}errorStatus}fragment orderLineItem on OrderLineItem{id uniqueId actions{contactSeller cancel addToCart configureCake reviewItem resendEGiftCardToken protectionPlan{...orderActionFragment}manageProtectionPlan{...orderActionFragment}}isGift digitalDeliveryMessage quantity quantityString quantityLabel isSubstitutionSelected fulfilledItems{id quantityString priceInfo{itemPrice{value}}productInfo{usItemId name}}isReturnable returnEligibilityMessage productInfo{name usItemId imageInfo{thumbnailUrl}canonicalUrl offerId orderLimit orderMinLimit weightIncrement salesUnit salesUnitType isSubstitutionEligible isAlcohol}reshop{reshopMessage isShippingAvailable minPromiseDate maxPromiseDate}selectedVariants{...variants}variantAdditionalInfo{parts{text nativeAction}}priceInfo{priceDisplayCodes{showItemPrice priceDisplayCondition finalCostByWeight}itemPrice{...price}linePrice{...price}unitPrice{...price}preDiscountedLinePrice{...price}additionalLines{name value}}discounts{label labelText{...textFragment}}itemReviewed activationCodes{label code}protectionPlanMessage{...textFragment}showSeller isShippedByWalmart seller{id name isPro}digitalDeliveryPhoneNumber addOns{...OrderAddOn}multiboxBundleId}fragment DriverFragment on Driver{id firstName photoUrl}fragment OrderGroupFragment on OrderGroup{driver{...DriverFragment}deliveryDate fulfillmentType status{...OrderGroupStatusFragment}showSeller isShippedByWalmart seller{...SellerFragment}id itemCount items{...LiteLineItemFragment}pickupPerson{firstName lastName email}accessPointId shipment{...ShipmentFragment}returnEligibilityMessage actions{...OrderGroupActionsFragment}recipientEmailAddress digitalDelivery{...DigitalDeliveryFragment}tireInstallationReservation{status extraText reservationId}}fragment OrderGroupStatusFragment on OrderGroupStatus{statusType showStatusTracker statusTracker{status label isCurrent}message{...textFragment}subtext subMessage{...textFragment}notice helpCenterText{...textFragment}}fragment textFragment on Text{parts{bold url text nativeAction lineBreak}}fragment LiteLineItemFragment on OrderLineItem{id quantity productInfo{name usItemId imageInfo{thumbnailUrl}offerId isAlcohol}priceInfo{linePrice{...price}}}fragment SellerFragment on GroupSeller{id name isPro}fragment DigitalDeliveryFragment on DigitalDelivery{title name instructions{...textFragment}}fragment ShipmentFragment on Shipment{id trackingNumber isExternalTracking trackingUrl proofOfDelivery{...ProofOfDeliveryFragment}}fragment OrderGroupActionsFragment on OrderGroupActions{reorder edit track changeSlot checkin editDeliveryInstructions editPickupPerson editTip tip rateDriver cancel enableTip{...orderActionFragment}enableEdit{...orderActionFragment}rescheduleTireInstall{...orderActionFragment}cancelTireInstall{...orderActionFragment}help viewCancellationDetails{...cancellationDetailsActionFragment}}fragment cancellationDetailsActionFragment on CancellationDetailsAction{label heading text{...textFragment}}fragment ProofOfDeliveryFragment on ProofOfDelivery{photoUrl photoPreviewUrl showPreview}fragment DeliveryInstructionsFragment on DeliveryInstructions{text type typeText}fragment GiftDetailsFragment on GiftDetails{recipientAddress{fullName}recipientEmail senderName giftMessage}fragment SubstitutionAction on SubstitutionAction{message label type}fragment ODPGroupCategoryFragment on OrderCategory{type name subtext returnMessage substitutionsBanner{...textFragment}showExtendedSubstitutions actions{substitutions{...SubstitutionAction}nilPickReshop{message action{text url}}returnDetails viewCancellationDetails{...cancellationDetailsActionFragment}trackOnInHomeApp}banner{...textFragment}accordionState items{...orderLineItem}substitutions{...orderLineItem fulfilledItems{...orderLineItem}}returnInfo{...returnInfoFragment}}fragment ODPGroupFragment on OrderGroup{id fulfillmentType deliveryMessage deliveryAddress{fullName firstName lastName address{...addressFragment}}deliveryInstructions{...DeliveryInstructionsFragment}deliveryPreferences{text{...textFragment}cta{...orderActionFragment}}editSubstitutionsCutOff status{statusType showStatusTracker message{...textFragment}notice helpCenterText{...textFragment}}itemCount isCategorized categories{...ODPGroupCategoryFragment}seller{id name isPro}shipment{id trackingNumber}actions{reorder edit track changeSlot checkin editDeliveryInstructions editPickupPerson tip cancel help enableTip{...orderActionFragment}enableEdit{...orderActionFragment}viewCancellationDetails{...cancellationDetailsActionFragment}enableInHome{...orderActionFragment}createGiftReceipt}cutOffTimestamp isEditSubstitutionsEligible isInHome giftDetails{...GiftDetailsFragment}donationDetails{...orderDonationDetails}}fragment returnInfoFragment on ReturnInfo{returnOrderId type refundPriceDetails{__typename...refundPriceDetailsFragment}refundMessage tierRefundMessage paymentMethods{__typename description cardType paymentType displayValues message{...textFragment}}actions{__typename generate scheduleOrModifyPickup{text url}reschedulePickup editPickupContact}shippingLabelUrl qrCodeImageUrl carriers{__typename id name}pickupCarrier pickupContact{nameAndAddress{fullName firstName lastName address{addressString city state postalCode addressLineOne addressLineTwo country}}phone}pickupConfirmationNumber bannerMessage{...textFragment}}fragment refundPriceDetailsFragment on RefundPriceDetails{subTotal{__typename...orderPriceDetailRowFragment}fees{__typename...orderPriceDetailRowFragment}discounts{__typename...orderPriceDetailRowFragment}taxTotal{__typename...orderPriceDetailRowFragment}grandTotal{__typename...orderPriceDetailRowFragment}}fragment orderPriceDetailRowFragment on OrderPriceDetailRow{label displayValue value info{__typename title message}}fragment addressFragment on OrderAddress{addressString addressLineOne addressLineTwo state postalCode city}fragment ODPPickupInfo on OrderGroup{pickupInstructions pickupPerson{...person}alternatePickupPerson{...person}store{id name address{...addressFragment}}}fragment person on OrderPickupPerson{firstName lastName email}fragment ODPTippingInfo on OrderGroup{addTipMessage{...textFragment}driver{...DriverFragment}tipping{min{...price}max{...price}suggested{...price}preselected}subtotal{...price}}fragment orderActionFragment on Action{text url}fragment orderCustomer on OrderCustomer{id firstName lastName email isGuest isEmailRegistered}fragment OrderFieldsFragment on Order{__typename id version type customer{...orderCustomer}displayId idBarcodeImageUrl(barWidth:3 barHeight:100) isFuelPurchase title shortTitle timezone tippableGroup{...OrderGroupFragment}amendableGroup{id changeSlotIterationsLeft cutOffTimestamp fulfillmentType deliveryAddress{fullName firstName lastName address{addressString addressLineOne addressLineTwo state postalCode city country}}isAmendInProgress}substitutionsBanner{heading subheading longSubheading}groups_2101{__typename...OrderGroupFragment...ODPGroupFragment...ODPPickupInfo...ODPTippingInfo}multiboxBundles{...orderLineItem}itemCancelReasons{__typename...cancelReason}groupCancelReasons{__typename...cancelReason}priceDetails{__typename subTotal{__typename...priceDetailFragment}taxTotal{__typename...priceDetailFragment}grandTotal{__typename...priceDetailFragment}authorizationAmount{__typename...priceDetailFragment}fees{__typename...priceDetailFragment}discounts{__typename...priceDetailFragment}minimumThreshold{__typename...price}belowMinimumFee{__typename...priceDetailFragment}driverTip{__typename...priceDetailFragment}donations{__typename...priceDetailFragment}}paymentMethods{__typename description cardType paymentType displayValues message{...textFragment}actions{connectToCapitalOne{...orderActionFragment}visitAffirm{...orderActionFragment}}}actions{__typename return pendingReturn cancel startReturn{...orderActionFragment}reorder}banners{...textFragment}}","variables":{"orderId":"3952256526469","emailAddress":"elainaphillips@hotmail.com"}}' \
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
    echo "'3952256526469" >> track-OrderID.txt
    echo "elainaphillips@hotmail.com" >> track-email.txt
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
            if [[ `echo $curl14 | jq '.data.guestOrder.groups_2101['${i[@]}'].items['${j[@]}'].productInfo.usItemId'` == '"21474150"' ]]; then
                echo "'3952256526469" >> track-OrderID.txt
                echo elainaphillips@hotmail.com >> track-email.txt
                echo $curl14 | jq '.data.guestOrder.groups_2101['${i[@]}'].items['${j[@]}'].productInfo.usItemId' >> track-usItemId.txt
                echo $curl14 | jq '.data.guestOrder.groups_2101['${i[@]}'].items['${j[@]}'].priceInfo.linePrice.value' >> track-priceValue.txt
                echo $curl14 | jq '.data.guestOrder.groups_2101['${i[@]}'].deliveryAddress.fullName' >> track-fullName.txt
                echo $curl14 | jq '.data.guestOrder.groups_2101['${i[@]}'].deliveryAddress.address.addressString' >> track-address.txt
                echo $curl14 | jq '.data.guestOrder.groups_2101['${i[@]}'].status.message.parts[].text' >> track-status.txt
                echo $curl14 | jq '.data.guestOrder.groups_2101['${i[@]}'].shipment.trackingNumber' | sed 's/null//g' >> track-number.txt
                echo $curl14 | jq '.data.guestOrder.groups_2101['${i[@]}'].shipment.trackingUrl' | sed 's/null//g' >> track-url.txt
                echo $curl14 | jq '.data.guestOrder.groups_2101['${i[@]}'].categories[].type' >> track-categoriesType.txt
                echo $curl14 | jq '.data.guestOrder.groups_2101['${i[@]}'].status.subtext' >> track-subtext.txt
                break
            fi
        done
    done
    if [[ $sum14 == `md5 track-OrderID.txt` ]]; then
        echo "14-Khác Item"
        echo "'3952256526469" >> track-OrderID.txt
        echo "elainaphillips@hotmail.com" >> track-email.txt
        echo "Khác Item" >> track-usItemId.txt
        echo "Khác Item" >> track-priceValue.txt
        echo "Khác Item" >> track-fullName.txt
        echo "Khác Item" >> track-address.txt
        echo "Khác Item" >> track-status.txt
        echo "Khác Item" >> track-number.txt
        echo "Khác Item" >> track-url.txt
        echo "Khác Item" >> track-categoriesType.txt
        echo "Khác Item" >> track-subtext.txt
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
  -H 'user-agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.51 Safari/537.36 Edg/99.0.1150.39' \
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
  --data-raw $'{"query":"query getGuestOrder($orderId:ID\u0021 $emailAddress:String\u0021){guestOrder(input:{id:$orderId emailAddress:$emailAddress}){...OrderFieldsFragment}}fragment cancelReason on OrderCancelReason{__typename subReasonCode subDescription}fragment priceDetailFragment on OrderPriceDetailRow{label value displayValue info{title message}rowInfo{...orderPriceDetailRowInfo}}fragment orderPriceDetailRowInfo on OrderPriceDetailRowInfo{title message{...textFragment}}fragment price on Price{displayValue value}fragment variants on MapEntry{name value}fragment OrderAddOn on OrderAddOn{lineId uniqueLineId productInfo{name usItemId offerId}quantityString quantityLabel type fulfillmentInstructions{...textFragment}actions{manageProtectionPlan{...orderActionFragment}cancel}priceInfo{linePrice{...price}}quantity isActive}fragment orderDonationDetails on OrderDonationDetails{message{...textFragment}emailReceipt emailReceiptToken status{...textFragment}errorStatus}fragment orderLineItem on OrderLineItem{id uniqueId actions{contactSeller cancel addToCart configureCake reviewItem resendEGiftCardToken protectionPlan{...orderActionFragment}manageProtectionPlan{...orderActionFragment}}isGift digitalDeliveryMessage quantity quantityString quantityLabel isSubstitutionSelected fulfilledItems{id quantityString priceInfo{itemPrice{value}}productInfo{usItemId name}}isReturnable returnEligibilityMessage productInfo{name usItemId imageInfo{thumbnailUrl}canonicalUrl offerId orderLimit orderMinLimit weightIncrement salesUnit salesUnitType isSubstitutionEligible isAlcohol}reshop{reshopMessage isShippingAvailable minPromiseDate maxPromiseDate}selectedVariants{...variants}variantAdditionalInfo{parts{text nativeAction}}priceInfo{priceDisplayCodes{showItemPrice priceDisplayCondition finalCostByWeight}itemPrice{...price}linePrice{...price}unitPrice{...price}preDiscountedLinePrice{...price}additionalLines{name value}}discounts{label labelText{...textFragment}}itemReviewed activationCodes{label code}protectionPlanMessage{...textFragment}showSeller isShippedByWalmart seller{id name isPro}digitalDeliveryPhoneNumber addOns{...OrderAddOn}multiboxBundleId}fragment DriverFragment on Driver{id firstName photoUrl}fragment OrderGroupFragment on OrderGroup{driver{...DriverFragment}deliveryDate fulfillmentType status{...OrderGroupStatusFragment}showSeller isShippedByWalmart seller{...SellerFragment}id itemCount items{...LiteLineItemFragment}pickupPerson{firstName lastName email}accessPointId shipment{...ShipmentFragment}returnEligibilityMessage actions{...OrderGroupActionsFragment}recipientEmailAddress digitalDelivery{...DigitalDeliveryFragment}tireInstallationReservation{status extraText reservationId}}fragment OrderGroupStatusFragment on OrderGroupStatus{statusType showStatusTracker statusTracker{status label isCurrent}message{...textFragment}subtext subMessage{...textFragment}notice helpCenterText{...textFragment}}fragment textFragment on Text{parts{bold url text nativeAction lineBreak}}fragment LiteLineItemFragment on OrderLineItem{id quantity productInfo{name usItemId imageInfo{thumbnailUrl}offerId isAlcohol}priceInfo{linePrice{...price}}}fragment SellerFragment on GroupSeller{id name isPro}fragment DigitalDeliveryFragment on DigitalDelivery{title name instructions{...textFragment}}fragment ShipmentFragment on Shipment{id trackingNumber isExternalTracking trackingUrl proofOfDelivery{...ProofOfDeliveryFragment}}fragment OrderGroupActionsFragment on OrderGroupActions{reorder edit track changeSlot checkin editDeliveryInstructions editPickupPerson editTip tip rateDriver cancel enableTip{...orderActionFragment}enableEdit{...orderActionFragment}rescheduleTireInstall{...orderActionFragment}cancelTireInstall{...orderActionFragment}help viewCancellationDetails{...cancellationDetailsActionFragment}}fragment cancellationDetailsActionFragment on CancellationDetailsAction{label heading text{...textFragment}}fragment ProofOfDeliveryFragment on ProofOfDelivery{photoUrl photoPreviewUrl showPreview}fragment DeliveryInstructionsFragment on DeliveryInstructions{text type typeText}fragment GiftDetailsFragment on GiftDetails{recipientAddress{fullName}recipientEmail senderName giftMessage}fragment SubstitutionAction on SubstitutionAction{message label type}fragment ODPGroupCategoryFragment on OrderCategory{type name subtext returnMessage substitutionsBanner{...textFragment}showExtendedSubstitutions actions{substitutions{...SubstitutionAction}nilPickReshop{message action{text url}}returnDetails viewCancellationDetails{...cancellationDetailsActionFragment}trackOnInHomeApp}banner{...textFragment}accordionState items{...orderLineItem}substitutions{...orderLineItem fulfilledItems{...orderLineItem}}returnInfo{...returnInfoFragment}}fragment ODPGroupFragment on OrderGroup{id fulfillmentType deliveryMessage deliveryAddress{fullName firstName lastName address{...addressFragment}}deliveryInstructions{...DeliveryInstructionsFragment}deliveryPreferences{text{...textFragment}cta{...orderActionFragment}}editSubstitutionsCutOff status{statusType showStatusTracker message{...textFragment}notice helpCenterText{...textFragment}}itemCount isCategorized categories{...ODPGroupCategoryFragment}seller{id name isPro}shipment{id trackingNumber}actions{reorder edit track changeSlot checkin editDeliveryInstructions editPickupPerson tip cancel help enableTip{...orderActionFragment}enableEdit{...orderActionFragment}viewCancellationDetails{...cancellationDetailsActionFragment}enableInHome{...orderActionFragment}createGiftReceipt}cutOffTimestamp isEditSubstitutionsEligible isInHome giftDetails{...GiftDetailsFragment}donationDetails{...orderDonationDetails}}fragment returnInfoFragment on ReturnInfo{returnOrderId type refundPriceDetails{__typename...refundPriceDetailsFragment}refundMessage tierRefundMessage paymentMethods{__typename description cardType paymentType displayValues message{...textFragment}}actions{__typename generate scheduleOrModifyPickup{text url}reschedulePickup editPickupContact}shippingLabelUrl qrCodeImageUrl carriers{__typename id name}pickupCarrier pickupContact{nameAndAddress{fullName firstName lastName address{addressString city state postalCode addressLineOne addressLineTwo country}}phone}pickupConfirmationNumber bannerMessage{...textFragment}}fragment refundPriceDetailsFragment on RefundPriceDetails{subTotal{__typename...orderPriceDetailRowFragment}fees{__typename...orderPriceDetailRowFragment}discounts{__typename...orderPriceDetailRowFragment}taxTotal{__typename...orderPriceDetailRowFragment}grandTotal{__typename...orderPriceDetailRowFragment}}fragment orderPriceDetailRowFragment on OrderPriceDetailRow{label displayValue value info{__typename title message}}fragment addressFragment on OrderAddress{addressString addressLineOne addressLineTwo state postalCode city}fragment ODPPickupInfo on OrderGroup{pickupInstructions pickupPerson{...person}alternatePickupPerson{...person}store{id name address{...addressFragment}}}fragment person on OrderPickupPerson{firstName lastName email}fragment ODPTippingInfo on OrderGroup{addTipMessage{...textFragment}driver{...DriverFragment}tipping{min{...price}max{...price}suggested{...price}preselected}subtotal{...price}}fragment orderActionFragment on Action{text url}fragment orderCustomer on OrderCustomer{id firstName lastName email isGuest isEmailRegistered}fragment OrderFieldsFragment on Order{__typename id version type customer{...orderCustomer}displayId idBarcodeImageUrl(barWidth:3 barHeight:100) isFuelPurchase title shortTitle timezone tippableGroup{...OrderGroupFragment}amendableGroup{id changeSlotIterationsLeft cutOffTimestamp fulfillmentType deliveryAddress{fullName firstName lastName address{addressString addressLineOne addressLineTwo state postalCode city country}}isAmendInProgress}substitutionsBanner{heading subheading longSubheading}groups_2101{__typename...OrderGroupFragment...ODPGroupFragment...ODPPickupInfo...ODPTippingInfo}multiboxBundles{...orderLineItem}itemCancelReasons{__typename...cancelReason}groupCancelReasons{__typename...cancelReason}priceDetails{__typename subTotal{__typename...priceDetailFragment}taxTotal{__typename...priceDetailFragment}grandTotal{__typename...priceDetailFragment}authorizationAmount{__typename...priceDetailFragment}fees{__typename...priceDetailFragment}discounts{__typename...priceDetailFragment}minimumThreshold{__typename...price}belowMinimumFee{__typename...priceDetailFragment}driverTip{__typename...priceDetailFragment}donations{__typename...priceDetailFragment}}paymentMethods{__typename description cardType paymentType displayValues message{...textFragment}actions{connectToCapitalOne{...orderActionFragment}visitAffirm{...orderActionFragment}}}actions{__typename return pendingReturn cancel startReturn{...orderActionFragment}reorder}banners{...textFragment}}","variables":{"orderId":"3952256226805","emailAddress":"love.popcorn57@gmail.com"}}' \
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
    echo "'3952256226805" >> track-OrderID.txt
    echo "love.popcorn57@gmail.com" >> track-email.txt
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
            if [[ `echo $curl15 | jq '.data.guestOrder.groups_2101['${i[@]}'].items['${j[@]}'].productInfo.usItemId'` == '"875532417"' ]]; then
                echo "'3952256226805" >> track-OrderID.txt
                echo love.popcorn57@gmail.com >> track-email.txt
                echo $curl15 | jq '.data.guestOrder.groups_2101['${i[@]}'].items['${j[@]}'].productInfo.usItemId' >> track-usItemId.txt
                echo $curl15 | jq '.data.guestOrder.groups_2101['${i[@]}'].items['${j[@]}'].priceInfo.linePrice.value' >> track-priceValue.txt
                echo $curl15 | jq '.data.guestOrder.groups_2101['${i[@]}'].deliveryAddress.fullName' >> track-fullName.txt
                echo $curl15 | jq '.data.guestOrder.groups_2101['${i[@]}'].deliveryAddress.address.addressString' >> track-address.txt
                echo $curl15 | jq '.data.guestOrder.groups_2101['${i[@]}'].status.message.parts[].text' >> track-status.txt
                echo $curl15 | jq '.data.guestOrder.groups_2101['${i[@]}'].shipment.trackingNumber' | sed 's/null//g' >> track-number.txt
                echo $curl15 | jq '.data.guestOrder.groups_2101['${i[@]}'].shipment.trackingUrl' | sed 's/null//g' >> track-url.txt
                echo $curl15 | jq '.data.guestOrder.groups_2101['${i[@]}'].categories[].type' >> track-categoriesType.txt
                echo $curl15 | jq '.data.guestOrder.groups_2101['${i[@]}'].status.subtext' >> track-subtext.txt
                break
            fi
        done
    done
    if [[ $sum15 == `md5 track-OrderID.txt` ]]; then
        echo "15-Khác Item"
        echo "'3952256226805" >> track-OrderID.txt
        echo "love.popcorn57@gmail.com" >> track-email.txt
        echo "Khác Item" >> track-usItemId.txt
        echo "Khác Item" >> track-priceValue.txt
        echo "Khác Item" >> track-fullName.txt
        echo "Khác Item" >> track-address.txt
        echo "Khác Item" >> track-status.txt
        echo "Khác Item" >> track-number.txt
        echo "Khác Item" >> track-url.txt
        echo "Khác Item" >> track-categoriesType.txt
        echo "Khác Item" >> track-subtext.txt
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
  -H 'user-agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.51 Safari/537.36 Edg/99.0.1150.39' \
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
  --data-raw $'{"query":"query getGuestOrder($orderId:ID\u0021 $emailAddress:String\u0021){guestOrder(input:{id:$orderId emailAddress:$emailAddress}){...OrderFieldsFragment}}fragment cancelReason on OrderCancelReason{__typename subReasonCode subDescription}fragment priceDetailFragment on OrderPriceDetailRow{label value displayValue info{title message}rowInfo{...orderPriceDetailRowInfo}}fragment orderPriceDetailRowInfo on OrderPriceDetailRowInfo{title message{...textFragment}}fragment price on Price{displayValue value}fragment variants on MapEntry{name value}fragment OrderAddOn on OrderAddOn{lineId uniqueLineId productInfo{name usItemId offerId}quantityString quantityLabel type fulfillmentInstructions{...textFragment}actions{manageProtectionPlan{...orderActionFragment}cancel}priceInfo{linePrice{...price}}quantity isActive}fragment orderDonationDetails on OrderDonationDetails{message{...textFragment}emailReceipt emailReceiptToken status{...textFragment}errorStatus}fragment orderLineItem on OrderLineItem{id uniqueId actions{contactSeller cancel addToCart configureCake reviewItem resendEGiftCardToken protectionPlan{...orderActionFragment}manageProtectionPlan{...orderActionFragment}}isGift digitalDeliveryMessage quantity quantityString quantityLabel isSubstitutionSelected fulfilledItems{id quantityString priceInfo{itemPrice{value}}productInfo{usItemId name}}isReturnable returnEligibilityMessage productInfo{name usItemId imageInfo{thumbnailUrl}canonicalUrl offerId orderLimit orderMinLimit weightIncrement salesUnit salesUnitType isSubstitutionEligible isAlcohol}reshop{reshopMessage isShippingAvailable minPromiseDate maxPromiseDate}selectedVariants{...variants}variantAdditionalInfo{parts{text nativeAction}}priceInfo{priceDisplayCodes{showItemPrice priceDisplayCondition finalCostByWeight}itemPrice{...price}linePrice{...price}unitPrice{...price}preDiscountedLinePrice{...price}additionalLines{name value}}discounts{label labelText{...textFragment}}itemReviewed activationCodes{label code}protectionPlanMessage{...textFragment}showSeller isShippedByWalmart seller{id name isPro}digitalDeliveryPhoneNumber addOns{...OrderAddOn}multiboxBundleId}fragment DriverFragment on Driver{id firstName photoUrl}fragment OrderGroupFragment on OrderGroup{driver{...DriverFragment}deliveryDate fulfillmentType status{...OrderGroupStatusFragment}showSeller isShippedByWalmart seller{...SellerFragment}id itemCount items{...LiteLineItemFragment}pickupPerson{firstName lastName email}accessPointId shipment{...ShipmentFragment}returnEligibilityMessage actions{...OrderGroupActionsFragment}recipientEmailAddress digitalDelivery{...DigitalDeliveryFragment}tireInstallationReservation{status extraText reservationId}}fragment OrderGroupStatusFragment on OrderGroupStatus{statusType showStatusTracker statusTracker{status label isCurrent}message{...textFragment}subtext subMessage{...textFragment}notice helpCenterText{...textFragment}}fragment textFragment on Text{parts{bold url text nativeAction lineBreak}}fragment LiteLineItemFragment on OrderLineItem{id quantity productInfo{name usItemId imageInfo{thumbnailUrl}offerId isAlcohol}priceInfo{linePrice{...price}}}fragment SellerFragment on GroupSeller{id name isPro}fragment DigitalDeliveryFragment on DigitalDelivery{title name instructions{...textFragment}}fragment ShipmentFragment on Shipment{id trackingNumber isExternalTracking trackingUrl proofOfDelivery{...ProofOfDeliveryFragment}}fragment OrderGroupActionsFragment on OrderGroupActions{reorder edit track changeSlot checkin editDeliveryInstructions editPickupPerson editTip tip rateDriver cancel enableTip{...orderActionFragment}enableEdit{...orderActionFragment}rescheduleTireInstall{...orderActionFragment}cancelTireInstall{...orderActionFragment}help viewCancellationDetails{...cancellationDetailsActionFragment}}fragment cancellationDetailsActionFragment on CancellationDetailsAction{label heading text{...textFragment}}fragment ProofOfDeliveryFragment on ProofOfDelivery{photoUrl photoPreviewUrl showPreview}fragment DeliveryInstructionsFragment on DeliveryInstructions{text type typeText}fragment GiftDetailsFragment on GiftDetails{recipientAddress{fullName}recipientEmail senderName giftMessage}fragment SubstitutionAction on SubstitutionAction{message label type}fragment ODPGroupCategoryFragment on OrderCategory{type name subtext returnMessage substitutionsBanner{...textFragment}showExtendedSubstitutions actions{substitutions{...SubstitutionAction}nilPickReshop{message action{text url}}returnDetails viewCancellationDetails{...cancellationDetailsActionFragment}trackOnInHomeApp}banner{...textFragment}accordionState items{...orderLineItem}substitutions{...orderLineItem fulfilledItems{...orderLineItem}}returnInfo{...returnInfoFragment}}fragment ODPGroupFragment on OrderGroup{id fulfillmentType deliveryMessage deliveryAddress{fullName firstName lastName address{...addressFragment}}deliveryInstructions{...DeliveryInstructionsFragment}deliveryPreferences{text{...textFragment}cta{...orderActionFragment}}editSubstitutionsCutOff status{statusType showStatusTracker message{...textFragment}notice helpCenterText{...textFragment}}itemCount isCategorized categories{...ODPGroupCategoryFragment}seller{id name isPro}shipment{id trackingNumber}actions{reorder edit track changeSlot checkin editDeliveryInstructions editPickupPerson tip cancel help enableTip{...orderActionFragment}enableEdit{...orderActionFragment}viewCancellationDetails{...cancellationDetailsActionFragment}enableInHome{...orderActionFragment}createGiftReceipt}cutOffTimestamp isEditSubstitutionsEligible isInHome giftDetails{...GiftDetailsFragment}donationDetails{...orderDonationDetails}}fragment returnInfoFragment on ReturnInfo{returnOrderId type refundPriceDetails{__typename...refundPriceDetailsFragment}refundMessage tierRefundMessage paymentMethods{__typename description cardType paymentType displayValues message{...textFragment}}actions{__typename generate scheduleOrModifyPickup{text url}reschedulePickup editPickupContact}shippingLabelUrl qrCodeImageUrl carriers{__typename id name}pickupCarrier pickupContact{nameAndAddress{fullName firstName lastName address{addressString city state postalCode addressLineOne addressLineTwo country}}phone}pickupConfirmationNumber bannerMessage{...textFragment}}fragment refundPriceDetailsFragment on RefundPriceDetails{subTotal{__typename...orderPriceDetailRowFragment}fees{__typename...orderPriceDetailRowFragment}discounts{__typename...orderPriceDetailRowFragment}taxTotal{__typename...orderPriceDetailRowFragment}grandTotal{__typename...orderPriceDetailRowFragment}}fragment orderPriceDetailRowFragment on OrderPriceDetailRow{label displayValue value info{__typename title message}}fragment addressFragment on OrderAddress{addressString addressLineOne addressLineTwo state postalCode city}fragment ODPPickupInfo on OrderGroup{pickupInstructions pickupPerson{...person}alternatePickupPerson{...person}store{id name address{...addressFragment}}}fragment person on OrderPickupPerson{firstName lastName email}fragment ODPTippingInfo on OrderGroup{addTipMessage{...textFragment}driver{...DriverFragment}tipping{min{...price}max{...price}suggested{...price}preselected}subtotal{...price}}fragment orderActionFragment on Action{text url}fragment orderCustomer on OrderCustomer{id firstName lastName email isGuest isEmailRegistered}fragment OrderFieldsFragment on Order{__typename id version type customer{...orderCustomer}displayId idBarcodeImageUrl(barWidth:3 barHeight:100) isFuelPurchase title shortTitle timezone tippableGroup{...OrderGroupFragment}amendableGroup{id changeSlotIterationsLeft cutOffTimestamp fulfillmentType deliveryAddress{fullName firstName lastName address{addressString addressLineOne addressLineTwo state postalCode city country}}isAmendInProgress}substitutionsBanner{heading subheading longSubheading}groups_2101{__typename...OrderGroupFragment...ODPGroupFragment...ODPPickupInfo...ODPTippingInfo}multiboxBundles{...orderLineItem}itemCancelReasons{__typename...cancelReason}groupCancelReasons{__typename...cancelReason}priceDetails{__typename subTotal{__typename...priceDetailFragment}taxTotal{__typename...priceDetailFragment}grandTotal{__typename...priceDetailFragment}authorizationAmount{__typename...priceDetailFragment}fees{__typename...priceDetailFragment}discounts{__typename...priceDetailFragment}minimumThreshold{__typename...price}belowMinimumFee{__typename...priceDetailFragment}driverTip{__typename...priceDetailFragment}donations{__typename...priceDetailFragment}}paymentMethods{__typename description cardType paymentType displayValues message{...textFragment}actions{connectToCapitalOne{...orderActionFragment}visitAffirm{...orderActionFragment}}}actions{__typename return pendingReturn cancel startReturn{...orderActionFragment}reorder}banners{...textFragment}}","variables":{"orderId":"3952256119058","emailAddress":"beckyforschen@gmail.com"}}' \
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
    echo "'3952256119058" >> track-OrderID.txt
    echo "beckyforschen@gmail.com" >> track-email.txt
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
            if [[ `echo $curl16 | jq '.data.guestOrder.groups_2101['${i[@]}'].items['${j[@]}'].productInfo.usItemId'` == '"36611908"' ]]; then
                echo "'3952256119058" >> track-OrderID.txt
                echo beckyforschen@gmail.com >> track-email.txt
                echo $curl16 | jq '.data.guestOrder.groups_2101['${i[@]}'].items['${j[@]}'].productInfo.usItemId' >> track-usItemId.txt
                echo $curl16 | jq '.data.guestOrder.groups_2101['${i[@]}'].items['${j[@]}'].priceInfo.linePrice.value' >> track-priceValue.txt
                echo $curl16 | jq '.data.guestOrder.groups_2101['${i[@]}'].deliveryAddress.fullName' >> track-fullName.txt
                echo $curl16 | jq '.data.guestOrder.groups_2101['${i[@]}'].deliveryAddress.address.addressString' >> track-address.txt
                echo $curl16 | jq '.data.guestOrder.groups_2101['${i[@]}'].status.message.parts[].text' >> track-status.txt
                echo $curl16 | jq '.data.guestOrder.groups_2101['${i[@]}'].shipment.trackingNumber' | sed 's/null//g' >> track-number.txt
                echo $curl16 | jq '.data.guestOrder.groups_2101['${i[@]}'].shipment.trackingUrl' | sed 's/null//g' >> track-url.txt
                echo $curl16 | jq '.data.guestOrder.groups_2101['${i[@]}'].categories[].type' >> track-categoriesType.txt
                echo $curl16 | jq '.data.guestOrder.groups_2101['${i[@]}'].status.subtext' >> track-subtext.txt
                break
            fi
        done
    done
    if [[ $sum16 == `md5 track-OrderID.txt` ]]; then
        echo "16-Khác Item"
        echo "'3952256119058" >> track-OrderID.txt
        echo "beckyforschen@gmail.com" >> track-email.txt
        echo "Khác Item" >> track-usItemId.txt
        echo "Khác Item" >> track-priceValue.txt
        echo "Khác Item" >> track-fullName.txt
        echo "Khác Item" >> track-address.txt
        echo "Khác Item" >> track-status.txt
        echo "Khác Item" >> track-number.txt
        echo "Khác Item" >> track-url.txt
        echo "Khác Item" >> track-categoriesType.txt
        echo "Khác Item" >> track-subtext.txt
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
  -H 'user-agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.51 Safari/537.36 Edg/99.0.1150.39' \
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
  --data-raw $'{"query":"query getGuestOrder($orderId:ID\u0021 $emailAddress:String\u0021){guestOrder(input:{id:$orderId emailAddress:$emailAddress}){...OrderFieldsFragment}}fragment cancelReason on OrderCancelReason{__typename subReasonCode subDescription}fragment priceDetailFragment on OrderPriceDetailRow{label value displayValue info{title message}rowInfo{...orderPriceDetailRowInfo}}fragment orderPriceDetailRowInfo on OrderPriceDetailRowInfo{title message{...textFragment}}fragment price on Price{displayValue value}fragment variants on MapEntry{name value}fragment OrderAddOn on OrderAddOn{lineId uniqueLineId productInfo{name usItemId offerId}quantityString quantityLabel type fulfillmentInstructions{...textFragment}actions{manageProtectionPlan{...orderActionFragment}cancel}priceInfo{linePrice{...price}}quantity isActive}fragment orderDonationDetails on OrderDonationDetails{message{...textFragment}emailReceipt emailReceiptToken status{...textFragment}errorStatus}fragment orderLineItem on OrderLineItem{id uniqueId actions{contactSeller cancel addToCart configureCake reviewItem resendEGiftCardToken protectionPlan{...orderActionFragment}manageProtectionPlan{...orderActionFragment}}isGift digitalDeliveryMessage quantity quantityString quantityLabel isSubstitutionSelected fulfilledItems{id quantityString priceInfo{itemPrice{value}}productInfo{usItemId name}}isReturnable returnEligibilityMessage productInfo{name usItemId imageInfo{thumbnailUrl}canonicalUrl offerId orderLimit orderMinLimit weightIncrement salesUnit salesUnitType isSubstitutionEligible isAlcohol}reshop{reshopMessage isShippingAvailable minPromiseDate maxPromiseDate}selectedVariants{...variants}variantAdditionalInfo{parts{text nativeAction}}priceInfo{priceDisplayCodes{showItemPrice priceDisplayCondition finalCostByWeight}itemPrice{...price}linePrice{...price}unitPrice{...price}preDiscountedLinePrice{...price}additionalLines{name value}}discounts{label labelText{...textFragment}}itemReviewed activationCodes{label code}protectionPlanMessage{...textFragment}showSeller isShippedByWalmart seller{id name isPro}digitalDeliveryPhoneNumber addOns{...OrderAddOn}multiboxBundleId}fragment DriverFragment on Driver{id firstName photoUrl}fragment OrderGroupFragment on OrderGroup{driver{...DriverFragment}deliveryDate fulfillmentType status{...OrderGroupStatusFragment}showSeller isShippedByWalmart seller{...SellerFragment}id itemCount items{...LiteLineItemFragment}pickupPerson{firstName lastName email}accessPointId shipment{...ShipmentFragment}returnEligibilityMessage actions{...OrderGroupActionsFragment}recipientEmailAddress digitalDelivery{...DigitalDeliveryFragment}tireInstallationReservation{status extraText reservationId}}fragment OrderGroupStatusFragment on OrderGroupStatus{statusType showStatusTracker statusTracker{status label isCurrent}message{...textFragment}subtext subMessage{...textFragment}notice helpCenterText{...textFragment}}fragment textFragment on Text{parts{bold url text nativeAction lineBreak}}fragment LiteLineItemFragment on OrderLineItem{id quantity productInfo{name usItemId imageInfo{thumbnailUrl}offerId isAlcohol}priceInfo{linePrice{...price}}}fragment SellerFragment on GroupSeller{id name isPro}fragment DigitalDeliveryFragment on DigitalDelivery{title name instructions{...textFragment}}fragment ShipmentFragment on Shipment{id trackingNumber isExternalTracking trackingUrl proofOfDelivery{...ProofOfDeliveryFragment}}fragment OrderGroupActionsFragment on OrderGroupActions{reorder edit track changeSlot checkin editDeliveryInstructions editPickupPerson editTip tip rateDriver cancel enableTip{...orderActionFragment}enableEdit{...orderActionFragment}rescheduleTireInstall{...orderActionFragment}cancelTireInstall{...orderActionFragment}help viewCancellationDetails{...cancellationDetailsActionFragment}}fragment cancellationDetailsActionFragment on CancellationDetailsAction{label heading text{...textFragment}}fragment ProofOfDeliveryFragment on ProofOfDelivery{photoUrl photoPreviewUrl showPreview}fragment DeliveryInstructionsFragment on DeliveryInstructions{text type typeText}fragment GiftDetailsFragment on GiftDetails{recipientAddress{fullName}recipientEmail senderName giftMessage}fragment SubstitutionAction on SubstitutionAction{message label type}fragment ODPGroupCategoryFragment on OrderCategory{type name subtext returnMessage substitutionsBanner{...textFragment}showExtendedSubstitutions actions{substitutions{...SubstitutionAction}nilPickReshop{message action{text url}}returnDetails viewCancellationDetails{...cancellationDetailsActionFragment}trackOnInHomeApp}banner{...textFragment}accordionState items{...orderLineItem}substitutions{...orderLineItem fulfilledItems{...orderLineItem}}returnInfo{...returnInfoFragment}}fragment ODPGroupFragment on OrderGroup{id fulfillmentType deliveryMessage deliveryAddress{fullName firstName lastName address{...addressFragment}}deliveryInstructions{...DeliveryInstructionsFragment}deliveryPreferences{text{...textFragment}cta{...orderActionFragment}}editSubstitutionsCutOff status{statusType showStatusTracker message{...textFragment}notice helpCenterText{...textFragment}}itemCount isCategorized categories{...ODPGroupCategoryFragment}seller{id name isPro}shipment{id trackingNumber}actions{reorder edit track changeSlot checkin editDeliveryInstructions editPickupPerson tip cancel help enableTip{...orderActionFragment}enableEdit{...orderActionFragment}viewCancellationDetails{...cancellationDetailsActionFragment}enableInHome{...orderActionFragment}createGiftReceipt}cutOffTimestamp isEditSubstitutionsEligible isInHome giftDetails{...GiftDetailsFragment}donationDetails{...orderDonationDetails}}fragment returnInfoFragment on ReturnInfo{returnOrderId type refundPriceDetails{__typename...refundPriceDetailsFragment}refundMessage tierRefundMessage paymentMethods{__typename description cardType paymentType displayValues message{...textFragment}}actions{__typename generate scheduleOrModifyPickup{text url}reschedulePickup editPickupContact}shippingLabelUrl qrCodeImageUrl carriers{__typename id name}pickupCarrier pickupContact{nameAndAddress{fullName firstName lastName address{addressString city state postalCode addressLineOne addressLineTwo country}}phone}pickupConfirmationNumber bannerMessage{...textFragment}}fragment refundPriceDetailsFragment on RefundPriceDetails{subTotal{__typename...orderPriceDetailRowFragment}fees{__typename...orderPriceDetailRowFragment}discounts{__typename...orderPriceDetailRowFragment}taxTotal{__typename...orderPriceDetailRowFragment}grandTotal{__typename...orderPriceDetailRowFragment}}fragment orderPriceDetailRowFragment on OrderPriceDetailRow{label displayValue value info{__typename title message}}fragment addressFragment on OrderAddress{addressString addressLineOne addressLineTwo state postalCode city}fragment ODPPickupInfo on OrderGroup{pickupInstructions pickupPerson{...person}alternatePickupPerson{...person}store{id name address{...addressFragment}}}fragment person on OrderPickupPerson{firstName lastName email}fragment ODPTippingInfo on OrderGroup{addTipMessage{...textFragment}driver{...DriverFragment}tipping{min{...price}max{...price}suggested{...price}preselected}subtotal{...price}}fragment orderActionFragment on Action{text url}fragment orderCustomer on OrderCustomer{id firstName lastName email isGuest isEmailRegistered}fragment OrderFieldsFragment on Order{__typename id version type customer{...orderCustomer}displayId idBarcodeImageUrl(barWidth:3 barHeight:100) isFuelPurchase title shortTitle timezone tippableGroup{...OrderGroupFragment}amendableGroup{id changeSlotIterationsLeft cutOffTimestamp fulfillmentType deliveryAddress{fullName firstName lastName address{addressString addressLineOne addressLineTwo state postalCode city country}}isAmendInProgress}substitutionsBanner{heading subheading longSubheading}groups_2101{__typename...OrderGroupFragment...ODPGroupFragment...ODPPickupInfo...ODPTippingInfo}multiboxBundles{...orderLineItem}itemCancelReasons{__typename...cancelReason}groupCancelReasons{__typename...cancelReason}priceDetails{__typename subTotal{__typename...priceDetailFragment}taxTotal{__typename...priceDetailFragment}grandTotal{__typename...priceDetailFragment}authorizationAmount{__typename...priceDetailFragment}fees{__typename...priceDetailFragment}discounts{__typename...priceDetailFragment}minimumThreshold{__typename...price}belowMinimumFee{__typename...priceDetailFragment}driverTip{__typename...priceDetailFragment}donations{__typename...priceDetailFragment}}paymentMethods{__typename description cardType paymentType displayValues message{...textFragment}actions{connectToCapitalOne{...orderActionFragment}visitAffirm{...orderActionFragment}}}actions{__typename return pendingReturn cancel startReturn{...orderActionFragment}reorder}banners{...textFragment}}","variables":{"orderId":"3952256324328","emailAddress":"thafonzy@aol.com"}}' \
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
    echo "'3952256324328" >> track-OrderID.txt
    echo "thafonzy@aol.com" >> track-email.txt
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
            if [[ `echo $curl17 | jq '.data.guestOrder.groups_2101['${i[@]}'].items['${j[@]}'].productInfo.usItemId'` == '"964307248"' ]]; then
                echo "'3952256324328" >> track-OrderID.txt
                echo thafonzy@aol.com >> track-email.txt
                echo $curl17 | jq '.data.guestOrder.groups_2101['${i[@]}'].items['${j[@]}'].productInfo.usItemId' >> track-usItemId.txt
                echo $curl17 | jq '.data.guestOrder.groups_2101['${i[@]}'].items['${j[@]}'].priceInfo.linePrice.value' >> track-priceValue.txt
                echo $curl17 | jq '.data.guestOrder.groups_2101['${i[@]}'].deliveryAddress.fullName' >> track-fullName.txt
                echo $curl17 | jq '.data.guestOrder.groups_2101['${i[@]}'].deliveryAddress.address.addressString' >> track-address.txt
                echo $curl17 | jq '.data.guestOrder.groups_2101['${i[@]}'].status.message.parts[].text' >> track-status.txt
                echo $curl17 | jq '.data.guestOrder.groups_2101['${i[@]}'].shipment.trackingNumber' | sed 's/null//g' >> track-number.txt
                echo $curl17 | jq '.data.guestOrder.groups_2101['${i[@]}'].shipment.trackingUrl' | sed 's/null//g' >> track-url.txt
                echo $curl17 | jq '.data.guestOrder.groups_2101['${i[@]}'].categories[].type' >> track-categoriesType.txt
                echo $curl17 | jq '.data.guestOrder.groups_2101['${i[@]}'].status.subtext' >> track-subtext.txt
                break
            fi
        done
    done
    if [[ $sum17 == `md5 track-OrderID.txt` ]]; then
        echo "17-Khác Item"
        echo "'3952256324328" >> track-OrderID.txt
        echo "thafonzy@aol.com" >> track-email.txt
        echo "Khác Item" >> track-usItemId.txt
        echo "Khác Item" >> track-priceValue.txt
        echo "Khác Item" >> track-fullName.txt
        echo "Khác Item" >> track-address.txt
        echo "Khác Item" >> track-status.txt
        echo "Khác Item" >> track-number.txt
        echo "Khác Item" >> track-url.txt
        echo "Khác Item" >> track-categoriesType.txt
        echo "Khác Item" >> track-subtext.txt
    else
        echo "17"
    fi   
fi
git add -A .
git commit -m --allow-empty
git push
git push origin HEAD -f
gitCommit=`git rev-parse HEAD`
linkGit=`echo https://raw.githubusercontent.com/DungSherlock/eBay/`$gitCommit`echo /`
linkApi=`echo https://script.google.com/macros/s/AKfycbxvgB0cMGKRjx_sVCDTrrzTkT40YIeRPsBUp-1-e913NLyI8mUywjiaGDu9MDj9bChN/exec?`
linkPost=$linkApi`echo Item ID==IMPORTDATA\(\"`$linkGit`echo track-usItemId.txt\"\)\&Giá==IMPORTDATA\(\"`$linkGit`echo track-priceValue.txt\"\)\&Tên==IMPORTDATA\(\"`$linkGit`echo track-fullName.txt\"\)\&Địa chỉ==index\(IMPORTDATA\(\"`$linkGit`echo track-address.txt\"\),,1\)\&Status==IMPORTDATA\(\"`$linkGit`echo track-status.txt\"\)\&Tracking Number==IMPORTDATA\(\"`$linkGit`echo track-number.txt\"\)\&Tracking URL==IMPORTDATA\(\"`$linkGit`echo track-url.txt\"\)\&Email==IMPORTDATA\(\"`$linkGit`echo track-email.txt\"\)\&Order==IMPORTDATA\(\"`$linkGit`echo track-OrderID.txt\"\)\&categoriesType==IMPORTDATA\(\"`$linkGit`echo track-categoriesType.txt\"\)`
echo $linkPost
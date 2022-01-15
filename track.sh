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

curl1=`curl 'https://www.walmart.com/orchestra/home/graphql' \
  -H 'authority: www.walmart.com' \
  -H 'sec-ch-ua: " Not A;Brand";v="99", "Chromium";v="96", "Microsoft Edge";v="96"' \
  -H 'x-o-platform: rweb' \
  -H 'dnt: 1' \
  -H 'x-o-correlation-id: wrvYiSFTlAmd8j7a8DDmpuyOpCN_heAnwM3v' \
  -H 'device_profile_ref_id: _s1F3NO8Y2JjaBUKPDcY4iFDWiIl9CyqiJjf' \
  -H 'x-latency-trace: 1' \
  -H 'wm_mp: true' \
  -H 'x-o-market: us' \
  -H 'x-o-platform-version: main-253-ebbb47' \
  -H 'x-o-gql-query: query getGuestOrder' \
  -H 'wm_page_url: https://www.walmart.com/orders' \
  -H 'x-apollo-operation-name: getGuestOrder' \
  -H 'sec-ch-ua-platform: "macOS"' \
  -H 'sec-ch-ua-mobile: ?0' \
  -H 'user-agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/96.0.4664.110 Safari/537.36 Edg/96.0.1054.62' \
  -H 'x-o-segment: oaoh' \
  -H 'content-type: application/json' \
  -H 'accept: application/json' \
  -H 'x-enable-server-timing: 1' \
  -H 'x-o-ccm: server' \
  -H 'wm_qos.correlation_id: wrvYiSFTlAmd8j7a8DDmpuyOpCN_heAnwM3v' \
  -H 'origin: https://www.walmart.com' \
  -H 'sec-fetch-site: same-origin' \
  -H 'sec-fetch-mode: cors' \
  -H 'sec-fetch-dest: empty' \
  -H 'referer: https://www.walmart.com/orders' \
  -H 'accept-language: vi' \
  --data-raw $'{"query":"query getGuestOrder($orderId:ID\u0021 $emailAddress:String\u0021){guestOrder(input:{id:$orderId emailAddress:$emailAddress}){...OrderFieldsFragment}}fragment cancelReason on OrderCancelReason{__typename subReasonCode subDescription}fragment priceDetailFragment on OrderPriceDetailRow{label value displayValue info{title message}rowInfo{...orderPriceDetailRowInfo}}fragment orderPriceDetailRowInfo on OrderPriceDetailRowInfo{title message{...textFragment}}fragment price on Price{displayValue value}fragment variants on MapEntry{name value}fragment OrderAddOn on OrderAddOn{lineId uniqueLineId productInfo{name usItemId offerId}quantityString quantityLabel type fulfillmentInstructions{...textFragment}actions{manageProtectionPlan{...orderActionFragment}cancel}priceInfo{linePrice{...price}}quantity isActive}fragment orderDonationDetails on OrderDonationDetails{message{...textFragment}emailReceipt emailReceiptToken status{...textFragment}errorStatus}fragment orderLineItem on OrderLineItem{id uniqueId actions{contactSeller cancel addToCart configureCake reviewItem resendEGiftCardToken protectionPlan{...orderActionFragment}manageProtectionPlan{...orderActionFragment}}isGift digitalDeliveryMessage quantity quantityString quantityLabel isSubstitutionSelected fulfilledItems{id quantityString priceInfo{itemPrice{value}}product{usItemId name}}isReturnable returnEligibilityMessage product{name usItemId imageInfo{thumbnailUrl}canonicalUrl offerId sellerId sellerName hasSellerBadge seller{sellerId name}orderLimit orderMinLimit weightIncrement salesUnit salesUnitType isSubstitutionEligible isAlcohol}reshop{reshopMessage isShippingAvailable minPromiseDate maxPromiseDate}selectedVariants{...variants}variantAdditionalInfo{parts{text nativeAction}}priceInfo{priceDisplayCodes{showItemPrice priceDisplayCondition finalCostByWeight}itemPrice{...price}linePrice{...price}unitPrice{...price}preDiscountedLinePrice{...price}additionalLines{name value}}discounts{label labelText{...textFragment}}itemReviewed activationCodes{label code}protectionPlanMessage{...textFragment}showSeller isShippedByWalmart seller{id name isPro}digitalDeliveryPhoneNumber addOns{...OrderAddOn}multiboxBundleId}fragment DriverFragment on Driver{id firstName photoUrl}fragment OrderGroupFragment on OrderGroup{driver{...DriverFragment}deliveryDate fulfillmentType status{...OrderGroupStatusFragment}showSeller isShippedByWalmart seller{...SellerFragment}id itemCount items{...LiteLineItemFragment}pickupPerson{firstName lastName email}accessPointId shipment{...ShipmentFragment}returnEligibilityMessage actions{...OrderGroupActionsFragment}recipientEmailAddress digitalDelivery{...DigitalDeliveryFragment}tireInstallationReservation{status extraText}}fragment OrderGroupStatusFragment on OrderGroupStatus{statusType showStatusTracker statusTracker{status label isCurrent}message{...textFragment}subtext subMessage{...textFragment}notice helpCenterText{...textFragment}}fragment textFragment on Text{parts{bold url text nativeAction lineBreak}}fragment LiteLineItemFragment on OrderLineItem{id quantity product{name usItemId imageInfo{thumbnailUrl}offerId isAlcohol}priceInfo{linePrice{...price}}}fragment SellerFragment on GroupSeller{id name isPro}fragment DigitalDeliveryFragment on DigitalDelivery{title name instructions{...textFragment}}fragment ShipmentFragment on Shipment{id trackingNumber isExternalTracking trackingUrl proofOfDelivery{photoUrl photoPreviewUrl showPreview}}fragment OrderGroupActionsFragment on OrderGroupActions{reorder edit track changeSlot checkin editDeliveryInstructions editPickupPerson editTip tip cancel enableTip{...orderActionFragment}enableEdit{...orderActionFragment}rescheduleTireInstall{...orderActionFragment}cancelTireInstall{...orderActionFragment}help viewCancellationDetails{...cancellationDetailsActionFragment}}fragment cancellationDetailsActionFragment on CancellationDetailsAction{label heading text{...textFragment}}fragment ODPGroupCategoryFragment on OrderCategory{type name subtext returnMessage substitutionsBanner{...textFragment}showExtendedSubstitutions actions{substitutions{message label type}nilPickReshop{message action{text url}}returnDetails viewCancellationDetails{...cancellationDetailsActionFragment}trackOnInHomeApp}banner{...textFragment}accordionState items{...orderLineItem}substitutions{...orderLineItem fulfilledItems{...orderLineItem}}returnInfo{...returnInfoFragment}}fragment ODPGroupFragment on OrderGroup{id fulfillmentType deliveryMessage deliveryAddress{fullName firstName lastName address{...addressFragment}}deliveryInstructions{text type typeText}deliveryPreferences{text{...textFragment}cta{...orderActionFragment}}editSubstitutionsCutOff status{statusType showStatusTracker message{...textFragment}notice helpCenterText{...textFragment}}itemCount isCategorized categories{...ODPGroupCategoryFragment}seller{id name isPro}shipment{id trackingNumber}actions{reorder edit track changeSlot checkin editDeliveryInstructions editPickupPerson tip cancel help enableTip{...orderActionFragment}enableEdit{...orderActionFragment}viewCancellationDetails{...cancellationDetailsActionFragment}enableInHome{...orderActionFragment}createGiftReceipt}cutOffTimestamp isEditSubstitutionsEligible isInHome giftDetails{recipientAddress{fullName}recipientEmail senderName giftMessage}donationDetails{...orderDonationDetails}}fragment returnInfoFragment on ReturnInfo{returnOrderId type refundPriceDetails{__typename...refundPriceDetailsFragment}refundMessage tierRefundMessage paymentMethods{__typename description cardType paymentType displayValues message{...textFragment}}actions{__typename generate scheduleOrModifyPickup{text url}reschedulePickup editPickupContact}shippingLabelUrl qrCodeImageUrl carriers{__typename id name}pickupCarrier pickupContact{nameAndAddress{fullName firstName lastName address{addressString city state postalCode addressLineOne addressLineTwo country}}phone}pickupConfirmationNumber bannerMessage{...textFragment}}fragment refundPriceDetailsFragment on RefundPriceDetails{subTotal{__typename...orderPriceDetailRowFragment}fees{__typename...orderPriceDetailRowFragment}discounts{__typename...orderPriceDetailRowFragment}taxTotal{__typename...orderPriceDetailRowFragment}grandTotal{__typename...orderPriceDetailRowFragment}}fragment orderPriceDetailRowFragment on OrderPriceDetailRow{label displayValue value info{__typename title message}}fragment addressFragment on OrderAddress{addressString addressLineOne addressLineTwo state postalCode city}fragment ODPPickupInfo on OrderGroup{pickupInstructions pickupPerson{...person}alternatePickupPerson{...person}store{id name address{...addressFragment}}}fragment person on OrderPickupPerson{firstName lastName email}fragment ODPTippingInfo on OrderGroup{addTipMessage{...textFragment}driver{...DriverFragment}tipping{min{...price}max{...price}suggested{...price}preselected}subtotal{...price}}fragment orderActionFragment on Action{text url}fragment orderCustomer on OrderCustomer{id firstName lastName email isGuest isEmailRegistered}fragment OrderFieldsFragment on Order{__typename id version type customer{...orderCustomer}displayId idBarcodeImageUrl(barWidth:3 barHeight:100) isFuelPurchase title shortTitle timezone tippableGroup{...OrderGroupFragment}amendableGroup{id changeSlotIterationsLeft cutOffTimestamp fulfillmentType deliveryAddress{fullName firstName lastName address{addressString addressLineOne addressLineTwo state postalCode city country}}isAmendInProgress}substitutionsBanner{heading subheading longSubheading}groups_2101{__typename...OrderGroupFragment...ODPGroupFragment...ODPPickupInfo...ODPTippingInfo}multiboxBundles{...orderLineItem}itemCancelReasons{__typename...cancelReason}groupCancelReasons{__typename...cancelReason}priceDetails{__typename subTotal{__typename...priceDetailFragment}taxTotal{__typename...priceDetailFragment}grandTotal{__typename...priceDetailFragment}authorizationAmount{__typename...priceDetailFragment}fees{__typename...priceDetailFragment}discounts{__typename...priceDetailFragment}minimumThreshold{__typename...price}belowMinimumFee{__typename...priceDetailFragment}driverTip{__typename...priceDetailFragment}donations{__typename...priceDetailFragment}}paymentMethods{__typename description cardType paymentType displayValues message{...textFragment}actions{connectToCapitalOne{...orderActionFragment}visitAffirm{...orderActionFragment}}}actions{__typename return pendingReturn cancel startReturn{...orderActionFragment}reorder}banners{...textFragment}}","variables":{"orderId":"2812227390729","emailAddress":"irfanrashid9887@msgsafe.io"}}' \
  --compressed`
 
for (( i=0; i<=4; i++ ))
do
  if [[ $curl1 =~ "error"  || $curl1 =~ "blocked" ]]; then
    echo "Lỗi email số 1"
    indexOrder1=`echo error`
    break
  elif [[ `echo $curl1 | jq '.data.guestOrder.groups_2101['${i[@]}'].items[0].product.usItemId'` == '"129706644"' ]]; then
    indexOrder1=`echo $i`
    indexItem1=`echo 0`
  elif [[ `echo $curl1 | jq '.data.guestOrder.groups_2101['${i[@]}'].items[1].product.usItemId'` == '"129706644"' ]]; then
    indexOrder1=`echo $i`
    indexItem1=`echo 1`
  elif [[ `echo $curl1 | jq '.data.guestOrder.groups_2101['${i[@]}'].items[2].product.usItemId'` == '"129706644"' ]]; then
    indexOrder1=`echo $i`
    indexItem1=`echo 2`
  elif [[ `echo $curl1 | jq '.data.guestOrder.groups_2101['${i[@]}'].items[3].product.usItemId'` == '"129706644"' ]]; then
    indexOrder1=`echo $i`
    indexItem1=`echo 3`
  fi
done

if [[ $indexOrder1 != "error" ]]; then
echo $curl1 | jq '.data.guestOrder.id' >> track-OrderID.txt
echo $curl1 | jq '.data.guestOrder.customer.email' >> track-email.txt
echo $curl1 | jq '.data.guestOrder.groups_2101['$indexOrder1'].items['$indexItem1'].product.usItemId' >> track-usItemId.txt
echo $curl1 | jq '.data.guestOrder.groups_2101['$indexOrder1'].items['$indexItem1'].priceInfo.linePrice.value' >> track-priceValue.txt
echo $curl1 | jq '.data.guestOrder.groups_2101['$indexOrder1'].deliveryAddress.fullName' >> track-fullName.txt
echo $curl1 | jq '.data.guestOrder.groups_2101['$indexOrder1'].deliveryAddress.address.addressString' >> track-address.txt
echo $curl1 | jq '.data.guestOrder.groups_2101['$indexOrder1'].status.message.parts[].text' >> track-status.txt
echo $curl1 | jq '.data.guestOrder.groups_2101['$indexOrder1'].shipment.trackingNumber' >> track-number.txt
echo $curl1 | jq '.data.guestOrder.groups_2101['$indexOrder1'].shipment.trackingUrl' >> track-url.txt
fi

curl2=`curl 'https://www.walmart.com/orchestra/home/graphql' \
  -H 'authority: www.walmart.com' \
  -H 'sec-ch-ua: " Not A;Brand";v="99", "Chromium";v="96", "Microsoft Edge";v="96"' \
  -H 'x-o-platform: rweb' \
  -H 'dnt: 1' \
  -H 'x-o-correlation-id: wrvYiSFTlAmd8j7a8DDmpuyOpCN_heAnwM3v' \
  -H 'device_profile_ref_id: _s1F3NO8Y2JjaBUKPDcY4iFDWiIl9CyqiJjf' \
  -H 'x-latency-trace: 1' \
  -H 'wm_mp: true' \
  -H 'x-o-market: us' \
  -H 'x-o-platform-version: main-253-ebbb47' \
  -H 'x-o-gql-query: query getGuestOrder' \
  -H 'wm_page_url: https://www.walmart.com/orders' \
  -H 'x-apollo-operation-name: getGuestOrder' \
  -H 'sec-ch-ua-platform: "macOS"' \
  -H 'sec-ch-ua-mobile: ?0' \
  -H 'user-agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/96.0.4664.110 Safari/537.36 Edg/96.0.1054.62' \
  -H 'x-o-segment: oaoh' \
  -H 'content-type: application/json' \
  -H 'accept: application/json' \
  -H 'x-enable-server-timing: 1' \
  -H 'x-o-ccm: server' \
  -H 'wm_qos.correlation_id: wrvYiSFTlAmd8j7a8DDmpuyOpCN_heAnwM3v' \
  -H 'origin: https://www.walmart.com' \
  -H 'sec-fetch-site: same-origin' \
  -H 'sec-fetch-mode: cors' \
  -H 'sec-fetch-dest: empty' \
  -H 'referer: https://www.walmart.com/orders' \
  -H 'accept-language: vi' \
  --data-raw $'{"query":"query getGuestOrder($orderId:ID\u0021 $emailAddress:String\u0021){guestOrder(input:{id:$orderId emailAddress:$emailAddress}){...OrderFieldsFragment}}fragment cancelReason on OrderCancelReason{__typename subReasonCode subDescription}fragment priceDetailFragment on OrderPriceDetailRow{label value displayValue info{title message}rowInfo{...orderPriceDetailRowInfo}}fragment orderPriceDetailRowInfo on OrderPriceDetailRowInfo{title message{...textFragment}}fragment price on Price{displayValue value}fragment variants on MapEntry{name value}fragment OrderAddOn on OrderAddOn{lineId uniqueLineId productInfo{name usItemId offerId}quantityString quantityLabel type fulfillmentInstructions{...textFragment}actions{manageProtectionPlan{...orderActionFragment}cancel}priceInfo{linePrice{...price}}quantity isActive}fragment orderDonationDetails on OrderDonationDetails{message{...textFragment}emailReceipt emailReceiptToken status{...textFragment}errorStatus}fragment orderLineItem on OrderLineItem{id uniqueId actions{contactSeller cancel addToCart configureCake reviewItem resendEGiftCardToken protectionPlan{...orderActionFragment}manageProtectionPlan{...orderActionFragment}}isGift digitalDeliveryMessage quantity quantityString quantityLabel isSubstitutionSelected fulfilledItems{id quantityString priceInfo{itemPrice{value}}product{usItemId name}}isReturnable returnEligibilityMessage product{name usItemId imageInfo{thumbnailUrl}canonicalUrl offerId sellerId sellerName hasSellerBadge seller{sellerId name}orderLimit orderMinLimit weightIncrement salesUnit salesUnitType isSubstitutionEligible isAlcohol}reshop{reshopMessage isShippingAvailable minPromiseDate maxPromiseDate}selectedVariants{...variants}variantAdditionalInfo{parts{text nativeAction}}priceInfo{priceDisplayCodes{showItemPrice priceDisplayCondition finalCostByWeight}itemPrice{...price}linePrice{...price}unitPrice{...price}preDiscountedLinePrice{...price}additionalLines{name value}}discounts{label labelText{...textFragment}}itemReviewed activationCodes{label code}protectionPlanMessage{...textFragment}showSeller isShippedByWalmart seller{id name isPro}digitalDeliveryPhoneNumber addOns{...OrderAddOn}multiboxBundleId}fragment DriverFragment on Driver{id firstName photoUrl}fragment OrderGroupFragment on OrderGroup{driver{...DriverFragment}deliveryDate fulfillmentType status{...OrderGroupStatusFragment}showSeller isShippedByWalmart seller{...SellerFragment}id itemCount items{...LiteLineItemFragment}pickupPerson{firstName lastName email}accessPointId shipment{...ShipmentFragment}returnEligibilityMessage actions{...OrderGroupActionsFragment}recipientEmailAddress digitalDelivery{...DigitalDeliveryFragment}tireInstallationReservation{status extraText}}fragment OrderGroupStatusFragment on OrderGroupStatus{statusType showStatusTracker statusTracker{status label isCurrent}message{...textFragment}subtext subMessage{...textFragment}notice helpCenterText{...textFragment}}fragment textFragment on Text{parts{bold url text nativeAction lineBreak}}fragment LiteLineItemFragment on OrderLineItem{id quantity product{name usItemId imageInfo{thumbnailUrl}offerId isAlcohol}priceInfo{linePrice{...price}}}fragment SellerFragment on GroupSeller{id name isPro}fragment DigitalDeliveryFragment on DigitalDelivery{title name instructions{...textFragment}}fragment ShipmentFragment on Shipment{id trackingNumber isExternalTracking trackingUrl proofOfDelivery{photoUrl photoPreviewUrl showPreview}}fragment OrderGroupActionsFragment on OrderGroupActions{reorder edit track changeSlot checkin editDeliveryInstructions editPickupPerson editTip tip cancel enableTip{...orderActionFragment}enableEdit{...orderActionFragment}rescheduleTireInstall{...orderActionFragment}cancelTireInstall{...orderActionFragment}help viewCancellationDetails{...cancellationDetailsActionFragment}}fragment cancellationDetailsActionFragment on CancellationDetailsAction{label heading text{...textFragment}}fragment ODPGroupCategoryFragment on OrderCategory{type name subtext returnMessage substitutionsBanner{...textFragment}showExtendedSubstitutions actions{substitutions{message label type}nilPickReshop{message action{text url}}returnDetails viewCancellationDetails{...cancellationDetailsActionFragment}trackOnInHomeApp}banner{...textFragment}accordionState items{...orderLineItem}substitutions{...orderLineItem fulfilledItems{...orderLineItem}}returnInfo{...returnInfoFragment}}fragment ODPGroupFragment on OrderGroup{id fulfillmentType deliveryMessage deliveryAddress{fullName firstName lastName address{...addressFragment}}deliveryInstructions{text type typeText}deliveryPreferences{text{...textFragment}cta{...orderActionFragment}}editSubstitutionsCutOff status{statusType showStatusTracker message{...textFragment}notice helpCenterText{...textFragment}}itemCount isCategorized categories{...ODPGroupCategoryFragment}seller{id name isPro}shipment{id trackingNumber}actions{reorder edit track changeSlot checkin editDeliveryInstructions editPickupPerson tip cancel help enableTip{...orderActionFragment}enableEdit{...orderActionFragment}viewCancellationDetails{...cancellationDetailsActionFragment}enableInHome{...orderActionFragment}createGiftReceipt}cutOffTimestamp isEditSubstitutionsEligible isInHome giftDetails{recipientAddress{fullName}recipientEmail senderName giftMessage}donationDetails{...orderDonationDetails}}fragment returnInfoFragment on ReturnInfo{returnOrderId type refundPriceDetails{__typename...refundPriceDetailsFragment}refundMessage tierRefundMessage paymentMethods{__typename description cardType paymentType displayValues message{...textFragment}}actions{__typename generate scheduleOrModifyPickup{text url}reschedulePickup editPickupContact}shippingLabelUrl qrCodeImageUrl carriers{__typename id name}pickupCarrier pickupContact{nameAndAddress{fullName firstName lastName address{addressString city state postalCode addressLineOne addressLineTwo country}}phone}pickupConfirmationNumber bannerMessage{...textFragment}}fragment refundPriceDetailsFragment on RefundPriceDetails{subTotal{__typename...orderPriceDetailRowFragment}fees{__typename...orderPriceDetailRowFragment}discounts{__typename...orderPriceDetailRowFragment}taxTotal{__typename...orderPriceDetailRowFragment}grandTotal{__typename...orderPriceDetailRowFragment}}fragment orderPriceDetailRowFragment on OrderPriceDetailRow{label displayValue value info{__typename title message}}fragment addressFragment on OrderAddress{addressString addressLineOne addressLineTwo state postalCode city}fragment ODPPickupInfo on OrderGroup{pickupInstructions pickupPerson{...person}alternatePickupPerson{...person}store{id name address{...addressFragment}}}fragment person on OrderPickupPerson{firstName lastName email}fragment ODPTippingInfo on OrderGroup{addTipMessage{...textFragment}driver{...DriverFragment}tipping{min{...price}max{...price}suggested{...price}preselected}subtotal{...price}}fragment orderActionFragment on Action{text url}fragment orderCustomer on OrderCustomer{id firstName lastName email isGuest isEmailRegistered}fragment OrderFieldsFragment on Order{__typename id version type customer{...orderCustomer}displayId idBarcodeImageUrl(barWidth:3 barHeight:100) isFuelPurchase title shortTitle timezone tippableGroup{...OrderGroupFragment}amendableGroup{id changeSlotIterationsLeft cutOffTimestamp fulfillmentType deliveryAddress{fullName firstName lastName address{addressString addressLineOne addressLineTwo state postalCode city country}}isAmendInProgress}substitutionsBanner{heading subheading longSubheading}groups_2101{__typename...OrderGroupFragment...ODPGroupFragment...ODPPickupInfo...ODPTippingInfo}multiboxBundles{...orderLineItem}itemCancelReasons{__typename...cancelReason}groupCancelReasons{__typename...cancelReason}priceDetails{__typename subTotal{__typename...priceDetailFragment}taxTotal{__typename...priceDetailFragment}grandTotal{__typename...priceDetailFragment}authorizationAmount{__typename...priceDetailFragment}fees{__typename...priceDetailFragment}discounts{__typename...priceDetailFragment}minimumThreshold{__typename...price}belowMinimumFee{__typename...priceDetailFragment}driverTip{__typename...priceDetailFragment}donations{__typename...priceDetailFragment}}paymentMethods{__typename description cardType paymentType displayValues message{...textFragment}actions{connectToCapitalOne{...orderActionFragment}visitAffirm{...orderActionFragment}}}actions{__typename return pendingReturn cancel startReturn{...orderActionFragment}reorder}banners{...textFragment}}","variables":{"orderId":"2842234253775","emailAddress":"timothyjonmcmillan15@hotmail.com"}}' \
  --compressed`
 
for (( i=0; i<=4; i++ ))
do
  if [[ $curl2 =~ "error"  || $curl2 =~ "blocked" ]]; then
    echo "Lỗi email số 2"
    indexOrder2=`echo error`
    break
  elif [[ `echo $curl2 | jq '.data.guestOrder.groups_2101['${i[@]}'].items[0].product.usItemId'` == '"226026281"' ]]; then
    indexOrder2=`echo $i`
    indexItem2=`echo 0`
  elif [[ `echo $curl2 | jq '.data.guestOrder.groups_2101['${i[@]}'].items[1].product.usItemId'` == '"226026281"' ]]; then
    indexOrder2=`echo $i`
    indexItem2=`echo 1`
  elif [[ `echo $curl2 | jq '.data.guestOrder.groups_2101['${i[@]}'].items[2].product.usItemId'` == '"226026281"' ]]; then
    indexOrder2=`echo $i`
    indexItem2=`echo 2`
  elif [[ `echo $curl2 | jq '.data.guestOrder.groups_2101['${i[@]}'].items[3].product.usItemId'` == '"226026281"' ]]; then
    indexOrder2=`echo $i`
    indexItem2=`echo 3`
  fi
done

if [[ $indexOrder2 != "error" ]]; then
echo $curl2 | jq '.data.guestOrder.id' >> track-OrderID.txt
echo $curl2 | jq '.data.guestOrder.customer.email' >> track-email.txt
echo $curl2 | jq '.data.guestOrder.groups_2101['$indexOrder2'].items['$indexItem2'].product.usItemId' >> track-usItemId.txt
echo $curl2 | jq '.data.guestOrder.groups_2101['$indexOrder2'].items['$indexItem2'].priceInfo.linePrice.value' >> track-priceValue.txt
echo $curl2 | jq '.data.guestOrder.groups_2101['$indexOrder2'].deliveryAddress.fullName' >> track-fullName.txt
echo $curl2 | jq '.data.guestOrder.groups_2101['$indexOrder2'].deliveryAddress.address.addressString' >> track-address.txt
echo $curl2 | jq '.data.guestOrder.groups_2101['$indexOrder2'].status.message.parts[].text' >> track-status.txt
echo $curl2 | jq '.data.guestOrder.groups_2101['$indexOrder2'].shipment.trackingNumber' >> track-number.txt
echo $curl2 | jq '.data.guestOrder.groups_2101['$indexOrder2'].shipment.trackingUrl' >> track-url.txt
fi

curl3=`curl 'https://www.walmart.com/orchestra/home/graphql' \
  -H 'authority: www.walmart.com' \
  -H 'sec-ch-ua: " Not A;Brand";v="99", "Chromium";v="96", "Microsoft Edge";v="96"' \
  -H 'x-o-platform: rweb' \
  -H 'dnt: 1' \
  -H 'x-o-correlation-id: wrvYiSFTlAmd8j7a8DDmpuyOpCN_heAnwM3v' \
  -H 'device_profile_ref_id: _s1F3NO8Y2JjaBUKPDcY4iFDWiIl9CyqiJjf' \
  -H 'x-latency-trace: 1' \
  -H 'wm_mp: true' \
  -H 'x-o-market: us' \
  -H 'x-o-platform-version: main-253-ebbb47' \
  -H 'x-o-gql-query: query getGuestOrder' \
  -H 'wm_page_url: https://www.walmart.com/orders' \
  -H 'x-apollo-operation-name: getGuestOrder' \
  -H 'sec-ch-ua-platform: "macOS"' \
  -H 'sec-ch-ua-mobile: ?0' \
  -H 'user-agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/96.0.4664.110 Safari/537.36 Edg/96.0.1054.62' \
  -H 'x-o-segment: oaoh' \
  -H 'content-type: application/json' \
  -H 'accept: application/json' \
  -H 'x-enable-server-timing: 1' \
  -H 'x-o-ccm: server' \
  -H 'wm_qos.correlation_id: wrvYiSFTlAmd8j7a8DDmpuyOpCN_heAnwM3v' \
  -H 'origin: https://www.walmart.com' \
  -H 'sec-fetch-site: same-origin' \
  -H 'sec-fetch-mode: cors' \
  -H 'sec-fetch-dest: empty' \
  -H 'referer: https://www.walmart.com/orders' \
  -H 'accept-language: vi' \
  --data-raw $'{"query":"query getGuestOrder($orderId:ID\u0021 $emailAddress:String\u0021){guestOrder(input:{id:$orderId emailAddress:$emailAddress}){...OrderFieldsFragment}}fragment cancelReason on OrderCancelReason{__typename subReasonCode subDescription}fragment priceDetailFragment on OrderPriceDetailRow{label value displayValue info{title message}rowInfo{...orderPriceDetailRowInfo}}fragment orderPriceDetailRowInfo on OrderPriceDetailRowInfo{title message{...textFragment}}fragment price on Price{displayValue value}fragment variants on MapEntry{name value}fragment OrderAddOn on OrderAddOn{lineId uniqueLineId productInfo{name usItemId offerId}quantityString quantityLabel type fulfillmentInstructions{...textFragment}actions{manageProtectionPlan{...orderActionFragment}cancel}priceInfo{linePrice{...price}}quantity isActive}fragment orderDonationDetails on OrderDonationDetails{message{...textFragment}emailReceipt emailReceiptToken status{...textFragment}errorStatus}fragment orderLineItem on OrderLineItem{id uniqueId actions{contactSeller cancel addToCart configureCake reviewItem resendEGiftCardToken protectionPlan{...orderActionFragment}manageProtectionPlan{...orderActionFragment}}isGift digitalDeliveryMessage quantity quantityString quantityLabel isSubstitutionSelected fulfilledItems{id quantityString priceInfo{itemPrice{value}}product{usItemId name}}isReturnable returnEligibilityMessage product{name usItemId imageInfo{thumbnailUrl}canonicalUrl offerId sellerId sellerName hasSellerBadge seller{sellerId name}orderLimit orderMinLimit weightIncrement salesUnit salesUnitType isSubstitutionEligible isAlcohol}reshop{reshopMessage isShippingAvailable minPromiseDate maxPromiseDate}selectedVariants{...variants}variantAdditionalInfo{parts{text nativeAction}}priceInfo{priceDisplayCodes{showItemPrice priceDisplayCondition finalCostByWeight}itemPrice{...price}linePrice{...price}unitPrice{...price}preDiscountedLinePrice{...price}additionalLines{name value}}discounts{label labelText{...textFragment}}itemReviewed activationCodes{label code}protectionPlanMessage{...textFragment}showSeller isShippedByWalmart seller{id name isPro}digitalDeliveryPhoneNumber addOns{...OrderAddOn}multiboxBundleId}fragment DriverFragment on Driver{id firstName photoUrl}fragment OrderGroupFragment on OrderGroup{driver{...DriverFragment}deliveryDate fulfillmentType status{...OrderGroupStatusFragment}showSeller isShippedByWalmart seller{...SellerFragment}id itemCount items{...LiteLineItemFragment}pickupPerson{firstName lastName email}accessPointId shipment{...ShipmentFragment}returnEligibilityMessage actions{...OrderGroupActionsFragment}recipientEmailAddress digitalDelivery{...DigitalDeliveryFragment}tireInstallationReservation{status extraText}}fragment OrderGroupStatusFragment on OrderGroupStatus{statusType showStatusTracker statusTracker{status label isCurrent}message{...textFragment}subtext subMessage{...textFragment}notice helpCenterText{...textFragment}}fragment textFragment on Text{parts{bold url text nativeAction lineBreak}}fragment LiteLineItemFragment on OrderLineItem{id quantity product{name usItemId imageInfo{thumbnailUrl}offerId isAlcohol}priceInfo{linePrice{...price}}}fragment SellerFragment on GroupSeller{id name isPro}fragment DigitalDeliveryFragment on DigitalDelivery{title name instructions{...textFragment}}fragment ShipmentFragment on Shipment{id trackingNumber isExternalTracking trackingUrl proofOfDelivery{photoUrl photoPreviewUrl showPreview}}fragment OrderGroupActionsFragment on OrderGroupActions{reorder edit track changeSlot checkin editDeliveryInstructions editPickupPerson editTip tip cancel enableTip{...orderActionFragment}enableEdit{...orderActionFragment}rescheduleTireInstall{...orderActionFragment}cancelTireInstall{...orderActionFragment}help viewCancellationDetails{...cancellationDetailsActionFragment}}fragment cancellationDetailsActionFragment on CancellationDetailsAction{label heading text{...textFragment}}fragment ODPGroupCategoryFragment on OrderCategory{type name subtext returnMessage substitutionsBanner{...textFragment}showExtendedSubstitutions actions{substitutions{message label type}nilPickReshop{message action{text url}}returnDetails viewCancellationDetails{...cancellationDetailsActionFragment}trackOnInHomeApp}banner{...textFragment}accordionState items{...orderLineItem}substitutions{...orderLineItem fulfilledItems{...orderLineItem}}returnInfo{...returnInfoFragment}}fragment ODPGroupFragment on OrderGroup{id fulfillmentType deliveryMessage deliveryAddress{fullName firstName lastName address{...addressFragment}}deliveryInstructions{text type typeText}deliveryPreferences{text{...textFragment}cta{...orderActionFragment}}editSubstitutionsCutOff status{statusType showStatusTracker message{...textFragment}notice helpCenterText{...textFragment}}itemCount isCategorized categories{...ODPGroupCategoryFragment}seller{id name isPro}shipment{id trackingNumber}actions{reorder edit track changeSlot checkin editDeliveryInstructions editPickupPerson tip cancel help enableTip{...orderActionFragment}enableEdit{...orderActionFragment}viewCancellationDetails{...cancellationDetailsActionFragment}enableInHome{...orderActionFragment}createGiftReceipt}cutOffTimestamp isEditSubstitutionsEligible isInHome giftDetails{recipientAddress{fullName}recipientEmail senderName giftMessage}donationDetails{...orderDonationDetails}}fragment returnInfoFragment on ReturnInfo{returnOrderId type refundPriceDetails{__typename...refundPriceDetailsFragment}refundMessage tierRefundMessage paymentMethods{__typename description cardType paymentType displayValues message{...textFragment}}actions{__typename generate scheduleOrModifyPickup{text url}reschedulePickup editPickupContact}shippingLabelUrl qrCodeImageUrl carriers{__typename id name}pickupCarrier pickupContact{nameAndAddress{fullName firstName lastName address{addressString city state postalCode addressLineOne addressLineTwo country}}phone}pickupConfirmationNumber bannerMessage{...textFragment}}fragment refundPriceDetailsFragment on RefundPriceDetails{subTotal{__typename...orderPriceDetailRowFragment}fees{__typename...orderPriceDetailRowFragment}discounts{__typename...orderPriceDetailRowFragment}taxTotal{__typename...orderPriceDetailRowFragment}grandTotal{__typename...orderPriceDetailRowFragment}}fragment orderPriceDetailRowFragment on OrderPriceDetailRow{label displayValue value info{__typename title message}}fragment addressFragment on OrderAddress{addressString addressLineOne addressLineTwo state postalCode city}fragment ODPPickupInfo on OrderGroup{pickupInstructions pickupPerson{...person}alternatePickupPerson{...person}store{id name address{...addressFragment}}}fragment person on OrderPickupPerson{firstName lastName email}fragment ODPTippingInfo on OrderGroup{addTipMessage{...textFragment}driver{...DriverFragment}tipping{min{...price}max{...price}suggested{...price}preselected}subtotal{...price}}fragment orderActionFragment on Action{text url}fragment orderCustomer on OrderCustomer{id firstName lastName email isGuest isEmailRegistered}fragment OrderFieldsFragment on Order{__typename id version type customer{...orderCustomer}displayId idBarcodeImageUrl(barWidth:3 barHeight:100) isFuelPurchase title shortTitle timezone tippableGroup{...OrderGroupFragment}amendableGroup{id changeSlotIterationsLeft cutOffTimestamp fulfillmentType deliveryAddress{fullName firstName lastName address{addressString addressLineOne addressLineTwo state postalCode city country}}isAmendInProgress}substitutionsBanner{heading subheading longSubheading}groups_2101{__typename...OrderGroupFragment...ODPGroupFragment...ODPPickupInfo...ODPTippingInfo}multiboxBundles{...orderLineItem}itemCancelReasons{__typename...cancelReason}groupCancelReasons{__typename...cancelReason}priceDetails{__typename subTotal{__typename...priceDetailFragment}taxTotal{__typename...priceDetailFragment}grandTotal{__typename...priceDetailFragment}authorizationAmount{__typename...priceDetailFragment}fees{__typename...priceDetailFragment}discounts{__typename...priceDetailFragment}minimumThreshold{__typename...price}belowMinimumFee{__typename...priceDetailFragment}driverTip{__typename...priceDetailFragment}donations{__typename...priceDetailFragment}}paymentMethods{__typename description cardType paymentType displayValues message{...textFragment}actions{connectToCapitalOne{...orderActionFragment}visitAffirm{...orderActionFragment}}}actions{__typename return pendingReturn cancel startReturn{...orderActionFragment}reorder}banners{...textFragment}}","variables":{"orderId":"2822229930524","emailAddress":"shirley.sp@att.net"}}' \
  --compressed`
 
for (( i=0; i<=4; i++ ))
do
  if [[ $curl3 =~ "error"  || $curl3 =~ "blocked" ]]; then
    echo "Lỗi email số 3"
    indexOrder3=`echo error`
    break
  elif [[ `echo $curl3 | jq '.data.guestOrder.groups_2101['${i[@]}'].items[0].product.usItemId'` == '"137359681"' ]]; then
    indexOrder3=`echo $i`
    indexItem3=`echo 0`
  elif [[ `echo $curl3 | jq '.data.guestOrder.groups_2101['${i[@]}'].items[1].product.usItemId'` == '"137359681"' ]]; then
    indexOrder3=`echo $i`
    indexItem3=`echo 1`
  elif [[ `echo $curl3 | jq '.data.guestOrder.groups_2101['${i[@]}'].items[2].product.usItemId'` == '"137359681"' ]]; then
    indexOrder3=`echo $i`
    indexItem3=`echo 2`
  elif [[ `echo $curl3 | jq '.data.guestOrder.groups_2101['${i[@]}'].items[3].product.usItemId'` == '"137359681"' ]]; then
    indexOrder3=`echo $i`
    indexItem3=`echo 3`
  fi
done

if [[ $indexOrder3 != "error" ]]; then
echo $curl3 | jq '.data.guestOrder.id' >> track-OrderID.txt
echo $curl3 | jq '.data.guestOrder.customer.email' >> track-email.txt
echo $curl3 | jq '.data.guestOrder.groups_2101['$indexOrder3'].items['$indexItem3'].product.usItemId' >> track-usItemId.txt
echo $curl3 | jq '.data.guestOrder.groups_2101['$indexOrder3'].items['$indexItem3'].priceInfo.linePrice.value' >> track-priceValue.txt
echo $curl3 | jq '.data.guestOrder.groups_2101['$indexOrder3'].deliveryAddress.fullName' >> track-fullName.txt
echo $curl3 | jq '.data.guestOrder.groups_2101['$indexOrder3'].deliveryAddress.address.addressString' >> track-address.txt
echo $curl3 | jq '.data.guestOrder.groups_2101['$indexOrder3'].status.message.parts[].text' >> track-status.txt
echo $curl3 | jq '.data.guestOrder.groups_2101['$indexOrder3'].shipment.trackingNumber' >> track-number.txt
echo $curl3 | jq '.data.guestOrder.groups_2101['$indexOrder3'].shipment.trackingUrl' >> track-url.txt
fi

curl4=`curl 'https://www.walmart.com/orchestra/home/graphql' \
  -H 'authority: www.walmart.com' \
  -H 'sec-ch-ua: " Not A;Brand";v="99", "Chromium";v="96", "Microsoft Edge";v="96"' \
  -H 'x-o-platform: rweb' \
  -H 'dnt: 1' \
  -H 'x-o-correlation-id: wrvYiSFTlAmd8j7a8DDmpuyOpCN_heAnwM3v' \
  -H 'device_profile_ref_id: _s1F3NO8Y2JjaBUKPDcY4iFDWiIl9CyqiJjf' \
  -H 'x-latency-trace: 1' \
  -H 'wm_mp: true' \
  -H 'x-o-market: us' \
  -H 'x-o-platform-version: main-253-ebbb47' \
  -H 'x-o-gql-query: query getGuestOrder' \
  -H 'wm_page_url: https://www.walmart.com/orders' \
  -H 'x-apollo-operation-name: getGuestOrder' \
  -H 'sec-ch-ua-platform: "macOS"' \
  -H 'sec-ch-ua-mobile: ?0' \
  -H 'user-agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/96.0.4664.110 Safari/537.36 Edg/96.0.1054.62' \
  -H 'x-o-segment: oaoh' \
  -H 'content-type: application/json' \
  -H 'accept: application/json' \
  -H 'x-enable-server-timing: 1' \
  -H 'x-o-ccm: server' \
  -H 'wm_qos.correlation_id: wrvYiSFTlAmd8j7a8DDmpuyOpCN_heAnwM3v' \
  -H 'origin: https://www.walmart.com' \
  -H 'sec-fetch-site: same-origin' \
  -H 'sec-fetch-mode: cors' \
  -H 'sec-fetch-dest: empty' \
  -H 'referer: https://www.walmart.com/orders' \
  -H 'accept-language: vi' \
  --data-raw $'{"query":"query getGuestOrder($orderId:ID\u0021 $emailAddress:String\u0021){guestOrder(input:{id:$orderId emailAddress:$emailAddress}){...OrderFieldsFragment}}fragment cancelReason on OrderCancelReason{__typename subReasonCode subDescription}fragment priceDetailFragment on OrderPriceDetailRow{label value displayValue info{title message}rowInfo{...orderPriceDetailRowInfo}}fragment orderPriceDetailRowInfo on OrderPriceDetailRowInfo{title message{...textFragment}}fragment price on Price{displayValue value}fragment variants on MapEntry{name value}fragment OrderAddOn on OrderAddOn{lineId uniqueLineId productInfo{name usItemId offerId}quantityString quantityLabel type fulfillmentInstructions{...textFragment}actions{manageProtectionPlan{...orderActionFragment}cancel}priceInfo{linePrice{...price}}quantity isActive}fragment orderDonationDetails on OrderDonationDetails{message{...textFragment}emailReceipt emailReceiptToken status{...textFragment}errorStatus}fragment orderLineItem on OrderLineItem{id uniqueId actions{contactSeller cancel addToCart configureCake reviewItem resendEGiftCardToken protectionPlan{...orderActionFragment}manageProtectionPlan{...orderActionFragment}}isGift digitalDeliveryMessage quantity quantityString quantityLabel isSubstitutionSelected fulfilledItems{id quantityString priceInfo{itemPrice{value}}product{usItemId name}}isReturnable returnEligibilityMessage product{name usItemId imageInfo{thumbnailUrl}canonicalUrl offerId sellerId sellerName hasSellerBadge seller{sellerId name}orderLimit orderMinLimit weightIncrement salesUnit salesUnitType isSubstitutionEligible isAlcohol}reshop{reshopMessage isShippingAvailable minPromiseDate maxPromiseDate}selectedVariants{...variants}variantAdditionalInfo{parts{text nativeAction}}priceInfo{priceDisplayCodes{showItemPrice priceDisplayCondition finalCostByWeight}itemPrice{...price}linePrice{...price}unitPrice{...price}preDiscountedLinePrice{...price}additionalLines{name value}}discounts{label labelText{...textFragment}}itemReviewed activationCodes{label code}protectionPlanMessage{...textFragment}showSeller isShippedByWalmart seller{id name isPro}digitalDeliveryPhoneNumber addOns{...OrderAddOn}multiboxBundleId}fragment DriverFragment on Driver{id firstName photoUrl}fragment OrderGroupFragment on OrderGroup{driver{...DriverFragment}deliveryDate fulfillmentType status{...OrderGroupStatusFragment}showSeller isShippedByWalmart seller{...SellerFragment}id itemCount items{...LiteLineItemFragment}pickupPerson{firstName lastName email}accessPointId shipment{...ShipmentFragment}returnEligibilityMessage actions{...OrderGroupActionsFragment}recipientEmailAddress digitalDelivery{...DigitalDeliveryFragment}tireInstallationReservation{status extraText}}fragment OrderGroupStatusFragment on OrderGroupStatus{statusType showStatusTracker statusTracker{status label isCurrent}message{...textFragment}subtext subMessage{...textFragment}notice helpCenterText{...textFragment}}fragment textFragment on Text{parts{bold url text nativeAction lineBreak}}fragment LiteLineItemFragment on OrderLineItem{id quantity product{name usItemId imageInfo{thumbnailUrl}offerId isAlcohol}priceInfo{linePrice{...price}}}fragment SellerFragment on GroupSeller{id name isPro}fragment DigitalDeliveryFragment on DigitalDelivery{title name instructions{...textFragment}}fragment ShipmentFragment on Shipment{id trackingNumber isExternalTracking trackingUrl proofOfDelivery{photoUrl photoPreviewUrl showPreview}}fragment OrderGroupActionsFragment on OrderGroupActions{reorder edit track changeSlot checkin editDeliveryInstructions editPickupPerson editTip tip cancel enableTip{...orderActionFragment}enableEdit{...orderActionFragment}rescheduleTireInstall{...orderActionFragment}cancelTireInstall{...orderActionFragment}help viewCancellationDetails{...cancellationDetailsActionFragment}}fragment cancellationDetailsActionFragment on CancellationDetailsAction{label heading text{...textFragment}}fragment ODPGroupCategoryFragment on OrderCategory{type name subtext returnMessage substitutionsBanner{...textFragment}showExtendedSubstitutions actions{substitutions{message label type}nilPickReshop{message action{text url}}returnDetails viewCancellationDetails{...cancellationDetailsActionFragment}trackOnInHomeApp}banner{...textFragment}accordionState items{...orderLineItem}substitutions{...orderLineItem fulfilledItems{...orderLineItem}}returnInfo{...returnInfoFragment}}fragment ODPGroupFragment on OrderGroup{id fulfillmentType deliveryMessage deliveryAddress{fullName firstName lastName address{...addressFragment}}deliveryInstructions{text type typeText}deliveryPreferences{text{...textFragment}cta{...orderActionFragment}}editSubstitutionsCutOff status{statusType showStatusTracker message{...textFragment}notice helpCenterText{...textFragment}}itemCount isCategorized categories{...ODPGroupCategoryFragment}seller{id name isPro}shipment{id trackingNumber}actions{reorder edit track changeSlot checkin editDeliveryInstructions editPickupPerson tip cancel help enableTip{...orderActionFragment}enableEdit{...orderActionFragment}viewCancellationDetails{...cancellationDetailsActionFragment}enableInHome{...orderActionFragment}createGiftReceipt}cutOffTimestamp isEditSubstitutionsEligible isInHome giftDetails{recipientAddress{fullName}recipientEmail senderName giftMessage}donationDetails{...orderDonationDetails}}fragment returnInfoFragment on ReturnInfo{returnOrderId type refundPriceDetails{__typename...refundPriceDetailsFragment}refundMessage tierRefundMessage paymentMethods{__typename description cardType paymentType displayValues message{...textFragment}}actions{__typename generate scheduleOrModifyPickup{text url}reschedulePickup editPickupContact}shippingLabelUrl qrCodeImageUrl carriers{__typename id name}pickupCarrier pickupContact{nameAndAddress{fullName firstName lastName address{addressString city state postalCode addressLineOne addressLineTwo country}}phone}pickupConfirmationNumber bannerMessage{...textFragment}}fragment refundPriceDetailsFragment on RefundPriceDetails{subTotal{__typename...orderPriceDetailRowFragment}fees{__typename...orderPriceDetailRowFragment}discounts{__typename...orderPriceDetailRowFragment}taxTotal{__typename...orderPriceDetailRowFragment}grandTotal{__typename...orderPriceDetailRowFragment}}fragment orderPriceDetailRowFragment on OrderPriceDetailRow{label displayValue value info{__typename title message}}fragment addressFragment on OrderAddress{addressString addressLineOne addressLineTwo state postalCode city}fragment ODPPickupInfo on OrderGroup{pickupInstructions pickupPerson{...person}alternatePickupPerson{...person}store{id name address{...addressFragment}}}fragment person on OrderPickupPerson{firstName lastName email}fragment ODPTippingInfo on OrderGroup{addTipMessage{...textFragment}driver{...DriverFragment}tipping{min{...price}max{...price}suggested{...price}preselected}subtotal{...price}}fragment orderActionFragment on Action{text url}fragment orderCustomer on OrderCustomer{id firstName lastName email isGuest isEmailRegistered}fragment OrderFieldsFragment on Order{__typename id version type customer{...orderCustomer}displayId idBarcodeImageUrl(barWidth:3 barHeight:100) isFuelPurchase title shortTitle timezone tippableGroup{...OrderGroupFragment}amendableGroup{id changeSlotIterationsLeft cutOffTimestamp fulfillmentType deliveryAddress{fullName firstName lastName address{addressString addressLineOne addressLineTwo state postalCode city country}}isAmendInProgress}substitutionsBanner{heading subheading longSubheading}groups_2101{__typename...OrderGroupFragment...ODPGroupFragment...ODPPickupInfo...ODPTippingInfo}multiboxBundles{...orderLineItem}itemCancelReasons{__typename...cancelReason}groupCancelReasons{__typename...cancelReason}priceDetails{__typename subTotal{__typename...priceDetailFragment}taxTotal{__typename...priceDetailFragment}grandTotal{__typename...priceDetailFragment}authorizationAmount{__typename...priceDetailFragment}fees{__typename...priceDetailFragment}discounts{__typename...priceDetailFragment}minimumThreshold{__typename...price}belowMinimumFee{__typename...priceDetailFragment}driverTip{__typename...priceDetailFragment}donations{__typename...priceDetailFragment}}paymentMethods{__typename description cardType paymentType displayValues message{...textFragment}actions{connectToCapitalOne{...orderActionFragment}visitAffirm{...orderActionFragment}}}actions{__typename return pendingReturn cancel startReturn{...orderActionFragment}reorder}banners{...textFragment}}","variables":{"orderId":"6352102337128","emailAddress":"gosciu472@yahoo.com"}}' \
  --compressed`
 
for (( i=0; i<=4; i++ ))
do
  if [[ $curl4 =~ "error"  || $curl4 =~ "blocked" ]]; then
    echo "Lỗi email số 4"
    indexOrder4=`echo error`
    break
  elif [[ `echo $curl4 | jq '.data.guestOrder.groups_2101['${i[@]}'].items[0].product.usItemId'` == '"918843213"' ]]; then
    indexOrder4=`echo $i`
    indexItem4=`echo 0`
  elif [[ `echo $curl4 | jq '.data.guestOrder.groups_2101['${i[@]}'].items[1].product.usItemId'` == '"918843213"' ]]; then
    indexOrder4=`echo $i`
    indexItem4=`echo 1`
  elif [[ `echo $curl4 | jq '.data.guestOrder.groups_2101['${i[@]}'].items[2].product.usItemId'` == '"918843213"' ]]; then
    indexOrder4=`echo $i`
    indexItem4=`echo 2`
  elif [[ `echo $curl4 | jq '.data.guestOrder.groups_2101['${i[@]}'].items[3].product.usItemId'` == '"918843213"' ]]; then
    indexOrder4=`echo $i`
    indexItem4=`echo 3`
  fi
done

if [[ $indexOrder4 != "error" ]]; then
echo $curl4 | jq '.data.guestOrder.id' >> track-OrderID.txt
echo $curl4 | jq '.data.guestOrder.customer.email' >> track-email.txt
echo $curl4 | jq '.data.guestOrder.groups_2101['$indexOrder4'].items['$indexItem4'].product.usItemId' >> track-usItemId.txt
echo $curl4 | jq '.data.guestOrder.groups_2101['$indexOrder4'].items['$indexItem4'].priceInfo.linePrice.value' >> track-priceValue.txt
echo $curl4 | jq '.data.guestOrder.groups_2101['$indexOrder4'].deliveryAddress.fullName' >> track-fullName.txt
echo $curl4 | jq '.data.guestOrder.groups_2101['$indexOrder4'].deliveryAddress.address.addressString' >> track-address.txt
echo $curl4 | jq '.data.guestOrder.groups_2101['$indexOrder4'].status.message.parts[].text' >> track-status.txt
echo $curl4 | jq '.data.guestOrder.groups_2101['$indexOrder4'].shipment.trackingNumber' >> track-number.txt
echo $curl4 | jq '.data.guestOrder.groups_2101['$indexOrder4'].shipment.trackingUrl' >> track-url.txt
fi

curl5=`curl 'https://www.walmart.com/orchestra/home/graphql' \
  -H 'authority: www.walmart.com' \
  -H 'sec-ch-ua: " Not A;Brand";v="99", "Chromium";v="96", "Microsoft Edge";v="96"' \
  -H 'x-o-platform: rweb' \
  -H 'dnt: 1' \
  -H 'x-o-correlation-id: wrvYiSFTlAmd8j7a8DDmpuyOpCN_heAnwM3v' \
  -H 'device_profile_ref_id: _s1F3NO8Y2JjaBUKPDcY4iFDWiIl9CyqiJjf' \
  -H 'x-latency-trace: 1' \
  -H 'wm_mp: true' \
  -H 'x-o-market: us' \
  -H 'x-o-platform-version: main-253-ebbb47' \
  -H 'x-o-gql-query: query getGuestOrder' \
  -H 'wm_page_url: https://www.walmart.com/orders' \
  -H 'x-apollo-operation-name: getGuestOrder' \
  -H 'sec-ch-ua-platform: "macOS"' \
  -H 'sec-ch-ua-mobile: ?0' \
  -H 'user-agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/96.0.4664.110 Safari/537.36 Edg/96.0.1054.62' \
  -H 'x-o-segment: oaoh' \
  -H 'content-type: application/json' \
  -H 'accept: application/json' \
  -H 'x-enable-server-timing: 1' \
  -H 'x-o-ccm: server' \
  -H 'wm_qos.correlation_id: wrvYiSFTlAmd8j7a8DDmpuyOpCN_heAnwM3v' \
  -H 'origin: https://www.walmart.com' \
  -H 'sec-fetch-site: same-origin' \
  -H 'sec-fetch-mode: cors' \
  -H 'sec-fetch-dest: empty' \
  -H 'referer: https://www.walmart.com/orders' \
  -H 'accept-language: vi' \
  --data-raw $'{"query":"query getGuestOrder($orderId:ID\u0021 $emailAddress:String\u0021){guestOrder(input:{id:$orderId emailAddress:$emailAddress}){...OrderFieldsFragment}}fragment cancelReason on OrderCancelReason{__typename subReasonCode subDescription}fragment priceDetailFragment on OrderPriceDetailRow{label value displayValue info{title message}rowInfo{...orderPriceDetailRowInfo}}fragment orderPriceDetailRowInfo on OrderPriceDetailRowInfo{title message{...textFragment}}fragment price on Price{displayValue value}fragment variants on MapEntry{name value}fragment OrderAddOn on OrderAddOn{lineId uniqueLineId productInfo{name usItemId offerId}quantityString quantityLabel type fulfillmentInstructions{...textFragment}actions{manageProtectionPlan{...orderActionFragment}cancel}priceInfo{linePrice{...price}}quantity isActive}fragment orderDonationDetails on OrderDonationDetails{message{...textFragment}emailReceipt emailReceiptToken status{...textFragment}errorStatus}fragment orderLineItem on OrderLineItem{id uniqueId actions{contactSeller cancel addToCart configureCake reviewItem resendEGiftCardToken protectionPlan{...orderActionFragment}manageProtectionPlan{...orderActionFragment}}isGift digitalDeliveryMessage quantity quantityString quantityLabel isSubstitutionSelected fulfilledItems{id quantityString priceInfo{itemPrice{value}}product{usItemId name}}isReturnable returnEligibilityMessage product{name usItemId imageInfo{thumbnailUrl}canonicalUrl offerId sellerId sellerName hasSellerBadge seller{sellerId name}orderLimit orderMinLimit weightIncrement salesUnit salesUnitType isSubstitutionEligible isAlcohol}reshop{reshopMessage isShippingAvailable minPromiseDate maxPromiseDate}selectedVariants{...variants}variantAdditionalInfo{parts{text nativeAction}}priceInfo{priceDisplayCodes{showItemPrice priceDisplayCondition finalCostByWeight}itemPrice{...price}linePrice{...price}unitPrice{...price}preDiscountedLinePrice{...price}additionalLines{name value}}discounts{label labelText{...textFragment}}itemReviewed activationCodes{label code}protectionPlanMessage{...textFragment}showSeller isShippedByWalmart seller{id name isPro}digitalDeliveryPhoneNumber addOns{...OrderAddOn}multiboxBundleId}fragment DriverFragment on Driver{id firstName photoUrl}fragment OrderGroupFragment on OrderGroup{driver{...DriverFragment}deliveryDate fulfillmentType status{...OrderGroupStatusFragment}showSeller isShippedByWalmart seller{...SellerFragment}id itemCount items{...LiteLineItemFragment}pickupPerson{firstName lastName email}accessPointId shipment{...ShipmentFragment}returnEligibilityMessage actions{...OrderGroupActionsFragment}recipientEmailAddress digitalDelivery{...DigitalDeliveryFragment}tireInstallationReservation{status extraText}}fragment OrderGroupStatusFragment on OrderGroupStatus{statusType showStatusTracker statusTracker{status label isCurrent}message{...textFragment}subtext subMessage{...textFragment}notice helpCenterText{...textFragment}}fragment textFragment on Text{parts{bold url text nativeAction lineBreak}}fragment LiteLineItemFragment on OrderLineItem{id quantity product{name usItemId imageInfo{thumbnailUrl}offerId isAlcohol}priceInfo{linePrice{...price}}}fragment SellerFragment on GroupSeller{id name isPro}fragment DigitalDeliveryFragment on DigitalDelivery{title name instructions{...textFragment}}fragment ShipmentFragment on Shipment{id trackingNumber isExternalTracking trackingUrl proofOfDelivery{photoUrl photoPreviewUrl showPreview}}fragment OrderGroupActionsFragment on OrderGroupActions{reorder edit track changeSlot checkin editDeliveryInstructions editPickupPerson editTip tip cancel enableTip{...orderActionFragment}enableEdit{...orderActionFragment}rescheduleTireInstall{...orderActionFragment}cancelTireInstall{...orderActionFragment}help viewCancellationDetails{...cancellationDetailsActionFragment}}fragment cancellationDetailsActionFragment on CancellationDetailsAction{label heading text{...textFragment}}fragment ODPGroupCategoryFragment on OrderCategory{type name subtext returnMessage substitutionsBanner{...textFragment}showExtendedSubstitutions actions{substitutions{message label type}nilPickReshop{message action{text url}}returnDetails viewCancellationDetails{...cancellationDetailsActionFragment}trackOnInHomeApp}banner{...textFragment}accordionState items{...orderLineItem}substitutions{...orderLineItem fulfilledItems{...orderLineItem}}returnInfo{...returnInfoFragment}}fragment ODPGroupFragment on OrderGroup{id fulfillmentType deliveryMessage deliveryAddress{fullName firstName lastName address{...addressFragment}}deliveryInstructions{text type typeText}deliveryPreferences{text{...textFragment}cta{...orderActionFragment}}editSubstitutionsCutOff status{statusType showStatusTracker message{...textFragment}notice helpCenterText{...textFragment}}itemCount isCategorized categories{...ODPGroupCategoryFragment}seller{id name isPro}shipment{id trackingNumber}actions{reorder edit track changeSlot checkin editDeliveryInstructions editPickupPerson tip cancel help enableTip{...orderActionFragment}enableEdit{...orderActionFragment}viewCancellationDetails{...cancellationDetailsActionFragment}enableInHome{...orderActionFragment}createGiftReceipt}cutOffTimestamp isEditSubstitutionsEligible isInHome giftDetails{recipientAddress{fullName}recipientEmail senderName giftMessage}donationDetails{...orderDonationDetails}}fragment returnInfoFragment on ReturnInfo{returnOrderId type refundPriceDetails{__typename...refundPriceDetailsFragment}refundMessage tierRefundMessage paymentMethods{__typename description cardType paymentType displayValues message{...textFragment}}actions{__typename generate scheduleOrModifyPickup{text url}reschedulePickup editPickupContact}shippingLabelUrl qrCodeImageUrl carriers{__typename id name}pickupCarrier pickupContact{nameAndAddress{fullName firstName lastName address{addressString city state postalCode addressLineOne addressLineTwo country}}phone}pickupConfirmationNumber bannerMessage{...textFragment}}fragment refundPriceDetailsFragment on RefundPriceDetails{subTotal{__typename...orderPriceDetailRowFragment}fees{__typename...orderPriceDetailRowFragment}discounts{__typename...orderPriceDetailRowFragment}taxTotal{__typename...orderPriceDetailRowFragment}grandTotal{__typename...orderPriceDetailRowFragment}}fragment orderPriceDetailRowFragment on OrderPriceDetailRow{label displayValue value info{__typename title message}}fragment addressFragment on OrderAddress{addressString addressLineOne addressLineTwo state postalCode city}fragment ODPPickupInfo on OrderGroup{pickupInstructions pickupPerson{...person}alternatePickupPerson{...person}store{id name address{...addressFragment}}}fragment person on OrderPickupPerson{firstName lastName email}fragment ODPTippingInfo on OrderGroup{addTipMessage{...textFragment}driver{...DriverFragment}tipping{min{...price}max{...price}suggested{...price}preselected}subtotal{...price}}fragment orderActionFragment on Action{text url}fragment orderCustomer on OrderCustomer{id firstName lastName email isGuest isEmailRegistered}fragment OrderFieldsFragment on Order{__typename id version type customer{...orderCustomer}displayId idBarcodeImageUrl(barWidth:3 barHeight:100) isFuelPurchase title shortTitle timezone tippableGroup{...OrderGroupFragment}amendableGroup{id changeSlotIterationsLeft cutOffTimestamp fulfillmentType deliveryAddress{fullName firstName lastName address{addressString addressLineOne addressLineTwo state postalCode city country}}isAmendInProgress}substitutionsBanner{heading subheading longSubheading}groups_2101{__typename...OrderGroupFragment...ODPGroupFragment...ODPPickupInfo...ODPTippingInfo}multiboxBundles{...orderLineItem}itemCancelReasons{__typename...cancelReason}groupCancelReasons{__typename...cancelReason}priceDetails{__typename subTotal{__typename...priceDetailFragment}taxTotal{__typename...priceDetailFragment}grandTotal{__typename...priceDetailFragment}authorizationAmount{__typename...priceDetailFragment}fees{__typename...priceDetailFragment}discounts{__typename...priceDetailFragment}minimumThreshold{__typename...price}belowMinimumFee{__typename...priceDetailFragment}driverTip{__typename...priceDetailFragment}donations{__typename...priceDetailFragment}}paymentMethods{__typename description cardType paymentType displayValues message{...textFragment}actions{connectToCapitalOne{...orderActionFragment}visitAffirm{...orderActionFragment}}}actions{__typename return pendingReturn cancel startReturn{...orderActionFragment}reorder}banners{...textFragment}}","variables":{"orderId":"2772219929514","emailAddress":"dynamic.essentials@yahoo.com"}}' \
  --compressed`
 
for (( i=0; i<=4; i++ ))
do
  if [[ $curl5 =~ "error"  || $curl5 =~ "blocked" ]]; then
    echo "Lỗi email số 5"
    indexOrder5=`echo error`
    break
  elif [[ `echo $curl5 | jq '.data.guestOrder.groups_2101['${i[@]}'].items[0].product.usItemId'` == '"129706644"' ]]; then
    indexOrder5=`echo $i`
    indexItem5=`echo 0`
  elif [[ `echo $curl5 | jq '.data.guestOrder.groups_2101['${i[@]}'].items[1].product.usItemId'` == '"129706644"' ]]; then
    indexOrder5=`echo $i`
    indexItem5=`echo 1`
  elif [[ `echo $curl5 | jq '.data.guestOrder.groups_2101['${i[@]}'].items[2].product.usItemId'` == '"129706644"' ]]; then
    indexOrder5=`echo $i`
    indexItem5=`echo 2`
  elif [[ `echo $curl5 | jq '.data.guestOrder.groups_2101['${i[@]}'].items[3].product.usItemId'` == '"129706644"' ]]; then
    indexOrder5=`echo $i`
    indexItem5=`echo 3`
  fi
done

if [[ $indexOrder5 != "error" ]]; then
echo $curl5 | jq '.data.guestOrder.id' >> track-OrderID.txt
echo $curl5 | jq '.data.guestOrder.customer.email' >> track-email.txt
echo $curl5 | jq '.data.guestOrder.groups_2101['$indexOrder5'].items['$indexItem5'].product.usItemId' >> track-usItemId.txt
echo $curl5 | jq '.data.guestOrder.groups_2101['$indexOrder5'].items['$indexItem5'].priceInfo.linePrice.value' >> track-priceValue.txt
echo $curl5 | jq '.data.guestOrder.groups_2101['$indexOrder5'].deliveryAddress.fullName' >> track-fullName.txt
echo $curl5 | jq '.data.guestOrder.groups_2101['$indexOrder5'].deliveryAddress.address.addressString' >> track-address.txt
echo $curl5 | jq '.data.guestOrder.groups_2101['$indexOrder5'].status.message.parts[].text' >> track-status.txt
echo $curl5 | jq '.data.guestOrder.groups_2101['$indexOrder5'].shipment.trackingNumber' >> track-number.txt
echo $curl5 | jq '.data.guestOrder.groups_2101['$indexOrder5'].shipment.trackingUrl' >> track-url.txt
fi

curl6=`curl 'https://www.walmart.com/orchestra/home/graphql' \
  -H 'authority: www.walmart.com' \
  -H 'sec-ch-ua: " Not A;Brand";v="99", "Chromium";v="96", "Microsoft Edge";v="96"' \
  -H 'x-o-platform: rweb' \
  -H 'dnt: 1' \
  -H 'x-o-correlation-id: wrvYiSFTlAmd8j7a8DDmpuyOpCN_heAnwM3v' \
  -H 'device_profile_ref_id: _s1F3NO8Y2JjaBUKPDcY4iFDWiIl9CyqiJjf' \
  -H 'x-latency-trace: 1' \
  -H 'wm_mp: true' \
  -H 'x-o-market: us' \
  -H 'x-o-platform-version: main-253-ebbb47' \
  -H 'x-o-gql-query: query getGuestOrder' \
  -H 'wm_page_url: https://www.walmart.com/orders' \
  -H 'x-apollo-operation-name: getGuestOrder' \
  -H 'sec-ch-ua-platform: "macOS"' \
  -H 'sec-ch-ua-mobile: ?0' \
  -H 'user-agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/96.0.4664.110 Safari/537.36 Edg/96.0.1054.62' \
  -H 'x-o-segment: oaoh' \
  -H 'content-type: application/json' \
  -H 'accept: application/json' \
  -H 'x-enable-server-timing: 1' \
  -H 'x-o-ccm: server' \
  -H 'wm_qos.correlation_id: wrvYiSFTlAmd8j7a8DDmpuyOpCN_heAnwM3v' \
  -H 'origin: https://www.walmart.com' \
  -H 'sec-fetch-site: same-origin' \
  -H 'sec-fetch-mode: cors' \
  -H 'sec-fetch-dest: empty' \
  -H 'referer: https://www.walmart.com/orders' \
  -H 'accept-language: vi' \
  --data-raw $'{"query":"query getGuestOrder($orderId:ID\u0021 $emailAddress:String\u0021){guestOrder(input:{id:$orderId emailAddress:$emailAddress}){...OrderFieldsFragment}}fragment cancelReason on OrderCancelReason{__typename subReasonCode subDescription}fragment priceDetailFragment on OrderPriceDetailRow{label value displayValue info{title message}rowInfo{...orderPriceDetailRowInfo}}fragment orderPriceDetailRowInfo on OrderPriceDetailRowInfo{title message{...textFragment}}fragment price on Price{displayValue value}fragment variants on MapEntry{name value}fragment OrderAddOn on OrderAddOn{lineId uniqueLineId productInfo{name usItemId offerId}quantityString quantityLabel type fulfillmentInstructions{...textFragment}actions{manageProtectionPlan{...orderActionFragment}cancel}priceInfo{linePrice{...price}}quantity isActive}fragment orderDonationDetails on OrderDonationDetails{message{...textFragment}emailReceipt emailReceiptToken status{...textFragment}errorStatus}fragment orderLineItem on OrderLineItem{id uniqueId actions{contactSeller cancel addToCart configureCake reviewItem resendEGiftCardToken protectionPlan{...orderActionFragment}manageProtectionPlan{...orderActionFragment}}isGift digitalDeliveryMessage quantity quantityString quantityLabel isSubstitutionSelected fulfilledItems{id quantityString priceInfo{itemPrice{value}}product{usItemId name}}isReturnable returnEligibilityMessage product{name usItemId imageInfo{thumbnailUrl}canonicalUrl offerId sellerId sellerName hasSellerBadge seller{sellerId name}orderLimit orderMinLimit weightIncrement salesUnit salesUnitType isSubstitutionEligible isAlcohol}reshop{reshopMessage isShippingAvailable minPromiseDate maxPromiseDate}selectedVariants{...variants}variantAdditionalInfo{parts{text nativeAction}}priceInfo{priceDisplayCodes{showItemPrice priceDisplayCondition finalCostByWeight}itemPrice{...price}linePrice{...price}unitPrice{...price}preDiscountedLinePrice{...price}additionalLines{name value}}discounts{label labelText{...textFragment}}itemReviewed activationCodes{label code}protectionPlanMessage{...textFragment}showSeller isShippedByWalmart seller{id name isPro}digitalDeliveryPhoneNumber addOns{...OrderAddOn}multiboxBundleId}fragment DriverFragment on Driver{id firstName photoUrl}fragment OrderGroupFragment on OrderGroup{driver{...DriverFragment}deliveryDate fulfillmentType status{...OrderGroupStatusFragment}showSeller isShippedByWalmart seller{...SellerFragment}id itemCount items{...LiteLineItemFragment}pickupPerson{firstName lastName email}accessPointId shipment{...ShipmentFragment}returnEligibilityMessage actions{...OrderGroupActionsFragment}recipientEmailAddress digitalDelivery{...DigitalDeliveryFragment}tireInstallationReservation{status extraText}}fragment OrderGroupStatusFragment on OrderGroupStatus{statusType showStatusTracker statusTracker{status label isCurrent}message{...textFragment}subtext subMessage{...textFragment}notice helpCenterText{...textFragment}}fragment textFragment on Text{parts{bold url text nativeAction lineBreak}}fragment LiteLineItemFragment on OrderLineItem{id quantity product{name usItemId imageInfo{thumbnailUrl}offerId isAlcohol}priceInfo{linePrice{...price}}}fragment SellerFragment on GroupSeller{id name isPro}fragment DigitalDeliveryFragment on DigitalDelivery{title name instructions{...textFragment}}fragment ShipmentFragment on Shipment{id trackingNumber isExternalTracking trackingUrl proofOfDelivery{photoUrl photoPreviewUrl showPreview}}fragment OrderGroupActionsFragment on OrderGroupActions{reorder edit track changeSlot checkin editDeliveryInstructions editPickupPerson editTip tip cancel enableTip{...orderActionFragment}enableEdit{...orderActionFragment}rescheduleTireInstall{...orderActionFragment}cancelTireInstall{...orderActionFragment}help viewCancellationDetails{...cancellationDetailsActionFragment}}fragment cancellationDetailsActionFragment on CancellationDetailsAction{label heading text{...textFragment}}fragment ODPGroupCategoryFragment on OrderCategory{type name subtext returnMessage substitutionsBanner{...textFragment}showExtendedSubstitutions actions{substitutions{message label type}nilPickReshop{message action{text url}}returnDetails viewCancellationDetails{...cancellationDetailsActionFragment}trackOnInHomeApp}banner{...textFragment}accordionState items{...orderLineItem}substitutions{...orderLineItem fulfilledItems{...orderLineItem}}returnInfo{...returnInfoFragment}}fragment ODPGroupFragment on OrderGroup{id fulfillmentType deliveryMessage deliveryAddress{fullName firstName lastName address{...addressFragment}}deliveryInstructions{text type typeText}deliveryPreferences{text{...textFragment}cta{...orderActionFragment}}editSubstitutionsCutOff status{statusType showStatusTracker message{...textFragment}notice helpCenterText{...textFragment}}itemCount isCategorized categories{...ODPGroupCategoryFragment}seller{id name isPro}shipment{id trackingNumber}actions{reorder edit track changeSlot checkin editDeliveryInstructions editPickupPerson tip cancel help enableTip{...orderActionFragment}enableEdit{...orderActionFragment}viewCancellationDetails{...cancellationDetailsActionFragment}enableInHome{...orderActionFragment}createGiftReceipt}cutOffTimestamp isEditSubstitutionsEligible isInHome giftDetails{recipientAddress{fullName}recipientEmail senderName giftMessage}donationDetails{...orderDonationDetails}}fragment returnInfoFragment on ReturnInfo{returnOrderId type refundPriceDetails{__typename...refundPriceDetailsFragment}refundMessage tierRefundMessage paymentMethods{__typename description cardType paymentType displayValues message{...textFragment}}actions{__typename generate scheduleOrModifyPickup{text url}reschedulePickup editPickupContact}shippingLabelUrl qrCodeImageUrl carriers{__typename id name}pickupCarrier pickupContact{nameAndAddress{fullName firstName lastName address{addressString city state postalCode addressLineOne addressLineTwo country}}phone}pickupConfirmationNumber bannerMessage{...textFragment}}fragment refundPriceDetailsFragment on RefundPriceDetails{subTotal{__typename...orderPriceDetailRowFragment}fees{__typename...orderPriceDetailRowFragment}discounts{__typename...orderPriceDetailRowFragment}taxTotal{__typename...orderPriceDetailRowFragment}grandTotal{__typename...orderPriceDetailRowFragment}}fragment orderPriceDetailRowFragment on OrderPriceDetailRow{label displayValue value info{__typename title message}}fragment addressFragment on OrderAddress{addressString addressLineOne addressLineTwo state postalCode city}fragment ODPPickupInfo on OrderGroup{pickupInstructions pickupPerson{...person}alternatePickupPerson{...person}store{id name address{...addressFragment}}}fragment person on OrderPickupPerson{firstName lastName email}fragment ODPTippingInfo on OrderGroup{addTipMessage{...textFragment}driver{...DriverFragment}tipping{min{...price}max{...price}suggested{...price}preselected}subtotal{...price}}fragment orderActionFragment on Action{text url}fragment orderCustomer on OrderCustomer{id firstName lastName email isGuest isEmailRegistered}fragment OrderFieldsFragment on Order{__typename id version type customer{...orderCustomer}displayId idBarcodeImageUrl(barWidth:3 barHeight:100) isFuelPurchase title shortTitle timezone tippableGroup{...OrderGroupFragment}amendableGroup{id changeSlotIterationsLeft cutOffTimestamp fulfillmentType deliveryAddress{fullName firstName lastName address{addressString addressLineOne addressLineTwo state postalCode city country}}isAmendInProgress}substitutionsBanner{heading subheading longSubheading}groups_2101{__typename...OrderGroupFragment...ODPGroupFragment...ODPPickupInfo...ODPTippingInfo}multiboxBundles{...orderLineItem}itemCancelReasons{__typename...cancelReason}groupCancelReasons{__typename...cancelReason}priceDetails{__typename subTotal{__typename...priceDetailFragment}taxTotal{__typename...priceDetailFragment}grandTotal{__typename...priceDetailFragment}authorizationAmount{__typename...priceDetailFragment}fees{__typename...priceDetailFragment}discounts{__typename...priceDetailFragment}minimumThreshold{__typename...price}belowMinimumFee{__typename...priceDetailFragment}driverTip{__typename...priceDetailFragment}donations{__typename...priceDetailFragment}}paymentMethods{__typename description cardType paymentType displayValues message{...textFragment}actions{connectToCapitalOne{...orderActionFragment}visitAffirm{...orderActionFragment}}}actions{__typename return pendingReturn cancel startReturn{...orderActionFragment}reorder}banners{...textFragment}}","variables":{"orderId":"2782221952580","emailAddress":"tinamerrill2008@gmail.com"}}' \
  --compressed`
 
for (( i=0; i<=4; i++ ))
do
  if [[ $curl6 =~ "error"  || $curl6 =~ "blocked" ]]; then
    echo "Lỗi email số 6"
    indexOrder6=`echo error`
    break
  elif [[ `echo $curl6 | jq '.data.guestOrder.groups_2101['${i[@]}'].items[0].product.usItemId'` == '"755361385"' ]]; then
    indexOrder6=`echo $i`
    indexItem6=`echo 0`
  elif [[ `echo $curl6 | jq '.data.guestOrder.groups_2101['${i[@]}'].items[1].product.usItemId'` == '"755361385"' ]]; then
    indexOrder6=`echo $i`
    indexItem6=`echo 1`
  elif [[ `echo $curl6 | jq '.data.guestOrder.groups_2101['${i[@]}'].items[2].product.usItemId'` == '"755361385"' ]]; then
    indexOrder6=`echo $i`
    indexItem6=`echo 2`
  elif [[ `echo $curl6 | jq '.data.guestOrder.groups_2101['${i[@]}'].items[3].product.usItemId'` == '"755361385"' ]]; then
    indexOrder6=`echo $i`
    indexItem6=`echo 3`
  fi
done

if [[ $indexOrder6 != "error" ]]; then
echo $curl6 | jq '.data.guestOrder.id' >> track-OrderID.txt
echo $curl6 | jq '.data.guestOrder.customer.email' >> track-email.txt
echo $curl6 | jq '.data.guestOrder.groups_2101['$indexOrder6'].items['$indexItem6'].product.usItemId' >> track-usItemId.txt
echo $curl6 | jq '.data.guestOrder.groups_2101['$indexOrder6'].items['$indexItem6'].priceInfo.linePrice.value' >> track-priceValue.txt
echo $curl6 | jq '.data.guestOrder.groups_2101['$indexOrder6'].deliveryAddress.fullName' >> track-fullName.txt
echo $curl6 | jq '.data.guestOrder.groups_2101['$indexOrder6'].deliveryAddress.address.addressString' >> track-address.txt
echo $curl6 | jq '.data.guestOrder.groups_2101['$indexOrder6'].status.message.parts[].text' >> track-status.txt
echo $curl6 | jq '.data.guestOrder.groups_2101['$indexOrder6'].shipment.trackingNumber' >> track-number.txt
echo $curl6 | jq '.data.guestOrder.groups_2101['$indexOrder6'].shipment.trackingUrl' >> track-url.txt
fi

curl7=`curl 'https://www.walmart.com/orchestra/home/graphql' \
  -H 'authority: www.walmart.com' \
  -H 'sec-ch-ua: " Not A;Brand";v="99", "Chromium";v="96", "Microsoft Edge";v="96"' \
  -H 'x-o-platform: rweb' \
  -H 'dnt: 1' \
  -H 'x-o-correlation-id: wrvYiSFTlAmd8j7a8DDmpuyOpCN_heAnwM3v' \
  -H 'device_profile_ref_id: _s1F3NO8Y2JjaBUKPDcY4iFDWiIl9CyqiJjf' \
  -H 'x-latency-trace: 1' \
  -H 'wm_mp: true' \
  -H 'x-o-market: us' \
  -H 'x-o-platform-version: main-253-ebbb47' \
  -H 'x-o-gql-query: query getGuestOrder' \
  -H 'wm_page_url: https://www.walmart.com/orders' \
  -H 'x-apollo-operation-name: getGuestOrder' \
  -H 'sec-ch-ua-platform: "macOS"' \
  -H 'sec-ch-ua-mobile: ?0' \
  -H 'user-agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/96.0.4664.110 Safari/537.36 Edg/96.0.1054.62' \
  -H 'x-o-segment: oaoh' \
  -H 'content-type: application/json' \
  -H 'accept: application/json' \
  -H 'x-enable-server-timing: 1' \
  -H 'x-o-ccm: server' \
  -H 'wm_qos.correlation_id: wrvYiSFTlAmd8j7a8DDmpuyOpCN_heAnwM3v' \
  -H 'origin: https://www.walmart.com' \
  -H 'sec-fetch-site: same-origin' \
  -H 'sec-fetch-mode: cors' \
  -H 'sec-fetch-dest: empty' \
  -H 'referer: https://www.walmart.com/orders' \
  -H 'accept-language: vi' \
  --data-raw $'{"query":"query getGuestOrder($orderId:ID\u0021 $emailAddress:String\u0021){guestOrder(input:{id:$orderId emailAddress:$emailAddress}){...OrderFieldsFragment}}fragment cancelReason on OrderCancelReason{__typename subReasonCode subDescription}fragment priceDetailFragment on OrderPriceDetailRow{label value displayValue info{title message}rowInfo{...orderPriceDetailRowInfo}}fragment orderPriceDetailRowInfo on OrderPriceDetailRowInfo{title message{...textFragment}}fragment price on Price{displayValue value}fragment variants on MapEntry{name value}fragment OrderAddOn on OrderAddOn{lineId uniqueLineId productInfo{name usItemId offerId}quantityString quantityLabel type fulfillmentInstructions{...textFragment}actions{manageProtectionPlan{...orderActionFragment}cancel}priceInfo{linePrice{...price}}quantity isActive}fragment orderDonationDetails on OrderDonationDetails{message{...textFragment}emailReceipt emailReceiptToken status{...textFragment}errorStatus}fragment orderLineItem on OrderLineItem{id uniqueId actions{contactSeller cancel addToCart configureCake reviewItem resendEGiftCardToken protectionPlan{...orderActionFragment}manageProtectionPlan{...orderActionFragment}}isGift digitalDeliveryMessage quantity quantityString quantityLabel isSubstitutionSelected fulfilledItems{id quantityString priceInfo{itemPrice{value}}product{usItemId name}}isReturnable returnEligibilityMessage product{name usItemId imageInfo{thumbnailUrl}canonicalUrl offerId sellerId sellerName hasSellerBadge seller{sellerId name}orderLimit orderMinLimit weightIncrement salesUnit salesUnitType isSubstitutionEligible isAlcohol}reshop{reshopMessage isShippingAvailable minPromiseDate maxPromiseDate}selectedVariants{...variants}variantAdditionalInfo{parts{text nativeAction}}priceInfo{priceDisplayCodes{showItemPrice priceDisplayCondition finalCostByWeight}itemPrice{...price}linePrice{...price}unitPrice{...price}preDiscountedLinePrice{...price}additionalLines{name value}}discounts{label labelText{...textFragment}}itemReviewed activationCodes{label code}protectionPlanMessage{...textFragment}showSeller isShippedByWalmart seller{id name isPro}digitalDeliveryPhoneNumber addOns{...OrderAddOn}multiboxBundleId}fragment DriverFragment on Driver{id firstName photoUrl}fragment OrderGroupFragment on OrderGroup{driver{...DriverFragment}deliveryDate fulfillmentType status{...OrderGroupStatusFragment}showSeller isShippedByWalmart seller{...SellerFragment}id itemCount items{...LiteLineItemFragment}pickupPerson{firstName lastName email}accessPointId shipment{...ShipmentFragment}returnEligibilityMessage actions{...OrderGroupActionsFragment}recipientEmailAddress digitalDelivery{...DigitalDeliveryFragment}tireInstallationReservation{status extraText}}fragment OrderGroupStatusFragment on OrderGroupStatus{statusType showStatusTracker statusTracker{status label isCurrent}message{...textFragment}subtext subMessage{...textFragment}notice helpCenterText{...textFragment}}fragment textFragment on Text{parts{bold url text nativeAction lineBreak}}fragment LiteLineItemFragment on OrderLineItem{id quantity product{name usItemId imageInfo{thumbnailUrl}offerId isAlcohol}priceInfo{linePrice{...price}}}fragment SellerFragment on GroupSeller{id name isPro}fragment DigitalDeliveryFragment on DigitalDelivery{title name instructions{...textFragment}}fragment ShipmentFragment on Shipment{id trackingNumber isExternalTracking trackingUrl proofOfDelivery{photoUrl photoPreviewUrl showPreview}}fragment OrderGroupActionsFragment on OrderGroupActions{reorder edit track changeSlot checkin editDeliveryInstructions editPickupPerson editTip tip cancel enableTip{...orderActionFragment}enableEdit{...orderActionFragment}rescheduleTireInstall{...orderActionFragment}cancelTireInstall{...orderActionFragment}help viewCancellationDetails{...cancellationDetailsActionFragment}}fragment cancellationDetailsActionFragment on CancellationDetailsAction{label heading text{...textFragment}}fragment ODPGroupCategoryFragment on OrderCategory{type name subtext returnMessage substitutionsBanner{...textFragment}showExtendedSubstitutions actions{substitutions{message label type}nilPickReshop{message action{text url}}returnDetails viewCancellationDetails{...cancellationDetailsActionFragment}trackOnInHomeApp}banner{...textFragment}accordionState items{...orderLineItem}substitutions{...orderLineItem fulfilledItems{...orderLineItem}}returnInfo{...returnInfoFragment}}fragment ODPGroupFragment on OrderGroup{id fulfillmentType deliveryMessage deliveryAddress{fullName firstName lastName address{...addressFragment}}deliveryInstructions{text type typeText}deliveryPreferences{text{...textFragment}cta{...orderActionFragment}}editSubstitutionsCutOff status{statusType showStatusTracker message{...textFragment}notice helpCenterText{...textFragment}}itemCount isCategorized categories{...ODPGroupCategoryFragment}seller{id name isPro}shipment{id trackingNumber}actions{reorder edit track changeSlot checkin editDeliveryInstructions editPickupPerson tip cancel help enableTip{...orderActionFragment}enableEdit{...orderActionFragment}viewCancellationDetails{...cancellationDetailsActionFragment}enableInHome{...orderActionFragment}createGiftReceipt}cutOffTimestamp isEditSubstitutionsEligible isInHome giftDetails{recipientAddress{fullName}recipientEmail senderName giftMessage}donationDetails{...orderDonationDetails}}fragment returnInfoFragment on ReturnInfo{returnOrderId type refundPriceDetails{__typename...refundPriceDetailsFragment}refundMessage tierRefundMessage paymentMethods{__typename description cardType paymentType displayValues message{...textFragment}}actions{__typename generate scheduleOrModifyPickup{text url}reschedulePickup editPickupContact}shippingLabelUrl qrCodeImageUrl carriers{__typename id name}pickupCarrier pickupContact{nameAndAddress{fullName firstName lastName address{addressString city state postalCode addressLineOne addressLineTwo country}}phone}pickupConfirmationNumber bannerMessage{...textFragment}}fragment refundPriceDetailsFragment on RefundPriceDetails{subTotal{__typename...orderPriceDetailRowFragment}fees{__typename...orderPriceDetailRowFragment}discounts{__typename...orderPriceDetailRowFragment}taxTotal{__typename...orderPriceDetailRowFragment}grandTotal{__typename...orderPriceDetailRowFragment}}fragment orderPriceDetailRowFragment on OrderPriceDetailRow{label displayValue value info{__typename title message}}fragment addressFragment on OrderAddress{addressString addressLineOne addressLineTwo state postalCode city}fragment ODPPickupInfo on OrderGroup{pickupInstructions pickupPerson{...person}alternatePickupPerson{...person}store{id name address{...addressFragment}}}fragment person on OrderPickupPerson{firstName lastName email}fragment ODPTippingInfo on OrderGroup{addTipMessage{...textFragment}driver{...DriverFragment}tipping{min{...price}max{...price}suggested{...price}preselected}subtotal{...price}}fragment orderActionFragment on Action{text url}fragment orderCustomer on OrderCustomer{id firstName lastName email isGuest isEmailRegistered}fragment OrderFieldsFragment on Order{__typename id version type customer{...orderCustomer}displayId idBarcodeImageUrl(barWidth:3 barHeight:100) isFuelPurchase title shortTitle timezone tippableGroup{...OrderGroupFragment}amendableGroup{id changeSlotIterationsLeft cutOffTimestamp fulfillmentType deliveryAddress{fullName firstName lastName address{addressString addressLineOne addressLineTwo state postalCode city country}}isAmendInProgress}substitutionsBanner{heading subheading longSubheading}groups_2101{__typename...OrderGroupFragment...ODPGroupFragment...ODPPickupInfo...ODPTippingInfo}multiboxBundles{...orderLineItem}itemCancelReasons{__typename...cancelReason}groupCancelReasons{__typename...cancelReason}priceDetails{__typename subTotal{__typename...priceDetailFragment}taxTotal{__typename...priceDetailFragment}grandTotal{__typename...priceDetailFragment}authorizationAmount{__typename...priceDetailFragment}fees{__typename...priceDetailFragment}discounts{__typename...priceDetailFragment}minimumThreshold{__typename...price}belowMinimumFee{__typename...priceDetailFragment}driverTip{__typename...priceDetailFragment}donations{__typename...priceDetailFragment}}paymentMethods{__typename description cardType paymentType displayValues message{...textFragment}actions{connectToCapitalOne{...orderActionFragment}visitAffirm{...orderActionFragment}}}actions{__typename return pendingReturn cancel startReturn{...orderActionFragment}reorder}banners{...textFragment}}","variables":{"orderId":"6362106329171","emailAddress":"parrot_heads@yahoo.com"}}' \
  --compressed`
 
for (( i=0; i<=4; i++ ))
do
  if [[ $curl7 =~ "error"  || $curl7 =~ "blocked" ]]; then
    echo "Lỗi email số 7"
    indexOrder7=`echo error`
    break
  elif [[ `echo $curl7 | jq '.data.guestOrder.groups_2101['${i[@]}'].items[0].product.usItemId'` == '"10752553"' ]]; then
    indexOrder7=`echo $i`
    indexItem7=`echo 0`
  elif [[ `echo $curl7 | jq '.data.guestOrder.groups_2101['${i[@]}'].items[1].product.usItemId'` == '"10752553"' ]]; then
    indexOrder7=`echo $i`
    indexItem7=`echo 1`
  elif [[ `echo $curl7 | jq '.data.guestOrder.groups_2101['${i[@]}'].items[2].product.usItemId'` == '"10752553"' ]]; then
    indexOrder7=`echo $i`
    indexItem7=`echo 2`
  elif [[ `echo $curl7 | jq '.data.guestOrder.groups_2101['${i[@]}'].items[3].product.usItemId'` == '"10752553"' ]]; then
    indexOrder7=`echo $i`
    indexItem7=`echo 3`
  fi
done

if [[ $indexOrder7 != "error" ]]; then
echo $curl7 | jq '.data.guestOrder.id' >> track-OrderID.txt
echo $curl7 | jq '.data.guestOrder.customer.email' >> track-email.txt
echo $curl7 | jq '.data.guestOrder.groups_2101['$indexOrder7'].items['$indexItem7'].product.usItemId' >> track-usItemId.txt
echo $curl7 | jq '.data.guestOrder.groups_2101['$indexOrder7'].items['$indexItem7'].priceInfo.linePrice.value' >> track-priceValue.txt
echo $curl7 | jq '.data.guestOrder.groups_2101['$indexOrder7'].deliveryAddress.fullName' >> track-fullName.txt
echo $curl7 | jq '.data.guestOrder.groups_2101['$indexOrder7'].deliveryAddress.address.addressString' >> track-address.txt
echo $curl7 | jq '.data.guestOrder.groups_2101['$indexOrder7'].status.message.parts[].text' >> track-status.txt
echo $curl7 | jq '.data.guestOrder.groups_2101['$indexOrder7'].shipment.trackingNumber' >> track-number.txt
echo $curl7 | jq '.data.guestOrder.groups_2101['$indexOrder7'].shipment.trackingUrl' >> track-url.txt
fi

curl8=`curl 'https://www.walmart.com/orchestra/home/graphql' \
  -H 'authority: www.walmart.com' \
  -H 'sec-ch-ua: " Not A;Brand";v="99", "Chromium";v="96", "Microsoft Edge";v="96"' \
  -H 'x-o-platform: rweb' \
  -H 'dnt: 1' \
  -H 'x-o-correlation-id: wrvYiSFTlAmd8j7a8DDmpuyOpCN_heAnwM3v' \
  -H 'device_profile_ref_id: _s1F3NO8Y2JjaBUKPDcY4iFDWiIl9CyqiJjf' \
  -H 'x-latency-trace: 1' \
  -H 'wm_mp: true' \
  -H 'x-o-market: us' \
  -H 'x-o-platform-version: main-253-ebbb47' \
  -H 'x-o-gql-query: query getGuestOrder' \
  -H 'wm_page_url: https://www.walmart.com/orders' \
  -H 'x-apollo-operation-name: getGuestOrder' \
  -H 'sec-ch-ua-platform: "macOS"' \
  -H 'sec-ch-ua-mobile: ?0' \
  -H 'user-agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/96.0.4664.110 Safari/537.36 Edg/96.0.1054.62' \
  -H 'x-o-segment: oaoh' \
  -H 'content-type: application/json' \
  -H 'accept: application/json' \
  -H 'x-enable-server-timing: 1' \
  -H 'x-o-ccm: server' \
  -H 'wm_qos.correlation_id: wrvYiSFTlAmd8j7a8DDmpuyOpCN_heAnwM3v' \
  -H 'origin: https://www.walmart.com' \
  -H 'sec-fetch-site: same-origin' \
  -H 'sec-fetch-mode: cors' \
  -H 'sec-fetch-dest: empty' \
  -H 'referer: https://www.walmart.com/orders' \
  -H 'accept-language: vi' \
  --data-raw $'{"query":"query getGuestOrder($orderId:ID\u0021 $emailAddress:String\u0021){guestOrder(input:{id:$orderId emailAddress:$emailAddress}){...OrderFieldsFragment}}fragment cancelReason on OrderCancelReason{__typename subReasonCode subDescription}fragment priceDetailFragment on OrderPriceDetailRow{label value displayValue info{title message}rowInfo{...orderPriceDetailRowInfo}}fragment orderPriceDetailRowInfo on OrderPriceDetailRowInfo{title message{...textFragment}}fragment price on Price{displayValue value}fragment variants on MapEntry{name value}fragment OrderAddOn on OrderAddOn{lineId uniqueLineId productInfo{name usItemId offerId}quantityString quantityLabel type fulfillmentInstructions{...textFragment}actions{manageProtectionPlan{...orderActionFragment}cancel}priceInfo{linePrice{...price}}quantity isActive}fragment orderDonationDetails on OrderDonationDetails{message{...textFragment}emailReceipt emailReceiptToken status{...textFragment}errorStatus}fragment orderLineItem on OrderLineItem{id uniqueId actions{contactSeller cancel addToCart configureCake reviewItem resendEGiftCardToken protectionPlan{...orderActionFragment}manageProtectionPlan{...orderActionFragment}}isGift digitalDeliveryMessage quantity quantityString quantityLabel isSubstitutionSelected fulfilledItems{id quantityString priceInfo{itemPrice{value}}product{usItemId name}}isReturnable returnEligibilityMessage product{name usItemId imageInfo{thumbnailUrl}canonicalUrl offerId sellerId sellerName hasSellerBadge seller{sellerId name}orderLimit orderMinLimit weightIncrement salesUnit salesUnitType isSubstitutionEligible isAlcohol}reshop{reshopMessage isShippingAvailable minPromiseDate maxPromiseDate}selectedVariants{...variants}variantAdditionalInfo{parts{text nativeAction}}priceInfo{priceDisplayCodes{showItemPrice priceDisplayCondition finalCostByWeight}itemPrice{...price}linePrice{...price}unitPrice{...price}preDiscountedLinePrice{...price}additionalLines{name value}}discounts{label labelText{...textFragment}}itemReviewed activationCodes{label code}protectionPlanMessage{...textFragment}showSeller isShippedByWalmart seller{id name isPro}digitalDeliveryPhoneNumber addOns{...OrderAddOn}multiboxBundleId}fragment DriverFragment on Driver{id firstName photoUrl}fragment OrderGroupFragment on OrderGroup{driver{...DriverFragment}deliveryDate fulfillmentType status{...OrderGroupStatusFragment}showSeller isShippedByWalmart seller{...SellerFragment}id itemCount items{...LiteLineItemFragment}pickupPerson{firstName lastName email}accessPointId shipment{...ShipmentFragment}returnEligibilityMessage actions{...OrderGroupActionsFragment}recipientEmailAddress digitalDelivery{...DigitalDeliveryFragment}tireInstallationReservation{status extraText}}fragment OrderGroupStatusFragment on OrderGroupStatus{statusType showStatusTracker statusTracker{status label isCurrent}message{...textFragment}subtext subMessage{...textFragment}notice helpCenterText{...textFragment}}fragment textFragment on Text{parts{bold url text nativeAction lineBreak}}fragment LiteLineItemFragment on OrderLineItem{id quantity product{name usItemId imageInfo{thumbnailUrl}offerId isAlcohol}priceInfo{linePrice{...price}}}fragment SellerFragment on GroupSeller{id name isPro}fragment DigitalDeliveryFragment on DigitalDelivery{title name instructions{...textFragment}}fragment ShipmentFragment on Shipment{id trackingNumber isExternalTracking trackingUrl proofOfDelivery{photoUrl photoPreviewUrl showPreview}}fragment OrderGroupActionsFragment on OrderGroupActions{reorder edit track changeSlot checkin editDeliveryInstructions editPickupPerson editTip tip cancel enableTip{...orderActionFragment}enableEdit{...orderActionFragment}rescheduleTireInstall{...orderActionFragment}cancelTireInstall{...orderActionFragment}help viewCancellationDetails{...cancellationDetailsActionFragment}}fragment cancellationDetailsActionFragment on CancellationDetailsAction{label heading text{...textFragment}}fragment ODPGroupCategoryFragment on OrderCategory{type name subtext returnMessage substitutionsBanner{...textFragment}showExtendedSubstitutions actions{substitutions{message label type}nilPickReshop{message action{text url}}returnDetails viewCancellationDetails{...cancellationDetailsActionFragment}trackOnInHomeApp}banner{...textFragment}accordionState items{...orderLineItem}substitutions{...orderLineItem fulfilledItems{...orderLineItem}}returnInfo{...returnInfoFragment}}fragment ODPGroupFragment on OrderGroup{id fulfillmentType deliveryMessage deliveryAddress{fullName firstName lastName address{...addressFragment}}deliveryInstructions{text type typeText}deliveryPreferences{text{...textFragment}cta{...orderActionFragment}}editSubstitutionsCutOff status{statusType showStatusTracker message{...textFragment}notice helpCenterText{...textFragment}}itemCount isCategorized categories{...ODPGroupCategoryFragment}seller{id name isPro}shipment{id trackingNumber}actions{reorder edit track changeSlot checkin editDeliveryInstructions editPickupPerson tip cancel help enableTip{...orderActionFragment}enableEdit{...orderActionFragment}viewCancellationDetails{...cancellationDetailsActionFragment}enableInHome{...orderActionFragment}createGiftReceipt}cutOffTimestamp isEditSubstitutionsEligible isInHome giftDetails{recipientAddress{fullName}recipientEmail senderName giftMessage}donationDetails{...orderDonationDetails}}fragment returnInfoFragment on ReturnInfo{returnOrderId type refundPriceDetails{__typename...refundPriceDetailsFragment}refundMessage tierRefundMessage paymentMethods{__typename description cardType paymentType displayValues message{...textFragment}}actions{__typename generate scheduleOrModifyPickup{text url}reschedulePickup editPickupContact}shippingLabelUrl qrCodeImageUrl carriers{__typename id name}pickupCarrier pickupContact{nameAndAddress{fullName firstName lastName address{addressString city state postalCode addressLineOne addressLineTwo country}}phone}pickupConfirmationNumber bannerMessage{...textFragment}}fragment refundPriceDetailsFragment on RefundPriceDetails{subTotal{__typename...orderPriceDetailRowFragment}fees{__typename...orderPriceDetailRowFragment}discounts{__typename...orderPriceDetailRowFragment}taxTotal{__typename...orderPriceDetailRowFragment}grandTotal{__typename...orderPriceDetailRowFragment}}fragment orderPriceDetailRowFragment on OrderPriceDetailRow{label displayValue value info{__typename title message}}fragment addressFragment on OrderAddress{addressString addressLineOne addressLineTwo state postalCode city}fragment ODPPickupInfo on OrderGroup{pickupInstructions pickupPerson{...person}alternatePickupPerson{...person}store{id name address{...addressFragment}}}fragment person on OrderPickupPerson{firstName lastName email}fragment ODPTippingInfo on OrderGroup{addTipMessage{...textFragment}driver{...DriverFragment}tipping{min{...price}max{...price}suggested{...price}preselected}subtotal{...price}}fragment orderActionFragment on Action{text url}fragment orderCustomer on OrderCustomer{id firstName lastName email isGuest isEmailRegistered}fragment OrderFieldsFragment on Order{__typename id version type customer{...orderCustomer}displayId idBarcodeImageUrl(barWidth:3 barHeight:100) isFuelPurchase title shortTitle timezone tippableGroup{...OrderGroupFragment}amendableGroup{id changeSlotIterationsLeft cutOffTimestamp fulfillmentType deliveryAddress{fullName firstName lastName address{addressString addressLineOne addressLineTwo state postalCode city country}}isAmendInProgress}substitutionsBanner{heading subheading longSubheading}groups_2101{__typename...OrderGroupFragment...ODPGroupFragment...ODPPickupInfo...ODPTippingInfo}multiboxBundles{...orderLineItem}itemCancelReasons{__typename...cancelReason}groupCancelReasons{__typename...cancelReason}priceDetails{__typename subTotal{__typename...priceDetailFragment}taxTotal{__typename...priceDetailFragment}grandTotal{__typename...priceDetailFragment}authorizationAmount{__typename...priceDetailFragment}fees{__typename...priceDetailFragment}discounts{__typename...priceDetailFragment}minimumThreshold{__typename...price}belowMinimumFee{__typename...priceDetailFragment}driverTip{__typename...priceDetailFragment}donations{__typename...priceDetailFragment}}paymentMethods{__typename description cardType paymentType displayValues message{...textFragment}actions{connectToCapitalOne{...orderActionFragment}visitAffirm{...orderActionFragment}}}actions{__typename return pendingReturn cancel startReturn{...orderActionFragment}reorder}banners{...textFragment}}","variables":{"orderId":"2812229603092","emailAddress":"laurieniggel@yahoo.com"}}' \
  --compressed`
 
for (( i=0; i<=4; i++ ))
do
  if [[ $curl8 =~ "error"  || $curl8 =~ "blocked" ]]; then
    echo "Lỗi email số 8"
    indexOrder8=`echo error`
    break
  elif [[ `echo $curl8 | jq '.data.guestOrder.groups_2101['${i[@]}'].items[0].product.usItemId'` == '"129706644"' ]]; then
    indexOrder8=`echo $i`
    indexItem8=`echo 0`
  elif [[ `echo $curl8 | jq '.data.guestOrder.groups_2101['${i[@]}'].items[1].product.usItemId'` == '"129706644"' ]]; then
    indexOrder8=`echo $i`
    indexItem8=`echo 1`
  elif [[ `echo $curl8 | jq '.data.guestOrder.groups_2101['${i[@]}'].items[2].product.usItemId'` == '"129706644"' ]]; then
    indexOrder8=`echo $i`
    indexItem8=`echo 2`
  elif [[ `echo $curl8 | jq '.data.guestOrder.groups_2101['${i[@]}'].items[3].product.usItemId'` == '"129706644"' ]]; then
    indexOrder8=`echo $i`
    indexItem8=`echo 3`
  fi
done

if [[ $indexOrder8 != "error" ]]; then
echo $curl8 | jq '.data.guestOrder.id' >> track-OrderID.txt
echo $curl8 | jq '.data.guestOrder.customer.email' >> track-email.txt
echo $curl8 | jq '.data.guestOrder.groups_2101['$indexOrder8'].items['$indexItem8'].product.usItemId' >> track-usItemId.txt
echo $curl8 | jq '.data.guestOrder.groups_2101['$indexOrder8'].items['$indexItem8'].priceInfo.linePrice.value' >> track-priceValue.txt
echo $curl8 | jq '.data.guestOrder.groups_2101['$indexOrder8'].deliveryAddress.fullName' >> track-fullName.txt
echo $curl8 | jq '.data.guestOrder.groups_2101['$indexOrder8'].deliveryAddress.address.addressString' >> track-address.txt
echo $curl8 | jq '.data.guestOrder.groups_2101['$indexOrder8'].status.message.parts[].text' >> track-status.txt
echo $curl8 | jq '.data.guestOrder.groups_2101['$indexOrder8'].shipment.trackingNumber' >> track-number.txt
echo $curl8 | jq '.data.guestOrder.groups_2101['$indexOrder8'].shipment.trackingUrl' >> track-url.txt
fi

curl9=`curl 'https://www.walmart.com/orchestra/home/graphql' \
  -H 'authority: www.walmart.com' \
  -H 'sec-ch-ua: " Not A;Brand";v="99", "Chromium";v="96", "Microsoft Edge";v="96"' \
  -H 'x-o-platform: rweb' \
  -H 'dnt: 1' \
  -H 'x-o-correlation-id: wrvYiSFTlAmd8j7a8DDmpuyOpCN_heAnwM3v' \
  -H 'device_profile_ref_id: _s1F3NO8Y2JjaBUKPDcY4iFDWiIl9CyqiJjf' \
  -H 'x-latency-trace: 1' \
  -H 'wm_mp: true' \
  -H 'x-o-market: us' \
  -H 'x-o-platform-version: main-253-ebbb47' \
  -H 'x-o-gql-query: query getGuestOrder' \
  -H 'wm_page_url: https://www.walmart.com/orders' \
  -H 'x-apollo-operation-name: getGuestOrder' \
  -H 'sec-ch-ua-platform: "macOS"' \
  -H 'sec-ch-ua-mobile: ?0' \
  -H 'user-agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/96.0.4664.110 Safari/537.36 Edg/96.0.1054.62' \
  -H 'x-o-segment: oaoh' \
  -H 'content-type: application/json' \
  -H 'accept: application/json' \
  -H 'x-enable-server-timing: 1' \
  -H 'x-o-ccm: server' \
  -H 'wm_qos.correlation_id: wrvYiSFTlAmd8j7a8DDmpuyOpCN_heAnwM3v' \
  -H 'origin: https://www.walmart.com' \
  -H 'sec-fetch-site: same-origin' \
  -H 'sec-fetch-mode: cors' \
  -H 'sec-fetch-dest: empty' \
  -H 'referer: https://www.walmart.com/orders' \
  -H 'accept-language: vi' \
  --data-raw $'{"query":"query getGuestOrder($orderId:ID\u0021 $emailAddress:String\u0021){guestOrder(input:{id:$orderId emailAddress:$emailAddress}){...OrderFieldsFragment}}fragment cancelReason on OrderCancelReason{__typename subReasonCode subDescription}fragment priceDetailFragment on OrderPriceDetailRow{label value displayValue info{title message}rowInfo{...orderPriceDetailRowInfo}}fragment orderPriceDetailRowInfo on OrderPriceDetailRowInfo{title message{...textFragment}}fragment price on Price{displayValue value}fragment variants on MapEntry{name value}fragment OrderAddOn on OrderAddOn{lineId uniqueLineId productInfo{name usItemId offerId}quantityString quantityLabel type fulfillmentInstructions{...textFragment}actions{manageProtectionPlan{...orderActionFragment}cancel}priceInfo{linePrice{...price}}quantity isActive}fragment orderDonationDetails on OrderDonationDetails{message{...textFragment}emailReceipt emailReceiptToken status{...textFragment}errorStatus}fragment orderLineItem on OrderLineItem{id uniqueId actions{contactSeller cancel addToCart configureCake reviewItem resendEGiftCardToken protectionPlan{...orderActionFragment}manageProtectionPlan{...orderActionFragment}}isGift digitalDeliveryMessage quantity quantityString quantityLabel isSubstitutionSelected fulfilledItems{id quantityString priceInfo{itemPrice{value}}product{usItemId name}}isReturnable returnEligibilityMessage product{name usItemId imageInfo{thumbnailUrl}canonicalUrl offerId sellerId sellerName hasSellerBadge seller{sellerId name}orderLimit orderMinLimit weightIncrement salesUnit salesUnitType isSubstitutionEligible isAlcohol}reshop{reshopMessage isShippingAvailable minPromiseDate maxPromiseDate}selectedVariants{...variants}variantAdditionalInfo{parts{text nativeAction}}priceInfo{priceDisplayCodes{showItemPrice priceDisplayCondition finalCostByWeight}itemPrice{...price}linePrice{...price}unitPrice{...price}preDiscountedLinePrice{...price}additionalLines{name value}}discounts{label labelText{...textFragment}}itemReviewed activationCodes{label code}protectionPlanMessage{...textFragment}showSeller isShippedByWalmart seller{id name isPro}digitalDeliveryPhoneNumber addOns{...OrderAddOn}multiboxBundleId}fragment DriverFragment on Driver{id firstName photoUrl}fragment OrderGroupFragment on OrderGroup{driver{...DriverFragment}deliveryDate fulfillmentType status{...OrderGroupStatusFragment}showSeller isShippedByWalmart seller{...SellerFragment}id itemCount items{...LiteLineItemFragment}pickupPerson{firstName lastName email}accessPointId shipment{...ShipmentFragment}returnEligibilityMessage actions{...OrderGroupActionsFragment}recipientEmailAddress digitalDelivery{...DigitalDeliveryFragment}tireInstallationReservation{status extraText}}fragment OrderGroupStatusFragment on OrderGroupStatus{statusType showStatusTracker statusTracker{status label isCurrent}message{...textFragment}subtext subMessage{...textFragment}notice helpCenterText{...textFragment}}fragment textFragment on Text{parts{bold url text nativeAction lineBreak}}fragment LiteLineItemFragment on OrderLineItem{id quantity product{name usItemId imageInfo{thumbnailUrl}offerId isAlcohol}priceInfo{linePrice{...price}}}fragment SellerFragment on GroupSeller{id name isPro}fragment DigitalDeliveryFragment on DigitalDelivery{title name instructions{...textFragment}}fragment ShipmentFragment on Shipment{id trackingNumber isExternalTracking trackingUrl proofOfDelivery{photoUrl photoPreviewUrl showPreview}}fragment OrderGroupActionsFragment on OrderGroupActions{reorder edit track changeSlot checkin editDeliveryInstructions editPickupPerson editTip tip cancel enableTip{...orderActionFragment}enableEdit{...orderActionFragment}rescheduleTireInstall{...orderActionFragment}cancelTireInstall{...orderActionFragment}help viewCancellationDetails{...cancellationDetailsActionFragment}}fragment cancellationDetailsActionFragment on CancellationDetailsAction{label heading text{...textFragment}}fragment ODPGroupCategoryFragment on OrderCategory{type name subtext returnMessage substitutionsBanner{...textFragment}showExtendedSubstitutions actions{substitutions{message label type}nilPickReshop{message action{text url}}returnDetails viewCancellationDetails{...cancellationDetailsActionFragment}trackOnInHomeApp}banner{...textFragment}accordionState items{...orderLineItem}substitutions{...orderLineItem fulfilledItems{...orderLineItem}}returnInfo{...returnInfoFragment}}fragment ODPGroupFragment on OrderGroup{id fulfillmentType deliveryMessage deliveryAddress{fullName firstName lastName address{...addressFragment}}deliveryInstructions{text type typeText}deliveryPreferences{text{...textFragment}cta{...orderActionFragment}}editSubstitutionsCutOff status{statusType showStatusTracker message{...textFragment}notice helpCenterText{...textFragment}}itemCount isCategorized categories{...ODPGroupCategoryFragment}seller{id name isPro}shipment{id trackingNumber}actions{reorder edit track changeSlot checkin editDeliveryInstructions editPickupPerson tip cancel help enableTip{...orderActionFragment}enableEdit{...orderActionFragment}viewCancellationDetails{...cancellationDetailsActionFragment}enableInHome{...orderActionFragment}createGiftReceipt}cutOffTimestamp isEditSubstitutionsEligible isInHome giftDetails{recipientAddress{fullName}recipientEmail senderName giftMessage}donationDetails{...orderDonationDetails}}fragment returnInfoFragment on ReturnInfo{returnOrderId type refundPriceDetails{__typename...refundPriceDetailsFragment}refundMessage tierRefundMessage paymentMethods{__typename description cardType paymentType displayValues message{...textFragment}}actions{__typename generate scheduleOrModifyPickup{text url}reschedulePickup editPickupContact}shippingLabelUrl qrCodeImageUrl carriers{__typename id name}pickupCarrier pickupContact{nameAndAddress{fullName firstName lastName address{addressString city state postalCode addressLineOne addressLineTwo country}}phone}pickupConfirmationNumber bannerMessage{...textFragment}}fragment refundPriceDetailsFragment on RefundPriceDetails{subTotal{__typename...orderPriceDetailRowFragment}fees{__typename...orderPriceDetailRowFragment}discounts{__typename...orderPriceDetailRowFragment}taxTotal{__typename...orderPriceDetailRowFragment}grandTotal{__typename...orderPriceDetailRowFragment}}fragment orderPriceDetailRowFragment on OrderPriceDetailRow{label displayValue value info{__typename title message}}fragment addressFragment on OrderAddress{addressString addressLineOne addressLineTwo state postalCode city}fragment ODPPickupInfo on OrderGroup{pickupInstructions pickupPerson{...person}alternatePickupPerson{...person}store{id name address{...addressFragment}}}fragment person on OrderPickupPerson{firstName lastName email}fragment ODPTippingInfo on OrderGroup{addTipMessage{...textFragment}driver{...DriverFragment}tipping{min{...price}max{...price}suggested{...price}preselected}subtotal{...price}}fragment orderActionFragment on Action{text url}fragment orderCustomer on OrderCustomer{id firstName lastName email isGuest isEmailRegistered}fragment OrderFieldsFragment on Order{__typename id version type customer{...orderCustomer}displayId idBarcodeImageUrl(barWidth:3 barHeight:100) isFuelPurchase title shortTitle timezone tippableGroup{...OrderGroupFragment}amendableGroup{id changeSlotIterationsLeft cutOffTimestamp fulfillmentType deliveryAddress{fullName firstName lastName address{addressString addressLineOne addressLineTwo state postalCode city country}}isAmendInProgress}substitutionsBanner{heading subheading longSubheading}groups_2101{__typename...OrderGroupFragment...ODPGroupFragment...ODPPickupInfo...ODPTippingInfo}multiboxBundles{...orderLineItem}itemCancelReasons{__typename...cancelReason}groupCancelReasons{__typename...cancelReason}priceDetails{__typename subTotal{__typename...priceDetailFragment}taxTotal{__typename...priceDetailFragment}grandTotal{__typename...priceDetailFragment}authorizationAmount{__typename...priceDetailFragment}fees{__typename...priceDetailFragment}discounts{__typename...priceDetailFragment}minimumThreshold{__typename...price}belowMinimumFee{__typename...priceDetailFragment}driverTip{__typename...priceDetailFragment}donations{__typename...priceDetailFragment}}paymentMethods{__typename description cardType paymentType displayValues message{...textFragment}actions{connectToCapitalOne{...orderActionFragment}visitAffirm{...orderActionFragment}}}actions{__typename return pendingReturn cancel startReturn{...orderActionFragment}reorder}banners{...textFragment}}","variables":{"orderId":"2852237309140","emailAddress":"robertwoodarnold27@hotmail.com"}}' \
  --compressed`
 
for (( i=0; i<=4; i++ ))
do
  if [[ $curl9 =~ "error"  || $curl9 =~ "blocked" ]]; then
    echo "Lỗi email số 9"
    indexOrder9=`echo error`
    break
  elif [[ `echo $curl9 | jq '.data.guestOrder.groups_2101['${i[@]}'].items[0].product.usItemId'` == '"766799843"' ]]; then
    indexOrder9=`echo $i`
    indexItem9=`echo 0`
  elif [[ `echo $curl9 | jq '.data.guestOrder.groups_2101['${i[@]}'].items[1].product.usItemId'` == '"766799843"' ]]; then
    indexOrder9=`echo $i`
    indexItem9=`echo 1`
  elif [[ `echo $curl9 | jq '.data.guestOrder.groups_2101['${i[@]}'].items[2].product.usItemId'` == '"766799843"' ]]; then
    indexOrder9=`echo $i`
    indexItem9=`echo 2`
  elif [[ `echo $curl9 | jq '.data.guestOrder.groups_2101['${i[@]}'].items[3].product.usItemId'` == '"766799843"' ]]; then
    indexOrder9=`echo $i`
    indexItem9=`echo 3`
  fi
done

if [[ $indexOrder9 != "error" ]]; then
echo $curl9 | jq '.data.guestOrder.id' >> track-OrderID.txt
echo $curl9 | jq '.data.guestOrder.customer.email' >> track-email.txt
echo $curl9 | jq '.data.guestOrder.groups_2101['$indexOrder9'].items['$indexItem9'].product.usItemId' >> track-usItemId.txt
echo $curl9 | jq '.data.guestOrder.groups_2101['$indexOrder9'].items['$indexItem9'].priceInfo.linePrice.value' >> track-priceValue.txt
echo $curl9 | jq '.data.guestOrder.groups_2101['$indexOrder9'].deliveryAddress.fullName' >> track-fullName.txt
echo $curl9 | jq '.data.guestOrder.groups_2101['$indexOrder9'].deliveryAddress.address.addressString' >> track-address.txt
echo $curl9 | jq '.data.guestOrder.groups_2101['$indexOrder9'].status.message.parts[].text' >> track-status.txt
echo $curl9 | jq '.data.guestOrder.groups_2101['$indexOrder9'].shipment.trackingNumber' >> track-number.txt
echo $curl9 | jq '.data.guestOrder.groups_2101['$indexOrder9'].shipment.trackingUrl' >> track-url.txt
fi

curl10=`curl 'https://www.walmart.com/orchestra/home/graphql' \
  -H 'authority: www.walmart.com' \
  -H 'sec-ch-ua: " Not A;Brand";v="99", "Chromium";v="96", "Microsoft Edge";v="96"' \
  -H 'x-o-platform: rweb' \
  -H 'dnt: 1' \
  -H 'x-o-correlation-id: wrvYiSFTlAmd8j7a8DDmpuyOpCN_heAnwM3v' \
  -H 'device_profile_ref_id: _s1F3NO8Y2JjaBUKPDcY4iFDWiIl9CyqiJjf' \
  -H 'x-latency-trace: 1' \
  -H 'wm_mp: true' \
  -H 'x-o-market: us' \
  -H 'x-o-platform-version: main-253-ebbb47' \
  -H 'x-o-gql-query: query getGuestOrder' \
  -H 'wm_page_url: https://www.walmart.com/orders' \
  -H 'x-apollo-operation-name: getGuestOrder' \
  -H 'sec-ch-ua-platform: "macOS"' \
  -H 'sec-ch-ua-mobile: ?0' \
  -H 'user-agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/96.0.4664.110 Safari/537.36 Edg/96.0.1054.62' \
  -H 'x-o-segment: oaoh' \
  -H 'content-type: application/json' \
  -H 'accept: application/json' \
  -H 'x-enable-server-timing: 1' \
  -H 'x-o-ccm: server' \
  -H 'wm_qos.correlation_id: wrvYiSFTlAmd8j7a8DDmpuyOpCN_heAnwM3v' \
  -H 'origin: https://www.walmart.com' \
  -H 'sec-fetch-site: same-origin' \
  -H 'sec-fetch-mode: cors' \
  -H 'sec-fetch-dest: empty' \
  -H 'referer: https://www.walmart.com/orders' \
  -H 'accept-language: vi' \
  --data-raw $'{"query":"query getGuestOrder($orderId:ID\u0021 $emailAddress:String\u0021){guestOrder(input:{id:$orderId emailAddress:$emailAddress}){...OrderFieldsFragment}}fragment cancelReason on OrderCancelReason{__typename subReasonCode subDescription}fragment priceDetailFragment on OrderPriceDetailRow{label value displayValue info{title message}rowInfo{...orderPriceDetailRowInfo}}fragment orderPriceDetailRowInfo on OrderPriceDetailRowInfo{title message{...textFragment}}fragment price on Price{displayValue value}fragment variants on MapEntry{name value}fragment OrderAddOn on OrderAddOn{lineId uniqueLineId productInfo{name usItemId offerId}quantityString quantityLabel type fulfillmentInstructions{...textFragment}actions{manageProtectionPlan{...orderActionFragment}cancel}priceInfo{linePrice{...price}}quantity isActive}fragment orderDonationDetails on OrderDonationDetails{message{...textFragment}emailReceipt emailReceiptToken status{...textFragment}errorStatus}fragment orderLineItem on OrderLineItem{id uniqueId actions{contactSeller cancel addToCart configureCake reviewItem resendEGiftCardToken protectionPlan{...orderActionFragment}manageProtectionPlan{...orderActionFragment}}isGift digitalDeliveryMessage quantity quantityString quantityLabel isSubstitutionSelected fulfilledItems{id quantityString priceInfo{itemPrice{value}}product{usItemId name}}isReturnable returnEligibilityMessage product{name usItemId imageInfo{thumbnailUrl}canonicalUrl offerId sellerId sellerName hasSellerBadge seller{sellerId name}orderLimit orderMinLimit weightIncrement salesUnit salesUnitType isSubstitutionEligible isAlcohol}reshop{reshopMessage isShippingAvailable minPromiseDate maxPromiseDate}selectedVariants{...variants}variantAdditionalInfo{parts{text nativeAction}}priceInfo{priceDisplayCodes{showItemPrice priceDisplayCondition finalCostByWeight}itemPrice{...price}linePrice{...price}unitPrice{...price}preDiscountedLinePrice{...price}additionalLines{name value}}discounts{label labelText{...textFragment}}itemReviewed activationCodes{label code}protectionPlanMessage{...textFragment}showSeller isShippedByWalmart seller{id name isPro}digitalDeliveryPhoneNumber addOns{...OrderAddOn}multiboxBundleId}fragment DriverFragment on Driver{id firstName photoUrl}fragment OrderGroupFragment on OrderGroup{driver{...DriverFragment}deliveryDate fulfillmentType status{...OrderGroupStatusFragment}showSeller isShippedByWalmart seller{...SellerFragment}id itemCount items{...LiteLineItemFragment}pickupPerson{firstName lastName email}accessPointId shipment{...ShipmentFragment}returnEligibilityMessage actions{...OrderGroupActionsFragment}recipientEmailAddress digitalDelivery{...DigitalDeliveryFragment}tireInstallationReservation{status extraText}}fragment OrderGroupStatusFragment on OrderGroupStatus{statusType showStatusTracker statusTracker{status label isCurrent}message{...textFragment}subtext subMessage{...textFragment}notice helpCenterText{...textFragment}}fragment textFragment on Text{parts{bold url text nativeAction lineBreak}}fragment LiteLineItemFragment on OrderLineItem{id quantity product{name usItemId imageInfo{thumbnailUrl}offerId isAlcohol}priceInfo{linePrice{...price}}}fragment SellerFragment on GroupSeller{id name isPro}fragment DigitalDeliveryFragment on DigitalDelivery{title name instructions{...textFragment}}fragment ShipmentFragment on Shipment{id trackingNumber isExternalTracking trackingUrl proofOfDelivery{photoUrl photoPreviewUrl showPreview}}fragment OrderGroupActionsFragment on OrderGroupActions{reorder edit track changeSlot checkin editDeliveryInstructions editPickupPerson editTip tip cancel enableTip{...orderActionFragment}enableEdit{...orderActionFragment}rescheduleTireInstall{...orderActionFragment}cancelTireInstall{...orderActionFragment}help viewCancellationDetails{...cancellationDetailsActionFragment}}fragment cancellationDetailsActionFragment on CancellationDetailsAction{label heading text{...textFragment}}fragment ODPGroupCategoryFragment on OrderCategory{type name subtext returnMessage substitutionsBanner{...textFragment}showExtendedSubstitutions actions{substitutions{message label type}nilPickReshop{message action{text url}}returnDetails viewCancellationDetails{...cancellationDetailsActionFragment}trackOnInHomeApp}banner{...textFragment}accordionState items{...orderLineItem}substitutions{...orderLineItem fulfilledItems{...orderLineItem}}returnInfo{...returnInfoFragment}}fragment ODPGroupFragment on OrderGroup{id fulfillmentType deliveryMessage deliveryAddress{fullName firstName lastName address{...addressFragment}}deliveryInstructions{text type typeText}deliveryPreferences{text{...textFragment}cta{...orderActionFragment}}editSubstitutionsCutOff status{statusType showStatusTracker message{...textFragment}notice helpCenterText{...textFragment}}itemCount isCategorized categories{...ODPGroupCategoryFragment}seller{id name isPro}shipment{id trackingNumber}actions{reorder edit track changeSlot checkin editDeliveryInstructions editPickupPerson tip cancel help enableTip{...orderActionFragment}enableEdit{...orderActionFragment}viewCancellationDetails{...cancellationDetailsActionFragment}enableInHome{...orderActionFragment}createGiftReceipt}cutOffTimestamp isEditSubstitutionsEligible isInHome giftDetails{recipientAddress{fullName}recipientEmail senderName giftMessage}donationDetails{...orderDonationDetails}}fragment returnInfoFragment on ReturnInfo{returnOrderId type refundPriceDetails{__typename...refundPriceDetailsFragment}refundMessage tierRefundMessage paymentMethods{__typename description cardType paymentType displayValues message{...textFragment}}actions{__typename generate scheduleOrModifyPickup{text url}reschedulePickup editPickupContact}shippingLabelUrl qrCodeImageUrl carriers{__typename id name}pickupCarrier pickupContact{nameAndAddress{fullName firstName lastName address{addressString city state postalCode addressLineOne addressLineTwo country}}phone}pickupConfirmationNumber bannerMessage{...textFragment}}fragment refundPriceDetailsFragment on RefundPriceDetails{subTotal{__typename...orderPriceDetailRowFragment}fees{__typename...orderPriceDetailRowFragment}discounts{__typename...orderPriceDetailRowFragment}taxTotal{__typename...orderPriceDetailRowFragment}grandTotal{__typename...orderPriceDetailRowFragment}}fragment orderPriceDetailRowFragment on OrderPriceDetailRow{label displayValue value info{__typename title message}}fragment addressFragment on OrderAddress{addressString addressLineOne addressLineTwo state postalCode city}fragment ODPPickupInfo on OrderGroup{pickupInstructions pickupPerson{...person}alternatePickupPerson{...person}store{id name address{...addressFragment}}}fragment person on OrderPickupPerson{firstName lastName email}fragment ODPTippingInfo on OrderGroup{addTipMessage{...textFragment}driver{...DriverFragment}tipping{min{...price}max{...price}suggested{...price}preselected}subtotal{...price}}fragment orderActionFragment on Action{text url}fragment orderCustomer on OrderCustomer{id firstName lastName email isGuest isEmailRegistered}fragment OrderFieldsFragment on Order{__typename id version type customer{...orderCustomer}displayId idBarcodeImageUrl(barWidth:3 barHeight:100) isFuelPurchase title shortTitle timezone tippableGroup{...OrderGroupFragment}amendableGroup{id changeSlotIterationsLeft cutOffTimestamp fulfillmentType deliveryAddress{fullName firstName lastName address{addressString addressLineOne addressLineTwo state postalCode city country}}isAmendInProgress}substitutionsBanner{heading subheading longSubheading}groups_2101{__typename...OrderGroupFragment...ODPGroupFragment...ODPPickupInfo...ODPTippingInfo}multiboxBundles{...orderLineItem}itemCancelReasons{__typename...cancelReason}groupCancelReasons{__typename...cancelReason}priceDetails{__typename subTotal{__typename...priceDetailFragment}taxTotal{__typename...priceDetailFragment}grandTotal{__typename...priceDetailFragment}authorizationAmount{__typename...priceDetailFragment}fees{__typename...priceDetailFragment}discounts{__typename...priceDetailFragment}minimumThreshold{__typename...price}belowMinimumFee{__typename...priceDetailFragment}driverTip{__typename...priceDetailFragment}donations{__typename...priceDetailFragment}}paymentMethods{__typename description cardType paymentType displayValues message{...textFragment}actions{connectToCapitalOne{...orderActionFragment}visitAffirm{...orderActionFragment}}}actions{__typename return pendingReturn cancel startReturn{...orderActionFragment}reorder}banners{...textFragment}}","variables":{"orderId":"2832234748535","emailAddress":"wmlucey@hotmail.com"}}' \
  --compressed`
 
for (( i=0; i<=4; i++ ))
do
  if [[ $curl10 =~ "error"  || $curl10 =~ "blocked" ]]; then
    echo "Lỗi email số 10"
    indexOrder10=`echo error`
    break
  elif [[ `echo $curl10 | jq '.data.guestOrder.groups_2101['${i[@]}'].items[0].product.usItemId'` == '"10752553"' ]]; then
    indexOrder10=`echo $i`
    indexItem10=`echo 0`
  elif [[ `echo $curl10 | jq '.data.guestOrder.groups_2101['${i[@]}'].items[1].product.usItemId'` == '"10752553"' ]]; then
    indexOrder10=`echo $i`
    indexItem10=`echo 1`
  elif [[ `echo $curl10 | jq '.data.guestOrder.groups_2101['${i[@]}'].items[2].product.usItemId'` == '"10752553"' ]]; then
    indexOrder10=`echo $i`
    indexItem10=`echo 2`
  elif [[ `echo $curl10 | jq '.data.guestOrder.groups_2101['${i[@]}'].items[3].product.usItemId'` == '"10752553"' ]]; then
    indexOrder10=`echo $i`
    indexItem10=`echo 3`
  fi
done

if [[ $indexOrder10 != "error" ]]; then
echo $curl10 | jq '.data.guestOrder.id' >> track-OrderID.txt
echo $curl10 | jq '.data.guestOrder.customer.email' >> track-email.txt
echo $curl10 | jq '.data.guestOrder.groups_2101['$indexOrder10'].items['$indexItem10'].product.usItemId' >> track-usItemId.txt
echo $curl10 | jq '.data.guestOrder.groups_2101['$indexOrder10'].items['$indexItem10'].priceInfo.linePrice.value' >> track-priceValue.txt
echo $curl10 | jq '.data.guestOrder.groups_2101['$indexOrder10'].deliveryAddress.fullName' >> track-fullName.txt
echo $curl10 | jq '.data.guestOrder.groups_2101['$indexOrder10'].deliveryAddress.address.addressString' >> track-address.txt
echo $curl10 | jq '.data.guestOrder.groups_2101['$indexOrder10'].status.message.parts[].text' >> track-status.txt
echo $curl10 | jq '.data.guestOrder.groups_2101['$indexOrder10'].shipment.trackingNumber' >> track-number.txt
echo $curl10 | jq '.data.guestOrder.groups_2101['$indexOrder10'].shipment.trackingUrl' >> track-url.txt
fi

curl11=`curl 'https://www.walmart.com/orchestra/home/graphql' \
  -H 'authority: www.walmart.com' \
  -H 'sec-ch-ua: " Not A;Brand";v="99", "Chromium";v="96", "Microsoft Edge";v="96"' \
  -H 'x-o-platform: rweb' \
  -H 'dnt: 1' \
  -H 'x-o-correlation-id: wrvYiSFTlAmd8j7a8DDmpuyOpCN_heAnwM3v' \
  -H 'device_profile_ref_id: _s1F3NO8Y2JjaBUKPDcY4iFDWiIl9CyqiJjf' \
  -H 'x-latency-trace: 1' \
  -H 'wm_mp: true' \
  -H 'x-o-market: us' \
  -H 'x-o-platform-version: main-253-ebbb47' \
  -H 'x-o-gql-query: query getGuestOrder' \
  -H 'wm_page_url: https://www.walmart.com/orders' \
  -H 'x-apollo-operation-name: getGuestOrder' \
  -H 'sec-ch-ua-platform: "macOS"' \
  -H 'sec-ch-ua-mobile: ?0' \
  -H 'user-agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/96.0.4664.110 Safari/537.36 Edg/96.0.1054.62' \
  -H 'x-o-segment: oaoh' \
  -H 'content-type: application/json' \
  -H 'accept: application/json' \
  -H 'x-enable-server-timing: 1' \
  -H 'x-o-ccm: server' \
  -H 'wm_qos.correlation_id: wrvYiSFTlAmd8j7a8DDmpuyOpCN_heAnwM3v' \
  -H 'origin: https://www.walmart.com' \
  -H 'sec-fetch-site: same-origin' \
  -H 'sec-fetch-mode: cors' \
  -H 'sec-fetch-dest: empty' \
  -H 'referer: https://www.walmart.com/orders' \
  -H 'accept-language: vi' \
  --data-raw $'{"query":"query getGuestOrder($orderId:ID\u0021 $emailAddress:String\u0021){guestOrder(input:{id:$orderId emailAddress:$emailAddress}){...OrderFieldsFragment}}fragment cancelReason on OrderCancelReason{__typename subReasonCode subDescription}fragment priceDetailFragment on OrderPriceDetailRow{label value displayValue info{title message}rowInfo{...orderPriceDetailRowInfo}}fragment orderPriceDetailRowInfo on OrderPriceDetailRowInfo{title message{...textFragment}}fragment price on Price{displayValue value}fragment variants on MapEntry{name value}fragment OrderAddOn on OrderAddOn{lineId uniqueLineId productInfo{name usItemId offerId}quantityString quantityLabel type fulfillmentInstructions{...textFragment}actions{manageProtectionPlan{...orderActionFragment}cancel}priceInfo{linePrice{...price}}quantity isActive}fragment orderDonationDetails on OrderDonationDetails{message{...textFragment}emailReceipt emailReceiptToken status{...textFragment}errorStatus}fragment orderLineItem on OrderLineItem{id uniqueId actions{contactSeller cancel addToCart configureCake reviewItem resendEGiftCardToken protectionPlan{...orderActionFragment}manageProtectionPlan{...orderActionFragment}}isGift digitalDeliveryMessage quantity quantityString quantityLabel isSubstitutionSelected fulfilledItems{id quantityString priceInfo{itemPrice{value}}product{usItemId name}}isReturnable returnEligibilityMessage product{name usItemId imageInfo{thumbnailUrl}canonicalUrl offerId sellerId sellerName hasSellerBadge seller{sellerId name}orderLimit orderMinLimit weightIncrement salesUnit salesUnitType isSubstitutionEligible isAlcohol}reshop{reshopMessage isShippingAvailable minPromiseDate maxPromiseDate}selectedVariants{...variants}variantAdditionalInfo{parts{text nativeAction}}priceInfo{priceDisplayCodes{showItemPrice priceDisplayCondition finalCostByWeight}itemPrice{...price}linePrice{...price}unitPrice{...price}preDiscountedLinePrice{...price}additionalLines{name value}}discounts{label labelText{...textFragment}}itemReviewed activationCodes{label code}protectionPlanMessage{...textFragment}showSeller isShippedByWalmart seller{id name isPro}digitalDeliveryPhoneNumber addOns{...OrderAddOn}multiboxBundleId}fragment DriverFragment on Driver{id firstName photoUrl}fragment OrderGroupFragment on OrderGroup{driver{...DriverFragment}deliveryDate fulfillmentType status{...OrderGroupStatusFragment}showSeller isShippedByWalmart seller{...SellerFragment}id itemCount items{...LiteLineItemFragment}pickupPerson{firstName lastName email}accessPointId shipment{...ShipmentFragment}returnEligibilityMessage actions{...OrderGroupActionsFragment}recipientEmailAddress digitalDelivery{...DigitalDeliveryFragment}tireInstallationReservation{status extraText}}fragment OrderGroupStatusFragment on OrderGroupStatus{statusType showStatusTracker statusTracker{status label isCurrent}message{...textFragment}subtext subMessage{...textFragment}notice helpCenterText{...textFragment}}fragment textFragment on Text{parts{bold url text nativeAction lineBreak}}fragment LiteLineItemFragment on OrderLineItem{id quantity product{name usItemId imageInfo{thumbnailUrl}offerId isAlcohol}priceInfo{linePrice{...price}}}fragment SellerFragment on GroupSeller{id name isPro}fragment DigitalDeliveryFragment on DigitalDelivery{title name instructions{...textFragment}}fragment ShipmentFragment on Shipment{id trackingNumber isExternalTracking trackingUrl proofOfDelivery{photoUrl photoPreviewUrl showPreview}}fragment OrderGroupActionsFragment on OrderGroupActions{reorder edit track changeSlot checkin editDeliveryInstructions editPickupPerson editTip tip cancel enableTip{...orderActionFragment}enableEdit{...orderActionFragment}rescheduleTireInstall{...orderActionFragment}cancelTireInstall{...orderActionFragment}help viewCancellationDetails{...cancellationDetailsActionFragment}}fragment cancellationDetailsActionFragment on CancellationDetailsAction{label heading text{...textFragment}}fragment ODPGroupCategoryFragment on OrderCategory{type name subtext returnMessage substitutionsBanner{...textFragment}showExtendedSubstitutions actions{substitutions{message label type}nilPickReshop{message action{text url}}returnDetails viewCancellationDetails{...cancellationDetailsActionFragment}trackOnInHomeApp}banner{...textFragment}accordionState items{...orderLineItem}substitutions{...orderLineItem fulfilledItems{...orderLineItem}}returnInfo{...returnInfoFragment}}fragment ODPGroupFragment on OrderGroup{id fulfillmentType deliveryMessage deliveryAddress{fullName firstName lastName address{...addressFragment}}deliveryInstructions{text type typeText}deliveryPreferences{text{...textFragment}cta{...orderActionFragment}}editSubstitutionsCutOff status{statusType showStatusTracker message{...textFragment}notice helpCenterText{...textFragment}}itemCount isCategorized categories{...ODPGroupCategoryFragment}seller{id name isPro}shipment{id trackingNumber}actions{reorder edit track changeSlot checkin editDeliveryInstructions editPickupPerson tip cancel help enableTip{...orderActionFragment}enableEdit{...orderActionFragment}viewCancellationDetails{...cancellationDetailsActionFragment}enableInHome{...orderActionFragment}createGiftReceipt}cutOffTimestamp isEditSubstitutionsEligible isInHome giftDetails{recipientAddress{fullName}recipientEmail senderName giftMessage}donationDetails{...orderDonationDetails}}fragment returnInfoFragment on ReturnInfo{returnOrderId type refundPriceDetails{__typename...refundPriceDetailsFragment}refundMessage tierRefundMessage paymentMethods{__typename description cardType paymentType displayValues message{...textFragment}}actions{__typename generate scheduleOrModifyPickup{text url}reschedulePickup editPickupContact}shippingLabelUrl qrCodeImageUrl carriers{__typename id name}pickupCarrier pickupContact{nameAndAddress{fullName firstName lastName address{addressString city state postalCode addressLineOne addressLineTwo country}}phone}pickupConfirmationNumber bannerMessage{...textFragment}}fragment refundPriceDetailsFragment on RefundPriceDetails{subTotal{__typename...orderPriceDetailRowFragment}fees{__typename...orderPriceDetailRowFragment}discounts{__typename...orderPriceDetailRowFragment}taxTotal{__typename...orderPriceDetailRowFragment}grandTotal{__typename...orderPriceDetailRowFragment}}fragment orderPriceDetailRowFragment on OrderPriceDetailRow{label displayValue value info{__typename title message}}fragment addressFragment on OrderAddress{addressString addressLineOne addressLineTwo state postalCode city}fragment ODPPickupInfo on OrderGroup{pickupInstructions pickupPerson{...person}alternatePickupPerson{...person}store{id name address{...addressFragment}}}fragment person on OrderPickupPerson{firstName lastName email}fragment ODPTippingInfo on OrderGroup{addTipMessage{...textFragment}driver{...DriverFragment}tipping{min{...price}max{...price}suggested{...price}preselected}subtotal{...price}}fragment orderActionFragment on Action{text url}fragment orderCustomer on OrderCustomer{id firstName lastName email isGuest isEmailRegistered}fragment OrderFieldsFragment on Order{__typename id version type customer{...orderCustomer}displayId idBarcodeImageUrl(barWidth:3 barHeight:100) isFuelPurchase title shortTitle timezone tippableGroup{...OrderGroupFragment}amendableGroup{id changeSlotIterationsLeft cutOffTimestamp fulfillmentType deliveryAddress{fullName firstName lastName address{addressString addressLineOne addressLineTwo state postalCode city country}}isAmendInProgress}substitutionsBanner{heading subheading longSubheading}groups_2101{__typename...OrderGroupFragment...ODPGroupFragment...ODPPickupInfo...ODPTippingInfo}multiboxBundles{...orderLineItem}itemCancelReasons{__typename...cancelReason}groupCancelReasons{__typename...cancelReason}priceDetails{__typename subTotal{__typename...priceDetailFragment}taxTotal{__typename...priceDetailFragment}grandTotal{__typename...priceDetailFragment}authorizationAmount{__typename...priceDetailFragment}fees{__typename...priceDetailFragment}discounts{__typename...priceDetailFragment}minimumThreshold{__typename...price}belowMinimumFee{__typename...priceDetailFragment}driverTip{__typename...priceDetailFragment}donations{__typename...priceDetailFragment}}paymentMethods{__typename description cardType paymentType displayValues message{...textFragment}actions{connectToCapitalOne{...orderActionFragment}visitAffirm{...orderActionFragment}}}actions{__typename return pendingReturn cancel startReturn{...orderActionFragment}reorder}banners{...textFragment}}","variables":{"orderId":"2832234199510","emailAddress":"travisbagwell43@hotmail.com"}}' \
  --compressed`
 
for (( i=0; i<=4; i++ ))
do
  if [[ $curl11 =~ "error"  || $curl11 =~ "blocked" ]]; then
    echo "Lỗi email số 11"
    indexOrder11=`echo error`
    break
  elif [[ `echo $curl11 | jq '.data.guestOrder.groups_2101['${i[@]}'].items[0].product.usItemId'` == '"6371940"' ]]; then
    indexOrder11=`echo $i`
    indexItem11=`echo 0`
  elif [[ `echo $curl11 | jq '.data.guestOrder.groups_2101['${i[@]}'].items[1].product.usItemId'` == '"6371940"' ]]; then
    indexOrder11=`echo $i`
    indexItem11=`echo 1`
  elif [[ `echo $curl11 | jq '.data.guestOrder.groups_2101['${i[@]}'].items[2].product.usItemId'` == '"6371940"' ]]; then
    indexOrder11=`echo $i`
    indexItem11=`echo 2`
  elif [[ `echo $curl11 | jq '.data.guestOrder.groups_2101['${i[@]}'].items[3].product.usItemId'` == '"6371940"' ]]; then
    indexOrder11=`echo $i`
    indexItem11=`echo 3`
  fi
done

if [[ $indexOrder11 != "error" ]]; then
echo $curl11 | jq '.data.guestOrder.id' >> track-OrderID.txt
echo $curl11 | jq '.data.guestOrder.customer.email' >> track-email.txt
echo $curl11 | jq '.data.guestOrder.groups_2101['$indexOrder11'].items['$indexItem11'].product.usItemId' >> track-usItemId.txt
echo $curl11 | jq '.data.guestOrder.groups_2101['$indexOrder11'].items['$indexItem11'].priceInfo.linePrice.value' >> track-priceValue.txt
echo $curl11 | jq '.data.guestOrder.groups_2101['$indexOrder11'].deliveryAddress.fullName' >> track-fullName.txt
echo $curl11 | jq '.data.guestOrder.groups_2101['$indexOrder11'].deliveryAddress.address.addressString' >> track-address.txt
echo $curl11 | jq '.data.guestOrder.groups_2101['$indexOrder11'].status.message.parts[].text' >> track-status.txt
echo $curl11 | jq '.data.guestOrder.groups_2101['$indexOrder11'].shipment.trackingNumber' >> track-number.txt
echo $curl11 | jq '.data.guestOrder.groups_2101['$indexOrder11'].shipment.trackingUrl' >> track-url.txt
fi

curl12=`curl 'https://www.walmart.com/orchestra/home/graphql' \
  -H 'authority: www.walmart.com' \
  -H 'sec-ch-ua: " Not A;Brand";v="99", "Chromium";v="96", "Microsoft Edge";v="96"' \
  -H 'x-o-platform: rweb' \
  -H 'dnt: 1' \
  -H 'x-o-correlation-id: wrvYiSFTlAmd8j7a8DDmpuyOpCN_heAnwM3v' \
  -H 'device_profile_ref_id: _s1F3NO8Y2JjaBUKPDcY4iFDWiIl9CyqiJjf' \
  -H 'x-latency-trace: 1' \
  -H 'wm_mp: true' \
  -H 'x-o-market: us' \
  -H 'x-o-platform-version: main-253-ebbb47' \
  -H 'x-o-gql-query: query getGuestOrder' \
  -H 'wm_page_url: https://www.walmart.com/orders' \
  -H 'x-apollo-operation-name: getGuestOrder' \
  -H 'sec-ch-ua-platform: "macOS"' \
  -H 'sec-ch-ua-mobile: ?0' \
  -H 'user-agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/96.0.4664.110 Safari/537.36 Edg/96.0.1054.62' \
  -H 'x-o-segment: oaoh' \
  -H 'content-type: application/json' \
  -H 'accept: application/json' \
  -H 'x-enable-server-timing: 1' \
  -H 'x-o-ccm: server' \
  -H 'wm_qos.correlation_id: wrvYiSFTlAmd8j7a8DDmpuyOpCN_heAnwM3v' \
  -H 'origin: https://www.walmart.com' \
  -H 'sec-fetch-site: same-origin' \
  -H 'sec-fetch-mode: cors' \
  -H 'sec-fetch-dest: empty' \
  -H 'referer: https://www.walmart.com/orders' \
  -H 'accept-language: vi' \
  --data-raw $'{"query":"query getGuestOrder($orderId:ID\u0021 $emailAddress:String\u0021){guestOrder(input:{id:$orderId emailAddress:$emailAddress}){...OrderFieldsFragment}}fragment cancelReason on OrderCancelReason{__typename subReasonCode subDescription}fragment priceDetailFragment on OrderPriceDetailRow{label value displayValue info{title message}rowInfo{...orderPriceDetailRowInfo}}fragment orderPriceDetailRowInfo on OrderPriceDetailRowInfo{title message{...textFragment}}fragment price on Price{displayValue value}fragment variants on MapEntry{name value}fragment OrderAddOn on OrderAddOn{lineId uniqueLineId productInfo{name usItemId offerId}quantityString quantityLabel type fulfillmentInstructions{...textFragment}actions{manageProtectionPlan{...orderActionFragment}cancel}priceInfo{linePrice{...price}}quantity isActive}fragment orderDonationDetails on OrderDonationDetails{message{...textFragment}emailReceipt emailReceiptToken status{...textFragment}errorStatus}fragment orderLineItem on OrderLineItem{id uniqueId actions{contactSeller cancel addToCart configureCake reviewItem resendEGiftCardToken protectionPlan{...orderActionFragment}manageProtectionPlan{...orderActionFragment}}isGift digitalDeliveryMessage quantity quantityString quantityLabel isSubstitutionSelected fulfilledItems{id quantityString priceInfo{itemPrice{value}}product{usItemId name}}isReturnable returnEligibilityMessage product{name usItemId imageInfo{thumbnailUrl}canonicalUrl offerId sellerId sellerName hasSellerBadge seller{sellerId name}orderLimit orderMinLimit weightIncrement salesUnit salesUnitType isSubstitutionEligible isAlcohol}reshop{reshopMessage isShippingAvailable minPromiseDate maxPromiseDate}selectedVariants{...variants}variantAdditionalInfo{parts{text nativeAction}}priceInfo{priceDisplayCodes{showItemPrice priceDisplayCondition finalCostByWeight}itemPrice{...price}linePrice{...price}unitPrice{...price}preDiscountedLinePrice{...price}additionalLines{name value}}discounts{label labelText{...textFragment}}itemReviewed activationCodes{label code}protectionPlanMessage{...textFragment}showSeller isShippedByWalmart seller{id name isPro}digitalDeliveryPhoneNumber addOns{...OrderAddOn}multiboxBundleId}fragment DriverFragment on Driver{id firstName photoUrl}fragment OrderGroupFragment on OrderGroup{driver{...DriverFragment}deliveryDate fulfillmentType status{...OrderGroupStatusFragment}showSeller isShippedByWalmart seller{...SellerFragment}id itemCount items{...LiteLineItemFragment}pickupPerson{firstName lastName email}accessPointId shipment{...ShipmentFragment}returnEligibilityMessage actions{...OrderGroupActionsFragment}recipientEmailAddress digitalDelivery{...DigitalDeliveryFragment}tireInstallationReservation{status extraText}}fragment OrderGroupStatusFragment on OrderGroupStatus{statusType showStatusTracker statusTracker{status label isCurrent}message{...textFragment}subtext subMessage{...textFragment}notice helpCenterText{...textFragment}}fragment textFragment on Text{parts{bold url text nativeAction lineBreak}}fragment LiteLineItemFragment on OrderLineItem{id quantity product{name usItemId imageInfo{thumbnailUrl}offerId isAlcohol}priceInfo{linePrice{...price}}}fragment SellerFragment on GroupSeller{id name isPro}fragment DigitalDeliveryFragment on DigitalDelivery{title name instructions{...textFragment}}fragment ShipmentFragment on Shipment{id trackingNumber isExternalTracking trackingUrl proofOfDelivery{photoUrl photoPreviewUrl showPreview}}fragment OrderGroupActionsFragment on OrderGroupActions{reorder edit track changeSlot checkin editDeliveryInstructions editPickupPerson editTip tip cancel enableTip{...orderActionFragment}enableEdit{...orderActionFragment}rescheduleTireInstall{...orderActionFragment}cancelTireInstall{...orderActionFragment}help viewCancellationDetails{...cancellationDetailsActionFragment}}fragment cancellationDetailsActionFragment on CancellationDetailsAction{label heading text{...textFragment}}fragment ODPGroupCategoryFragment on OrderCategory{type name subtext returnMessage substitutionsBanner{...textFragment}showExtendedSubstitutions actions{substitutions{message label type}nilPickReshop{message action{text url}}returnDetails viewCancellationDetails{...cancellationDetailsActionFragment}trackOnInHomeApp}banner{...textFragment}accordionState items{...orderLineItem}substitutions{...orderLineItem fulfilledItems{...orderLineItem}}returnInfo{...returnInfoFragment}}fragment ODPGroupFragment on OrderGroup{id fulfillmentType deliveryMessage deliveryAddress{fullName firstName lastName address{...addressFragment}}deliveryInstructions{text type typeText}deliveryPreferences{text{...textFragment}cta{...orderActionFragment}}editSubstitutionsCutOff status{statusType showStatusTracker message{...textFragment}notice helpCenterText{...textFragment}}itemCount isCategorized categories{...ODPGroupCategoryFragment}seller{id name isPro}shipment{id trackingNumber}actions{reorder edit track changeSlot checkin editDeliveryInstructions editPickupPerson tip cancel help enableTip{...orderActionFragment}enableEdit{...orderActionFragment}viewCancellationDetails{...cancellationDetailsActionFragment}enableInHome{...orderActionFragment}createGiftReceipt}cutOffTimestamp isEditSubstitutionsEligible isInHome giftDetails{recipientAddress{fullName}recipientEmail senderName giftMessage}donationDetails{...orderDonationDetails}}fragment returnInfoFragment on ReturnInfo{returnOrderId type refundPriceDetails{__typename...refundPriceDetailsFragment}refundMessage tierRefundMessage paymentMethods{__typename description cardType paymentType displayValues message{...textFragment}}actions{__typename generate scheduleOrModifyPickup{text url}reschedulePickup editPickupContact}shippingLabelUrl qrCodeImageUrl carriers{__typename id name}pickupCarrier pickupContact{nameAndAddress{fullName firstName lastName address{addressString city state postalCode addressLineOne addressLineTwo country}}phone}pickupConfirmationNumber bannerMessage{...textFragment}}fragment refundPriceDetailsFragment on RefundPriceDetails{subTotal{__typename...orderPriceDetailRowFragment}fees{__typename...orderPriceDetailRowFragment}discounts{__typename...orderPriceDetailRowFragment}taxTotal{__typename...orderPriceDetailRowFragment}grandTotal{__typename...orderPriceDetailRowFragment}}fragment orderPriceDetailRowFragment on OrderPriceDetailRow{label displayValue value info{__typename title message}}fragment addressFragment on OrderAddress{addressString addressLineOne addressLineTwo state postalCode city}fragment ODPPickupInfo on OrderGroup{pickupInstructions pickupPerson{...person}alternatePickupPerson{...person}store{id name address{...addressFragment}}}fragment person on OrderPickupPerson{firstName lastName email}fragment ODPTippingInfo on OrderGroup{addTipMessage{...textFragment}driver{...DriverFragment}tipping{min{...price}max{...price}suggested{...price}preselected}subtotal{...price}}fragment orderActionFragment on Action{text url}fragment orderCustomer on OrderCustomer{id firstName lastName email isGuest isEmailRegistered}fragment OrderFieldsFragment on Order{__typename id version type customer{...orderCustomer}displayId idBarcodeImageUrl(barWidth:3 barHeight:100) isFuelPurchase title shortTitle timezone tippableGroup{...OrderGroupFragment}amendableGroup{id changeSlotIterationsLeft cutOffTimestamp fulfillmentType deliveryAddress{fullName firstName lastName address{addressString addressLineOne addressLineTwo state postalCode city country}}isAmendInProgress}substitutionsBanner{heading subheading longSubheading}groups_2101{__typename...OrderGroupFragment...ODPGroupFragment...ODPPickupInfo...ODPTippingInfo}multiboxBundles{...orderLineItem}itemCancelReasons{__typename...cancelReason}groupCancelReasons{__typename...cancelReason}priceDetails{__typename subTotal{__typename...priceDetailFragment}taxTotal{__typename...priceDetailFragment}grandTotal{__typename...priceDetailFragment}authorizationAmount{__typename...priceDetailFragment}fees{__typename...priceDetailFragment}discounts{__typename...priceDetailFragment}minimumThreshold{__typename...price}belowMinimumFee{__typename...priceDetailFragment}driverTip{__typename...priceDetailFragment}donations{__typename...priceDetailFragment}}paymentMethods{__typename description cardType paymentType displayValues message{...textFragment}actions{connectToCapitalOne{...orderActionFragment}visitAffirm{...orderActionFragment}}}actions{__typename return pendingReturn cancel startReturn{...orderActionFragment}reorder}banners{...textFragment}}","variables":{"orderId":"2782222822462","emailAddress":"ambeaudoing@gmail.com"}}' \
  --compressed`
 
for (( i=0; i<=4; i++ ))
do
  if [[ $curl12 =~ "error"  || $curl12 =~ "blocked" ]]; then
    echo "Lỗi email số 12"
    indexOrder12=`echo error`
    break
  elif [[ `echo $curl12 | jq '.data.guestOrder.groups_2101['${i[@]}'].items[0].product.usItemId'` == '"337077643"' ]]; then
    indexOrder12=`echo $i`
    indexItem12=`echo 0`
  elif [[ `echo $curl12 | jq '.data.guestOrder.groups_2101['${i[@]}'].items[1].product.usItemId'` == '"337077643"' ]]; then
    indexOrder12=`echo $i`
    indexItem12=`echo 1`
  elif [[ `echo $curl12 | jq '.data.guestOrder.groups_2101['${i[@]}'].items[2].product.usItemId'` == '"337077643"' ]]; then
    indexOrder12=`echo $i`
    indexItem12=`echo 2`
  elif [[ `echo $curl12 | jq '.data.guestOrder.groups_2101['${i[@]}'].items[3].product.usItemId'` == '"337077643"' ]]; then
    indexOrder12=`echo $i`
    indexItem12=`echo 3`
  fi
done

if [[ $indexOrder12 != "error" ]]; then
echo $curl12 | jq '.data.guestOrder.id' >> track-OrderID.txt
echo $curl12 | jq '.data.guestOrder.customer.email' >> track-email.txt
echo $curl12 | jq '.data.guestOrder.groups_2101['$indexOrder12'].items['$indexItem12'].product.usItemId' >> track-usItemId.txt
echo $curl12 | jq '.data.guestOrder.groups_2101['$indexOrder12'].items['$indexItem12'].priceInfo.linePrice.value' >> track-priceValue.txt
echo $curl12 | jq '.data.guestOrder.groups_2101['$indexOrder12'].deliveryAddress.fullName' >> track-fullName.txt
echo $curl12 | jq '.data.guestOrder.groups_2101['$indexOrder12'].deliveryAddress.address.addressString' >> track-address.txt
echo $curl12 | jq '.data.guestOrder.groups_2101['$indexOrder12'].status.message.parts[].text' >> track-status.txt
echo $curl12 | jq '.data.guestOrder.groups_2101['$indexOrder12'].shipment.trackingNumber' >> track-number.txt
echo $curl12 | jq '.data.guestOrder.groups_2101['$indexOrder12'].shipment.trackingUrl' >> track-url.txt
fi

curl13=`curl 'https://www.walmart.com/orchestra/home/graphql' \
  -H 'authority: www.walmart.com' \
  -H 'sec-ch-ua: " Not A;Brand";v="99", "Chromium";v="96", "Microsoft Edge";v="96"' \
  -H 'x-o-platform: rweb' \
  -H 'dnt: 1' \
  -H 'x-o-correlation-id: wrvYiSFTlAmd8j7a8DDmpuyOpCN_heAnwM3v' \
  -H 'device_profile_ref_id: _s1F3NO8Y2JjaBUKPDcY4iFDWiIl9CyqiJjf' \
  -H 'x-latency-trace: 1' \
  -H 'wm_mp: true' \
  -H 'x-o-market: us' \
  -H 'x-o-platform-version: main-253-ebbb47' \
  -H 'x-o-gql-query: query getGuestOrder' \
  -H 'wm_page_url: https://www.walmart.com/orders' \
  -H 'x-apollo-operation-name: getGuestOrder' \
  -H 'sec-ch-ua-platform: "macOS"' \
  -H 'sec-ch-ua-mobile: ?0' \
  -H 'user-agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/96.0.4664.110 Safari/537.36 Edg/96.0.1054.62' \
  -H 'x-o-segment: oaoh' \
  -H 'content-type: application/json' \
  -H 'accept: application/json' \
  -H 'x-enable-server-timing: 1' \
  -H 'x-o-ccm: server' \
  -H 'wm_qos.correlation_id: wrvYiSFTlAmd8j7a8DDmpuyOpCN_heAnwM3v' \
  -H 'origin: https://www.walmart.com' \
  -H 'sec-fetch-site: same-origin' \
  -H 'sec-fetch-mode: cors' \
  -H 'sec-fetch-dest: empty' \
  -H 'referer: https://www.walmart.com/orders' \
  -H 'accept-language: vi' \
  --data-raw $'{"query":"query getGuestOrder($orderId:ID\u0021 $emailAddress:String\u0021){guestOrder(input:{id:$orderId emailAddress:$emailAddress}){...OrderFieldsFragment}}fragment cancelReason on OrderCancelReason{__typename subReasonCode subDescription}fragment priceDetailFragment on OrderPriceDetailRow{label value displayValue info{title message}rowInfo{...orderPriceDetailRowInfo}}fragment orderPriceDetailRowInfo on OrderPriceDetailRowInfo{title message{...textFragment}}fragment price on Price{displayValue value}fragment variants on MapEntry{name value}fragment OrderAddOn on OrderAddOn{lineId uniqueLineId productInfo{name usItemId offerId}quantityString quantityLabel type fulfillmentInstructions{...textFragment}actions{manageProtectionPlan{...orderActionFragment}cancel}priceInfo{linePrice{...price}}quantity isActive}fragment orderDonationDetails on OrderDonationDetails{message{...textFragment}emailReceipt emailReceiptToken status{...textFragment}errorStatus}fragment orderLineItem on OrderLineItem{id uniqueId actions{contactSeller cancel addToCart configureCake reviewItem resendEGiftCardToken protectionPlan{...orderActionFragment}manageProtectionPlan{...orderActionFragment}}isGift digitalDeliveryMessage quantity quantityString quantityLabel isSubstitutionSelected fulfilledItems{id quantityString priceInfo{itemPrice{value}}product{usItemId name}}isReturnable returnEligibilityMessage product{name usItemId imageInfo{thumbnailUrl}canonicalUrl offerId sellerId sellerName hasSellerBadge seller{sellerId name}orderLimit orderMinLimit weightIncrement salesUnit salesUnitType isSubstitutionEligible isAlcohol}reshop{reshopMessage isShippingAvailable minPromiseDate maxPromiseDate}selectedVariants{...variants}variantAdditionalInfo{parts{text nativeAction}}priceInfo{priceDisplayCodes{showItemPrice priceDisplayCondition finalCostByWeight}itemPrice{...price}linePrice{...price}unitPrice{...price}preDiscountedLinePrice{...price}additionalLines{name value}}discounts{label labelText{...textFragment}}itemReviewed activationCodes{label code}protectionPlanMessage{...textFragment}showSeller isShippedByWalmart seller{id name isPro}digitalDeliveryPhoneNumber addOns{...OrderAddOn}multiboxBundleId}fragment DriverFragment on Driver{id firstName photoUrl}fragment OrderGroupFragment on OrderGroup{driver{...DriverFragment}deliveryDate fulfillmentType status{...OrderGroupStatusFragment}showSeller isShippedByWalmart seller{...SellerFragment}id itemCount items{...LiteLineItemFragment}pickupPerson{firstName lastName email}accessPointId shipment{...ShipmentFragment}returnEligibilityMessage actions{...OrderGroupActionsFragment}recipientEmailAddress digitalDelivery{...DigitalDeliveryFragment}tireInstallationReservation{status extraText}}fragment OrderGroupStatusFragment on OrderGroupStatus{statusType showStatusTracker statusTracker{status label isCurrent}message{...textFragment}subtext subMessage{...textFragment}notice helpCenterText{...textFragment}}fragment textFragment on Text{parts{bold url text nativeAction lineBreak}}fragment LiteLineItemFragment on OrderLineItem{id quantity product{name usItemId imageInfo{thumbnailUrl}offerId isAlcohol}priceInfo{linePrice{...price}}}fragment SellerFragment on GroupSeller{id name isPro}fragment DigitalDeliveryFragment on DigitalDelivery{title name instructions{...textFragment}}fragment ShipmentFragment on Shipment{id trackingNumber isExternalTracking trackingUrl proofOfDelivery{photoUrl photoPreviewUrl showPreview}}fragment OrderGroupActionsFragment on OrderGroupActions{reorder edit track changeSlot checkin editDeliveryInstructions editPickupPerson editTip tip cancel enableTip{...orderActionFragment}enableEdit{...orderActionFragment}rescheduleTireInstall{...orderActionFragment}cancelTireInstall{...orderActionFragment}help viewCancellationDetails{...cancellationDetailsActionFragment}}fragment cancellationDetailsActionFragment on CancellationDetailsAction{label heading text{...textFragment}}fragment ODPGroupCategoryFragment on OrderCategory{type name subtext returnMessage substitutionsBanner{...textFragment}showExtendedSubstitutions actions{substitutions{message label type}nilPickReshop{message action{text url}}returnDetails viewCancellationDetails{...cancellationDetailsActionFragment}trackOnInHomeApp}banner{...textFragment}accordionState items{...orderLineItem}substitutions{...orderLineItem fulfilledItems{...orderLineItem}}returnInfo{...returnInfoFragment}}fragment ODPGroupFragment on OrderGroup{id fulfillmentType deliveryMessage deliveryAddress{fullName firstName lastName address{...addressFragment}}deliveryInstructions{text type typeText}deliveryPreferences{text{...textFragment}cta{...orderActionFragment}}editSubstitutionsCutOff status{statusType showStatusTracker message{...textFragment}notice helpCenterText{...textFragment}}itemCount isCategorized categories{...ODPGroupCategoryFragment}seller{id name isPro}shipment{id trackingNumber}actions{reorder edit track changeSlot checkin editDeliveryInstructions editPickupPerson tip cancel help enableTip{...orderActionFragment}enableEdit{...orderActionFragment}viewCancellationDetails{...cancellationDetailsActionFragment}enableInHome{...orderActionFragment}createGiftReceipt}cutOffTimestamp isEditSubstitutionsEligible isInHome giftDetails{recipientAddress{fullName}recipientEmail senderName giftMessage}donationDetails{...orderDonationDetails}}fragment returnInfoFragment on ReturnInfo{returnOrderId type refundPriceDetails{__typename...refundPriceDetailsFragment}refundMessage tierRefundMessage paymentMethods{__typename description cardType paymentType displayValues message{...textFragment}}actions{__typename generate scheduleOrModifyPickup{text url}reschedulePickup editPickupContact}shippingLabelUrl qrCodeImageUrl carriers{__typename id name}pickupCarrier pickupContact{nameAndAddress{fullName firstName lastName address{addressString city state postalCode addressLineOne addressLineTwo country}}phone}pickupConfirmationNumber bannerMessage{...textFragment}}fragment refundPriceDetailsFragment on RefundPriceDetails{subTotal{__typename...orderPriceDetailRowFragment}fees{__typename...orderPriceDetailRowFragment}discounts{__typename...orderPriceDetailRowFragment}taxTotal{__typename...orderPriceDetailRowFragment}grandTotal{__typename...orderPriceDetailRowFragment}}fragment orderPriceDetailRowFragment on OrderPriceDetailRow{label displayValue value info{__typename title message}}fragment addressFragment on OrderAddress{addressString addressLineOne addressLineTwo state postalCode city}fragment ODPPickupInfo on OrderGroup{pickupInstructions pickupPerson{...person}alternatePickupPerson{...person}store{id name address{...addressFragment}}}fragment person on OrderPickupPerson{firstName lastName email}fragment ODPTippingInfo on OrderGroup{addTipMessage{...textFragment}driver{...DriverFragment}tipping{min{...price}max{...price}suggested{...price}preselected}subtotal{...price}}fragment orderActionFragment on Action{text url}fragment orderCustomer on OrderCustomer{id firstName lastName email isGuest isEmailRegistered}fragment OrderFieldsFragment on Order{__typename id version type customer{...orderCustomer}displayId idBarcodeImageUrl(barWidth:3 barHeight:100) isFuelPurchase title shortTitle timezone tippableGroup{...OrderGroupFragment}amendableGroup{id changeSlotIterationsLeft cutOffTimestamp fulfillmentType deliveryAddress{fullName firstName lastName address{addressString addressLineOne addressLineTwo state postalCode city country}}isAmendInProgress}substitutionsBanner{heading subheading longSubheading}groups_2101{__typename...OrderGroupFragment...ODPGroupFragment...ODPPickupInfo...ODPTippingInfo}multiboxBundles{...orderLineItem}itemCancelReasons{__typename...cancelReason}groupCancelReasons{__typename...cancelReason}priceDetails{__typename subTotal{__typename...priceDetailFragment}taxTotal{__typename...priceDetailFragment}grandTotal{__typename...priceDetailFragment}authorizationAmount{__typename...priceDetailFragment}fees{__typename...priceDetailFragment}discounts{__typename...priceDetailFragment}minimumThreshold{__typename...price}belowMinimumFee{__typename...priceDetailFragment}driverTip{__typename...priceDetailFragment}donations{__typename...priceDetailFragment}}paymentMethods{__typename description cardType paymentType displayValues message{...textFragment}actions{connectToCapitalOne{...orderActionFragment}visitAffirm{...orderActionFragment}}}actions{__typename return pendingReturn cancel startReturn{...orderActionFragment}reorder}banners{...textFragment}}","variables":{"orderId":"2832232841292","emailAddress":"cl0718@yahoo.com"}}' \
  --compressed`
 
for (( i=0; i<=4; i++ ))
do
  if [[ $curl13 =~ "error"  || $curl13 =~ "blocked" ]]; then
    echo "Lỗi email số 13"
    indexOrder13=`echo error`
    break
  elif [[ `echo $curl13 | jq '.data.guestOrder.groups_2101['${i[@]}'].items[0].product.usItemId'` == '"755361385"' ]]; then
    indexOrder13=`echo $i`
    indexItem13=`echo 0`
  elif [[ `echo $curl13 | jq '.data.guestOrder.groups_2101['${i[@]}'].items[1].product.usItemId'` == '"755361385"' ]]; then
    indexOrder13=`echo $i`
    indexItem13=`echo 1`
  elif [[ `echo $curl13 | jq '.data.guestOrder.groups_2101['${i[@]}'].items[2].product.usItemId'` == '"755361385"' ]]; then
    indexOrder13=`echo $i`
    indexItem13=`echo 2`
  elif [[ `echo $curl13 | jq '.data.guestOrder.groups_2101['${i[@]}'].items[3].product.usItemId'` == '"755361385"' ]]; then
    indexOrder13=`echo $i`
    indexItem13=`echo 3`
  fi
done

if [[ $indexOrder13 != "error" ]]; then
echo $curl13 | jq '.data.guestOrder.id' >> track-OrderID.txt
echo $curl13 | jq '.data.guestOrder.customer.email' >> track-email.txt
echo $curl13 | jq '.data.guestOrder.groups_2101['$indexOrder13'].items['$indexItem13'].product.usItemId' >> track-usItemId.txt
echo $curl13 | jq '.data.guestOrder.groups_2101['$indexOrder13'].items['$indexItem13'].priceInfo.linePrice.value' >> track-priceValue.txt
echo $curl13 | jq '.data.guestOrder.groups_2101['$indexOrder13'].deliveryAddress.fullName' >> track-fullName.txt
echo $curl13 | jq '.data.guestOrder.groups_2101['$indexOrder13'].deliveryAddress.address.addressString' >> track-address.txt
echo $curl13 | jq '.data.guestOrder.groups_2101['$indexOrder13'].status.message.parts[].text' >> track-status.txt
echo $curl13 | jq '.data.guestOrder.groups_2101['$indexOrder13'].shipment.trackingNumber' >> track-number.txt
echo $curl13 | jq '.data.guestOrder.groups_2101['$indexOrder13'].shipment.trackingUrl' >> track-url.txt
fi

curl14=`curl 'https://www.walmart.com/orchestra/home/graphql' \
  -H 'authority: www.walmart.com' \
  -H 'sec-ch-ua: " Not A;Brand";v="99", "Chromium";v="96", "Microsoft Edge";v="96"' \
  -H 'x-o-platform: rweb' \
  -H 'dnt: 1' \
  -H 'x-o-correlation-id: wrvYiSFTlAmd8j7a8DDmpuyOpCN_heAnwM3v' \
  -H 'device_profile_ref_id: _s1F3NO8Y2JjaBUKPDcY4iFDWiIl9CyqiJjf' \
  -H 'x-latency-trace: 1' \
  -H 'wm_mp: true' \
  -H 'x-o-market: us' \
  -H 'x-o-platform-version: main-253-ebbb47' \
  -H 'x-o-gql-query: query getGuestOrder' \
  -H 'wm_page_url: https://www.walmart.com/orders' \
  -H 'x-apollo-operation-name: getGuestOrder' \
  -H 'sec-ch-ua-platform: "macOS"' \
  -H 'sec-ch-ua-mobile: ?0' \
  -H 'user-agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/96.0.4664.110 Safari/537.36 Edg/96.0.1054.62' \
  -H 'x-o-segment: oaoh' \
  -H 'content-type: application/json' \
  -H 'accept: application/json' \
  -H 'x-enable-server-timing: 1' \
  -H 'x-o-ccm: server' \
  -H 'wm_qos.correlation_id: wrvYiSFTlAmd8j7a8DDmpuyOpCN_heAnwM3v' \
  -H 'origin: https://www.walmart.com' \
  -H 'sec-fetch-site: same-origin' \
  -H 'sec-fetch-mode: cors' \
  -H 'sec-fetch-dest: empty' \
  -H 'referer: https://www.walmart.com/orders' \
  -H 'accept-language: vi' \
  --data-raw $'{"query":"query getGuestOrder($orderId:ID\u0021 $emailAddress:String\u0021){guestOrder(input:{id:$orderId emailAddress:$emailAddress}){...OrderFieldsFragment}}fragment cancelReason on OrderCancelReason{__typename subReasonCode subDescription}fragment priceDetailFragment on OrderPriceDetailRow{label value displayValue info{title message}rowInfo{...orderPriceDetailRowInfo}}fragment orderPriceDetailRowInfo on OrderPriceDetailRowInfo{title message{...textFragment}}fragment price on Price{displayValue value}fragment variants on MapEntry{name value}fragment OrderAddOn on OrderAddOn{lineId uniqueLineId productInfo{name usItemId offerId}quantityString quantityLabel type fulfillmentInstructions{...textFragment}actions{manageProtectionPlan{...orderActionFragment}cancel}priceInfo{linePrice{...price}}quantity isActive}fragment orderDonationDetails on OrderDonationDetails{message{...textFragment}emailReceipt emailReceiptToken status{...textFragment}errorStatus}fragment orderLineItem on OrderLineItem{id uniqueId actions{contactSeller cancel addToCart configureCake reviewItem resendEGiftCardToken protectionPlan{...orderActionFragment}manageProtectionPlan{...orderActionFragment}}isGift digitalDeliveryMessage quantity quantityString quantityLabel isSubstitutionSelected fulfilledItems{id quantityString priceInfo{itemPrice{value}}product{usItemId name}}isReturnable returnEligibilityMessage product{name usItemId imageInfo{thumbnailUrl}canonicalUrl offerId sellerId sellerName hasSellerBadge seller{sellerId name}orderLimit orderMinLimit weightIncrement salesUnit salesUnitType isSubstitutionEligible isAlcohol}reshop{reshopMessage isShippingAvailable minPromiseDate maxPromiseDate}selectedVariants{...variants}variantAdditionalInfo{parts{text nativeAction}}priceInfo{priceDisplayCodes{showItemPrice priceDisplayCondition finalCostByWeight}itemPrice{...price}linePrice{...price}unitPrice{...price}preDiscountedLinePrice{...price}additionalLines{name value}}discounts{label labelText{...textFragment}}itemReviewed activationCodes{label code}protectionPlanMessage{...textFragment}showSeller isShippedByWalmart seller{id name isPro}digitalDeliveryPhoneNumber addOns{...OrderAddOn}multiboxBundleId}fragment DriverFragment on Driver{id firstName photoUrl}fragment OrderGroupFragment on OrderGroup{driver{...DriverFragment}deliveryDate fulfillmentType status{...OrderGroupStatusFragment}showSeller isShippedByWalmart seller{...SellerFragment}id itemCount items{...LiteLineItemFragment}pickupPerson{firstName lastName email}accessPointId shipment{...ShipmentFragment}returnEligibilityMessage actions{...OrderGroupActionsFragment}recipientEmailAddress digitalDelivery{...DigitalDeliveryFragment}tireInstallationReservation{status extraText}}fragment OrderGroupStatusFragment on OrderGroupStatus{statusType showStatusTracker statusTracker{status label isCurrent}message{...textFragment}subtext subMessage{...textFragment}notice helpCenterText{...textFragment}}fragment textFragment on Text{parts{bold url text nativeAction lineBreak}}fragment LiteLineItemFragment on OrderLineItem{id quantity product{name usItemId imageInfo{thumbnailUrl}offerId isAlcohol}priceInfo{linePrice{...price}}}fragment SellerFragment on GroupSeller{id name isPro}fragment DigitalDeliveryFragment on DigitalDelivery{title name instructions{...textFragment}}fragment ShipmentFragment on Shipment{id trackingNumber isExternalTracking trackingUrl proofOfDelivery{photoUrl photoPreviewUrl showPreview}}fragment OrderGroupActionsFragment on OrderGroupActions{reorder edit track changeSlot checkin editDeliveryInstructions editPickupPerson editTip tip cancel enableTip{...orderActionFragment}enableEdit{...orderActionFragment}rescheduleTireInstall{...orderActionFragment}cancelTireInstall{...orderActionFragment}help viewCancellationDetails{...cancellationDetailsActionFragment}}fragment cancellationDetailsActionFragment on CancellationDetailsAction{label heading text{...textFragment}}fragment ODPGroupCategoryFragment on OrderCategory{type name subtext returnMessage substitutionsBanner{...textFragment}showExtendedSubstitutions actions{substitutions{message label type}nilPickReshop{message action{text url}}returnDetails viewCancellationDetails{...cancellationDetailsActionFragment}trackOnInHomeApp}banner{...textFragment}accordionState items{...orderLineItem}substitutions{...orderLineItem fulfilledItems{...orderLineItem}}returnInfo{...returnInfoFragment}}fragment ODPGroupFragment on OrderGroup{id fulfillmentType deliveryMessage deliveryAddress{fullName firstName lastName address{...addressFragment}}deliveryInstructions{text type typeText}deliveryPreferences{text{...textFragment}cta{...orderActionFragment}}editSubstitutionsCutOff status{statusType showStatusTracker message{...textFragment}notice helpCenterText{...textFragment}}itemCount isCategorized categories{...ODPGroupCategoryFragment}seller{id name isPro}shipment{id trackingNumber}actions{reorder edit track changeSlot checkin editDeliveryInstructions editPickupPerson tip cancel help enableTip{...orderActionFragment}enableEdit{...orderActionFragment}viewCancellationDetails{...cancellationDetailsActionFragment}enableInHome{...orderActionFragment}createGiftReceipt}cutOffTimestamp isEditSubstitutionsEligible isInHome giftDetails{recipientAddress{fullName}recipientEmail senderName giftMessage}donationDetails{...orderDonationDetails}}fragment returnInfoFragment on ReturnInfo{returnOrderId type refundPriceDetails{__typename...refundPriceDetailsFragment}refundMessage tierRefundMessage paymentMethods{__typename description cardType paymentType displayValues message{...textFragment}}actions{__typename generate scheduleOrModifyPickup{text url}reschedulePickup editPickupContact}shippingLabelUrl qrCodeImageUrl carriers{__typename id name}pickupCarrier pickupContact{nameAndAddress{fullName firstName lastName address{addressString city state postalCode addressLineOne addressLineTwo country}}phone}pickupConfirmationNumber bannerMessage{...textFragment}}fragment refundPriceDetailsFragment on RefundPriceDetails{subTotal{__typename...orderPriceDetailRowFragment}fees{__typename...orderPriceDetailRowFragment}discounts{__typename...orderPriceDetailRowFragment}taxTotal{__typename...orderPriceDetailRowFragment}grandTotal{__typename...orderPriceDetailRowFragment}}fragment orderPriceDetailRowFragment on OrderPriceDetailRow{label displayValue value info{__typename title message}}fragment addressFragment on OrderAddress{addressString addressLineOne addressLineTwo state postalCode city}fragment ODPPickupInfo on OrderGroup{pickupInstructions pickupPerson{...person}alternatePickupPerson{...person}store{id name address{...addressFragment}}}fragment person on OrderPickupPerson{firstName lastName email}fragment ODPTippingInfo on OrderGroup{addTipMessage{...textFragment}driver{...DriverFragment}tipping{min{...price}max{...price}suggested{...price}preselected}subtotal{...price}}fragment orderActionFragment on Action{text url}fragment orderCustomer on OrderCustomer{id firstName lastName email isGuest isEmailRegistered}fragment OrderFieldsFragment on Order{__typename id version type customer{...orderCustomer}displayId idBarcodeImageUrl(barWidth:3 barHeight:100) isFuelPurchase title shortTitle timezone tippableGroup{...OrderGroupFragment}amendableGroup{id changeSlotIterationsLeft cutOffTimestamp fulfillmentType deliveryAddress{fullName firstName lastName address{addressString addressLineOne addressLineTwo state postalCode city country}}isAmendInProgress}substitutionsBanner{heading subheading longSubheading}groups_2101{__typename...OrderGroupFragment...ODPGroupFragment...ODPPickupInfo...ODPTippingInfo}multiboxBundles{...orderLineItem}itemCancelReasons{__typename...cancelReason}groupCancelReasons{__typename...cancelReason}priceDetails{__typename subTotal{__typename...priceDetailFragment}taxTotal{__typename...priceDetailFragment}grandTotal{__typename...priceDetailFragment}authorizationAmount{__typename...priceDetailFragment}fees{__typename...priceDetailFragment}discounts{__typename...priceDetailFragment}minimumThreshold{__typename...price}belowMinimumFee{__typename...priceDetailFragment}driverTip{__typename...priceDetailFragment}donations{__typename...priceDetailFragment}}paymentMethods{__typename description cardType paymentType displayValues message{...textFragment}actions{connectToCapitalOne{...orderActionFragment}visitAffirm{...orderActionFragment}}}actions{__typename return pendingReturn cancel startReturn{...orderActionFragment}reorder}banners{...textFragment}}","variables":{"orderId":"2842234785871","emailAddress":"jarelinemichelle2@gmail.com"}}' \
  --compressed`
 
for (( i=0; i<=4; i++ ))
do
  if [[ $curl14 =~ "error"  || $curl14 =~ "blocked" ]]; then
    echo "Lỗi email số 14"
    indexOrder14=`echo error`
    break
  elif [[ `echo $curl14 | jq '.data.guestOrder.groups_2101['${i[@]}'].items[0].product.usItemId'` == '"249900363"' ]]; then
    indexOrder14=`echo $i`
    indexItem14=`echo 0`
  elif [[ `echo $curl14 | jq '.data.guestOrder.groups_2101['${i[@]}'].items[1].product.usItemId'` == '"249900363"' ]]; then
    indexOrder14=`echo $i`
    indexItem14=`echo 1`
  elif [[ `echo $curl14 | jq '.data.guestOrder.groups_2101['${i[@]}'].items[2].product.usItemId'` == '"249900363"' ]]; then
    indexOrder14=`echo $i`
    indexItem14=`echo 2`
  elif [[ `echo $curl14 | jq '.data.guestOrder.groups_2101['${i[@]}'].items[3].product.usItemId'` == '"249900363"' ]]; then
    indexOrder14=`echo $i`
    indexItem14=`echo 3`
  fi
done

if [[ $indexOrder14 != "error" ]]; then
echo $curl14 | jq '.data.guestOrder.id' >> track-OrderID.txt
echo $curl14 | jq '.data.guestOrder.customer.email' >> track-email.txt
echo $curl14 | jq '.data.guestOrder.groups_2101['$indexOrder14'].items['$indexItem14'].product.usItemId' >> track-usItemId.txt
echo $curl14 | jq '.data.guestOrder.groups_2101['$indexOrder14'].items['$indexItem14'].priceInfo.linePrice.value' >> track-priceValue.txt
echo $curl14 | jq '.data.guestOrder.groups_2101['$indexOrder14'].deliveryAddress.fullName' >> track-fullName.txt
echo $curl14 | jq '.data.guestOrder.groups_2101['$indexOrder14'].deliveryAddress.address.addressString' >> track-address.txt
echo $curl14 | jq '.data.guestOrder.groups_2101['$indexOrder14'].status.message.parts[].text' >> track-status.txt
echo $curl14 | jq '.data.guestOrder.groups_2101['$indexOrder14'].shipment.trackingNumber' >> track-number.txt
echo $curl14 | jq '.data.guestOrder.groups_2101['$indexOrder14'].shipment.trackingUrl' >> track-url.txt
fi

curl15=`curl 'https://www.walmart.com/orchestra/home/graphql' \
  -H 'authority: www.walmart.com' \
  -H 'sec-ch-ua: " Not A;Brand";v="99", "Chromium";v="96", "Microsoft Edge";v="96"' \
  -H 'x-o-platform: rweb' \
  -H 'dnt: 1' \
  -H 'x-o-correlation-id: wrvYiSFTlAmd8j7a8DDmpuyOpCN_heAnwM3v' \
  -H 'device_profile_ref_id: _s1F3NO8Y2JjaBUKPDcY4iFDWiIl9CyqiJjf' \
  -H 'x-latency-trace: 1' \
  -H 'wm_mp: true' \
  -H 'x-o-market: us' \
  -H 'x-o-platform-version: main-253-ebbb47' \
  -H 'x-o-gql-query: query getGuestOrder' \
  -H 'wm_page_url: https://www.walmart.com/orders' \
  -H 'x-apollo-operation-name: getGuestOrder' \
  -H 'sec-ch-ua-platform: "macOS"' \
  -H 'sec-ch-ua-mobile: ?0' \
  -H 'user-agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/96.0.4664.110 Safari/537.36 Edg/96.0.1054.62' \
  -H 'x-o-segment: oaoh' \
  -H 'content-type: application/json' \
  -H 'accept: application/json' \
  -H 'x-enable-server-timing: 1' \
  -H 'x-o-ccm: server' \
  -H 'wm_qos.correlation_id: wrvYiSFTlAmd8j7a8DDmpuyOpCN_heAnwM3v' \
  -H 'origin: https://www.walmart.com' \
  -H 'sec-fetch-site: same-origin' \
  -H 'sec-fetch-mode: cors' \
  -H 'sec-fetch-dest: empty' \
  -H 'referer: https://www.walmart.com/orders' \
  -H 'accept-language: vi' \
  --data-raw $'{"query":"query getGuestOrder($orderId:ID\u0021 $emailAddress:String\u0021){guestOrder(input:{id:$orderId emailAddress:$emailAddress}){...OrderFieldsFragment}}fragment cancelReason on OrderCancelReason{__typename subReasonCode subDescription}fragment priceDetailFragment on OrderPriceDetailRow{label value displayValue info{title message}rowInfo{...orderPriceDetailRowInfo}}fragment orderPriceDetailRowInfo on OrderPriceDetailRowInfo{title message{...textFragment}}fragment price on Price{displayValue value}fragment variants on MapEntry{name value}fragment OrderAddOn on OrderAddOn{lineId uniqueLineId productInfo{name usItemId offerId}quantityString quantityLabel type fulfillmentInstructions{...textFragment}actions{manageProtectionPlan{...orderActionFragment}cancel}priceInfo{linePrice{...price}}quantity isActive}fragment orderDonationDetails on OrderDonationDetails{message{...textFragment}emailReceipt emailReceiptToken status{...textFragment}errorStatus}fragment orderLineItem on OrderLineItem{id uniqueId actions{contactSeller cancel addToCart configureCake reviewItem resendEGiftCardToken protectionPlan{...orderActionFragment}manageProtectionPlan{...orderActionFragment}}isGift digitalDeliveryMessage quantity quantityString quantityLabel isSubstitutionSelected fulfilledItems{id quantityString priceInfo{itemPrice{value}}product{usItemId name}}isReturnable returnEligibilityMessage product{name usItemId imageInfo{thumbnailUrl}canonicalUrl offerId sellerId sellerName hasSellerBadge seller{sellerId name}orderLimit orderMinLimit weightIncrement salesUnit salesUnitType isSubstitutionEligible isAlcohol}reshop{reshopMessage isShippingAvailable minPromiseDate maxPromiseDate}selectedVariants{...variants}variantAdditionalInfo{parts{text nativeAction}}priceInfo{priceDisplayCodes{showItemPrice priceDisplayCondition finalCostByWeight}itemPrice{...price}linePrice{...price}unitPrice{...price}preDiscountedLinePrice{...price}additionalLines{name value}}discounts{label labelText{...textFragment}}itemReviewed activationCodes{label code}protectionPlanMessage{...textFragment}showSeller isShippedByWalmart seller{id name isPro}digitalDeliveryPhoneNumber addOns{...OrderAddOn}multiboxBundleId}fragment DriverFragment on Driver{id firstName photoUrl}fragment OrderGroupFragment on OrderGroup{driver{...DriverFragment}deliveryDate fulfillmentType status{...OrderGroupStatusFragment}showSeller isShippedByWalmart seller{...SellerFragment}id itemCount items{...LiteLineItemFragment}pickupPerson{firstName lastName email}accessPointId shipment{...ShipmentFragment}returnEligibilityMessage actions{...OrderGroupActionsFragment}recipientEmailAddress digitalDelivery{...DigitalDeliveryFragment}tireInstallationReservation{status extraText}}fragment OrderGroupStatusFragment on OrderGroupStatus{statusType showStatusTracker statusTracker{status label isCurrent}message{...textFragment}subtext subMessage{...textFragment}notice helpCenterText{...textFragment}}fragment textFragment on Text{parts{bold url text nativeAction lineBreak}}fragment LiteLineItemFragment on OrderLineItem{id quantity product{name usItemId imageInfo{thumbnailUrl}offerId isAlcohol}priceInfo{linePrice{...price}}}fragment SellerFragment on GroupSeller{id name isPro}fragment DigitalDeliveryFragment on DigitalDelivery{title name instructions{...textFragment}}fragment ShipmentFragment on Shipment{id trackingNumber isExternalTracking trackingUrl proofOfDelivery{photoUrl photoPreviewUrl showPreview}}fragment OrderGroupActionsFragment on OrderGroupActions{reorder edit track changeSlot checkin editDeliveryInstructions editPickupPerson editTip tip cancel enableTip{...orderActionFragment}enableEdit{...orderActionFragment}rescheduleTireInstall{...orderActionFragment}cancelTireInstall{...orderActionFragment}help viewCancellationDetails{...cancellationDetailsActionFragment}}fragment cancellationDetailsActionFragment on CancellationDetailsAction{label heading text{...textFragment}}fragment ODPGroupCategoryFragment on OrderCategory{type name subtext returnMessage substitutionsBanner{...textFragment}showExtendedSubstitutions actions{substitutions{message label type}nilPickReshop{message action{text url}}returnDetails viewCancellationDetails{...cancellationDetailsActionFragment}trackOnInHomeApp}banner{...textFragment}accordionState items{...orderLineItem}substitutions{...orderLineItem fulfilledItems{...orderLineItem}}returnInfo{...returnInfoFragment}}fragment ODPGroupFragment on OrderGroup{id fulfillmentType deliveryMessage deliveryAddress{fullName firstName lastName address{...addressFragment}}deliveryInstructions{text type typeText}deliveryPreferences{text{...textFragment}cta{...orderActionFragment}}editSubstitutionsCutOff status{statusType showStatusTracker message{...textFragment}notice helpCenterText{...textFragment}}itemCount isCategorized categories{...ODPGroupCategoryFragment}seller{id name isPro}shipment{id trackingNumber}actions{reorder edit track changeSlot checkin editDeliveryInstructions editPickupPerson tip cancel help enableTip{...orderActionFragment}enableEdit{...orderActionFragment}viewCancellationDetails{...cancellationDetailsActionFragment}enableInHome{...orderActionFragment}createGiftReceipt}cutOffTimestamp isEditSubstitutionsEligible isInHome giftDetails{recipientAddress{fullName}recipientEmail senderName giftMessage}donationDetails{...orderDonationDetails}}fragment returnInfoFragment on ReturnInfo{returnOrderId type refundPriceDetails{__typename...refundPriceDetailsFragment}refundMessage tierRefundMessage paymentMethods{__typename description cardType paymentType displayValues message{...textFragment}}actions{__typename generate scheduleOrModifyPickup{text url}reschedulePickup editPickupContact}shippingLabelUrl qrCodeImageUrl carriers{__typename id name}pickupCarrier pickupContact{nameAndAddress{fullName firstName lastName address{addressString city state postalCode addressLineOne addressLineTwo country}}phone}pickupConfirmationNumber bannerMessage{...textFragment}}fragment refundPriceDetailsFragment on RefundPriceDetails{subTotal{__typename...orderPriceDetailRowFragment}fees{__typename...orderPriceDetailRowFragment}discounts{__typename...orderPriceDetailRowFragment}taxTotal{__typename...orderPriceDetailRowFragment}grandTotal{__typename...orderPriceDetailRowFragment}}fragment orderPriceDetailRowFragment on OrderPriceDetailRow{label displayValue value info{__typename title message}}fragment addressFragment on OrderAddress{addressString addressLineOne addressLineTwo state postalCode city}fragment ODPPickupInfo on OrderGroup{pickupInstructions pickupPerson{...person}alternatePickupPerson{...person}store{id name address{...addressFragment}}}fragment person on OrderPickupPerson{firstName lastName email}fragment ODPTippingInfo on OrderGroup{addTipMessage{...textFragment}driver{...DriverFragment}tipping{min{...price}max{...price}suggested{...price}preselected}subtotal{...price}}fragment orderActionFragment on Action{text url}fragment orderCustomer on OrderCustomer{id firstName lastName email isGuest isEmailRegistered}fragment OrderFieldsFragment on Order{__typename id version type customer{...orderCustomer}displayId idBarcodeImageUrl(barWidth:3 barHeight:100) isFuelPurchase title shortTitle timezone tippableGroup{...OrderGroupFragment}amendableGroup{id changeSlotIterationsLeft cutOffTimestamp fulfillmentType deliveryAddress{fullName firstName lastName address{addressString addressLineOne addressLineTwo state postalCode city country}}isAmendInProgress}substitutionsBanner{heading subheading longSubheading}groups_2101{__typename...OrderGroupFragment...ODPGroupFragment...ODPPickupInfo...ODPTippingInfo}multiboxBundles{...orderLineItem}itemCancelReasons{__typename...cancelReason}groupCancelReasons{__typename...cancelReason}priceDetails{__typename subTotal{__typename...priceDetailFragment}taxTotal{__typename...priceDetailFragment}grandTotal{__typename...priceDetailFragment}authorizationAmount{__typename...priceDetailFragment}fees{__typename...priceDetailFragment}discounts{__typename...priceDetailFragment}minimumThreshold{__typename...price}belowMinimumFee{__typename...priceDetailFragment}driverTip{__typename...priceDetailFragment}donations{__typename...priceDetailFragment}}paymentMethods{__typename description cardType paymentType displayValues message{...textFragment}actions{connectToCapitalOne{...orderActionFragment}visitAffirm{...orderActionFragment}}}actions{__typename return pendingReturn cancel startReturn{...orderActionFragment}reorder}banners{...textFragment}}","variables":{"orderId":"2842235900972","emailAddress":"t.floyd42@yahoo.com"}}' \
  --compressed`
 
for (( i=0; i<=4; i++ ))
do
  if [[ $curl15 =~ "error"  || $curl15 =~ "blocked" ]]; then
    echo "Lỗi email số 15"
    indexOrder15=`echo error`
    break
  elif [[ `echo $curl15 | jq '.data.guestOrder.groups_2101['${i[@]}'].items[0].product.usItemId'` == '"55234301"' ]]; then
    indexOrder15=`echo $i`
    indexItem15=`echo 0`
  elif [[ `echo $curl15 | jq '.data.guestOrder.groups_2101['${i[@]}'].items[1].product.usItemId'` == '"55234301"' ]]; then
    indexOrder15=`echo $i`
    indexItem15=`echo 1`
  elif [[ `echo $curl15 | jq '.data.guestOrder.groups_2101['${i[@]}'].items[2].product.usItemId'` == '"55234301"' ]]; then
    indexOrder15=`echo $i`
    indexItem15=`echo 2`
  elif [[ `echo $curl15 | jq '.data.guestOrder.groups_2101['${i[@]}'].items[3].product.usItemId'` == '"55234301"' ]]; then
    indexOrder15=`echo $i`
    indexItem15=`echo 3`
  fi
done

if [[ $indexOrder15 != "error" ]]; then
echo $curl15 | jq '.data.guestOrder.id' >> track-OrderID.txt
echo $curl15 | jq '.data.guestOrder.customer.email' >> track-email.txt
echo $curl15 | jq '.data.guestOrder.groups_2101['$indexOrder15'].items['$indexItem15'].product.usItemId' >> track-usItemId.txt
echo $curl15 | jq '.data.guestOrder.groups_2101['$indexOrder15'].items['$indexItem15'].priceInfo.linePrice.value' >> track-priceValue.txt
echo $curl15 | jq '.data.guestOrder.groups_2101['$indexOrder15'].deliveryAddress.fullName' >> track-fullName.txt
echo $curl15 | jq '.data.guestOrder.groups_2101['$indexOrder15'].deliveryAddress.address.addressString' >> track-address.txt
echo $curl15 | jq '.data.guestOrder.groups_2101['$indexOrder15'].status.message.parts[].text' >> track-status.txt
echo $curl15 | jq '.data.guestOrder.groups_2101['$indexOrder15'].shipment.trackingNumber' >> track-number.txt
echo $curl15 | jq '.data.guestOrder.groups_2101['$indexOrder15'].shipment.trackingUrl' >> track-url.txt
fi

curl16=`curl 'https://www.walmart.com/orchestra/home/graphql' \
  -H 'authority: www.walmart.com' \
  -H 'sec-ch-ua: " Not A;Brand";v="99", "Chromium";v="96", "Microsoft Edge";v="96"' \
  -H 'x-o-platform: rweb' \
  -H 'dnt: 1' \
  -H 'x-o-correlation-id: wrvYiSFTlAmd8j7a8DDmpuyOpCN_heAnwM3v' \
  -H 'device_profile_ref_id: _s1F3NO8Y2JjaBUKPDcY4iFDWiIl9CyqiJjf' \
  -H 'x-latency-trace: 1' \
  -H 'wm_mp: true' \
  -H 'x-o-market: us' \
  -H 'x-o-platform-version: main-253-ebbb47' \
  -H 'x-o-gql-query: query getGuestOrder' \
  -H 'wm_page_url: https://www.walmart.com/orders' \
  -H 'x-apollo-operation-name: getGuestOrder' \
  -H 'sec-ch-ua-platform: "macOS"' \
  -H 'sec-ch-ua-mobile: ?0' \
  -H 'user-agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/96.0.4664.110 Safari/537.36 Edg/96.0.1054.62' \
  -H 'x-o-segment: oaoh' \
  -H 'content-type: application/json' \
  -H 'accept: application/json' \
  -H 'x-enable-server-timing: 1' \
  -H 'x-o-ccm: server' \
  -H 'wm_qos.correlation_id: wrvYiSFTlAmd8j7a8DDmpuyOpCN_heAnwM3v' \
  -H 'origin: https://www.walmart.com' \
  -H 'sec-fetch-site: same-origin' \
  -H 'sec-fetch-mode: cors' \
  -H 'sec-fetch-dest: empty' \
  -H 'referer: https://www.walmart.com/orders' \
  -H 'accept-language: vi' \
  --data-raw $'{"query":"query getGuestOrder($orderId:ID\u0021 $emailAddress:String\u0021){guestOrder(input:{id:$orderId emailAddress:$emailAddress}){...OrderFieldsFragment}}fragment cancelReason on OrderCancelReason{__typename subReasonCode subDescription}fragment priceDetailFragment on OrderPriceDetailRow{label value displayValue info{title message}rowInfo{...orderPriceDetailRowInfo}}fragment orderPriceDetailRowInfo on OrderPriceDetailRowInfo{title message{...textFragment}}fragment price on Price{displayValue value}fragment variants on MapEntry{name value}fragment OrderAddOn on OrderAddOn{lineId uniqueLineId productInfo{name usItemId offerId}quantityString quantityLabel type fulfillmentInstructions{...textFragment}actions{manageProtectionPlan{...orderActionFragment}cancel}priceInfo{linePrice{...price}}quantity isActive}fragment orderDonationDetails on OrderDonationDetails{message{...textFragment}emailReceipt emailReceiptToken status{...textFragment}errorStatus}fragment orderLineItem on OrderLineItem{id uniqueId actions{contactSeller cancel addToCart configureCake reviewItem resendEGiftCardToken protectionPlan{...orderActionFragment}manageProtectionPlan{...orderActionFragment}}isGift digitalDeliveryMessage quantity quantityString quantityLabel isSubstitutionSelected fulfilledItems{id quantityString priceInfo{itemPrice{value}}product{usItemId name}}isReturnable returnEligibilityMessage product{name usItemId imageInfo{thumbnailUrl}canonicalUrl offerId sellerId sellerName hasSellerBadge seller{sellerId name}orderLimit orderMinLimit weightIncrement salesUnit salesUnitType isSubstitutionEligible isAlcohol}reshop{reshopMessage isShippingAvailable minPromiseDate maxPromiseDate}selectedVariants{...variants}variantAdditionalInfo{parts{text nativeAction}}priceInfo{priceDisplayCodes{showItemPrice priceDisplayCondition finalCostByWeight}itemPrice{...price}linePrice{...price}unitPrice{...price}preDiscountedLinePrice{...price}additionalLines{name value}}discounts{label labelText{...textFragment}}itemReviewed activationCodes{label code}protectionPlanMessage{...textFragment}showSeller isShippedByWalmart seller{id name isPro}digitalDeliveryPhoneNumber addOns{...OrderAddOn}multiboxBundleId}fragment DriverFragment on Driver{id firstName photoUrl}fragment OrderGroupFragment on OrderGroup{driver{...DriverFragment}deliveryDate fulfillmentType status{...OrderGroupStatusFragment}showSeller isShippedByWalmart seller{...SellerFragment}id itemCount items{...LiteLineItemFragment}pickupPerson{firstName lastName email}accessPointId shipment{...ShipmentFragment}returnEligibilityMessage actions{...OrderGroupActionsFragment}recipientEmailAddress digitalDelivery{...DigitalDeliveryFragment}tireInstallationReservation{status extraText}}fragment OrderGroupStatusFragment on OrderGroupStatus{statusType showStatusTracker statusTracker{status label isCurrent}message{...textFragment}subtext subMessage{...textFragment}notice helpCenterText{...textFragment}}fragment textFragment on Text{parts{bold url text nativeAction lineBreak}}fragment LiteLineItemFragment on OrderLineItem{id quantity product{name usItemId imageInfo{thumbnailUrl}offerId isAlcohol}priceInfo{linePrice{...price}}}fragment SellerFragment on GroupSeller{id name isPro}fragment DigitalDeliveryFragment on DigitalDelivery{title name instructions{...textFragment}}fragment ShipmentFragment on Shipment{id trackingNumber isExternalTracking trackingUrl proofOfDelivery{photoUrl photoPreviewUrl showPreview}}fragment OrderGroupActionsFragment on OrderGroupActions{reorder edit track changeSlot checkin editDeliveryInstructions editPickupPerson editTip tip cancel enableTip{...orderActionFragment}enableEdit{...orderActionFragment}rescheduleTireInstall{...orderActionFragment}cancelTireInstall{...orderActionFragment}help viewCancellationDetails{...cancellationDetailsActionFragment}}fragment cancellationDetailsActionFragment on CancellationDetailsAction{label heading text{...textFragment}}fragment ODPGroupCategoryFragment on OrderCategory{type name subtext returnMessage substitutionsBanner{...textFragment}showExtendedSubstitutions actions{substitutions{message label type}nilPickReshop{message action{text url}}returnDetails viewCancellationDetails{...cancellationDetailsActionFragment}trackOnInHomeApp}banner{...textFragment}accordionState items{...orderLineItem}substitutions{...orderLineItem fulfilledItems{...orderLineItem}}returnInfo{...returnInfoFragment}}fragment ODPGroupFragment on OrderGroup{id fulfillmentType deliveryMessage deliveryAddress{fullName firstName lastName address{...addressFragment}}deliveryInstructions{text type typeText}deliveryPreferences{text{...textFragment}cta{...orderActionFragment}}editSubstitutionsCutOff status{statusType showStatusTracker message{...textFragment}notice helpCenterText{...textFragment}}itemCount isCategorized categories{...ODPGroupCategoryFragment}seller{id name isPro}shipment{id trackingNumber}actions{reorder edit track changeSlot checkin editDeliveryInstructions editPickupPerson tip cancel help enableTip{...orderActionFragment}enableEdit{...orderActionFragment}viewCancellationDetails{...cancellationDetailsActionFragment}enableInHome{...orderActionFragment}createGiftReceipt}cutOffTimestamp isEditSubstitutionsEligible isInHome giftDetails{recipientAddress{fullName}recipientEmail senderName giftMessage}donationDetails{...orderDonationDetails}}fragment returnInfoFragment on ReturnInfo{returnOrderId type refundPriceDetails{__typename...refundPriceDetailsFragment}refundMessage tierRefundMessage paymentMethods{__typename description cardType paymentType displayValues message{...textFragment}}actions{__typename generate scheduleOrModifyPickup{text url}reschedulePickup editPickupContact}shippingLabelUrl qrCodeImageUrl carriers{__typename id name}pickupCarrier pickupContact{nameAndAddress{fullName firstName lastName address{addressString city state postalCode addressLineOne addressLineTwo country}}phone}pickupConfirmationNumber bannerMessage{...textFragment}}fragment refundPriceDetailsFragment on RefundPriceDetails{subTotal{__typename...orderPriceDetailRowFragment}fees{__typename...orderPriceDetailRowFragment}discounts{__typename...orderPriceDetailRowFragment}taxTotal{__typename...orderPriceDetailRowFragment}grandTotal{__typename...orderPriceDetailRowFragment}}fragment orderPriceDetailRowFragment on OrderPriceDetailRow{label displayValue value info{__typename title message}}fragment addressFragment on OrderAddress{addressString addressLineOne addressLineTwo state postalCode city}fragment ODPPickupInfo on OrderGroup{pickupInstructions pickupPerson{...person}alternatePickupPerson{...person}store{id name address{...addressFragment}}}fragment person on OrderPickupPerson{firstName lastName email}fragment ODPTippingInfo on OrderGroup{addTipMessage{...textFragment}driver{...DriverFragment}tipping{min{...price}max{...price}suggested{...price}preselected}subtotal{...price}}fragment orderActionFragment on Action{text url}fragment orderCustomer on OrderCustomer{id firstName lastName email isGuest isEmailRegistered}fragment OrderFieldsFragment on Order{__typename id version type customer{...orderCustomer}displayId idBarcodeImageUrl(barWidth:3 barHeight:100) isFuelPurchase title shortTitle timezone tippableGroup{...OrderGroupFragment}amendableGroup{id changeSlotIterationsLeft cutOffTimestamp fulfillmentType deliveryAddress{fullName firstName lastName address{addressString addressLineOne addressLineTwo state postalCode city country}}isAmendInProgress}substitutionsBanner{heading subheading longSubheading}groups_2101{__typename...OrderGroupFragment...ODPGroupFragment...ODPPickupInfo...ODPTippingInfo}multiboxBundles{...orderLineItem}itemCancelReasons{__typename...cancelReason}groupCancelReasons{__typename...cancelReason}priceDetails{__typename subTotal{__typename...priceDetailFragment}taxTotal{__typename...priceDetailFragment}grandTotal{__typename...priceDetailFragment}authorizationAmount{__typename...priceDetailFragment}fees{__typename...priceDetailFragment}discounts{__typename...priceDetailFragment}minimumThreshold{__typename...price}belowMinimumFee{__typename...priceDetailFragment}driverTip{__typename...priceDetailFragment}donations{__typename...priceDetailFragment}}paymentMethods{__typename description cardType paymentType displayValues message{...textFragment}actions{connectToCapitalOne{...orderActionFragment}visitAffirm{...orderActionFragment}}}actions{__typename return pendingReturn cancel startReturn{...orderActionFragment}reorder}banners{...textFragment}}","variables":{"orderId":"2862238996844","emailAddress":"crystal.velasco23@gmail.com"}}' \
  --compressed`
 
for (( i=0; i<=4; i++ ))
do
  if [[ $curl16 =~ "error"  || $curl16 =~ "blocked" ]]; then
    echo "Lỗi email số 16"
    indexOrder16=`echo error`
    break
  elif [[ `echo $curl16 | jq '.data.guestOrder.groups_2101['${i[@]}'].items[0].product.usItemId'` == '"137359681"' ]]; then
    indexOrder16=`echo $i`
    indexItem16=`echo 0`
  elif [[ `echo $curl16 | jq '.data.guestOrder.groups_2101['${i[@]}'].items[1].product.usItemId'` == '"137359681"' ]]; then
    indexOrder16=`echo $i`
    indexItem16=`echo 1`
  elif [[ `echo $curl16 | jq '.data.guestOrder.groups_2101['${i[@]}'].items[2].product.usItemId'` == '"137359681"' ]]; then
    indexOrder16=`echo $i`
    indexItem16=`echo 2`
  elif [[ `echo $curl16 | jq '.data.guestOrder.groups_2101['${i[@]}'].items[3].product.usItemId'` == '"137359681"' ]]; then
    indexOrder16=`echo $i`
    indexItem16=`echo 3`
  fi
done

if [[ $indexOrder16 != "error" ]]; then
echo $curl16 | jq '.data.guestOrder.id' >> track-OrderID.txt
echo $curl16 | jq '.data.guestOrder.customer.email' >> track-email.txt
echo $curl16 | jq '.data.guestOrder.groups_2101['$indexOrder16'].items['$indexItem16'].product.usItemId' >> track-usItemId.txt
echo $curl16 | jq '.data.guestOrder.groups_2101['$indexOrder16'].items['$indexItem16'].priceInfo.linePrice.value' >> track-priceValue.txt
echo $curl16 | jq '.data.guestOrder.groups_2101['$indexOrder16'].deliveryAddress.fullName' >> track-fullName.txt
echo $curl16 | jq '.data.guestOrder.groups_2101['$indexOrder16'].deliveryAddress.address.addressString' >> track-address.txt
echo $curl16 | jq '.data.guestOrder.groups_2101['$indexOrder16'].status.message.parts[].text' >> track-status.txt
echo $curl16 | jq '.data.guestOrder.groups_2101['$indexOrder16'].shipment.trackingNumber' >> track-number.txt
echo $curl16 | jq '.data.guestOrder.groups_2101['$indexOrder16'].shipment.trackingUrl' >> track-url.txt
fi

curl17=`curl 'https://www.walmart.com/orchestra/home/graphql' \
  -H 'authority: www.walmart.com' \
  -H 'sec-ch-ua: " Not A;Brand";v="99", "Chromium";v="96", "Microsoft Edge";v="96"' \
  -H 'x-o-platform: rweb' \
  -H 'dnt: 1' \
  -H 'x-o-correlation-id: wrvYiSFTlAmd8j7a8DDmpuyOpCN_heAnwM3v' \
  -H 'device_profile_ref_id: _s1F3NO8Y2JjaBUKPDcY4iFDWiIl9CyqiJjf' \
  -H 'x-latency-trace: 1' \
  -H 'wm_mp: true' \
  -H 'x-o-market: us' \
  -H 'x-o-platform-version: main-253-ebbb47' \
  -H 'x-o-gql-query: query getGuestOrder' \
  -H 'wm_page_url: https://www.walmart.com/orders' \
  -H 'x-apollo-operation-name: getGuestOrder' \
  -H 'sec-ch-ua-platform: "macOS"' \
  -H 'sec-ch-ua-mobile: ?0' \
  -H 'user-agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/96.0.4664.110 Safari/537.36 Edg/96.0.1054.62' \
  -H 'x-o-segment: oaoh' \
  -H 'content-type: application/json' \
  -H 'accept: application/json' \
  -H 'x-enable-server-timing: 1' \
  -H 'x-o-ccm: server' \
  -H 'wm_qos.correlation_id: wrvYiSFTlAmd8j7a8DDmpuyOpCN_heAnwM3v' \
  -H 'origin: https://www.walmart.com' \
  -H 'sec-fetch-site: same-origin' \
  -H 'sec-fetch-mode: cors' \
  -H 'sec-fetch-dest: empty' \
  -H 'referer: https://www.walmart.com/orders' \
  -H 'accept-language: vi' \
  --data-raw $'{"query":"query getGuestOrder($orderId:ID\u0021 $emailAddress:String\u0021){guestOrder(input:{id:$orderId emailAddress:$emailAddress}){...OrderFieldsFragment}}fragment cancelReason on OrderCancelReason{__typename subReasonCode subDescription}fragment priceDetailFragment on OrderPriceDetailRow{label value displayValue info{title message}rowInfo{...orderPriceDetailRowInfo}}fragment orderPriceDetailRowInfo on OrderPriceDetailRowInfo{title message{...textFragment}}fragment price on Price{displayValue value}fragment variants on MapEntry{name value}fragment OrderAddOn on OrderAddOn{lineId uniqueLineId productInfo{name usItemId offerId}quantityString quantityLabel type fulfillmentInstructions{...textFragment}actions{manageProtectionPlan{...orderActionFragment}cancel}priceInfo{linePrice{...price}}quantity isActive}fragment orderDonationDetails on OrderDonationDetails{message{...textFragment}emailReceipt emailReceiptToken status{...textFragment}errorStatus}fragment orderLineItem on OrderLineItem{id uniqueId actions{contactSeller cancel addToCart configureCake reviewItem resendEGiftCardToken protectionPlan{...orderActionFragment}manageProtectionPlan{...orderActionFragment}}isGift digitalDeliveryMessage quantity quantityString quantityLabel isSubstitutionSelected fulfilledItems{id quantityString priceInfo{itemPrice{value}}product{usItemId name}}isReturnable returnEligibilityMessage product{name usItemId imageInfo{thumbnailUrl}canonicalUrl offerId sellerId sellerName hasSellerBadge seller{sellerId name}orderLimit orderMinLimit weightIncrement salesUnit salesUnitType isSubstitutionEligible isAlcohol}reshop{reshopMessage isShippingAvailable minPromiseDate maxPromiseDate}selectedVariants{...variants}variantAdditionalInfo{parts{text nativeAction}}priceInfo{priceDisplayCodes{showItemPrice priceDisplayCondition finalCostByWeight}itemPrice{...price}linePrice{...price}unitPrice{...price}preDiscountedLinePrice{...price}additionalLines{name value}}discounts{label labelText{...textFragment}}itemReviewed activationCodes{label code}protectionPlanMessage{...textFragment}showSeller isShippedByWalmart seller{id name isPro}digitalDeliveryPhoneNumber addOns{...OrderAddOn}multiboxBundleId}fragment DriverFragment on Driver{id firstName photoUrl}fragment OrderGroupFragment on OrderGroup{driver{...DriverFragment}deliveryDate fulfillmentType status{...OrderGroupStatusFragment}showSeller isShippedByWalmart seller{...SellerFragment}id itemCount items{...LiteLineItemFragment}pickupPerson{firstName lastName email}accessPointId shipment{...ShipmentFragment}returnEligibilityMessage actions{...OrderGroupActionsFragment}recipientEmailAddress digitalDelivery{...DigitalDeliveryFragment}tireInstallationReservation{status extraText}}fragment OrderGroupStatusFragment on OrderGroupStatus{statusType showStatusTracker statusTracker{status label isCurrent}message{...textFragment}subtext subMessage{...textFragment}notice helpCenterText{...textFragment}}fragment textFragment on Text{parts{bold url text nativeAction lineBreak}}fragment LiteLineItemFragment on OrderLineItem{id quantity product{name usItemId imageInfo{thumbnailUrl}offerId isAlcohol}priceInfo{linePrice{...price}}}fragment SellerFragment on GroupSeller{id name isPro}fragment DigitalDeliveryFragment on DigitalDelivery{title name instructions{...textFragment}}fragment ShipmentFragment on Shipment{id trackingNumber isExternalTracking trackingUrl proofOfDelivery{photoUrl photoPreviewUrl showPreview}}fragment OrderGroupActionsFragment on OrderGroupActions{reorder edit track changeSlot checkin editDeliveryInstructions editPickupPerson editTip tip cancel enableTip{...orderActionFragment}enableEdit{...orderActionFragment}rescheduleTireInstall{...orderActionFragment}cancelTireInstall{...orderActionFragment}help viewCancellationDetails{...cancellationDetailsActionFragment}}fragment cancellationDetailsActionFragment on CancellationDetailsAction{label heading text{...textFragment}}fragment ODPGroupCategoryFragment on OrderCategory{type name subtext returnMessage substitutionsBanner{...textFragment}showExtendedSubstitutions actions{substitutions{message label type}nilPickReshop{message action{text url}}returnDetails viewCancellationDetails{...cancellationDetailsActionFragment}trackOnInHomeApp}banner{...textFragment}accordionState items{...orderLineItem}substitutions{...orderLineItem fulfilledItems{...orderLineItem}}returnInfo{...returnInfoFragment}}fragment ODPGroupFragment on OrderGroup{id fulfillmentType deliveryMessage deliveryAddress{fullName firstName lastName address{...addressFragment}}deliveryInstructions{text type typeText}deliveryPreferences{text{...textFragment}cta{...orderActionFragment}}editSubstitutionsCutOff status{statusType showStatusTracker message{...textFragment}notice helpCenterText{...textFragment}}itemCount isCategorized categories{...ODPGroupCategoryFragment}seller{id name isPro}shipment{id trackingNumber}actions{reorder edit track changeSlot checkin editDeliveryInstructions editPickupPerson tip cancel help enableTip{...orderActionFragment}enableEdit{...orderActionFragment}viewCancellationDetails{...cancellationDetailsActionFragment}enableInHome{...orderActionFragment}createGiftReceipt}cutOffTimestamp isEditSubstitutionsEligible isInHome giftDetails{recipientAddress{fullName}recipientEmail senderName giftMessage}donationDetails{...orderDonationDetails}}fragment returnInfoFragment on ReturnInfo{returnOrderId type refundPriceDetails{__typename...refundPriceDetailsFragment}refundMessage tierRefundMessage paymentMethods{__typename description cardType paymentType displayValues message{...textFragment}}actions{__typename generate scheduleOrModifyPickup{text url}reschedulePickup editPickupContact}shippingLabelUrl qrCodeImageUrl carriers{__typename id name}pickupCarrier pickupContact{nameAndAddress{fullName firstName lastName address{addressString city state postalCode addressLineOne addressLineTwo country}}phone}pickupConfirmationNumber bannerMessage{...textFragment}}fragment refundPriceDetailsFragment on RefundPriceDetails{subTotal{__typename...orderPriceDetailRowFragment}fees{__typename...orderPriceDetailRowFragment}discounts{__typename...orderPriceDetailRowFragment}taxTotal{__typename...orderPriceDetailRowFragment}grandTotal{__typename...orderPriceDetailRowFragment}}fragment orderPriceDetailRowFragment on OrderPriceDetailRow{label displayValue value info{__typename title message}}fragment addressFragment on OrderAddress{addressString addressLineOne addressLineTwo state postalCode city}fragment ODPPickupInfo on OrderGroup{pickupInstructions pickupPerson{...person}alternatePickupPerson{...person}store{id name address{...addressFragment}}}fragment person on OrderPickupPerson{firstName lastName email}fragment ODPTippingInfo on OrderGroup{addTipMessage{...textFragment}driver{...DriverFragment}tipping{min{...price}max{...price}suggested{...price}preselected}subtotal{...price}}fragment orderActionFragment on Action{text url}fragment orderCustomer on OrderCustomer{id firstName lastName email isGuest isEmailRegistered}fragment OrderFieldsFragment on Order{__typename id version type customer{...orderCustomer}displayId idBarcodeImageUrl(barWidth:3 barHeight:100) isFuelPurchase title shortTitle timezone tippableGroup{...OrderGroupFragment}amendableGroup{id changeSlotIterationsLeft cutOffTimestamp fulfillmentType deliveryAddress{fullName firstName lastName address{addressString addressLineOne addressLineTwo state postalCode city country}}isAmendInProgress}substitutionsBanner{heading subheading longSubheading}groups_2101{__typename...OrderGroupFragment...ODPGroupFragment...ODPPickupInfo...ODPTippingInfo}multiboxBundles{...orderLineItem}itemCancelReasons{__typename...cancelReason}groupCancelReasons{__typename...cancelReason}priceDetails{__typename subTotal{__typename...priceDetailFragment}taxTotal{__typename...priceDetailFragment}grandTotal{__typename...priceDetailFragment}authorizationAmount{__typename...priceDetailFragment}fees{__typename...priceDetailFragment}discounts{__typename...priceDetailFragment}minimumThreshold{__typename...price}belowMinimumFee{__typename...priceDetailFragment}driverTip{__typename...priceDetailFragment}donations{__typename...priceDetailFragment}}paymentMethods{__typename description cardType paymentType displayValues message{...textFragment}actions{connectToCapitalOne{...orderActionFragment}visitAffirm{...orderActionFragment}}}actions{__typename return pendingReturn cancel startReturn{...orderActionFragment}reorder}banners{...textFragment}}","variables":{"orderId":"2822229360887","emailAddress":"jaimearturogarza@yahoo.com"}}' \
  --compressed`
 
for (( i=0; i<=4; i++ ))
do
  if [[ $curl17 =~ "error"  || $curl17 =~ "blocked" ]]; then
    echo "Lỗi email số 17"
    indexOrder17=`echo error`
    break
  elif [[ `echo $curl17 | jq '.data.guestOrder.groups_2101['${i[@]}'].items[0].product.usItemId'` == '"874080200"' ]]; then
    indexOrder17=`echo $i`
    indexItem17=`echo 0`
  elif [[ `echo $curl17 | jq '.data.guestOrder.groups_2101['${i[@]}'].items[1].product.usItemId'` == '"874080200"' ]]; then
    indexOrder17=`echo $i`
    indexItem17=`echo 1`
  elif [[ `echo $curl17 | jq '.data.guestOrder.groups_2101['${i[@]}'].items[2].product.usItemId'` == '"874080200"' ]]; then
    indexOrder17=`echo $i`
    indexItem17=`echo 2`
  elif [[ `echo $curl17 | jq '.data.guestOrder.groups_2101['${i[@]}'].items[3].product.usItemId'` == '"874080200"' ]]; then
    indexOrder17=`echo $i`
    indexItem17=`echo 3`
  fi
done

if [[ $indexOrder17 != "error" ]]; then
echo $curl17 | jq '.data.guestOrder.id' >> track-OrderID.txt
echo $curl17 | jq '.data.guestOrder.customer.email' >> track-email.txt
echo $curl17 | jq '.data.guestOrder.groups_2101['$indexOrder17'].items['$indexItem17'].product.usItemId' >> track-usItemId.txt
echo $curl17 | jq '.data.guestOrder.groups_2101['$indexOrder17'].items['$indexItem17'].priceInfo.linePrice.value' >> track-priceValue.txt
echo $curl17 | jq '.data.guestOrder.groups_2101['$indexOrder17'].deliveryAddress.fullName' >> track-fullName.txt
echo $curl17 | jq '.data.guestOrder.groups_2101['$indexOrder17'].deliveryAddress.address.addressString' >> track-address.txt
echo $curl17 | jq '.data.guestOrder.groups_2101['$indexOrder17'].status.message.parts[].text' >> track-status.txt
echo $curl17 | jq '.data.guestOrder.groups_2101['$indexOrder17'].shipment.trackingNumber' >> track-number.txt
echo $curl17 | jq '.data.guestOrder.groups_2101['$indexOrder17'].shipment.trackingUrl' >> track-url.txt
fi

curl18=`curl 'https://www.walmart.com/orchestra/home/graphql' \
  -H 'authority: www.walmart.com' \
  -H 'sec-ch-ua: " Not A;Brand";v="99", "Chromium";v="96", "Microsoft Edge";v="96"' \
  -H 'x-o-platform: rweb' \
  -H 'dnt: 1' \
  -H 'x-o-correlation-id: wrvYiSFTlAmd8j7a8DDmpuyOpCN_heAnwM3v' \
  -H 'device_profile_ref_id: _s1F3NO8Y2JjaBUKPDcY4iFDWiIl9CyqiJjf' \
  -H 'x-latency-trace: 1' \
  -H 'wm_mp: true' \
  -H 'x-o-market: us' \
  -H 'x-o-platform-version: main-253-ebbb47' \
  -H 'x-o-gql-query: query getGuestOrder' \
  -H 'wm_page_url: https://www.walmart.com/orders' \
  -H 'x-apollo-operation-name: getGuestOrder' \
  -H 'sec-ch-ua-platform: "macOS"' \
  -H 'sec-ch-ua-mobile: ?0' \
  -H 'user-agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/96.0.4664.110 Safari/537.36 Edg/96.0.1054.62' \
  -H 'x-o-segment: oaoh' \
  -H 'content-type: application/json' \
  -H 'accept: application/json' \
  -H 'x-enable-server-timing: 1' \
  -H 'x-o-ccm: server' \
  -H 'wm_qos.correlation_id: wrvYiSFTlAmd8j7a8DDmpuyOpCN_heAnwM3v' \
  -H 'origin: https://www.walmart.com' \
  -H 'sec-fetch-site: same-origin' \
  -H 'sec-fetch-mode: cors' \
  -H 'sec-fetch-dest: empty' \
  -H 'referer: https://www.walmart.com/orders' \
  -H 'accept-language: vi' \
  --data-raw $'{"query":"query getGuestOrder($orderId:ID\u0021 $emailAddress:String\u0021){guestOrder(input:{id:$orderId emailAddress:$emailAddress}){...OrderFieldsFragment}}fragment cancelReason on OrderCancelReason{__typename subReasonCode subDescription}fragment priceDetailFragment on OrderPriceDetailRow{label value displayValue info{title message}rowInfo{...orderPriceDetailRowInfo}}fragment orderPriceDetailRowInfo on OrderPriceDetailRowInfo{title message{...textFragment}}fragment price on Price{displayValue value}fragment variants on MapEntry{name value}fragment OrderAddOn on OrderAddOn{lineId uniqueLineId productInfo{name usItemId offerId}quantityString quantityLabel type fulfillmentInstructions{...textFragment}actions{manageProtectionPlan{...orderActionFragment}cancel}priceInfo{linePrice{...price}}quantity isActive}fragment orderDonationDetails on OrderDonationDetails{message{...textFragment}emailReceipt emailReceiptToken status{...textFragment}errorStatus}fragment orderLineItem on OrderLineItem{id uniqueId actions{contactSeller cancel addToCart configureCake reviewItem resendEGiftCardToken protectionPlan{...orderActionFragment}manageProtectionPlan{...orderActionFragment}}isGift digitalDeliveryMessage quantity quantityString quantityLabel isSubstitutionSelected fulfilledItems{id quantityString priceInfo{itemPrice{value}}product{usItemId name}}isReturnable returnEligibilityMessage product{name usItemId imageInfo{thumbnailUrl}canonicalUrl offerId sellerId sellerName hasSellerBadge seller{sellerId name}orderLimit orderMinLimit weightIncrement salesUnit salesUnitType isSubstitutionEligible isAlcohol}reshop{reshopMessage isShippingAvailable minPromiseDate maxPromiseDate}selectedVariants{...variants}variantAdditionalInfo{parts{text nativeAction}}priceInfo{priceDisplayCodes{showItemPrice priceDisplayCondition finalCostByWeight}itemPrice{...price}linePrice{...price}unitPrice{...price}preDiscountedLinePrice{...price}additionalLines{name value}}discounts{label labelText{...textFragment}}itemReviewed activationCodes{label code}protectionPlanMessage{...textFragment}showSeller isShippedByWalmart seller{id name isPro}digitalDeliveryPhoneNumber addOns{...OrderAddOn}multiboxBundleId}fragment DriverFragment on Driver{id firstName photoUrl}fragment OrderGroupFragment on OrderGroup{driver{...DriverFragment}deliveryDate fulfillmentType status{...OrderGroupStatusFragment}showSeller isShippedByWalmart seller{...SellerFragment}id itemCount items{...LiteLineItemFragment}pickupPerson{firstName lastName email}accessPointId shipment{...ShipmentFragment}returnEligibilityMessage actions{...OrderGroupActionsFragment}recipientEmailAddress digitalDelivery{...DigitalDeliveryFragment}tireInstallationReservation{status extraText}}fragment OrderGroupStatusFragment on OrderGroupStatus{statusType showStatusTracker statusTracker{status label isCurrent}message{...textFragment}subtext subMessage{...textFragment}notice helpCenterText{...textFragment}}fragment textFragment on Text{parts{bold url text nativeAction lineBreak}}fragment LiteLineItemFragment on OrderLineItem{id quantity product{name usItemId imageInfo{thumbnailUrl}offerId isAlcohol}priceInfo{linePrice{...price}}}fragment SellerFragment on GroupSeller{id name isPro}fragment DigitalDeliveryFragment on DigitalDelivery{title name instructions{...textFragment}}fragment ShipmentFragment on Shipment{id trackingNumber isExternalTracking trackingUrl proofOfDelivery{photoUrl photoPreviewUrl showPreview}}fragment OrderGroupActionsFragment on OrderGroupActions{reorder edit track changeSlot checkin editDeliveryInstructions editPickupPerson editTip tip cancel enableTip{...orderActionFragment}enableEdit{...orderActionFragment}rescheduleTireInstall{...orderActionFragment}cancelTireInstall{...orderActionFragment}help viewCancellationDetails{...cancellationDetailsActionFragment}}fragment cancellationDetailsActionFragment on CancellationDetailsAction{label heading text{...textFragment}}fragment ODPGroupCategoryFragment on OrderCategory{type name subtext returnMessage substitutionsBanner{...textFragment}showExtendedSubstitutions actions{substitutions{message label type}nilPickReshop{message action{text url}}returnDetails viewCancellationDetails{...cancellationDetailsActionFragment}trackOnInHomeApp}banner{...textFragment}accordionState items{...orderLineItem}substitutions{...orderLineItem fulfilledItems{...orderLineItem}}returnInfo{...returnInfoFragment}}fragment ODPGroupFragment on OrderGroup{id fulfillmentType deliveryMessage deliveryAddress{fullName firstName lastName address{...addressFragment}}deliveryInstructions{text type typeText}deliveryPreferences{text{...textFragment}cta{...orderActionFragment}}editSubstitutionsCutOff status{statusType showStatusTracker message{...textFragment}notice helpCenterText{...textFragment}}itemCount isCategorized categories{...ODPGroupCategoryFragment}seller{id name isPro}shipment{id trackingNumber}actions{reorder edit track changeSlot checkin editDeliveryInstructions editPickupPerson tip cancel help enableTip{...orderActionFragment}enableEdit{...orderActionFragment}viewCancellationDetails{...cancellationDetailsActionFragment}enableInHome{...orderActionFragment}createGiftReceipt}cutOffTimestamp isEditSubstitutionsEligible isInHome giftDetails{recipientAddress{fullName}recipientEmail senderName giftMessage}donationDetails{...orderDonationDetails}}fragment returnInfoFragment on ReturnInfo{returnOrderId type refundPriceDetails{__typename...refundPriceDetailsFragment}refundMessage tierRefundMessage paymentMethods{__typename description cardType paymentType displayValues message{...textFragment}}actions{__typename generate scheduleOrModifyPickup{text url}reschedulePickup editPickupContact}shippingLabelUrl qrCodeImageUrl carriers{__typename id name}pickupCarrier pickupContact{nameAndAddress{fullName firstName lastName address{addressString city state postalCode addressLineOne addressLineTwo country}}phone}pickupConfirmationNumber bannerMessage{...textFragment}}fragment refundPriceDetailsFragment on RefundPriceDetails{subTotal{__typename...orderPriceDetailRowFragment}fees{__typename...orderPriceDetailRowFragment}discounts{__typename...orderPriceDetailRowFragment}taxTotal{__typename...orderPriceDetailRowFragment}grandTotal{__typename...orderPriceDetailRowFragment}}fragment orderPriceDetailRowFragment on OrderPriceDetailRow{label displayValue value info{__typename title message}}fragment addressFragment on OrderAddress{addressString addressLineOne addressLineTwo state postalCode city}fragment ODPPickupInfo on OrderGroup{pickupInstructions pickupPerson{...person}alternatePickupPerson{...person}store{id name address{...addressFragment}}}fragment person on OrderPickupPerson{firstName lastName email}fragment ODPTippingInfo on OrderGroup{addTipMessage{...textFragment}driver{...DriverFragment}tipping{min{...price}max{...price}suggested{...price}preselected}subtotal{...price}}fragment orderActionFragment on Action{text url}fragment orderCustomer on OrderCustomer{id firstName lastName email isGuest isEmailRegistered}fragment OrderFieldsFragment on Order{__typename id version type customer{...orderCustomer}displayId idBarcodeImageUrl(barWidth:3 barHeight:100) isFuelPurchase title shortTitle timezone tippableGroup{...OrderGroupFragment}amendableGroup{id changeSlotIterationsLeft cutOffTimestamp fulfillmentType deliveryAddress{fullName firstName lastName address{addressString addressLineOne addressLineTwo state postalCode city country}}isAmendInProgress}substitutionsBanner{heading subheading longSubheading}groups_2101{__typename...OrderGroupFragment...ODPGroupFragment...ODPPickupInfo...ODPTippingInfo}multiboxBundles{...orderLineItem}itemCancelReasons{__typename...cancelReason}groupCancelReasons{__typename...cancelReason}priceDetails{__typename subTotal{__typename...priceDetailFragment}taxTotal{__typename...priceDetailFragment}grandTotal{__typename...priceDetailFragment}authorizationAmount{__typename...priceDetailFragment}fees{__typename...priceDetailFragment}discounts{__typename...priceDetailFragment}minimumThreshold{__typename...price}belowMinimumFee{__typename...priceDetailFragment}driverTip{__typename...priceDetailFragment}donations{__typename...priceDetailFragment}}paymentMethods{__typename description cardType paymentType displayValues message{...textFragment}actions{connectToCapitalOne{...orderActionFragment}visitAffirm{...orderActionFragment}}}actions{__typename return pendingReturn cancel startReturn{...orderActionFragment}reorder}banners{...textFragment}}","variables":{"orderId":"2822229722432","emailAddress":"carriek0111@gmail.com"}}' \
  --compressed`
 
for (( i=0; i<=4; i++ ))
do
  if [[ $curl18 =~ "error"  || $curl18 =~ "blocked" ]]; then
    echo "Lỗi email số 18"
    indexOrder18=`echo error`
    break
  elif [[ `echo $curl18 | jq '.data.guestOrder.groups_2101['${i[@]}'].items[0].product.usItemId'` == '"54297033"' ]]; then
    indexOrder18=`echo $i`
    indexItem18=`echo 0`
  elif [[ `echo $curl18 | jq '.data.guestOrder.groups_2101['${i[@]}'].items[1].product.usItemId'` == '"54297033"' ]]; then
    indexOrder18=`echo $i`
    indexItem18=`echo 1`
  elif [[ `echo $curl18 | jq '.data.guestOrder.groups_2101['${i[@]}'].items[2].product.usItemId'` == '"54297033"' ]]; then
    indexOrder18=`echo $i`
    indexItem18=`echo 2`
  elif [[ `echo $curl18 | jq '.data.guestOrder.groups_2101['${i[@]}'].items[3].product.usItemId'` == '"54297033"' ]]; then
    indexOrder18=`echo $i`
    indexItem18=`echo 3`
  fi
done

if [[ $indexOrder18 != "error" ]]; then
echo $curl18 | jq '.data.guestOrder.id' >> track-OrderID.txt
echo $curl18 | jq '.data.guestOrder.customer.email' >> track-email.txt
echo $curl18 | jq '.data.guestOrder.groups_2101['$indexOrder18'].items['$indexItem18'].product.usItemId' >> track-usItemId.txt
echo $curl18 | jq '.data.guestOrder.groups_2101['$indexOrder18'].items['$indexItem18'].priceInfo.linePrice.value' >> track-priceValue.txt
echo $curl18 | jq '.data.guestOrder.groups_2101['$indexOrder18'].deliveryAddress.fullName' >> track-fullName.txt
echo $curl18 | jq '.data.guestOrder.groups_2101['$indexOrder18'].deliveryAddress.address.addressString' >> track-address.txt
echo $curl18 | jq '.data.guestOrder.groups_2101['$indexOrder18'].status.message.parts[].text' >> track-status.txt
echo $curl18 | jq '.data.guestOrder.groups_2101['$indexOrder18'].shipment.trackingNumber' >> track-number.txt
echo $curl18 | jq '.data.guestOrder.groups_2101['$indexOrder18'].shipment.trackingUrl' >> track-url.txt
fi

curl19=`curl 'https://www.walmart.com/orchestra/home/graphql' \
  -H 'authority: www.walmart.com' \
  -H 'sec-ch-ua: " Not A;Brand";v="99", "Chromium";v="96", "Microsoft Edge";v="96"' \
  -H 'x-o-platform: rweb' \
  -H 'dnt: 1' \
  -H 'x-o-correlation-id: wrvYiSFTlAmd8j7a8DDmpuyOpCN_heAnwM3v' \
  -H 'device_profile_ref_id: _s1F3NO8Y2JjaBUKPDcY4iFDWiIl9CyqiJjf' \
  -H 'x-latency-trace: 1' \
  -H 'wm_mp: true' \
  -H 'x-o-market: us' \
  -H 'x-o-platform-version: main-253-ebbb47' \
  -H 'x-o-gql-query: query getGuestOrder' \
  -H 'wm_page_url: https://www.walmart.com/orders' \
  -H 'x-apollo-operation-name: getGuestOrder' \
  -H 'sec-ch-ua-platform: "macOS"' \
  -H 'sec-ch-ua-mobile: ?0' \
  -H 'user-agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/96.0.4664.110 Safari/537.36 Edg/96.0.1054.62' \
  -H 'x-o-segment: oaoh' \
  -H 'content-type: application/json' \
  -H 'accept: application/json' \
  -H 'x-enable-server-timing: 1' \
  -H 'x-o-ccm: server' \
  -H 'wm_qos.correlation_id: wrvYiSFTlAmd8j7a8DDmpuyOpCN_heAnwM3v' \
  -H 'origin: https://www.walmart.com' \
  -H 'sec-fetch-site: same-origin' \
  -H 'sec-fetch-mode: cors' \
  -H 'sec-fetch-dest: empty' \
  -H 'referer: https://www.walmart.com/orders' \
  -H 'accept-language: vi' \
  --data-raw $'{"query":"query getGuestOrder($orderId:ID\u0021 $emailAddress:String\u0021){guestOrder(input:{id:$orderId emailAddress:$emailAddress}){...OrderFieldsFragment}}fragment cancelReason on OrderCancelReason{__typename subReasonCode subDescription}fragment priceDetailFragment on OrderPriceDetailRow{label value displayValue info{title message}rowInfo{...orderPriceDetailRowInfo}}fragment orderPriceDetailRowInfo on OrderPriceDetailRowInfo{title message{...textFragment}}fragment price on Price{displayValue value}fragment variants on MapEntry{name value}fragment OrderAddOn on OrderAddOn{lineId uniqueLineId productInfo{name usItemId offerId}quantityString quantityLabel type fulfillmentInstructions{...textFragment}actions{manageProtectionPlan{...orderActionFragment}cancel}priceInfo{linePrice{...price}}quantity isActive}fragment orderDonationDetails on OrderDonationDetails{message{...textFragment}emailReceipt emailReceiptToken status{...textFragment}errorStatus}fragment orderLineItem on OrderLineItem{id uniqueId actions{contactSeller cancel addToCart configureCake reviewItem resendEGiftCardToken protectionPlan{...orderActionFragment}manageProtectionPlan{...orderActionFragment}}isGift digitalDeliveryMessage quantity quantityString quantityLabel isSubstitutionSelected fulfilledItems{id quantityString priceInfo{itemPrice{value}}product{usItemId name}}isReturnable returnEligibilityMessage product{name usItemId imageInfo{thumbnailUrl}canonicalUrl offerId sellerId sellerName hasSellerBadge seller{sellerId name}orderLimit orderMinLimit weightIncrement salesUnit salesUnitType isSubstitutionEligible isAlcohol}reshop{reshopMessage isShippingAvailable minPromiseDate maxPromiseDate}selectedVariants{...variants}variantAdditionalInfo{parts{text nativeAction}}priceInfo{priceDisplayCodes{showItemPrice priceDisplayCondition finalCostByWeight}itemPrice{...price}linePrice{...price}unitPrice{...price}preDiscountedLinePrice{...price}additionalLines{name value}}discounts{label labelText{...textFragment}}itemReviewed activationCodes{label code}protectionPlanMessage{...textFragment}showSeller isShippedByWalmart seller{id name isPro}digitalDeliveryPhoneNumber addOns{...OrderAddOn}multiboxBundleId}fragment DriverFragment on Driver{id firstName photoUrl}fragment OrderGroupFragment on OrderGroup{driver{...DriverFragment}deliveryDate fulfillmentType status{...OrderGroupStatusFragment}showSeller isShippedByWalmart seller{...SellerFragment}id itemCount items{...LiteLineItemFragment}pickupPerson{firstName lastName email}accessPointId shipment{...ShipmentFragment}returnEligibilityMessage actions{...OrderGroupActionsFragment}recipientEmailAddress digitalDelivery{...DigitalDeliveryFragment}tireInstallationReservation{status extraText}}fragment OrderGroupStatusFragment on OrderGroupStatus{statusType showStatusTracker statusTracker{status label isCurrent}message{...textFragment}subtext subMessage{...textFragment}notice helpCenterText{...textFragment}}fragment textFragment on Text{parts{bold url text nativeAction lineBreak}}fragment LiteLineItemFragment on OrderLineItem{id quantity product{name usItemId imageInfo{thumbnailUrl}offerId isAlcohol}priceInfo{linePrice{...price}}}fragment SellerFragment on GroupSeller{id name isPro}fragment DigitalDeliveryFragment on DigitalDelivery{title name instructions{...textFragment}}fragment ShipmentFragment on Shipment{id trackingNumber isExternalTracking trackingUrl proofOfDelivery{photoUrl photoPreviewUrl showPreview}}fragment OrderGroupActionsFragment on OrderGroupActions{reorder edit track changeSlot checkin editDeliveryInstructions editPickupPerson editTip tip cancel enableTip{...orderActionFragment}enableEdit{...orderActionFragment}rescheduleTireInstall{...orderActionFragment}cancelTireInstall{...orderActionFragment}help viewCancellationDetails{...cancellationDetailsActionFragment}}fragment cancellationDetailsActionFragment on CancellationDetailsAction{label heading text{...textFragment}}fragment ODPGroupCategoryFragment on OrderCategory{type name subtext returnMessage substitutionsBanner{...textFragment}showExtendedSubstitutions actions{substitutions{message label type}nilPickReshop{message action{text url}}returnDetails viewCancellationDetails{...cancellationDetailsActionFragment}trackOnInHomeApp}banner{...textFragment}accordionState items{...orderLineItem}substitutions{...orderLineItem fulfilledItems{...orderLineItem}}returnInfo{...returnInfoFragment}}fragment ODPGroupFragment on OrderGroup{id fulfillmentType deliveryMessage deliveryAddress{fullName firstName lastName address{...addressFragment}}deliveryInstructions{text type typeText}deliveryPreferences{text{...textFragment}cta{...orderActionFragment}}editSubstitutionsCutOff status{statusType showStatusTracker message{...textFragment}notice helpCenterText{...textFragment}}itemCount isCategorized categories{...ODPGroupCategoryFragment}seller{id name isPro}shipment{id trackingNumber}actions{reorder edit track changeSlot checkin editDeliveryInstructions editPickupPerson tip cancel help enableTip{...orderActionFragment}enableEdit{...orderActionFragment}viewCancellationDetails{...cancellationDetailsActionFragment}enableInHome{...orderActionFragment}createGiftReceipt}cutOffTimestamp isEditSubstitutionsEligible isInHome giftDetails{recipientAddress{fullName}recipientEmail senderName giftMessage}donationDetails{...orderDonationDetails}}fragment returnInfoFragment on ReturnInfo{returnOrderId type refundPriceDetails{__typename...refundPriceDetailsFragment}refundMessage tierRefundMessage paymentMethods{__typename description cardType paymentType displayValues message{...textFragment}}actions{__typename generate scheduleOrModifyPickup{text url}reschedulePickup editPickupContact}shippingLabelUrl qrCodeImageUrl carriers{__typename id name}pickupCarrier pickupContact{nameAndAddress{fullName firstName lastName address{addressString city state postalCode addressLineOne addressLineTwo country}}phone}pickupConfirmationNumber bannerMessage{...textFragment}}fragment refundPriceDetailsFragment on RefundPriceDetails{subTotal{__typename...orderPriceDetailRowFragment}fees{__typename...orderPriceDetailRowFragment}discounts{__typename...orderPriceDetailRowFragment}taxTotal{__typename...orderPriceDetailRowFragment}grandTotal{__typename...orderPriceDetailRowFragment}}fragment orderPriceDetailRowFragment on OrderPriceDetailRow{label displayValue value info{__typename title message}}fragment addressFragment on OrderAddress{addressString addressLineOne addressLineTwo state postalCode city}fragment ODPPickupInfo on OrderGroup{pickupInstructions pickupPerson{...person}alternatePickupPerson{...person}store{id name address{...addressFragment}}}fragment person on OrderPickupPerson{firstName lastName email}fragment ODPTippingInfo on OrderGroup{addTipMessage{...textFragment}driver{...DriverFragment}tipping{min{...price}max{...price}suggested{...price}preselected}subtotal{...price}}fragment orderActionFragment on Action{text url}fragment orderCustomer on OrderCustomer{id firstName lastName email isGuest isEmailRegistered}fragment OrderFieldsFragment on Order{__typename id version type customer{...orderCustomer}displayId idBarcodeImageUrl(barWidth:3 barHeight:100) isFuelPurchase title shortTitle timezone tippableGroup{...OrderGroupFragment}amendableGroup{id changeSlotIterationsLeft cutOffTimestamp fulfillmentType deliveryAddress{fullName firstName lastName address{addressString addressLineOne addressLineTwo state postalCode city country}}isAmendInProgress}substitutionsBanner{heading subheading longSubheading}groups_2101{__typename...OrderGroupFragment...ODPGroupFragment...ODPPickupInfo...ODPTippingInfo}multiboxBundles{...orderLineItem}itemCancelReasons{__typename...cancelReason}groupCancelReasons{__typename...cancelReason}priceDetails{__typename subTotal{__typename...priceDetailFragment}taxTotal{__typename...priceDetailFragment}grandTotal{__typename...priceDetailFragment}authorizationAmount{__typename...priceDetailFragment}fees{__typename...priceDetailFragment}discounts{__typename...priceDetailFragment}minimumThreshold{__typename...price}belowMinimumFee{__typename...priceDetailFragment}driverTip{__typename...priceDetailFragment}donations{__typename...priceDetailFragment}}paymentMethods{__typename description cardType paymentType displayValues message{...textFragment}actions{connectToCapitalOne{...orderActionFragment}visitAffirm{...orderActionFragment}}}actions{__typename return pendingReturn cancel startReturn{...orderActionFragment}reorder}banners{...textFragment}}","variables":{"orderId":"2832232545441","emailAddress":"kasim.shahid@gmail.com"}}' \
  --compressed`
 
for (( i=0; i<=4; i++ ))
do
  if [[ $curl19 =~ "error"  || $curl19 =~ "blocked" ]]; then
    echo "Lỗi email số 19"
    indexOrder19=`echo error`
    break
  elif [[ `echo $curl19 | jq '.data.guestOrder.groups_2101['${i[@]}'].items[0].product.usItemId'` == '"19524988"' ]]; then
    indexOrder19=`echo $i`
    indexItem19=`echo 0`
  elif [[ `echo $curl19 | jq '.data.guestOrder.groups_2101['${i[@]}'].items[1].product.usItemId'` == '"19524988"' ]]; then
    indexOrder19=`echo $i`
    indexItem19=`echo 1`
  elif [[ `echo $curl19 | jq '.data.guestOrder.groups_2101['${i[@]}'].items[2].product.usItemId'` == '"19524988"' ]]; then
    indexOrder19=`echo $i`
    indexItem19=`echo 2`
  elif [[ `echo $curl19 | jq '.data.guestOrder.groups_2101['${i[@]}'].items[3].product.usItemId'` == '"19524988"' ]]; then
    indexOrder19=`echo $i`
    indexItem19=`echo 3`
  fi
done

if [[ $indexOrder19 != "error" ]]; then
echo $curl19 | jq '.data.guestOrder.id' >> track-OrderID.txt
echo $curl19 | jq '.data.guestOrder.customer.email' >> track-email.txt
echo $curl19 | jq '.data.guestOrder.groups_2101['$indexOrder19'].items['$indexItem19'].product.usItemId' >> track-usItemId.txt
echo $curl19 | jq '.data.guestOrder.groups_2101['$indexOrder19'].items['$indexItem19'].priceInfo.linePrice.value' >> track-priceValue.txt
echo $curl19 | jq '.data.guestOrder.groups_2101['$indexOrder19'].deliveryAddress.fullName' >> track-fullName.txt
echo $curl19 | jq '.data.guestOrder.groups_2101['$indexOrder19'].deliveryAddress.address.addressString' >> track-address.txt
echo $curl19 | jq '.data.guestOrder.groups_2101['$indexOrder19'].status.message.parts[].text' >> track-status.txt
echo $curl19 | jq '.data.guestOrder.groups_2101['$indexOrder19'].shipment.trackingNumber' >> track-number.txt
echo $curl19 | jq '.data.guestOrder.groups_2101['$indexOrder19'].shipment.trackingUrl' >> track-url.txt
fi

curl20=`curl 'https://www.walmart.com/orchestra/home/graphql' \
  -H 'authority: www.walmart.com' \
  -H 'sec-ch-ua: " Not A;Brand";v="99", "Chromium";v="96", "Microsoft Edge";v="96"' \
  -H 'x-o-platform: rweb' \
  -H 'dnt: 1' \
  -H 'x-o-correlation-id: wrvYiSFTlAmd8j7a8DDmpuyOpCN_heAnwM3v' \
  -H 'device_profile_ref_id: _s1F3NO8Y2JjaBUKPDcY4iFDWiIl9CyqiJjf' \
  -H 'x-latency-trace: 1' \
  -H 'wm_mp: true' \
  -H 'x-o-market: us' \
  -H 'x-o-platform-version: main-253-ebbb47' \
  -H 'x-o-gql-query: query getGuestOrder' \
  -H 'wm_page_url: https://www.walmart.com/orders' \
  -H 'x-apollo-operation-name: getGuestOrder' \
  -H 'sec-ch-ua-platform: "macOS"' \
  -H 'sec-ch-ua-mobile: ?0' \
  -H 'user-agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/96.0.4664.110 Safari/537.36 Edg/96.0.1054.62' \
  -H 'x-o-segment: oaoh' \
  -H 'content-type: application/json' \
  -H 'accept: application/json' \
  -H 'x-enable-server-timing: 1' \
  -H 'x-o-ccm: server' \
  -H 'wm_qos.correlation_id: wrvYiSFTlAmd8j7a8DDmpuyOpCN_heAnwM3v' \
  -H 'origin: https://www.walmart.com' \
  -H 'sec-fetch-site: same-origin' \
  -H 'sec-fetch-mode: cors' \
  -H 'sec-fetch-dest: empty' \
  -H 'referer: https://www.walmart.com/orders' \
  -H 'accept-language: vi' \
  --data-raw $'{"query":"query getGuestOrder($orderId:ID\u0021 $emailAddress:String\u0021){guestOrder(input:{id:$orderId emailAddress:$emailAddress}){...OrderFieldsFragment}}fragment cancelReason on OrderCancelReason{__typename subReasonCode subDescription}fragment priceDetailFragment on OrderPriceDetailRow{label value displayValue info{title message}rowInfo{...orderPriceDetailRowInfo}}fragment orderPriceDetailRowInfo on OrderPriceDetailRowInfo{title message{...textFragment}}fragment price on Price{displayValue value}fragment variants on MapEntry{name value}fragment OrderAddOn on OrderAddOn{lineId uniqueLineId productInfo{name usItemId offerId}quantityString quantityLabel type fulfillmentInstructions{...textFragment}actions{manageProtectionPlan{...orderActionFragment}cancel}priceInfo{linePrice{...price}}quantity isActive}fragment orderDonationDetails on OrderDonationDetails{message{...textFragment}emailReceipt emailReceiptToken status{...textFragment}errorStatus}fragment orderLineItem on OrderLineItem{id uniqueId actions{contactSeller cancel addToCart configureCake reviewItem resendEGiftCardToken protectionPlan{...orderActionFragment}manageProtectionPlan{...orderActionFragment}}isGift digitalDeliveryMessage quantity quantityString quantityLabel isSubstitutionSelected fulfilledItems{id quantityString priceInfo{itemPrice{value}}product{usItemId name}}isReturnable returnEligibilityMessage product{name usItemId imageInfo{thumbnailUrl}canonicalUrl offerId sellerId sellerName hasSellerBadge seller{sellerId name}orderLimit orderMinLimit weightIncrement salesUnit salesUnitType isSubstitutionEligible isAlcohol}reshop{reshopMessage isShippingAvailable minPromiseDate maxPromiseDate}selectedVariants{...variants}variantAdditionalInfo{parts{text nativeAction}}priceInfo{priceDisplayCodes{showItemPrice priceDisplayCondition finalCostByWeight}itemPrice{...price}linePrice{...price}unitPrice{...price}preDiscountedLinePrice{...price}additionalLines{name value}}discounts{label labelText{...textFragment}}itemReviewed activationCodes{label code}protectionPlanMessage{...textFragment}showSeller isShippedByWalmart seller{id name isPro}digitalDeliveryPhoneNumber addOns{...OrderAddOn}multiboxBundleId}fragment DriverFragment on Driver{id firstName photoUrl}fragment OrderGroupFragment on OrderGroup{driver{...DriverFragment}deliveryDate fulfillmentType status{...OrderGroupStatusFragment}showSeller isShippedByWalmart seller{...SellerFragment}id itemCount items{...LiteLineItemFragment}pickupPerson{firstName lastName email}accessPointId shipment{...ShipmentFragment}returnEligibilityMessage actions{...OrderGroupActionsFragment}recipientEmailAddress digitalDelivery{...DigitalDeliveryFragment}tireInstallationReservation{status extraText}}fragment OrderGroupStatusFragment on OrderGroupStatus{statusType showStatusTracker statusTracker{status label isCurrent}message{...textFragment}subtext subMessage{...textFragment}notice helpCenterText{...textFragment}}fragment textFragment on Text{parts{bold url text nativeAction lineBreak}}fragment LiteLineItemFragment on OrderLineItem{id quantity product{name usItemId imageInfo{thumbnailUrl}offerId isAlcohol}priceInfo{linePrice{...price}}}fragment SellerFragment on GroupSeller{id name isPro}fragment DigitalDeliveryFragment on DigitalDelivery{title name instructions{...textFragment}}fragment ShipmentFragment on Shipment{id trackingNumber isExternalTracking trackingUrl proofOfDelivery{photoUrl photoPreviewUrl showPreview}}fragment OrderGroupActionsFragment on OrderGroupActions{reorder edit track changeSlot checkin editDeliveryInstructions editPickupPerson editTip tip cancel enableTip{...orderActionFragment}enableEdit{...orderActionFragment}rescheduleTireInstall{...orderActionFragment}cancelTireInstall{...orderActionFragment}help viewCancellationDetails{...cancellationDetailsActionFragment}}fragment cancellationDetailsActionFragment on CancellationDetailsAction{label heading text{...textFragment}}fragment ODPGroupCategoryFragment on OrderCategory{type name subtext returnMessage substitutionsBanner{...textFragment}showExtendedSubstitutions actions{substitutions{message label type}nilPickReshop{message action{text url}}returnDetails viewCancellationDetails{...cancellationDetailsActionFragment}trackOnInHomeApp}banner{...textFragment}accordionState items{...orderLineItem}substitutions{...orderLineItem fulfilledItems{...orderLineItem}}returnInfo{...returnInfoFragment}}fragment ODPGroupFragment on OrderGroup{id fulfillmentType deliveryMessage deliveryAddress{fullName firstName lastName address{...addressFragment}}deliveryInstructions{text type typeText}deliveryPreferences{text{...textFragment}cta{...orderActionFragment}}editSubstitutionsCutOff status{statusType showStatusTracker message{...textFragment}notice helpCenterText{...textFragment}}itemCount isCategorized categories{...ODPGroupCategoryFragment}seller{id name isPro}shipment{id trackingNumber}actions{reorder edit track changeSlot checkin editDeliveryInstructions editPickupPerson tip cancel help enableTip{...orderActionFragment}enableEdit{...orderActionFragment}viewCancellationDetails{...cancellationDetailsActionFragment}enableInHome{...orderActionFragment}createGiftReceipt}cutOffTimestamp isEditSubstitutionsEligible isInHome giftDetails{recipientAddress{fullName}recipientEmail senderName giftMessage}donationDetails{...orderDonationDetails}}fragment returnInfoFragment on ReturnInfo{returnOrderId type refundPriceDetails{__typename...refundPriceDetailsFragment}refundMessage tierRefundMessage paymentMethods{__typename description cardType paymentType displayValues message{...textFragment}}actions{__typename generate scheduleOrModifyPickup{text url}reschedulePickup editPickupContact}shippingLabelUrl qrCodeImageUrl carriers{__typename id name}pickupCarrier pickupContact{nameAndAddress{fullName firstName lastName address{addressString city state postalCode addressLineOne addressLineTwo country}}phone}pickupConfirmationNumber bannerMessage{...textFragment}}fragment refundPriceDetailsFragment on RefundPriceDetails{subTotal{__typename...orderPriceDetailRowFragment}fees{__typename...orderPriceDetailRowFragment}discounts{__typename...orderPriceDetailRowFragment}taxTotal{__typename...orderPriceDetailRowFragment}grandTotal{__typename...orderPriceDetailRowFragment}}fragment orderPriceDetailRowFragment on OrderPriceDetailRow{label displayValue value info{__typename title message}}fragment addressFragment on OrderAddress{addressString addressLineOne addressLineTwo state postalCode city}fragment ODPPickupInfo on OrderGroup{pickupInstructions pickupPerson{...person}alternatePickupPerson{...person}store{id name address{...addressFragment}}}fragment person on OrderPickupPerson{firstName lastName email}fragment ODPTippingInfo on OrderGroup{addTipMessage{...textFragment}driver{...DriverFragment}tipping{min{...price}max{...price}suggested{...price}preselected}subtotal{...price}}fragment orderActionFragment on Action{text url}fragment orderCustomer on OrderCustomer{id firstName lastName email isGuest isEmailRegistered}fragment OrderFieldsFragment on Order{__typename id version type customer{...orderCustomer}displayId idBarcodeImageUrl(barWidth:3 barHeight:100) isFuelPurchase title shortTitle timezone tippableGroup{...OrderGroupFragment}amendableGroup{id changeSlotIterationsLeft cutOffTimestamp fulfillmentType deliveryAddress{fullName firstName lastName address{addressString addressLineOne addressLineTwo state postalCode city country}}isAmendInProgress}substitutionsBanner{heading subheading longSubheading}groups_2101{__typename...OrderGroupFragment...ODPGroupFragment...ODPPickupInfo...ODPTippingInfo}multiboxBundles{...orderLineItem}itemCancelReasons{__typename...cancelReason}groupCancelReasons{__typename...cancelReason}priceDetails{__typename subTotal{__typename...priceDetailFragment}taxTotal{__typename...priceDetailFragment}grandTotal{__typename...priceDetailFragment}authorizationAmount{__typename...priceDetailFragment}fees{__typename...priceDetailFragment}discounts{__typename...priceDetailFragment}minimumThreshold{__typename...price}belowMinimumFee{__typename...priceDetailFragment}driverTip{__typename...priceDetailFragment}donations{__typename...priceDetailFragment}}paymentMethods{__typename description cardType paymentType displayValues message{...textFragment}actions{connectToCapitalOne{...orderActionFragment}visitAffirm{...orderActionFragment}}}actions{__typename return pendingReturn cancel startReturn{...orderActionFragment}reorder}banners{...textFragment}}","variables":{"orderId":"2802227817226","emailAddress":"sandeepnijjar45@gmail.com"}}' \
  --compressed`
 
for (( i=0; i<=4; i++ ))
do
  if [[ $curl20 =~ "error"  || $curl20 =~ "blocked" ]]; then
    echo "Lỗi email số 20"
    indexOrder20=`echo error`
    break
  elif [[ `echo $curl20 | jq '.data.guestOrder.groups_2101['${i[@]}'].items[0].product.usItemId'` == '"874080200"' ]]; then
    indexOrder20=`echo $i`
    indexItem20=`echo 0`
  elif [[ `echo $curl20 | jq '.data.guestOrder.groups_2101['${i[@]}'].items[1].product.usItemId'` == '"874080200"' ]]; then
    indexOrder20=`echo $i`
    indexItem20=`echo 1`
  elif [[ `echo $curl20 | jq '.data.guestOrder.groups_2101['${i[@]}'].items[2].product.usItemId'` == '"874080200"' ]]; then
    indexOrder20=`echo $i`
    indexItem20=`echo 2`
  elif [[ `echo $curl20 | jq '.data.guestOrder.groups_2101['${i[@]}'].items[3].product.usItemId'` == '"874080200"' ]]; then
    indexOrder20=`echo $i`
    indexItem20=`echo 3`
  fi
done

if [[ $indexOrder20 != "error" ]]; then
echo $curl20 | jq '.data.guestOrder.id' >> track-OrderID.txt
echo $curl20 | jq '.data.guestOrder.customer.email' >> track-email.txt
echo $curl20 | jq '.data.guestOrder.groups_2101['$indexOrder20'].items['$indexItem20'].product.usItemId' >> track-usItemId.txt
echo $curl20 | jq '.data.guestOrder.groups_2101['$indexOrder20'].items['$indexItem20'].priceInfo.linePrice.value' >> track-priceValue.txt
echo $curl20 | jq '.data.guestOrder.groups_2101['$indexOrder20'].deliveryAddress.fullName' >> track-fullName.txt
echo $curl20 | jq '.data.guestOrder.groups_2101['$indexOrder20'].deliveryAddress.address.addressString' >> track-address.txt
echo $curl20 | jq '.data.guestOrder.groups_2101['$indexOrder20'].status.message.parts[].text' >> track-status.txt
echo $curl20 | jq '.data.guestOrder.groups_2101['$indexOrder20'].shipment.trackingNumber' >> track-number.txt
echo $curl20 | jq '.data.guestOrder.groups_2101['$indexOrder20'].shipment.trackingUrl' >> track-url.txt
fi

curl21=`curl 'https://www.walmart.com/orchestra/home/graphql' \
  -H 'authority: www.walmart.com' \
  -H 'sec-ch-ua: " Not A;Brand";v="99", "Chromium";v="96", "Microsoft Edge";v="96"' \
  -H 'x-o-platform: rweb' \
  -H 'dnt: 1' \
  -H 'x-o-correlation-id: wrvYiSFTlAmd8j7a8DDmpuyOpCN_heAnwM3v' \
  -H 'device_profile_ref_id: _s1F3NO8Y2JjaBUKPDcY4iFDWiIl9CyqiJjf' \
  -H 'x-latency-trace: 1' \
  -H 'wm_mp: true' \
  -H 'x-o-market: us' \
  -H 'x-o-platform-version: main-253-ebbb47' \
  -H 'x-o-gql-query: query getGuestOrder' \
  -H 'wm_page_url: https://www.walmart.com/orders' \
  -H 'x-apollo-operation-name: getGuestOrder' \
  -H 'sec-ch-ua-platform: "macOS"' \
  -H 'sec-ch-ua-mobile: ?0' \
  -H 'user-agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/96.0.4664.110 Safari/537.36 Edg/96.0.1054.62' \
  -H 'x-o-segment: oaoh' \
  -H 'content-type: application/json' \
  -H 'accept: application/json' \
  -H 'x-enable-server-timing: 1' \
  -H 'x-o-ccm: server' \
  -H 'wm_qos.correlation_id: wrvYiSFTlAmd8j7a8DDmpuyOpCN_heAnwM3v' \
  -H 'origin: https://www.walmart.com' \
  -H 'sec-fetch-site: same-origin' \
  -H 'sec-fetch-mode: cors' \
  -H 'sec-fetch-dest: empty' \
  -H 'referer: https://www.walmart.com/orders' \
  -H 'accept-language: vi' \
  --data-raw $'{"query":"query getGuestOrder($orderId:ID\u0021 $emailAddress:String\u0021){guestOrder(input:{id:$orderId emailAddress:$emailAddress}){...OrderFieldsFragment}}fragment cancelReason on OrderCancelReason{__typename subReasonCode subDescription}fragment priceDetailFragment on OrderPriceDetailRow{label value displayValue info{title message}rowInfo{...orderPriceDetailRowInfo}}fragment orderPriceDetailRowInfo on OrderPriceDetailRowInfo{title message{...textFragment}}fragment price on Price{displayValue value}fragment variants on MapEntry{name value}fragment OrderAddOn on OrderAddOn{lineId uniqueLineId productInfo{name usItemId offerId}quantityString quantityLabel type fulfillmentInstructions{...textFragment}actions{manageProtectionPlan{...orderActionFragment}cancel}priceInfo{linePrice{...price}}quantity isActive}fragment orderDonationDetails on OrderDonationDetails{message{...textFragment}emailReceipt emailReceiptToken status{...textFragment}errorStatus}fragment orderLineItem on OrderLineItem{id uniqueId actions{contactSeller cancel addToCart configureCake reviewItem resendEGiftCardToken protectionPlan{...orderActionFragment}manageProtectionPlan{...orderActionFragment}}isGift digitalDeliveryMessage quantity quantityString quantityLabel isSubstitutionSelected fulfilledItems{id quantityString priceInfo{itemPrice{value}}product{usItemId name}}isReturnable returnEligibilityMessage product{name usItemId imageInfo{thumbnailUrl}canonicalUrl offerId sellerId sellerName hasSellerBadge seller{sellerId name}orderLimit orderMinLimit weightIncrement salesUnit salesUnitType isSubstitutionEligible isAlcohol}reshop{reshopMessage isShippingAvailable minPromiseDate maxPromiseDate}selectedVariants{...variants}variantAdditionalInfo{parts{text nativeAction}}priceInfo{priceDisplayCodes{showItemPrice priceDisplayCondition finalCostByWeight}itemPrice{...price}linePrice{...price}unitPrice{...price}preDiscountedLinePrice{...price}additionalLines{name value}}discounts{label labelText{...textFragment}}itemReviewed activationCodes{label code}protectionPlanMessage{...textFragment}showSeller isShippedByWalmart seller{id name isPro}digitalDeliveryPhoneNumber addOns{...OrderAddOn}multiboxBundleId}fragment DriverFragment on Driver{id firstName photoUrl}fragment OrderGroupFragment on OrderGroup{driver{...DriverFragment}deliveryDate fulfillmentType status{...OrderGroupStatusFragment}showSeller isShippedByWalmart seller{...SellerFragment}id itemCount items{...LiteLineItemFragment}pickupPerson{firstName lastName email}accessPointId shipment{...ShipmentFragment}returnEligibilityMessage actions{...OrderGroupActionsFragment}recipientEmailAddress digitalDelivery{...DigitalDeliveryFragment}tireInstallationReservation{status extraText}}fragment OrderGroupStatusFragment on OrderGroupStatus{statusType showStatusTracker statusTracker{status label isCurrent}message{...textFragment}subtext subMessage{...textFragment}notice helpCenterText{...textFragment}}fragment textFragment on Text{parts{bold url text nativeAction lineBreak}}fragment LiteLineItemFragment on OrderLineItem{id quantity product{name usItemId imageInfo{thumbnailUrl}offerId isAlcohol}priceInfo{linePrice{...price}}}fragment SellerFragment on GroupSeller{id name isPro}fragment DigitalDeliveryFragment on DigitalDelivery{title name instructions{...textFragment}}fragment ShipmentFragment on Shipment{id trackingNumber isExternalTracking trackingUrl proofOfDelivery{photoUrl photoPreviewUrl showPreview}}fragment OrderGroupActionsFragment on OrderGroupActions{reorder edit track changeSlot checkin editDeliveryInstructions editPickupPerson editTip tip cancel enableTip{...orderActionFragment}enableEdit{...orderActionFragment}rescheduleTireInstall{...orderActionFragment}cancelTireInstall{...orderActionFragment}help viewCancellationDetails{...cancellationDetailsActionFragment}}fragment cancellationDetailsActionFragment on CancellationDetailsAction{label heading text{...textFragment}}fragment ODPGroupCategoryFragment on OrderCategory{type name subtext returnMessage substitutionsBanner{...textFragment}showExtendedSubstitutions actions{substitutions{message label type}nilPickReshop{message action{text url}}returnDetails viewCancellationDetails{...cancellationDetailsActionFragment}trackOnInHomeApp}banner{...textFragment}accordionState items{...orderLineItem}substitutions{...orderLineItem fulfilledItems{...orderLineItem}}returnInfo{...returnInfoFragment}}fragment ODPGroupFragment on OrderGroup{id fulfillmentType deliveryMessage deliveryAddress{fullName firstName lastName address{...addressFragment}}deliveryInstructions{text type typeText}deliveryPreferences{text{...textFragment}cta{...orderActionFragment}}editSubstitutionsCutOff status{statusType showStatusTracker message{...textFragment}notice helpCenterText{...textFragment}}itemCount isCategorized categories{...ODPGroupCategoryFragment}seller{id name isPro}shipment{id trackingNumber}actions{reorder edit track changeSlot checkin editDeliveryInstructions editPickupPerson tip cancel help enableTip{...orderActionFragment}enableEdit{...orderActionFragment}viewCancellationDetails{...cancellationDetailsActionFragment}enableInHome{...orderActionFragment}createGiftReceipt}cutOffTimestamp isEditSubstitutionsEligible isInHome giftDetails{recipientAddress{fullName}recipientEmail senderName giftMessage}donationDetails{...orderDonationDetails}}fragment returnInfoFragment on ReturnInfo{returnOrderId type refundPriceDetails{__typename...refundPriceDetailsFragment}refundMessage tierRefundMessage paymentMethods{__typename description cardType paymentType displayValues message{...textFragment}}actions{__typename generate scheduleOrModifyPickup{text url}reschedulePickup editPickupContact}shippingLabelUrl qrCodeImageUrl carriers{__typename id name}pickupCarrier pickupContact{nameAndAddress{fullName firstName lastName address{addressString city state postalCode addressLineOne addressLineTwo country}}phone}pickupConfirmationNumber bannerMessage{...textFragment}}fragment refundPriceDetailsFragment on RefundPriceDetails{subTotal{__typename...orderPriceDetailRowFragment}fees{__typename...orderPriceDetailRowFragment}discounts{__typename...orderPriceDetailRowFragment}taxTotal{__typename...orderPriceDetailRowFragment}grandTotal{__typename...orderPriceDetailRowFragment}}fragment orderPriceDetailRowFragment on OrderPriceDetailRow{label displayValue value info{__typename title message}}fragment addressFragment on OrderAddress{addressString addressLineOne addressLineTwo state postalCode city}fragment ODPPickupInfo on OrderGroup{pickupInstructions pickupPerson{...person}alternatePickupPerson{...person}store{id name address{...addressFragment}}}fragment person on OrderPickupPerson{firstName lastName email}fragment ODPTippingInfo on OrderGroup{addTipMessage{...textFragment}driver{...DriverFragment}tipping{min{...price}max{...price}suggested{...price}preselected}subtotal{...price}}fragment orderActionFragment on Action{text url}fragment orderCustomer on OrderCustomer{id firstName lastName email isGuest isEmailRegistered}fragment OrderFieldsFragment on Order{__typename id version type customer{...orderCustomer}displayId idBarcodeImageUrl(barWidth:3 barHeight:100) isFuelPurchase title shortTitle timezone tippableGroup{...OrderGroupFragment}amendableGroup{id changeSlotIterationsLeft cutOffTimestamp fulfillmentType deliveryAddress{fullName firstName lastName address{addressString addressLineOne addressLineTwo state postalCode city country}}isAmendInProgress}substitutionsBanner{heading subheading longSubheading}groups_2101{__typename...OrderGroupFragment...ODPGroupFragment...ODPPickupInfo...ODPTippingInfo}multiboxBundles{...orderLineItem}itemCancelReasons{__typename...cancelReason}groupCancelReasons{__typename...cancelReason}priceDetails{__typename subTotal{__typename...priceDetailFragment}taxTotal{__typename...priceDetailFragment}grandTotal{__typename...priceDetailFragment}authorizationAmount{__typename...priceDetailFragment}fees{__typename...priceDetailFragment}discounts{__typename...priceDetailFragment}minimumThreshold{__typename...price}belowMinimumFee{__typename...priceDetailFragment}driverTip{__typename...priceDetailFragment}donations{__typename...priceDetailFragment}}paymentMethods{__typename description cardType paymentType displayValues message{...textFragment}actions{connectToCapitalOne{...orderActionFragment}visitAffirm{...orderActionFragment}}}actions{__typename return pendingReturn cancel startReturn{...orderActionFragment}reorder}banners{...textFragment}}","variables":{"orderId":"2852237059182","emailAddress":"dalenachristensen83@hotmail.com"}}' \
  --compressed`
 
for (( i=0; i<=4; i++ ))
do
  if [[ $curl21 =~ "error"  || $curl21 =~ "blocked" ]]; then
    echo "Lỗi email số 21"
    indexOrder21=`echo error`
    break
  elif [[ `echo $curl21 | jq '.data.guestOrder.groups_2101['${i[@]}'].items[0].product.usItemId'` == '"35702152"' ]]; then
    indexOrder21=`echo $i`
    indexItem21=`echo 0`
  elif [[ `echo $curl21 | jq '.data.guestOrder.groups_2101['${i[@]}'].items[1].product.usItemId'` == '"35702152"' ]]; then
    indexOrder21=`echo $i`
    indexItem21=`echo 1`
  elif [[ `echo $curl21 | jq '.data.guestOrder.groups_2101['${i[@]}'].items[2].product.usItemId'` == '"35702152"' ]]; then
    indexOrder21=`echo $i`
    indexItem21=`echo 2`
  elif [[ `echo $curl21 | jq '.data.guestOrder.groups_2101['${i[@]}'].items[3].product.usItemId'` == '"35702152"' ]]; then
    indexOrder21=`echo $i`
    indexItem21=`echo 3`
  fi
done

if [[ $indexOrder21 != "error" ]]; then
echo $curl21 | jq '.data.guestOrder.id' >> track-OrderID.txt
echo $curl21 | jq '.data.guestOrder.customer.email' >> track-email.txt
echo $curl21 | jq '.data.guestOrder.groups_2101['$indexOrder21'].items['$indexItem21'].product.usItemId' >> track-usItemId.txt
echo $curl21 | jq '.data.guestOrder.groups_2101['$indexOrder21'].items['$indexItem21'].priceInfo.linePrice.value' >> track-priceValue.txt
echo $curl21 | jq '.data.guestOrder.groups_2101['$indexOrder21'].deliveryAddress.fullName' >> track-fullName.txt
echo $curl21 | jq '.data.guestOrder.groups_2101['$indexOrder21'].deliveryAddress.address.addressString' >> track-address.txt
echo $curl21 | jq '.data.guestOrder.groups_2101['$indexOrder21'].status.message.parts[].text' >> track-status.txt
echo $curl21 | jq '.data.guestOrder.groups_2101['$indexOrder21'].shipment.trackingNumber' >> track-number.txt
echo $curl21 | jq '.data.guestOrder.groups_2101['$indexOrder21'].shipment.trackingUrl' >> track-url.txt
fi

curl22=`curl 'https://www.walmart.com/orchestra/home/graphql' \
  -H 'authority: www.walmart.com' \
  -H 'sec-ch-ua: " Not A;Brand";v="99", "Chromium";v="96", "Microsoft Edge";v="96"' \
  -H 'x-o-platform: rweb' \
  -H 'dnt: 1' \
  -H 'x-o-correlation-id: wrvYiSFTlAmd8j7a8DDmpuyOpCN_heAnwM3v' \
  -H 'device_profile_ref_id: _s1F3NO8Y2JjaBUKPDcY4iFDWiIl9CyqiJjf' \
  -H 'x-latency-trace: 1' \
  -H 'wm_mp: true' \
  -H 'x-o-market: us' \
  -H 'x-o-platform-version: main-253-ebbb47' \
  -H 'x-o-gql-query: query getGuestOrder' \
  -H 'wm_page_url: https://www.walmart.com/orders' \
  -H 'x-apollo-operation-name: getGuestOrder' \
  -H 'sec-ch-ua-platform: "macOS"' \
  -H 'sec-ch-ua-mobile: ?0' \
  -H 'user-agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/96.0.4664.110 Safari/537.36 Edg/96.0.1054.62' \
  -H 'x-o-segment: oaoh' \
  -H 'content-type: application/json' \
  -H 'accept: application/json' \
  -H 'x-enable-server-timing: 1' \
  -H 'x-o-ccm: server' \
  -H 'wm_qos.correlation_id: wrvYiSFTlAmd8j7a8DDmpuyOpCN_heAnwM3v' \
  -H 'origin: https://www.walmart.com' \
  -H 'sec-fetch-site: same-origin' \
  -H 'sec-fetch-mode: cors' \
  -H 'sec-fetch-dest: empty' \
  -H 'referer: https://www.walmart.com/orders' \
  -H 'accept-language: vi' \
  --data-raw $'{"query":"query getGuestOrder($orderId:ID\u0021 $emailAddress:String\u0021){guestOrder(input:{id:$orderId emailAddress:$emailAddress}){...OrderFieldsFragment}}fragment cancelReason on OrderCancelReason{__typename subReasonCode subDescription}fragment priceDetailFragment on OrderPriceDetailRow{label value displayValue info{title message}rowInfo{...orderPriceDetailRowInfo}}fragment orderPriceDetailRowInfo on OrderPriceDetailRowInfo{title message{...textFragment}}fragment price on Price{displayValue value}fragment variants on MapEntry{name value}fragment OrderAddOn on OrderAddOn{lineId uniqueLineId productInfo{name usItemId offerId}quantityString quantityLabel type fulfillmentInstructions{...textFragment}actions{manageProtectionPlan{...orderActionFragment}cancel}priceInfo{linePrice{...price}}quantity isActive}fragment orderDonationDetails on OrderDonationDetails{message{...textFragment}emailReceipt emailReceiptToken status{...textFragment}errorStatus}fragment orderLineItem on OrderLineItem{id uniqueId actions{contactSeller cancel addToCart configureCake reviewItem resendEGiftCardToken protectionPlan{...orderActionFragment}manageProtectionPlan{...orderActionFragment}}isGift digitalDeliveryMessage quantity quantityString quantityLabel isSubstitutionSelected fulfilledItems{id quantityString priceInfo{itemPrice{value}}product{usItemId name}}isReturnable returnEligibilityMessage product{name usItemId imageInfo{thumbnailUrl}canonicalUrl offerId sellerId sellerName hasSellerBadge seller{sellerId name}orderLimit orderMinLimit weightIncrement salesUnit salesUnitType isSubstitutionEligible isAlcohol}reshop{reshopMessage isShippingAvailable minPromiseDate maxPromiseDate}selectedVariants{...variants}variantAdditionalInfo{parts{text nativeAction}}priceInfo{priceDisplayCodes{showItemPrice priceDisplayCondition finalCostByWeight}itemPrice{...price}linePrice{...price}unitPrice{...price}preDiscountedLinePrice{...price}additionalLines{name value}}discounts{label labelText{...textFragment}}itemReviewed activationCodes{label code}protectionPlanMessage{...textFragment}showSeller isShippedByWalmart seller{id name isPro}digitalDeliveryPhoneNumber addOns{...OrderAddOn}multiboxBundleId}fragment DriverFragment on Driver{id firstName photoUrl}fragment OrderGroupFragment on OrderGroup{driver{...DriverFragment}deliveryDate fulfillmentType status{...OrderGroupStatusFragment}showSeller isShippedByWalmart seller{...SellerFragment}id itemCount items{...LiteLineItemFragment}pickupPerson{firstName lastName email}accessPointId shipment{...ShipmentFragment}returnEligibilityMessage actions{...OrderGroupActionsFragment}recipientEmailAddress digitalDelivery{...DigitalDeliveryFragment}tireInstallationReservation{status extraText}}fragment OrderGroupStatusFragment on OrderGroupStatus{statusType showStatusTracker statusTracker{status label isCurrent}message{...textFragment}subtext subMessage{...textFragment}notice helpCenterText{...textFragment}}fragment textFragment on Text{parts{bold url text nativeAction lineBreak}}fragment LiteLineItemFragment on OrderLineItem{id quantity product{name usItemId imageInfo{thumbnailUrl}offerId isAlcohol}priceInfo{linePrice{...price}}}fragment SellerFragment on GroupSeller{id name isPro}fragment DigitalDeliveryFragment on DigitalDelivery{title name instructions{...textFragment}}fragment ShipmentFragment on Shipment{id trackingNumber isExternalTracking trackingUrl proofOfDelivery{photoUrl photoPreviewUrl showPreview}}fragment OrderGroupActionsFragment on OrderGroupActions{reorder edit track changeSlot checkin editDeliveryInstructions editPickupPerson editTip tip cancel enableTip{...orderActionFragment}enableEdit{...orderActionFragment}rescheduleTireInstall{...orderActionFragment}cancelTireInstall{...orderActionFragment}help viewCancellationDetails{...cancellationDetailsActionFragment}}fragment cancellationDetailsActionFragment on CancellationDetailsAction{label heading text{...textFragment}}fragment ODPGroupCategoryFragment on OrderCategory{type name subtext returnMessage substitutionsBanner{...textFragment}showExtendedSubstitutions actions{substitutions{message label type}nilPickReshop{message action{text url}}returnDetails viewCancellationDetails{...cancellationDetailsActionFragment}trackOnInHomeApp}banner{...textFragment}accordionState items{...orderLineItem}substitutions{...orderLineItem fulfilledItems{...orderLineItem}}returnInfo{...returnInfoFragment}}fragment ODPGroupFragment on OrderGroup{id fulfillmentType deliveryMessage deliveryAddress{fullName firstName lastName address{...addressFragment}}deliveryInstructions{text type typeText}deliveryPreferences{text{...textFragment}cta{...orderActionFragment}}editSubstitutionsCutOff status{statusType showStatusTracker message{...textFragment}notice helpCenterText{...textFragment}}itemCount isCategorized categories{...ODPGroupCategoryFragment}seller{id name isPro}shipment{id trackingNumber}actions{reorder edit track changeSlot checkin editDeliveryInstructions editPickupPerson tip cancel help enableTip{...orderActionFragment}enableEdit{...orderActionFragment}viewCancellationDetails{...cancellationDetailsActionFragment}enableInHome{...orderActionFragment}createGiftReceipt}cutOffTimestamp isEditSubstitutionsEligible isInHome giftDetails{recipientAddress{fullName}recipientEmail senderName giftMessage}donationDetails{...orderDonationDetails}}fragment returnInfoFragment on ReturnInfo{returnOrderId type refundPriceDetails{__typename...refundPriceDetailsFragment}refundMessage tierRefundMessage paymentMethods{__typename description cardType paymentType displayValues message{...textFragment}}actions{__typename generate scheduleOrModifyPickup{text url}reschedulePickup editPickupContact}shippingLabelUrl qrCodeImageUrl carriers{__typename id name}pickupCarrier pickupContact{nameAndAddress{fullName firstName lastName address{addressString city state postalCode addressLineOne addressLineTwo country}}phone}pickupConfirmationNumber bannerMessage{...textFragment}}fragment refundPriceDetailsFragment on RefundPriceDetails{subTotal{__typename...orderPriceDetailRowFragment}fees{__typename...orderPriceDetailRowFragment}discounts{__typename...orderPriceDetailRowFragment}taxTotal{__typename...orderPriceDetailRowFragment}grandTotal{__typename...orderPriceDetailRowFragment}}fragment orderPriceDetailRowFragment on OrderPriceDetailRow{label displayValue value info{__typename title message}}fragment addressFragment on OrderAddress{addressString addressLineOne addressLineTwo state postalCode city}fragment ODPPickupInfo on OrderGroup{pickupInstructions pickupPerson{...person}alternatePickupPerson{...person}store{id name address{...addressFragment}}}fragment person on OrderPickupPerson{firstName lastName email}fragment ODPTippingInfo on OrderGroup{addTipMessage{...textFragment}driver{...DriverFragment}tipping{min{...price}max{...price}suggested{...price}preselected}subtotal{...price}}fragment orderActionFragment on Action{text url}fragment orderCustomer on OrderCustomer{id firstName lastName email isGuest isEmailRegistered}fragment OrderFieldsFragment on Order{__typename id version type customer{...orderCustomer}displayId idBarcodeImageUrl(barWidth:3 barHeight:100) isFuelPurchase title shortTitle timezone tippableGroup{...OrderGroupFragment}amendableGroup{id changeSlotIterationsLeft cutOffTimestamp fulfillmentType deliveryAddress{fullName firstName lastName address{addressString addressLineOne addressLineTwo state postalCode city country}}isAmendInProgress}substitutionsBanner{heading subheading longSubheading}groups_2101{__typename...OrderGroupFragment...ODPGroupFragment...ODPPickupInfo...ODPTippingInfo}multiboxBundles{...orderLineItem}itemCancelReasons{__typename...cancelReason}groupCancelReasons{__typename...cancelReason}priceDetails{__typename subTotal{__typename...priceDetailFragment}taxTotal{__typename...priceDetailFragment}grandTotal{__typename...priceDetailFragment}authorizationAmount{__typename...priceDetailFragment}fees{__typename...priceDetailFragment}discounts{__typename...priceDetailFragment}minimumThreshold{__typename...price}belowMinimumFee{__typename...priceDetailFragment}driverTip{__typename...priceDetailFragment}donations{__typename...priceDetailFragment}}paymentMethods{__typename description cardType paymentType displayValues message{...textFragment}actions{connectToCapitalOne{...orderActionFragment}visitAffirm{...orderActionFragment}}}actions{__typename return pendingReturn cancel startReturn{...orderActionFragment}reorder}banners{...textFragment}}","variables":{"orderId":"2852237717696","emailAddress":"cathycastaldo13@gmail.com"}}' \
  --compressed`
 
for (( i=0; i<=4; i++ ))
do
  if [[ $curl22 =~ "error"  || $curl22 =~ "blocked" ]]; then
    echo "Lỗi email số 22"
    indexOrder22=`echo error`
    break
  elif [[ `echo $curl22 | jq '.data.guestOrder.groups_2101['${i[@]}'].items[0].product.usItemId'` == '"217281734"' ]]; then
    indexOrder22=`echo $i`
    indexItem22=`echo 0`
  elif [[ `echo $curl22 | jq '.data.guestOrder.groups_2101['${i[@]}'].items[1].product.usItemId'` == '"217281734"' ]]; then
    indexOrder22=`echo $i`
    indexItem22=`echo 1`
  elif [[ `echo $curl22 | jq '.data.guestOrder.groups_2101['${i[@]}'].items[2].product.usItemId'` == '"217281734"' ]]; then
    indexOrder22=`echo $i`
    indexItem22=`echo 2`
  elif [[ `echo $curl22 | jq '.data.guestOrder.groups_2101['${i[@]}'].items[3].product.usItemId'` == '"217281734"' ]]; then
    indexOrder22=`echo $i`
    indexItem22=`echo 3`
  fi
done

if [[ $indexOrder22 != "error" ]]; then
echo $curl22 | jq '.data.guestOrder.id' >> track-OrderID.txt
echo $curl22 | jq '.data.guestOrder.customer.email' >> track-email.txt
echo $curl22 | jq '.data.guestOrder.groups_2101['$indexOrder22'].items['$indexItem22'].product.usItemId' >> track-usItemId.txt
echo $curl22 | jq '.data.guestOrder.groups_2101['$indexOrder22'].items['$indexItem22'].priceInfo.linePrice.value' >> track-priceValue.txt
echo $curl22 | jq '.data.guestOrder.groups_2101['$indexOrder22'].deliveryAddress.fullName' >> track-fullName.txt
echo $curl22 | jq '.data.guestOrder.groups_2101['$indexOrder22'].deliveryAddress.address.addressString' >> track-address.txt
echo $curl22 | jq '.data.guestOrder.groups_2101['$indexOrder22'].status.message.parts[].text' >> track-status.txt
echo $curl22 | jq '.data.guestOrder.groups_2101['$indexOrder22'].shipment.trackingNumber' >> track-number.txt
echo $curl22 | jq '.data.guestOrder.groups_2101['$indexOrder22'].shipment.trackingUrl' >> track-url.txt
fi

curl23=`curl 'https://www.walmart.com/orchestra/home/graphql' \
  -H 'authority: www.walmart.com' \
  -H 'sec-ch-ua: " Not A;Brand";v="99", "Chromium";v="96", "Microsoft Edge";v="96"' \
  -H 'x-o-platform: rweb' \
  -H 'dnt: 1' \
  -H 'x-o-correlation-id: wrvYiSFTlAmd8j7a8DDmpuyOpCN_heAnwM3v' \
  -H 'device_profile_ref_id: _s1F3NO8Y2JjaBUKPDcY4iFDWiIl9CyqiJjf' \
  -H 'x-latency-trace: 1' \
  -H 'wm_mp: true' \
  -H 'x-o-market: us' \
  -H 'x-o-platform-version: main-253-ebbb47' \
  -H 'x-o-gql-query: query getGuestOrder' \
  -H 'wm_page_url: https://www.walmart.com/orders' \
  -H 'x-apollo-operation-name: getGuestOrder' \
  -H 'sec-ch-ua-platform: "macOS"' \
  -H 'sec-ch-ua-mobile: ?0' \
  -H 'user-agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/96.0.4664.110 Safari/537.36 Edg/96.0.1054.62' \
  -H 'x-o-segment: oaoh' \
  -H 'content-type: application/json' \
  -H 'accept: application/json' \
  -H 'x-enable-server-timing: 1' \
  -H 'x-o-ccm: server' \
  -H 'wm_qos.correlation_id: wrvYiSFTlAmd8j7a8DDmpuyOpCN_heAnwM3v' \
  -H 'origin: https://www.walmart.com' \
  -H 'sec-fetch-site: same-origin' \
  -H 'sec-fetch-mode: cors' \
  -H 'sec-fetch-dest: empty' \
  -H 'referer: https://www.walmart.com/orders' \
  -H 'accept-language: vi' \
  --data-raw $'{"query":"query getGuestOrder($orderId:ID\u0021 $emailAddress:String\u0021){guestOrder(input:{id:$orderId emailAddress:$emailAddress}){...OrderFieldsFragment}}fragment cancelReason on OrderCancelReason{__typename subReasonCode subDescription}fragment priceDetailFragment on OrderPriceDetailRow{label value displayValue info{title message}rowInfo{...orderPriceDetailRowInfo}}fragment orderPriceDetailRowInfo on OrderPriceDetailRowInfo{title message{...textFragment}}fragment price on Price{displayValue value}fragment variants on MapEntry{name value}fragment OrderAddOn on OrderAddOn{lineId uniqueLineId productInfo{name usItemId offerId}quantityString quantityLabel type fulfillmentInstructions{...textFragment}actions{manageProtectionPlan{...orderActionFragment}cancel}priceInfo{linePrice{...price}}quantity isActive}fragment orderDonationDetails on OrderDonationDetails{message{...textFragment}emailReceipt emailReceiptToken status{...textFragment}errorStatus}fragment orderLineItem on OrderLineItem{id uniqueId actions{contactSeller cancel addToCart configureCake reviewItem resendEGiftCardToken protectionPlan{...orderActionFragment}manageProtectionPlan{...orderActionFragment}}isGift digitalDeliveryMessage quantity quantityString quantityLabel isSubstitutionSelected fulfilledItems{id quantityString priceInfo{itemPrice{value}}product{usItemId name}}isReturnable returnEligibilityMessage product{name usItemId imageInfo{thumbnailUrl}canonicalUrl offerId sellerId sellerName hasSellerBadge seller{sellerId name}orderLimit orderMinLimit weightIncrement salesUnit salesUnitType isSubstitutionEligible isAlcohol}reshop{reshopMessage isShippingAvailable minPromiseDate maxPromiseDate}selectedVariants{...variants}variantAdditionalInfo{parts{text nativeAction}}priceInfo{priceDisplayCodes{showItemPrice priceDisplayCondition finalCostByWeight}itemPrice{...price}linePrice{...price}unitPrice{...price}preDiscountedLinePrice{...price}additionalLines{name value}}discounts{label labelText{...textFragment}}itemReviewed activationCodes{label code}protectionPlanMessage{...textFragment}showSeller isShippedByWalmart seller{id name isPro}digitalDeliveryPhoneNumber addOns{...OrderAddOn}multiboxBundleId}fragment DriverFragment on Driver{id firstName photoUrl}fragment OrderGroupFragment on OrderGroup{driver{...DriverFragment}deliveryDate fulfillmentType status{...OrderGroupStatusFragment}showSeller isShippedByWalmart seller{...SellerFragment}id itemCount items{...LiteLineItemFragment}pickupPerson{firstName lastName email}accessPointId shipment{...ShipmentFragment}returnEligibilityMessage actions{...OrderGroupActionsFragment}recipientEmailAddress digitalDelivery{...DigitalDeliveryFragment}tireInstallationReservation{status extraText}}fragment OrderGroupStatusFragment on OrderGroupStatus{statusType showStatusTracker statusTracker{status label isCurrent}message{...textFragment}subtext subMessage{...textFragment}notice helpCenterText{...textFragment}}fragment textFragment on Text{parts{bold url text nativeAction lineBreak}}fragment LiteLineItemFragment on OrderLineItem{id quantity product{name usItemId imageInfo{thumbnailUrl}offerId isAlcohol}priceInfo{linePrice{...price}}}fragment SellerFragment on GroupSeller{id name isPro}fragment DigitalDeliveryFragment on DigitalDelivery{title name instructions{...textFragment}}fragment ShipmentFragment on Shipment{id trackingNumber isExternalTracking trackingUrl proofOfDelivery{photoUrl photoPreviewUrl showPreview}}fragment OrderGroupActionsFragment on OrderGroupActions{reorder edit track changeSlot checkin editDeliveryInstructions editPickupPerson editTip tip cancel enableTip{...orderActionFragment}enableEdit{...orderActionFragment}rescheduleTireInstall{...orderActionFragment}cancelTireInstall{...orderActionFragment}help viewCancellationDetails{...cancellationDetailsActionFragment}}fragment cancellationDetailsActionFragment on CancellationDetailsAction{label heading text{...textFragment}}fragment ODPGroupCategoryFragment on OrderCategory{type name subtext returnMessage substitutionsBanner{...textFragment}showExtendedSubstitutions actions{substitutions{message label type}nilPickReshop{message action{text url}}returnDetails viewCancellationDetails{...cancellationDetailsActionFragment}trackOnInHomeApp}banner{...textFragment}accordionState items{...orderLineItem}substitutions{...orderLineItem fulfilledItems{...orderLineItem}}returnInfo{...returnInfoFragment}}fragment ODPGroupFragment on OrderGroup{id fulfillmentType deliveryMessage deliveryAddress{fullName firstName lastName address{...addressFragment}}deliveryInstructions{text type typeText}deliveryPreferences{text{...textFragment}cta{...orderActionFragment}}editSubstitutionsCutOff status{statusType showStatusTracker message{...textFragment}notice helpCenterText{...textFragment}}itemCount isCategorized categories{...ODPGroupCategoryFragment}seller{id name isPro}shipment{id trackingNumber}actions{reorder edit track changeSlot checkin editDeliveryInstructions editPickupPerson tip cancel help enableTip{...orderActionFragment}enableEdit{...orderActionFragment}viewCancellationDetails{...cancellationDetailsActionFragment}enableInHome{...orderActionFragment}createGiftReceipt}cutOffTimestamp isEditSubstitutionsEligible isInHome giftDetails{recipientAddress{fullName}recipientEmail senderName giftMessage}donationDetails{...orderDonationDetails}}fragment returnInfoFragment on ReturnInfo{returnOrderId type refundPriceDetails{__typename...refundPriceDetailsFragment}refundMessage tierRefundMessage paymentMethods{__typename description cardType paymentType displayValues message{...textFragment}}actions{__typename generate scheduleOrModifyPickup{text url}reschedulePickup editPickupContact}shippingLabelUrl qrCodeImageUrl carriers{__typename id name}pickupCarrier pickupContact{nameAndAddress{fullName firstName lastName address{addressString city state postalCode addressLineOne addressLineTwo country}}phone}pickupConfirmationNumber bannerMessage{...textFragment}}fragment refundPriceDetailsFragment on RefundPriceDetails{subTotal{__typename...orderPriceDetailRowFragment}fees{__typename...orderPriceDetailRowFragment}discounts{__typename...orderPriceDetailRowFragment}taxTotal{__typename...orderPriceDetailRowFragment}grandTotal{__typename...orderPriceDetailRowFragment}}fragment orderPriceDetailRowFragment on OrderPriceDetailRow{label displayValue value info{__typename title message}}fragment addressFragment on OrderAddress{addressString addressLineOne addressLineTwo state postalCode city}fragment ODPPickupInfo on OrderGroup{pickupInstructions pickupPerson{...person}alternatePickupPerson{...person}store{id name address{...addressFragment}}}fragment person on OrderPickupPerson{firstName lastName email}fragment ODPTippingInfo on OrderGroup{addTipMessage{...textFragment}driver{...DriverFragment}tipping{min{...price}max{...price}suggested{...price}preselected}subtotal{...price}}fragment orderActionFragment on Action{text url}fragment orderCustomer on OrderCustomer{id firstName lastName email isGuest isEmailRegistered}fragment OrderFieldsFragment on Order{__typename id version type customer{...orderCustomer}displayId idBarcodeImageUrl(barWidth:3 barHeight:100) isFuelPurchase title shortTitle timezone tippableGroup{...OrderGroupFragment}amendableGroup{id changeSlotIterationsLeft cutOffTimestamp fulfillmentType deliveryAddress{fullName firstName lastName address{addressString addressLineOne addressLineTwo state postalCode city country}}isAmendInProgress}substitutionsBanner{heading subheading longSubheading}groups_2101{__typename...OrderGroupFragment...ODPGroupFragment...ODPPickupInfo...ODPTippingInfo}multiboxBundles{...orderLineItem}itemCancelReasons{__typename...cancelReason}groupCancelReasons{__typename...cancelReason}priceDetails{__typename subTotal{__typename...priceDetailFragment}taxTotal{__typename...priceDetailFragment}grandTotal{__typename...priceDetailFragment}authorizationAmount{__typename...priceDetailFragment}fees{__typename...priceDetailFragment}discounts{__typename...priceDetailFragment}minimumThreshold{__typename...price}belowMinimumFee{__typename...priceDetailFragment}driverTip{__typename...priceDetailFragment}donations{__typename...priceDetailFragment}}paymentMethods{__typename description cardType paymentType displayValues message{...textFragment}actions{connectToCapitalOne{...orderActionFragment}visitAffirm{...orderActionFragment}}}actions{__typename return pendingReturn cancel startReturn{...orderActionFragment}reorder}banners{...textFragment}}","variables":{"orderId":"2842234039228","emailAddress":"natedaunt@yahoo.com"}}' \
  --compressed`
 
for (( i=0; i<=4; i++ ))
do
  if [[ $curl23 =~ "error"  || $curl23 =~ "blocked" ]]; then
    echo "Lỗi email số 23"
    indexOrder23=`echo error`
    break
  elif [[ `echo $curl23 | jq '.data.guestOrder.groups_2101['${i[@]}'].items[0].product.usItemId'` == '"54315959"' ]]; then
    indexOrder23=`echo $i`
    indexItem23=`echo 0`
  elif [[ `echo $curl23 | jq '.data.guestOrder.groups_2101['${i[@]}'].items[1].product.usItemId'` == '"54315959"' ]]; then
    indexOrder23=`echo $i`
    indexItem23=`echo 1`
  elif [[ `echo $curl23 | jq '.data.guestOrder.groups_2101['${i[@]}'].items[2].product.usItemId'` == '"54315959"' ]]; then
    indexOrder23=`echo $i`
    indexItem23=`echo 2`
  elif [[ `echo $curl23 | jq '.data.guestOrder.groups_2101['${i[@]}'].items[3].product.usItemId'` == '"54315959"' ]]; then
    indexOrder23=`echo $i`
    indexItem23=`echo 3`
  fi
done

if [[ $indexOrder23 != "error" ]]; then
echo $curl23 | jq '.data.guestOrder.id' >> track-OrderID.txt
echo $curl23 | jq '.data.guestOrder.customer.email' >> track-email.txt
echo $curl23 | jq '.data.guestOrder.groups_2101['$indexOrder23'].items['$indexItem23'].product.usItemId' >> track-usItemId.txt
echo $curl23 | jq '.data.guestOrder.groups_2101['$indexOrder23'].items['$indexItem23'].priceInfo.linePrice.value' >> track-priceValue.txt
echo $curl23 | jq '.data.guestOrder.groups_2101['$indexOrder23'].deliveryAddress.fullName' >> track-fullName.txt
echo $curl23 | jq '.data.guestOrder.groups_2101['$indexOrder23'].deliveryAddress.address.addressString' >> track-address.txt
echo $curl23 | jq '.data.guestOrder.groups_2101['$indexOrder23'].status.message.parts[].text' >> track-status.txt
echo $curl23 | jq '.data.guestOrder.groups_2101['$indexOrder23'].shipment.trackingNumber' >> track-number.txt
echo $curl23 | jq '.data.guestOrder.groups_2101['$indexOrder23'].shipment.trackingUrl' >> track-url.txt
fi

curl24=`curl 'https://www.walmart.com/orchestra/home/graphql' \
  -H 'authority: www.walmart.com' \
  -H 'sec-ch-ua: " Not A;Brand";v="99", "Chromium";v="96", "Microsoft Edge";v="96"' \
  -H 'x-o-platform: rweb' \
  -H 'dnt: 1' \
  -H 'x-o-correlation-id: wrvYiSFTlAmd8j7a8DDmpuyOpCN_heAnwM3v' \
  -H 'device_profile_ref_id: _s1F3NO8Y2JjaBUKPDcY4iFDWiIl9CyqiJjf' \
  -H 'x-latency-trace: 1' \
  -H 'wm_mp: true' \
  -H 'x-o-market: us' \
  -H 'x-o-platform-version: main-253-ebbb47' \
  -H 'x-o-gql-query: query getGuestOrder' \
  -H 'wm_page_url: https://www.walmart.com/orders' \
  -H 'x-apollo-operation-name: getGuestOrder' \
  -H 'sec-ch-ua-platform: "macOS"' \
  -H 'sec-ch-ua-mobile: ?0' \
  -H 'user-agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/96.0.4664.110 Safari/537.36 Edg/96.0.1054.62' \
  -H 'x-o-segment: oaoh' \
  -H 'content-type: application/json' \
  -H 'accept: application/json' \
  -H 'x-enable-server-timing: 1' \
  -H 'x-o-ccm: server' \
  -H 'wm_qos.correlation_id: wrvYiSFTlAmd8j7a8DDmpuyOpCN_heAnwM3v' \
  -H 'origin: https://www.walmart.com' \
  -H 'sec-fetch-site: same-origin' \
  -H 'sec-fetch-mode: cors' \
  -H 'sec-fetch-dest: empty' \
  -H 'referer: https://www.walmart.com/orders' \
  -H 'accept-language: vi' \
  --data-raw $'{"query":"query getGuestOrder($orderId:ID\u0021 $emailAddress:String\u0021){guestOrder(input:{id:$orderId emailAddress:$emailAddress}){...OrderFieldsFragment}}fragment cancelReason on OrderCancelReason{__typename subReasonCode subDescription}fragment priceDetailFragment on OrderPriceDetailRow{label value displayValue info{title message}rowInfo{...orderPriceDetailRowInfo}}fragment orderPriceDetailRowInfo on OrderPriceDetailRowInfo{title message{...textFragment}}fragment price on Price{displayValue value}fragment variants on MapEntry{name value}fragment OrderAddOn on OrderAddOn{lineId uniqueLineId productInfo{name usItemId offerId}quantityString quantityLabel type fulfillmentInstructions{...textFragment}actions{manageProtectionPlan{...orderActionFragment}cancel}priceInfo{linePrice{...price}}quantity isActive}fragment orderDonationDetails on OrderDonationDetails{message{...textFragment}emailReceipt emailReceiptToken status{...textFragment}errorStatus}fragment orderLineItem on OrderLineItem{id uniqueId actions{contactSeller cancel addToCart configureCake reviewItem resendEGiftCardToken protectionPlan{...orderActionFragment}manageProtectionPlan{...orderActionFragment}}isGift digitalDeliveryMessage quantity quantityString quantityLabel isSubstitutionSelected fulfilledItems{id quantityString priceInfo{itemPrice{value}}product{usItemId name}}isReturnable returnEligibilityMessage product{name usItemId imageInfo{thumbnailUrl}canonicalUrl offerId sellerId sellerName hasSellerBadge seller{sellerId name}orderLimit orderMinLimit weightIncrement salesUnit salesUnitType isSubstitutionEligible isAlcohol}reshop{reshopMessage isShippingAvailable minPromiseDate maxPromiseDate}selectedVariants{...variants}variantAdditionalInfo{parts{text nativeAction}}priceInfo{priceDisplayCodes{showItemPrice priceDisplayCondition finalCostByWeight}itemPrice{...price}linePrice{...price}unitPrice{...price}preDiscountedLinePrice{...price}additionalLines{name value}}discounts{label labelText{...textFragment}}itemReviewed activationCodes{label code}protectionPlanMessage{...textFragment}showSeller isShippedByWalmart seller{id name isPro}digitalDeliveryPhoneNumber addOns{...OrderAddOn}multiboxBundleId}fragment DriverFragment on Driver{id firstName photoUrl}fragment OrderGroupFragment on OrderGroup{driver{...DriverFragment}deliveryDate fulfillmentType status{...OrderGroupStatusFragment}showSeller isShippedByWalmart seller{...SellerFragment}id itemCount items{...LiteLineItemFragment}pickupPerson{firstName lastName email}accessPointId shipment{...ShipmentFragment}returnEligibilityMessage actions{...OrderGroupActionsFragment}recipientEmailAddress digitalDelivery{...DigitalDeliveryFragment}tireInstallationReservation{status extraText}}fragment OrderGroupStatusFragment on OrderGroupStatus{statusType showStatusTracker statusTracker{status label isCurrent}message{...textFragment}subtext subMessage{...textFragment}notice helpCenterText{...textFragment}}fragment textFragment on Text{parts{bold url text nativeAction lineBreak}}fragment LiteLineItemFragment on OrderLineItem{id quantity product{name usItemId imageInfo{thumbnailUrl}offerId isAlcohol}priceInfo{linePrice{...price}}}fragment SellerFragment on GroupSeller{id name isPro}fragment DigitalDeliveryFragment on DigitalDelivery{title name instructions{...textFragment}}fragment ShipmentFragment on Shipment{id trackingNumber isExternalTracking trackingUrl proofOfDelivery{photoUrl photoPreviewUrl showPreview}}fragment OrderGroupActionsFragment on OrderGroupActions{reorder edit track changeSlot checkin editDeliveryInstructions editPickupPerson editTip tip cancel enableTip{...orderActionFragment}enableEdit{...orderActionFragment}rescheduleTireInstall{...orderActionFragment}cancelTireInstall{...orderActionFragment}help viewCancellationDetails{...cancellationDetailsActionFragment}}fragment cancellationDetailsActionFragment on CancellationDetailsAction{label heading text{...textFragment}}fragment ODPGroupCategoryFragment on OrderCategory{type name subtext returnMessage substitutionsBanner{...textFragment}showExtendedSubstitutions actions{substitutions{message label type}nilPickReshop{message action{text url}}returnDetails viewCancellationDetails{...cancellationDetailsActionFragment}trackOnInHomeApp}banner{...textFragment}accordionState items{...orderLineItem}substitutions{...orderLineItem fulfilledItems{...orderLineItem}}returnInfo{...returnInfoFragment}}fragment ODPGroupFragment on OrderGroup{id fulfillmentType deliveryMessage deliveryAddress{fullName firstName lastName address{...addressFragment}}deliveryInstructions{text type typeText}deliveryPreferences{text{...textFragment}cta{...orderActionFragment}}editSubstitutionsCutOff status{statusType showStatusTracker message{...textFragment}notice helpCenterText{...textFragment}}itemCount isCategorized categories{...ODPGroupCategoryFragment}seller{id name isPro}shipment{id trackingNumber}actions{reorder edit track changeSlot checkin editDeliveryInstructions editPickupPerson tip cancel help enableTip{...orderActionFragment}enableEdit{...orderActionFragment}viewCancellationDetails{...cancellationDetailsActionFragment}enableInHome{...orderActionFragment}createGiftReceipt}cutOffTimestamp isEditSubstitutionsEligible isInHome giftDetails{recipientAddress{fullName}recipientEmail senderName giftMessage}donationDetails{...orderDonationDetails}}fragment returnInfoFragment on ReturnInfo{returnOrderId type refundPriceDetails{__typename...refundPriceDetailsFragment}refundMessage tierRefundMessage paymentMethods{__typename description cardType paymentType displayValues message{...textFragment}}actions{__typename generate scheduleOrModifyPickup{text url}reschedulePickup editPickupContact}shippingLabelUrl qrCodeImageUrl carriers{__typename id name}pickupCarrier pickupContact{nameAndAddress{fullName firstName lastName address{addressString city state postalCode addressLineOne addressLineTwo country}}phone}pickupConfirmationNumber bannerMessage{...textFragment}}fragment refundPriceDetailsFragment on RefundPriceDetails{subTotal{__typename...orderPriceDetailRowFragment}fees{__typename...orderPriceDetailRowFragment}discounts{__typename...orderPriceDetailRowFragment}taxTotal{__typename...orderPriceDetailRowFragment}grandTotal{__typename...orderPriceDetailRowFragment}}fragment orderPriceDetailRowFragment on OrderPriceDetailRow{label displayValue value info{__typename title message}}fragment addressFragment on OrderAddress{addressString addressLineOne addressLineTwo state postalCode city}fragment ODPPickupInfo on OrderGroup{pickupInstructions pickupPerson{...person}alternatePickupPerson{...person}store{id name address{...addressFragment}}}fragment person on OrderPickupPerson{firstName lastName email}fragment ODPTippingInfo on OrderGroup{addTipMessage{...textFragment}driver{...DriverFragment}tipping{min{...price}max{...price}suggested{...price}preselected}subtotal{...price}}fragment orderActionFragment on Action{text url}fragment orderCustomer on OrderCustomer{id firstName lastName email isGuest isEmailRegistered}fragment OrderFieldsFragment on Order{__typename id version type customer{...orderCustomer}displayId idBarcodeImageUrl(barWidth:3 barHeight:100) isFuelPurchase title shortTitle timezone tippableGroup{...OrderGroupFragment}amendableGroup{id changeSlotIterationsLeft cutOffTimestamp fulfillmentType deliveryAddress{fullName firstName lastName address{addressString addressLineOne addressLineTwo state postalCode city country}}isAmendInProgress}substitutionsBanner{heading subheading longSubheading}groups_2101{__typename...OrderGroupFragment...ODPGroupFragment...ODPPickupInfo...ODPTippingInfo}multiboxBundles{...orderLineItem}itemCancelReasons{__typename...cancelReason}groupCancelReasons{__typename...cancelReason}priceDetails{__typename subTotal{__typename...priceDetailFragment}taxTotal{__typename...priceDetailFragment}grandTotal{__typename...priceDetailFragment}authorizationAmount{__typename...priceDetailFragment}fees{__typename...priceDetailFragment}discounts{__typename...priceDetailFragment}minimumThreshold{__typename...price}belowMinimumFee{__typename...priceDetailFragment}driverTip{__typename...priceDetailFragment}donations{__typename...priceDetailFragment}}paymentMethods{__typename description cardType paymentType displayValues message{...textFragment}actions{connectToCapitalOne{...orderActionFragment}visitAffirm{...orderActionFragment}}}actions{__typename return pendingReturn cancel startReturn{...orderActionFragment}reorder}banners{...textFragment}}","variables":{"orderId":"2832232637075","emailAddress":"antoniorodriguez4665@hotmail.com"}}' \
  --compressed`
 
for (( i=0; i<=4; i++ ))
do
  if [[ $curl24 =~ "error"  || $curl24 =~ "blocked" ]]; then
    echo "Lỗi email số 24"
    indexOrder24=`echo error`
    break
  elif [[ `echo $curl24 | jq '.data.guestOrder.groups_2101['${i[@]}'].items[0].product.usItemId'` == '"641220610"' ]]; then
    indexOrder24=`echo $i`
    indexItem24=`echo 0`
  elif [[ `echo $curl24 | jq '.data.guestOrder.groups_2101['${i[@]}'].items[1].product.usItemId'` == '"641220610"' ]]; then
    indexOrder24=`echo $i`
    indexItem24=`echo 1`
  elif [[ `echo $curl24 | jq '.data.guestOrder.groups_2101['${i[@]}'].items[2].product.usItemId'` == '"641220610"' ]]; then
    indexOrder24=`echo $i`
    indexItem24=`echo 2`
  elif [[ `echo $curl24 | jq '.data.guestOrder.groups_2101['${i[@]}'].items[3].product.usItemId'` == '"641220610"' ]]; then
    indexOrder24=`echo $i`
    indexItem24=`echo 3`
  fi
done

if [[ $indexOrder24 != "error" ]]; then
echo $curl24 | jq '.data.guestOrder.id' >> track-OrderID.txt
echo $curl24 | jq '.data.guestOrder.customer.email' >> track-email.txt
echo $curl24 | jq '.data.guestOrder.groups_2101['$indexOrder24'].items['$indexItem24'].product.usItemId' >> track-usItemId.txt
echo $curl24 | jq '.data.guestOrder.groups_2101['$indexOrder24'].items['$indexItem24'].priceInfo.linePrice.value' >> track-priceValue.txt
echo $curl24 | jq '.data.guestOrder.groups_2101['$indexOrder24'].deliveryAddress.fullName' >> track-fullName.txt
echo $curl24 | jq '.data.guestOrder.groups_2101['$indexOrder24'].deliveryAddress.address.addressString' >> track-address.txt
echo $curl24 | jq '.data.guestOrder.groups_2101['$indexOrder24'].status.message.parts[].text' >> track-status.txt
echo $curl24 | jq '.data.guestOrder.groups_2101['$indexOrder24'].shipment.trackingNumber' >> track-number.txt
echo $curl24 | jq '.data.guestOrder.groups_2101['$indexOrder24'].shipment.trackingUrl' >> track-url.txt
fi

curl25=`curl 'https://www.walmart.com/orchestra/home/graphql' \
  -H 'authority: www.walmart.com' \
  -H 'sec-ch-ua: " Not A;Brand";v="99", "Chromium";v="96", "Microsoft Edge";v="96"' \
  -H 'x-o-platform: rweb' \
  -H 'dnt: 1' \
  -H 'x-o-correlation-id: wrvYiSFTlAmd8j7a8DDmpuyOpCN_heAnwM3v' \
  -H 'device_profile_ref_id: _s1F3NO8Y2JjaBUKPDcY4iFDWiIl9CyqiJjf' \
  -H 'x-latency-trace: 1' \
  -H 'wm_mp: true' \
  -H 'x-o-market: us' \
  -H 'x-o-platform-version: main-253-ebbb47' \
  -H 'x-o-gql-query: query getGuestOrder' \
  -H 'wm_page_url: https://www.walmart.com/orders' \
  -H 'x-apollo-operation-name: getGuestOrder' \
  -H 'sec-ch-ua-platform: "macOS"' \
  -H 'sec-ch-ua-mobile: ?0' \
  -H 'user-agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/96.0.4664.110 Safari/537.36 Edg/96.0.1054.62' \
  -H 'x-o-segment: oaoh' \
  -H 'content-type: application/json' \
  -H 'accept: application/json' \
  -H 'x-enable-server-timing: 1' \
  -H 'x-o-ccm: server' \
  -H 'wm_qos.correlation_id: wrvYiSFTlAmd8j7a8DDmpuyOpCN_heAnwM3v' \
  -H 'origin: https://www.walmart.com' \
  -H 'sec-fetch-site: same-origin' \
  -H 'sec-fetch-mode: cors' \
  -H 'sec-fetch-dest: empty' \
  -H 'referer: https://www.walmart.com/orders' \
  -H 'accept-language: vi' \
  --data-raw $'{"query":"query getGuestOrder($orderId:ID\u0021 $emailAddress:String\u0021){guestOrder(input:{id:$orderId emailAddress:$emailAddress}){...OrderFieldsFragment}}fragment cancelReason on OrderCancelReason{__typename subReasonCode subDescription}fragment priceDetailFragment on OrderPriceDetailRow{label value displayValue info{title message}rowInfo{...orderPriceDetailRowInfo}}fragment orderPriceDetailRowInfo on OrderPriceDetailRowInfo{title message{...textFragment}}fragment price on Price{displayValue value}fragment variants on MapEntry{name value}fragment OrderAddOn on OrderAddOn{lineId uniqueLineId productInfo{name usItemId offerId}quantityString quantityLabel type fulfillmentInstructions{...textFragment}actions{manageProtectionPlan{...orderActionFragment}cancel}priceInfo{linePrice{...price}}quantity isActive}fragment orderDonationDetails on OrderDonationDetails{message{...textFragment}emailReceipt emailReceiptToken status{...textFragment}errorStatus}fragment orderLineItem on OrderLineItem{id uniqueId actions{contactSeller cancel addToCart configureCake reviewItem resendEGiftCardToken protectionPlan{...orderActionFragment}manageProtectionPlan{...orderActionFragment}}isGift digitalDeliveryMessage quantity quantityString quantityLabel isSubstitutionSelected fulfilledItems{id quantityString priceInfo{itemPrice{value}}product{usItemId name}}isReturnable returnEligibilityMessage product{name usItemId imageInfo{thumbnailUrl}canonicalUrl offerId sellerId sellerName hasSellerBadge seller{sellerId name}orderLimit orderMinLimit weightIncrement salesUnit salesUnitType isSubstitutionEligible isAlcohol}reshop{reshopMessage isShippingAvailable minPromiseDate maxPromiseDate}selectedVariants{...variants}variantAdditionalInfo{parts{text nativeAction}}priceInfo{priceDisplayCodes{showItemPrice priceDisplayCondition finalCostByWeight}itemPrice{...price}linePrice{...price}unitPrice{...price}preDiscountedLinePrice{...price}additionalLines{name value}}discounts{label labelText{...textFragment}}itemReviewed activationCodes{label code}protectionPlanMessage{...textFragment}showSeller isShippedByWalmart seller{id name isPro}digitalDeliveryPhoneNumber addOns{...OrderAddOn}multiboxBundleId}fragment DriverFragment on Driver{id firstName photoUrl}fragment OrderGroupFragment on OrderGroup{driver{...DriverFragment}deliveryDate fulfillmentType status{...OrderGroupStatusFragment}showSeller isShippedByWalmart seller{...SellerFragment}id itemCount items{...LiteLineItemFragment}pickupPerson{firstName lastName email}accessPointId shipment{...ShipmentFragment}returnEligibilityMessage actions{...OrderGroupActionsFragment}recipientEmailAddress digitalDelivery{...DigitalDeliveryFragment}tireInstallationReservation{status extraText}}fragment OrderGroupStatusFragment on OrderGroupStatus{statusType showStatusTracker statusTracker{status label isCurrent}message{...textFragment}subtext subMessage{...textFragment}notice helpCenterText{...textFragment}}fragment textFragment on Text{parts{bold url text nativeAction lineBreak}}fragment LiteLineItemFragment on OrderLineItem{id quantity product{name usItemId imageInfo{thumbnailUrl}offerId isAlcohol}priceInfo{linePrice{...price}}}fragment SellerFragment on GroupSeller{id name isPro}fragment DigitalDeliveryFragment on DigitalDelivery{title name instructions{...textFragment}}fragment ShipmentFragment on Shipment{id trackingNumber isExternalTracking trackingUrl proofOfDelivery{photoUrl photoPreviewUrl showPreview}}fragment OrderGroupActionsFragment on OrderGroupActions{reorder edit track changeSlot checkin editDeliveryInstructions editPickupPerson editTip tip cancel enableTip{...orderActionFragment}enableEdit{...orderActionFragment}rescheduleTireInstall{...orderActionFragment}cancelTireInstall{...orderActionFragment}help viewCancellationDetails{...cancellationDetailsActionFragment}}fragment cancellationDetailsActionFragment on CancellationDetailsAction{label heading text{...textFragment}}fragment ODPGroupCategoryFragment on OrderCategory{type name subtext returnMessage substitutionsBanner{...textFragment}showExtendedSubstitutions actions{substitutions{message label type}nilPickReshop{message action{text url}}returnDetails viewCancellationDetails{...cancellationDetailsActionFragment}trackOnInHomeApp}banner{...textFragment}accordionState items{...orderLineItem}substitutions{...orderLineItem fulfilledItems{...orderLineItem}}returnInfo{...returnInfoFragment}}fragment ODPGroupFragment on OrderGroup{id fulfillmentType deliveryMessage deliveryAddress{fullName firstName lastName address{...addressFragment}}deliveryInstructions{text type typeText}deliveryPreferences{text{...textFragment}cta{...orderActionFragment}}editSubstitutionsCutOff status{statusType showStatusTracker message{...textFragment}notice helpCenterText{...textFragment}}itemCount isCategorized categories{...ODPGroupCategoryFragment}seller{id name isPro}shipment{id trackingNumber}actions{reorder edit track changeSlot checkin editDeliveryInstructions editPickupPerson tip cancel help enableTip{...orderActionFragment}enableEdit{...orderActionFragment}viewCancellationDetails{...cancellationDetailsActionFragment}enableInHome{...orderActionFragment}createGiftReceipt}cutOffTimestamp isEditSubstitutionsEligible isInHome giftDetails{recipientAddress{fullName}recipientEmail senderName giftMessage}donationDetails{...orderDonationDetails}}fragment returnInfoFragment on ReturnInfo{returnOrderId type refundPriceDetails{__typename...refundPriceDetailsFragment}refundMessage tierRefundMessage paymentMethods{__typename description cardType paymentType displayValues message{...textFragment}}actions{__typename generate scheduleOrModifyPickup{text url}reschedulePickup editPickupContact}shippingLabelUrl qrCodeImageUrl carriers{__typename id name}pickupCarrier pickupContact{nameAndAddress{fullName firstName lastName address{addressString city state postalCode addressLineOne addressLineTwo country}}phone}pickupConfirmationNumber bannerMessage{...textFragment}}fragment refundPriceDetailsFragment on RefundPriceDetails{subTotal{__typename...orderPriceDetailRowFragment}fees{__typename...orderPriceDetailRowFragment}discounts{__typename...orderPriceDetailRowFragment}taxTotal{__typename...orderPriceDetailRowFragment}grandTotal{__typename...orderPriceDetailRowFragment}}fragment orderPriceDetailRowFragment on OrderPriceDetailRow{label displayValue value info{__typename title message}}fragment addressFragment on OrderAddress{addressString addressLineOne addressLineTwo state postalCode city}fragment ODPPickupInfo on OrderGroup{pickupInstructions pickupPerson{...person}alternatePickupPerson{...person}store{id name address{...addressFragment}}}fragment person on OrderPickupPerson{firstName lastName email}fragment ODPTippingInfo on OrderGroup{addTipMessage{...textFragment}driver{...DriverFragment}tipping{min{...price}max{...price}suggested{...price}preselected}subtotal{...price}}fragment orderActionFragment on Action{text url}fragment orderCustomer on OrderCustomer{id firstName lastName email isGuest isEmailRegistered}fragment OrderFieldsFragment on Order{__typename id version type customer{...orderCustomer}displayId idBarcodeImageUrl(barWidth:3 barHeight:100) isFuelPurchase title shortTitle timezone tippableGroup{...OrderGroupFragment}amendableGroup{id changeSlotIterationsLeft cutOffTimestamp fulfillmentType deliveryAddress{fullName firstName lastName address{addressString addressLineOne addressLineTwo state postalCode city country}}isAmendInProgress}substitutionsBanner{heading subheading longSubheading}groups_2101{__typename...OrderGroupFragment...ODPGroupFragment...ODPPickupInfo...ODPTippingInfo}multiboxBundles{...orderLineItem}itemCancelReasons{__typename...cancelReason}groupCancelReasons{__typename...cancelReason}priceDetails{__typename subTotal{__typename...priceDetailFragment}taxTotal{__typename...priceDetailFragment}grandTotal{__typename...priceDetailFragment}authorizationAmount{__typename...priceDetailFragment}fees{__typename...priceDetailFragment}discounts{__typename...priceDetailFragment}minimumThreshold{__typename...price}belowMinimumFee{__typename...priceDetailFragment}driverTip{__typename...priceDetailFragment}donations{__typename...priceDetailFragment}}paymentMethods{__typename description cardType paymentType displayValues message{...textFragment}actions{connectToCapitalOne{...orderActionFragment}visitAffirm{...orderActionFragment}}}actions{__typename return pendingReturn cancel startReturn{...orderActionFragment}reorder}banners{...textFragment}}","variables":{"orderId":"2842234267189","emailAddress":"asaylor2000@gmail.com"}}' \
  --compressed`
 
for (( i=0; i<=4; i++ ))
do
  if [[ $curl25 =~ "error"  || $curl25 =~ "blocked" ]]; then
    echo "Lỗi email số 25"
    indexOrder25=`echo error`
    break
  elif [[ `echo $curl25 | jq '.data.guestOrder.groups_2101['${i[@]}'].items[0].product.usItemId'` == '"325768579"' ]]; then
    indexOrder25=`echo $i`
    indexItem25=`echo 0`
  elif [[ `echo $curl25 | jq '.data.guestOrder.groups_2101['${i[@]}'].items[1].product.usItemId'` == '"325768579"' ]]; then
    indexOrder25=`echo $i`
    indexItem25=`echo 1`
  elif [[ `echo $curl25 | jq '.data.guestOrder.groups_2101['${i[@]}'].items[2].product.usItemId'` == '"325768579"' ]]; then
    indexOrder25=`echo $i`
    indexItem25=`echo 2`
  elif [[ `echo $curl25 | jq '.data.guestOrder.groups_2101['${i[@]}'].items[3].product.usItemId'` == '"325768579"' ]]; then
    indexOrder25=`echo $i`
    indexItem25=`echo 3`
  fi
done

if [[ $indexOrder25 != "error" ]]; then
echo $curl25 | jq '.data.guestOrder.id' >> track-OrderID.txt
echo $curl25 | jq '.data.guestOrder.customer.email' >> track-email.txt
echo $curl25 | jq '.data.guestOrder.groups_2101['$indexOrder25'].items['$indexItem25'].product.usItemId' >> track-usItemId.txt
echo $curl25 | jq '.data.guestOrder.groups_2101['$indexOrder25'].items['$indexItem25'].priceInfo.linePrice.value' >> track-priceValue.txt
echo $curl25 | jq '.data.guestOrder.groups_2101['$indexOrder25'].deliveryAddress.fullName' >> track-fullName.txt
echo $curl25 | jq '.data.guestOrder.groups_2101['$indexOrder25'].deliveryAddress.address.addressString' >> track-address.txt
echo $curl25 | jq '.data.guestOrder.groups_2101['$indexOrder25'].status.message.parts[].text' >> track-status.txt
echo $curl25 | jq '.data.guestOrder.groups_2101['$indexOrder25'].shipment.trackingNumber' >> track-number.txt
echo $curl25 | jq '.data.guestOrder.groups_2101['$indexOrder25'].shipment.trackingUrl' >> track-url.txt
fi

curl26=`curl 'https://www.walmart.com/orchestra/home/graphql' \
  -H 'authority: www.walmart.com' \
  -H 'sec-ch-ua: " Not A;Brand";v="99", "Chromium";v="96", "Microsoft Edge";v="96"' \
  -H 'x-o-platform: rweb' \
  -H 'dnt: 1' \
  -H 'x-o-correlation-id: wrvYiSFTlAmd8j7a8DDmpuyOpCN_heAnwM3v' \
  -H 'device_profile_ref_id: _s1F3NO8Y2JjaBUKPDcY4iFDWiIl9CyqiJjf' \
  -H 'x-latency-trace: 1' \
  -H 'wm_mp: true' \
  -H 'x-o-market: us' \
  -H 'x-o-platform-version: main-253-ebbb47' \
  -H 'x-o-gql-query: query getGuestOrder' \
  -H 'wm_page_url: https://www.walmart.com/orders' \
  -H 'x-apollo-operation-name: getGuestOrder' \
  -H 'sec-ch-ua-platform: "macOS"' \
  -H 'sec-ch-ua-mobile: ?0' \
  -H 'user-agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/96.0.4664.110 Safari/537.36 Edg/96.0.1054.62' \
  -H 'x-o-segment: oaoh' \
  -H 'content-type: application/json' \
  -H 'accept: application/json' \
  -H 'x-enable-server-timing: 1' \
  -H 'x-o-ccm: server' \
  -H 'wm_qos.correlation_id: wrvYiSFTlAmd8j7a8DDmpuyOpCN_heAnwM3v' \
  -H 'origin: https://www.walmart.com' \
  -H 'sec-fetch-site: same-origin' \
  -H 'sec-fetch-mode: cors' \
  -H 'sec-fetch-dest: empty' \
  -H 'referer: https://www.walmart.com/orders' \
  -H 'accept-language: vi' \
  --data-raw $'{"query":"query getGuestOrder($orderId:ID\u0021 $emailAddress:String\u0021){guestOrder(input:{id:$orderId emailAddress:$emailAddress}){...OrderFieldsFragment}}fragment cancelReason on OrderCancelReason{__typename subReasonCode subDescription}fragment priceDetailFragment on OrderPriceDetailRow{label value displayValue info{title message}rowInfo{...orderPriceDetailRowInfo}}fragment orderPriceDetailRowInfo on OrderPriceDetailRowInfo{title message{...textFragment}}fragment price on Price{displayValue value}fragment variants on MapEntry{name value}fragment OrderAddOn on OrderAddOn{lineId uniqueLineId productInfo{name usItemId offerId}quantityString quantityLabel type fulfillmentInstructions{...textFragment}actions{manageProtectionPlan{...orderActionFragment}cancel}priceInfo{linePrice{...price}}quantity isActive}fragment orderDonationDetails on OrderDonationDetails{message{...textFragment}emailReceipt emailReceiptToken status{...textFragment}errorStatus}fragment orderLineItem on OrderLineItem{id uniqueId actions{contactSeller cancel addToCart configureCake reviewItem resendEGiftCardToken protectionPlan{...orderActionFragment}manageProtectionPlan{...orderActionFragment}}isGift digitalDeliveryMessage quantity quantityString quantityLabel isSubstitutionSelected fulfilledItems{id quantityString priceInfo{itemPrice{value}}product{usItemId name}}isReturnable returnEligibilityMessage product{name usItemId imageInfo{thumbnailUrl}canonicalUrl offerId sellerId sellerName hasSellerBadge seller{sellerId name}orderLimit orderMinLimit weightIncrement salesUnit salesUnitType isSubstitutionEligible isAlcohol}reshop{reshopMessage isShippingAvailable minPromiseDate maxPromiseDate}selectedVariants{...variants}variantAdditionalInfo{parts{text nativeAction}}priceInfo{priceDisplayCodes{showItemPrice priceDisplayCondition finalCostByWeight}itemPrice{...price}linePrice{...price}unitPrice{...price}preDiscountedLinePrice{...price}additionalLines{name value}}discounts{label labelText{...textFragment}}itemReviewed activationCodes{label code}protectionPlanMessage{...textFragment}showSeller isShippedByWalmart seller{id name isPro}digitalDeliveryPhoneNumber addOns{...OrderAddOn}multiboxBundleId}fragment DriverFragment on Driver{id firstName photoUrl}fragment OrderGroupFragment on OrderGroup{driver{...DriverFragment}deliveryDate fulfillmentType status{...OrderGroupStatusFragment}showSeller isShippedByWalmart seller{...SellerFragment}id itemCount items{...LiteLineItemFragment}pickupPerson{firstName lastName email}accessPointId shipment{...ShipmentFragment}returnEligibilityMessage actions{...OrderGroupActionsFragment}recipientEmailAddress digitalDelivery{...DigitalDeliveryFragment}tireInstallationReservation{status extraText}}fragment OrderGroupStatusFragment on OrderGroupStatus{statusType showStatusTracker statusTracker{status label isCurrent}message{...textFragment}subtext subMessage{...textFragment}notice helpCenterText{...textFragment}}fragment textFragment on Text{parts{bold url text nativeAction lineBreak}}fragment LiteLineItemFragment on OrderLineItem{id quantity product{name usItemId imageInfo{thumbnailUrl}offerId isAlcohol}priceInfo{linePrice{...price}}}fragment SellerFragment on GroupSeller{id name isPro}fragment DigitalDeliveryFragment on DigitalDelivery{title name instructions{...textFragment}}fragment ShipmentFragment on Shipment{id trackingNumber isExternalTracking trackingUrl proofOfDelivery{photoUrl photoPreviewUrl showPreview}}fragment OrderGroupActionsFragment on OrderGroupActions{reorder edit track changeSlot checkin editDeliveryInstructions editPickupPerson editTip tip cancel enableTip{...orderActionFragment}enableEdit{...orderActionFragment}rescheduleTireInstall{...orderActionFragment}cancelTireInstall{...orderActionFragment}help viewCancellationDetails{...cancellationDetailsActionFragment}}fragment cancellationDetailsActionFragment on CancellationDetailsAction{label heading text{...textFragment}}fragment ODPGroupCategoryFragment on OrderCategory{type name subtext returnMessage substitutionsBanner{...textFragment}showExtendedSubstitutions actions{substitutions{message label type}nilPickReshop{message action{text url}}returnDetails viewCancellationDetails{...cancellationDetailsActionFragment}trackOnInHomeApp}banner{...textFragment}accordionState items{...orderLineItem}substitutions{...orderLineItem fulfilledItems{...orderLineItem}}returnInfo{...returnInfoFragment}}fragment ODPGroupFragment on OrderGroup{id fulfillmentType deliveryMessage deliveryAddress{fullName firstName lastName address{...addressFragment}}deliveryInstructions{text type typeText}deliveryPreferences{text{...textFragment}cta{...orderActionFragment}}editSubstitutionsCutOff status{statusType showStatusTracker message{...textFragment}notice helpCenterText{...textFragment}}itemCount isCategorized categories{...ODPGroupCategoryFragment}seller{id name isPro}shipment{id trackingNumber}actions{reorder edit track changeSlot checkin editDeliveryInstructions editPickupPerson tip cancel help enableTip{...orderActionFragment}enableEdit{...orderActionFragment}viewCancellationDetails{...cancellationDetailsActionFragment}enableInHome{...orderActionFragment}createGiftReceipt}cutOffTimestamp isEditSubstitutionsEligible isInHome giftDetails{recipientAddress{fullName}recipientEmail senderName giftMessage}donationDetails{...orderDonationDetails}}fragment returnInfoFragment on ReturnInfo{returnOrderId type refundPriceDetails{__typename...refundPriceDetailsFragment}refundMessage tierRefundMessage paymentMethods{__typename description cardType paymentType displayValues message{...textFragment}}actions{__typename generate scheduleOrModifyPickup{text url}reschedulePickup editPickupContact}shippingLabelUrl qrCodeImageUrl carriers{__typename id name}pickupCarrier pickupContact{nameAndAddress{fullName firstName lastName address{addressString city state postalCode addressLineOne addressLineTwo country}}phone}pickupConfirmationNumber bannerMessage{...textFragment}}fragment refundPriceDetailsFragment on RefundPriceDetails{subTotal{__typename...orderPriceDetailRowFragment}fees{__typename...orderPriceDetailRowFragment}discounts{__typename...orderPriceDetailRowFragment}taxTotal{__typename...orderPriceDetailRowFragment}grandTotal{__typename...orderPriceDetailRowFragment}}fragment orderPriceDetailRowFragment on OrderPriceDetailRow{label displayValue value info{__typename title message}}fragment addressFragment on OrderAddress{addressString addressLineOne addressLineTwo state postalCode city}fragment ODPPickupInfo on OrderGroup{pickupInstructions pickupPerson{...person}alternatePickupPerson{...person}store{id name address{...addressFragment}}}fragment person on OrderPickupPerson{firstName lastName email}fragment ODPTippingInfo on OrderGroup{addTipMessage{...textFragment}driver{...DriverFragment}tipping{min{...price}max{...price}suggested{...price}preselected}subtotal{...price}}fragment orderActionFragment on Action{text url}fragment orderCustomer on OrderCustomer{id firstName lastName email isGuest isEmailRegistered}fragment OrderFieldsFragment on Order{__typename id version type customer{...orderCustomer}displayId idBarcodeImageUrl(barWidth:3 barHeight:100) isFuelPurchase title shortTitle timezone tippableGroup{...OrderGroupFragment}amendableGroup{id changeSlotIterationsLeft cutOffTimestamp fulfillmentType deliveryAddress{fullName firstName lastName address{addressString addressLineOne addressLineTwo state postalCode city country}}isAmendInProgress}substitutionsBanner{heading subheading longSubheading}groups_2101{__typename...OrderGroupFragment...ODPGroupFragment...ODPPickupInfo...ODPTippingInfo}multiboxBundles{...orderLineItem}itemCancelReasons{__typename...cancelReason}groupCancelReasons{__typename...cancelReason}priceDetails{__typename subTotal{__typename...priceDetailFragment}taxTotal{__typename...priceDetailFragment}grandTotal{__typename...priceDetailFragment}authorizationAmount{__typename...priceDetailFragment}fees{__typename...priceDetailFragment}discounts{__typename...priceDetailFragment}minimumThreshold{__typename...price}belowMinimumFee{__typename...priceDetailFragment}driverTip{__typename...priceDetailFragment}donations{__typename...priceDetailFragment}}paymentMethods{__typename description cardType paymentType displayValues message{...textFragment}actions{connectToCapitalOne{...orderActionFragment}visitAffirm{...orderActionFragment}}}actions{__typename return pendingReturn cancel startReturn{...orderActionFragment}reorder}banners{...textFragment}}","variables":{"orderId":"2792223570706","emailAddress":"mtiba75fernandez@yahoo.com"}}' \
  --compressed`
 
for (( i=0; i<=4; i++ ))
do
  if [[ $curl26 =~ "error"  || $curl26 =~ "blocked" ]]; then
    echo "Lỗi email số 26"
    indexOrder26=`echo error`
    break
  elif [[ `echo $curl26 | jq '.data.guestOrder.groups_2101['${i[@]}'].items[0].product.usItemId'` == '"713811084"' ]]; then
    indexOrder26=`echo $i`
    indexItem26=`echo 0`
  elif [[ `echo $curl26 | jq '.data.guestOrder.groups_2101['${i[@]}'].items[1].product.usItemId'` == '"713811084"' ]]; then
    indexOrder26=`echo $i`
    indexItem26=`echo 1`
  elif [[ `echo $curl26 | jq '.data.guestOrder.groups_2101['${i[@]}'].items[2].product.usItemId'` == '"713811084"' ]]; then
    indexOrder26=`echo $i`
    indexItem26=`echo 2`
  elif [[ `echo $curl26 | jq '.data.guestOrder.groups_2101['${i[@]}'].items[3].product.usItemId'` == '"713811084"' ]]; then
    indexOrder26=`echo $i`
    indexItem26=`echo 3`
  fi
done

if [[ $indexOrder26 != "error" ]]; then
echo $curl26 | jq '.data.guestOrder.id' >> track-OrderID.txt
echo $curl26 | jq '.data.guestOrder.customer.email' >> track-email.txt
echo $curl26 | jq '.data.guestOrder.groups_2101['$indexOrder26'].items['$indexItem26'].product.usItemId' >> track-usItemId.txt
echo $curl26 | jq '.data.guestOrder.groups_2101['$indexOrder26'].items['$indexItem26'].priceInfo.linePrice.value' >> track-priceValue.txt
echo $curl26 | jq '.data.guestOrder.groups_2101['$indexOrder26'].deliveryAddress.fullName' >> track-fullName.txt
echo $curl26 | jq '.data.guestOrder.groups_2101['$indexOrder26'].deliveryAddress.address.addressString' >> track-address.txt
echo $curl26 | jq '.data.guestOrder.groups_2101['$indexOrder26'].status.message.parts[].text' >> track-status.txt
echo $curl26 | jq '.data.guestOrder.groups_2101['$indexOrder26'].shipment.trackingNumber' >> track-number.txt
echo $curl26 | jq '.data.guestOrder.groups_2101['$indexOrder26'].shipment.trackingUrl' >> track-url.txt
fi

curl27=`curl 'https://www.walmart.com/orchestra/home/graphql' \
  -H 'authority: www.walmart.com' \
  -H 'sec-ch-ua: " Not A;Brand";v="99", "Chromium";v="96", "Microsoft Edge";v="96"' \
  -H 'x-o-platform: rweb' \
  -H 'dnt: 1' \
  -H 'x-o-correlation-id: wrvYiSFTlAmd8j7a8DDmpuyOpCN_heAnwM3v' \
  -H 'device_profile_ref_id: _s1F3NO8Y2JjaBUKPDcY4iFDWiIl9CyqiJjf' \
  -H 'x-latency-trace: 1' \
  -H 'wm_mp: true' \
  -H 'x-o-market: us' \
  -H 'x-o-platform-version: main-253-ebbb47' \
  -H 'x-o-gql-query: query getGuestOrder' \
  -H 'wm_page_url: https://www.walmart.com/orders' \
  -H 'x-apollo-operation-name: getGuestOrder' \
  -H 'sec-ch-ua-platform: "macOS"' \
  -H 'sec-ch-ua-mobile: ?0' \
  -H 'user-agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/96.0.4664.110 Safari/537.36 Edg/96.0.1054.62' \
  -H 'x-o-segment: oaoh' \
  -H 'content-type: application/json' \
  -H 'accept: application/json' \
  -H 'x-enable-server-timing: 1' \
  -H 'x-o-ccm: server' \
  -H 'wm_qos.correlation_id: wrvYiSFTlAmd8j7a8DDmpuyOpCN_heAnwM3v' \
  -H 'origin: https://www.walmart.com' \
  -H 'sec-fetch-site: same-origin' \
  -H 'sec-fetch-mode: cors' \
  -H 'sec-fetch-dest: empty' \
  -H 'referer: https://www.walmart.com/orders' \
  -H 'accept-language: vi' \
  --data-raw $'{"query":"query getGuestOrder($orderId:ID\u0021 $emailAddress:String\u0021){guestOrder(input:{id:$orderId emailAddress:$emailAddress}){...OrderFieldsFragment}}fragment cancelReason on OrderCancelReason{__typename subReasonCode subDescription}fragment priceDetailFragment on OrderPriceDetailRow{label value displayValue info{title message}rowInfo{...orderPriceDetailRowInfo}}fragment orderPriceDetailRowInfo on OrderPriceDetailRowInfo{title message{...textFragment}}fragment price on Price{displayValue value}fragment variants on MapEntry{name value}fragment OrderAddOn on OrderAddOn{lineId uniqueLineId productInfo{name usItemId offerId}quantityString quantityLabel type fulfillmentInstructions{...textFragment}actions{manageProtectionPlan{...orderActionFragment}cancel}priceInfo{linePrice{...price}}quantity isActive}fragment orderDonationDetails on OrderDonationDetails{message{...textFragment}emailReceipt emailReceiptToken status{...textFragment}errorStatus}fragment orderLineItem on OrderLineItem{id uniqueId actions{contactSeller cancel addToCart configureCake reviewItem resendEGiftCardToken protectionPlan{...orderActionFragment}manageProtectionPlan{...orderActionFragment}}isGift digitalDeliveryMessage quantity quantityString quantityLabel isSubstitutionSelected fulfilledItems{id quantityString priceInfo{itemPrice{value}}product{usItemId name}}isReturnable returnEligibilityMessage product{name usItemId imageInfo{thumbnailUrl}canonicalUrl offerId sellerId sellerName hasSellerBadge seller{sellerId name}orderLimit orderMinLimit weightIncrement salesUnit salesUnitType isSubstitutionEligible isAlcohol}reshop{reshopMessage isShippingAvailable minPromiseDate maxPromiseDate}selectedVariants{...variants}variantAdditionalInfo{parts{text nativeAction}}priceInfo{priceDisplayCodes{showItemPrice priceDisplayCondition finalCostByWeight}itemPrice{...price}linePrice{...price}unitPrice{...price}preDiscountedLinePrice{...price}additionalLines{name value}}discounts{label labelText{...textFragment}}itemReviewed activationCodes{label code}protectionPlanMessage{...textFragment}showSeller isShippedByWalmart seller{id name isPro}digitalDeliveryPhoneNumber addOns{...OrderAddOn}multiboxBundleId}fragment DriverFragment on Driver{id firstName photoUrl}fragment OrderGroupFragment on OrderGroup{driver{...DriverFragment}deliveryDate fulfillmentType status{...OrderGroupStatusFragment}showSeller isShippedByWalmart seller{...SellerFragment}id itemCount items{...LiteLineItemFragment}pickupPerson{firstName lastName email}accessPointId shipment{...ShipmentFragment}returnEligibilityMessage actions{...OrderGroupActionsFragment}recipientEmailAddress digitalDelivery{...DigitalDeliveryFragment}tireInstallationReservation{status extraText}}fragment OrderGroupStatusFragment on OrderGroupStatus{statusType showStatusTracker statusTracker{status label isCurrent}message{...textFragment}subtext subMessage{...textFragment}notice helpCenterText{...textFragment}}fragment textFragment on Text{parts{bold url text nativeAction lineBreak}}fragment LiteLineItemFragment on OrderLineItem{id quantity product{name usItemId imageInfo{thumbnailUrl}offerId isAlcohol}priceInfo{linePrice{...price}}}fragment SellerFragment on GroupSeller{id name isPro}fragment DigitalDeliveryFragment on DigitalDelivery{title name instructions{...textFragment}}fragment ShipmentFragment on Shipment{id trackingNumber isExternalTracking trackingUrl proofOfDelivery{photoUrl photoPreviewUrl showPreview}}fragment OrderGroupActionsFragment on OrderGroupActions{reorder edit track changeSlot checkin editDeliveryInstructions editPickupPerson editTip tip cancel enableTip{...orderActionFragment}enableEdit{...orderActionFragment}rescheduleTireInstall{...orderActionFragment}cancelTireInstall{...orderActionFragment}help viewCancellationDetails{...cancellationDetailsActionFragment}}fragment cancellationDetailsActionFragment on CancellationDetailsAction{label heading text{...textFragment}}fragment ODPGroupCategoryFragment on OrderCategory{type name subtext returnMessage substitutionsBanner{...textFragment}showExtendedSubstitutions actions{substitutions{message label type}nilPickReshop{message action{text url}}returnDetails viewCancellationDetails{...cancellationDetailsActionFragment}trackOnInHomeApp}banner{...textFragment}accordionState items{...orderLineItem}substitutions{...orderLineItem fulfilledItems{...orderLineItem}}returnInfo{...returnInfoFragment}}fragment ODPGroupFragment on OrderGroup{id fulfillmentType deliveryMessage deliveryAddress{fullName firstName lastName address{...addressFragment}}deliveryInstructions{text type typeText}deliveryPreferences{text{...textFragment}cta{...orderActionFragment}}editSubstitutionsCutOff status{statusType showStatusTracker message{...textFragment}notice helpCenterText{...textFragment}}itemCount isCategorized categories{...ODPGroupCategoryFragment}seller{id name isPro}shipment{id trackingNumber}actions{reorder edit track changeSlot checkin editDeliveryInstructions editPickupPerson tip cancel help enableTip{...orderActionFragment}enableEdit{...orderActionFragment}viewCancellationDetails{...cancellationDetailsActionFragment}enableInHome{...orderActionFragment}createGiftReceipt}cutOffTimestamp isEditSubstitutionsEligible isInHome giftDetails{recipientAddress{fullName}recipientEmail senderName giftMessage}donationDetails{...orderDonationDetails}}fragment returnInfoFragment on ReturnInfo{returnOrderId type refundPriceDetails{__typename...refundPriceDetailsFragment}refundMessage tierRefundMessage paymentMethods{__typename description cardType paymentType displayValues message{...textFragment}}actions{__typename generate scheduleOrModifyPickup{text url}reschedulePickup editPickupContact}shippingLabelUrl qrCodeImageUrl carriers{__typename id name}pickupCarrier pickupContact{nameAndAddress{fullName firstName lastName address{addressString city state postalCode addressLineOne addressLineTwo country}}phone}pickupConfirmationNumber bannerMessage{...textFragment}}fragment refundPriceDetailsFragment on RefundPriceDetails{subTotal{__typename...orderPriceDetailRowFragment}fees{__typename...orderPriceDetailRowFragment}discounts{__typename...orderPriceDetailRowFragment}taxTotal{__typename...orderPriceDetailRowFragment}grandTotal{__typename...orderPriceDetailRowFragment}}fragment orderPriceDetailRowFragment on OrderPriceDetailRow{label displayValue value info{__typename title message}}fragment addressFragment on OrderAddress{addressString addressLineOne addressLineTwo state postalCode city}fragment ODPPickupInfo on OrderGroup{pickupInstructions pickupPerson{...person}alternatePickupPerson{...person}store{id name address{...addressFragment}}}fragment person on OrderPickupPerson{firstName lastName email}fragment ODPTippingInfo on OrderGroup{addTipMessage{...textFragment}driver{...DriverFragment}tipping{min{...price}max{...price}suggested{...price}preselected}subtotal{...price}}fragment orderActionFragment on Action{text url}fragment orderCustomer on OrderCustomer{id firstName lastName email isGuest isEmailRegistered}fragment OrderFieldsFragment on Order{__typename id version type customer{...orderCustomer}displayId idBarcodeImageUrl(barWidth:3 barHeight:100) isFuelPurchase title shortTitle timezone tippableGroup{...OrderGroupFragment}amendableGroup{id changeSlotIterationsLeft cutOffTimestamp fulfillmentType deliveryAddress{fullName firstName lastName address{addressString addressLineOne addressLineTwo state postalCode city country}}isAmendInProgress}substitutionsBanner{heading subheading longSubheading}groups_2101{__typename...OrderGroupFragment...ODPGroupFragment...ODPPickupInfo...ODPTippingInfo}multiboxBundles{...orderLineItem}itemCancelReasons{__typename...cancelReason}groupCancelReasons{__typename...cancelReason}priceDetails{__typename subTotal{__typename...priceDetailFragment}taxTotal{__typename...priceDetailFragment}grandTotal{__typename...priceDetailFragment}authorizationAmount{__typename...priceDetailFragment}fees{__typename...priceDetailFragment}discounts{__typename...priceDetailFragment}minimumThreshold{__typename...price}belowMinimumFee{__typename...priceDetailFragment}driverTip{__typename...priceDetailFragment}donations{__typename...priceDetailFragment}}paymentMethods{__typename description cardType paymentType displayValues message{...textFragment}actions{connectToCapitalOne{...orderActionFragment}visitAffirm{...orderActionFragment}}}actions{__typename return pendingReturn cancel startReturn{...orderActionFragment}reorder}banners{...textFragment}}","variables":{"orderId":"2802226847235","emailAddress":"sam_edwards_vhs@yahoo.com"}}' \
  --compressed`
 
for (( i=0; i<=4; i++ ))
do
  if [[ $curl27 =~ "error"  || $curl27 =~ "blocked" ]]; then
    echo "Lỗi email số 27"
    indexOrder27=`echo error`
    break
  elif [[ `echo $curl27 | jq '.data.guestOrder.groups_2101['${i[@]}'].items[0].product.usItemId'` == '"520367700"' ]]; then
    indexOrder27=`echo $i`
    indexItem27=`echo 0`
  elif [[ `echo $curl27 | jq '.data.guestOrder.groups_2101['${i[@]}'].items[1].product.usItemId'` == '"520367700"' ]]; then
    indexOrder27=`echo $i`
    indexItem27=`echo 1`
  elif [[ `echo $curl27 | jq '.data.guestOrder.groups_2101['${i[@]}'].items[2].product.usItemId'` == '"520367700"' ]]; then
    indexOrder27=`echo $i`
    indexItem27=`echo 2`
  elif [[ `echo $curl27 | jq '.data.guestOrder.groups_2101['${i[@]}'].items[3].product.usItemId'` == '"520367700"' ]]; then
    indexOrder27=`echo $i`
    indexItem27=`echo 3`
  fi
done

if [[ $indexOrder27 != "error" ]]; then
echo $curl27 | jq '.data.guestOrder.id' >> track-OrderID.txt
echo $curl27 | jq '.data.guestOrder.customer.email' >> track-email.txt
echo $curl27 | jq '.data.guestOrder.groups_2101['$indexOrder27'].items['$indexItem27'].product.usItemId' >> track-usItemId.txt
echo $curl27 | jq '.data.guestOrder.groups_2101['$indexOrder27'].items['$indexItem27'].priceInfo.linePrice.value' >> track-priceValue.txt
echo $curl27 | jq '.data.guestOrder.groups_2101['$indexOrder27'].deliveryAddress.fullName' >> track-fullName.txt
echo $curl27 | jq '.data.guestOrder.groups_2101['$indexOrder27'].deliveryAddress.address.addressString' >> track-address.txt
echo $curl27 | jq '.data.guestOrder.groups_2101['$indexOrder27'].status.message.parts[].text' >> track-status.txt
echo $curl27 | jq '.data.guestOrder.groups_2101['$indexOrder27'].shipment.trackingNumber' >> track-number.txt
echo $curl27 | jq '.data.guestOrder.groups_2101['$indexOrder27'].shipment.trackingUrl' >> track-url.txt
fi

curl28=`curl 'https://www.walmart.com/orchestra/home/graphql' \
  -H 'authority: www.walmart.com' \
  -H 'sec-ch-ua: " Not A;Brand";v="99", "Chromium";v="96", "Microsoft Edge";v="96"' \
  -H 'x-o-platform: rweb' \
  -H 'dnt: 1' \
  -H 'x-o-correlation-id: wrvYiSFTlAmd8j7a8DDmpuyOpCN_heAnwM3v' \
  -H 'device_profile_ref_id: _s1F3NO8Y2JjaBUKPDcY4iFDWiIl9CyqiJjf' \
  -H 'x-latency-trace: 1' \
  -H 'wm_mp: true' \
  -H 'x-o-market: us' \
  -H 'x-o-platform-version: main-253-ebbb47' \
  -H 'x-o-gql-query: query getGuestOrder' \
  -H 'wm_page_url: https://www.walmart.com/orders' \
  -H 'x-apollo-operation-name: getGuestOrder' \
  -H 'sec-ch-ua-platform: "macOS"' \
  -H 'sec-ch-ua-mobile: ?0' \
  -H 'user-agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/96.0.4664.110 Safari/537.36 Edg/96.0.1054.62' \
  -H 'x-o-segment: oaoh' \
  -H 'content-type: application/json' \
  -H 'accept: application/json' \
  -H 'x-enable-server-timing: 1' \
  -H 'x-o-ccm: server' \
  -H 'wm_qos.correlation_id: wrvYiSFTlAmd8j7a8DDmpuyOpCN_heAnwM3v' \
  -H 'origin: https://www.walmart.com' \
  -H 'sec-fetch-site: same-origin' \
  -H 'sec-fetch-mode: cors' \
  -H 'sec-fetch-dest: empty' \
  -H 'referer: https://www.walmart.com/orders' \
  -H 'accept-language: vi' \
  --data-raw $'{"query":"query getGuestOrder($orderId:ID\u0021 $emailAddress:String\u0021){guestOrder(input:{id:$orderId emailAddress:$emailAddress}){...OrderFieldsFragment}}fragment cancelReason on OrderCancelReason{__typename subReasonCode subDescription}fragment priceDetailFragment on OrderPriceDetailRow{label value displayValue info{title message}rowInfo{...orderPriceDetailRowInfo}}fragment orderPriceDetailRowInfo on OrderPriceDetailRowInfo{title message{...textFragment}}fragment price on Price{displayValue value}fragment variants on MapEntry{name value}fragment OrderAddOn on OrderAddOn{lineId uniqueLineId productInfo{name usItemId offerId}quantityString quantityLabel type fulfillmentInstructions{...textFragment}actions{manageProtectionPlan{...orderActionFragment}cancel}priceInfo{linePrice{...price}}quantity isActive}fragment orderDonationDetails on OrderDonationDetails{message{...textFragment}emailReceipt emailReceiptToken status{...textFragment}errorStatus}fragment orderLineItem on OrderLineItem{id uniqueId actions{contactSeller cancel addToCart configureCake reviewItem resendEGiftCardToken protectionPlan{...orderActionFragment}manageProtectionPlan{...orderActionFragment}}isGift digitalDeliveryMessage quantity quantityString quantityLabel isSubstitutionSelected fulfilledItems{id quantityString priceInfo{itemPrice{value}}product{usItemId name}}isReturnable returnEligibilityMessage product{name usItemId imageInfo{thumbnailUrl}canonicalUrl offerId sellerId sellerName hasSellerBadge seller{sellerId name}orderLimit orderMinLimit weightIncrement salesUnit salesUnitType isSubstitutionEligible isAlcohol}reshop{reshopMessage isShippingAvailable minPromiseDate maxPromiseDate}selectedVariants{...variants}variantAdditionalInfo{parts{text nativeAction}}priceInfo{priceDisplayCodes{showItemPrice priceDisplayCondition finalCostByWeight}itemPrice{...price}linePrice{...price}unitPrice{...price}preDiscountedLinePrice{...price}additionalLines{name value}}discounts{label labelText{...textFragment}}itemReviewed activationCodes{label code}protectionPlanMessage{...textFragment}showSeller isShippedByWalmart seller{id name isPro}digitalDeliveryPhoneNumber addOns{...OrderAddOn}multiboxBundleId}fragment DriverFragment on Driver{id firstName photoUrl}fragment OrderGroupFragment on OrderGroup{driver{...DriverFragment}deliveryDate fulfillmentType status{...OrderGroupStatusFragment}showSeller isShippedByWalmart seller{...SellerFragment}id itemCount items{...LiteLineItemFragment}pickupPerson{firstName lastName email}accessPointId shipment{...ShipmentFragment}returnEligibilityMessage actions{...OrderGroupActionsFragment}recipientEmailAddress digitalDelivery{...DigitalDeliveryFragment}tireInstallationReservation{status extraText}}fragment OrderGroupStatusFragment on OrderGroupStatus{statusType showStatusTracker statusTracker{status label isCurrent}message{...textFragment}subtext subMessage{...textFragment}notice helpCenterText{...textFragment}}fragment textFragment on Text{parts{bold url text nativeAction lineBreak}}fragment LiteLineItemFragment on OrderLineItem{id quantity product{name usItemId imageInfo{thumbnailUrl}offerId isAlcohol}priceInfo{linePrice{...price}}}fragment SellerFragment on GroupSeller{id name isPro}fragment DigitalDeliveryFragment on DigitalDelivery{title name instructions{...textFragment}}fragment ShipmentFragment on Shipment{id trackingNumber isExternalTracking trackingUrl proofOfDelivery{photoUrl photoPreviewUrl showPreview}}fragment OrderGroupActionsFragment on OrderGroupActions{reorder edit track changeSlot checkin editDeliveryInstructions editPickupPerson editTip tip cancel enableTip{...orderActionFragment}enableEdit{...orderActionFragment}rescheduleTireInstall{...orderActionFragment}cancelTireInstall{...orderActionFragment}help viewCancellationDetails{...cancellationDetailsActionFragment}}fragment cancellationDetailsActionFragment on CancellationDetailsAction{label heading text{...textFragment}}fragment ODPGroupCategoryFragment on OrderCategory{type name subtext returnMessage substitutionsBanner{...textFragment}showExtendedSubstitutions actions{substitutions{message label type}nilPickReshop{message action{text url}}returnDetails viewCancellationDetails{...cancellationDetailsActionFragment}trackOnInHomeApp}banner{...textFragment}accordionState items{...orderLineItem}substitutions{...orderLineItem fulfilledItems{...orderLineItem}}returnInfo{...returnInfoFragment}}fragment ODPGroupFragment on OrderGroup{id fulfillmentType deliveryMessage deliveryAddress{fullName firstName lastName address{...addressFragment}}deliveryInstructions{text type typeText}deliveryPreferences{text{...textFragment}cta{...orderActionFragment}}editSubstitutionsCutOff status{statusType showStatusTracker message{...textFragment}notice helpCenterText{...textFragment}}itemCount isCategorized categories{...ODPGroupCategoryFragment}seller{id name isPro}shipment{id trackingNumber}actions{reorder edit track changeSlot checkin editDeliveryInstructions editPickupPerson tip cancel help enableTip{...orderActionFragment}enableEdit{...orderActionFragment}viewCancellationDetails{...cancellationDetailsActionFragment}enableInHome{...orderActionFragment}createGiftReceipt}cutOffTimestamp isEditSubstitutionsEligible isInHome giftDetails{recipientAddress{fullName}recipientEmail senderName giftMessage}donationDetails{...orderDonationDetails}}fragment returnInfoFragment on ReturnInfo{returnOrderId type refundPriceDetails{__typename...refundPriceDetailsFragment}refundMessage tierRefundMessage paymentMethods{__typename description cardType paymentType displayValues message{...textFragment}}actions{__typename generate scheduleOrModifyPickup{text url}reschedulePickup editPickupContact}shippingLabelUrl qrCodeImageUrl carriers{__typename id name}pickupCarrier pickupContact{nameAndAddress{fullName firstName lastName address{addressString city state postalCode addressLineOne addressLineTwo country}}phone}pickupConfirmationNumber bannerMessage{...textFragment}}fragment refundPriceDetailsFragment on RefundPriceDetails{subTotal{__typename...orderPriceDetailRowFragment}fees{__typename...orderPriceDetailRowFragment}discounts{__typename...orderPriceDetailRowFragment}taxTotal{__typename...orderPriceDetailRowFragment}grandTotal{__typename...orderPriceDetailRowFragment}}fragment orderPriceDetailRowFragment on OrderPriceDetailRow{label displayValue value info{__typename title message}}fragment addressFragment on OrderAddress{addressString addressLineOne addressLineTwo state postalCode city}fragment ODPPickupInfo on OrderGroup{pickupInstructions pickupPerson{...person}alternatePickupPerson{...person}store{id name address{...addressFragment}}}fragment person on OrderPickupPerson{firstName lastName email}fragment ODPTippingInfo on OrderGroup{addTipMessage{...textFragment}driver{...DriverFragment}tipping{min{...price}max{...price}suggested{...price}preselected}subtotal{...price}}fragment orderActionFragment on Action{text url}fragment orderCustomer on OrderCustomer{id firstName lastName email isGuest isEmailRegistered}fragment OrderFieldsFragment on Order{__typename id version type customer{...orderCustomer}displayId idBarcodeImageUrl(barWidth:3 barHeight:100) isFuelPurchase title shortTitle timezone tippableGroup{...OrderGroupFragment}amendableGroup{id changeSlotIterationsLeft cutOffTimestamp fulfillmentType deliveryAddress{fullName firstName lastName address{addressString addressLineOne addressLineTwo state postalCode city country}}isAmendInProgress}substitutionsBanner{heading subheading longSubheading}groups_2101{__typename...OrderGroupFragment...ODPGroupFragment...ODPPickupInfo...ODPTippingInfo}multiboxBundles{...orderLineItem}itemCancelReasons{__typename...cancelReason}groupCancelReasons{__typename...cancelReason}priceDetails{__typename subTotal{__typename...priceDetailFragment}taxTotal{__typename...priceDetailFragment}grandTotal{__typename...priceDetailFragment}authorizationAmount{__typename...priceDetailFragment}fees{__typename...priceDetailFragment}discounts{__typename...priceDetailFragment}minimumThreshold{__typename...price}belowMinimumFee{__typename...priceDetailFragment}driverTip{__typename...priceDetailFragment}donations{__typename...priceDetailFragment}}paymentMethods{__typename description cardType paymentType displayValues message{...textFragment}actions{connectToCapitalOne{...orderActionFragment}visitAffirm{...orderActionFragment}}}actions{__typename return pendingReturn cancel startReturn{...orderActionFragment}reorder}banners{...textFragment}}","variables":{"orderId":"2792223476411","emailAddress":"hilarynshriver@gmail.com"}}' \
  --compressed`
 
for (( i=0; i<=4; i++ ))
do
  if [[ $curl28 =~ "error"  || $curl28 =~ "blocked" ]]; then
    echo "Lỗi email số 28"
    indexOrder28=`echo error`
    break
  elif [[ `echo $curl28 | jq '.data.guestOrder.groups_2101['${i[@]}'].items[0].product.usItemId'` == '"171122882"' ]]; then
    indexOrder28=`echo $i`
    indexItem28=`echo 0`
  elif [[ `echo $curl28 | jq '.data.guestOrder.groups_2101['${i[@]}'].items[1].product.usItemId'` == '"171122882"' ]]; then
    indexOrder28=`echo $i`
    indexItem28=`echo 1`
  elif [[ `echo $curl28 | jq '.data.guestOrder.groups_2101['${i[@]}'].items[2].product.usItemId'` == '"171122882"' ]]; then
    indexOrder28=`echo $i`
    indexItem28=`echo 2`
  elif [[ `echo $curl28 | jq '.data.guestOrder.groups_2101['${i[@]}'].items[3].product.usItemId'` == '"171122882"' ]]; then
    indexOrder28=`echo $i`
    indexItem28=`echo 3`
  fi
done

if [[ $indexOrder28 != "error" ]]; then
echo $curl28 | jq '.data.guestOrder.id' >> track-OrderID.txt
echo $curl28 | jq '.data.guestOrder.customer.email' >> track-email.txt
echo $curl28 | jq '.data.guestOrder.groups_2101['$indexOrder28'].items['$indexItem28'].product.usItemId' >> track-usItemId.txt
echo $curl28 | jq '.data.guestOrder.groups_2101['$indexOrder28'].items['$indexItem28'].priceInfo.linePrice.value' >> track-priceValue.txt
echo $curl28 | jq '.data.guestOrder.groups_2101['$indexOrder28'].deliveryAddress.fullName' >> track-fullName.txt
echo $curl28 | jq '.data.guestOrder.groups_2101['$indexOrder28'].deliveryAddress.address.addressString' >> track-address.txt
echo $curl28 | jq '.data.guestOrder.groups_2101['$indexOrder28'].status.message.parts[].text' >> track-status.txt
echo $curl28 | jq '.data.guestOrder.groups_2101['$indexOrder28'].shipment.trackingNumber' >> track-number.txt
echo $curl28 | jq '.data.guestOrder.groups_2101['$indexOrder28'].shipment.trackingUrl' >> track-url.txt
fi

curl29=`curl 'https://www.walmart.com/orchestra/home/graphql' \
  -H 'authority: www.walmart.com' \
  -H 'sec-ch-ua: " Not A;Brand";v="99", "Chromium";v="96", "Microsoft Edge";v="96"' \
  -H 'x-o-platform: rweb' \
  -H 'dnt: 1' \
  -H 'x-o-correlation-id: wrvYiSFTlAmd8j7a8DDmpuyOpCN_heAnwM3v' \
  -H 'device_profile_ref_id: _s1F3NO8Y2JjaBUKPDcY4iFDWiIl9CyqiJjf' \
  -H 'x-latency-trace: 1' \
  -H 'wm_mp: true' \
  -H 'x-o-market: us' \
  -H 'x-o-platform-version: main-253-ebbb47' \
  -H 'x-o-gql-query: query getGuestOrder' \
  -H 'wm_page_url: https://www.walmart.com/orders' \
  -H 'x-apollo-operation-name: getGuestOrder' \
  -H 'sec-ch-ua-platform: "macOS"' \
  -H 'sec-ch-ua-mobile: ?0' \
  -H 'user-agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/96.0.4664.110 Safari/537.36 Edg/96.0.1054.62' \
  -H 'x-o-segment: oaoh' \
  -H 'content-type: application/json' \
  -H 'accept: application/json' \
  -H 'x-enable-server-timing: 1' \
  -H 'x-o-ccm: server' \
  -H 'wm_qos.correlation_id: wrvYiSFTlAmd8j7a8DDmpuyOpCN_heAnwM3v' \
  -H 'origin: https://www.walmart.com' \
  -H 'sec-fetch-site: same-origin' \
  -H 'sec-fetch-mode: cors' \
  -H 'sec-fetch-dest: empty' \
  -H 'referer: https://www.walmart.com/orders' \
  -H 'accept-language: vi' \
  --data-raw $'{"query":"query getGuestOrder($orderId:ID\u0021 $emailAddress:String\u0021){guestOrder(input:{id:$orderId emailAddress:$emailAddress}){...OrderFieldsFragment}}fragment cancelReason on OrderCancelReason{__typename subReasonCode subDescription}fragment priceDetailFragment on OrderPriceDetailRow{label value displayValue info{title message}rowInfo{...orderPriceDetailRowInfo}}fragment orderPriceDetailRowInfo on OrderPriceDetailRowInfo{title message{...textFragment}}fragment price on Price{displayValue value}fragment variants on MapEntry{name value}fragment OrderAddOn on OrderAddOn{lineId uniqueLineId productInfo{name usItemId offerId}quantityString quantityLabel type fulfillmentInstructions{...textFragment}actions{manageProtectionPlan{...orderActionFragment}cancel}priceInfo{linePrice{...price}}quantity isActive}fragment orderDonationDetails on OrderDonationDetails{message{...textFragment}emailReceipt emailReceiptToken status{...textFragment}errorStatus}fragment orderLineItem on OrderLineItem{id uniqueId actions{contactSeller cancel addToCart configureCake reviewItem resendEGiftCardToken protectionPlan{...orderActionFragment}manageProtectionPlan{...orderActionFragment}}isGift digitalDeliveryMessage quantity quantityString quantityLabel isSubstitutionSelected fulfilledItems{id quantityString priceInfo{itemPrice{value}}product{usItemId name}}isReturnable returnEligibilityMessage product{name usItemId imageInfo{thumbnailUrl}canonicalUrl offerId sellerId sellerName hasSellerBadge seller{sellerId name}orderLimit orderMinLimit weightIncrement salesUnit salesUnitType isSubstitutionEligible isAlcohol}reshop{reshopMessage isShippingAvailable minPromiseDate maxPromiseDate}selectedVariants{...variants}variantAdditionalInfo{parts{text nativeAction}}priceInfo{priceDisplayCodes{showItemPrice priceDisplayCondition finalCostByWeight}itemPrice{...price}linePrice{...price}unitPrice{...price}preDiscountedLinePrice{...price}additionalLines{name value}}discounts{label labelText{...textFragment}}itemReviewed activationCodes{label code}protectionPlanMessage{...textFragment}showSeller isShippedByWalmart seller{id name isPro}digitalDeliveryPhoneNumber addOns{...OrderAddOn}multiboxBundleId}fragment DriverFragment on Driver{id firstName photoUrl}fragment OrderGroupFragment on OrderGroup{driver{...DriverFragment}deliveryDate fulfillmentType status{...OrderGroupStatusFragment}showSeller isShippedByWalmart seller{...SellerFragment}id itemCount items{...LiteLineItemFragment}pickupPerson{firstName lastName email}accessPointId shipment{...ShipmentFragment}returnEligibilityMessage actions{...OrderGroupActionsFragment}recipientEmailAddress digitalDelivery{...DigitalDeliveryFragment}tireInstallationReservation{status extraText}}fragment OrderGroupStatusFragment on OrderGroupStatus{statusType showStatusTracker statusTracker{status label isCurrent}message{...textFragment}subtext subMessage{...textFragment}notice helpCenterText{...textFragment}}fragment textFragment on Text{parts{bold url text nativeAction lineBreak}}fragment LiteLineItemFragment on OrderLineItem{id quantity product{name usItemId imageInfo{thumbnailUrl}offerId isAlcohol}priceInfo{linePrice{...price}}}fragment SellerFragment on GroupSeller{id name isPro}fragment DigitalDeliveryFragment on DigitalDelivery{title name instructions{...textFragment}}fragment ShipmentFragment on Shipment{id trackingNumber isExternalTracking trackingUrl proofOfDelivery{photoUrl photoPreviewUrl showPreview}}fragment OrderGroupActionsFragment on OrderGroupActions{reorder edit track changeSlot checkin editDeliveryInstructions editPickupPerson editTip tip cancel enableTip{...orderActionFragment}enableEdit{...orderActionFragment}rescheduleTireInstall{...orderActionFragment}cancelTireInstall{...orderActionFragment}help viewCancellationDetails{...cancellationDetailsActionFragment}}fragment cancellationDetailsActionFragment on CancellationDetailsAction{label heading text{...textFragment}}fragment ODPGroupCategoryFragment on OrderCategory{type name subtext returnMessage substitutionsBanner{...textFragment}showExtendedSubstitutions actions{substitutions{message label type}nilPickReshop{message action{text url}}returnDetails viewCancellationDetails{...cancellationDetailsActionFragment}trackOnInHomeApp}banner{...textFragment}accordionState items{...orderLineItem}substitutions{...orderLineItem fulfilledItems{...orderLineItem}}returnInfo{...returnInfoFragment}}fragment ODPGroupFragment on OrderGroup{id fulfillmentType deliveryMessage deliveryAddress{fullName firstName lastName address{...addressFragment}}deliveryInstructions{text type typeText}deliveryPreferences{text{...textFragment}cta{...orderActionFragment}}editSubstitutionsCutOff status{statusType showStatusTracker message{...textFragment}notice helpCenterText{...textFragment}}itemCount isCategorized categories{...ODPGroupCategoryFragment}seller{id name isPro}shipment{id trackingNumber}actions{reorder edit track changeSlot checkin editDeliveryInstructions editPickupPerson tip cancel help enableTip{...orderActionFragment}enableEdit{...orderActionFragment}viewCancellationDetails{...cancellationDetailsActionFragment}enableInHome{...orderActionFragment}createGiftReceipt}cutOffTimestamp isEditSubstitutionsEligible isInHome giftDetails{recipientAddress{fullName}recipientEmail senderName giftMessage}donationDetails{...orderDonationDetails}}fragment returnInfoFragment on ReturnInfo{returnOrderId type refundPriceDetails{__typename...refundPriceDetailsFragment}refundMessage tierRefundMessage paymentMethods{__typename description cardType paymentType displayValues message{...textFragment}}actions{__typename generate scheduleOrModifyPickup{text url}reschedulePickup editPickupContact}shippingLabelUrl qrCodeImageUrl carriers{__typename id name}pickupCarrier pickupContact{nameAndAddress{fullName firstName lastName address{addressString city state postalCode addressLineOne addressLineTwo country}}phone}pickupConfirmationNumber bannerMessage{...textFragment}}fragment refundPriceDetailsFragment on RefundPriceDetails{subTotal{__typename...orderPriceDetailRowFragment}fees{__typename...orderPriceDetailRowFragment}discounts{__typename...orderPriceDetailRowFragment}taxTotal{__typename...orderPriceDetailRowFragment}grandTotal{__typename...orderPriceDetailRowFragment}}fragment orderPriceDetailRowFragment on OrderPriceDetailRow{label displayValue value info{__typename title message}}fragment addressFragment on OrderAddress{addressString addressLineOne addressLineTwo state postalCode city}fragment ODPPickupInfo on OrderGroup{pickupInstructions pickupPerson{...person}alternatePickupPerson{...person}store{id name address{...addressFragment}}}fragment person on OrderPickupPerson{firstName lastName email}fragment ODPTippingInfo on OrderGroup{addTipMessage{...textFragment}driver{...DriverFragment}tipping{min{...price}max{...price}suggested{...price}preselected}subtotal{...price}}fragment orderActionFragment on Action{text url}fragment orderCustomer on OrderCustomer{id firstName lastName email isGuest isEmailRegistered}fragment OrderFieldsFragment on Order{__typename id version type customer{...orderCustomer}displayId idBarcodeImageUrl(barWidth:3 barHeight:100) isFuelPurchase title shortTitle timezone tippableGroup{...OrderGroupFragment}amendableGroup{id changeSlotIterationsLeft cutOffTimestamp fulfillmentType deliveryAddress{fullName firstName lastName address{addressString addressLineOne addressLineTwo state postalCode city country}}isAmendInProgress}substitutionsBanner{heading subheading longSubheading}groups_2101{__typename...OrderGroupFragment...ODPGroupFragment...ODPPickupInfo...ODPTippingInfo}multiboxBundles{...orderLineItem}itemCancelReasons{__typename...cancelReason}groupCancelReasons{__typename...cancelReason}priceDetails{__typename subTotal{__typename...priceDetailFragment}taxTotal{__typename...priceDetailFragment}grandTotal{__typename...priceDetailFragment}authorizationAmount{__typename...priceDetailFragment}fees{__typename...priceDetailFragment}discounts{__typename...priceDetailFragment}minimumThreshold{__typename...price}belowMinimumFee{__typename...priceDetailFragment}driverTip{__typename...priceDetailFragment}donations{__typename...priceDetailFragment}}paymentMethods{__typename description cardType paymentType displayValues message{...textFragment}actions{connectToCapitalOne{...orderActionFragment}visitAffirm{...orderActionFragment}}}actions{__typename return pendingReturn cancel startReturn{...orderActionFragment}reorder}banners{...textFragment}}","variables":{"orderId":"2852237113296","emailAddress":"eecpenny@gmail.com"}}' \
  --compressed`
 
for (( i=0; i<=4; i++ ))
do
  if [[ $curl29 =~ "error"  || $curl29 =~ "blocked" ]]; then
    echo "Lỗi email số 29"
    indexOrder29=`echo error`
    break
  elif [[ `echo $curl29 | jq '.data.guestOrder.groups_2101['${i[@]}'].items[0].product.usItemId'` == '"251382558"' ]]; then
    indexOrder29=`echo $i`
    indexItem29=`echo 0`
  elif [[ `echo $curl29 | jq '.data.guestOrder.groups_2101['${i[@]}'].items[1].product.usItemId'` == '"251382558"' ]]; then
    indexOrder29=`echo $i`
    indexItem29=`echo 1`
  elif [[ `echo $curl29 | jq '.data.guestOrder.groups_2101['${i[@]}'].items[2].product.usItemId'` == '"251382558"' ]]; then
    indexOrder29=`echo $i`
    indexItem29=`echo 2`
  elif [[ `echo $curl29 | jq '.data.guestOrder.groups_2101['${i[@]}'].items[3].product.usItemId'` == '"251382558"' ]]; then
    indexOrder29=`echo $i`
    indexItem29=`echo 3`
  fi
done

if [[ $indexOrder29 != "error" ]]; then
echo $curl29 | jq '.data.guestOrder.id' >> track-OrderID.txt
echo $curl29 | jq '.data.guestOrder.customer.email' >> track-email.txt
echo $curl29 | jq '.data.guestOrder.groups_2101['$indexOrder29'].items['$indexItem29'].product.usItemId' >> track-usItemId.txt
echo $curl29 | jq '.data.guestOrder.groups_2101['$indexOrder29'].items['$indexItem29'].priceInfo.linePrice.value' >> track-priceValue.txt
echo $curl29 | jq '.data.guestOrder.groups_2101['$indexOrder29'].deliveryAddress.fullName' >> track-fullName.txt
echo $curl29 | jq '.data.guestOrder.groups_2101['$indexOrder29'].deliveryAddress.address.addressString' >> track-address.txt
echo $curl29 | jq '.data.guestOrder.groups_2101['$indexOrder29'].status.message.parts[].text' >> track-status.txt
echo $curl29 | jq '.data.guestOrder.groups_2101['$indexOrder29'].shipment.trackingNumber' >> track-number.txt
echo $curl29 | jq '.data.guestOrder.groups_2101['$indexOrder29'].shipment.trackingUrl' >> track-url.txt
fi

curl30=`curl 'https://www.walmart.com/orchestra/home/graphql' \
  -H 'authority: www.walmart.com' \
  -H 'sec-ch-ua: " Not A;Brand";v="99", "Chromium";v="96", "Microsoft Edge";v="96"' \
  -H 'x-o-platform: rweb' \
  -H 'dnt: 1' \
  -H 'x-o-correlation-id: wrvYiSFTlAmd8j7a8DDmpuyOpCN_heAnwM3v' \
  -H 'device_profile_ref_id: _s1F3NO8Y2JjaBUKPDcY4iFDWiIl9CyqiJjf' \
  -H 'x-latency-trace: 1' \
  -H 'wm_mp: true' \
  -H 'x-o-market: us' \
  -H 'x-o-platform-version: main-253-ebbb47' \
  -H 'x-o-gql-query: query getGuestOrder' \
  -H 'wm_page_url: https://www.walmart.com/orders' \
  -H 'x-apollo-operation-name: getGuestOrder' \
  -H 'sec-ch-ua-platform: "macOS"' \
  -H 'sec-ch-ua-mobile: ?0' \
  -H 'user-agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/96.0.4664.110 Safari/537.36 Edg/96.0.1054.62' \
  -H 'x-o-segment: oaoh' \
  -H 'content-type: application/json' \
  -H 'accept: application/json' \
  -H 'x-enable-server-timing: 1' \
  -H 'x-o-ccm: server' \
  -H 'wm_qos.correlation_id: wrvYiSFTlAmd8j7a8DDmpuyOpCN_heAnwM3v' \
  -H 'origin: https://www.walmart.com' \
  -H 'sec-fetch-site: same-origin' \
  -H 'sec-fetch-mode: cors' \
  -H 'sec-fetch-dest: empty' \
  -H 'referer: https://www.walmart.com/orders' \
  -H 'accept-language: vi' \
  --data-raw $'{"query":"query getGuestOrder($orderId:ID\u0021 $emailAddress:String\u0021){guestOrder(input:{id:$orderId emailAddress:$emailAddress}){...OrderFieldsFragment}}fragment cancelReason on OrderCancelReason{__typename subReasonCode subDescription}fragment priceDetailFragment on OrderPriceDetailRow{label value displayValue info{title message}rowInfo{...orderPriceDetailRowInfo}}fragment orderPriceDetailRowInfo on OrderPriceDetailRowInfo{title message{...textFragment}}fragment price on Price{displayValue value}fragment variants on MapEntry{name value}fragment OrderAddOn on OrderAddOn{lineId uniqueLineId productInfo{name usItemId offerId}quantityString quantityLabel type fulfillmentInstructions{...textFragment}actions{manageProtectionPlan{...orderActionFragment}cancel}priceInfo{linePrice{...price}}quantity isActive}fragment orderDonationDetails on OrderDonationDetails{message{...textFragment}emailReceipt emailReceiptToken status{...textFragment}errorStatus}fragment orderLineItem on OrderLineItem{id uniqueId actions{contactSeller cancel addToCart configureCake reviewItem resendEGiftCardToken protectionPlan{...orderActionFragment}manageProtectionPlan{...orderActionFragment}}isGift digitalDeliveryMessage quantity quantityString quantityLabel isSubstitutionSelected fulfilledItems{id quantityString priceInfo{itemPrice{value}}product{usItemId name}}isReturnable returnEligibilityMessage product{name usItemId imageInfo{thumbnailUrl}canonicalUrl offerId sellerId sellerName hasSellerBadge seller{sellerId name}orderLimit orderMinLimit weightIncrement salesUnit salesUnitType isSubstitutionEligible isAlcohol}reshop{reshopMessage isShippingAvailable minPromiseDate maxPromiseDate}selectedVariants{...variants}variantAdditionalInfo{parts{text nativeAction}}priceInfo{priceDisplayCodes{showItemPrice priceDisplayCondition finalCostByWeight}itemPrice{...price}linePrice{...price}unitPrice{...price}preDiscountedLinePrice{...price}additionalLines{name value}}discounts{label labelText{...textFragment}}itemReviewed activationCodes{label code}protectionPlanMessage{...textFragment}showSeller isShippedByWalmart seller{id name isPro}digitalDeliveryPhoneNumber addOns{...OrderAddOn}multiboxBundleId}fragment DriverFragment on Driver{id firstName photoUrl}fragment OrderGroupFragment on OrderGroup{driver{...DriverFragment}deliveryDate fulfillmentType status{...OrderGroupStatusFragment}showSeller isShippedByWalmart seller{...SellerFragment}id itemCount items{...LiteLineItemFragment}pickupPerson{firstName lastName email}accessPointId shipment{...ShipmentFragment}returnEligibilityMessage actions{...OrderGroupActionsFragment}recipientEmailAddress digitalDelivery{...DigitalDeliveryFragment}tireInstallationReservation{status extraText}}fragment OrderGroupStatusFragment on OrderGroupStatus{statusType showStatusTracker statusTracker{status label isCurrent}message{...textFragment}subtext subMessage{...textFragment}notice helpCenterText{...textFragment}}fragment textFragment on Text{parts{bold url text nativeAction lineBreak}}fragment LiteLineItemFragment on OrderLineItem{id quantity product{name usItemId imageInfo{thumbnailUrl}offerId isAlcohol}priceInfo{linePrice{...price}}}fragment SellerFragment on GroupSeller{id name isPro}fragment DigitalDeliveryFragment on DigitalDelivery{title name instructions{...textFragment}}fragment ShipmentFragment on Shipment{id trackingNumber isExternalTracking trackingUrl proofOfDelivery{photoUrl photoPreviewUrl showPreview}}fragment OrderGroupActionsFragment on OrderGroupActions{reorder edit track changeSlot checkin editDeliveryInstructions editPickupPerson editTip tip cancel enableTip{...orderActionFragment}enableEdit{...orderActionFragment}rescheduleTireInstall{...orderActionFragment}cancelTireInstall{...orderActionFragment}help viewCancellationDetails{...cancellationDetailsActionFragment}}fragment cancellationDetailsActionFragment on CancellationDetailsAction{label heading text{...textFragment}}fragment ODPGroupCategoryFragment on OrderCategory{type name subtext returnMessage substitutionsBanner{...textFragment}showExtendedSubstitutions actions{substitutions{message label type}nilPickReshop{message action{text url}}returnDetails viewCancellationDetails{...cancellationDetailsActionFragment}trackOnInHomeApp}banner{...textFragment}accordionState items{...orderLineItem}substitutions{...orderLineItem fulfilledItems{...orderLineItem}}returnInfo{...returnInfoFragment}}fragment ODPGroupFragment on OrderGroup{id fulfillmentType deliveryMessage deliveryAddress{fullName firstName lastName address{...addressFragment}}deliveryInstructions{text type typeText}deliveryPreferences{text{...textFragment}cta{...orderActionFragment}}editSubstitutionsCutOff status{statusType showStatusTracker message{...textFragment}notice helpCenterText{...textFragment}}itemCount isCategorized categories{...ODPGroupCategoryFragment}seller{id name isPro}shipment{id trackingNumber}actions{reorder edit track changeSlot checkin editDeliveryInstructions editPickupPerson tip cancel help enableTip{...orderActionFragment}enableEdit{...orderActionFragment}viewCancellationDetails{...cancellationDetailsActionFragment}enableInHome{...orderActionFragment}createGiftReceipt}cutOffTimestamp isEditSubstitutionsEligible isInHome giftDetails{recipientAddress{fullName}recipientEmail senderName giftMessage}donationDetails{...orderDonationDetails}}fragment returnInfoFragment on ReturnInfo{returnOrderId type refundPriceDetails{__typename...refundPriceDetailsFragment}refundMessage tierRefundMessage paymentMethods{__typename description cardType paymentType displayValues message{...textFragment}}actions{__typename generate scheduleOrModifyPickup{text url}reschedulePickup editPickupContact}shippingLabelUrl qrCodeImageUrl carriers{__typename id name}pickupCarrier pickupContact{nameAndAddress{fullName firstName lastName address{addressString city state postalCode addressLineOne addressLineTwo country}}phone}pickupConfirmationNumber bannerMessage{...textFragment}}fragment refundPriceDetailsFragment on RefundPriceDetails{subTotal{__typename...orderPriceDetailRowFragment}fees{__typename...orderPriceDetailRowFragment}discounts{__typename...orderPriceDetailRowFragment}taxTotal{__typename...orderPriceDetailRowFragment}grandTotal{__typename...orderPriceDetailRowFragment}}fragment orderPriceDetailRowFragment on OrderPriceDetailRow{label displayValue value info{__typename title message}}fragment addressFragment on OrderAddress{addressString addressLineOne addressLineTwo state postalCode city}fragment ODPPickupInfo on OrderGroup{pickupInstructions pickupPerson{...person}alternatePickupPerson{...person}store{id name address{...addressFragment}}}fragment person on OrderPickupPerson{firstName lastName email}fragment ODPTippingInfo on OrderGroup{addTipMessage{...textFragment}driver{...DriverFragment}tipping{min{...price}max{...price}suggested{...price}preselected}subtotal{...price}}fragment orderActionFragment on Action{text url}fragment orderCustomer on OrderCustomer{id firstName lastName email isGuest isEmailRegistered}fragment OrderFieldsFragment on Order{__typename id version type customer{...orderCustomer}displayId idBarcodeImageUrl(barWidth:3 barHeight:100) isFuelPurchase title shortTitle timezone tippableGroup{...OrderGroupFragment}amendableGroup{id changeSlotIterationsLeft cutOffTimestamp fulfillmentType deliveryAddress{fullName firstName lastName address{addressString addressLineOne addressLineTwo state postalCode city country}}isAmendInProgress}substitutionsBanner{heading subheading longSubheading}groups_2101{__typename...OrderGroupFragment...ODPGroupFragment...ODPPickupInfo...ODPTippingInfo}multiboxBundles{...orderLineItem}itemCancelReasons{__typename...cancelReason}groupCancelReasons{__typename...cancelReason}priceDetails{__typename subTotal{__typename...priceDetailFragment}taxTotal{__typename...priceDetailFragment}grandTotal{__typename...priceDetailFragment}authorizationAmount{__typename...priceDetailFragment}fees{__typename...priceDetailFragment}discounts{__typename...priceDetailFragment}minimumThreshold{__typename...price}belowMinimumFee{__typename...priceDetailFragment}driverTip{__typename...priceDetailFragment}donations{__typename...priceDetailFragment}}paymentMethods{__typename description cardType paymentType displayValues message{...textFragment}actions{connectToCapitalOne{...orderActionFragment}visitAffirm{...orderActionFragment}}}actions{__typename return pendingReturn cancel startReturn{...orderActionFragment}reorder}banners{...textFragment}}","variables":{"orderId":"2832234498620","emailAddress":"maureenblair86@yahoo.com"}}' \
  --compressed`
 
for (( i=0; i<=4; i++ ))
do
  if [[ $curl30 =~ "error"  || $curl30 =~ "blocked" ]]; then
    echo "Lỗi email số 30"
    indexOrder30=`echo error`
    break
  elif [[ `echo $curl30 | jq '.data.guestOrder.groups_2101['${i[@]}'].items[0].product.usItemId'` == '"240828726"' ]]; then
    indexOrder30=`echo $i`
    indexItem30=`echo 0`
  elif [[ `echo $curl30 | jq '.data.guestOrder.groups_2101['${i[@]}'].items[1].product.usItemId'` == '"240828726"' ]]; then
    indexOrder30=`echo $i`
    indexItem30=`echo 1`
  elif [[ `echo $curl30 | jq '.data.guestOrder.groups_2101['${i[@]}'].items[2].product.usItemId'` == '"240828726"' ]]; then
    indexOrder30=`echo $i`
    indexItem30=`echo 2`
  elif [[ `echo $curl30 | jq '.data.guestOrder.groups_2101['${i[@]}'].items[3].product.usItemId'` == '"240828726"' ]]; then
    indexOrder30=`echo $i`
    indexItem30=`echo 3`
  fi
done

if [[ $indexOrder30 != "error" ]]; then
echo $curl30 | jq '.data.guestOrder.id' >> track-OrderID.txt
echo $curl30 | jq '.data.guestOrder.customer.email' >> track-email.txt
echo $curl30 | jq '.data.guestOrder.groups_2101['$indexOrder30'].items['$indexItem30'].product.usItemId' >> track-usItemId.txt
echo $curl30 | jq '.data.guestOrder.groups_2101['$indexOrder30'].items['$indexItem30'].priceInfo.linePrice.value' >> track-priceValue.txt
echo $curl30 | jq '.data.guestOrder.groups_2101['$indexOrder30'].deliveryAddress.fullName' >> track-fullName.txt
echo $curl30 | jq '.data.guestOrder.groups_2101['$indexOrder30'].deliveryAddress.address.addressString' >> track-address.txt
echo $curl30 | jq '.data.guestOrder.groups_2101['$indexOrder30'].status.message.parts[].text' >> track-status.txt
echo $curl30 | jq '.data.guestOrder.groups_2101['$indexOrder30'].shipment.trackingNumber' >> track-number.txt
echo $curl30 | jq '.data.guestOrder.groups_2101['$indexOrder30'].shipment.trackingUrl' >> track-url.txt
fi

curl31=`curl 'https://www.walmart.com/orchestra/home/graphql' \
  -H 'authority: www.walmart.com' \
  -H 'sec-ch-ua: " Not A;Brand";v="99", "Chromium";v="96", "Microsoft Edge";v="96"' \
  -H 'x-o-platform: rweb' \
  -H 'dnt: 1' \
  -H 'x-o-correlation-id: wrvYiSFTlAmd8j7a8DDmpuyOpCN_heAnwM3v' \
  -H 'device_profile_ref_id: _s1F3NO8Y2JjaBUKPDcY4iFDWiIl9CyqiJjf' \
  -H 'x-latency-trace: 1' \
  -H 'wm_mp: true' \
  -H 'x-o-market: us' \
  -H 'x-o-platform-version: main-253-ebbb47' \
  -H 'x-o-gql-query: query getGuestOrder' \
  -H 'wm_page_url: https://www.walmart.com/orders' \
  -H 'x-apollo-operation-name: getGuestOrder' \
  -H 'sec-ch-ua-platform: "macOS"' \
  -H 'sec-ch-ua-mobile: ?0' \
  -H 'user-agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/96.0.4664.110 Safari/537.36 Edg/96.0.1054.62' \
  -H 'x-o-segment: oaoh' \
  -H 'content-type: application/json' \
  -H 'accept: application/json' \
  -H 'x-enable-server-timing: 1' \
  -H 'x-o-ccm: server' \
  -H 'wm_qos.correlation_id: wrvYiSFTlAmd8j7a8DDmpuyOpCN_heAnwM3v' \
  -H 'origin: https://www.walmart.com' \
  -H 'sec-fetch-site: same-origin' \
  -H 'sec-fetch-mode: cors' \
  -H 'sec-fetch-dest: empty' \
  -H 'referer: https://www.walmart.com/orders' \
  -H 'accept-language: vi' \
  --data-raw $'{"query":"query getGuestOrder($orderId:ID\u0021 $emailAddress:String\u0021){guestOrder(input:{id:$orderId emailAddress:$emailAddress}){...OrderFieldsFragment}}fragment cancelReason on OrderCancelReason{__typename subReasonCode subDescription}fragment priceDetailFragment on OrderPriceDetailRow{label value displayValue info{title message}rowInfo{...orderPriceDetailRowInfo}}fragment orderPriceDetailRowInfo on OrderPriceDetailRowInfo{title message{...textFragment}}fragment price on Price{displayValue value}fragment variants on MapEntry{name value}fragment OrderAddOn on OrderAddOn{lineId uniqueLineId productInfo{name usItemId offerId}quantityString quantityLabel type fulfillmentInstructions{...textFragment}actions{manageProtectionPlan{...orderActionFragment}cancel}priceInfo{linePrice{...price}}quantity isActive}fragment orderDonationDetails on OrderDonationDetails{message{...textFragment}emailReceipt emailReceiptToken status{...textFragment}errorStatus}fragment orderLineItem on OrderLineItem{id uniqueId actions{contactSeller cancel addToCart configureCake reviewItem resendEGiftCardToken protectionPlan{...orderActionFragment}manageProtectionPlan{...orderActionFragment}}isGift digitalDeliveryMessage quantity quantityString quantityLabel isSubstitutionSelected fulfilledItems{id quantityString priceInfo{itemPrice{value}}product{usItemId name}}isReturnable returnEligibilityMessage product{name usItemId imageInfo{thumbnailUrl}canonicalUrl offerId sellerId sellerName hasSellerBadge seller{sellerId name}orderLimit orderMinLimit weightIncrement salesUnit salesUnitType isSubstitutionEligible isAlcohol}reshop{reshopMessage isShippingAvailable minPromiseDate maxPromiseDate}selectedVariants{...variants}variantAdditionalInfo{parts{text nativeAction}}priceInfo{priceDisplayCodes{showItemPrice priceDisplayCondition finalCostByWeight}itemPrice{...price}linePrice{...price}unitPrice{...price}preDiscountedLinePrice{...price}additionalLines{name value}}discounts{label labelText{...textFragment}}itemReviewed activationCodes{label code}protectionPlanMessage{...textFragment}showSeller isShippedByWalmart seller{id name isPro}digitalDeliveryPhoneNumber addOns{...OrderAddOn}multiboxBundleId}fragment DriverFragment on Driver{id firstName photoUrl}fragment OrderGroupFragment on OrderGroup{driver{...DriverFragment}deliveryDate fulfillmentType status{...OrderGroupStatusFragment}showSeller isShippedByWalmart seller{...SellerFragment}id itemCount items{...LiteLineItemFragment}pickupPerson{firstName lastName email}accessPointId shipment{...ShipmentFragment}returnEligibilityMessage actions{...OrderGroupActionsFragment}recipientEmailAddress digitalDelivery{...DigitalDeliveryFragment}tireInstallationReservation{status extraText}}fragment OrderGroupStatusFragment on OrderGroupStatus{statusType showStatusTracker statusTracker{status label isCurrent}message{...textFragment}subtext subMessage{...textFragment}notice helpCenterText{...textFragment}}fragment textFragment on Text{parts{bold url text nativeAction lineBreak}}fragment LiteLineItemFragment on OrderLineItem{id quantity product{name usItemId imageInfo{thumbnailUrl}offerId isAlcohol}priceInfo{linePrice{...price}}}fragment SellerFragment on GroupSeller{id name isPro}fragment DigitalDeliveryFragment on DigitalDelivery{title name instructions{...textFragment}}fragment ShipmentFragment on Shipment{id trackingNumber isExternalTracking trackingUrl proofOfDelivery{photoUrl photoPreviewUrl showPreview}}fragment OrderGroupActionsFragment on OrderGroupActions{reorder edit track changeSlot checkin editDeliveryInstructions editPickupPerson editTip tip cancel enableTip{...orderActionFragment}enableEdit{...orderActionFragment}rescheduleTireInstall{...orderActionFragment}cancelTireInstall{...orderActionFragment}help viewCancellationDetails{...cancellationDetailsActionFragment}}fragment cancellationDetailsActionFragment on CancellationDetailsAction{label heading text{...textFragment}}fragment ODPGroupCategoryFragment on OrderCategory{type name subtext returnMessage substitutionsBanner{...textFragment}showExtendedSubstitutions actions{substitutions{message label type}nilPickReshop{message action{text url}}returnDetails viewCancellationDetails{...cancellationDetailsActionFragment}trackOnInHomeApp}banner{...textFragment}accordionState items{...orderLineItem}substitutions{...orderLineItem fulfilledItems{...orderLineItem}}returnInfo{...returnInfoFragment}}fragment ODPGroupFragment on OrderGroup{id fulfillmentType deliveryMessage deliveryAddress{fullName firstName lastName address{...addressFragment}}deliveryInstructions{text type typeText}deliveryPreferences{text{...textFragment}cta{...orderActionFragment}}editSubstitutionsCutOff status{statusType showStatusTracker message{...textFragment}notice helpCenterText{...textFragment}}itemCount isCategorized categories{...ODPGroupCategoryFragment}seller{id name isPro}shipment{id trackingNumber}actions{reorder edit track changeSlot checkin editDeliveryInstructions editPickupPerson tip cancel help enableTip{...orderActionFragment}enableEdit{...orderActionFragment}viewCancellationDetails{...cancellationDetailsActionFragment}enableInHome{...orderActionFragment}createGiftReceipt}cutOffTimestamp isEditSubstitutionsEligible isInHome giftDetails{recipientAddress{fullName}recipientEmail senderName giftMessage}donationDetails{...orderDonationDetails}}fragment returnInfoFragment on ReturnInfo{returnOrderId type refundPriceDetails{__typename...refundPriceDetailsFragment}refundMessage tierRefundMessage paymentMethods{__typename description cardType paymentType displayValues message{...textFragment}}actions{__typename generate scheduleOrModifyPickup{text url}reschedulePickup editPickupContact}shippingLabelUrl qrCodeImageUrl carriers{__typename id name}pickupCarrier pickupContact{nameAndAddress{fullName firstName lastName address{addressString city state postalCode addressLineOne addressLineTwo country}}phone}pickupConfirmationNumber bannerMessage{...textFragment}}fragment refundPriceDetailsFragment on RefundPriceDetails{subTotal{__typename...orderPriceDetailRowFragment}fees{__typename...orderPriceDetailRowFragment}discounts{__typename...orderPriceDetailRowFragment}taxTotal{__typename...orderPriceDetailRowFragment}grandTotal{__typename...orderPriceDetailRowFragment}}fragment orderPriceDetailRowFragment on OrderPriceDetailRow{label displayValue value info{__typename title message}}fragment addressFragment on OrderAddress{addressString addressLineOne addressLineTwo state postalCode city}fragment ODPPickupInfo on OrderGroup{pickupInstructions pickupPerson{...person}alternatePickupPerson{...person}store{id name address{...addressFragment}}}fragment person on OrderPickupPerson{firstName lastName email}fragment ODPTippingInfo on OrderGroup{addTipMessage{...textFragment}driver{...DriverFragment}tipping{min{...price}max{...price}suggested{...price}preselected}subtotal{...price}}fragment orderActionFragment on Action{text url}fragment orderCustomer on OrderCustomer{id firstName lastName email isGuest isEmailRegistered}fragment OrderFieldsFragment on Order{__typename id version type customer{...orderCustomer}displayId idBarcodeImageUrl(barWidth:3 barHeight:100) isFuelPurchase title shortTitle timezone tippableGroup{...OrderGroupFragment}amendableGroup{id changeSlotIterationsLeft cutOffTimestamp fulfillmentType deliveryAddress{fullName firstName lastName address{addressString addressLineOne addressLineTwo state postalCode city country}}isAmendInProgress}substitutionsBanner{heading subheading longSubheading}groups_2101{__typename...OrderGroupFragment...ODPGroupFragment...ODPPickupInfo...ODPTippingInfo}multiboxBundles{...orderLineItem}itemCancelReasons{__typename...cancelReason}groupCancelReasons{__typename...cancelReason}priceDetails{__typename subTotal{__typename...priceDetailFragment}taxTotal{__typename...priceDetailFragment}grandTotal{__typename...priceDetailFragment}authorizationAmount{__typename...priceDetailFragment}fees{__typename...priceDetailFragment}discounts{__typename...priceDetailFragment}minimumThreshold{__typename...price}belowMinimumFee{__typename...priceDetailFragment}driverTip{__typename...priceDetailFragment}donations{__typename...priceDetailFragment}}paymentMethods{__typename description cardType paymentType displayValues message{...textFragment}actions{connectToCapitalOne{...orderActionFragment}visitAffirm{...orderActionFragment}}}actions{__typename return pendingReturn cancel startReturn{...orderActionFragment}reorder}banners{...textFragment}}","variables":{"orderId":"2842234558932","emailAddress":"jayson.heap@gmail.com"}}' \
  --compressed`
 
for (( i=0; i<=4; i++ ))
do
  if [[ $curl31 =~ "error"  || $curl31 =~ "blocked" ]]; then
    echo "Lỗi email số 31"
    indexOrder31=`echo error`
    break
  elif [[ `echo $curl31 | jq '.data.guestOrder.groups_2101['${i[@]}'].items[0].product.usItemId'` == '"488588268"' ]]; then
    indexOrder31=`echo $i`
    indexItem31=`echo 0`
  elif [[ `echo $curl31 | jq '.data.guestOrder.groups_2101['${i[@]}'].items[1].product.usItemId'` == '"488588268"' ]]; then
    indexOrder31=`echo $i`
    indexItem31=`echo 1`
  elif [[ `echo $curl31 | jq '.data.guestOrder.groups_2101['${i[@]}'].items[2].product.usItemId'` == '"488588268"' ]]; then
    indexOrder31=`echo $i`
    indexItem31=`echo 2`
  elif [[ `echo $curl31 | jq '.data.guestOrder.groups_2101['${i[@]}'].items[3].product.usItemId'` == '"488588268"' ]]; then
    indexOrder31=`echo $i`
    indexItem31=`echo 3`
  fi
done

if [[ $indexOrder31 != "error" ]]; then
echo $curl31 | jq '.data.guestOrder.id' >> track-OrderID.txt
echo $curl31 | jq '.data.guestOrder.customer.email' >> track-email.txt
echo $curl31 | jq '.data.guestOrder.groups_2101['$indexOrder31'].items['$indexItem31'].product.usItemId' >> track-usItemId.txt
echo $curl31 | jq '.data.guestOrder.groups_2101['$indexOrder31'].items['$indexItem31'].priceInfo.linePrice.value' >> track-priceValue.txt
echo $curl31 | jq '.data.guestOrder.groups_2101['$indexOrder31'].deliveryAddress.fullName' >> track-fullName.txt
echo $curl31 | jq '.data.guestOrder.groups_2101['$indexOrder31'].deliveryAddress.address.addressString' >> track-address.txt
echo $curl31 | jq '.data.guestOrder.groups_2101['$indexOrder31'].status.message.parts[].text' >> track-status.txt
echo $curl31 | jq '.data.guestOrder.groups_2101['$indexOrder31'].shipment.trackingNumber' >> track-number.txt
echo $curl31 | jq '.data.guestOrder.groups_2101['$indexOrder31'].shipment.trackingUrl' >> track-url.txt
fi

curl32=`curl 'https://www.walmart.com/orchestra/home/graphql' \
  -H 'authority: www.walmart.com' \
  -H 'sec-ch-ua: " Not A;Brand";v="99", "Chromium";v="96", "Microsoft Edge";v="96"' \
  -H 'x-o-platform: rweb' \
  -H 'dnt: 1' \
  -H 'x-o-correlation-id: wrvYiSFTlAmd8j7a8DDmpuyOpCN_heAnwM3v' \
  -H 'device_profile_ref_id: _s1F3NO8Y2JjaBUKPDcY4iFDWiIl9CyqiJjf' \
  -H 'x-latency-trace: 1' \
  -H 'wm_mp: true' \
  -H 'x-o-market: us' \
  -H 'x-o-platform-version: main-253-ebbb47' \
  -H 'x-o-gql-query: query getGuestOrder' \
  -H 'wm_page_url: https://www.walmart.com/orders' \
  -H 'x-apollo-operation-name: getGuestOrder' \
  -H 'sec-ch-ua-platform: "macOS"' \
  -H 'sec-ch-ua-mobile: ?0' \
  -H 'user-agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/96.0.4664.110 Safari/537.36 Edg/96.0.1054.62' \
  -H 'x-o-segment: oaoh' \
  -H 'content-type: application/json' \
  -H 'accept: application/json' \
  -H 'x-enable-server-timing: 1' \
  -H 'x-o-ccm: server' \
  -H 'wm_qos.correlation_id: wrvYiSFTlAmd8j7a8DDmpuyOpCN_heAnwM3v' \
  -H 'origin: https://www.walmart.com' \
  -H 'sec-fetch-site: same-origin' \
  -H 'sec-fetch-mode: cors' \
  -H 'sec-fetch-dest: empty' \
  -H 'referer: https://www.walmart.com/orders' \
  -H 'accept-language: vi' \
  --data-raw $'{"query":"query getGuestOrder($orderId:ID\u0021 $emailAddress:String\u0021){guestOrder(input:{id:$orderId emailAddress:$emailAddress}){...OrderFieldsFragment}}fragment cancelReason on OrderCancelReason{__typename subReasonCode subDescription}fragment priceDetailFragment on OrderPriceDetailRow{label value displayValue info{title message}rowInfo{...orderPriceDetailRowInfo}}fragment orderPriceDetailRowInfo on OrderPriceDetailRowInfo{title message{...textFragment}}fragment price on Price{displayValue value}fragment variants on MapEntry{name value}fragment OrderAddOn on OrderAddOn{lineId uniqueLineId productInfo{name usItemId offerId}quantityString quantityLabel type fulfillmentInstructions{...textFragment}actions{manageProtectionPlan{...orderActionFragment}cancel}priceInfo{linePrice{...price}}quantity isActive}fragment orderDonationDetails on OrderDonationDetails{message{...textFragment}emailReceipt emailReceiptToken status{...textFragment}errorStatus}fragment orderLineItem on OrderLineItem{id uniqueId actions{contactSeller cancel addToCart configureCake reviewItem resendEGiftCardToken protectionPlan{...orderActionFragment}manageProtectionPlan{...orderActionFragment}}isGift digitalDeliveryMessage quantity quantityString quantityLabel isSubstitutionSelected fulfilledItems{id quantityString priceInfo{itemPrice{value}}product{usItemId name}}isReturnable returnEligibilityMessage product{name usItemId imageInfo{thumbnailUrl}canonicalUrl offerId sellerId sellerName hasSellerBadge seller{sellerId name}orderLimit orderMinLimit weightIncrement salesUnit salesUnitType isSubstitutionEligible isAlcohol}reshop{reshopMessage isShippingAvailable minPromiseDate maxPromiseDate}selectedVariants{...variants}variantAdditionalInfo{parts{text nativeAction}}priceInfo{priceDisplayCodes{showItemPrice priceDisplayCondition finalCostByWeight}itemPrice{...price}linePrice{...price}unitPrice{...price}preDiscountedLinePrice{...price}additionalLines{name value}}discounts{label labelText{...textFragment}}itemReviewed activationCodes{label code}protectionPlanMessage{...textFragment}showSeller isShippedByWalmart seller{id name isPro}digitalDeliveryPhoneNumber addOns{...OrderAddOn}multiboxBundleId}fragment DriverFragment on Driver{id firstName photoUrl}fragment OrderGroupFragment on OrderGroup{driver{...DriverFragment}deliveryDate fulfillmentType status{...OrderGroupStatusFragment}showSeller isShippedByWalmart seller{...SellerFragment}id itemCount items{...LiteLineItemFragment}pickupPerson{firstName lastName email}accessPointId shipment{...ShipmentFragment}returnEligibilityMessage actions{...OrderGroupActionsFragment}recipientEmailAddress digitalDelivery{...DigitalDeliveryFragment}tireInstallationReservation{status extraText}}fragment OrderGroupStatusFragment on OrderGroupStatus{statusType showStatusTracker statusTracker{status label isCurrent}message{...textFragment}subtext subMessage{...textFragment}notice helpCenterText{...textFragment}}fragment textFragment on Text{parts{bold url text nativeAction lineBreak}}fragment LiteLineItemFragment on OrderLineItem{id quantity product{name usItemId imageInfo{thumbnailUrl}offerId isAlcohol}priceInfo{linePrice{...price}}}fragment SellerFragment on GroupSeller{id name isPro}fragment DigitalDeliveryFragment on DigitalDelivery{title name instructions{...textFragment}}fragment ShipmentFragment on Shipment{id trackingNumber isExternalTracking trackingUrl proofOfDelivery{photoUrl photoPreviewUrl showPreview}}fragment OrderGroupActionsFragment on OrderGroupActions{reorder edit track changeSlot checkin editDeliveryInstructions editPickupPerson editTip tip cancel enableTip{...orderActionFragment}enableEdit{...orderActionFragment}rescheduleTireInstall{...orderActionFragment}cancelTireInstall{...orderActionFragment}help viewCancellationDetails{...cancellationDetailsActionFragment}}fragment cancellationDetailsActionFragment on CancellationDetailsAction{label heading text{...textFragment}}fragment ODPGroupCategoryFragment on OrderCategory{type name subtext returnMessage substitutionsBanner{...textFragment}showExtendedSubstitutions actions{substitutions{message label type}nilPickReshop{message action{text url}}returnDetails viewCancellationDetails{...cancellationDetailsActionFragment}trackOnInHomeApp}banner{...textFragment}accordionState items{...orderLineItem}substitutions{...orderLineItem fulfilledItems{...orderLineItem}}returnInfo{...returnInfoFragment}}fragment ODPGroupFragment on OrderGroup{id fulfillmentType deliveryMessage deliveryAddress{fullName firstName lastName address{...addressFragment}}deliveryInstructions{text type typeText}deliveryPreferences{text{...textFragment}cta{...orderActionFragment}}editSubstitutionsCutOff status{statusType showStatusTracker message{...textFragment}notice helpCenterText{...textFragment}}itemCount isCategorized categories{...ODPGroupCategoryFragment}seller{id name isPro}shipment{id trackingNumber}actions{reorder edit track changeSlot checkin editDeliveryInstructions editPickupPerson tip cancel help enableTip{...orderActionFragment}enableEdit{...orderActionFragment}viewCancellationDetails{...cancellationDetailsActionFragment}enableInHome{...orderActionFragment}createGiftReceipt}cutOffTimestamp isEditSubstitutionsEligible isInHome giftDetails{recipientAddress{fullName}recipientEmail senderName giftMessage}donationDetails{...orderDonationDetails}}fragment returnInfoFragment on ReturnInfo{returnOrderId type refundPriceDetails{__typename...refundPriceDetailsFragment}refundMessage tierRefundMessage paymentMethods{__typename description cardType paymentType displayValues message{...textFragment}}actions{__typename generate scheduleOrModifyPickup{text url}reschedulePickup editPickupContact}shippingLabelUrl qrCodeImageUrl carriers{__typename id name}pickupCarrier pickupContact{nameAndAddress{fullName firstName lastName address{addressString city state postalCode addressLineOne addressLineTwo country}}phone}pickupConfirmationNumber bannerMessage{...textFragment}}fragment refundPriceDetailsFragment on RefundPriceDetails{subTotal{__typename...orderPriceDetailRowFragment}fees{__typename...orderPriceDetailRowFragment}discounts{__typename...orderPriceDetailRowFragment}taxTotal{__typename...orderPriceDetailRowFragment}grandTotal{__typename...orderPriceDetailRowFragment}}fragment orderPriceDetailRowFragment on OrderPriceDetailRow{label displayValue value info{__typename title message}}fragment addressFragment on OrderAddress{addressString addressLineOne addressLineTwo state postalCode city}fragment ODPPickupInfo on OrderGroup{pickupInstructions pickupPerson{...person}alternatePickupPerson{...person}store{id name address{...addressFragment}}}fragment person on OrderPickupPerson{firstName lastName email}fragment ODPTippingInfo on OrderGroup{addTipMessage{...textFragment}driver{...DriverFragment}tipping{min{...price}max{...price}suggested{...price}preselected}subtotal{...price}}fragment orderActionFragment on Action{text url}fragment orderCustomer on OrderCustomer{id firstName lastName email isGuest isEmailRegistered}fragment OrderFieldsFragment on Order{__typename id version type customer{...orderCustomer}displayId idBarcodeImageUrl(barWidth:3 barHeight:100) isFuelPurchase title shortTitle timezone tippableGroup{...OrderGroupFragment}amendableGroup{id changeSlotIterationsLeft cutOffTimestamp fulfillmentType deliveryAddress{fullName firstName lastName address{addressString addressLineOne addressLineTwo state postalCode city country}}isAmendInProgress}substitutionsBanner{heading subheading longSubheading}groups_2101{__typename...OrderGroupFragment...ODPGroupFragment...ODPPickupInfo...ODPTippingInfo}multiboxBundles{...orderLineItem}itemCancelReasons{__typename...cancelReason}groupCancelReasons{__typename...cancelReason}priceDetails{__typename subTotal{__typename...priceDetailFragment}taxTotal{__typename...priceDetailFragment}grandTotal{__typename...priceDetailFragment}authorizationAmount{__typename...priceDetailFragment}fees{__typename...priceDetailFragment}discounts{__typename...priceDetailFragment}minimumThreshold{__typename...price}belowMinimumFee{__typename...priceDetailFragment}driverTip{__typename...priceDetailFragment}donations{__typename...priceDetailFragment}}paymentMethods{__typename description cardType paymentType displayValues message{...textFragment}actions{connectToCapitalOne{...orderActionFragment}visitAffirm{...orderActionFragment}}}actions{__typename return pendingReturn cancel startReturn{...orderActionFragment}reorder}banners{...textFragment}}","variables":{"orderId":"2792223494487","emailAddress":"hohrenberg84@gmail.com"}}' \
  --compressed`
 
for (( i=0; i<=4; i++ ))
do
  if [[ $curl32 =~ "error"  || $curl32 =~ "blocked" ]]; then
    echo "Lỗi email số 32"
    indexOrder32=`echo error`
    break
  elif [[ `echo $curl32 | jq '.data.guestOrder.groups_2101['${i[@]}'].items[0].product.usItemId'` == '"477200308"' ]]; then
    indexOrder32=`echo $i`
    indexItem32=`echo 0`
  elif [[ `echo $curl32 | jq '.data.guestOrder.groups_2101['${i[@]}'].items[1].product.usItemId'` == '"477200308"' ]]; then
    indexOrder32=`echo $i`
    indexItem32=`echo 1`
  elif [[ `echo $curl32 | jq '.data.guestOrder.groups_2101['${i[@]}'].items[2].product.usItemId'` == '"477200308"' ]]; then
    indexOrder32=`echo $i`
    indexItem32=`echo 2`
  elif [[ `echo $curl32 | jq '.data.guestOrder.groups_2101['${i[@]}'].items[3].product.usItemId'` == '"477200308"' ]]; then
    indexOrder32=`echo $i`
    indexItem32=`echo 3`
  fi
done

if [[ $indexOrder32 != "error" ]]; then
echo $curl32 | jq '.data.guestOrder.id' >> track-OrderID.txt
echo $curl32 | jq '.data.guestOrder.customer.email' >> track-email.txt
echo $curl32 | jq '.data.guestOrder.groups_2101['$indexOrder32'].items['$indexItem32'].product.usItemId' >> track-usItemId.txt
echo $curl32 | jq '.data.guestOrder.groups_2101['$indexOrder32'].items['$indexItem32'].priceInfo.linePrice.value' >> track-priceValue.txt
echo $curl32 | jq '.data.guestOrder.groups_2101['$indexOrder32'].deliveryAddress.fullName' >> track-fullName.txt
echo $curl32 | jq '.data.guestOrder.groups_2101['$indexOrder32'].deliveryAddress.address.addressString' >> track-address.txt
echo $curl32 | jq '.data.guestOrder.groups_2101['$indexOrder32'].status.message.parts[].text' >> track-status.txt
echo $curl32 | jq '.data.guestOrder.groups_2101['$indexOrder32'].shipment.trackingNumber' >> track-number.txt
echo $curl32 | jq '.data.guestOrder.groups_2101['$indexOrder32'].shipment.trackingUrl' >> track-url.txt
fi

curl33=`curl 'https://www.walmart.com/orchestra/home/graphql' \
  -H 'authority: www.walmart.com' \
  -H 'sec-ch-ua: " Not A;Brand";v="99", "Chromium";v="96", "Microsoft Edge";v="96"' \
  -H 'x-o-platform: rweb' \
  -H 'dnt: 1' \
  -H 'x-o-correlation-id: wrvYiSFTlAmd8j7a8DDmpuyOpCN_heAnwM3v' \
  -H 'device_profile_ref_id: _s1F3NO8Y2JjaBUKPDcY4iFDWiIl9CyqiJjf' \
  -H 'x-latency-trace: 1' \
  -H 'wm_mp: true' \
  -H 'x-o-market: us' \
  -H 'x-o-platform-version: main-253-ebbb47' \
  -H 'x-o-gql-query: query getGuestOrder' \
  -H 'wm_page_url: https://www.walmart.com/orders' \
  -H 'x-apollo-operation-name: getGuestOrder' \
  -H 'sec-ch-ua-platform: "macOS"' \
  -H 'sec-ch-ua-mobile: ?0' \
  -H 'user-agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/96.0.4664.110 Safari/537.36 Edg/96.0.1054.62' \
  -H 'x-o-segment: oaoh' \
  -H 'content-type: application/json' \
  -H 'accept: application/json' \
  -H 'x-enable-server-timing: 1' \
  -H 'x-o-ccm: server' \
  -H 'wm_qos.correlation_id: wrvYiSFTlAmd8j7a8DDmpuyOpCN_heAnwM3v' \
  -H 'origin: https://www.walmart.com' \
  -H 'sec-fetch-site: same-origin' \
  -H 'sec-fetch-mode: cors' \
  -H 'sec-fetch-dest: empty' \
  -H 'referer: https://www.walmart.com/orders' \
  -H 'accept-language: vi' \
  --data-raw $'{"query":"query getGuestOrder($orderId:ID\u0021 $emailAddress:String\u0021){guestOrder(input:{id:$orderId emailAddress:$emailAddress}){...OrderFieldsFragment}}fragment cancelReason on OrderCancelReason{__typename subReasonCode subDescription}fragment priceDetailFragment on OrderPriceDetailRow{label value displayValue info{title message}rowInfo{...orderPriceDetailRowInfo}}fragment orderPriceDetailRowInfo on OrderPriceDetailRowInfo{title message{...textFragment}}fragment price on Price{displayValue value}fragment variants on MapEntry{name value}fragment OrderAddOn on OrderAddOn{lineId uniqueLineId productInfo{name usItemId offerId}quantityString quantityLabel type fulfillmentInstructions{...textFragment}actions{manageProtectionPlan{...orderActionFragment}cancel}priceInfo{linePrice{...price}}quantity isActive}fragment orderDonationDetails on OrderDonationDetails{message{...textFragment}emailReceipt emailReceiptToken status{...textFragment}errorStatus}fragment orderLineItem on OrderLineItem{id uniqueId actions{contactSeller cancel addToCart configureCake reviewItem resendEGiftCardToken protectionPlan{...orderActionFragment}manageProtectionPlan{...orderActionFragment}}isGift digitalDeliveryMessage quantity quantityString quantityLabel isSubstitutionSelected fulfilledItems{id quantityString priceInfo{itemPrice{value}}product{usItemId name}}isReturnable returnEligibilityMessage product{name usItemId imageInfo{thumbnailUrl}canonicalUrl offerId sellerId sellerName hasSellerBadge seller{sellerId name}orderLimit orderMinLimit weightIncrement salesUnit salesUnitType isSubstitutionEligible isAlcohol}reshop{reshopMessage isShippingAvailable minPromiseDate maxPromiseDate}selectedVariants{...variants}variantAdditionalInfo{parts{text nativeAction}}priceInfo{priceDisplayCodes{showItemPrice priceDisplayCondition finalCostByWeight}itemPrice{...price}linePrice{...price}unitPrice{...price}preDiscountedLinePrice{...price}additionalLines{name value}}discounts{label labelText{...textFragment}}itemReviewed activationCodes{label code}protectionPlanMessage{...textFragment}showSeller isShippedByWalmart seller{id name isPro}digitalDeliveryPhoneNumber addOns{...OrderAddOn}multiboxBundleId}fragment DriverFragment on Driver{id firstName photoUrl}fragment OrderGroupFragment on OrderGroup{driver{...DriverFragment}deliveryDate fulfillmentType status{...OrderGroupStatusFragment}showSeller isShippedByWalmart seller{...SellerFragment}id itemCount items{...LiteLineItemFragment}pickupPerson{firstName lastName email}accessPointId shipment{...ShipmentFragment}returnEligibilityMessage actions{...OrderGroupActionsFragment}recipientEmailAddress digitalDelivery{...DigitalDeliveryFragment}tireInstallationReservation{status extraText}}fragment OrderGroupStatusFragment on OrderGroupStatus{statusType showStatusTracker statusTracker{status label isCurrent}message{...textFragment}subtext subMessage{...textFragment}notice helpCenterText{...textFragment}}fragment textFragment on Text{parts{bold url text nativeAction lineBreak}}fragment LiteLineItemFragment on OrderLineItem{id quantity product{name usItemId imageInfo{thumbnailUrl}offerId isAlcohol}priceInfo{linePrice{...price}}}fragment SellerFragment on GroupSeller{id name isPro}fragment DigitalDeliveryFragment on DigitalDelivery{title name instructions{...textFragment}}fragment ShipmentFragment on Shipment{id trackingNumber isExternalTracking trackingUrl proofOfDelivery{photoUrl photoPreviewUrl showPreview}}fragment OrderGroupActionsFragment on OrderGroupActions{reorder edit track changeSlot checkin editDeliveryInstructions editPickupPerson editTip tip cancel enableTip{...orderActionFragment}enableEdit{...orderActionFragment}rescheduleTireInstall{...orderActionFragment}cancelTireInstall{...orderActionFragment}help viewCancellationDetails{...cancellationDetailsActionFragment}}fragment cancellationDetailsActionFragment on CancellationDetailsAction{label heading text{...textFragment}}fragment ODPGroupCategoryFragment on OrderCategory{type name subtext returnMessage substitutionsBanner{...textFragment}showExtendedSubstitutions actions{substitutions{message label type}nilPickReshop{message action{text url}}returnDetails viewCancellationDetails{...cancellationDetailsActionFragment}trackOnInHomeApp}banner{...textFragment}accordionState items{...orderLineItem}substitutions{...orderLineItem fulfilledItems{...orderLineItem}}returnInfo{...returnInfoFragment}}fragment ODPGroupFragment on OrderGroup{id fulfillmentType deliveryMessage deliveryAddress{fullName firstName lastName address{...addressFragment}}deliveryInstructions{text type typeText}deliveryPreferences{text{...textFragment}cta{...orderActionFragment}}editSubstitutionsCutOff status{statusType showStatusTracker message{...textFragment}notice helpCenterText{...textFragment}}itemCount isCategorized categories{...ODPGroupCategoryFragment}seller{id name isPro}shipment{id trackingNumber}actions{reorder edit track changeSlot checkin editDeliveryInstructions editPickupPerson tip cancel help enableTip{...orderActionFragment}enableEdit{...orderActionFragment}viewCancellationDetails{...cancellationDetailsActionFragment}enableInHome{...orderActionFragment}createGiftReceipt}cutOffTimestamp isEditSubstitutionsEligible isInHome giftDetails{recipientAddress{fullName}recipientEmail senderName giftMessage}donationDetails{...orderDonationDetails}}fragment returnInfoFragment on ReturnInfo{returnOrderId type refundPriceDetails{__typename...refundPriceDetailsFragment}refundMessage tierRefundMessage paymentMethods{__typename description cardType paymentType displayValues message{...textFragment}}actions{__typename generate scheduleOrModifyPickup{text url}reschedulePickup editPickupContact}shippingLabelUrl qrCodeImageUrl carriers{__typename id name}pickupCarrier pickupContact{nameAndAddress{fullName firstName lastName address{addressString city state postalCode addressLineOne addressLineTwo country}}phone}pickupConfirmationNumber bannerMessage{...textFragment}}fragment refundPriceDetailsFragment on RefundPriceDetails{subTotal{__typename...orderPriceDetailRowFragment}fees{__typename...orderPriceDetailRowFragment}discounts{__typename...orderPriceDetailRowFragment}taxTotal{__typename...orderPriceDetailRowFragment}grandTotal{__typename...orderPriceDetailRowFragment}}fragment orderPriceDetailRowFragment on OrderPriceDetailRow{label displayValue value info{__typename title message}}fragment addressFragment on OrderAddress{addressString addressLineOne addressLineTwo state postalCode city}fragment ODPPickupInfo on OrderGroup{pickupInstructions pickupPerson{...person}alternatePickupPerson{...person}store{id name address{...addressFragment}}}fragment person on OrderPickupPerson{firstName lastName email}fragment ODPTippingInfo on OrderGroup{addTipMessage{...textFragment}driver{...DriverFragment}tipping{min{...price}max{...price}suggested{...price}preselected}subtotal{...price}}fragment orderActionFragment on Action{text url}fragment orderCustomer on OrderCustomer{id firstName lastName email isGuest isEmailRegistered}fragment OrderFieldsFragment on Order{__typename id version type customer{...orderCustomer}displayId idBarcodeImageUrl(barWidth:3 barHeight:100) isFuelPurchase title shortTitle timezone tippableGroup{...OrderGroupFragment}amendableGroup{id changeSlotIterationsLeft cutOffTimestamp fulfillmentType deliveryAddress{fullName firstName lastName address{addressString addressLineOne addressLineTwo state postalCode city country}}isAmendInProgress}substitutionsBanner{heading subheading longSubheading}groups_2101{__typename...OrderGroupFragment...ODPGroupFragment...ODPPickupInfo...ODPTippingInfo}multiboxBundles{...orderLineItem}itemCancelReasons{__typename...cancelReason}groupCancelReasons{__typename...cancelReason}priceDetails{__typename subTotal{__typename...priceDetailFragment}taxTotal{__typename...priceDetailFragment}grandTotal{__typename...priceDetailFragment}authorizationAmount{__typename...priceDetailFragment}fees{__typename...priceDetailFragment}discounts{__typename...priceDetailFragment}minimumThreshold{__typename...price}belowMinimumFee{__typename...priceDetailFragment}driverTip{__typename...priceDetailFragment}donations{__typename...priceDetailFragment}}paymentMethods{__typename description cardType paymentType displayValues message{...textFragment}actions{connectToCapitalOne{...orderActionFragment}visitAffirm{...orderActionFragment}}}actions{__typename return pendingReturn cancel startReturn{...orderActionFragment}reorder}banners{...textFragment}}","variables":{"orderId":"2832234151847","emailAddress":"reynazoyla09@gmail.com"}}' \
  --compressed`
 
for (( i=0; i<=4; i++ ))
do
  if [[ $curl33 =~ "error"  || $curl33 =~ "blocked" ]]; then
    echo "Lỗi email số 33"
    indexOrder33=`echo error`
    break
  elif [[ `echo $curl33 | jq '.data.guestOrder.groups_2101['${i[@]}'].items[0].product.usItemId'` == '"628834581"' ]]; then
    indexOrder33=`echo $i`
    indexItem33=`echo 0`
  elif [[ `echo $curl33 | jq '.data.guestOrder.groups_2101['${i[@]}'].items[1].product.usItemId'` == '"628834581"' ]]; then
    indexOrder33=`echo $i`
    indexItem33=`echo 1`
  elif [[ `echo $curl33 | jq '.data.guestOrder.groups_2101['${i[@]}'].items[2].product.usItemId'` == '"628834581"' ]]; then
    indexOrder33=`echo $i`
    indexItem33=`echo 2`
  elif [[ `echo $curl33 | jq '.data.guestOrder.groups_2101['${i[@]}'].items[3].product.usItemId'` == '"628834581"' ]]; then
    indexOrder33=`echo $i`
    indexItem33=`echo 3`
  fi
done

if [[ $indexOrder33 != "error" ]]; then
echo $curl33 | jq '.data.guestOrder.id' >> track-OrderID.txt
echo $curl33 | jq '.data.guestOrder.customer.email' >> track-email.txt
echo $curl33 | jq '.data.guestOrder.groups_2101['$indexOrder33'].items['$indexItem33'].product.usItemId' >> track-usItemId.txt
echo $curl33 | jq '.data.guestOrder.groups_2101['$indexOrder33'].items['$indexItem33'].priceInfo.linePrice.value' >> track-priceValue.txt
echo $curl33 | jq '.data.guestOrder.groups_2101['$indexOrder33'].deliveryAddress.fullName' >> track-fullName.txt
echo $curl33 | jq '.data.guestOrder.groups_2101['$indexOrder33'].deliveryAddress.address.addressString' >> track-address.txt
echo $curl33 | jq '.data.guestOrder.groups_2101['$indexOrder33'].status.message.parts[].text' >> track-status.txt
echo $curl33 | jq '.data.guestOrder.groups_2101['$indexOrder33'].shipment.trackingNumber' >> track-number.txt
echo $curl33 | jq '.data.guestOrder.groups_2101['$indexOrder33'].shipment.trackingUrl' >> track-url.txt
fi

curl34=`curl 'https://www.walmart.com/orchestra/home/graphql' \
  -H 'authority: www.walmart.com' \
  -H 'sec-ch-ua: " Not A;Brand";v="99", "Chromium";v="96", "Microsoft Edge";v="96"' \
  -H 'x-o-platform: rweb' \
  -H 'dnt: 1' \
  -H 'x-o-correlation-id: wrvYiSFTlAmd8j7a8DDmpuyOpCN_heAnwM3v' \
  -H 'device_profile_ref_id: _s1F3NO8Y2JjaBUKPDcY4iFDWiIl9CyqiJjf' \
  -H 'x-latency-trace: 1' \
  -H 'wm_mp: true' \
  -H 'x-o-market: us' \
  -H 'x-o-platform-version: main-253-ebbb47' \
  -H 'x-o-gql-query: query getGuestOrder' \
  -H 'wm_page_url: https://www.walmart.com/orders' \
  -H 'x-apollo-operation-name: getGuestOrder' \
  -H 'sec-ch-ua-platform: "macOS"' \
  -H 'sec-ch-ua-mobile: ?0' \
  -H 'user-agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/96.0.4664.110 Safari/537.36 Edg/96.0.1054.62' \
  -H 'x-o-segment: oaoh' \
  -H 'content-type: application/json' \
  -H 'accept: application/json' \
  -H 'x-enable-server-timing: 1' \
  -H 'x-o-ccm: server' \
  -H 'wm_qos.correlation_id: wrvYiSFTlAmd8j7a8DDmpuyOpCN_heAnwM3v' \
  -H 'origin: https://www.walmart.com' \
  -H 'sec-fetch-site: same-origin' \
  -H 'sec-fetch-mode: cors' \
  -H 'sec-fetch-dest: empty' \
  -H 'referer: https://www.walmart.com/orders' \
  -H 'accept-language: vi' \
  --data-raw $'{"query":"query getGuestOrder($orderId:ID\u0021 $emailAddress:String\u0021){guestOrder(input:{id:$orderId emailAddress:$emailAddress}){...OrderFieldsFragment}}fragment cancelReason on OrderCancelReason{__typename subReasonCode subDescription}fragment priceDetailFragment on OrderPriceDetailRow{label value displayValue info{title message}rowInfo{...orderPriceDetailRowInfo}}fragment orderPriceDetailRowInfo on OrderPriceDetailRowInfo{title message{...textFragment}}fragment price on Price{displayValue value}fragment variants on MapEntry{name value}fragment OrderAddOn on OrderAddOn{lineId uniqueLineId productInfo{name usItemId offerId}quantityString quantityLabel type fulfillmentInstructions{...textFragment}actions{manageProtectionPlan{...orderActionFragment}cancel}priceInfo{linePrice{...price}}quantity isActive}fragment orderDonationDetails on OrderDonationDetails{message{...textFragment}emailReceipt emailReceiptToken status{...textFragment}errorStatus}fragment orderLineItem on OrderLineItem{id uniqueId actions{contactSeller cancel addToCart configureCake reviewItem resendEGiftCardToken protectionPlan{...orderActionFragment}manageProtectionPlan{...orderActionFragment}}isGift digitalDeliveryMessage quantity quantityString quantityLabel isSubstitutionSelected fulfilledItems{id quantityString priceInfo{itemPrice{value}}product{usItemId name}}isReturnable returnEligibilityMessage product{name usItemId imageInfo{thumbnailUrl}canonicalUrl offerId sellerId sellerName hasSellerBadge seller{sellerId name}orderLimit orderMinLimit weightIncrement salesUnit salesUnitType isSubstitutionEligible isAlcohol}reshop{reshopMessage isShippingAvailable minPromiseDate maxPromiseDate}selectedVariants{...variants}variantAdditionalInfo{parts{text nativeAction}}priceInfo{priceDisplayCodes{showItemPrice priceDisplayCondition finalCostByWeight}itemPrice{...price}linePrice{...price}unitPrice{...price}preDiscountedLinePrice{...price}additionalLines{name value}}discounts{label labelText{...textFragment}}itemReviewed activationCodes{label code}protectionPlanMessage{...textFragment}showSeller isShippedByWalmart seller{id name isPro}digitalDeliveryPhoneNumber addOns{...OrderAddOn}multiboxBundleId}fragment DriverFragment on Driver{id firstName photoUrl}fragment OrderGroupFragment on OrderGroup{driver{...DriverFragment}deliveryDate fulfillmentType status{...OrderGroupStatusFragment}showSeller isShippedByWalmart seller{...SellerFragment}id itemCount items{...LiteLineItemFragment}pickupPerson{firstName lastName email}accessPointId shipment{...ShipmentFragment}returnEligibilityMessage actions{...OrderGroupActionsFragment}recipientEmailAddress digitalDelivery{...DigitalDeliveryFragment}tireInstallationReservation{status extraText}}fragment OrderGroupStatusFragment on OrderGroupStatus{statusType showStatusTracker statusTracker{status label isCurrent}message{...textFragment}subtext subMessage{...textFragment}notice helpCenterText{...textFragment}}fragment textFragment on Text{parts{bold url text nativeAction lineBreak}}fragment LiteLineItemFragment on OrderLineItem{id quantity product{name usItemId imageInfo{thumbnailUrl}offerId isAlcohol}priceInfo{linePrice{...price}}}fragment SellerFragment on GroupSeller{id name isPro}fragment DigitalDeliveryFragment on DigitalDelivery{title name instructions{...textFragment}}fragment ShipmentFragment on Shipment{id trackingNumber isExternalTracking trackingUrl proofOfDelivery{photoUrl photoPreviewUrl showPreview}}fragment OrderGroupActionsFragment on OrderGroupActions{reorder edit track changeSlot checkin editDeliveryInstructions editPickupPerson editTip tip cancel enableTip{...orderActionFragment}enableEdit{...orderActionFragment}rescheduleTireInstall{...orderActionFragment}cancelTireInstall{...orderActionFragment}help viewCancellationDetails{...cancellationDetailsActionFragment}}fragment cancellationDetailsActionFragment on CancellationDetailsAction{label heading text{...textFragment}}fragment ODPGroupCategoryFragment on OrderCategory{type name subtext returnMessage substitutionsBanner{...textFragment}showExtendedSubstitutions actions{substitutions{message label type}nilPickReshop{message action{text url}}returnDetails viewCancellationDetails{...cancellationDetailsActionFragment}trackOnInHomeApp}banner{...textFragment}accordionState items{...orderLineItem}substitutions{...orderLineItem fulfilledItems{...orderLineItem}}returnInfo{...returnInfoFragment}}fragment ODPGroupFragment on OrderGroup{id fulfillmentType deliveryMessage deliveryAddress{fullName firstName lastName address{...addressFragment}}deliveryInstructions{text type typeText}deliveryPreferences{text{...textFragment}cta{...orderActionFragment}}editSubstitutionsCutOff status{statusType showStatusTracker message{...textFragment}notice helpCenterText{...textFragment}}itemCount isCategorized categories{...ODPGroupCategoryFragment}seller{id name isPro}shipment{id trackingNumber}actions{reorder edit track changeSlot checkin editDeliveryInstructions editPickupPerson tip cancel help enableTip{...orderActionFragment}enableEdit{...orderActionFragment}viewCancellationDetails{...cancellationDetailsActionFragment}enableInHome{...orderActionFragment}createGiftReceipt}cutOffTimestamp isEditSubstitutionsEligible isInHome giftDetails{recipientAddress{fullName}recipientEmail senderName giftMessage}donationDetails{...orderDonationDetails}}fragment returnInfoFragment on ReturnInfo{returnOrderId type refundPriceDetails{__typename...refundPriceDetailsFragment}refundMessage tierRefundMessage paymentMethods{__typename description cardType paymentType displayValues message{...textFragment}}actions{__typename generate scheduleOrModifyPickup{text url}reschedulePickup editPickupContact}shippingLabelUrl qrCodeImageUrl carriers{__typename id name}pickupCarrier pickupContact{nameAndAddress{fullName firstName lastName address{addressString city state postalCode addressLineOne addressLineTwo country}}phone}pickupConfirmationNumber bannerMessage{...textFragment}}fragment refundPriceDetailsFragment on RefundPriceDetails{subTotal{__typename...orderPriceDetailRowFragment}fees{__typename...orderPriceDetailRowFragment}discounts{__typename...orderPriceDetailRowFragment}taxTotal{__typename...orderPriceDetailRowFragment}grandTotal{__typename...orderPriceDetailRowFragment}}fragment orderPriceDetailRowFragment on OrderPriceDetailRow{label displayValue value info{__typename title message}}fragment addressFragment on OrderAddress{addressString addressLineOne addressLineTwo state postalCode city}fragment ODPPickupInfo on OrderGroup{pickupInstructions pickupPerson{...person}alternatePickupPerson{...person}store{id name address{...addressFragment}}}fragment person on OrderPickupPerson{firstName lastName email}fragment ODPTippingInfo on OrderGroup{addTipMessage{...textFragment}driver{...DriverFragment}tipping{min{...price}max{...price}suggested{...price}preselected}subtotal{...price}}fragment orderActionFragment on Action{text url}fragment orderCustomer on OrderCustomer{id firstName lastName email isGuest isEmailRegistered}fragment OrderFieldsFragment on Order{__typename id version type customer{...orderCustomer}displayId idBarcodeImageUrl(barWidth:3 barHeight:100) isFuelPurchase title shortTitle timezone tippableGroup{...OrderGroupFragment}amendableGroup{id changeSlotIterationsLeft cutOffTimestamp fulfillmentType deliveryAddress{fullName firstName lastName address{addressString addressLineOne addressLineTwo state postalCode city country}}isAmendInProgress}substitutionsBanner{heading subheading longSubheading}groups_2101{__typename...OrderGroupFragment...ODPGroupFragment...ODPPickupInfo...ODPTippingInfo}multiboxBundles{...orderLineItem}itemCancelReasons{__typename...cancelReason}groupCancelReasons{__typename...cancelReason}priceDetails{__typename subTotal{__typename...priceDetailFragment}taxTotal{__typename...priceDetailFragment}grandTotal{__typename...priceDetailFragment}authorizationAmount{__typename...priceDetailFragment}fees{__typename...priceDetailFragment}discounts{__typename...priceDetailFragment}minimumThreshold{__typename...price}belowMinimumFee{__typename...priceDetailFragment}driverTip{__typename...priceDetailFragment}donations{__typename...priceDetailFragment}}paymentMethods{__typename description cardType paymentType displayValues message{...textFragment}actions{connectToCapitalOne{...orderActionFragment}visitAffirm{...orderActionFragment}}}actions{__typename return pendingReturn cancel startReturn{...orderActionFragment}reorder}banners{...textFragment}}","variables":{"orderId":"2822229764486","emailAddress":"jbp6771@aol.com"}}' \
  --compressed`
 
for (( i=0; i<=4; i++ ))
do
  if [[ $curl34 =~ "error"  || $curl34 =~ "blocked" ]]; then
    echo "Lỗi email số 34"
    indexOrder34=`echo error`
    break
  elif [[ `echo $curl34 | jq '.data.guestOrder.groups_2101['${i[@]}'].items[0].product.usItemId'` == '"988607514"' ]]; then
    indexOrder34=`echo $i`
    indexItem34=`echo 0`
  elif [[ `echo $curl34 | jq '.data.guestOrder.groups_2101['${i[@]}'].items[1].product.usItemId'` == '"988607514"' ]]; then
    indexOrder34=`echo $i`
    indexItem34=`echo 1`
  elif [[ `echo $curl34 | jq '.data.guestOrder.groups_2101['${i[@]}'].items[2].product.usItemId'` == '"988607514"' ]]; then
    indexOrder34=`echo $i`
    indexItem34=`echo 2`
  elif [[ `echo $curl34 | jq '.data.guestOrder.groups_2101['${i[@]}'].items[3].product.usItemId'` == '"988607514"' ]]; then
    indexOrder34=`echo $i`
    indexItem34=`echo 3`
  fi
done

if [[ $indexOrder34 != "error" ]]; then
echo $curl34 | jq '.data.guestOrder.id' >> track-OrderID.txt
echo $curl34 | jq '.data.guestOrder.customer.email' >> track-email.txt
echo $curl34 | jq '.data.guestOrder.groups_2101['$indexOrder34'].items['$indexItem34'].product.usItemId' >> track-usItemId.txt
echo $curl34 | jq '.data.guestOrder.groups_2101['$indexOrder34'].items['$indexItem34'].priceInfo.linePrice.value' >> track-priceValue.txt
echo $curl34 | jq '.data.guestOrder.groups_2101['$indexOrder34'].deliveryAddress.fullName' >> track-fullName.txt
echo $curl34 | jq '.data.guestOrder.groups_2101['$indexOrder34'].deliveryAddress.address.addressString' >> track-address.txt
echo $curl34 | jq '.data.guestOrder.groups_2101['$indexOrder34'].status.message.parts[].text' >> track-status.txt
echo $curl34 | jq '.data.guestOrder.groups_2101['$indexOrder34'].shipment.trackingNumber' >> track-number.txt
echo $curl34 | jq '.data.guestOrder.groups_2101['$indexOrder34'].shipment.trackingUrl' >> track-url.txt
fi

curl35=`curl 'https://www.walmart.com/orchestra/home/graphql' \
  -H 'authority: www.walmart.com' \
  -H 'sec-ch-ua: " Not A;Brand";v="99", "Chromium";v="96", "Microsoft Edge";v="96"' \
  -H 'x-o-platform: rweb' \
  -H 'dnt: 1' \
  -H 'x-o-correlation-id: wrvYiSFTlAmd8j7a8DDmpuyOpCN_heAnwM3v' \
  -H 'device_profile_ref_id: _s1F3NO8Y2JjaBUKPDcY4iFDWiIl9CyqiJjf' \
  -H 'x-latency-trace: 1' \
  -H 'wm_mp: true' \
  -H 'x-o-market: us' \
  -H 'x-o-platform-version: main-253-ebbb47' \
  -H 'x-o-gql-query: query getGuestOrder' \
  -H 'wm_page_url: https://www.walmart.com/orders' \
  -H 'x-apollo-operation-name: getGuestOrder' \
  -H 'sec-ch-ua-platform: "macOS"' \
  -H 'sec-ch-ua-mobile: ?0' \
  -H 'user-agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/96.0.4664.110 Safari/537.36 Edg/96.0.1054.62' \
  -H 'x-o-segment: oaoh' \
  -H 'content-type: application/json' \
  -H 'accept: application/json' \
  -H 'x-enable-server-timing: 1' \
  -H 'x-o-ccm: server' \
  -H 'wm_qos.correlation_id: wrvYiSFTlAmd8j7a8DDmpuyOpCN_heAnwM3v' \
  -H 'origin: https://www.walmart.com' \
  -H 'sec-fetch-site: same-origin' \
  -H 'sec-fetch-mode: cors' \
  -H 'sec-fetch-dest: empty' \
  -H 'referer: https://www.walmart.com/orders' \
  -H 'accept-language: vi' \
  --data-raw $'{"query":"query getGuestOrder($orderId:ID\u0021 $emailAddress:String\u0021){guestOrder(input:{id:$orderId emailAddress:$emailAddress}){...OrderFieldsFragment}}fragment cancelReason on OrderCancelReason{__typename subReasonCode subDescription}fragment priceDetailFragment on OrderPriceDetailRow{label value displayValue info{title message}rowInfo{...orderPriceDetailRowInfo}}fragment orderPriceDetailRowInfo on OrderPriceDetailRowInfo{title message{...textFragment}}fragment price on Price{displayValue value}fragment variants on MapEntry{name value}fragment OrderAddOn on OrderAddOn{lineId uniqueLineId productInfo{name usItemId offerId}quantityString quantityLabel type fulfillmentInstructions{...textFragment}actions{manageProtectionPlan{...orderActionFragment}cancel}priceInfo{linePrice{...price}}quantity isActive}fragment orderDonationDetails on OrderDonationDetails{message{...textFragment}emailReceipt emailReceiptToken status{...textFragment}errorStatus}fragment orderLineItem on OrderLineItem{id uniqueId actions{contactSeller cancel addToCart configureCake reviewItem resendEGiftCardToken protectionPlan{...orderActionFragment}manageProtectionPlan{...orderActionFragment}}isGift digitalDeliveryMessage quantity quantityString quantityLabel isSubstitutionSelected fulfilledItems{id quantityString priceInfo{itemPrice{value}}product{usItemId name}}isReturnable returnEligibilityMessage product{name usItemId imageInfo{thumbnailUrl}canonicalUrl offerId sellerId sellerName hasSellerBadge seller{sellerId name}orderLimit orderMinLimit weightIncrement salesUnit salesUnitType isSubstitutionEligible isAlcohol}reshop{reshopMessage isShippingAvailable minPromiseDate maxPromiseDate}selectedVariants{...variants}variantAdditionalInfo{parts{text nativeAction}}priceInfo{priceDisplayCodes{showItemPrice priceDisplayCondition finalCostByWeight}itemPrice{...price}linePrice{...price}unitPrice{...price}preDiscountedLinePrice{...price}additionalLines{name value}}discounts{label labelText{...textFragment}}itemReviewed activationCodes{label code}protectionPlanMessage{...textFragment}showSeller isShippedByWalmart seller{id name isPro}digitalDeliveryPhoneNumber addOns{...OrderAddOn}multiboxBundleId}fragment DriverFragment on Driver{id firstName photoUrl}fragment OrderGroupFragment on OrderGroup{driver{...DriverFragment}deliveryDate fulfillmentType status{...OrderGroupStatusFragment}showSeller isShippedByWalmart seller{...SellerFragment}id itemCount items{...LiteLineItemFragment}pickupPerson{firstName lastName email}accessPointId shipment{...ShipmentFragment}returnEligibilityMessage actions{...OrderGroupActionsFragment}recipientEmailAddress digitalDelivery{...DigitalDeliveryFragment}tireInstallationReservation{status extraText}}fragment OrderGroupStatusFragment on OrderGroupStatus{statusType showStatusTracker statusTracker{status label isCurrent}message{...textFragment}subtext subMessage{...textFragment}notice helpCenterText{...textFragment}}fragment textFragment on Text{parts{bold url text nativeAction lineBreak}}fragment LiteLineItemFragment on OrderLineItem{id quantity product{name usItemId imageInfo{thumbnailUrl}offerId isAlcohol}priceInfo{linePrice{...price}}}fragment SellerFragment on GroupSeller{id name isPro}fragment DigitalDeliveryFragment on DigitalDelivery{title name instructions{...textFragment}}fragment ShipmentFragment on Shipment{id trackingNumber isExternalTracking trackingUrl proofOfDelivery{photoUrl photoPreviewUrl showPreview}}fragment OrderGroupActionsFragment on OrderGroupActions{reorder edit track changeSlot checkin editDeliveryInstructions editPickupPerson editTip tip cancel enableTip{...orderActionFragment}enableEdit{...orderActionFragment}rescheduleTireInstall{...orderActionFragment}cancelTireInstall{...orderActionFragment}help viewCancellationDetails{...cancellationDetailsActionFragment}}fragment cancellationDetailsActionFragment on CancellationDetailsAction{label heading text{...textFragment}}fragment ODPGroupCategoryFragment on OrderCategory{type name subtext returnMessage substitutionsBanner{...textFragment}showExtendedSubstitutions actions{substitutions{message label type}nilPickReshop{message action{text url}}returnDetails viewCancellationDetails{...cancellationDetailsActionFragment}trackOnInHomeApp}banner{...textFragment}accordionState items{...orderLineItem}substitutions{...orderLineItem fulfilledItems{...orderLineItem}}returnInfo{...returnInfoFragment}}fragment ODPGroupFragment on OrderGroup{id fulfillmentType deliveryMessage deliveryAddress{fullName firstName lastName address{...addressFragment}}deliveryInstructions{text type typeText}deliveryPreferences{text{...textFragment}cta{...orderActionFragment}}editSubstitutionsCutOff status{statusType showStatusTracker message{...textFragment}notice helpCenterText{...textFragment}}itemCount isCategorized categories{...ODPGroupCategoryFragment}seller{id name isPro}shipment{id trackingNumber}actions{reorder edit track changeSlot checkin editDeliveryInstructions editPickupPerson tip cancel help enableTip{...orderActionFragment}enableEdit{...orderActionFragment}viewCancellationDetails{...cancellationDetailsActionFragment}enableInHome{...orderActionFragment}createGiftReceipt}cutOffTimestamp isEditSubstitutionsEligible isInHome giftDetails{recipientAddress{fullName}recipientEmail senderName giftMessage}donationDetails{...orderDonationDetails}}fragment returnInfoFragment on ReturnInfo{returnOrderId type refundPriceDetails{__typename...refundPriceDetailsFragment}refundMessage tierRefundMessage paymentMethods{__typename description cardType paymentType displayValues message{...textFragment}}actions{__typename generate scheduleOrModifyPickup{text url}reschedulePickup editPickupContact}shippingLabelUrl qrCodeImageUrl carriers{__typename id name}pickupCarrier pickupContact{nameAndAddress{fullName firstName lastName address{addressString city state postalCode addressLineOne addressLineTwo country}}phone}pickupConfirmationNumber bannerMessage{...textFragment}}fragment refundPriceDetailsFragment on RefundPriceDetails{subTotal{__typename...orderPriceDetailRowFragment}fees{__typename...orderPriceDetailRowFragment}discounts{__typename...orderPriceDetailRowFragment}taxTotal{__typename...orderPriceDetailRowFragment}grandTotal{__typename...orderPriceDetailRowFragment}}fragment orderPriceDetailRowFragment on OrderPriceDetailRow{label displayValue value info{__typename title message}}fragment addressFragment on OrderAddress{addressString addressLineOne addressLineTwo state postalCode city}fragment ODPPickupInfo on OrderGroup{pickupInstructions pickupPerson{...person}alternatePickupPerson{...person}store{id name address{...addressFragment}}}fragment person on OrderPickupPerson{firstName lastName email}fragment ODPTippingInfo on OrderGroup{addTipMessage{...textFragment}driver{...DriverFragment}tipping{min{...price}max{...price}suggested{...price}preselected}subtotal{...price}}fragment orderActionFragment on Action{text url}fragment orderCustomer on OrderCustomer{id firstName lastName email isGuest isEmailRegistered}fragment OrderFieldsFragment on Order{__typename id version type customer{...orderCustomer}displayId idBarcodeImageUrl(barWidth:3 barHeight:100) isFuelPurchase title shortTitle timezone tippableGroup{...OrderGroupFragment}amendableGroup{id changeSlotIterationsLeft cutOffTimestamp fulfillmentType deliveryAddress{fullName firstName lastName address{addressString addressLineOne addressLineTwo state postalCode city country}}isAmendInProgress}substitutionsBanner{heading subheading longSubheading}groups_2101{__typename...OrderGroupFragment...ODPGroupFragment...ODPPickupInfo...ODPTippingInfo}multiboxBundles{...orderLineItem}itemCancelReasons{__typename...cancelReason}groupCancelReasons{__typename...cancelReason}priceDetails{__typename subTotal{__typename...priceDetailFragment}taxTotal{__typename...priceDetailFragment}grandTotal{__typename...priceDetailFragment}authorizationAmount{__typename...priceDetailFragment}fees{__typename...priceDetailFragment}discounts{__typename...priceDetailFragment}minimumThreshold{__typename...price}belowMinimumFee{__typename...priceDetailFragment}driverTip{__typename...priceDetailFragment}donations{__typename...priceDetailFragment}}paymentMethods{__typename description cardType paymentType displayValues message{...textFragment}actions{connectToCapitalOne{...orderActionFragment}visitAffirm{...orderActionFragment}}}actions{__typename return pendingReturn cancel startReturn{...orderActionFragment}reorder}banners{...textFragment}}","variables":{"orderId":"2802225535678","emailAddress":"pennymlewis@yahoo.com"}}' \
  --compressed`
 
for (( i=0; i<=4; i++ ))
do
  if [[ $curl35 =~ "error"  || $curl35 =~ "blocked" ]]; then
    echo "Lỗi email số 35"
    indexOrder35=`echo error`
    break
  elif [[ `echo $curl35 | jq '.data.guestOrder.groups_2101['${i[@]}'].items[0].product.usItemId'` == '"641220610"' ]]; then
    indexOrder35=`echo $i`
    indexItem35=`echo 0`
  elif [[ `echo $curl35 | jq '.data.guestOrder.groups_2101['${i[@]}'].items[1].product.usItemId'` == '"641220610"' ]]; then
    indexOrder35=`echo $i`
    indexItem35=`echo 1`
  elif [[ `echo $curl35 | jq '.data.guestOrder.groups_2101['${i[@]}'].items[2].product.usItemId'` == '"641220610"' ]]; then
    indexOrder35=`echo $i`
    indexItem35=`echo 2`
  elif [[ `echo $curl35 | jq '.data.guestOrder.groups_2101['${i[@]}'].items[3].product.usItemId'` == '"641220610"' ]]; then
    indexOrder35=`echo $i`
    indexItem35=`echo 3`
  fi
done

if [[ $indexOrder35 != "error" ]]; then
echo $curl35 | jq '.data.guestOrder.id' >> track-OrderID.txt
echo $curl35 | jq '.data.guestOrder.customer.email' >> track-email.txt
echo $curl35 | jq '.data.guestOrder.groups_2101['$indexOrder35'].items['$indexItem35'].product.usItemId' >> track-usItemId.txt
echo $curl35 | jq '.data.guestOrder.groups_2101['$indexOrder35'].items['$indexItem35'].priceInfo.linePrice.value' >> track-priceValue.txt
echo $curl35 | jq '.data.guestOrder.groups_2101['$indexOrder35'].deliveryAddress.fullName' >> track-fullName.txt
echo $curl35 | jq '.data.guestOrder.groups_2101['$indexOrder35'].deliveryAddress.address.addressString' >> track-address.txt
echo $curl35 | jq '.data.guestOrder.groups_2101['$indexOrder35'].status.message.parts[].text' >> track-status.txt
echo $curl35 | jq '.data.guestOrder.groups_2101['$indexOrder35'].shipment.trackingNumber' >> track-number.txt
echo $curl35 | jq '.data.guestOrder.groups_2101['$indexOrder35'].shipment.trackingUrl' >> track-url.txt
fi

curl36=`curl 'https://www.walmart.com/orchestra/home/graphql' \
  -H 'authority: www.walmart.com' \
  -H 'sec-ch-ua: " Not A;Brand";v="99", "Chromium";v="96", "Microsoft Edge";v="96"' \
  -H 'x-o-platform: rweb' \
  -H 'dnt: 1' \
  -H 'x-o-correlation-id: wrvYiSFTlAmd8j7a8DDmpuyOpCN_heAnwM3v' \
  -H 'device_profile_ref_id: _s1F3NO8Y2JjaBUKPDcY4iFDWiIl9CyqiJjf' \
  -H 'x-latency-trace: 1' \
  -H 'wm_mp: true' \
  -H 'x-o-market: us' \
  -H 'x-o-platform-version: main-253-ebbb47' \
  -H 'x-o-gql-query: query getGuestOrder' \
  -H 'wm_page_url: https://www.walmart.com/orders' \
  -H 'x-apollo-operation-name: getGuestOrder' \
  -H 'sec-ch-ua-platform: "macOS"' \
  -H 'sec-ch-ua-mobile: ?0' \
  -H 'user-agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/96.0.4664.110 Safari/537.36 Edg/96.0.1054.62' \
  -H 'x-o-segment: oaoh' \
  -H 'content-type: application/json' \
  -H 'accept: application/json' \
  -H 'x-enable-server-timing: 1' \
  -H 'x-o-ccm: server' \
  -H 'wm_qos.correlation_id: wrvYiSFTlAmd8j7a8DDmpuyOpCN_heAnwM3v' \
  -H 'origin: https://www.walmart.com' \
  -H 'sec-fetch-site: same-origin' \
  -H 'sec-fetch-mode: cors' \
  -H 'sec-fetch-dest: empty' \
  -H 'referer: https://www.walmart.com/orders' \
  -H 'accept-language: vi' \
  --data-raw $'{"query":"query getGuestOrder($orderId:ID\u0021 $emailAddress:String\u0021){guestOrder(input:{id:$orderId emailAddress:$emailAddress}){...OrderFieldsFragment}}fragment cancelReason on OrderCancelReason{__typename subReasonCode subDescription}fragment priceDetailFragment on OrderPriceDetailRow{label value displayValue info{title message}rowInfo{...orderPriceDetailRowInfo}}fragment orderPriceDetailRowInfo on OrderPriceDetailRowInfo{title message{...textFragment}}fragment price on Price{displayValue value}fragment variants on MapEntry{name value}fragment OrderAddOn on OrderAddOn{lineId uniqueLineId productInfo{name usItemId offerId}quantityString quantityLabel type fulfillmentInstructions{...textFragment}actions{manageProtectionPlan{...orderActionFragment}cancel}priceInfo{linePrice{...price}}quantity isActive}fragment orderDonationDetails on OrderDonationDetails{message{...textFragment}emailReceipt emailReceiptToken status{...textFragment}errorStatus}fragment orderLineItem on OrderLineItem{id uniqueId actions{contactSeller cancel addToCart configureCake reviewItem resendEGiftCardToken protectionPlan{...orderActionFragment}manageProtectionPlan{...orderActionFragment}}isGift digitalDeliveryMessage quantity quantityString quantityLabel isSubstitutionSelected fulfilledItems{id quantityString priceInfo{itemPrice{value}}product{usItemId name}}isReturnable returnEligibilityMessage product{name usItemId imageInfo{thumbnailUrl}canonicalUrl offerId sellerId sellerName hasSellerBadge seller{sellerId name}orderLimit orderMinLimit weightIncrement salesUnit salesUnitType isSubstitutionEligible isAlcohol}reshop{reshopMessage isShippingAvailable minPromiseDate maxPromiseDate}selectedVariants{...variants}variantAdditionalInfo{parts{text nativeAction}}priceInfo{priceDisplayCodes{showItemPrice priceDisplayCondition finalCostByWeight}itemPrice{...price}linePrice{...price}unitPrice{...price}preDiscountedLinePrice{...price}additionalLines{name value}}discounts{label labelText{...textFragment}}itemReviewed activationCodes{label code}protectionPlanMessage{...textFragment}showSeller isShippedByWalmart seller{id name isPro}digitalDeliveryPhoneNumber addOns{...OrderAddOn}multiboxBundleId}fragment DriverFragment on Driver{id firstName photoUrl}fragment OrderGroupFragment on OrderGroup{driver{...DriverFragment}deliveryDate fulfillmentType status{...OrderGroupStatusFragment}showSeller isShippedByWalmart seller{...SellerFragment}id itemCount items{...LiteLineItemFragment}pickupPerson{firstName lastName email}accessPointId shipment{...ShipmentFragment}returnEligibilityMessage actions{...OrderGroupActionsFragment}recipientEmailAddress digitalDelivery{...DigitalDeliveryFragment}tireInstallationReservation{status extraText}}fragment OrderGroupStatusFragment on OrderGroupStatus{statusType showStatusTracker statusTracker{status label isCurrent}message{...textFragment}subtext subMessage{...textFragment}notice helpCenterText{...textFragment}}fragment textFragment on Text{parts{bold url text nativeAction lineBreak}}fragment LiteLineItemFragment on OrderLineItem{id quantity product{name usItemId imageInfo{thumbnailUrl}offerId isAlcohol}priceInfo{linePrice{...price}}}fragment SellerFragment on GroupSeller{id name isPro}fragment DigitalDeliveryFragment on DigitalDelivery{title name instructions{...textFragment}}fragment ShipmentFragment on Shipment{id trackingNumber isExternalTracking trackingUrl proofOfDelivery{photoUrl photoPreviewUrl showPreview}}fragment OrderGroupActionsFragment on OrderGroupActions{reorder edit track changeSlot checkin editDeliveryInstructions editPickupPerson editTip tip cancel enableTip{...orderActionFragment}enableEdit{...orderActionFragment}rescheduleTireInstall{...orderActionFragment}cancelTireInstall{...orderActionFragment}help viewCancellationDetails{...cancellationDetailsActionFragment}}fragment cancellationDetailsActionFragment on CancellationDetailsAction{label heading text{...textFragment}}fragment ODPGroupCategoryFragment on OrderCategory{type name subtext returnMessage substitutionsBanner{...textFragment}showExtendedSubstitutions actions{substitutions{message label type}nilPickReshop{message action{text url}}returnDetails viewCancellationDetails{...cancellationDetailsActionFragment}trackOnInHomeApp}banner{...textFragment}accordionState items{...orderLineItem}substitutions{...orderLineItem fulfilledItems{...orderLineItem}}returnInfo{...returnInfoFragment}}fragment ODPGroupFragment on OrderGroup{id fulfillmentType deliveryMessage deliveryAddress{fullName firstName lastName address{...addressFragment}}deliveryInstructions{text type typeText}deliveryPreferences{text{...textFragment}cta{...orderActionFragment}}editSubstitutionsCutOff status{statusType showStatusTracker message{...textFragment}notice helpCenterText{...textFragment}}itemCount isCategorized categories{...ODPGroupCategoryFragment}seller{id name isPro}shipment{id trackingNumber}actions{reorder edit track changeSlot checkin editDeliveryInstructions editPickupPerson tip cancel help enableTip{...orderActionFragment}enableEdit{...orderActionFragment}viewCancellationDetails{...cancellationDetailsActionFragment}enableInHome{...orderActionFragment}createGiftReceipt}cutOffTimestamp isEditSubstitutionsEligible isInHome giftDetails{recipientAddress{fullName}recipientEmail senderName giftMessage}donationDetails{...orderDonationDetails}}fragment returnInfoFragment on ReturnInfo{returnOrderId type refundPriceDetails{__typename...refundPriceDetailsFragment}refundMessage tierRefundMessage paymentMethods{__typename description cardType paymentType displayValues message{...textFragment}}actions{__typename generate scheduleOrModifyPickup{text url}reschedulePickup editPickupContact}shippingLabelUrl qrCodeImageUrl carriers{__typename id name}pickupCarrier pickupContact{nameAndAddress{fullName firstName lastName address{addressString city state postalCode addressLineOne addressLineTwo country}}phone}pickupConfirmationNumber bannerMessage{...textFragment}}fragment refundPriceDetailsFragment on RefundPriceDetails{subTotal{__typename...orderPriceDetailRowFragment}fees{__typename...orderPriceDetailRowFragment}discounts{__typename...orderPriceDetailRowFragment}taxTotal{__typename...orderPriceDetailRowFragment}grandTotal{__typename...orderPriceDetailRowFragment}}fragment orderPriceDetailRowFragment on OrderPriceDetailRow{label displayValue value info{__typename title message}}fragment addressFragment on OrderAddress{addressString addressLineOne addressLineTwo state postalCode city}fragment ODPPickupInfo on OrderGroup{pickupInstructions pickupPerson{...person}alternatePickupPerson{...person}store{id name address{...addressFragment}}}fragment person on OrderPickupPerson{firstName lastName email}fragment ODPTippingInfo on OrderGroup{addTipMessage{...textFragment}driver{...DriverFragment}tipping{min{...price}max{...price}suggested{...price}preselected}subtotal{...price}}fragment orderActionFragment on Action{text url}fragment orderCustomer on OrderCustomer{id firstName lastName email isGuest isEmailRegistered}fragment OrderFieldsFragment on Order{__typename id version type customer{...orderCustomer}displayId idBarcodeImageUrl(barWidth:3 barHeight:100) isFuelPurchase title shortTitle timezone tippableGroup{...OrderGroupFragment}amendableGroup{id changeSlotIterationsLeft cutOffTimestamp fulfillmentType deliveryAddress{fullName firstName lastName address{addressString addressLineOne addressLineTwo state postalCode city country}}isAmendInProgress}substitutionsBanner{heading subheading longSubheading}groups_2101{__typename...OrderGroupFragment...ODPGroupFragment...ODPPickupInfo...ODPTippingInfo}multiboxBundles{...orderLineItem}itemCancelReasons{__typename...cancelReason}groupCancelReasons{__typename...cancelReason}priceDetails{__typename subTotal{__typename...priceDetailFragment}taxTotal{__typename...priceDetailFragment}grandTotal{__typename...priceDetailFragment}authorizationAmount{__typename...priceDetailFragment}fees{__typename...priceDetailFragment}discounts{__typename...priceDetailFragment}minimumThreshold{__typename...price}belowMinimumFee{__typename...priceDetailFragment}driverTip{__typename...priceDetailFragment}donations{__typename...priceDetailFragment}}paymentMethods{__typename description cardType paymentType displayValues message{...textFragment}actions{connectToCapitalOne{...orderActionFragment}visitAffirm{...orderActionFragment}}}actions{__typename return pendingReturn cancel startReturn{...orderActionFragment}reorder}banners{...textFragment}}","variables":{"orderId":"2842234520390","emailAddress":"joseph6057@gmail.com"}}' \
  --compressed`
 
for (( i=0; i<=4; i++ ))
do
  if [[ $curl36 =~ "error"  || $curl36 =~ "blocked" ]]; then
    echo "Lỗi email số 36"
    indexOrder36=`echo error`
    break
  elif [[ `echo $curl36 | jq '.data.guestOrder.groups_2101['${i[@]}'].items[0].product.usItemId'` == '"755361385"' ]]; then
    indexOrder36=`echo $i`
    indexItem36=`echo 0`
  elif [[ `echo $curl36 | jq '.data.guestOrder.groups_2101['${i[@]}'].items[1].product.usItemId'` == '"755361385"' ]]; then
    indexOrder36=`echo $i`
    indexItem36=`echo 1`
  elif [[ `echo $curl36 | jq '.data.guestOrder.groups_2101['${i[@]}'].items[2].product.usItemId'` == '"755361385"' ]]; then
    indexOrder36=`echo $i`
    indexItem36=`echo 2`
  elif [[ `echo $curl36 | jq '.data.guestOrder.groups_2101['${i[@]}'].items[3].product.usItemId'` == '"755361385"' ]]; then
    indexOrder36=`echo $i`
    indexItem36=`echo 3`
  fi
done

if [[ $indexOrder36 != "error" ]]; then
echo $curl36 | jq '.data.guestOrder.id' >> track-OrderID.txt
echo $curl36 | jq '.data.guestOrder.customer.email' >> track-email.txt
echo $curl36 | jq '.data.guestOrder.groups_2101['$indexOrder36'].items['$indexItem36'].product.usItemId' >> track-usItemId.txt
echo $curl36 | jq '.data.guestOrder.groups_2101['$indexOrder36'].items['$indexItem36'].priceInfo.linePrice.value' >> track-priceValue.txt
echo $curl36 | jq '.data.guestOrder.groups_2101['$indexOrder36'].deliveryAddress.fullName' >> track-fullName.txt
echo $curl36 | jq '.data.guestOrder.groups_2101['$indexOrder36'].deliveryAddress.address.addressString' >> track-address.txt
echo $curl36 | jq '.data.guestOrder.groups_2101['$indexOrder36'].status.message.parts[].text' >> track-status.txt
echo $curl36 | jq '.data.guestOrder.groups_2101['$indexOrder36'].shipment.trackingNumber' >> track-number.txt
echo $curl36 | jq '.data.guestOrder.groups_2101['$indexOrder36'].shipment.trackingUrl' >> track-url.txt
fi

curl37=`curl 'https://www.walmart.com/orchestra/home/graphql' \
  -H 'authority: www.walmart.com' \
  -H 'sec-ch-ua: " Not A;Brand";v="99", "Chromium";v="96", "Microsoft Edge";v="96"' \
  -H 'x-o-platform: rweb' \
  -H 'dnt: 1' \
  -H 'x-o-correlation-id: wrvYiSFTlAmd8j7a8DDmpuyOpCN_heAnwM3v' \
  -H 'device_profile_ref_id: _s1F3NO8Y2JjaBUKPDcY4iFDWiIl9CyqiJjf' \
  -H 'x-latency-trace: 1' \
  -H 'wm_mp: true' \
  -H 'x-o-market: us' \
  -H 'x-o-platform-version: main-253-ebbb47' \
  -H 'x-o-gql-query: query getGuestOrder' \
  -H 'wm_page_url: https://www.walmart.com/orders' \
  -H 'x-apollo-operation-name: getGuestOrder' \
  -H 'sec-ch-ua-platform: "macOS"' \
  -H 'sec-ch-ua-mobile: ?0' \
  -H 'user-agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/96.0.4664.110 Safari/537.36 Edg/96.0.1054.62' \
  -H 'x-o-segment: oaoh' \
  -H 'content-type: application/json' \
  -H 'accept: application/json' \
  -H 'x-enable-server-timing: 1' \
  -H 'x-o-ccm: server' \
  -H 'wm_qos.correlation_id: wrvYiSFTlAmd8j7a8DDmpuyOpCN_heAnwM3v' \
  -H 'origin: https://www.walmart.com' \
  -H 'sec-fetch-site: same-origin' \
  -H 'sec-fetch-mode: cors' \
  -H 'sec-fetch-dest: empty' \
  -H 'referer: https://www.walmart.com/orders' \
  -H 'accept-language: vi' \
  --data-raw $'{"query":"query getGuestOrder($orderId:ID\u0021 $emailAddress:String\u0021){guestOrder(input:{id:$orderId emailAddress:$emailAddress}){...OrderFieldsFragment}}fragment cancelReason on OrderCancelReason{__typename subReasonCode subDescription}fragment priceDetailFragment on OrderPriceDetailRow{label value displayValue info{title message}rowInfo{...orderPriceDetailRowInfo}}fragment orderPriceDetailRowInfo on OrderPriceDetailRowInfo{title message{...textFragment}}fragment price on Price{displayValue value}fragment variants on MapEntry{name value}fragment OrderAddOn on OrderAddOn{lineId uniqueLineId productInfo{name usItemId offerId}quantityString quantityLabel type fulfillmentInstructions{...textFragment}actions{manageProtectionPlan{...orderActionFragment}cancel}priceInfo{linePrice{...price}}quantity isActive}fragment orderDonationDetails on OrderDonationDetails{message{...textFragment}emailReceipt emailReceiptToken status{...textFragment}errorStatus}fragment orderLineItem on OrderLineItem{id uniqueId actions{contactSeller cancel addToCart configureCake reviewItem resendEGiftCardToken protectionPlan{...orderActionFragment}manageProtectionPlan{...orderActionFragment}}isGift digitalDeliveryMessage quantity quantityString quantityLabel isSubstitutionSelected fulfilledItems{id quantityString priceInfo{itemPrice{value}}product{usItemId name}}isReturnable returnEligibilityMessage product{name usItemId imageInfo{thumbnailUrl}canonicalUrl offerId sellerId sellerName hasSellerBadge seller{sellerId name}orderLimit orderMinLimit weightIncrement salesUnit salesUnitType isSubstitutionEligible isAlcohol}reshop{reshopMessage isShippingAvailable minPromiseDate maxPromiseDate}selectedVariants{...variants}variantAdditionalInfo{parts{text nativeAction}}priceInfo{priceDisplayCodes{showItemPrice priceDisplayCondition finalCostByWeight}itemPrice{...price}linePrice{...price}unitPrice{...price}preDiscountedLinePrice{...price}additionalLines{name value}}discounts{label labelText{...textFragment}}itemReviewed activationCodes{label code}protectionPlanMessage{...textFragment}showSeller isShippedByWalmart seller{id name isPro}digitalDeliveryPhoneNumber addOns{...OrderAddOn}multiboxBundleId}fragment DriverFragment on Driver{id firstName photoUrl}fragment OrderGroupFragment on OrderGroup{driver{...DriverFragment}deliveryDate fulfillmentType status{...OrderGroupStatusFragment}showSeller isShippedByWalmart seller{...SellerFragment}id itemCount items{...LiteLineItemFragment}pickupPerson{firstName lastName email}accessPointId shipment{...ShipmentFragment}returnEligibilityMessage actions{...OrderGroupActionsFragment}recipientEmailAddress digitalDelivery{...DigitalDeliveryFragment}tireInstallationReservation{status extraText}}fragment OrderGroupStatusFragment on OrderGroupStatus{statusType showStatusTracker statusTracker{status label isCurrent}message{...textFragment}subtext subMessage{...textFragment}notice helpCenterText{...textFragment}}fragment textFragment on Text{parts{bold url text nativeAction lineBreak}}fragment LiteLineItemFragment on OrderLineItem{id quantity product{name usItemId imageInfo{thumbnailUrl}offerId isAlcohol}priceInfo{linePrice{...price}}}fragment SellerFragment on GroupSeller{id name isPro}fragment DigitalDeliveryFragment on DigitalDelivery{title name instructions{...textFragment}}fragment ShipmentFragment on Shipment{id trackingNumber isExternalTracking trackingUrl proofOfDelivery{photoUrl photoPreviewUrl showPreview}}fragment OrderGroupActionsFragment on OrderGroupActions{reorder edit track changeSlot checkin editDeliveryInstructions editPickupPerson editTip tip cancel enableTip{...orderActionFragment}enableEdit{...orderActionFragment}rescheduleTireInstall{...orderActionFragment}cancelTireInstall{...orderActionFragment}help viewCancellationDetails{...cancellationDetailsActionFragment}}fragment cancellationDetailsActionFragment on CancellationDetailsAction{label heading text{...textFragment}}fragment ODPGroupCategoryFragment on OrderCategory{type name subtext returnMessage substitutionsBanner{...textFragment}showExtendedSubstitutions actions{substitutions{message label type}nilPickReshop{message action{text url}}returnDetails viewCancellationDetails{...cancellationDetailsActionFragment}trackOnInHomeApp}banner{...textFragment}accordionState items{...orderLineItem}substitutions{...orderLineItem fulfilledItems{...orderLineItem}}returnInfo{...returnInfoFragment}}fragment ODPGroupFragment on OrderGroup{id fulfillmentType deliveryMessage deliveryAddress{fullName firstName lastName address{...addressFragment}}deliveryInstructions{text type typeText}deliveryPreferences{text{...textFragment}cta{...orderActionFragment}}editSubstitutionsCutOff status{statusType showStatusTracker message{...textFragment}notice helpCenterText{...textFragment}}itemCount isCategorized categories{...ODPGroupCategoryFragment}seller{id name isPro}shipment{id trackingNumber}actions{reorder edit track changeSlot checkin editDeliveryInstructions editPickupPerson tip cancel help enableTip{...orderActionFragment}enableEdit{...orderActionFragment}viewCancellationDetails{...cancellationDetailsActionFragment}enableInHome{...orderActionFragment}createGiftReceipt}cutOffTimestamp isEditSubstitutionsEligible isInHome giftDetails{recipientAddress{fullName}recipientEmail senderName giftMessage}donationDetails{...orderDonationDetails}}fragment returnInfoFragment on ReturnInfo{returnOrderId type refundPriceDetails{__typename...refundPriceDetailsFragment}refundMessage tierRefundMessage paymentMethods{__typename description cardType paymentType displayValues message{...textFragment}}actions{__typename generate scheduleOrModifyPickup{text url}reschedulePickup editPickupContact}shippingLabelUrl qrCodeImageUrl carriers{__typename id name}pickupCarrier pickupContact{nameAndAddress{fullName firstName lastName address{addressString city state postalCode addressLineOne addressLineTwo country}}phone}pickupConfirmationNumber bannerMessage{...textFragment}}fragment refundPriceDetailsFragment on RefundPriceDetails{subTotal{__typename...orderPriceDetailRowFragment}fees{__typename...orderPriceDetailRowFragment}discounts{__typename...orderPriceDetailRowFragment}taxTotal{__typename...orderPriceDetailRowFragment}grandTotal{__typename...orderPriceDetailRowFragment}}fragment orderPriceDetailRowFragment on OrderPriceDetailRow{label displayValue value info{__typename title message}}fragment addressFragment on OrderAddress{addressString addressLineOne addressLineTwo state postalCode city}fragment ODPPickupInfo on OrderGroup{pickupInstructions pickupPerson{...person}alternatePickupPerson{...person}store{id name address{...addressFragment}}}fragment person on OrderPickupPerson{firstName lastName email}fragment ODPTippingInfo on OrderGroup{addTipMessage{...textFragment}driver{...DriverFragment}tipping{min{...price}max{...price}suggested{...price}preselected}subtotal{...price}}fragment orderActionFragment on Action{text url}fragment orderCustomer on OrderCustomer{id firstName lastName email isGuest isEmailRegistered}fragment OrderFieldsFragment on Order{__typename id version type customer{...orderCustomer}displayId idBarcodeImageUrl(barWidth:3 barHeight:100) isFuelPurchase title shortTitle timezone tippableGroup{...OrderGroupFragment}amendableGroup{id changeSlotIterationsLeft cutOffTimestamp fulfillmentType deliveryAddress{fullName firstName lastName address{addressString addressLineOne addressLineTwo state postalCode city country}}isAmendInProgress}substitutionsBanner{heading subheading longSubheading}groups_2101{__typename...OrderGroupFragment...ODPGroupFragment...ODPPickupInfo...ODPTippingInfo}multiboxBundles{...orderLineItem}itemCancelReasons{__typename...cancelReason}groupCancelReasons{__typename...cancelReason}priceDetails{__typename subTotal{__typename...priceDetailFragment}taxTotal{__typename...priceDetailFragment}grandTotal{__typename...priceDetailFragment}authorizationAmount{__typename...priceDetailFragment}fees{__typename...priceDetailFragment}discounts{__typename...priceDetailFragment}minimumThreshold{__typename...price}belowMinimumFee{__typename...priceDetailFragment}driverTip{__typename...priceDetailFragment}donations{__typename...priceDetailFragment}}paymentMethods{__typename description cardType paymentType displayValues message{...textFragment}actions{connectToCapitalOne{...orderActionFragment}visitAffirm{...orderActionFragment}}}actions{__typename return pendingReturn cancel startReturn{...orderActionFragment}reorder}banners{...textFragment}}","variables":{"orderId":"2842234220489","emailAddress":"crushedpringles@gmail.com"}}' \
  --compressed`
 
for (( i=0; i<=4; i++ ))
do
  if [[ $curl37 =~ "error"  || $curl37 =~ "blocked" ]]; then
    echo "Lỗi email số 37"
    indexOrder37=`echo error`
    break
  elif [[ `echo $curl37 | jq '.data.guestOrder.groups_2101['${i[@]}'].items[0].product.usItemId'` == '"749228471"' ]]; then
    indexOrder37=`echo $i`
    indexItem37=`echo 0`
  elif [[ `echo $curl37 | jq '.data.guestOrder.groups_2101['${i[@]}'].items[1].product.usItemId'` == '"749228471"' ]]; then
    indexOrder37=`echo $i`
    indexItem37=`echo 1`
  elif [[ `echo $curl37 | jq '.data.guestOrder.groups_2101['${i[@]}'].items[2].product.usItemId'` == '"749228471"' ]]; then
    indexOrder37=`echo $i`
    indexItem37=`echo 2`
  elif [[ `echo $curl37 | jq '.data.guestOrder.groups_2101['${i[@]}'].items[3].product.usItemId'` == '"749228471"' ]]; then
    indexOrder37=`echo $i`
    indexItem37=`echo 3`
  fi
done

if [[ $indexOrder37 != "error" ]]; then
echo $curl37 | jq '.data.guestOrder.id' >> track-OrderID.txt
echo $curl37 | jq '.data.guestOrder.customer.email' >> track-email.txt
echo $curl37 | jq '.data.guestOrder.groups_2101['$indexOrder37'].items['$indexItem37'].product.usItemId' >> track-usItemId.txt
echo $curl37 | jq '.data.guestOrder.groups_2101['$indexOrder37'].items['$indexItem37'].priceInfo.linePrice.value' >> track-priceValue.txt
echo $curl37 | jq '.data.guestOrder.groups_2101['$indexOrder37'].deliveryAddress.fullName' >> track-fullName.txt
echo $curl37 | jq '.data.guestOrder.groups_2101['$indexOrder37'].deliveryAddress.address.addressString' >> track-address.txt
echo $curl37 | jq '.data.guestOrder.groups_2101['$indexOrder37'].status.message.parts[].text' >> track-status.txt
echo $curl37 | jq '.data.guestOrder.groups_2101['$indexOrder37'].shipment.trackingNumber' >> track-number.txt
echo $curl37 | jq '.data.guestOrder.groups_2101['$indexOrder37'].shipment.trackingUrl' >> track-url.txt
fi

curl38=`curl 'https://www.walmart.com/orchestra/home/graphql' \
  -H 'authority: www.walmart.com' \
  -H 'sec-ch-ua: " Not A;Brand";v="99", "Chromium";v="96", "Microsoft Edge";v="96"' \
  -H 'x-o-platform: rweb' \
  -H 'dnt: 1' \
  -H 'x-o-correlation-id: wrvYiSFTlAmd8j7a8DDmpuyOpCN_heAnwM3v' \
  -H 'device_profile_ref_id: _s1F3NO8Y2JjaBUKPDcY4iFDWiIl9CyqiJjf' \
  -H 'x-latency-trace: 1' \
  -H 'wm_mp: true' \
  -H 'x-o-market: us' \
  -H 'x-o-platform-version: main-253-ebbb47' \
  -H 'x-o-gql-query: query getGuestOrder' \
  -H 'wm_page_url: https://www.walmart.com/orders' \
  -H 'x-apollo-operation-name: getGuestOrder' \
  -H 'sec-ch-ua-platform: "macOS"' \
  -H 'sec-ch-ua-mobile: ?0' \
  -H 'user-agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/96.0.4664.110 Safari/537.36 Edg/96.0.1054.62' \
  -H 'x-o-segment: oaoh' \
  -H 'content-type: application/json' \
  -H 'accept: application/json' \
  -H 'x-enable-server-timing: 1' \
  -H 'x-o-ccm: server' \
  -H 'wm_qos.correlation_id: wrvYiSFTlAmd8j7a8DDmpuyOpCN_heAnwM3v' \
  -H 'origin: https://www.walmart.com' \
  -H 'sec-fetch-site: same-origin' \
  -H 'sec-fetch-mode: cors' \
  -H 'sec-fetch-dest: empty' \
  -H 'referer: https://www.walmart.com/orders' \
  -H 'accept-language: vi' \
  --data-raw $'{"query":"query getGuestOrder($orderId:ID\u0021 $emailAddress:String\u0021){guestOrder(input:{id:$orderId emailAddress:$emailAddress}){...OrderFieldsFragment}}fragment cancelReason on OrderCancelReason{__typename subReasonCode subDescription}fragment priceDetailFragment on OrderPriceDetailRow{label value displayValue info{title message}rowInfo{...orderPriceDetailRowInfo}}fragment orderPriceDetailRowInfo on OrderPriceDetailRowInfo{title message{...textFragment}}fragment price on Price{displayValue value}fragment variants on MapEntry{name value}fragment OrderAddOn on OrderAddOn{lineId uniqueLineId productInfo{name usItemId offerId}quantityString quantityLabel type fulfillmentInstructions{...textFragment}actions{manageProtectionPlan{...orderActionFragment}cancel}priceInfo{linePrice{...price}}quantity isActive}fragment orderDonationDetails on OrderDonationDetails{message{...textFragment}emailReceipt emailReceiptToken status{...textFragment}errorStatus}fragment orderLineItem on OrderLineItem{id uniqueId actions{contactSeller cancel addToCart configureCake reviewItem resendEGiftCardToken protectionPlan{...orderActionFragment}manageProtectionPlan{...orderActionFragment}}isGift digitalDeliveryMessage quantity quantityString quantityLabel isSubstitutionSelected fulfilledItems{id quantityString priceInfo{itemPrice{value}}product{usItemId name}}isReturnable returnEligibilityMessage product{name usItemId imageInfo{thumbnailUrl}canonicalUrl offerId sellerId sellerName hasSellerBadge seller{sellerId name}orderLimit orderMinLimit weightIncrement salesUnit salesUnitType isSubstitutionEligible isAlcohol}reshop{reshopMessage isShippingAvailable minPromiseDate maxPromiseDate}selectedVariants{...variants}variantAdditionalInfo{parts{text nativeAction}}priceInfo{priceDisplayCodes{showItemPrice priceDisplayCondition finalCostByWeight}itemPrice{...price}linePrice{...price}unitPrice{...price}preDiscountedLinePrice{...price}additionalLines{name value}}discounts{label labelText{...textFragment}}itemReviewed activationCodes{label code}protectionPlanMessage{...textFragment}showSeller isShippedByWalmart seller{id name isPro}digitalDeliveryPhoneNumber addOns{...OrderAddOn}multiboxBundleId}fragment DriverFragment on Driver{id firstName photoUrl}fragment OrderGroupFragment on OrderGroup{driver{...DriverFragment}deliveryDate fulfillmentType status{...OrderGroupStatusFragment}showSeller isShippedByWalmart seller{...SellerFragment}id itemCount items{...LiteLineItemFragment}pickupPerson{firstName lastName email}accessPointId shipment{...ShipmentFragment}returnEligibilityMessage actions{...OrderGroupActionsFragment}recipientEmailAddress digitalDelivery{...DigitalDeliveryFragment}tireInstallationReservation{status extraText}}fragment OrderGroupStatusFragment on OrderGroupStatus{statusType showStatusTracker statusTracker{status label isCurrent}message{...textFragment}subtext subMessage{...textFragment}notice helpCenterText{...textFragment}}fragment textFragment on Text{parts{bold url text nativeAction lineBreak}}fragment LiteLineItemFragment on OrderLineItem{id quantity product{name usItemId imageInfo{thumbnailUrl}offerId isAlcohol}priceInfo{linePrice{...price}}}fragment SellerFragment on GroupSeller{id name isPro}fragment DigitalDeliveryFragment on DigitalDelivery{title name instructions{...textFragment}}fragment ShipmentFragment on Shipment{id trackingNumber isExternalTracking trackingUrl proofOfDelivery{photoUrl photoPreviewUrl showPreview}}fragment OrderGroupActionsFragment on OrderGroupActions{reorder edit track changeSlot checkin editDeliveryInstructions editPickupPerson editTip tip cancel enableTip{...orderActionFragment}enableEdit{...orderActionFragment}rescheduleTireInstall{...orderActionFragment}cancelTireInstall{...orderActionFragment}help viewCancellationDetails{...cancellationDetailsActionFragment}}fragment cancellationDetailsActionFragment on CancellationDetailsAction{label heading text{...textFragment}}fragment ODPGroupCategoryFragment on OrderCategory{type name subtext returnMessage substitutionsBanner{...textFragment}showExtendedSubstitutions actions{substitutions{message label type}nilPickReshop{message action{text url}}returnDetails viewCancellationDetails{...cancellationDetailsActionFragment}trackOnInHomeApp}banner{...textFragment}accordionState items{...orderLineItem}substitutions{...orderLineItem fulfilledItems{...orderLineItem}}returnInfo{...returnInfoFragment}}fragment ODPGroupFragment on OrderGroup{id fulfillmentType deliveryMessage deliveryAddress{fullName firstName lastName address{...addressFragment}}deliveryInstructions{text type typeText}deliveryPreferences{text{...textFragment}cta{...orderActionFragment}}editSubstitutionsCutOff status{statusType showStatusTracker message{...textFragment}notice helpCenterText{...textFragment}}itemCount isCategorized categories{...ODPGroupCategoryFragment}seller{id name isPro}shipment{id trackingNumber}actions{reorder edit track changeSlot checkin editDeliveryInstructions editPickupPerson tip cancel help enableTip{...orderActionFragment}enableEdit{...orderActionFragment}viewCancellationDetails{...cancellationDetailsActionFragment}enableInHome{...orderActionFragment}createGiftReceipt}cutOffTimestamp isEditSubstitutionsEligible isInHome giftDetails{recipientAddress{fullName}recipientEmail senderName giftMessage}donationDetails{...orderDonationDetails}}fragment returnInfoFragment on ReturnInfo{returnOrderId type refundPriceDetails{__typename...refundPriceDetailsFragment}refundMessage tierRefundMessage paymentMethods{__typename description cardType paymentType displayValues message{...textFragment}}actions{__typename generate scheduleOrModifyPickup{text url}reschedulePickup editPickupContact}shippingLabelUrl qrCodeImageUrl carriers{__typename id name}pickupCarrier pickupContact{nameAndAddress{fullName firstName lastName address{addressString city state postalCode addressLineOne addressLineTwo country}}phone}pickupConfirmationNumber bannerMessage{...textFragment}}fragment refundPriceDetailsFragment on RefundPriceDetails{subTotal{__typename...orderPriceDetailRowFragment}fees{__typename...orderPriceDetailRowFragment}discounts{__typename...orderPriceDetailRowFragment}taxTotal{__typename...orderPriceDetailRowFragment}grandTotal{__typename...orderPriceDetailRowFragment}}fragment orderPriceDetailRowFragment on OrderPriceDetailRow{label displayValue value info{__typename title message}}fragment addressFragment on OrderAddress{addressString addressLineOne addressLineTwo state postalCode city}fragment ODPPickupInfo on OrderGroup{pickupInstructions pickupPerson{...person}alternatePickupPerson{...person}store{id name address{...addressFragment}}}fragment person on OrderPickupPerson{firstName lastName email}fragment ODPTippingInfo on OrderGroup{addTipMessage{...textFragment}driver{...DriverFragment}tipping{min{...price}max{...price}suggested{...price}preselected}subtotal{...price}}fragment orderActionFragment on Action{text url}fragment orderCustomer on OrderCustomer{id firstName lastName email isGuest isEmailRegistered}fragment OrderFieldsFragment on Order{__typename id version type customer{...orderCustomer}displayId idBarcodeImageUrl(barWidth:3 barHeight:100) isFuelPurchase title shortTitle timezone tippableGroup{...OrderGroupFragment}amendableGroup{id changeSlotIterationsLeft cutOffTimestamp fulfillmentType deliveryAddress{fullName firstName lastName address{addressString addressLineOne addressLineTwo state postalCode city country}}isAmendInProgress}substitutionsBanner{heading subheading longSubheading}groups_2101{__typename...OrderGroupFragment...ODPGroupFragment...ODPPickupInfo...ODPTippingInfo}multiboxBundles{...orderLineItem}itemCancelReasons{__typename...cancelReason}groupCancelReasons{__typename...cancelReason}priceDetails{__typename subTotal{__typename...priceDetailFragment}taxTotal{__typename...priceDetailFragment}grandTotal{__typename...priceDetailFragment}authorizationAmount{__typename...priceDetailFragment}fees{__typename...priceDetailFragment}discounts{__typename...priceDetailFragment}minimumThreshold{__typename...price}belowMinimumFee{__typename...priceDetailFragment}driverTip{__typename...priceDetailFragment}donations{__typename...priceDetailFragment}}paymentMethods{__typename description cardType paymentType displayValues message{...textFragment}actions{connectToCapitalOne{...orderActionFragment}visitAffirm{...orderActionFragment}}}actions{__typename return pendingReturn cancel startReturn{...orderActionFragment}reorder}banners{...textFragment}}","variables":{"orderId":"2812228888566","emailAddress":"chamin_mills@yahoo.com"}}' \
  --compressed`
 
for (( i=0; i<=4; i++ ))
do
  if [[ $curl38 =~ "error"  || $curl38 =~ "blocked" ]]; then
    echo "Lỗi email số 38"
    indexOrder38=`echo error`
    break
  elif [[ `echo $curl38 | jq '.data.guestOrder.groups_2101['${i[@]}'].items[0].product.usItemId'` == '"50753941"' ]]; then
    indexOrder38=`echo $i`
    indexItem38=`echo 0`
  elif [[ `echo $curl38 | jq '.data.guestOrder.groups_2101['${i[@]}'].items[1].product.usItemId'` == '"50753941"' ]]; then
    indexOrder38=`echo $i`
    indexItem38=`echo 1`
  elif [[ `echo $curl38 | jq '.data.guestOrder.groups_2101['${i[@]}'].items[2].product.usItemId'` == '"50753941"' ]]; then
    indexOrder38=`echo $i`
    indexItem38=`echo 2`
  elif [[ `echo $curl38 | jq '.data.guestOrder.groups_2101['${i[@]}'].items[3].product.usItemId'` == '"50753941"' ]]; then
    indexOrder38=`echo $i`
    indexItem38=`echo 3`
  fi
done

if [[ $indexOrder38 != "error" ]]; then
echo $curl38 | jq '.data.guestOrder.id' >> track-OrderID.txt
echo $curl38 | jq '.data.guestOrder.customer.email' >> track-email.txt
echo $curl38 | jq '.data.guestOrder.groups_2101['$indexOrder38'].items['$indexItem38'].product.usItemId' >> track-usItemId.txt
echo $curl38 | jq '.data.guestOrder.groups_2101['$indexOrder38'].items['$indexItem38'].priceInfo.linePrice.value' >> track-priceValue.txt
echo $curl38 | jq '.data.guestOrder.groups_2101['$indexOrder38'].deliveryAddress.fullName' >> track-fullName.txt
echo $curl38 | jq '.data.guestOrder.groups_2101['$indexOrder38'].deliveryAddress.address.addressString' >> track-address.txt
echo $curl38 | jq '.data.guestOrder.groups_2101['$indexOrder38'].status.message.parts[].text' >> track-status.txt
echo $curl38 | jq '.data.guestOrder.groups_2101['$indexOrder38'].shipment.trackingNumber' >> track-number.txt
echo $curl38 | jq '.data.guestOrder.groups_2101['$indexOrder38'].shipment.trackingUrl' >> track-url.txt
fi

curl39=`curl 'https://www.walmart.com/orchestra/home/graphql' \
  -H 'authority: www.walmart.com' \
  -H 'sec-ch-ua: " Not A;Brand";v="99", "Chromium";v="96", "Microsoft Edge";v="96"' \
  -H 'x-o-platform: rweb' \
  -H 'dnt: 1' \
  -H 'x-o-correlation-id: wrvYiSFTlAmd8j7a8DDmpuyOpCN_heAnwM3v' \
  -H 'device_profile_ref_id: _s1F3NO8Y2JjaBUKPDcY4iFDWiIl9CyqiJjf' \
  -H 'x-latency-trace: 1' \
  -H 'wm_mp: true' \
  -H 'x-o-market: us' \
  -H 'x-o-platform-version: main-253-ebbb47' \
  -H 'x-o-gql-query: query getGuestOrder' \
  -H 'wm_page_url: https://www.walmart.com/orders' \
  -H 'x-apollo-operation-name: getGuestOrder' \
  -H 'sec-ch-ua-platform: "macOS"' \
  -H 'sec-ch-ua-mobile: ?0' \
  -H 'user-agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/96.0.4664.110 Safari/537.36 Edg/96.0.1054.62' \
  -H 'x-o-segment: oaoh' \
  -H 'content-type: application/json' \
  -H 'accept: application/json' \
  -H 'x-enable-server-timing: 1' \
  -H 'x-o-ccm: server' \
  -H 'wm_qos.correlation_id: wrvYiSFTlAmd8j7a8DDmpuyOpCN_heAnwM3v' \
  -H 'origin: https://www.walmart.com' \
  -H 'sec-fetch-site: same-origin' \
  -H 'sec-fetch-mode: cors' \
  -H 'sec-fetch-dest: empty' \
  -H 'referer: https://www.walmart.com/orders' \
  -H 'accept-language: vi' \
  --data-raw $'{"query":"query getGuestOrder($orderId:ID\u0021 $emailAddress:String\u0021){guestOrder(input:{id:$orderId emailAddress:$emailAddress}){...OrderFieldsFragment}}fragment cancelReason on OrderCancelReason{__typename subReasonCode subDescription}fragment priceDetailFragment on OrderPriceDetailRow{label value displayValue info{title message}rowInfo{...orderPriceDetailRowInfo}}fragment orderPriceDetailRowInfo on OrderPriceDetailRowInfo{title message{...textFragment}}fragment price on Price{displayValue value}fragment variants on MapEntry{name value}fragment OrderAddOn on OrderAddOn{lineId uniqueLineId productInfo{name usItemId offerId}quantityString quantityLabel type fulfillmentInstructions{...textFragment}actions{manageProtectionPlan{...orderActionFragment}cancel}priceInfo{linePrice{...price}}quantity isActive}fragment orderDonationDetails on OrderDonationDetails{message{...textFragment}emailReceipt emailReceiptToken status{...textFragment}errorStatus}fragment orderLineItem on OrderLineItem{id uniqueId actions{contactSeller cancel addToCart configureCake reviewItem resendEGiftCardToken protectionPlan{...orderActionFragment}manageProtectionPlan{...orderActionFragment}}isGift digitalDeliveryMessage quantity quantityString quantityLabel isSubstitutionSelected fulfilledItems{id quantityString priceInfo{itemPrice{value}}product{usItemId name}}isReturnable returnEligibilityMessage product{name usItemId imageInfo{thumbnailUrl}canonicalUrl offerId sellerId sellerName hasSellerBadge seller{sellerId name}orderLimit orderMinLimit weightIncrement salesUnit salesUnitType isSubstitutionEligible isAlcohol}reshop{reshopMessage isShippingAvailable minPromiseDate maxPromiseDate}selectedVariants{...variants}variantAdditionalInfo{parts{text nativeAction}}priceInfo{priceDisplayCodes{showItemPrice priceDisplayCondition finalCostByWeight}itemPrice{...price}linePrice{...price}unitPrice{...price}preDiscountedLinePrice{...price}additionalLines{name value}}discounts{label labelText{...textFragment}}itemReviewed activationCodes{label code}protectionPlanMessage{...textFragment}showSeller isShippedByWalmart seller{id name isPro}digitalDeliveryPhoneNumber addOns{...OrderAddOn}multiboxBundleId}fragment DriverFragment on Driver{id firstName photoUrl}fragment OrderGroupFragment on OrderGroup{driver{...DriverFragment}deliveryDate fulfillmentType status{...OrderGroupStatusFragment}showSeller isShippedByWalmart seller{...SellerFragment}id itemCount items{...LiteLineItemFragment}pickupPerson{firstName lastName email}accessPointId shipment{...ShipmentFragment}returnEligibilityMessage actions{...OrderGroupActionsFragment}recipientEmailAddress digitalDelivery{...DigitalDeliveryFragment}tireInstallationReservation{status extraText}}fragment OrderGroupStatusFragment on OrderGroupStatus{statusType showStatusTracker statusTracker{status label isCurrent}message{...textFragment}subtext subMessage{...textFragment}notice helpCenterText{...textFragment}}fragment textFragment on Text{parts{bold url text nativeAction lineBreak}}fragment LiteLineItemFragment on OrderLineItem{id quantity product{name usItemId imageInfo{thumbnailUrl}offerId isAlcohol}priceInfo{linePrice{...price}}}fragment SellerFragment on GroupSeller{id name isPro}fragment DigitalDeliveryFragment on DigitalDelivery{title name instructions{...textFragment}}fragment ShipmentFragment on Shipment{id trackingNumber isExternalTracking trackingUrl proofOfDelivery{photoUrl photoPreviewUrl showPreview}}fragment OrderGroupActionsFragment on OrderGroupActions{reorder edit track changeSlot checkin editDeliveryInstructions editPickupPerson editTip tip cancel enableTip{...orderActionFragment}enableEdit{...orderActionFragment}rescheduleTireInstall{...orderActionFragment}cancelTireInstall{...orderActionFragment}help viewCancellationDetails{...cancellationDetailsActionFragment}}fragment cancellationDetailsActionFragment on CancellationDetailsAction{label heading text{...textFragment}}fragment ODPGroupCategoryFragment on OrderCategory{type name subtext returnMessage substitutionsBanner{...textFragment}showExtendedSubstitutions actions{substitutions{message label type}nilPickReshop{message action{text url}}returnDetails viewCancellationDetails{...cancellationDetailsActionFragment}trackOnInHomeApp}banner{...textFragment}accordionState items{...orderLineItem}substitutions{...orderLineItem fulfilledItems{...orderLineItem}}returnInfo{...returnInfoFragment}}fragment ODPGroupFragment on OrderGroup{id fulfillmentType deliveryMessage deliveryAddress{fullName firstName lastName address{...addressFragment}}deliveryInstructions{text type typeText}deliveryPreferences{text{...textFragment}cta{...orderActionFragment}}editSubstitutionsCutOff status{statusType showStatusTracker message{...textFragment}notice helpCenterText{...textFragment}}itemCount isCategorized categories{...ODPGroupCategoryFragment}seller{id name isPro}shipment{id trackingNumber}actions{reorder edit track changeSlot checkin editDeliveryInstructions editPickupPerson tip cancel help enableTip{...orderActionFragment}enableEdit{...orderActionFragment}viewCancellationDetails{...cancellationDetailsActionFragment}enableInHome{...orderActionFragment}createGiftReceipt}cutOffTimestamp isEditSubstitutionsEligible isInHome giftDetails{recipientAddress{fullName}recipientEmail senderName giftMessage}donationDetails{...orderDonationDetails}}fragment returnInfoFragment on ReturnInfo{returnOrderId type refundPriceDetails{__typename...refundPriceDetailsFragment}refundMessage tierRefundMessage paymentMethods{__typename description cardType paymentType displayValues message{...textFragment}}actions{__typename generate scheduleOrModifyPickup{text url}reschedulePickup editPickupContact}shippingLabelUrl qrCodeImageUrl carriers{__typename id name}pickupCarrier pickupContact{nameAndAddress{fullName firstName lastName address{addressString city state postalCode addressLineOne addressLineTwo country}}phone}pickupConfirmationNumber bannerMessage{...textFragment}}fragment refundPriceDetailsFragment on RefundPriceDetails{subTotal{__typename...orderPriceDetailRowFragment}fees{__typename...orderPriceDetailRowFragment}discounts{__typename...orderPriceDetailRowFragment}taxTotal{__typename...orderPriceDetailRowFragment}grandTotal{__typename...orderPriceDetailRowFragment}}fragment orderPriceDetailRowFragment on OrderPriceDetailRow{label displayValue value info{__typename title message}}fragment addressFragment on OrderAddress{addressString addressLineOne addressLineTwo state postalCode city}fragment ODPPickupInfo on OrderGroup{pickupInstructions pickupPerson{...person}alternatePickupPerson{...person}store{id name address{...addressFragment}}}fragment person on OrderPickupPerson{firstName lastName email}fragment ODPTippingInfo on OrderGroup{addTipMessage{...textFragment}driver{...DriverFragment}tipping{min{...price}max{...price}suggested{...price}preselected}subtotal{...price}}fragment orderActionFragment on Action{text url}fragment orderCustomer on OrderCustomer{id firstName lastName email isGuest isEmailRegistered}fragment OrderFieldsFragment on Order{__typename id version type customer{...orderCustomer}displayId idBarcodeImageUrl(barWidth:3 barHeight:100) isFuelPurchase title shortTitle timezone tippableGroup{...OrderGroupFragment}amendableGroup{id changeSlotIterationsLeft cutOffTimestamp fulfillmentType deliveryAddress{fullName firstName lastName address{addressString addressLineOne addressLineTwo state postalCode city country}}isAmendInProgress}substitutionsBanner{heading subheading longSubheading}groups_2101{__typename...OrderGroupFragment...ODPGroupFragment...ODPPickupInfo...ODPTippingInfo}multiboxBundles{...orderLineItem}itemCancelReasons{__typename...cancelReason}groupCancelReasons{__typename...cancelReason}priceDetails{__typename subTotal{__typename...priceDetailFragment}taxTotal{__typename...priceDetailFragment}grandTotal{__typename...priceDetailFragment}authorizationAmount{__typename...priceDetailFragment}fees{__typename...priceDetailFragment}discounts{__typename...priceDetailFragment}minimumThreshold{__typename...price}belowMinimumFee{__typename...priceDetailFragment}driverTip{__typename...priceDetailFragment}donations{__typename...priceDetailFragment}}paymentMethods{__typename description cardType paymentType displayValues message{...textFragment}actions{connectToCapitalOne{...orderActionFragment}visitAffirm{...orderActionFragment}}}actions{__typename return pendingReturn cancel startReturn{...orderActionFragment}reorder}banners{...textFragment}}","variables":{"orderId":"2842234117641","emailAddress":"jasf222@gmail.com"}}' \
  --compressed`
 
for (( i=0; i<=4; i++ ))
do
  if [[ $curl39 =~ "error"  || $curl39 =~ "blocked" ]]; then
    echo "Lỗi email số 39"
    indexOrder39=`echo error`
    break
  elif [[ `echo $curl39 | jq '.data.guestOrder.groups_2101['${i[@]}'].items[0].product.usItemId'` == '"38444962"' ]]; then
    indexOrder39=`echo $i`
    indexItem39=`echo 0`
  elif [[ `echo $curl39 | jq '.data.guestOrder.groups_2101['${i[@]}'].items[1].product.usItemId'` == '"38444962"' ]]; then
    indexOrder39=`echo $i`
    indexItem39=`echo 1`
  elif [[ `echo $curl39 | jq '.data.guestOrder.groups_2101['${i[@]}'].items[2].product.usItemId'` == '"38444962"' ]]; then
    indexOrder39=`echo $i`
    indexItem39=`echo 2`
  elif [[ `echo $curl39 | jq '.data.guestOrder.groups_2101['${i[@]}'].items[3].product.usItemId'` == '"38444962"' ]]; then
    indexOrder39=`echo $i`
    indexItem39=`echo 3`
  fi
done

if [[ $indexOrder39 != "error" ]]; then
echo $curl39 | jq '.data.guestOrder.id' >> track-OrderID.txt
echo $curl39 | jq '.data.guestOrder.customer.email' >> track-email.txt
echo $curl39 | jq '.data.guestOrder.groups_2101['$indexOrder39'].items['$indexItem39'].product.usItemId' >> track-usItemId.txt
echo $curl39 | jq '.data.guestOrder.groups_2101['$indexOrder39'].items['$indexItem39'].priceInfo.linePrice.value' >> track-priceValue.txt
echo $curl39 | jq '.data.guestOrder.groups_2101['$indexOrder39'].deliveryAddress.fullName' >> track-fullName.txt
echo $curl39 | jq '.data.guestOrder.groups_2101['$indexOrder39'].deliveryAddress.address.addressString' >> track-address.txt
echo $curl39 | jq '.data.guestOrder.groups_2101['$indexOrder39'].status.message.parts[].text' >> track-status.txt
echo $curl39 | jq '.data.guestOrder.groups_2101['$indexOrder39'].shipment.trackingNumber' >> track-number.txt
echo $curl39 | jq '.data.guestOrder.groups_2101['$indexOrder39'].shipment.trackingUrl' >> track-url.txt
fi

curl40=`curl 'https://www.walmart.com/orchestra/home/graphql' \
  -H 'authority: www.walmart.com' \
  -H 'sec-ch-ua: " Not A;Brand";v="99", "Chromium";v="96", "Microsoft Edge";v="96"' \
  -H 'x-o-platform: rweb' \
  -H 'dnt: 1' \
  -H 'x-o-correlation-id: wrvYiSFTlAmd8j7a8DDmpuyOpCN_heAnwM3v' \
  -H 'device_profile_ref_id: _s1F3NO8Y2JjaBUKPDcY4iFDWiIl9CyqiJjf' \
  -H 'x-latency-trace: 1' \
  -H 'wm_mp: true' \
  -H 'x-o-market: us' \
  -H 'x-o-platform-version: main-253-ebbb47' \
  -H 'x-o-gql-query: query getGuestOrder' \
  -H 'wm_page_url: https://www.walmart.com/orders' \
  -H 'x-apollo-operation-name: getGuestOrder' \
  -H 'sec-ch-ua-platform: "macOS"' \
  -H 'sec-ch-ua-mobile: ?0' \
  -H 'user-agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/96.0.4664.110 Safari/537.36 Edg/96.0.1054.62' \
  -H 'x-o-segment: oaoh' \
  -H 'content-type: application/json' \
  -H 'accept: application/json' \
  -H 'x-enable-server-timing: 1' \
  -H 'x-o-ccm: server' \
  -H 'wm_qos.correlation_id: wrvYiSFTlAmd8j7a8DDmpuyOpCN_heAnwM3v' \
  -H 'origin: https://www.walmart.com' \
  -H 'sec-fetch-site: same-origin' \
  -H 'sec-fetch-mode: cors' \
  -H 'sec-fetch-dest: empty' \
  -H 'referer: https://www.walmart.com/orders' \
  -H 'accept-language: vi' \
  --data-raw $'{"query":"query getGuestOrder($orderId:ID\u0021 $emailAddress:String\u0021){guestOrder(input:{id:$orderId emailAddress:$emailAddress}){...OrderFieldsFragment}}fragment cancelReason on OrderCancelReason{__typename subReasonCode subDescription}fragment priceDetailFragment on OrderPriceDetailRow{label value displayValue info{title message}rowInfo{...orderPriceDetailRowInfo}}fragment orderPriceDetailRowInfo on OrderPriceDetailRowInfo{title message{...textFragment}}fragment price on Price{displayValue value}fragment variants on MapEntry{name value}fragment OrderAddOn on OrderAddOn{lineId uniqueLineId productInfo{name usItemId offerId}quantityString quantityLabel type fulfillmentInstructions{...textFragment}actions{manageProtectionPlan{...orderActionFragment}cancel}priceInfo{linePrice{...price}}quantity isActive}fragment orderDonationDetails on OrderDonationDetails{message{...textFragment}emailReceipt emailReceiptToken status{...textFragment}errorStatus}fragment orderLineItem on OrderLineItem{id uniqueId actions{contactSeller cancel addToCart configureCake reviewItem resendEGiftCardToken protectionPlan{...orderActionFragment}manageProtectionPlan{...orderActionFragment}}isGift digitalDeliveryMessage quantity quantityString quantityLabel isSubstitutionSelected fulfilledItems{id quantityString priceInfo{itemPrice{value}}product{usItemId name}}isReturnable returnEligibilityMessage product{name usItemId imageInfo{thumbnailUrl}canonicalUrl offerId sellerId sellerName hasSellerBadge seller{sellerId name}orderLimit orderMinLimit weightIncrement salesUnit salesUnitType isSubstitutionEligible isAlcohol}reshop{reshopMessage isShippingAvailable minPromiseDate maxPromiseDate}selectedVariants{...variants}variantAdditionalInfo{parts{text nativeAction}}priceInfo{priceDisplayCodes{showItemPrice priceDisplayCondition finalCostByWeight}itemPrice{...price}linePrice{...price}unitPrice{...price}preDiscountedLinePrice{...price}additionalLines{name value}}discounts{label labelText{...textFragment}}itemReviewed activationCodes{label code}protectionPlanMessage{...textFragment}showSeller isShippedByWalmart seller{id name isPro}digitalDeliveryPhoneNumber addOns{...OrderAddOn}multiboxBundleId}fragment DriverFragment on Driver{id firstName photoUrl}fragment OrderGroupFragment on OrderGroup{driver{...DriverFragment}deliveryDate fulfillmentType status{...OrderGroupStatusFragment}showSeller isShippedByWalmart seller{...SellerFragment}id itemCount items{...LiteLineItemFragment}pickupPerson{firstName lastName email}accessPointId shipment{...ShipmentFragment}returnEligibilityMessage actions{...OrderGroupActionsFragment}recipientEmailAddress digitalDelivery{...DigitalDeliveryFragment}tireInstallationReservation{status extraText}}fragment OrderGroupStatusFragment on OrderGroupStatus{statusType showStatusTracker statusTracker{status label isCurrent}message{...textFragment}subtext subMessage{...textFragment}notice helpCenterText{...textFragment}}fragment textFragment on Text{parts{bold url text nativeAction lineBreak}}fragment LiteLineItemFragment on OrderLineItem{id quantity product{name usItemId imageInfo{thumbnailUrl}offerId isAlcohol}priceInfo{linePrice{...price}}}fragment SellerFragment on GroupSeller{id name isPro}fragment DigitalDeliveryFragment on DigitalDelivery{title name instructions{...textFragment}}fragment ShipmentFragment on Shipment{id trackingNumber isExternalTracking trackingUrl proofOfDelivery{photoUrl photoPreviewUrl showPreview}}fragment OrderGroupActionsFragment on OrderGroupActions{reorder edit track changeSlot checkin editDeliveryInstructions editPickupPerson editTip tip cancel enableTip{...orderActionFragment}enableEdit{...orderActionFragment}rescheduleTireInstall{...orderActionFragment}cancelTireInstall{...orderActionFragment}help viewCancellationDetails{...cancellationDetailsActionFragment}}fragment cancellationDetailsActionFragment on CancellationDetailsAction{label heading text{...textFragment}}fragment ODPGroupCategoryFragment on OrderCategory{type name subtext returnMessage substitutionsBanner{...textFragment}showExtendedSubstitutions actions{substitutions{message label type}nilPickReshop{message action{text url}}returnDetails viewCancellationDetails{...cancellationDetailsActionFragment}trackOnInHomeApp}banner{...textFragment}accordionState items{...orderLineItem}substitutions{...orderLineItem fulfilledItems{...orderLineItem}}returnInfo{...returnInfoFragment}}fragment ODPGroupFragment on OrderGroup{id fulfillmentType deliveryMessage deliveryAddress{fullName firstName lastName address{...addressFragment}}deliveryInstructions{text type typeText}deliveryPreferences{text{...textFragment}cta{...orderActionFragment}}editSubstitutionsCutOff status{statusType showStatusTracker message{...textFragment}notice helpCenterText{...textFragment}}itemCount isCategorized categories{...ODPGroupCategoryFragment}seller{id name isPro}shipment{id trackingNumber}actions{reorder edit track changeSlot checkin editDeliveryInstructions editPickupPerson tip cancel help enableTip{...orderActionFragment}enableEdit{...orderActionFragment}viewCancellationDetails{...cancellationDetailsActionFragment}enableInHome{...orderActionFragment}createGiftReceipt}cutOffTimestamp isEditSubstitutionsEligible isInHome giftDetails{recipientAddress{fullName}recipientEmail senderName giftMessage}donationDetails{...orderDonationDetails}}fragment returnInfoFragment on ReturnInfo{returnOrderId type refundPriceDetails{__typename...refundPriceDetailsFragment}refundMessage tierRefundMessage paymentMethods{__typename description cardType paymentType displayValues message{...textFragment}}actions{__typename generate scheduleOrModifyPickup{text url}reschedulePickup editPickupContact}shippingLabelUrl qrCodeImageUrl carriers{__typename id name}pickupCarrier pickupContact{nameAndAddress{fullName firstName lastName address{addressString city state postalCode addressLineOne addressLineTwo country}}phone}pickupConfirmationNumber bannerMessage{...textFragment}}fragment refundPriceDetailsFragment on RefundPriceDetails{subTotal{__typename...orderPriceDetailRowFragment}fees{__typename...orderPriceDetailRowFragment}discounts{__typename...orderPriceDetailRowFragment}taxTotal{__typename...orderPriceDetailRowFragment}grandTotal{__typename...orderPriceDetailRowFragment}}fragment orderPriceDetailRowFragment on OrderPriceDetailRow{label displayValue value info{__typename title message}}fragment addressFragment on OrderAddress{addressString addressLineOne addressLineTwo state postalCode city}fragment ODPPickupInfo on OrderGroup{pickupInstructions pickupPerson{...person}alternatePickupPerson{...person}store{id name address{...addressFragment}}}fragment person on OrderPickupPerson{firstName lastName email}fragment ODPTippingInfo on OrderGroup{addTipMessage{...textFragment}driver{...DriverFragment}tipping{min{...price}max{...price}suggested{...price}preselected}subtotal{...price}}fragment orderActionFragment on Action{text url}fragment orderCustomer on OrderCustomer{id firstName lastName email isGuest isEmailRegistered}fragment OrderFieldsFragment on Order{__typename id version type customer{...orderCustomer}displayId idBarcodeImageUrl(barWidth:3 barHeight:100) isFuelPurchase title shortTitle timezone tippableGroup{...OrderGroupFragment}amendableGroup{id changeSlotIterationsLeft cutOffTimestamp fulfillmentType deliveryAddress{fullName firstName lastName address{addressString addressLineOne addressLineTwo state postalCode city country}}isAmendInProgress}substitutionsBanner{heading subheading longSubheading}groups_2101{__typename...OrderGroupFragment...ODPGroupFragment...ODPPickupInfo...ODPTippingInfo}multiboxBundles{...orderLineItem}itemCancelReasons{__typename...cancelReason}groupCancelReasons{__typename...cancelReason}priceDetails{__typename subTotal{__typename...priceDetailFragment}taxTotal{__typename...priceDetailFragment}grandTotal{__typename...priceDetailFragment}authorizationAmount{__typename...priceDetailFragment}fees{__typename...priceDetailFragment}discounts{__typename...priceDetailFragment}minimumThreshold{__typename...price}belowMinimumFee{__typename...priceDetailFragment}driverTip{__typename...priceDetailFragment}donations{__typename...priceDetailFragment}}paymentMethods{__typename description cardType paymentType displayValues message{...textFragment}actions{connectToCapitalOne{...orderActionFragment}visitAffirm{...orderActionFragment}}}actions{__typename return pendingReturn cancel startReturn{...orderActionFragment}reorder}banners{...textFragment}}","variables":{"orderId":"2832232547555","emailAddress":"jvv1313@yahoo.com"}}' \
  --compressed`
 
for (( i=0; i<=4; i++ ))
do
  if [[ $curl40 =~ "error"  || $curl40 =~ "blocked" ]]; then
    echo "Lỗi email số 40"
    indexOrder40=`echo error`
    break
  elif [[ `echo $curl40 | jq '.data.guestOrder.groups_2101['${i[@]}'].items[0].product.usItemId'` == '"54315959"' ]]; then
    indexOrder40=`echo $i`
    indexItem40=`echo 0`
  elif [[ `echo $curl40 | jq '.data.guestOrder.groups_2101['${i[@]}'].items[1].product.usItemId'` == '"54315959"' ]]; then
    indexOrder40=`echo $i`
    indexItem40=`echo 1`
  elif [[ `echo $curl40 | jq '.data.guestOrder.groups_2101['${i[@]}'].items[2].product.usItemId'` == '"54315959"' ]]; then
    indexOrder40=`echo $i`
    indexItem40=`echo 2`
  elif [[ `echo $curl40 | jq '.data.guestOrder.groups_2101['${i[@]}'].items[3].product.usItemId'` == '"54315959"' ]]; then
    indexOrder40=`echo $i`
    indexItem40=`echo 3`
  fi
done

if [[ $indexOrder40 != "error" ]]; then
echo $curl40 | jq '.data.guestOrder.id' >> track-OrderID.txt
echo $curl40 | jq '.data.guestOrder.customer.email' >> track-email.txt
echo $curl40 | jq '.data.guestOrder.groups_2101['$indexOrder40'].items['$indexItem40'].product.usItemId' >> track-usItemId.txt
echo $curl40 | jq '.data.guestOrder.groups_2101['$indexOrder40'].items['$indexItem40'].priceInfo.linePrice.value' >> track-priceValue.txt
echo $curl40 | jq '.data.guestOrder.groups_2101['$indexOrder40'].deliveryAddress.fullName' >> track-fullName.txt
echo $curl40 | jq '.data.guestOrder.groups_2101['$indexOrder40'].deliveryAddress.address.addressString' >> track-address.txt
echo $curl40 | jq '.data.guestOrder.groups_2101['$indexOrder40'].status.message.parts[].text' >> track-status.txt
echo $curl40 | jq '.data.guestOrder.groups_2101['$indexOrder40'].shipment.trackingNumber' >> track-number.txt
echo $curl40 | jq '.data.guestOrder.groups_2101['$indexOrder40'].shipment.trackingUrl' >> track-url.txt
fi

curl41=`curl 'https://www.walmart.com/orchestra/home/graphql' \
  -H 'authority: www.walmart.com' \
  -H 'sec-ch-ua: " Not A;Brand";v="99", "Chromium";v="96", "Microsoft Edge";v="96"' \
  -H 'x-o-platform: rweb' \
  -H 'dnt: 1' \
  -H 'x-o-correlation-id: wrvYiSFTlAmd8j7a8DDmpuyOpCN_heAnwM3v' \
  -H 'device_profile_ref_id: _s1F3NO8Y2JjaBUKPDcY4iFDWiIl9CyqiJjf' \
  -H 'x-latency-trace: 1' \
  -H 'wm_mp: true' \
  -H 'x-o-market: us' \
  -H 'x-o-platform-version: main-253-ebbb47' \
  -H 'x-o-gql-query: query getGuestOrder' \
  -H 'wm_page_url: https://www.walmart.com/orders' \
  -H 'x-apollo-operation-name: getGuestOrder' \
  -H 'sec-ch-ua-platform: "macOS"' \
  -H 'sec-ch-ua-mobile: ?0' \
  -H 'user-agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/96.0.4664.110 Safari/537.36 Edg/96.0.1054.62' \
  -H 'x-o-segment: oaoh' \
  -H 'content-type: application/json' \
  -H 'accept: application/json' \
  -H 'x-enable-server-timing: 1' \
  -H 'x-o-ccm: server' \
  -H 'wm_qos.correlation_id: wrvYiSFTlAmd8j7a8DDmpuyOpCN_heAnwM3v' \
  -H 'origin: https://www.walmart.com' \
  -H 'sec-fetch-site: same-origin' \
  -H 'sec-fetch-mode: cors' \
  -H 'sec-fetch-dest: empty' \
  -H 'referer: https://www.walmart.com/orders' \
  -H 'accept-language: vi' \
  --data-raw $'{"query":"query getGuestOrder($orderId:ID\u0021 $emailAddress:String\u0021){guestOrder(input:{id:$orderId emailAddress:$emailAddress}){...OrderFieldsFragment}}fragment cancelReason on OrderCancelReason{__typename subReasonCode subDescription}fragment priceDetailFragment on OrderPriceDetailRow{label value displayValue info{title message}rowInfo{...orderPriceDetailRowInfo}}fragment orderPriceDetailRowInfo on OrderPriceDetailRowInfo{title message{...textFragment}}fragment price on Price{displayValue value}fragment variants on MapEntry{name value}fragment OrderAddOn on OrderAddOn{lineId uniqueLineId productInfo{name usItemId offerId}quantityString quantityLabel type fulfillmentInstructions{...textFragment}actions{manageProtectionPlan{...orderActionFragment}cancel}priceInfo{linePrice{...price}}quantity isActive}fragment orderDonationDetails on OrderDonationDetails{message{...textFragment}emailReceipt emailReceiptToken status{...textFragment}errorStatus}fragment orderLineItem on OrderLineItem{id uniqueId actions{contactSeller cancel addToCart configureCake reviewItem resendEGiftCardToken protectionPlan{...orderActionFragment}manageProtectionPlan{...orderActionFragment}}isGift digitalDeliveryMessage quantity quantityString quantityLabel isSubstitutionSelected fulfilledItems{id quantityString priceInfo{itemPrice{value}}product{usItemId name}}isReturnable returnEligibilityMessage product{name usItemId imageInfo{thumbnailUrl}canonicalUrl offerId sellerId sellerName hasSellerBadge seller{sellerId name}orderLimit orderMinLimit weightIncrement salesUnit salesUnitType isSubstitutionEligible isAlcohol}reshop{reshopMessage isShippingAvailable minPromiseDate maxPromiseDate}selectedVariants{...variants}variantAdditionalInfo{parts{text nativeAction}}priceInfo{priceDisplayCodes{showItemPrice priceDisplayCondition finalCostByWeight}itemPrice{...price}linePrice{...price}unitPrice{...price}preDiscountedLinePrice{...price}additionalLines{name value}}discounts{label labelText{...textFragment}}itemReviewed activationCodes{label code}protectionPlanMessage{...textFragment}showSeller isShippedByWalmart seller{id name isPro}digitalDeliveryPhoneNumber addOns{...OrderAddOn}multiboxBundleId}fragment DriverFragment on Driver{id firstName photoUrl}fragment OrderGroupFragment on OrderGroup{driver{...DriverFragment}deliveryDate fulfillmentType status{...OrderGroupStatusFragment}showSeller isShippedByWalmart seller{...SellerFragment}id itemCount items{...LiteLineItemFragment}pickupPerson{firstName lastName email}accessPointId shipment{...ShipmentFragment}returnEligibilityMessage actions{...OrderGroupActionsFragment}recipientEmailAddress digitalDelivery{...DigitalDeliveryFragment}tireInstallationReservation{status extraText}}fragment OrderGroupStatusFragment on OrderGroupStatus{statusType showStatusTracker statusTracker{status label isCurrent}message{...textFragment}subtext subMessage{...textFragment}notice helpCenterText{...textFragment}}fragment textFragment on Text{parts{bold url text nativeAction lineBreak}}fragment LiteLineItemFragment on OrderLineItem{id quantity product{name usItemId imageInfo{thumbnailUrl}offerId isAlcohol}priceInfo{linePrice{...price}}}fragment SellerFragment on GroupSeller{id name isPro}fragment DigitalDeliveryFragment on DigitalDelivery{title name instructions{...textFragment}}fragment ShipmentFragment on Shipment{id trackingNumber isExternalTracking trackingUrl proofOfDelivery{photoUrl photoPreviewUrl showPreview}}fragment OrderGroupActionsFragment on OrderGroupActions{reorder edit track changeSlot checkin editDeliveryInstructions editPickupPerson editTip tip cancel enableTip{...orderActionFragment}enableEdit{...orderActionFragment}rescheduleTireInstall{...orderActionFragment}cancelTireInstall{...orderActionFragment}help viewCancellationDetails{...cancellationDetailsActionFragment}}fragment cancellationDetailsActionFragment on CancellationDetailsAction{label heading text{...textFragment}}fragment ODPGroupCategoryFragment on OrderCategory{type name subtext returnMessage substitutionsBanner{...textFragment}showExtendedSubstitutions actions{substitutions{message label type}nilPickReshop{message action{text url}}returnDetails viewCancellationDetails{...cancellationDetailsActionFragment}trackOnInHomeApp}banner{...textFragment}accordionState items{...orderLineItem}substitutions{...orderLineItem fulfilledItems{...orderLineItem}}returnInfo{...returnInfoFragment}}fragment ODPGroupFragment on OrderGroup{id fulfillmentType deliveryMessage deliveryAddress{fullName firstName lastName address{...addressFragment}}deliveryInstructions{text type typeText}deliveryPreferences{text{...textFragment}cta{...orderActionFragment}}editSubstitutionsCutOff status{statusType showStatusTracker message{...textFragment}notice helpCenterText{...textFragment}}itemCount isCategorized categories{...ODPGroupCategoryFragment}seller{id name isPro}shipment{id trackingNumber}actions{reorder edit track changeSlot checkin editDeliveryInstructions editPickupPerson tip cancel help enableTip{...orderActionFragment}enableEdit{...orderActionFragment}viewCancellationDetails{...cancellationDetailsActionFragment}enableInHome{...orderActionFragment}createGiftReceipt}cutOffTimestamp isEditSubstitutionsEligible isInHome giftDetails{recipientAddress{fullName}recipientEmail senderName giftMessage}donationDetails{...orderDonationDetails}}fragment returnInfoFragment on ReturnInfo{returnOrderId type refundPriceDetails{__typename...refundPriceDetailsFragment}refundMessage tierRefundMessage paymentMethods{__typename description cardType paymentType displayValues message{...textFragment}}actions{__typename generate scheduleOrModifyPickup{text url}reschedulePickup editPickupContact}shippingLabelUrl qrCodeImageUrl carriers{__typename id name}pickupCarrier pickupContact{nameAndAddress{fullName firstName lastName address{addressString city state postalCode addressLineOne addressLineTwo country}}phone}pickupConfirmationNumber bannerMessage{...textFragment}}fragment refundPriceDetailsFragment on RefundPriceDetails{subTotal{__typename...orderPriceDetailRowFragment}fees{__typename...orderPriceDetailRowFragment}discounts{__typename...orderPriceDetailRowFragment}taxTotal{__typename...orderPriceDetailRowFragment}grandTotal{__typename...orderPriceDetailRowFragment}}fragment orderPriceDetailRowFragment on OrderPriceDetailRow{label displayValue value info{__typename title message}}fragment addressFragment on OrderAddress{addressString addressLineOne addressLineTwo state postalCode city}fragment ODPPickupInfo on OrderGroup{pickupInstructions pickupPerson{...person}alternatePickupPerson{...person}store{id name address{...addressFragment}}}fragment person on OrderPickupPerson{firstName lastName email}fragment ODPTippingInfo on OrderGroup{addTipMessage{...textFragment}driver{...DriverFragment}tipping{min{...price}max{...price}suggested{...price}preselected}subtotal{...price}}fragment orderActionFragment on Action{text url}fragment orderCustomer on OrderCustomer{id firstName lastName email isGuest isEmailRegistered}fragment OrderFieldsFragment on Order{__typename id version type customer{...orderCustomer}displayId idBarcodeImageUrl(barWidth:3 barHeight:100) isFuelPurchase title shortTitle timezone tippableGroup{...OrderGroupFragment}amendableGroup{id changeSlotIterationsLeft cutOffTimestamp fulfillmentType deliveryAddress{fullName firstName lastName address{addressString addressLineOne addressLineTwo state postalCode city country}}isAmendInProgress}substitutionsBanner{heading subheading longSubheading}groups_2101{__typename...OrderGroupFragment...ODPGroupFragment...ODPPickupInfo...ODPTippingInfo}multiboxBundles{...orderLineItem}itemCancelReasons{__typename...cancelReason}groupCancelReasons{__typename...cancelReason}priceDetails{__typename subTotal{__typename...priceDetailFragment}taxTotal{__typename...priceDetailFragment}grandTotal{__typename...priceDetailFragment}authorizationAmount{__typename...priceDetailFragment}fees{__typename...priceDetailFragment}discounts{__typename...priceDetailFragment}minimumThreshold{__typename...price}belowMinimumFee{__typename...priceDetailFragment}driverTip{__typename...priceDetailFragment}donations{__typename...priceDetailFragment}}paymentMethods{__typename description cardType paymentType displayValues message{...textFragment}actions{connectToCapitalOne{...orderActionFragment}visitAffirm{...orderActionFragment}}}actions{__typename return pendingReturn cancel startReturn{...orderActionFragment}reorder}banners{...textFragment}}","variables":{"orderId":"2832234651766","emailAddress":"icebreakers42theman@gmail.com"}}' \
  --compressed`
 
for (( i=0; i<=4; i++ ))
do
  if [[ $curl41 =~ "error"  || $curl41 =~ "blocked" ]]; then
    echo "Lỗi email số 41"
    indexOrder41=`echo error`
    break
  elif [[ `echo $curl41 | jq '.data.guestOrder.groups_2101['${i[@]}'].items[0].product.usItemId'` == '"240828726"' ]]; then
    indexOrder41=`echo $i`
    indexItem41=`echo 0`
  elif [[ `echo $curl41 | jq '.data.guestOrder.groups_2101['${i[@]}'].items[1].product.usItemId'` == '"240828726"' ]]; then
    indexOrder41=`echo $i`
    indexItem41=`echo 1`
  elif [[ `echo $curl41 | jq '.data.guestOrder.groups_2101['${i[@]}'].items[2].product.usItemId'` == '"240828726"' ]]; then
    indexOrder41=`echo $i`
    indexItem41=`echo 2`
  elif [[ `echo $curl41 | jq '.data.guestOrder.groups_2101['${i[@]}'].items[3].product.usItemId'` == '"240828726"' ]]; then
    indexOrder41=`echo $i`
    indexItem41=`echo 3`
  fi
done

if [[ $indexOrder41 != "error" ]]; then
echo $curl41 | jq '.data.guestOrder.id' >> track-OrderID.txt
echo $curl41 | jq '.data.guestOrder.customer.email' >> track-email.txt
echo $curl41 | jq '.data.guestOrder.groups_2101['$indexOrder41'].items['$indexItem41'].product.usItemId' >> track-usItemId.txt
echo $curl41 | jq '.data.guestOrder.groups_2101['$indexOrder41'].items['$indexItem41'].priceInfo.linePrice.value' >> track-priceValue.txt
echo $curl41 | jq '.data.guestOrder.groups_2101['$indexOrder41'].deliveryAddress.fullName' >> track-fullName.txt
echo $curl41 | jq '.data.guestOrder.groups_2101['$indexOrder41'].deliveryAddress.address.addressString' >> track-address.txt
echo $curl41 | jq '.data.guestOrder.groups_2101['$indexOrder41'].status.message.parts[].text' >> track-status.txt
echo $curl41 | jq '.data.guestOrder.groups_2101['$indexOrder41'].shipment.trackingNumber' >> track-number.txt
echo $curl41 | jq '.data.guestOrder.groups_2101['$indexOrder41'].shipment.trackingUrl' >> track-url.txt
fi

curl42=`curl 'https://www.walmart.com/orchestra/home/graphql' \
  -H 'authority: www.walmart.com' \
  -H 'sec-ch-ua: " Not A;Brand";v="99", "Chromium";v="96", "Microsoft Edge";v="96"' \
  -H 'x-o-platform: rweb' \
  -H 'dnt: 1' \
  -H 'x-o-correlation-id: wrvYiSFTlAmd8j7a8DDmpuyOpCN_heAnwM3v' \
  -H 'device_profile_ref_id: _s1F3NO8Y2JjaBUKPDcY4iFDWiIl9CyqiJjf' \
  -H 'x-latency-trace: 1' \
  -H 'wm_mp: true' \
  -H 'x-o-market: us' \
  -H 'x-o-platform-version: main-253-ebbb47' \
  -H 'x-o-gql-query: query getGuestOrder' \
  -H 'wm_page_url: https://www.walmart.com/orders' \
  -H 'x-apollo-operation-name: getGuestOrder' \
  -H 'sec-ch-ua-platform: "macOS"' \
  -H 'sec-ch-ua-mobile: ?0' \
  -H 'user-agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/96.0.4664.110 Safari/537.36 Edg/96.0.1054.62' \
  -H 'x-o-segment: oaoh' \
  -H 'content-type: application/json' \
  -H 'accept: application/json' \
  -H 'x-enable-server-timing: 1' \
  -H 'x-o-ccm: server' \
  -H 'wm_qos.correlation_id: wrvYiSFTlAmd8j7a8DDmpuyOpCN_heAnwM3v' \
  -H 'origin: https://www.walmart.com' \
  -H 'sec-fetch-site: same-origin' \
  -H 'sec-fetch-mode: cors' \
  -H 'sec-fetch-dest: empty' \
  -H 'referer: https://www.walmart.com/orders' \
  -H 'accept-language: vi' \
  --data-raw $'{"query":"query getGuestOrder($orderId:ID\u0021 $emailAddress:String\u0021){guestOrder(input:{id:$orderId emailAddress:$emailAddress}){...OrderFieldsFragment}}fragment cancelReason on OrderCancelReason{__typename subReasonCode subDescription}fragment priceDetailFragment on OrderPriceDetailRow{label value displayValue info{title message}rowInfo{...orderPriceDetailRowInfo}}fragment orderPriceDetailRowInfo on OrderPriceDetailRowInfo{title message{...textFragment}}fragment price on Price{displayValue value}fragment variants on MapEntry{name value}fragment OrderAddOn on OrderAddOn{lineId uniqueLineId productInfo{name usItemId offerId}quantityString quantityLabel type fulfillmentInstructions{...textFragment}actions{manageProtectionPlan{...orderActionFragment}cancel}priceInfo{linePrice{...price}}quantity isActive}fragment orderDonationDetails on OrderDonationDetails{message{...textFragment}emailReceipt emailReceiptToken status{...textFragment}errorStatus}fragment orderLineItem on OrderLineItem{id uniqueId actions{contactSeller cancel addToCart configureCake reviewItem resendEGiftCardToken protectionPlan{...orderActionFragment}manageProtectionPlan{...orderActionFragment}}isGift digitalDeliveryMessage quantity quantityString quantityLabel isSubstitutionSelected fulfilledItems{id quantityString priceInfo{itemPrice{value}}product{usItemId name}}isReturnable returnEligibilityMessage product{name usItemId imageInfo{thumbnailUrl}canonicalUrl offerId sellerId sellerName hasSellerBadge seller{sellerId name}orderLimit orderMinLimit weightIncrement salesUnit salesUnitType isSubstitutionEligible isAlcohol}reshop{reshopMessage isShippingAvailable minPromiseDate maxPromiseDate}selectedVariants{...variants}variantAdditionalInfo{parts{text nativeAction}}priceInfo{priceDisplayCodes{showItemPrice priceDisplayCondition finalCostByWeight}itemPrice{...price}linePrice{...price}unitPrice{...price}preDiscountedLinePrice{...price}additionalLines{name value}}discounts{label labelText{...textFragment}}itemReviewed activationCodes{label code}protectionPlanMessage{...textFragment}showSeller isShippedByWalmart seller{id name isPro}digitalDeliveryPhoneNumber addOns{...OrderAddOn}multiboxBundleId}fragment DriverFragment on Driver{id firstName photoUrl}fragment OrderGroupFragment on OrderGroup{driver{...DriverFragment}deliveryDate fulfillmentType status{...OrderGroupStatusFragment}showSeller isShippedByWalmart seller{...SellerFragment}id itemCount items{...LiteLineItemFragment}pickupPerson{firstName lastName email}accessPointId shipment{...ShipmentFragment}returnEligibilityMessage actions{...OrderGroupActionsFragment}recipientEmailAddress digitalDelivery{...DigitalDeliveryFragment}tireInstallationReservation{status extraText}}fragment OrderGroupStatusFragment on OrderGroupStatus{statusType showStatusTracker statusTracker{status label isCurrent}message{...textFragment}subtext subMessage{...textFragment}notice helpCenterText{...textFragment}}fragment textFragment on Text{parts{bold url text nativeAction lineBreak}}fragment LiteLineItemFragment on OrderLineItem{id quantity product{name usItemId imageInfo{thumbnailUrl}offerId isAlcohol}priceInfo{linePrice{...price}}}fragment SellerFragment on GroupSeller{id name isPro}fragment DigitalDeliveryFragment on DigitalDelivery{title name instructions{...textFragment}}fragment ShipmentFragment on Shipment{id trackingNumber isExternalTracking trackingUrl proofOfDelivery{photoUrl photoPreviewUrl showPreview}}fragment OrderGroupActionsFragment on OrderGroupActions{reorder edit track changeSlot checkin editDeliveryInstructions editPickupPerson editTip tip cancel enableTip{...orderActionFragment}enableEdit{...orderActionFragment}rescheduleTireInstall{...orderActionFragment}cancelTireInstall{...orderActionFragment}help viewCancellationDetails{...cancellationDetailsActionFragment}}fragment cancellationDetailsActionFragment on CancellationDetailsAction{label heading text{...textFragment}}fragment ODPGroupCategoryFragment on OrderCategory{type name subtext returnMessage substitutionsBanner{...textFragment}showExtendedSubstitutions actions{substitutions{message label type}nilPickReshop{message action{text url}}returnDetails viewCancellationDetails{...cancellationDetailsActionFragment}trackOnInHomeApp}banner{...textFragment}accordionState items{...orderLineItem}substitutions{...orderLineItem fulfilledItems{...orderLineItem}}returnInfo{...returnInfoFragment}}fragment ODPGroupFragment on OrderGroup{id fulfillmentType deliveryMessage deliveryAddress{fullName firstName lastName address{...addressFragment}}deliveryInstructions{text type typeText}deliveryPreferences{text{...textFragment}cta{...orderActionFragment}}editSubstitutionsCutOff status{statusType showStatusTracker message{...textFragment}notice helpCenterText{...textFragment}}itemCount isCategorized categories{...ODPGroupCategoryFragment}seller{id name isPro}shipment{id trackingNumber}actions{reorder edit track changeSlot checkin editDeliveryInstructions editPickupPerson tip cancel help enableTip{...orderActionFragment}enableEdit{...orderActionFragment}viewCancellationDetails{...cancellationDetailsActionFragment}enableInHome{...orderActionFragment}createGiftReceipt}cutOffTimestamp isEditSubstitutionsEligible isInHome giftDetails{recipientAddress{fullName}recipientEmail senderName giftMessage}donationDetails{...orderDonationDetails}}fragment returnInfoFragment on ReturnInfo{returnOrderId type refundPriceDetails{__typename...refundPriceDetailsFragment}refundMessage tierRefundMessage paymentMethods{__typename description cardType paymentType displayValues message{...textFragment}}actions{__typename generate scheduleOrModifyPickup{text url}reschedulePickup editPickupContact}shippingLabelUrl qrCodeImageUrl carriers{__typename id name}pickupCarrier pickupContact{nameAndAddress{fullName firstName lastName address{addressString city state postalCode addressLineOne addressLineTwo country}}phone}pickupConfirmationNumber bannerMessage{...textFragment}}fragment refundPriceDetailsFragment on RefundPriceDetails{subTotal{__typename...orderPriceDetailRowFragment}fees{__typename...orderPriceDetailRowFragment}discounts{__typename...orderPriceDetailRowFragment}taxTotal{__typename...orderPriceDetailRowFragment}grandTotal{__typename...orderPriceDetailRowFragment}}fragment orderPriceDetailRowFragment on OrderPriceDetailRow{label displayValue value info{__typename title message}}fragment addressFragment on OrderAddress{addressString addressLineOne addressLineTwo state postalCode city}fragment ODPPickupInfo on OrderGroup{pickupInstructions pickupPerson{...person}alternatePickupPerson{...person}store{id name address{...addressFragment}}}fragment person on OrderPickupPerson{firstName lastName email}fragment ODPTippingInfo on OrderGroup{addTipMessage{...textFragment}driver{...DriverFragment}tipping{min{...price}max{...price}suggested{...price}preselected}subtotal{...price}}fragment orderActionFragment on Action{text url}fragment orderCustomer on OrderCustomer{id firstName lastName email isGuest isEmailRegistered}fragment OrderFieldsFragment on Order{__typename id version type customer{...orderCustomer}displayId idBarcodeImageUrl(barWidth:3 barHeight:100) isFuelPurchase title shortTitle timezone tippableGroup{...OrderGroupFragment}amendableGroup{id changeSlotIterationsLeft cutOffTimestamp fulfillmentType deliveryAddress{fullName firstName lastName address{addressString addressLineOne addressLineTwo state postalCode city country}}isAmendInProgress}substitutionsBanner{heading subheading longSubheading}groups_2101{__typename...OrderGroupFragment...ODPGroupFragment...ODPPickupInfo...ODPTippingInfo}multiboxBundles{...orderLineItem}itemCancelReasons{__typename...cancelReason}groupCancelReasons{__typename...cancelReason}priceDetails{__typename subTotal{__typename...priceDetailFragment}taxTotal{__typename...priceDetailFragment}grandTotal{__typename...priceDetailFragment}authorizationAmount{__typename...priceDetailFragment}fees{__typename...priceDetailFragment}discounts{__typename...priceDetailFragment}minimumThreshold{__typename...price}belowMinimumFee{__typename...priceDetailFragment}driverTip{__typename...priceDetailFragment}donations{__typename...priceDetailFragment}}paymentMethods{__typename description cardType paymentType displayValues message{...textFragment}actions{connectToCapitalOne{...orderActionFragment}visitAffirm{...orderActionFragment}}}actions{__typename return pendingReturn cancel startReturn{...orderActionFragment}reorder}banners{...textFragment}}","variables":{"orderId":"2832232939367","emailAddress":"kara_pinson@yahoo.com"}}' \
  --compressed`
 
for (( i=0; i<=4; i++ ))
do
  if [[ $curl42 =~ "error"  || $curl42 =~ "blocked" ]]; then
    echo "Lỗi email số 42"
    indexOrder42=`echo error`
    break
  elif [[ `echo $curl42 | jq '.data.guestOrder.groups_2101['${i[@]}'].items[0].product.usItemId'` == '"674470775"' ]]; then
    indexOrder42=`echo $i`
    indexItem42=`echo 0`
  elif [[ `echo $curl42 | jq '.data.guestOrder.groups_2101['${i[@]}'].items[1].product.usItemId'` == '"674470775"' ]]; then
    indexOrder42=`echo $i`
    indexItem42=`echo 1`
  elif [[ `echo $curl42 | jq '.data.guestOrder.groups_2101['${i[@]}'].items[2].product.usItemId'` == '"674470775"' ]]; then
    indexOrder42=`echo $i`
    indexItem42=`echo 2`
  elif [[ `echo $curl42 | jq '.data.guestOrder.groups_2101['${i[@]}'].items[3].product.usItemId'` == '"674470775"' ]]; then
    indexOrder42=`echo $i`
    indexItem42=`echo 3`
  fi
done

if [[ $indexOrder42 != "error" ]]; then
echo $curl42 | jq '.data.guestOrder.id' >> track-OrderID.txt
echo $curl42 | jq '.data.guestOrder.customer.email' >> track-email.txt
echo $curl42 | jq '.data.guestOrder.groups_2101['$indexOrder42'].items['$indexItem42'].product.usItemId' >> track-usItemId.txt
echo $curl42 | jq '.data.guestOrder.groups_2101['$indexOrder42'].items['$indexItem42'].priceInfo.linePrice.value' >> track-priceValue.txt
echo $curl42 | jq '.data.guestOrder.groups_2101['$indexOrder42'].deliveryAddress.fullName' >> track-fullName.txt
echo $curl42 | jq '.data.guestOrder.groups_2101['$indexOrder42'].deliveryAddress.address.addressString' >> track-address.txt
echo $curl42 | jq '.data.guestOrder.groups_2101['$indexOrder42'].status.message.parts[].text' >> track-status.txt
echo $curl42 | jq '.data.guestOrder.groups_2101['$indexOrder42'].shipment.trackingNumber' >> track-number.txt
echo $curl42 | jq '.data.guestOrder.groups_2101['$indexOrder42'].shipment.trackingUrl' >> track-url.txt
fi

curl43=`curl 'https://www.walmart.com/orchestra/home/graphql' \
  -H 'authority: www.walmart.com' \
  -H 'sec-ch-ua: " Not A;Brand";v="99", "Chromium";v="96", "Microsoft Edge";v="96"' \
  -H 'x-o-platform: rweb' \
  -H 'dnt: 1' \
  -H 'x-o-correlation-id: wrvYiSFTlAmd8j7a8DDmpuyOpCN_heAnwM3v' \
  -H 'device_profile_ref_id: _s1F3NO8Y2JjaBUKPDcY4iFDWiIl9CyqiJjf' \
  -H 'x-latency-trace: 1' \
  -H 'wm_mp: true' \
  -H 'x-o-market: us' \
  -H 'x-o-platform-version: main-253-ebbb47' \
  -H 'x-o-gql-query: query getGuestOrder' \
  -H 'wm_page_url: https://www.walmart.com/orders' \
  -H 'x-apollo-operation-name: getGuestOrder' \
  -H 'sec-ch-ua-platform: "macOS"' \
  -H 'sec-ch-ua-mobile: ?0' \
  -H 'user-agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/96.0.4664.110 Safari/537.36 Edg/96.0.1054.62' \
  -H 'x-o-segment: oaoh' \
  -H 'content-type: application/json' \
  -H 'accept: application/json' \
  -H 'x-enable-server-timing: 1' \
  -H 'x-o-ccm: server' \
  -H 'wm_qos.correlation_id: wrvYiSFTlAmd8j7a8DDmpuyOpCN_heAnwM3v' \
  -H 'origin: https://www.walmart.com' \
  -H 'sec-fetch-site: same-origin' \
  -H 'sec-fetch-mode: cors' \
  -H 'sec-fetch-dest: empty' \
  -H 'referer: https://www.walmart.com/orders' \
  -H 'accept-language: vi' \
  --data-raw $'{"query":"query getGuestOrder($orderId:ID\u0021 $emailAddress:String\u0021){guestOrder(input:{id:$orderId emailAddress:$emailAddress}){...OrderFieldsFragment}}fragment cancelReason on OrderCancelReason{__typename subReasonCode subDescription}fragment priceDetailFragment on OrderPriceDetailRow{label value displayValue info{title message}rowInfo{...orderPriceDetailRowInfo}}fragment orderPriceDetailRowInfo on OrderPriceDetailRowInfo{title message{...textFragment}}fragment price on Price{displayValue value}fragment variants on MapEntry{name value}fragment OrderAddOn on OrderAddOn{lineId uniqueLineId productInfo{name usItemId offerId}quantityString quantityLabel type fulfillmentInstructions{...textFragment}actions{manageProtectionPlan{...orderActionFragment}cancel}priceInfo{linePrice{...price}}quantity isActive}fragment orderDonationDetails on OrderDonationDetails{message{...textFragment}emailReceipt emailReceiptToken status{...textFragment}errorStatus}fragment orderLineItem on OrderLineItem{id uniqueId actions{contactSeller cancel addToCart configureCake reviewItem resendEGiftCardToken protectionPlan{...orderActionFragment}manageProtectionPlan{...orderActionFragment}}isGift digitalDeliveryMessage quantity quantityString quantityLabel isSubstitutionSelected fulfilledItems{id quantityString priceInfo{itemPrice{value}}product{usItemId name}}isReturnable returnEligibilityMessage product{name usItemId imageInfo{thumbnailUrl}canonicalUrl offerId sellerId sellerName hasSellerBadge seller{sellerId name}orderLimit orderMinLimit weightIncrement salesUnit salesUnitType isSubstitutionEligible isAlcohol}reshop{reshopMessage isShippingAvailable minPromiseDate maxPromiseDate}selectedVariants{...variants}variantAdditionalInfo{parts{text nativeAction}}priceInfo{priceDisplayCodes{showItemPrice priceDisplayCondition finalCostByWeight}itemPrice{...price}linePrice{...price}unitPrice{...price}preDiscountedLinePrice{...price}additionalLines{name value}}discounts{label labelText{...textFragment}}itemReviewed activationCodes{label code}protectionPlanMessage{...textFragment}showSeller isShippedByWalmart seller{id name isPro}digitalDeliveryPhoneNumber addOns{...OrderAddOn}multiboxBundleId}fragment DriverFragment on Driver{id firstName photoUrl}fragment OrderGroupFragment on OrderGroup{driver{...DriverFragment}deliveryDate fulfillmentType status{...OrderGroupStatusFragment}showSeller isShippedByWalmart seller{...SellerFragment}id itemCount items{...LiteLineItemFragment}pickupPerson{firstName lastName email}accessPointId shipment{...ShipmentFragment}returnEligibilityMessage actions{...OrderGroupActionsFragment}recipientEmailAddress digitalDelivery{...DigitalDeliveryFragment}tireInstallationReservation{status extraText}}fragment OrderGroupStatusFragment on OrderGroupStatus{statusType showStatusTracker statusTracker{status label isCurrent}message{...textFragment}subtext subMessage{...textFragment}notice helpCenterText{...textFragment}}fragment textFragment on Text{parts{bold url text nativeAction lineBreak}}fragment LiteLineItemFragment on OrderLineItem{id quantity product{name usItemId imageInfo{thumbnailUrl}offerId isAlcohol}priceInfo{linePrice{...price}}}fragment SellerFragment on GroupSeller{id name isPro}fragment DigitalDeliveryFragment on DigitalDelivery{title name instructions{...textFragment}}fragment ShipmentFragment on Shipment{id trackingNumber isExternalTracking trackingUrl proofOfDelivery{photoUrl photoPreviewUrl showPreview}}fragment OrderGroupActionsFragment on OrderGroupActions{reorder edit track changeSlot checkin editDeliveryInstructions editPickupPerson editTip tip cancel enableTip{...orderActionFragment}enableEdit{...orderActionFragment}rescheduleTireInstall{...orderActionFragment}cancelTireInstall{...orderActionFragment}help viewCancellationDetails{...cancellationDetailsActionFragment}}fragment cancellationDetailsActionFragment on CancellationDetailsAction{label heading text{...textFragment}}fragment ODPGroupCategoryFragment on OrderCategory{type name subtext returnMessage substitutionsBanner{...textFragment}showExtendedSubstitutions actions{substitutions{message label type}nilPickReshop{message action{text url}}returnDetails viewCancellationDetails{...cancellationDetailsActionFragment}trackOnInHomeApp}banner{...textFragment}accordionState items{...orderLineItem}substitutions{...orderLineItem fulfilledItems{...orderLineItem}}returnInfo{...returnInfoFragment}}fragment ODPGroupFragment on OrderGroup{id fulfillmentType deliveryMessage deliveryAddress{fullName firstName lastName address{...addressFragment}}deliveryInstructions{text type typeText}deliveryPreferences{text{...textFragment}cta{...orderActionFragment}}editSubstitutionsCutOff status{statusType showStatusTracker message{...textFragment}notice helpCenterText{...textFragment}}itemCount isCategorized categories{...ODPGroupCategoryFragment}seller{id name isPro}shipment{id trackingNumber}actions{reorder edit track changeSlot checkin editDeliveryInstructions editPickupPerson tip cancel help enableTip{...orderActionFragment}enableEdit{...orderActionFragment}viewCancellationDetails{...cancellationDetailsActionFragment}enableInHome{...orderActionFragment}createGiftReceipt}cutOffTimestamp isEditSubstitutionsEligible isInHome giftDetails{recipientAddress{fullName}recipientEmail senderName giftMessage}donationDetails{...orderDonationDetails}}fragment returnInfoFragment on ReturnInfo{returnOrderId type refundPriceDetails{__typename...refundPriceDetailsFragment}refundMessage tierRefundMessage paymentMethods{__typename description cardType paymentType displayValues message{...textFragment}}actions{__typename generate scheduleOrModifyPickup{text url}reschedulePickup editPickupContact}shippingLabelUrl qrCodeImageUrl carriers{__typename id name}pickupCarrier pickupContact{nameAndAddress{fullName firstName lastName address{addressString city state postalCode addressLineOne addressLineTwo country}}phone}pickupConfirmationNumber bannerMessage{...textFragment}}fragment refundPriceDetailsFragment on RefundPriceDetails{subTotal{__typename...orderPriceDetailRowFragment}fees{__typename...orderPriceDetailRowFragment}discounts{__typename...orderPriceDetailRowFragment}taxTotal{__typename...orderPriceDetailRowFragment}grandTotal{__typename...orderPriceDetailRowFragment}}fragment orderPriceDetailRowFragment on OrderPriceDetailRow{label displayValue value info{__typename title message}}fragment addressFragment on OrderAddress{addressString addressLineOne addressLineTwo state postalCode city}fragment ODPPickupInfo on OrderGroup{pickupInstructions pickupPerson{...person}alternatePickupPerson{...person}store{id name address{...addressFragment}}}fragment person on OrderPickupPerson{firstName lastName email}fragment ODPTippingInfo on OrderGroup{addTipMessage{...textFragment}driver{...DriverFragment}tipping{min{...price}max{...price}suggested{...price}preselected}subtotal{...price}}fragment orderActionFragment on Action{text url}fragment orderCustomer on OrderCustomer{id firstName lastName email isGuest isEmailRegistered}fragment OrderFieldsFragment on Order{__typename id version type customer{...orderCustomer}displayId idBarcodeImageUrl(barWidth:3 barHeight:100) isFuelPurchase title shortTitle timezone tippableGroup{...OrderGroupFragment}amendableGroup{id changeSlotIterationsLeft cutOffTimestamp fulfillmentType deliveryAddress{fullName firstName lastName address{addressString addressLineOne addressLineTwo state postalCode city country}}isAmendInProgress}substitutionsBanner{heading subheading longSubheading}groups_2101{__typename...OrderGroupFragment...ODPGroupFragment...ODPPickupInfo...ODPTippingInfo}multiboxBundles{...orderLineItem}itemCancelReasons{__typename...cancelReason}groupCancelReasons{__typename...cancelReason}priceDetails{__typename subTotal{__typename...priceDetailFragment}taxTotal{__typename...priceDetailFragment}grandTotal{__typename...priceDetailFragment}authorizationAmount{__typename...priceDetailFragment}fees{__typename...priceDetailFragment}discounts{__typename...priceDetailFragment}minimumThreshold{__typename...price}belowMinimumFee{__typename...priceDetailFragment}driverTip{__typename...priceDetailFragment}donations{__typename...priceDetailFragment}}paymentMethods{__typename description cardType paymentType displayValues message{...textFragment}actions{connectToCapitalOne{...orderActionFragment}visitAffirm{...orderActionFragment}}}actions{__typename return pendingReturn cancel startReturn{...orderActionFragment}reorder}banners{...textFragment}}","variables":{"orderId":"2822229790243","emailAddress":"tgaideski@yahoo.com"}}' \
  --compressed`
 
for (( i=0; i<=4; i++ ))
do
  if [[ $curl43 =~ "error"  || $curl43 =~ "blocked" ]]; then
    echo "Lỗi email số 43"
    indexOrder43=`echo error`
    break
  elif [[ `echo $curl43 | jq '.data.guestOrder.groups_2101['${i[@]}'].items[0].product.usItemId'` == '"265176340"' ]]; then
    indexOrder43=`echo $i`
    indexItem43=`echo 0`
  elif [[ `echo $curl43 | jq '.data.guestOrder.groups_2101['${i[@]}'].items[1].product.usItemId'` == '"265176340"' ]]; then
    indexOrder43=`echo $i`
    indexItem43=`echo 1`
  elif [[ `echo $curl43 | jq '.data.guestOrder.groups_2101['${i[@]}'].items[2].product.usItemId'` == '"265176340"' ]]; then
    indexOrder43=`echo $i`
    indexItem43=`echo 2`
  elif [[ `echo $curl43 | jq '.data.guestOrder.groups_2101['${i[@]}'].items[3].product.usItemId'` == '"265176340"' ]]; then
    indexOrder43=`echo $i`
    indexItem43=`echo 3`
  fi
done

if [[ $indexOrder43 != "error" ]]; then
echo $curl43 | jq '.data.guestOrder.id' >> track-OrderID.txt
echo $curl43 | jq '.data.guestOrder.customer.email' >> track-email.txt
echo $curl43 | jq '.data.guestOrder.groups_2101['$indexOrder43'].items['$indexItem43'].product.usItemId' >> track-usItemId.txt
echo $curl43 | jq '.data.guestOrder.groups_2101['$indexOrder43'].items['$indexItem43'].priceInfo.linePrice.value' >> track-priceValue.txt
echo $curl43 | jq '.data.guestOrder.groups_2101['$indexOrder43'].deliveryAddress.fullName' >> track-fullName.txt
echo $curl43 | jq '.data.guestOrder.groups_2101['$indexOrder43'].deliveryAddress.address.addressString' >> track-address.txt
echo $curl43 | jq '.data.guestOrder.groups_2101['$indexOrder43'].status.message.parts[].text' >> track-status.txt
echo $curl43 | jq '.data.guestOrder.groups_2101['$indexOrder43'].shipment.trackingNumber' >> track-number.txt
echo $curl43 | jq '.data.guestOrder.groups_2101['$indexOrder43'].shipment.trackingUrl' >> track-url.txt
fi

curl44=`curl 'https://www.walmart.com/orchestra/home/graphql' \
  -H 'authority: www.walmart.com' \
  -H 'sec-ch-ua: " Not A;Brand";v="99", "Chromium";v="96", "Microsoft Edge";v="96"' \
  -H 'x-o-platform: rweb' \
  -H 'dnt: 1' \
  -H 'x-o-correlation-id: wrvYiSFTlAmd8j7a8DDmpuyOpCN_heAnwM3v' \
  -H 'device_profile_ref_id: _s1F3NO8Y2JjaBUKPDcY4iFDWiIl9CyqiJjf' \
  -H 'x-latency-trace: 1' \
  -H 'wm_mp: true' \
  -H 'x-o-market: us' \
  -H 'x-o-platform-version: main-253-ebbb47' \
  -H 'x-o-gql-query: query getGuestOrder' \
  -H 'wm_page_url: https://www.walmart.com/orders' \
  -H 'x-apollo-operation-name: getGuestOrder' \
  -H 'sec-ch-ua-platform: "macOS"' \
  -H 'sec-ch-ua-mobile: ?0' \
  -H 'user-agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/96.0.4664.110 Safari/537.36 Edg/96.0.1054.62' \
  -H 'x-o-segment: oaoh' \
  -H 'content-type: application/json' \
  -H 'accept: application/json' \
  -H 'x-enable-server-timing: 1' \
  -H 'x-o-ccm: server' \
  -H 'wm_qos.correlation_id: wrvYiSFTlAmd8j7a8DDmpuyOpCN_heAnwM3v' \
  -H 'origin: https://www.walmart.com' \
  -H 'sec-fetch-site: same-origin' \
  -H 'sec-fetch-mode: cors' \
  -H 'sec-fetch-dest: empty' \
  -H 'referer: https://www.walmart.com/orders' \
  -H 'accept-language: vi' \
  --data-raw $'{"query":"query getGuestOrder($orderId:ID\u0021 $emailAddress:String\u0021){guestOrder(input:{id:$orderId emailAddress:$emailAddress}){...OrderFieldsFragment}}fragment cancelReason on OrderCancelReason{__typename subReasonCode subDescription}fragment priceDetailFragment on OrderPriceDetailRow{label value displayValue info{title message}rowInfo{...orderPriceDetailRowInfo}}fragment orderPriceDetailRowInfo on OrderPriceDetailRowInfo{title message{...textFragment}}fragment price on Price{displayValue value}fragment variants on MapEntry{name value}fragment OrderAddOn on OrderAddOn{lineId uniqueLineId productInfo{name usItemId offerId}quantityString quantityLabel type fulfillmentInstructions{...textFragment}actions{manageProtectionPlan{...orderActionFragment}cancel}priceInfo{linePrice{...price}}quantity isActive}fragment orderDonationDetails on OrderDonationDetails{message{...textFragment}emailReceipt emailReceiptToken status{...textFragment}errorStatus}fragment orderLineItem on OrderLineItem{id uniqueId actions{contactSeller cancel addToCart configureCake reviewItem resendEGiftCardToken protectionPlan{...orderActionFragment}manageProtectionPlan{...orderActionFragment}}isGift digitalDeliveryMessage quantity quantityString quantityLabel isSubstitutionSelected fulfilledItems{id quantityString priceInfo{itemPrice{value}}product{usItemId name}}isReturnable returnEligibilityMessage product{name usItemId imageInfo{thumbnailUrl}canonicalUrl offerId sellerId sellerName hasSellerBadge seller{sellerId name}orderLimit orderMinLimit weightIncrement salesUnit salesUnitType isSubstitutionEligible isAlcohol}reshop{reshopMessage isShippingAvailable minPromiseDate maxPromiseDate}selectedVariants{...variants}variantAdditionalInfo{parts{text nativeAction}}priceInfo{priceDisplayCodes{showItemPrice priceDisplayCondition finalCostByWeight}itemPrice{...price}linePrice{...price}unitPrice{...price}preDiscountedLinePrice{...price}additionalLines{name value}}discounts{label labelText{...textFragment}}itemReviewed activationCodes{label code}protectionPlanMessage{...textFragment}showSeller isShippedByWalmart seller{id name isPro}digitalDeliveryPhoneNumber addOns{...OrderAddOn}multiboxBundleId}fragment DriverFragment on Driver{id firstName photoUrl}fragment OrderGroupFragment on OrderGroup{driver{...DriverFragment}deliveryDate fulfillmentType status{...OrderGroupStatusFragment}showSeller isShippedByWalmart seller{...SellerFragment}id itemCount items{...LiteLineItemFragment}pickupPerson{firstName lastName email}accessPointId shipment{...ShipmentFragment}returnEligibilityMessage actions{...OrderGroupActionsFragment}recipientEmailAddress digitalDelivery{...DigitalDeliveryFragment}tireInstallationReservation{status extraText}}fragment OrderGroupStatusFragment on OrderGroupStatus{statusType showStatusTracker statusTracker{status label isCurrent}message{...textFragment}subtext subMessage{...textFragment}notice helpCenterText{...textFragment}}fragment textFragment on Text{parts{bold url text nativeAction lineBreak}}fragment LiteLineItemFragment on OrderLineItem{id quantity product{name usItemId imageInfo{thumbnailUrl}offerId isAlcohol}priceInfo{linePrice{...price}}}fragment SellerFragment on GroupSeller{id name isPro}fragment DigitalDeliveryFragment on DigitalDelivery{title name instructions{...textFragment}}fragment ShipmentFragment on Shipment{id trackingNumber isExternalTracking trackingUrl proofOfDelivery{photoUrl photoPreviewUrl showPreview}}fragment OrderGroupActionsFragment on OrderGroupActions{reorder edit track changeSlot checkin editDeliveryInstructions editPickupPerson editTip tip cancel enableTip{...orderActionFragment}enableEdit{...orderActionFragment}rescheduleTireInstall{...orderActionFragment}cancelTireInstall{...orderActionFragment}help viewCancellationDetails{...cancellationDetailsActionFragment}}fragment cancellationDetailsActionFragment on CancellationDetailsAction{label heading text{...textFragment}}fragment ODPGroupCategoryFragment on OrderCategory{type name subtext returnMessage substitutionsBanner{...textFragment}showExtendedSubstitutions actions{substitutions{message label type}nilPickReshop{message action{text url}}returnDetails viewCancellationDetails{...cancellationDetailsActionFragment}trackOnInHomeApp}banner{...textFragment}accordionState items{...orderLineItem}substitutions{...orderLineItem fulfilledItems{...orderLineItem}}returnInfo{...returnInfoFragment}}fragment ODPGroupFragment on OrderGroup{id fulfillmentType deliveryMessage deliveryAddress{fullName firstName lastName address{...addressFragment}}deliveryInstructions{text type typeText}deliveryPreferences{text{...textFragment}cta{...orderActionFragment}}editSubstitutionsCutOff status{statusType showStatusTracker message{...textFragment}notice helpCenterText{...textFragment}}itemCount isCategorized categories{...ODPGroupCategoryFragment}seller{id name isPro}shipment{id trackingNumber}actions{reorder edit track changeSlot checkin editDeliveryInstructions editPickupPerson tip cancel help enableTip{...orderActionFragment}enableEdit{...orderActionFragment}viewCancellationDetails{...cancellationDetailsActionFragment}enableInHome{...orderActionFragment}createGiftReceipt}cutOffTimestamp isEditSubstitutionsEligible isInHome giftDetails{recipientAddress{fullName}recipientEmail senderName giftMessage}donationDetails{...orderDonationDetails}}fragment returnInfoFragment on ReturnInfo{returnOrderId type refundPriceDetails{__typename...refundPriceDetailsFragment}refundMessage tierRefundMessage paymentMethods{__typename description cardType paymentType displayValues message{...textFragment}}actions{__typename generate scheduleOrModifyPickup{text url}reschedulePickup editPickupContact}shippingLabelUrl qrCodeImageUrl carriers{__typename id name}pickupCarrier pickupContact{nameAndAddress{fullName firstName lastName address{addressString city state postalCode addressLineOne addressLineTwo country}}phone}pickupConfirmationNumber bannerMessage{...textFragment}}fragment refundPriceDetailsFragment on RefundPriceDetails{subTotal{__typename...orderPriceDetailRowFragment}fees{__typename...orderPriceDetailRowFragment}discounts{__typename...orderPriceDetailRowFragment}taxTotal{__typename...orderPriceDetailRowFragment}grandTotal{__typename...orderPriceDetailRowFragment}}fragment orderPriceDetailRowFragment on OrderPriceDetailRow{label displayValue value info{__typename title message}}fragment addressFragment on OrderAddress{addressString addressLineOne addressLineTwo state postalCode city}fragment ODPPickupInfo on OrderGroup{pickupInstructions pickupPerson{...person}alternatePickupPerson{...person}store{id name address{...addressFragment}}}fragment person on OrderPickupPerson{firstName lastName email}fragment ODPTippingInfo on OrderGroup{addTipMessage{...textFragment}driver{...DriverFragment}tipping{min{...price}max{...price}suggested{...price}preselected}subtotal{...price}}fragment orderActionFragment on Action{text url}fragment orderCustomer on OrderCustomer{id firstName lastName email isGuest isEmailRegistered}fragment OrderFieldsFragment on Order{__typename id version type customer{...orderCustomer}displayId idBarcodeImageUrl(barWidth:3 barHeight:100) isFuelPurchase title shortTitle timezone tippableGroup{...OrderGroupFragment}amendableGroup{id changeSlotIterationsLeft cutOffTimestamp fulfillmentType deliveryAddress{fullName firstName lastName address{addressString addressLineOne addressLineTwo state postalCode city country}}isAmendInProgress}substitutionsBanner{heading subheading longSubheading}groups_2101{__typename...OrderGroupFragment...ODPGroupFragment...ODPPickupInfo...ODPTippingInfo}multiboxBundles{...orderLineItem}itemCancelReasons{__typename...cancelReason}groupCancelReasons{__typename...cancelReason}priceDetails{__typename subTotal{__typename...priceDetailFragment}taxTotal{__typename...priceDetailFragment}grandTotal{__typename...priceDetailFragment}authorizationAmount{__typename...priceDetailFragment}fees{__typename...priceDetailFragment}discounts{__typename...priceDetailFragment}minimumThreshold{__typename...price}belowMinimumFee{__typename...priceDetailFragment}driverTip{__typename...priceDetailFragment}donations{__typename...priceDetailFragment}}paymentMethods{__typename description cardType paymentType displayValues message{...textFragment}actions{connectToCapitalOne{...orderActionFragment}visitAffirm{...orderActionFragment}}}actions{__typename return pendingReturn cancel startReturn{...orderActionFragment}reorder}banners{...textFragment}}","variables":{"orderId":"2832232527755","emailAddress":"albanywills98@icloud.com"}}' \
  --compressed`
 
for (( i=0; i<=4; i++ ))
do
  if [[ $curl44 =~ "error"  || $curl44 =~ "blocked" ]]; then
    echo "Lỗi email số 44"
    indexOrder44=`echo error`
    break
  elif [[ `echo $curl44 | jq '.data.guestOrder.groups_2101['${i[@]}'].items[0].product.usItemId'` == '"227338487"' ]]; then
    indexOrder44=`echo $i`
    indexItem44=`echo 0`
  elif [[ `echo $curl44 | jq '.data.guestOrder.groups_2101['${i[@]}'].items[1].product.usItemId'` == '"227338487"' ]]; then
    indexOrder44=`echo $i`
    indexItem44=`echo 1`
  elif [[ `echo $curl44 | jq '.data.guestOrder.groups_2101['${i[@]}'].items[2].product.usItemId'` == '"227338487"' ]]; then
    indexOrder44=`echo $i`
    indexItem44=`echo 2`
  elif [[ `echo $curl44 | jq '.data.guestOrder.groups_2101['${i[@]}'].items[3].product.usItemId'` == '"227338487"' ]]; then
    indexOrder44=`echo $i`
    indexItem44=`echo 3`
  fi
done

if [[ $indexOrder44 != "error" ]]; then
echo $curl44 | jq '.data.guestOrder.id' >> track-OrderID.txt
echo $curl44 | jq '.data.guestOrder.customer.email' >> track-email.txt
echo $curl44 | jq '.data.guestOrder.groups_2101['$indexOrder44'].items['$indexItem44'].product.usItemId' >> track-usItemId.txt
echo $curl44 | jq '.data.guestOrder.groups_2101['$indexOrder44'].items['$indexItem44'].priceInfo.linePrice.value' >> track-priceValue.txt
echo $curl44 | jq '.data.guestOrder.groups_2101['$indexOrder44'].deliveryAddress.fullName' >> track-fullName.txt
echo $curl44 | jq '.data.guestOrder.groups_2101['$indexOrder44'].deliveryAddress.address.addressString' >> track-address.txt
echo $curl44 | jq '.data.guestOrder.groups_2101['$indexOrder44'].status.message.parts[].text' >> track-status.txt
echo $curl44 | jq '.data.guestOrder.groups_2101['$indexOrder44'].shipment.trackingNumber' >> track-number.txt
echo $curl44 | jq '.data.guestOrder.groups_2101['$indexOrder44'].shipment.trackingUrl' >> track-url.txt
fi

curl45=`curl 'https://www.walmart.com/orchestra/home/graphql' \
  -H 'authority: www.walmart.com' \
  -H 'sec-ch-ua: " Not A;Brand";v="99", "Chromium";v="96", "Microsoft Edge";v="96"' \
  -H 'x-o-platform: rweb' \
  -H 'dnt: 1' \
  -H 'x-o-correlation-id: wrvYiSFTlAmd8j7a8DDmpuyOpCN_heAnwM3v' \
  -H 'device_profile_ref_id: _s1F3NO8Y2JjaBUKPDcY4iFDWiIl9CyqiJjf' \
  -H 'x-latency-trace: 1' \
  -H 'wm_mp: true' \
  -H 'x-o-market: us' \
  -H 'x-o-platform-version: main-253-ebbb47' \
  -H 'x-o-gql-query: query getGuestOrder' \
  -H 'wm_page_url: https://www.walmart.com/orders' \
  -H 'x-apollo-operation-name: getGuestOrder' \
  -H 'sec-ch-ua-platform: "macOS"' \
  -H 'sec-ch-ua-mobile: ?0' \
  -H 'user-agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/96.0.4664.110 Safari/537.36 Edg/96.0.1054.62' \
  -H 'x-o-segment: oaoh' \
  -H 'content-type: application/json' \
  -H 'accept: application/json' \
  -H 'x-enable-server-timing: 1' \
  -H 'x-o-ccm: server' \
  -H 'wm_qos.correlation_id: wrvYiSFTlAmd8j7a8DDmpuyOpCN_heAnwM3v' \
  -H 'origin: https://www.walmart.com' \
  -H 'sec-fetch-site: same-origin' \
  -H 'sec-fetch-mode: cors' \
  -H 'sec-fetch-dest: empty' \
  -H 'referer: https://www.walmart.com/orders' \
  -H 'accept-language: vi' \
  --data-raw $'{"query":"query getGuestOrder($orderId:ID\u0021 $emailAddress:String\u0021){guestOrder(input:{id:$orderId emailAddress:$emailAddress}){...OrderFieldsFragment}}fragment cancelReason on OrderCancelReason{__typename subReasonCode subDescription}fragment priceDetailFragment on OrderPriceDetailRow{label value displayValue info{title message}rowInfo{...orderPriceDetailRowInfo}}fragment orderPriceDetailRowInfo on OrderPriceDetailRowInfo{title message{...textFragment}}fragment price on Price{displayValue value}fragment variants on MapEntry{name value}fragment OrderAddOn on OrderAddOn{lineId uniqueLineId productInfo{name usItemId offerId}quantityString quantityLabel type fulfillmentInstructions{...textFragment}actions{manageProtectionPlan{...orderActionFragment}cancel}priceInfo{linePrice{...price}}quantity isActive}fragment orderDonationDetails on OrderDonationDetails{message{...textFragment}emailReceipt emailReceiptToken status{...textFragment}errorStatus}fragment orderLineItem on OrderLineItem{id uniqueId actions{contactSeller cancel addToCart configureCake reviewItem resendEGiftCardToken protectionPlan{...orderActionFragment}manageProtectionPlan{...orderActionFragment}}isGift digitalDeliveryMessage quantity quantityString quantityLabel isSubstitutionSelected fulfilledItems{id quantityString priceInfo{itemPrice{value}}product{usItemId name}}isReturnable returnEligibilityMessage product{name usItemId imageInfo{thumbnailUrl}canonicalUrl offerId sellerId sellerName hasSellerBadge seller{sellerId name}orderLimit orderMinLimit weightIncrement salesUnit salesUnitType isSubstitutionEligible isAlcohol}reshop{reshopMessage isShippingAvailable minPromiseDate maxPromiseDate}selectedVariants{...variants}variantAdditionalInfo{parts{text nativeAction}}priceInfo{priceDisplayCodes{showItemPrice priceDisplayCondition finalCostByWeight}itemPrice{...price}linePrice{...price}unitPrice{...price}preDiscountedLinePrice{...price}additionalLines{name value}}discounts{label labelText{...textFragment}}itemReviewed activationCodes{label code}protectionPlanMessage{...textFragment}showSeller isShippedByWalmart seller{id name isPro}digitalDeliveryPhoneNumber addOns{...OrderAddOn}multiboxBundleId}fragment DriverFragment on Driver{id firstName photoUrl}fragment OrderGroupFragment on OrderGroup{driver{...DriverFragment}deliveryDate fulfillmentType status{...OrderGroupStatusFragment}showSeller isShippedByWalmart seller{...SellerFragment}id itemCount items{...LiteLineItemFragment}pickupPerson{firstName lastName email}accessPointId shipment{...ShipmentFragment}returnEligibilityMessage actions{...OrderGroupActionsFragment}recipientEmailAddress digitalDelivery{...DigitalDeliveryFragment}tireInstallationReservation{status extraText}}fragment OrderGroupStatusFragment on OrderGroupStatus{statusType showStatusTracker statusTracker{status label isCurrent}message{...textFragment}subtext subMessage{...textFragment}notice helpCenterText{...textFragment}}fragment textFragment on Text{parts{bold url text nativeAction lineBreak}}fragment LiteLineItemFragment on OrderLineItem{id quantity product{name usItemId imageInfo{thumbnailUrl}offerId isAlcohol}priceInfo{linePrice{...price}}}fragment SellerFragment on GroupSeller{id name isPro}fragment DigitalDeliveryFragment on DigitalDelivery{title name instructions{...textFragment}}fragment ShipmentFragment on Shipment{id trackingNumber isExternalTracking trackingUrl proofOfDelivery{photoUrl photoPreviewUrl showPreview}}fragment OrderGroupActionsFragment on OrderGroupActions{reorder edit track changeSlot checkin editDeliveryInstructions editPickupPerson editTip tip cancel enableTip{...orderActionFragment}enableEdit{...orderActionFragment}rescheduleTireInstall{...orderActionFragment}cancelTireInstall{...orderActionFragment}help viewCancellationDetails{...cancellationDetailsActionFragment}}fragment cancellationDetailsActionFragment on CancellationDetailsAction{label heading text{...textFragment}}fragment ODPGroupCategoryFragment on OrderCategory{type name subtext returnMessage substitutionsBanner{...textFragment}showExtendedSubstitutions actions{substitutions{message label type}nilPickReshop{message action{text url}}returnDetails viewCancellationDetails{...cancellationDetailsActionFragment}trackOnInHomeApp}banner{...textFragment}accordionState items{...orderLineItem}substitutions{...orderLineItem fulfilledItems{...orderLineItem}}returnInfo{...returnInfoFragment}}fragment ODPGroupFragment on OrderGroup{id fulfillmentType deliveryMessage deliveryAddress{fullName firstName lastName address{...addressFragment}}deliveryInstructions{text type typeText}deliveryPreferences{text{...textFragment}cta{...orderActionFragment}}editSubstitutionsCutOff status{statusType showStatusTracker message{...textFragment}notice helpCenterText{...textFragment}}itemCount isCategorized categories{...ODPGroupCategoryFragment}seller{id name isPro}shipment{id trackingNumber}actions{reorder edit track changeSlot checkin editDeliveryInstructions editPickupPerson tip cancel help enableTip{...orderActionFragment}enableEdit{...orderActionFragment}viewCancellationDetails{...cancellationDetailsActionFragment}enableInHome{...orderActionFragment}createGiftReceipt}cutOffTimestamp isEditSubstitutionsEligible isInHome giftDetails{recipientAddress{fullName}recipientEmail senderName giftMessage}donationDetails{...orderDonationDetails}}fragment returnInfoFragment on ReturnInfo{returnOrderId type refundPriceDetails{__typename...refundPriceDetailsFragment}refundMessage tierRefundMessage paymentMethods{__typename description cardType paymentType displayValues message{...textFragment}}actions{__typename generate scheduleOrModifyPickup{text url}reschedulePickup editPickupContact}shippingLabelUrl qrCodeImageUrl carriers{__typename id name}pickupCarrier pickupContact{nameAndAddress{fullName firstName lastName address{addressString city state postalCode addressLineOne addressLineTwo country}}phone}pickupConfirmationNumber bannerMessage{...textFragment}}fragment refundPriceDetailsFragment on RefundPriceDetails{subTotal{__typename...orderPriceDetailRowFragment}fees{__typename...orderPriceDetailRowFragment}discounts{__typename...orderPriceDetailRowFragment}taxTotal{__typename...orderPriceDetailRowFragment}grandTotal{__typename...orderPriceDetailRowFragment}}fragment orderPriceDetailRowFragment on OrderPriceDetailRow{label displayValue value info{__typename title message}}fragment addressFragment on OrderAddress{addressString addressLineOne addressLineTwo state postalCode city}fragment ODPPickupInfo on OrderGroup{pickupInstructions pickupPerson{...person}alternatePickupPerson{...person}store{id name address{...addressFragment}}}fragment person on OrderPickupPerson{firstName lastName email}fragment ODPTippingInfo on OrderGroup{addTipMessage{...textFragment}driver{...DriverFragment}tipping{min{...price}max{...price}suggested{...price}preselected}subtotal{...price}}fragment orderActionFragment on Action{text url}fragment orderCustomer on OrderCustomer{id firstName lastName email isGuest isEmailRegistered}fragment OrderFieldsFragment on Order{__typename id version type customer{...orderCustomer}displayId idBarcodeImageUrl(barWidth:3 barHeight:100) isFuelPurchase title shortTitle timezone tippableGroup{...OrderGroupFragment}amendableGroup{id changeSlotIterationsLeft cutOffTimestamp fulfillmentType deliveryAddress{fullName firstName lastName address{addressString addressLineOne addressLineTwo state postalCode city country}}isAmendInProgress}substitutionsBanner{heading subheading longSubheading}groups_2101{__typename...OrderGroupFragment...ODPGroupFragment...ODPPickupInfo...ODPTippingInfo}multiboxBundles{...orderLineItem}itemCancelReasons{__typename...cancelReason}groupCancelReasons{__typename...cancelReason}priceDetails{__typename subTotal{__typename...priceDetailFragment}taxTotal{__typename...priceDetailFragment}grandTotal{__typename...priceDetailFragment}authorizationAmount{__typename...priceDetailFragment}fees{__typename...priceDetailFragment}discounts{__typename...priceDetailFragment}minimumThreshold{__typename...price}belowMinimumFee{__typename...priceDetailFragment}driverTip{__typename...priceDetailFragment}donations{__typename...priceDetailFragment}}paymentMethods{__typename description cardType paymentType displayValues message{...textFragment}actions{connectToCapitalOne{...orderActionFragment}visitAffirm{...orderActionFragment}}}actions{__typename return pendingReturn cancel startReturn{...orderActionFragment}reorder}banners{...textFragment}}","variables":{"orderId":"2842234620457","emailAddress":"eliza_jane_00@hotmail.com"}}' \
  --compressed`
 
for (( i=0; i<=4; i++ ))
do
  if [[ $curl45 =~ "error"  || $curl45 =~ "blocked" ]]; then
    echo "Lỗi email số 45"
    indexOrder45=`echo error`
    break
  elif [[ `echo $curl45 | jq '.data.guestOrder.groups_2101['${i[@]}'].items[0].product.usItemId'` == '"10771204"' ]]; then
    indexOrder45=`echo $i`
    indexItem45=`echo 0`
  elif [[ `echo $curl45 | jq '.data.guestOrder.groups_2101['${i[@]}'].items[1].product.usItemId'` == '"10771204"' ]]; then
    indexOrder45=`echo $i`
    indexItem45=`echo 1`
  elif [[ `echo $curl45 | jq '.data.guestOrder.groups_2101['${i[@]}'].items[2].product.usItemId'` == '"10771204"' ]]; then
    indexOrder45=`echo $i`
    indexItem45=`echo 2`
  elif [[ `echo $curl45 | jq '.data.guestOrder.groups_2101['${i[@]}'].items[3].product.usItemId'` == '"10771204"' ]]; then
    indexOrder45=`echo $i`
    indexItem45=`echo 3`
  fi
done

if [[ $indexOrder45 != "error" ]]; then
echo $curl45 | jq '.data.guestOrder.id' >> track-OrderID.txt
echo $curl45 | jq '.data.guestOrder.customer.email' >> track-email.txt
echo $curl45 | jq '.data.guestOrder.groups_2101['$indexOrder45'].items['$indexItem45'].product.usItemId' >> track-usItemId.txt
echo $curl45 | jq '.data.guestOrder.groups_2101['$indexOrder45'].items['$indexItem45'].priceInfo.linePrice.value' >> track-priceValue.txt
echo $curl45 | jq '.data.guestOrder.groups_2101['$indexOrder45'].deliveryAddress.fullName' >> track-fullName.txt
echo $curl45 | jq '.data.guestOrder.groups_2101['$indexOrder45'].deliveryAddress.address.addressString' >> track-address.txt
echo $curl45 | jq '.data.guestOrder.groups_2101['$indexOrder45'].status.message.parts[].text' >> track-status.txt
echo $curl45 | jq '.data.guestOrder.groups_2101['$indexOrder45'].shipment.trackingNumber' >> track-number.txt
echo $curl45 | jq '.data.guestOrder.groups_2101['$indexOrder45'].shipment.trackingUrl' >> track-url.txt
fi

curl46=`curl 'https://www.walmart.com/orchestra/home/graphql' \
  -H 'authority: www.walmart.com' \
  -H 'sec-ch-ua: " Not A;Brand";v="99", "Chromium";v="96", "Microsoft Edge";v="96"' \
  -H 'x-o-platform: rweb' \
  -H 'dnt: 1' \
  -H 'x-o-correlation-id: wrvYiSFTlAmd8j7a8DDmpuyOpCN_heAnwM3v' \
  -H 'device_profile_ref_id: _s1F3NO8Y2JjaBUKPDcY4iFDWiIl9CyqiJjf' \
  -H 'x-latency-trace: 1' \
  -H 'wm_mp: true' \
  -H 'x-o-market: us' \
  -H 'x-o-platform-version: main-253-ebbb47' \
  -H 'x-o-gql-query: query getGuestOrder' \
  -H 'wm_page_url: https://www.walmart.com/orders' \
  -H 'x-apollo-operation-name: getGuestOrder' \
  -H 'sec-ch-ua-platform: "macOS"' \
  -H 'sec-ch-ua-mobile: ?0' \
  -H 'user-agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/96.0.4664.110 Safari/537.36 Edg/96.0.1054.62' \
  -H 'x-o-segment: oaoh' \
  -H 'content-type: application/json' \
  -H 'accept: application/json' \
  -H 'x-enable-server-timing: 1' \
  -H 'x-o-ccm: server' \
  -H 'wm_qos.correlation_id: wrvYiSFTlAmd8j7a8DDmpuyOpCN_heAnwM3v' \
  -H 'origin: https://www.walmart.com' \
  -H 'sec-fetch-site: same-origin' \
  -H 'sec-fetch-mode: cors' \
  -H 'sec-fetch-dest: empty' \
  -H 'referer: https://www.walmart.com/orders' \
  -H 'accept-language: vi' \
  --data-raw $'{"query":"query getGuestOrder($orderId:ID\u0021 $emailAddress:String\u0021){guestOrder(input:{id:$orderId emailAddress:$emailAddress}){...OrderFieldsFragment}}fragment cancelReason on OrderCancelReason{__typename subReasonCode subDescription}fragment priceDetailFragment on OrderPriceDetailRow{label value displayValue info{title message}rowInfo{...orderPriceDetailRowInfo}}fragment orderPriceDetailRowInfo on OrderPriceDetailRowInfo{title message{...textFragment}}fragment price on Price{displayValue value}fragment variants on MapEntry{name value}fragment OrderAddOn on OrderAddOn{lineId uniqueLineId productInfo{name usItemId offerId}quantityString quantityLabel type fulfillmentInstructions{...textFragment}actions{manageProtectionPlan{...orderActionFragment}cancel}priceInfo{linePrice{...price}}quantity isActive}fragment orderDonationDetails on OrderDonationDetails{message{...textFragment}emailReceipt emailReceiptToken status{...textFragment}errorStatus}fragment orderLineItem on OrderLineItem{id uniqueId actions{contactSeller cancel addToCart configureCake reviewItem resendEGiftCardToken protectionPlan{...orderActionFragment}manageProtectionPlan{...orderActionFragment}}isGift digitalDeliveryMessage quantity quantityString quantityLabel isSubstitutionSelected fulfilledItems{id quantityString priceInfo{itemPrice{value}}product{usItemId name}}isReturnable returnEligibilityMessage product{name usItemId imageInfo{thumbnailUrl}canonicalUrl offerId sellerId sellerName hasSellerBadge seller{sellerId name}orderLimit orderMinLimit weightIncrement salesUnit salesUnitType isSubstitutionEligible isAlcohol}reshop{reshopMessage isShippingAvailable minPromiseDate maxPromiseDate}selectedVariants{...variants}variantAdditionalInfo{parts{text nativeAction}}priceInfo{priceDisplayCodes{showItemPrice priceDisplayCondition finalCostByWeight}itemPrice{...price}linePrice{...price}unitPrice{...price}preDiscountedLinePrice{...price}additionalLines{name value}}discounts{label labelText{...textFragment}}itemReviewed activationCodes{label code}protectionPlanMessage{...textFragment}showSeller isShippedByWalmart seller{id name isPro}digitalDeliveryPhoneNumber addOns{...OrderAddOn}multiboxBundleId}fragment DriverFragment on Driver{id firstName photoUrl}fragment OrderGroupFragment on OrderGroup{driver{...DriverFragment}deliveryDate fulfillmentType status{...OrderGroupStatusFragment}showSeller isShippedByWalmart seller{...SellerFragment}id itemCount items{...LiteLineItemFragment}pickupPerson{firstName lastName email}accessPointId shipment{...ShipmentFragment}returnEligibilityMessage actions{...OrderGroupActionsFragment}recipientEmailAddress digitalDelivery{...DigitalDeliveryFragment}tireInstallationReservation{status extraText}}fragment OrderGroupStatusFragment on OrderGroupStatus{statusType showStatusTracker statusTracker{status label isCurrent}message{...textFragment}subtext subMessage{...textFragment}notice helpCenterText{...textFragment}}fragment textFragment on Text{parts{bold url text nativeAction lineBreak}}fragment LiteLineItemFragment on OrderLineItem{id quantity product{name usItemId imageInfo{thumbnailUrl}offerId isAlcohol}priceInfo{linePrice{...price}}}fragment SellerFragment on GroupSeller{id name isPro}fragment DigitalDeliveryFragment on DigitalDelivery{title name instructions{...textFragment}}fragment ShipmentFragment on Shipment{id trackingNumber isExternalTracking trackingUrl proofOfDelivery{photoUrl photoPreviewUrl showPreview}}fragment OrderGroupActionsFragment on OrderGroupActions{reorder edit track changeSlot checkin editDeliveryInstructions editPickupPerson editTip tip cancel enableTip{...orderActionFragment}enableEdit{...orderActionFragment}rescheduleTireInstall{...orderActionFragment}cancelTireInstall{...orderActionFragment}help viewCancellationDetails{...cancellationDetailsActionFragment}}fragment cancellationDetailsActionFragment on CancellationDetailsAction{label heading text{...textFragment}}fragment ODPGroupCategoryFragment on OrderCategory{type name subtext returnMessage substitutionsBanner{...textFragment}showExtendedSubstitutions actions{substitutions{message label type}nilPickReshop{message action{text url}}returnDetails viewCancellationDetails{...cancellationDetailsActionFragment}trackOnInHomeApp}banner{...textFragment}accordionState items{...orderLineItem}substitutions{...orderLineItem fulfilledItems{...orderLineItem}}returnInfo{...returnInfoFragment}}fragment ODPGroupFragment on OrderGroup{id fulfillmentType deliveryMessage deliveryAddress{fullName firstName lastName address{...addressFragment}}deliveryInstructions{text type typeText}deliveryPreferences{text{...textFragment}cta{...orderActionFragment}}editSubstitutionsCutOff status{statusType showStatusTracker message{...textFragment}notice helpCenterText{...textFragment}}itemCount isCategorized categories{...ODPGroupCategoryFragment}seller{id name isPro}shipment{id trackingNumber}actions{reorder edit track changeSlot checkin editDeliveryInstructions editPickupPerson tip cancel help enableTip{...orderActionFragment}enableEdit{...orderActionFragment}viewCancellationDetails{...cancellationDetailsActionFragment}enableInHome{...orderActionFragment}createGiftReceipt}cutOffTimestamp isEditSubstitutionsEligible isInHome giftDetails{recipientAddress{fullName}recipientEmail senderName giftMessage}donationDetails{...orderDonationDetails}}fragment returnInfoFragment on ReturnInfo{returnOrderId type refundPriceDetails{__typename...refundPriceDetailsFragment}refundMessage tierRefundMessage paymentMethods{__typename description cardType paymentType displayValues message{...textFragment}}actions{__typename generate scheduleOrModifyPickup{text url}reschedulePickup editPickupContact}shippingLabelUrl qrCodeImageUrl carriers{__typename id name}pickupCarrier pickupContact{nameAndAddress{fullName firstName lastName address{addressString city state postalCode addressLineOne addressLineTwo country}}phone}pickupConfirmationNumber bannerMessage{...textFragment}}fragment refundPriceDetailsFragment on RefundPriceDetails{subTotal{__typename...orderPriceDetailRowFragment}fees{__typename...orderPriceDetailRowFragment}discounts{__typename...orderPriceDetailRowFragment}taxTotal{__typename...orderPriceDetailRowFragment}grandTotal{__typename...orderPriceDetailRowFragment}}fragment orderPriceDetailRowFragment on OrderPriceDetailRow{label displayValue value info{__typename title message}}fragment addressFragment on OrderAddress{addressString addressLineOne addressLineTwo state postalCode city}fragment ODPPickupInfo on OrderGroup{pickupInstructions pickupPerson{...person}alternatePickupPerson{...person}store{id name address{...addressFragment}}}fragment person on OrderPickupPerson{firstName lastName email}fragment ODPTippingInfo on OrderGroup{addTipMessage{...textFragment}driver{...DriverFragment}tipping{min{...price}max{...price}suggested{...price}preselected}subtotal{...price}}fragment orderActionFragment on Action{text url}fragment orderCustomer on OrderCustomer{id firstName lastName email isGuest isEmailRegistered}fragment OrderFieldsFragment on Order{__typename id version type customer{...orderCustomer}displayId idBarcodeImageUrl(barWidth:3 barHeight:100) isFuelPurchase title shortTitle timezone tippableGroup{...OrderGroupFragment}amendableGroup{id changeSlotIterationsLeft cutOffTimestamp fulfillmentType deliveryAddress{fullName firstName lastName address{addressString addressLineOne addressLineTwo state postalCode city country}}isAmendInProgress}substitutionsBanner{heading subheading longSubheading}groups_2101{__typename...OrderGroupFragment...ODPGroupFragment...ODPPickupInfo...ODPTippingInfo}multiboxBundles{...orderLineItem}itemCancelReasons{__typename...cancelReason}groupCancelReasons{__typename...cancelReason}priceDetails{__typename subTotal{__typename...priceDetailFragment}taxTotal{__typename...priceDetailFragment}grandTotal{__typename...priceDetailFragment}authorizationAmount{__typename...priceDetailFragment}fees{__typename...priceDetailFragment}discounts{__typename...priceDetailFragment}minimumThreshold{__typename...price}belowMinimumFee{__typename...priceDetailFragment}driverTip{__typename...priceDetailFragment}donations{__typename...priceDetailFragment}}paymentMethods{__typename description cardType paymentType displayValues message{...textFragment}actions{connectToCapitalOne{...orderActionFragment}visitAffirm{...orderActionFragment}}}actions{__typename return pendingReturn cancel startReturn{...orderActionFragment}reorder}banners{...textFragment}}","variables":{"orderId":"2832234535609","emailAddress":"cesarromero8@yahoo.com"}}' \
  --compressed`
 
for (( i=0; i<=4; i++ ))
do
  if [[ $curl46 =~ "error"  || $curl46 =~ "blocked" ]]; then
    echo "Lỗi email số 46"
    indexOrder46=`echo error`
    break
  elif [[ `echo $curl46 | jq '.data.guestOrder.groups_2101['${i[@]}'].items[0].product.usItemId'` == '"526913580"' ]]; then
    indexOrder46=`echo $i`
    indexItem46=`echo 0`
  elif [[ `echo $curl46 | jq '.data.guestOrder.groups_2101['${i[@]}'].items[1].product.usItemId'` == '"526913580"' ]]; then
    indexOrder46=`echo $i`
    indexItem46=`echo 1`
  elif [[ `echo $curl46 | jq '.data.guestOrder.groups_2101['${i[@]}'].items[2].product.usItemId'` == '"526913580"' ]]; then
    indexOrder46=`echo $i`
    indexItem46=`echo 2`
  elif [[ `echo $curl46 | jq '.data.guestOrder.groups_2101['${i[@]}'].items[3].product.usItemId'` == '"526913580"' ]]; then
    indexOrder46=`echo $i`
    indexItem46=`echo 3`
  fi
done

if [[ $indexOrder46 != "error" ]]; then
echo $curl46 | jq '.data.guestOrder.id' >> track-OrderID.txt
echo $curl46 | jq '.data.guestOrder.customer.email' >> track-email.txt
echo $curl46 | jq '.data.guestOrder.groups_2101['$indexOrder46'].items['$indexItem46'].product.usItemId' >> track-usItemId.txt
echo $curl46 | jq '.data.guestOrder.groups_2101['$indexOrder46'].items['$indexItem46'].priceInfo.linePrice.value' >> track-priceValue.txt
echo $curl46 | jq '.data.guestOrder.groups_2101['$indexOrder46'].deliveryAddress.fullName' >> track-fullName.txt
echo $curl46 | jq '.data.guestOrder.groups_2101['$indexOrder46'].deliveryAddress.address.addressString' >> track-address.txt
echo $curl46 | jq '.data.guestOrder.groups_2101['$indexOrder46'].status.message.parts[].text' >> track-status.txt
echo $curl46 | jq '.data.guestOrder.groups_2101['$indexOrder46'].shipment.trackingNumber' >> track-number.txt
echo $curl46 | jq '.data.guestOrder.groups_2101['$indexOrder46'].shipment.trackingUrl' >> track-url.txt
fi

curl47=`curl 'https://www.walmart.com/orchestra/home/graphql' \
  -H 'authority: www.walmart.com' \
  -H 'sec-ch-ua: " Not A;Brand";v="99", "Chromium";v="96", "Microsoft Edge";v="96"' \
  -H 'x-o-platform: rweb' \
  -H 'dnt: 1' \
  -H 'x-o-correlation-id: wrvYiSFTlAmd8j7a8DDmpuyOpCN_heAnwM3v' \
  -H 'device_profile_ref_id: _s1F3NO8Y2JjaBUKPDcY4iFDWiIl9CyqiJjf' \
  -H 'x-latency-trace: 1' \
  -H 'wm_mp: true' \
  -H 'x-o-market: us' \
  -H 'x-o-platform-version: main-253-ebbb47' \
  -H 'x-o-gql-query: query getGuestOrder' \
  -H 'wm_page_url: https://www.walmart.com/orders' \
  -H 'x-apollo-operation-name: getGuestOrder' \
  -H 'sec-ch-ua-platform: "macOS"' \
  -H 'sec-ch-ua-mobile: ?0' \
  -H 'user-agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/96.0.4664.110 Safari/537.36 Edg/96.0.1054.62' \
  -H 'x-o-segment: oaoh' \
  -H 'content-type: application/json' \
  -H 'accept: application/json' \
  -H 'x-enable-server-timing: 1' \
  -H 'x-o-ccm: server' \
  -H 'wm_qos.correlation_id: wrvYiSFTlAmd8j7a8DDmpuyOpCN_heAnwM3v' \
  -H 'origin: https://www.walmart.com' \
  -H 'sec-fetch-site: same-origin' \
  -H 'sec-fetch-mode: cors' \
  -H 'sec-fetch-dest: empty' \
  -H 'referer: https://www.walmart.com/orders' \
  -H 'accept-language: vi' \
  --data-raw $'{"query":"query getGuestOrder($orderId:ID\u0021 $emailAddress:String\u0021){guestOrder(input:{id:$orderId emailAddress:$emailAddress}){...OrderFieldsFragment}}fragment cancelReason on OrderCancelReason{__typename subReasonCode subDescription}fragment priceDetailFragment on OrderPriceDetailRow{label value displayValue info{title message}rowInfo{...orderPriceDetailRowInfo}}fragment orderPriceDetailRowInfo on OrderPriceDetailRowInfo{title message{...textFragment}}fragment price on Price{displayValue value}fragment variants on MapEntry{name value}fragment OrderAddOn on OrderAddOn{lineId uniqueLineId productInfo{name usItemId offerId}quantityString quantityLabel type fulfillmentInstructions{...textFragment}actions{manageProtectionPlan{...orderActionFragment}cancel}priceInfo{linePrice{...price}}quantity isActive}fragment orderDonationDetails on OrderDonationDetails{message{...textFragment}emailReceipt emailReceiptToken status{...textFragment}errorStatus}fragment orderLineItem on OrderLineItem{id uniqueId actions{contactSeller cancel addToCart configureCake reviewItem resendEGiftCardToken protectionPlan{...orderActionFragment}manageProtectionPlan{...orderActionFragment}}isGift digitalDeliveryMessage quantity quantityString quantityLabel isSubstitutionSelected fulfilledItems{id quantityString priceInfo{itemPrice{value}}product{usItemId name}}isReturnable returnEligibilityMessage product{name usItemId imageInfo{thumbnailUrl}canonicalUrl offerId sellerId sellerName hasSellerBadge seller{sellerId name}orderLimit orderMinLimit weightIncrement salesUnit salesUnitType isSubstitutionEligible isAlcohol}reshop{reshopMessage isShippingAvailable minPromiseDate maxPromiseDate}selectedVariants{...variants}variantAdditionalInfo{parts{text nativeAction}}priceInfo{priceDisplayCodes{showItemPrice priceDisplayCondition finalCostByWeight}itemPrice{...price}linePrice{...price}unitPrice{...price}preDiscountedLinePrice{...price}additionalLines{name value}}discounts{label labelText{...textFragment}}itemReviewed activationCodes{label code}protectionPlanMessage{...textFragment}showSeller isShippedByWalmart seller{id name isPro}digitalDeliveryPhoneNumber addOns{...OrderAddOn}multiboxBundleId}fragment DriverFragment on Driver{id firstName photoUrl}fragment OrderGroupFragment on OrderGroup{driver{...DriverFragment}deliveryDate fulfillmentType status{...OrderGroupStatusFragment}showSeller isShippedByWalmart seller{...SellerFragment}id itemCount items{...LiteLineItemFragment}pickupPerson{firstName lastName email}accessPointId shipment{...ShipmentFragment}returnEligibilityMessage actions{...OrderGroupActionsFragment}recipientEmailAddress digitalDelivery{...DigitalDeliveryFragment}tireInstallationReservation{status extraText}}fragment OrderGroupStatusFragment on OrderGroupStatus{statusType showStatusTracker statusTracker{status label isCurrent}message{...textFragment}subtext subMessage{...textFragment}notice helpCenterText{...textFragment}}fragment textFragment on Text{parts{bold url text nativeAction lineBreak}}fragment LiteLineItemFragment on OrderLineItem{id quantity product{name usItemId imageInfo{thumbnailUrl}offerId isAlcohol}priceInfo{linePrice{...price}}}fragment SellerFragment on GroupSeller{id name isPro}fragment DigitalDeliveryFragment on DigitalDelivery{title name instructions{...textFragment}}fragment ShipmentFragment on Shipment{id trackingNumber isExternalTracking trackingUrl proofOfDelivery{photoUrl photoPreviewUrl showPreview}}fragment OrderGroupActionsFragment on OrderGroupActions{reorder edit track changeSlot checkin editDeliveryInstructions editPickupPerson editTip tip cancel enableTip{...orderActionFragment}enableEdit{...orderActionFragment}rescheduleTireInstall{...orderActionFragment}cancelTireInstall{...orderActionFragment}help viewCancellationDetails{...cancellationDetailsActionFragment}}fragment cancellationDetailsActionFragment on CancellationDetailsAction{label heading text{...textFragment}}fragment ODPGroupCategoryFragment on OrderCategory{type name subtext returnMessage substitutionsBanner{...textFragment}showExtendedSubstitutions actions{substitutions{message label type}nilPickReshop{message action{text url}}returnDetails viewCancellationDetails{...cancellationDetailsActionFragment}trackOnInHomeApp}banner{...textFragment}accordionState items{...orderLineItem}substitutions{...orderLineItem fulfilledItems{...orderLineItem}}returnInfo{...returnInfoFragment}}fragment ODPGroupFragment on OrderGroup{id fulfillmentType deliveryMessage deliveryAddress{fullName firstName lastName address{...addressFragment}}deliveryInstructions{text type typeText}deliveryPreferences{text{...textFragment}cta{...orderActionFragment}}editSubstitutionsCutOff status{statusType showStatusTracker message{...textFragment}notice helpCenterText{...textFragment}}itemCount isCategorized categories{...ODPGroupCategoryFragment}seller{id name isPro}shipment{id trackingNumber}actions{reorder edit track changeSlot checkin editDeliveryInstructions editPickupPerson tip cancel help enableTip{...orderActionFragment}enableEdit{...orderActionFragment}viewCancellationDetails{...cancellationDetailsActionFragment}enableInHome{...orderActionFragment}createGiftReceipt}cutOffTimestamp isEditSubstitutionsEligible isInHome giftDetails{recipientAddress{fullName}recipientEmail senderName giftMessage}donationDetails{...orderDonationDetails}}fragment returnInfoFragment on ReturnInfo{returnOrderId type refundPriceDetails{__typename...refundPriceDetailsFragment}refundMessage tierRefundMessage paymentMethods{__typename description cardType paymentType displayValues message{...textFragment}}actions{__typename generate scheduleOrModifyPickup{text url}reschedulePickup editPickupContact}shippingLabelUrl qrCodeImageUrl carriers{__typename id name}pickupCarrier pickupContact{nameAndAddress{fullName firstName lastName address{addressString city state postalCode addressLineOne addressLineTwo country}}phone}pickupConfirmationNumber bannerMessage{...textFragment}}fragment refundPriceDetailsFragment on RefundPriceDetails{subTotal{__typename...orderPriceDetailRowFragment}fees{__typename...orderPriceDetailRowFragment}discounts{__typename...orderPriceDetailRowFragment}taxTotal{__typename...orderPriceDetailRowFragment}grandTotal{__typename...orderPriceDetailRowFragment}}fragment orderPriceDetailRowFragment on OrderPriceDetailRow{label displayValue value info{__typename title message}}fragment addressFragment on OrderAddress{addressString addressLineOne addressLineTwo state postalCode city}fragment ODPPickupInfo on OrderGroup{pickupInstructions pickupPerson{...person}alternatePickupPerson{...person}store{id name address{...addressFragment}}}fragment person on OrderPickupPerson{firstName lastName email}fragment ODPTippingInfo on OrderGroup{addTipMessage{...textFragment}driver{...DriverFragment}tipping{min{...price}max{...price}suggested{...price}preselected}subtotal{...price}}fragment orderActionFragment on Action{text url}fragment orderCustomer on OrderCustomer{id firstName lastName email isGuest isEmailRegistered}fragment OrderFieldsFragment on Order{__typename id version type customer{...orderCustomer}displayId idBarcodeImageUrl(barWidth:3 barHeight:100) isFuelPurchase title shortTitle timezone tippableGroup{...OrderGroupFragment}amendableGroup{id changeSlotIterationsLeft cutOffTimestamp fulfillmentType deliveryAddress{fullName firstName lastName address{addressString addressLineOne addressLineTwo state postalCode city country}}isAmendInProgress}substitutionsBanner{heading subheading longSubheading}groups_2101{__typename...OrderGroupFragment...ODPGroupFragment...ODPPickupInfo...ODPTippingInfo}multiboxBundles{...orderLineItem}itemCancelReasons{__typename...cancelReason}groupCancelReasons{__typename...cancelReason}priceDetails{__typename subTotal{__typename...priceDetailFragment}taxTotal{__typename...priceDetailFragment}grandTotal{__typename...priceDetailFragment}authorizationAmount{__typename...priceDetailFragment}fees{__typename...priceDetailFragment}discounts{__typename...priceDetailFragment}minimumThreshold{__typename...price}belowMinimumFee{__typename...priceDetailFragment}driverTip{__typename...priceDetailFragment}donations{__typename...priceDetailFragment}}paymentMethods{__typename description cardType paymentType displayValues message{...textFragment}actions{connectToCapitalOne{...orderActionFragment}visitAffirm{...orderActionFragment}}}actions{__typename return pendingReturn cancel startReturn{...orderActionFragment}reorder}banners{...textFragment}}","variables":{"orderId":"2802227716096","emailAddress":"meyeshell@yahoo.com"}}' \
  --compressed`
 
for (( i=0; i<=4; i++ ))
do
  if [[ $curl47 =~ "error"  || $curl47 =~ "blocked" ]]; then
    echo "Lỗi email số 47"
    indexOrder47=`echo error`
    break
  elif [[ `echo $curl47 | jq '.data.guestOrder.groups_2101['${i[@]}'].items[0].product.usItemId'` == '"129990153"' ]]; then
    indexOrder47=`echo $i`
    indexItem47=`echo 0`
  elif [[ `echo $curl47 | jq '.data.guestOrder.groups_2101['${i[@]}'].items[1].product.usItemId'` == '"129990153"' ]]; then
    indexOrder47=`echo $i`
    indexItem47=`echo 1`
  elif [[ `echo $curl47 | jq '.data.guestOrder.groups_2101['${i[@]}'].items[2].product.usItemId'` == '"129990153"' ]]; then
    indexOrder47=`echo $i`
    indexItem47=`echo 2`
  elif [[ `echo $curl47 | jq '.data.guestOrder.groups_2101['${i[@]}'].items[3].product.usItemId'` == '"129990153"' ]]; then
    indexOrder47=`echo $i`
    indexItem47=`echo 3`
  fi
done

if [[ $indexOrder47 != "error" ]]; then
echo $curl47 | jq '.data.guestOrder.id' >> track-OrderID.txt
echo $curl47 | jq '.data.guestOrder.customer.email' >> track-email.txt
echo $curl47 | jq '.data.guestOrder.groups_2101['$indexOrder47'].items['$indexItem47'].product.usItemId' >> track-usItemId.txt
echo $curl47 | jq '.data.guestOrder.groups_2101['$indexOrder47'].items['$indexItem47'].priceInfo.linePrice.value' >> track-priceValue.txt
echo $curl47 | jq '.data.guestOrder.groups_2101['$indexOrder47'].deliveryAddress.fullName' >> track-fullName.txt
echo $curl47 | jq '.data.guestOrder.groups_2101['$indexOrder47'].deliveryAddress.address.addressString' >> track-address.txt
echo $curl47 | jq '.data.guestOrder.groups_2101['$indexOrder47'].status.message.parts[].text' >> track-status.txt
echo $curl47 | jq '.data.guestOrder.groups_2101['$indexOrder47'].shipment.trackingNumber' >> track-number.txt
echo $curl47 | jq '.data.guestOrder.groups_2101['$indexOrder47'].shipment.trackingUrl' >> track-url.txt
fi

curl48=`curl 'https://www.walmart.com/orchestra/home/graphql' \
  -H 'authority: www.walmart.com' \
  -H 'sec-ch-ua: " Not A;Brand";v="99", "Chromium";v="96", "Microsoft Edge";v="96"' \
  -H 'x-o-platform: rweb' \
  -H 'dnt: 1' \
  -H 'x-o-correlation-id: wrvYiSFTlAmd8j7a8DDmpuyOpCN_heAnwM3v' \
  -H 'device_profile_ref_id: _s1F3NO8Y2JjaBUKPDcY4iFDWiIl9CyqiJjf' \
  -H 'x-latency-trace: 1' \
  -H 'wm_mp: true' \
  -H 'x-o-market: us' \
  -H 'x-o-platform-version: main-253-ebbb47' \
  -H 'x-o-gql-query: query getGuestOrder' \
  -H 'wm_page_url: https://www.walmart.com/orders' \
  -H 'x-apollo-operation-name: getGuestOrder' \
  -H 'sec-ch-ua-platform: "macOS"' \
  -H 'sec-ch-ua-mobile: ?0' \
  -H 'user-agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/96.0.4664.110 Safari/537.36 Edg/96.0.1054.62' \
  -H 'x-o-segment: oaoh' \
  -H 'content-type: application/json' \
  -H 'accept: application/json' \
  -H 'x-enable-server-timing: 1' \
  -H 'x-o-ccm: server' \
  -H 'wm_qos.correlation_id: wrvYiSFTlAmd8j7a8DDmpuyOpCN_heAnwM3v' \
  -H 'origin: https://www.walmart.com' \
  -H 'sec-fetch-site: same-origin' \
  -H 'sec-fetch-mode: cors' \
  -H 'sec-fetch-dest: empty' \
  -H 'referer: https://www.walmart.com/orders' \
  -H 'accept-language: vi' \
  --data-raw $'{"query":"query getGuestOrder($orderId:ID\u0021 $emailAddress:String\u0021){guestOrder(input:{id:$orderId emailAddress:$emailAddress}){...OrderFieldsFragment}}fragment cancelReason on OrderCancelReason{__typename subReasonCode subDescription}fragment priceDetailFragment on OrderPriceDetailRow{label value displayValue info{title message}rowInfo{...orderPriceDetailRowInfo}}fragment orderPriceDetailRowInfo on OrderPriceDetailRowInfo{title message{...textFragment}}fragment price on Price{displayValue value}fragment variants on MapEntry{name value}fragment OrderAddOn on OrderAddOn{lineId uniqueLineId productInfo{name usItemId offerId}quantityString quantityLabel type fulfillmentInstructions{...textFragment}actions{manageProtectionPlan{...orderActionFragment}cancel}priceInfo{linePrice{...price}}quantity isActive}fragment orderDonationDetails on OrderDonationDetails{message{...textFragment}emailReceipt emailReceiptToken status{...textFragment}errorStatus}fragment orderLineItem on OrderLineItem{id uniqueId actions{contactSeller cancel addToCart configureCake reviewItem resendEGiftCardToken protectionPlan{...orderActionFragment}manageProtectionPlan{...orderActionFragment}}isGift digitalDeliveryMessage quantity quantityString quantityLabel isSubstitutionSelected fulfilledItems{id quantityString priceInfo{itemPrice{value}}product{usItemId name}}isReturnable returnEligibilityMessage product{name usItemId imageInfo{thumbnailUrl}canonicalUrl offerId sellerId sellerName hasSellerBadge seller{sellerId name}orderLimit orderMinLimit weightIncrement salesUnit salesUnitType isSubstitutionEligible isAlcohol}reshop{reshopMessage isShippingAvailable minPromiseDate maxPromiseDate}selectedVariants{...variants}variantAdditionalInfo{parts{text nativeAction}}priceInfo{priceDisplayCodes{showItemPrice priceDisplayCondition finalCostByWeight}itemPrice{...price}linePrice{...price}unitPrice{...price}preDiscountedLinePrice{...price}additionalLines{name value}}discounts{label labelText{...textFragment}}itemReviewed activationCodes{label code}protectionPlanMessage{...textFragment}showSeller isShippedByWalmart seller{id name isPro}digitalDeliveryPhoneNumber addOns{...OrderAddOn}multiboxBundleId}fragment DriverFragment on Driver{id firstName photoUrl}fragment OrderGroupFragment on OrderGroup{driver{...DriverFragment}deliveryDate fulfillmentType status{...OrderGroupStatusFragment}showSeller isShippedByWalmart seller{...SellerFragment}id itemCount items{...LiteLineItemFragment}pickupPerson{firstName lastName email}accessPointId shipment{...ShipmentFragment}returnEligibilityMessage actions{...OrderGroupActionsFragment}recipientEmailAddress digitalDelivery{...DigitalDeliveryFragment}tireInstallationReservation{status extraText}}fragment OrderGroupStatusFragment on OrderGroupStatus{statusType showStatusTracker statusTracker{status label isCurrent}message{...textFragment}subtext subMessage{...textFragment}notice helpCenterText{...textFragment}}fragment textFragment on Text{parts{bold url text nativeAction lineBreak}}fragment LiteLineItemFragment on OrderLineItem{id quantity product{name usItemId imageInfo{thumbnailUrl}offerId isAlcohol}priceInfo{linePrice{...price}}}fragment SellerFragment on GroupSeller{id name isPro}fragment DigitalDeliveryFragment on DigitalDelivery{title name instructions{...textFragment}}fragment ShipmentFragment on Shipment{id trackingNumber isExternalTracking trackingUrl proofOfDelivery{photoUrl photoPreviewUrl showPreview}}fragment OrderGroupActionsFragment on OrderGroupActions{reorder edit track changeSlot checkin editDeliveryInstructions editPickupPerson editTip tip cancel enableTip{...orderActionFragment}enableEdit{...orderActionFragment}rescheduleTireInstall{...orderActionFragment}cancelTireInstall{...orderActionFragment}help viewCancellationDetails{...cancellationDetailsActionFragment}}fragment cancellationDetailsActionFragment on CancellationDetailsAction{label heading text{...textFragment}}fragment ODPGroupCategoryFragment on OrderCategory{type name subtext returnMessage substitutionsBanner{...textFragment}showExtendedSubstitutions actions{substitutions{message label type}nilPickReshop{message action{text url}}returnDetails viewCancellationDetails{...cancellationDetailsActionFragment}trackOnInHomeApp}banner{...textFragment}accordionState items{...orderLineItem}substitutions{...orderLineItem fulfilledItems{...orderLineItem}}returnInfo{...returnInfoFragment}}fragment ODPGroupFragment on OrderGroup{id fulfillmentType deliveryMessage deliveryAddress{fullName firstName lastName address{...addressFragment}}deliveryInstructions{text type typeText}deliveryPreferences{text{...textFragment}cta{...orderActionFragment}}editSubstitutionsCutOff status{statusType showStatusTracker message{...textFragment}notice helpCenterText{...textFragment}}itemCount isCategorized categories{...ODPGroupCategoryFragment}seller{id name isPro}shipment{id trackingNumber}actions{reorder edit track changeSlot checkin editDeliveryInstructions editPickupPerson tip cancel help enableTip{...orderActionFragment}enableEdit{...orderActionFragment}viewCancellationDetails{...cancellationDetailsActionFragment}enableInHome{...orderActionFragment}createGiftReceipt}cutOffTimestamp isEditSubstitutionsEligible isInHome giftDetails{recipientAddress{fullName}recipientEmail senderName giftMessage}donationDetails{...orderDonationDetails}}fragment returnInfoFragment on ReturnInfo{returnOrderId type refundPriceDetails{__typename...refundPriceDetailsFragment}refundMessage tierRefundMessage paymentMethods{__typename description cardType paymentType displayValues message{...textFragment}}actions{__typename generate scheduleOrModifyPickup{text url}reschedulePickup editPickupContact}shippingLabelUrl qrCodeImageUrl carriers{__typename id name}pickupCarrier pickupContact{nameAndAddress{fullName firstName lastName address{addressString city state postalCode addressLineOne addressLineTwo country}}phone}pickupConfirmationNumber bannerMessage{...textFragment}}fragment refundPriceDetailsFragment on RefundPriceDetails{subTotal{__typename...orderPriceDetailRowFragment}fees{__typename...orderPriceDetailRowFragment}discounts{__typename...orderPriceDetailRowFragment}taxTotal{__typename...orderPriceDetailRowFragment}grandTotal{__typename...orderPriceDetailRowFragment}}fragment orderPriceDetailRowFragment on OrderPriceDetailRow{label displayValue value info{__typename title message}}fragment addressFragment on OrderAddress{addressString addressLineOne addressLineTwo state postalCode city}fragment ODPPickupInfo on OrderGroup{pickupInstructions pickupPerson{...person}alternatePickupPerson{...person}store{id name address{...addressFragment}}}fragment person on OrderPickupPerson{firstName lastName email}fragment ODPTippingInfo on OrderGroup{addTipMessage{...textFragment}driver{...DriverFragment}tipping{min{...price}max{...price}suggested{...price}preselected}subtotal{...price}}fragment orderActionFragment on Action{text url}fragment orderCustomer on OrderCustomer{id firstName lastName email isGuest isEmailRegistered}fragment OrderFieldsFragment on Order{__typename id version type customer{...orderCustomer}displayId idBarcodeImageUrl(barWidth:3 barHeight:100) isFuelPurchase title shortTitle timezone tippableGroup{...OrderGroupFragment}amendableGroup{id changeSlotIterationsLeft cutOffTimestamp fulfillmentType deliveryAddress{fullName firstName lastName address{addressString addressLineOne addressLineTwo state postalCode city country}}isAmendInProgress}substitutionsBanner{heading subheading longSubheading}groups_2101{__typename...OrderGroupFragment...ODPGroupFragment...ODPPickupInfo...ODPTippingInfo}multiboxBundles{...orderLineItem}itemCancelReasons{__typename...cancelReason}groupCancelReasons{__typename...cancelReason}priceDetails{__typename subTotal{__typename...priceDetailFragment}taxTotal{__typename...priceDetailFragment}grandTotal{__typename...priceDetailFragment}authorizationAmount{__typename...priceDetailFragment}fees{__typename...priceDetailFragment}discounts{__typename...priceDetailFragment}minimumThreshold{__typename...price}belowMinimumFee{__typename...priceDetailFragment}driverTip{__typename...priceDetailFragment}donations{__typename...priceDetailFragment}}paymentMethods{__typename description cardType paymentType displayValues message{...textFragment}actions{connectToCapitalOne{...orderActionFragment}visitAffirm{...orderActionFragment}}}actions{__typename return pendingReturn cancel startReturn{...orderActionFragment}reorder}banners{...textFragment}}","variables":{"orderId":"2862239130248","emailAddress":"lindsayjohnsonhill@yahoo.com"}}' \
  --compressed`
 
for (( i=0; i<=4; i++ ))
do
  if [[ $curl48 =~ "error"  || $curl48 =~ "blocked" ]]; then
    echo "Lỗi email số 48"
    indexOrder48=`echo error`
    break
  elif [[ `echo $curl48 | jq '.data.guestOrder.groups_2101['${i[@]}'].items[0].product.usItemId'` == '"121639349"' ]]; then
    indexOrder48=`echo $i`
    indexItem48=`echo 0`
  elif [[ `echo $curl48 | jq '.data.guestOrder.groups_2101['${i[@]}'].items[1].product.usItemId'` == '"121639349"' ]]; then
    indexOrder48=`echo $i`
    indexItem48=`echo 1`
  elif [[ `echo $curl48 | jq '.data.guestOrder.groups_2101['${i[@]}'].items[2].product.usItemId'` == '"121639349"' ]]; then
    indexOrder48=`echo $i`
    indexItem48=`echo 2`
  elif [[ `echo $curl48 | jq '.data.guestOrder.groups_2101['${i[@]}'].items[3].product.usItemId'` == '"121639349"' ]]; then
    indexOrder48=`echo $i`
    indexItem48=`echo 3`
  fi
done

if [[ $indexOrder48 != "error" ]]; then
echo $curl48 | jq '.data.guestOrder.id' >> track-OrderID.txt
echo $curl48 | jq '.data.guestOrder.customer.email' >> track-email.txt
echo $curl48 | jq '.data.guestOrder.groups_2101['$indexOrder48'].items['$indexItem48'].product.usItemId' >> track-usItemId.txt
echo $curl48 | jq '.data.guestOrder.groups_2101['$indexOrder48'].items['$indexItem48'].priceInfo.linePrice.value' >> track-priceValue.txt
echo $curl48 | jq '.data.guestOrder.groups_2101['$indexOrder48'].deliveryAddress.fullName' >> track-fullName.txt
echo $curl48 | jq '.data.guestOrder.groups_2101['$indexOrder48'].deliveryAddress.address.addressString' >> track-address.txt
echo $curl48 | jq '.data.guestOrder.groups_2101['$indexOrder48'].status.message.parts[].text' >> track-status.txt
echo $curl48 | jq '.data.guestOrder.groups_2101['$indexOrder48'].shipment.trackingNumber' >> track-number.txt
echo $curl48 | jq '.data.guestOrder.groups_2101['$indexOrder48'].shipment.trackingUrl' >> track-url.txt
fi

curl49=`curl 'https://www.walmart.com/orchestra/home/graphql' \
  -H 'authority: www.walmart.com' \
  -H 'sec-ch-ua: " Not A;Brand";v="99", "Chromium";v="96", "Microsoft Edge";v="96"' \
  -H 'x-o-platform: rweb' \
  -H 'dnt: 1' \
  -H 'x-o-correlation-id: wrvYiSFTlAmd8j7a8DDmpuyOpCN_heAnwM3v' \
  -H 'device_profile_ref_id: _s1F3NO8Y2JjaBUKPDcY4iFDWiIl9CyqiJjf' \
  -H 'x-latency-trace: 1' \
  -H 'wm_mp: true' \
  -H 'x-o-market: us' \
  -H 'x-o-platform-version: main-253-ebbb47' \
  -H 'x-o-gql-query: query getGuestOrder' \
  -H 'wm_page_url: https://www.walmart.com/orders' \
  -H 'x-apollo-operation-name: getGuestOrder' \
  -H 'sec-ch-ua-platform: "macOS"' \
  -H 'sec-ch-ua-mobile: ?0' \
  -H 'user-agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/96.0.4664.110 Safari/537.36 Edg/96.0.1054.62' \
  -H 'x-o-segment: oaoh' \
  -H 'content-type: application/json' \
  -H 'accept: application/json' \
  -H 'x-enable-server-timing: 1' \
  -H 'x-o-ccm: server' \
  -H 'wm_qos.correlation_id: wrvYiSFTlAmd8j7a8DDmpuyOpCN_heAnwM3v' \
  -H 'origin: https://www.walmart.com' \
  -H 'sec-fetch-site: same-origin' \
  -H 'sec-fetch-mode: cors' \
  -H 'sec-fetch-dest: empty' \
  -H 'referer: https://www.walmart.com/orders' \
  -H 'accept-language: vi' \
  --data-raw $'{"query":"query getGuestOrder($orderId:ID\u0021 $emailAddress:String\u0021){guestOrder(input:{id:$orderId emailAddress:$emailAddress}){...OrderFieldsFragment}}fragment cancelReason on OrderCancelReason{__typename subReasonCode subDescription}fragment priceDetailFragment on OrderPriceDetailRow{label value displayValue info{title message}rowInfo{...orderPriceDetailRowInfo}}fragment orderPriceDetailRowInfo on OrderPriceDetailRowInfo{title message{...textFragment}}fragment price on Price{displayValue value}fragment variants on MapEntry{name value}fragment OrderAddOn on OrderAddOn{lineId uniqueLineId productInfo{name usItemId offerId}quantityString quantityLabel type fulfillmentInstructions{...textFragment}actions{manageProtectionPlan{...orderActionFragment}cancel}priceInfo{linePrice{...price}}quantity isActive}fragment orderDonationDetails on OrderDonationDetails{message{...textFragment}emailReceipt emailReceiptToken status{...textFragment}errorStatus}fragment orderLineItem on OrderLineItem{id uniqueId actions{contactSeller cancel addToCart configureCake reviewItem resendEGiftCardToken protectionPlan{...orderActionFragment}manageProtectionPlan{...orderActionFragment}}isGift digitalDeliveryMessage quantity quantityString quantityLabel isSubstitutionSelected fulfilledItems{id quantityString priceInfo{itemPrice{value}}product{usItemId name}}isReturnable returnEligibilityMessage product{name usItemId imageInfo{thumbnailUrl}canonicalUrl offerId sellerId sellerName hasSellerBadge seller{sellerId name}orderLimit orderMinLimit weightIncrement salesUnit salesUnitType isSubstitutionEligible isAlcohol}reshop{reshopMessage isShippingAvailable minPromiseDate maxPromiseDate}selectedVariants{...variants}variantAdditionalInfo{parts{text nativeAction}}priceInfo{priceDisplayCodes{showItemPrice priceDisplayCondition finalCostByWeight}itemPrice{...price}linePrice{...price}unitPrice{...price}preDiscountedLinePrice{...price}additionalLines{name value}}discounts{label labelText{...textFragment}}itemReviewed activationCodes{label code}protectionPlanMessage{...textFragment}showSeller isShippedByWalmart seller{id name isPro}digitalDeliveryPhoneNumber addOns{...OrderAddOn}multiboxBundleId}fragment DriverFragment on Driver{id firstName photoUrl}fragment OrderGroupFragment on OrderGroup{driver{...DriverFragment}deliveryDate fulfillmentType status{...OrderGroupStatusFragment}showSeller isShippedByWalmart seller{...SellerFragment}id itemCount items{...LiteLineItemFragment}pickupPerson{firstName lastName email}accessPointId shipment{...ShipmentFragment}returnEligibilityMessage actions{...OrderGroupActionsFragment}recipientEmailAddress digitalDelivery{...DigitalDeliveryFragment}tireInstallationReservation{status extraText}}fragment OrderGroupStatusFragment on OrderGroupStatus{statusType showStatusTracker statusTracker{status label isCurrent}message{...textFragment}subtext subMessage{...textFragment}notice helpCenterText{...textFragment}}fragment textFragment on Text{parts{bold url text nativeAction lineBreak}}fragment LiteLineItemFragment on OrderLineItem{id quantity product{name usItemId imageInfo{thumbnailUrl}offerId isAlcohol}priceInfo{linePrice{...price}}}fragment SellerFragment on GroupSeller{id name isPro}fragment DigitalDeliveryFragment on DigitalDelivery{title name instructions{...textFragment}}fragment ShipmentFragment on Shipment{id trackingNumber isExternalTracking trackingUrl proofOfDelivery{photoUrl photoPreviewUrl showPreview}}fragment OrderGroupActionsFragment on OrderGroupActions{reorder edit track changeSlot checkin editDeliveryInstructions editPickupPerson editTip tip cancel enableTip{...orderActionFragment}enableEdit{...orderActionFragment}rescheduleTireInstall{...orderActionFragment}cancelTireInstall{...orderActionFragment}help viewCancellationDetails{...cancellationDetailsActionFragment}}fragment cancellationDetailsActionFragment on CancellationDetailsAction{label heading text{...textFragment}}fragment ODPGroupCategoryFragment on OrderCategory{type name subtext returnMessage substitutionsBanner{...textFragment}showExtendedSubstitutions actions{substitutions{message label type}nilPickReshop{message action{text url}}returnDetails viewCancellationDetails{...cancellationDetailsActionFragment}trackOnInHomeApp}banner{...textFragment}accordionState items{...orderLineItem}substitutions{...orderLineItem fulfilledItems{...orderLineItem}}returnInfo{...returnInfoFragment}}fragment ODPGroupFragment on OrderGroup{id fulfillmentType deliveryMessage deliveryAddress{fullName firstName lastName address{...addressFragment}}deliveryInstructions{text type typeText}deliveryPreferences{text{...textFragment}cta{...orderActionFragment}}editSubstitutionsCutOff status{statusType showStatusTracker message{...textFragment}notice helpCenterText{...textFragment}}itemCount isCategorized categories{...ODPGroupCategoryFragment}seller{id name isPro}shipment{id trackingNumber}actions{reorder edit track changeSlot checkin editDeliveryInstructions editPickupPerson tip cancel help enableTip{...orderActionFragment}enableEdit{...orderActionFragment}viewCancellationDetails{...cancellationDetailsActionFragment}enableInHome{...orderActionFragment}createGiftReceipt}cutOffTimestamp isEditSubstitutionsEligible isInHome giftDetails{recipientAddress{fullName}recipientEmail senderName giftMessage}donationDetails{...orderDonationDetails}}fragment returnInfoFragment on ReturnInfo{returnOrderId type refundPriceDetails{__typename...refundPriceDetailsFragment}refundMessage tierRefundMessage paymentMethods{__typename description cardType paymentType displayValues message{...textFragment}}actions{__typename generate scheduleOrModifyPickup{text url}reschedulePickup editPickupContact}shippingLabelUrl qrCodeImageUrl carriers{__typename id name}pickupCarrier pickupContact{nameAndAddress{fullName firstName lastName address{addressString city state postalCode addressLineOne addressLineTwo country}}phone}pickupConfirmationNumber bannerMessage{...textFragment}}fragment refundPriceDetailsFragment on RefundPriceDetails{subTotal{__typename...orderPriceDetailRowFragment}fees{__typename...orderPriceDetailRowFragment}discounts{__typename...orderPriceDetailRowFragment}taxTotal{__typename...orderPriceDetailRowFragment}grandTotal{__typename...orderPriceDetailRowFragment}}fragment orderPriceDetailRowFragment on OrderPriceDetailRow{label displayValue value info{__typename title message}}fragment addressFragment on OrderAddress{addressString addressLineOne addressLineTwo state postalCode city}fragment ODPPickupInfo on OrderGroup{pickupInstructions pickupPerson{...person}alternatePickupPerson{...person}store{id name address{...addressFragment}}}fragment person on OrderPickupPerson{firstName lastName email}fragment ODPTippingInfo on OrderGroup{addTipMessage{...textFragment}driver{...DriverFragment}tipping{min{...price}max{...price}suggested{...price}preselected}subtotal{...price}}fragment orderActionFragment on Action{text url}fragment orderCustomer on OrderCustomer{id firstName lastName email isGuest isEmailRegistered}fragment OrderFieldsFragment on Order{__typename id version type customer{...orderCustomer}displayId idBarcodeImageUrl(barWidth:3 barHeight:100) isFuelPurchase title shortTitle timezone tippableGroup{...OrderGroupFragment}amendableGroup{id changeSlotIterationsLeft cutOffTimestamp fulfillmentType deliveryAddress{fullName firstName lastName address{addressString addressLineOne addressLineTwo state postalCode city country}}isAmendInProgress}substitutionsBanner{heading subheading longSubheading}groups_2101{__typename...OrderGroupFragment...ODPGroupFragment...ODPPickupInfo...ODPTippingInfo}multiboxBundles{...orderLineItem}itemCancelReasons{__typename...cancelReason}groupCancelReasons{__typename...cancelReason}priceDetails{__typename subTotal{__typename...priceDetailFragment}taxTotal{__typename...priceDetailFragment}grandTotal{__typename...priceDetailFragment}authorizationAmount{__typename...priceDetailFragment}fees{__typename...priceDetailFragment}discounts{__typename...priceDetailFragment}minimumThreshold{__typename...price}belowMinimumFee{__typename...priceDetailFragment}driverTip{__typename...priceDetailFragment}donations{__typename...priceDetailFragment}}paymentMethods{__typename description cardType paymentType displayValues message{...textFragment}actions{connectToCapitalOne{...orderActionFragment}visitAffirm{...orderActionFragment}}}actions{__typename return pendingReturn cancel startReturn{...orderActionFragment}reorder}banners{...textFragment}}","variables":{"orderId":"2812227348570","emailAddress":"zyquariashannon@yahoo.com"}}' \
  --compressed`
 
for (( i=0; i<=4; i++ ))
do
  if [[ $curl49 =~ "error"  || $curl49 =~ "blocked" ]]; then
    echo "Lỗi email số 49"
    indexOrder49=`echo error`
    break
  elif [[ `echo $curl49 | jq '.data.guestOrder.groups_2101['${i[@]}'].items[0].product.usItemId'` == '"755361385"' ]]; then
    indexOrder49=`echo $i`
    indexItem49=`echo 0`
  elif [[ `echo $curl49 | jq '.data.guestOrder.groups_2101['${i[@]}'].items[1].product.usItemId'` == '"755361385"' ]]; then
    indexOrder49=`echo $i`
    indexItem49=`echo 1`
  elif [[ `echo $curl49 | jq '.data.guestOrder.groups_2101['${i[@]}'].items[2].product.usItemId'` == '"755361385"' ]]; then
    indexOrder49=`echo $i`
    indexItem49=`echo 2`
  elif [[ `echo $curl49 | jq '.data.guestOrder.groups_2101['${i[@]}'].items[3].product.usItemId'` == '"755361385"' ]]; then
    indexOrder49=`echo $i`
    indexItem49=`echo 3`
  fi
done

if [[ $indexOrder49 != "error" ]]; then
echo $curl49 | jq '.data.guestOrder.id' >> track-OrderID.txt
echo $curl49 | jq '.data.guestOrder.customer.email' >> track-email.txt
echo $curl49 | jq '.data.guestOrder.groups_2101['$indexOrder49'].items['$indexItem49'].product.usItemId' >> track-usItemId.txt
echo $curl49 | jq '.data.guestOrder.groups_2101['$indexOrder49'].items['$indexItem49'].priceInfo.linePrice.value' >> track-priceValue.txt
echo $curl49 | jq '.data.guestOrder.groups_2101['$indexOrder49'].deliveryAddress.fullName' >> track-fullName.txt
echo $curl49 | jq '.data.guestOrder.groups_2101['$indexOrder49'].deliveryAddress.address.addressString' >> track-address.txt
echo $curl49 | jq '.data.guestOrder.groups_2101['$indexOrder49'].status.message.parts[].text' >> track-status.txt
echo $curl49 | jq '.data.guestOrder.groups_2101['$indexOrder49'].shipment.trackingNumber' >> track-number.txt
echo $curl49 | jq '.data.guestOrder.groups_2101['$indexOrder49'].shipment.trackingUrl' >> track-url.txt
fi

curl50=`curl 'https://www.walmart.com/orchestra/home/graphql' \
  -H 'authority: www.walmart.com' \
  -H 'sec-ch-ua: " Not A;Brand";v="99", "Chromium";v="96", "Microsoft Edge";v="96"' \
  -H 'x-o-platform: rweb' \
  -H 'dnt: 1' \
  -H 'x-o-correlation-id: wrvYiSFTlAmd8j7a8DDmpuyOpCN_heAnwM3v' \
  -H 'device_profile_ref_id: _s1F3NO8Y2JjaBUKPDcY4iFDWiIl9CyqiJjf' \
  -H 'x-latency-trace: 1' \
  -H 'wm_mp: true' \
  -H 'x-o-market: us' \
  -H 'x-o-platform-version: main-253-ebbb47' \
  -H 'x-o-gql-query: query getGuestOrder' \
  -H 'wm_page_url: https://www.walmart.com/orders' \
  -H 'x-apollo-operation-name: getGuestOrder' \
  -H 'sec-ch-ua-platform: "macOS"' \
  -H 'sec-ch-ua-mobile: ?0' \
  -H 'user-agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/96.0.4664.110 Safari/537.36 Edg/96.0.1054.62' \
  -H 'x-o-segment: oaoh' \
  -H 'content-type: application/json' \
  -H 'accept: application/json' \
  -H 'x-enable-server-timing: 1' \
  -H 'x-o-ccm: server' \
  -H 'wm_qos.correlation_id: wrvYiSFTlAmd8j7a8DDmpuyOpCN_heAnwM3v' \
  -H 'origin: https://www.walmart.com' \
  -H 'sec-fetch-site: same-origin' \
  -H 'sec-fetch-mode: cors' \
  -H 'sec-fetch-dest: empty' \
  -H 'referer: https://www.walmart.com/orders' \
  -H 'accept-language: vi' \
  --data-raw $'{"query":"query getGuestOrder($orderId:ID\u0021 $emailAddress:String\u0021){guestOrder(input:{id:$orderId emailAddress:$emailAddress}){...OrderFieldsFragment}}fragment cancelReason on OrderCancelReason{__typename subReasonCode subDescription}fragment priceDetailFragment on OrderPriceDetailRow{label value displayValue info{title message}rowInfo{...orderPriceDetailRowInfo}}fragment orderPriceDetailRowInfo on OrderPriceDetailRowInfo{title message{...textFragment}}fragment price on Price{displayValue value}fragment variants on MapEntry{name value}fragment OrderAddOn on OrderAddOn{lineId uniqueLineId productInfo{name usItemId offerId}quantityString quantityLabel type fulfillmentInstructions{...textFragment}actions{manageProtectionPlan{...orderActionFragment}cancel}priceInfo{linePrice{...price}}quantity isActive}fragment orderDonationDetails on OrderDonationDetails{message{...textFragment}emailReceipt emailReceiptToken status{...textFragment}errorStatus}fragment orderLineItem on OrderLineItem{id uniqueId actions{contactSeller cancel addToCart configureCake reviewItem resendEGiftCardToken protectionPlan{...orderActionFragment}manageProtectionPlan{...orderActionFragment}}isGift digitalDeliveryMessage quantity quantityString quantityLabel isSubstitutionSelected fulfilledItems{id quantityString priceInfo{itemPrice{value}}product{usItemId name}}isReturnable returnEligibilityMessage product{name usItemId imageInfo{thumbnailUrl}canonicalUrl offerId sellerId sellerName hasSellerBadge seller{sellerId name}orderLimit orderMinLimit weightIncrement salesUnit salesUnitType isSubstitutionEligible isAlcohol}reshop{reshopMessage isShippingAvailable minPromiseDate maxPromiseDate}selectedVariants{...variants}variantAdditionalInfo{parts{text nativeAction}}priceInfo{priceDisplayCodes{showItemPrice priceDisplayCondition finalCostByWeight}itemPrice{...price}linePrice{...price}unitPrice{...price}preDiscountedLinePrice{...price}additionalLines{name value}}discounts{label labelText{...textFragment}}itemReviewed activationCodes{label code}protectionPlanMessage{...textFragment}showSeller isShippedByWalmart seller{id name isPro}digitalDeliveryPhoneNumber addOns{...OrderAddOn}multiboxBundleId}fragment DriverFragment on Driver{id firstName photoUrl}fragment OrderGroupFragment on OrderGroup{driver{...DriverFragment}deliveryDate fulfillmentType status{...OrderGroupStatusFragment}showSeller isShippedByWalmart seller{...SellerFragment}id itemCount items{...LiteLineItemFragment}pickupPerson{firstName lastName email}accessPointId shipment{...ShipmentFragment}returnEligibilityMessage actions{...OrderGroupActionsFragment}recipientEmailAddress digitalDelivery{...DigitalDeliveryFragment}tireInstallationReservation{status extraText}}fragment OrderGroupStatusFragment on OrderGroupStatus{statusType showStatusTracker statusTracker{status label isCurrent}message{...textFragment}subtext subMessage{...textFragment}notice helpCenterText{...textFragment}}fragment textFragment on Text{parts{bold url text nativeAction lineBreak}}fragment LiteLineItemFragment on OrderLineItem{id quantity product{name usItemId imageInfo{thumbnailUrl}offerId isAlcohol}priceInfo{linePrice{...price}}}fragment SellerFragment on GroupSeller{id name isPro}fragment DigitalDeliveryFragment on DigitalDelivery{title name instructions{...textFragment}}fragment ShipmentFragment on Shipment{id trackingNumber isExternalTracking trackingUrl proofOfDelivery{photoUrl photoPreviewUrl showPreview}}fragment OrderGroupActionsFragment on OrderGroupActions{reorder edit track changeSlot checkin editDeliveryInstructions editPickupPerson editTip tip cancel enableTip{...orderActionFragment}enableEdit{...orderActionFragment}rescheduleTireInstall{...orderActionFragment}cancelTireInstall{...orderActionFragment}help viewCancellationDetails{...cancellationDetailsActionFragment}}fragment cancellationDetailsActionFragment on CancellationDetailsAction{label heading text{...textFragment}}fragment ODPGroupCategoryFragment on OrderCategory{type name subtext returnMessage substitutionsBanner{...textFragment}showExtendedSubstitutions actions{substitutions{message label type}nilPickReshop{message action{text url}}returnDetails viewCancellationDetails{...cancellationDetailsActionFragment}trackOnInHomeApp}banner{...textFragment}accordionState items{...orderLineItem}substitutions{...orderLineItem fulfilledItems{...orderLineItem}}returnInfo{...returnInfoFragment}}fragment ODPGroupFragment on OrderGroup{id fulfillmentType deliveryMessage deliveryAddress{fullName firstName lastName address{...addressFragment}}deliveryInstructions{text type typeText}deliveryPreferences{text{...textFragment}cta{...orderActionFragment}}editSubstitutionsCutOff status{statusType showStatusTracker message{...textFragment}notice helpCenterText{...textFragment}}itemCount isCategorized categories{...ODPGroupCategoryFragment}seller{id name isPro}shipment{id trackingNumber}actions{reorder edit track changeSlot checkin editDeliveryInstructions editPickupPerson tip cancel help enableTip{...orderActionFragment}enableEdit{...orderActionFragment}viewCancellationDetails{...cancellationDetailsActionFragment}enableInHome{...orderActionFragment}createGiftReceipt}cutOffTimestamp isEditSubstitutionsEligible isInHome giftDetails{recipientAddress{fullName}recipientEmail senderName giftMessage}donationDetails{...orderDonationDetails}}fragment returnInfoFragment on ReturnInfo{returnOrderId type refundPriceDetails{__typename...refundPriceDetailsFragment}refundMessage tierRefundMessage paymentMethods{__typename description cardType paymentType displayValues message{...textFragment}}actions{__typename generate scheduleOrModifyPickup{text url}reschedulePickup editPickupContact}shippingLabelUrl qrCodeImageUrl carriers{__typename id name}pickupCarrier pickupContact{nameAndAddress{fullName firstName lastName address{addressString city state postalCode addressLineOne addressLineTwo country}}phone}pickupConfirmationNumber bannerMessage{...textFragment}}fragment refundPriceDetailsFragment on RefundPriceDetails{subTotal{__typename...orderPriceDetailRowFragment}fees{__typename...orderPriceDetailRowFragment}discounts{__typename...orderPriceDetailRowFragment}taxTotal{__typename...orderPriceDetailRowFragment}grandTotal{__typename...orderPriceDetailRowFragment}}fragment orderPriceDetailRowFragment on OrderPriceDetailRow{label displayValue value info{__typename title message}}fragment addressFragment on OrderAddress{addressString addressLineOne addressLineTwo state postalCode city}fragment ODPPickupInfo on OrderGroup{pickupInstructions pickupPerson{...person}alternatePickupPerson{...person}store{id name address{...addressFragment}}}fragment person on OrderPickupPerson{firstName lastName email}fragment ODPTippingInfo on OrderGroup{addTipMessage{...textFragment}driver{...DriverFragment}tipping{min{...price}max{...price}suggested{...price}preselected}subtotal{...price}}fragment orderActionFragment on Action{text url}fragment orderCustomer on OrderCustomer{id firstName lastName email isGuest isEmailRegistered}fragment OrderFieldsFragment on Order{__typename id version type customer{...orderCustomer}displayId idBarcodeImageUrl(barWidth:3 barHeight:100) isFuelPurchase title shortTitle timezone tippableGroup{...OrderGroupFragment}amendableGroup{id changeSlotIterationsLeft cutOffTimestamp fulfillmentType deliveryAddress{fullName firstName lastName address{addressString addressLineOne addressLineTwo state postalCode city country}}isAmendInProgress}substitutionsBanner{heading subheading longSubheading}groups_2101{__typename...OrderGroupFragment...ODPGroupFragment...ODPPickupInfo...ODPTippingInfo}multiboxBundles{...orderLineItem}itemCancelReasons{__typename...cancelReason}groupCancelReasons{__typename...cancelReason}priceDetails{__typename subTotal{__typename...priceDetailFragment}taxTotal{__typename...priceDetailFragment}grandTotal{__typename...priceDetailFragment}authorizationAmount{__typename...priceDetailFragment}fees{__typename...priceDetailFragment}discounts{__typename...priceDetailFragment}minimumThreshold{__typename...price}belowMinimumFee{__typename...priceDetailFragment}driverTip{__typename...priceDetailFragment}donations{__typename...priceDetailFragment}}paymentMethods{__typename description cardType paymentType displayValues message{...textFragment}actions{connectToCapitalOne{...orderActionFragment}visitAffirm{...orderActionFragment}}}actions{__typename return pendingReturn cancel startReturn{...orderActionFragment}reorder}banners{...textFragment}}","variables":{"orderId":"2812227938538","emailAddress":"trishacarper2007@yahoo.com"}}' \
  --compressed`
 
for (( i=0; i<=4; i++ ))
do
  if [[ $curl50 =~ "error"  || $curl50 =~ "blocked" ]]; then
    echo "Lỗi email số 50"
    indexOrder50=`echo error`
    break
  elif [[ `echo $curl50 | jq '.data.guestOrder.groups_2101['${i[@]}'].items[0].product.usItemId'` == '"251382558"' ]]; then
    indexOrder50=`echo $i`
    indexItem50=`echo 0`
  elif [[ `echo $curl50 | jq '.data.guestOrder.groups_2101['${i[@]}'].items[1].product.usItemId'` == '"251382558"' ]]; then
    indexOrder50=`echo $i`
    indexItem50=`echo 1`
  elif [[ `echo $curl50 | jq '.data.guestOrder.groups_2101['${i[@]}'].items[2].product.usItemId'` == '"251382558"' ]]; then
    indexOrder50=`echo $i`
    indexItem50=`echo 2`
  elif [[ `echo $curl50 | jq '.data.guestOrder.groups_2101['${i[@]}'].items[3].product.usItemId'` == '"251382558"' ]]; then
    indexOrder50=`echo $i`
    indexItem50=`echo 3`
  fi
done

if [[ $indexOrder50 != "error" ]]; then
echo $curl50 | jq '.data.guestOrder.id' >> track-OrderID.txt
echo $curl50 | jq '.data.guestOrder.customer.email' >> track-email.txt
echo $curl50 | jq '.data.guestOrder.groups_2101['$indexOrder50'].items['$indexItem50'].product.usItemId' >> track-usItemId.txt
echo $curl50 | jq '.data.guestOrder.groups_2101['$indexOrder50'].items['$indexItem50'].priceInfo.linePrice.value' >> track-priceValue.txt
echo $curl50 | jq '.data.guestOrder.groups_2101['$indexOrder50'].deliveryAddress.fullName' >> track-fullName.txt
echo $curl50 | jq '.data.guestOrder.groups_2101['$indexOrder50'].deliveryAddress.address.addressString' >> track-address.txt
echo $curl50 | jq '.data.guestOrder.groups_2101['$indexOrder50'].status.message.parts[].text' >> track-status.txt
echo $curl50 | jq '.data.guestOrder.groups_2101['$indexOrder50'].shipment.trackingNumber' >> track-number.txt
echo $curl50 | jq '.data.guestOrder.groups_2101['$indexOrder50'].shipment.trackingUrl' >> track-url.txt
fi

curl51=`curl 'https://www.walmart.com/orchestra/home/graphql' \
  -H 'authority: www.walmart.com' \
  -H 'sec-ch-ua: " Not A;Brand";v="99", "Chromium";v="96", "Microsoft Edge";v="96"' \
  -H 'x-o-platform: rweb' \
  -H 'dnt: 1' \
  -H 'x-o-correlation-id: wrvYiSFTlAmd8j7a8DDmpuyOpCN_heAnwM3v' \
  -H 'device_profile_ref_id: _s1F3NO8Y2JjaBUKPDcY4iFDWiIl9CyqiJjf' \
  -H 'x-latency-trace: 1' \
  -H 'wm_mp: true' \
  -H 'x-o-market: us' \
  -H 'x-o-platform-version: main-253-ebbb47' \
  -H 'x-o-gql-query: query getGuestOrder' \
  -H 'wm_page_url: https://www.walmart.com/orders' \
  -H 'x-apollo-operation-name: getGuestOrder' \
  -H 'sec-ch-ua-platform: "macOS"' \
  -H 'sec-ch-ua-mobile: ?0' \
  -H 'user-agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/96.0.4664.110 Safari/537.36 Edg/96.0.1054.62' \
  -H 'x-o-segment: oaoh' \
  -H 'content-type: application/json' \
  -H 'accept: application/json' \
  -H 'x-enable-server-timing: 1' \
  -H 'x-o-ccm: server' \
  -H 'wm_qos.correlation_id: wrvYiSFTlAmd8j7a8DDmpuyOpCN_heAnwM3v' \
  -H 'origin: https://www.walmart.com' \
  -H 'sec-fetch-site: same-origin' \
  -H 'sec-fetch-mode: cors' \
  -H 'sec-fetch-dest: empty' \
  -H 'referer: https://www.walmart.com/orders' \
  -H 'accept-language: vi' \
  --data-raw $'{"query":"query getGuestOrder($orderId:ID\u0021 $emailAddress:String\u0021){guestOrder(input:{id:$orderId emailAddress:$emailAddress}){...OrderFieldsFragment}}fragment cancelReason on OrderCancelReason{__typename subReasonCode subDescription}fragment priceDetailFragment on OrderPriceDetailRow{label value displayValue info{title message}rowInfo{...orderPriceDetailRowInfo}}fragment orderPriceDetailRowInfo on OrderPriceDetailRowInfo{title message{...textFragment}}fragment price on Price{displayValue value}fragment variants on MapEntry{name value}fragment OrderAddOn on OrderAddOn{lineId uniqueLineId productInfo{name usItemId offerId}quantityString quantityLabel type fulfillmentInstructions{...textFragment}actions{manageProtectionPlan{...orderActionFragment}cancel}priceInfo{linePrice{...price}}quantity isActive}fragment orderDonationDetails on OrderDonationDetails{message{...textFragment}emailReceipt emailReceiptToken status{...textFragment}errorStatus}fragment orderLineItem on OrderLineItem{id uniqueId actions{contactSeller cancel addToCart configureCake reviewItem resendEGiftCardToken protectionPlan{...orderActionFragment}manageProtectionPlan{...orderActionFragment}}isGift digitalDeliveryMessage quantity quantityString quantityLabel isSubstitutionSelected fulfilledItems{id quantityString priceInfo{itemPrice{value}}product{usItemId name}}isReturnable returnEligibilityMessage product{name usItemId imageInfo{thumbnailUrl}canonicalUrl offerId sellerId sellerName hasSellerBadge seller{sellerId name}orderLimit orderMinLimit weightIncrement salesUnit salesUnitType isSubstitutionEligible isAlcohol}reshop{reshopMessage isShippingAvailable minPromiseDate maxPromiseDate}selectedVariants{...variants}variantAdditionalInfo{parts{text nativeAction}}priceInfo{priceDisplayCodes{showItemPrice priceDisplayCondition finalCostByWeight}itemPrice{...price}linePrice{...price}unitPrice{...price}preDiscountedLinePrice{...price}additionalLines{name value}}discounts{label labelText{...textFragment}}itemReviewed activationCodes{label code}protectionPlanMessage{...textFragment}showSeller isShippedByWalmart seller{id name isPro}digitalDeliveryPhoneNumber addOns{...OrderAddOn}multiboxBundleId}fragment DriverFragment on Driver{id firstName photoUrl}fragment OrderGroupFragment on OrderGroup{driver{...DriverFragment}deliveryDate fulfillmentType status{...OrderGroupStatusFragment}showSeller isShippedByWalmart seller{...SellerFragment}id itemCount items{...LiteLineItemFragment}pickupPerson{firstName lastName email}accessPointId shipment{...ShipmentFragment}returnEligibilityMessage actions{...OrderGroupActionsFragment}recipientEmailAddress digitalDelivery{...DigitalDeliveryFragment}tireInstallationReservation{status extraText}}fragment OrderGroupStatusFragment on OrderGroupStatus{statusType showStatusTracker statusTracker{status label isCurrent}message{...textFragment}subtext subMessage{...textFragment}notice helpCenterText{...textFragment}}fragment textFragment on Text{parts{bold url text nativeAction lineBreak}}fragment LiteLineItemFragment on OrderLineItem{id quantity product{name usItemId imageInfo{thumbnailUrl}offerId isAlcohol}priceInfo{linePrice{...price}}}fragment SellerFragment on GroupSeller{id name isPro}fragment DigitalDeliveryFragment on DigitalDelivery{title name instructions{...textFragment}}fragment ShipmentFragment on Shipment{id trackingNumber isExternalTracking trackingUrl proofOfDelivery{photoUrl photoPreviewUrl showPreview}}fragment OrderGroupActionsFragment on OrderGroupActions{reorder edit track changeSlot checkin editDeliveryInstructions editPickupPerson editTip tip cancel enableTip{...orderActionFragment}enableEdit{...orderActionFragment}rescheduleTireInstall{...orderActionFragment}cancelTireInstall{...orderActionFragment}help viewCancellationDetails{...cancellationDetailsActionFragment}}fragment cancellationDetailsActionFragment on CancellationDetailsAction{label heading text{...textFragment}}fragment ODPGroupCategoryFragment on OrderCategory{type name subtext returnMessage substitutionsBanner{...textFragment}showExtendedSubstitutions actions{substitutions{message label type}nilPickReshop{message action{text url}}returnDetails viewCancellationDetails{...cancellationDetailsActionFragment}trackOnInHomeApp}banner{...textFragment}accordionState items{...orderLineItem}substitutions{...orderLineItem fulfilledItems{...orderLineItem}}returnInfo{...returnInfoFragment}}fragment ODPGroupFragment on OrderGroup{id fulfillmentType deliveryMessage deliveryAddress{fullName firstName lastName address{...addressFragment}}deliveryInstructions{text type typeText}deliveryPreferences{text{...textFragment}cta{...orderActionFragment}}editSubstitutionsCutOff status{statusType showStatusTracker message{...textFragment}notice helpCenterText{...textFragment}}itemCount isCategorized categories{...ODPGroupCategoryFragment}seller{id name isPro}shipment{id trackingNumber}actions{reorder edit track changeSlot checkin editDeliveryInstructions editPickupPerson tip cancel help enableTip{...orderActionFragment}enableEdit{...orderActionFragment}viewCancellationDetails{...cancellationDetailsActionFragment}enableInHome{...orderActionFragment}createGiftReceipt}cutOffTimestamp isEditSubstitutionsEligible isInHome giftDetails{recipientAddress{fullName}recipientEmail senderName giftMessage}donationDetails{...orderDonationDetails}}fragment returnInfoFragment on ReturnInfo{returnOrderId type refundPriceDetails{__typename...refundPriceDetailsFragment}refundMessage tierRefundMessage paymentMethods{__typename description cardType paymentType displayValues message{...textFragment}}actions{__typename generate scheduleOrModifyPickup{text url}reschedulePickup editPickupContact}shippingLabelUrl qrCodeImageUrl carriers{__typename id name}pickupCarrier pickupContact{nameAndAddress{fullName firstName lastName address{addressString city state postalCode addressLineOne addressLineTwo country}}phone}pickupConfirmationNumber bannerMessage{...textFragment}}fragment refundPriceDetailsFragment on RefundPriceDetails{subTotal{__typename...orderPriceDetailRowFragment}fees{__typename...orderPriceDetailRowFragment}discounts{__typename...orderPriceDetailRowFragment}taxTotal{__typename...orderPriceDetailRowFragment}grandTotal{__typename...orderPriceDetailRowFragment}}fragment orderPriceDetailRowFragment on OrderPriceDetailRow{label displayValue value info{__typename title message}}fragment addressFragment on OrderAddress{addressString addressLineOne addressLineTwo state postalCode city}fragment ODPPickupInfo on OrderGroup{pickupInstructions pickupPerson{...person}alternatePickupPerson{...person}store{id name address{...addressFragment}}}fragment person on OrderPickupPerson{firstName lastName email}fragment ODPTippingInfo on OrderGroup{addTipMessage{...textFragment}driver{...DriverFragment}tipping{min{...price}max{...price}suggested{...price}preselected}subtotal{...price}}fragment orderActionFragment on Action{text url}fragment orderCustomer on OrderCustomer{id firstName lastName email isGuest isEmailRegistered}fragment OrderFieldsFragment on Order{__typename id version type customer{...orderCustomer}displayId idBarcodeImageUrl(barWidth:3 barHeight:100) isFuelPurchase title shortTitle timezone tippableGroup{...OrderGroupFragment}amendableGroup{id changeSlotIterationsLeft cutOffTimestamp fulfillmentType deliveryAddress{fullName firstName lastName address{addressString addressLineOne addressLineTwo state postalCode city country}}isAmendInProgress}substitutionsBanner{heading subheading longSubheading}groups_2101{__typename...OrderGroupFragment...ODPGroupFragment...ODPPickupInfo...ODPTippingInfo}multiboxBundles{...orderLineItem}itemCancelReasons{__typename...cancelReason}groupCancelReasons{__typename...cancelReason}priceDetails{__typename subTotal{__typename...priceDetailFragment}taxTotal{__typename...priceDetailFragment}grandTotal{__typename...priceDetailFragment}authorizationAmount{__typename...priceDetailFragment}fees{__typename...priceDetailFragment}discounts{__typename...priceDetailFragment}minimumThreshold{__typename...price}belowMinimumFee{__typename...priceDetailFragment}driverTip{__typename...priceDetailFragment}donations{__typename...priceDetailFragment}}paymentMethods{__typename description cardType paymentType displayValues message{...textFragment}actions{connectToCapitalOne{...orderActionFragment}visitAffirm{...orderActionFragment}}}actions{__typename return pendingReturn cancel startReturn{...orderActionFragment}reorder}banners{...textFragment}}","variables":{"orderId":"2832232556831","emailAddress":"knazzrn@yahoo.com"}}' \
  --compressed`
 
for (( i=0; i<=4; i++ ))
do
  if [[ $curl51 =~ "error"  || $curl51 =~ "blocked" ]]; then
    echo "Lỗi email số 51"
    indexOrder51=`echo error`
    break
  elif [[ `echo $curl51 | jq '.data.guestOrder.groups_2101['${i[@]}'].items[0].product.usItemId'` == '"755857661"' ]]; then
    indexOrder51=`echo $i`
    indexItem51=`echo 0`
  elif [[ `echo $curl51 | jq '.data.guestOrder.groups_2101['${i[@]}'].items[1].product.usItemId'` == '"755857661"' ]]; then
    indexOrder51=`echo $i`
    indexItem51=`echo 1`
  elif [[ `echo $curl51 | jq '.data.guestOrder.groups_2101['${i[@]}'].items[2].product.usItemId'` == '"755857661"' ]]; then
    indexOrder51=`echo $i`
    indexItem51=`echo 2`
  elif [[ `echo $curl51 | jq '.data.guestOrder.groups_2101['${i[@]}'].items[3].product.usItemId'` == '"755857661"' ]]; then
    indexOrder51=`echo $i`
    indexItem51=`echo 3`
  fi
done

if [[ $indexOrder51 != "error" ]]; then
echo $curl51 | jq '.data.guestOrder.id' >> track-OrderID.txt
echo $curl51 | jq '.data.guestOrder.customer.email' >> track-email.txt
echo $curl51 | jq '.data.guestOrder.groups_2101['$indexOrder51'].items['$indexItem51'].product.usItemId' >> track-usItemId.txt
echo $curl51 | jq '.data.guestOrder.groups_2101['$indexOrder51'].items['$indexItem51'].priceInfo.linePrice.value' >> track-priceValue.txt
echo $curl51 | jq '.data.guestOrder.groups_2101['$indexOrder51'].deliveryAddress.fullName' >> track-fullName.txt
echo $curl51 | jq '.data.guestOrder.groups_2101['$indexOrder51'].deliveryAddress.address.addressString' >> track-address.txt
echo $curl51 | jq '.data.guestOrder.groups_2101['$indexOrder51'].status.message.parts[].text' >> track-status.txt
echo $curl51 | jq '.data.guestOrder.groups_2101['$indexOrder51'].shipment.trackingNumber' >> track-number.txt
echo $curl51 | jq '.data.guestOrder.groups_2101['$indexOrder51'].shipment.trackingUrl' >> track-url.txt
fi

curl52=`curl 'https://www.walmart.com/orchestra/home/graphql' \
  -H 'authority: www.walmart.com' \
  -H 'sec-ch-ua: " Not A;Brand";v="99", "Chromium";v="96", "Microsoft Edge";v="96"' \
  -H 'x-o-platform: rweb' \
  -H 'dnt: 1' \
  -H 'x-o-correlation-id: wrvYiSFTlAmd8j7a8DDmpuyOpCN_heAnwM3v' \
  -H 'device_profile_ref_id: _s1F3NO8Y2JjaBUKPDcY4iFDWiIl9CyqiJjf' \
  -H 'x-latency-trace: 1' \
  -H 'wm_mp: true' \
  -H 'x-o-market: us' \
  -H 'x-o-platform-version: main-253-ebbb47' \
  -H 'x-o-gql-query: query getGuestOrder' \
  -H 'wm_page_url: https://www.walmart.com/orders' \
  -H 'x-apollo-operation-name: getGuestOrder' \
  -H 'sec-ch-ua-platform: "macOS"' \
  -H 'sec-ch-ua-mobile: ?0' \
  -H 'user-agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/96.0.4664.110 Safari/537.36 Edg/96.0.1054.62' \
  -H 'x-o-segment: oaoh' \
  -H 'content-type: application/json' \
  -H 'accept: application/json' \
  -H 'x-enable-server-timing: 1' \
  -H 'x-o-ccm: server' \
  -H 'wm_qos.correlation_id: wrvYiSFTlAmd8j7a8DDmpuyOpCN_heAnwM3v' \
  -H 'origin: https://www.walmart.com' \
  -H 'sec-fetch-site: same-origin' \
  -H 'sec-fetch-mode: cors' \
  -H 'sec-fetch-dest: empty' \
  -H 'referer: https://www.walmart.com/orders' \
  -H 'accept-language: vi' \
  --data-raw $'{"query":"query getGuestOrder($orderId:ID\u0021 $emailAddress:String\u0021){guestOrder(input:{id:$orderId emailAddress:$emailAddress}){...OrderFieldsFragment}}fragment cancelReason on OrderCancelReason{__typename subReasonCode subDescription}fragment priceDetailFragment on OrderPriceDetailRow{label value displayValue info{title message}rowInfo{...orderPriceDetailRowInfo}}fragment orderPriceDetailRowInfo on OrderPriceDetailRowInfo{title message{...textFragment}}fragment price on Price{displayValue value}fragment variants on MapEntry{name value}fragment OrderAddOn on OrderAddOn{lineId uniqueLineId productInfo{name usItemId offerId}quantityString quantityLabel type fulfillmentInstructions{...textFragment}actions{manageProtectionPlan{...orderActionFragment}cancel}priceInfo{linePrice{...price}}quantity isActive}fragment orderDonationDetails on OrderDonationDetails{message{...textFragment}emailReceipt emailReceiptToken status{...textFragment}errorStatus}fragment orderLineItem on OrderLineItem{id uniqueId actions{contactSeller cancel addToCart configureCake reviewItem resendEGiftCardToken protectionPlan{...orderActionFragment}manageProtectionPlan{...orderActionFragment}}isGift digitalDeliveryMessage quantity quantityString quantityLabel isSubstitutionSelected fulfilledItems{id quantityString priceInfo{itemPrice{value}}product{usItemId name}}isReturnable returnEligibilityMessage product{name usItemId imageInfo{thumbnailUrl}canonicalUrl offerId sellerId sellerName hasSellerBadge seller{sellerId name}orderLimit orderMinLimit weightIncrement salesUnit salesUnitType isSubstitutionEligible isAlcohol}reshop{reshopMessage isShippingAvailable minPromiseDate maxPromiseDate}selectedVariants{...variants}variantAdditionalInfo{parts{text nativeAction}}priceInfo{priceDisplayCodes{showItemPrice priceDisplayCondition finalCostByWeight}itemPrice{...price}linePrice{...price}unitPrice{...price}preDiscountedLinePrice{...price}additionalLines{name value}}discounts{label labelText{...textFragment}}itemReviewed activationCodes{label code}protectionPlanMessage{...textFragment}showSeller isShippedByWalmart seller{id name isPro}digitalDeliveryPhoneNumber addOns{...OrderAddOn}multiboxBundleId}fragment DriverFragment on Driver{id firstName photoUrl}fragment OrderGroupFragment on OrderGroup{driver{...DriverFragment}deliveryDate fulfillmentType status{...OrderGroupStatusFragment}showSeller isShippedByWalmart seller{...SellerFragment}id itemCount items{...LiteLineItemFragment}pickupPerson{firstName lastName email}accessPointId shipment{...ShipmentFragment}returnEligibilityMessage actions{...OrderGroupActionsFragment}recipientEmailAddress digitalDelivery{...DigitalDeliveryFragment}tireInstallationReservation{status extraText}}fragment OrderGroupStatusFragment on OrderGroupStatus{statusType showStatusTracker statusTracker{status label isCurrent}message{...textFragment}subtext subMessage{...textFragment}notice helpCenterText{...textFragment}}fragment textFragment on Text{parts{bold url text nativeAction lineBreak}}fragment LiteLineItemFragment on OrderLineItem{id quantity product{name usItemId imageInfo{thumbnailUrl}offerId isAlcohol}priceInfo{linePrice{...price}}}fragment SellerFragment on GroupSeller{id name isPro}fragment DigitalDeliveryFragment on DigitalDelivery{title name instructions{...textFragment}}fragment ShipmentFragment on Shipment{id trackingNumber isExternalTracking trackingUrl proofOfDelivery{photoUrl photoPreviewUrl showPreview}}fragment OrderGroupActionsFragment on OrderGroupActions{reorder edit track changeSlot checkin editDeliveryInstructions editPickupPerson editTip tip cancel enableTip{...orderActionFragment}enableEdit{...orderActionFragment}rescheduleTireInstall{...orderActionFragment}cancelTireInstall{...orderActionFragment}help viewCancellationDetails{...cancellationDetailsActionFragment}}fragment cancellationDetailsActionFragment on CancellationDetailsAction{label heading text{...textFragment}}fragment ODPGroupCategoryFragment on OrderCategory{type name subtext returnMessage substitutionsBanner{...textFragment}showExtendedSubstitutions actions{substitutions{message label type}nilPickReshop{message action{text url}}returnDetails viewCancellationDetails{...cancellationDetailsActionFragment}trackOnInHomeApp}banner{...textFragment}accordionState items{...orderLineItem}substitutions{...orderLineItem fulfilledItems{...orderLineItem}}returnInfo{...returnInfoFragment}}fragment ODPGroupFragment on OrderGroup{id fulfillmentType deliveryMessage deliveryAddress{fullName firstName lastName address{...addressFragment}}deliveryInstructions{text type typeText}deliveryPreferences{text{...textFragment}cta{...orderActionFragment}}editSubstitutionsCutOff status{statusType showStatusTracker message{...textFragment}notice helpCenterText{...textFragment}}itemCount isCategorized categories{...ODPGroupCategoryFragment}seller{id name isPro}shipment{id trackingNumber}actions{reorder edit track changeSlot checkin editDeliveryInstructions editPickupPerson tip cancel help enableTip{...orderActionFragment}enableEdit{...orderActionFragment}viewCancellationDetails{...cancellationDetailsActionFragment}enableInHome{...orderActionFragment}createGiftReceipt}cutOffTimestamp isEditSubstitutionsEligible isInHome giftDetails{recipientAddress{fullName}recipientEmail senderName giftMessage}donationDetails{...orderDonationDetails}}fragment returnInfoFragment on ReturnInfo{returnOrderId type refundPriceDetails{__typename...refundPriceDetailsFragment}refundMessage tierRefundMessage paymentMethods{__typename description cardType paymentType displayValues message{...textFragment}}actions{__typename generate scheduleOrModifyPickup{text url}reschedulePickup editPickupContact}shippingLabelUrl qrCodeImageUrl carriers{__typename id name}pickupCarrier pickupContact{nameAndAddress{fullName firstName lastName address{addressString city state postalCode addressLineOne addressLineTwo country}}phone}pickupConfirmationNumber bannerMessage{...textFragment}}fragment refundPriceDetailsFragment on RefundPriceDetails{subTotal{__typename...orderPriceDetailRowFragment}fees{__typename...orderPriceDetailRowFragment}discounts{__typename...orderPriceDetailRowFragment}taxTotal{__typename...orderPriceDetailRowFragment}grandTotal{__typename...orderPriceDetailRowFragment}}fragment orderPriceDetailRowFragment on OrderPriceDetailRow{label displayValue value info{__typename title message}}fragment addressFragment on OrderAddress{addressString addressLineOne addressLineTwo state postalCode city}fragment ODPPickupInfo on OrderGroup{pickupInstructions pickupPerson{...person}alternatePickupPerson{...person}store{id name address{...addressFragment}}}fragment person on OrderPickupPerson{firstName lastName email}fragment ODPTippingInfo on OrderGroup{addTipMessage{...textFragment}driver{...DriverFragment}tipping{min{...price}max{...price}suggested{...price}preselected}subtotal{...price}}fragment orderActionFragment on Action{text url}fragment orderCustomer on OrderCustomer{id firstName lastName email isGuest isEmailRegistered}fragment OrderFieldsFragment on Order{__typename id version type customer{...orderCustomer}displayId idBarcodeImageUrl(barWidth:3 barHeight:100) isFuelPurchase title shortTitle timezone tippableGroup{...OrderGroupFragment}amendableGroup{id changeSlotIterationsLeft cutOffTimestamp fulfillmentType deliveryAddress{fullName firstName lastName address{addressString addressLineOne addressLineTwo state postalCode city country}}isAmendInProgress}substitutionsBanner{heading subheading longSubheading}groups_2101{__typename...OrderGroupFragment...ODPGroupFragment...ODPPickupInfo...ODPTippingInfo}multiboxBundles{...orderLineItem}itemCancelReasons{__typename...cancelReason}groupCancelReasons{__typename...cancelReason}priceDetails{__typename subTotal{__typename...priceDetailFragment}taxTotal{__typename...priceDetailFragment}grandTotal{__typename...priceDetailFragment}authorizationAmount{__typename...priceDetailFragment}fees{__typename...priceDetailFragment}discounts{__typename...priceDetailFragment}minimumThreshold{__typename...price}belowMinimumFee{__typename...priceDetailFragment}driverTip{__typename...priceDetailFragment}donations{__typename...priceDetailFragment}}paymentMethods{__typename description cardType paymentType displayValues message{...textFragment}actions{connectToCapitalOne{...orderActionFragment}visitAffirm{...orderActionFragment}}}actions{__typename return pendingReturn cancel startReturn{...orderActionFragment}reorder}banners{...textFragment}}","variables":{"orderId":"2802227509875","emailAddress":"basedgodalyx@gmail.com"}}' \
  --compressed`
 
for (( i=0; i<=4; i++ ))
do
  if [[ $curl52 =~ "error"  || $curl52 =~ "blocked" ]]; then
    echo "Lỗi email số 52"
    indexOrder52=`echo error`
    break
  elif [[ `echo $curl52 | jq '.data.guestOrder.groups_2101['${i[@]}'].items[0].product.usItemId'` == '"514290555"' ]]; then
    indexOrder52=`echo $i`
    indexItem52=`echo 0`
  elif [[ `echo $curl52 | jq '.data.guestOrder.groups_2101['${i[@]}'].items[1].product.usItemId'` == '"514290555"' ]]; then
    indexOrder52=`echo $i`
    indexItem52=`echo 1`
  elif [[ `echo $curl52 | jq '.data.guestOrder.groups_2101['${i[@]}'].items[2].product.usItemId'` == '"514290555"' ]]; then
    indexOrder52=`echo $i`
    indexItem52=`echo 2`
  elif [[ `echo $curl52 | jq '.data.guestOrder.groups_2101['${i[@]}'].items[3].product.usItemId'` == '"514290555"' ]]; then
    indexOrder52=`echo $i`
    indexItem52=`echo 3`
  fi
done

if [[ $indexOrder52 != "error" ]]; then
echo $curl52 | jq '.data.guestOrder.id' >> track-OrderID.txt
echo $curl52 | jq '.data.guestOrder.customer.email' >> track-email.txt
echo $curl52 | jq '.data.guestOrder.groups_2101['$indexOrder52'].items['$indexItem52'].product.usItemId' >> track-usItemId.txt
echo $curl52 | jq '.data.guestOrder.groups_2101['$indexOrder52'].items['$indexItem52'].priceInfo.linePrice.value' >> track-priceValue.txt
echo $curl52 | jq '.data.guestOrder.groups_2101['$indexOrder52'].deliveryAddress.fullName' >> track-fullName.txt
echo $curl52 | jq '.data.guestOrder.groups_2101['$indexOrder52'].deliveryAddress.address.addressString' >> track-address.txt
echo $curl52 | jq '.data.guestOrder.groups_2101['$indexOrder52'].status.message.parts[].text' >> track-status.txt
echo $curl52 | jq '.data.guestOrder.groups_2101['$indexOrder52'].shipment.trackingNumber' >> track-number.txt
echo $curl52 | jq '.data.guestOrder.groups_2101['$indexOrder52'].shipment.trackingUrl' >> track-url.txt
fi

curl53=`curl 'https://www.walmart.com/orchestra/home/graphql' \
  -H 'authority: www.walmart.com' \
  -H 'sec-ch-ua: " Not A;Brand";v="99", "Chromium";v="96", "Microsoft Edge";v="96"' \
  -H 'x-o-platform: rweb' \
  -H 'dnt: 1' \
  -H 'x-o-correlation-id: wrvYiSFTlAmd8j7a8DDmpuyOpCN_heAnwM3v' \
  -H 'device_profile_ref_id: _s1F3NO8Y2JjaBUKPDcY4iFDWiIl9CyqiJjf' \
  -H 'x-latency-trace: 1' \
  -H 'wm_mp: true' \
  -H 'x-o-market: us' \
  -H 'x-o-platform-version: main-253-ebbb47' \
  -H 'x-o-gql-query: query getGuestOrder' \
  -H 'wm_page_url: https://www.walmart.com/orders' \
  -H 'x-apollo-operation-name: getGuestOrder' \
  -H 'sec-ch-ua-platform: "macOS"' \
  -H 'sec-ch-ua-mobile: ?0' \
  -H 'user-agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/96.0.4664.110 Safari/537.36 Edg/96.0.1054.62' \
  -H 'x-o-segment: oaoh' \
  -H 'content-type: application/json' \
  -H 'accept: application/json' \
  -H 'x-enable-server-timing: 1' \
  -H 'x-o-ccm: server' \
  -H 'wm_qos.correlation_id: wrvYiSFTlAmd8j7a8DDmpuyOpCN_heAnwM3v' \
  -H 'origin: https://www.walmart.com' \
  -H 'sec-fetch-site: same-origin' \
  -H 'sec-fetch-mode: cors' \
  -H 'sec-fetch-dest: empty' \
  -H 'referer: https://www.walmart.com/orders' \
  -H 'accept-language: vi' \
  --data-raw $'{"query":"query getGuestOrder($orderId:ID\u0021 $emailAddress:String\u0021){guestOrder(input:{id:$orderId emailAddress:$emailAddress}){...OrderFieldsFragment}}fragment cancelReason on OrderCancelReason{__typename subReasonCode subDescription}fragment priceDetailFragment on OrderPriceDetailRow{label value displayValue info{title message}rowInfo{...orderPriceDetailRowInfo}}fragment orderPriceDetailRowInfo on OrderPriceDetailRowInfo{title message{...textFragment}}fragment price on Price{displayValue value}fragment variants on MapEntry{name value}fragment OrderAddOn on OrderAddOn{lineId uniqueLineId productInfo{name usItemId offerId}quantityString quantityLabel type fulfillmentInstructions{...textFragment}actions{manageProtectionPlan{...orderActionFragment}cancel}priceInfo{linePrice{...price}}quantity isActive}fragment orderDonationDetails on OrderDonationDetails{message{...textFragment}emailReceipt emailReceiptToken status{...textFragment}errorStatus}fragment orderLineItem on OrderLineItem{id uniqueId actions{contactSeller cancel addToCart configureCake reviewItem resendEGiftCardToken protectionPlan{...orderActionFragment}manageProtectionPlan{...orderActionFragment}}isGift digitalDeliveryMessage quantity quantityString quantityLabel isSubstitutionSelected fulfilledItems{id quantityString priceInfo{itemPrice{value}}product{usItemId name}}isReturnable returnEligibilityMessage product{name usItemId imageInfo{thumbnailUrl}canonicalUrl offerId sellerId sellerName hasSellerBadge seller{sellerId name}orderLimit orderMinLimit weightIncrement salesUnit salesUnitType isSubstitutionEligible isAlcohol}reshop{reshopMessage isShippingAvailable minPromiseDate maxPromiseDate}selectedVariants{...variants}variantAdditionalInfo{parts{text nativeAction}}priceInfo{priceDisplayCodes{showItemPrice priceDisplayCondition finalCostByWeight}itemPrice{...price}linePrice{...price}unitPrice{...price}preDiscountedLinePrice{...price}additionalLines{name value}}discounts{label labelText{...textFragment}}itemReviewed activationCodes{label code}protectionPlanMessage{...textFragment}showSeller isShippedByWalmart seller{id name isPro}digitalDeliveryPhoneNumber addOns{...OrderAddOn}multiboxBundleId}fragment DriverFragment on Driver{id firstName photoUrl}fragment OrderGroupFragment on OrderGroup{driver{...DriverFragment}deliveryDate fulfillmentType status{...OrderGroupStatusFragment}showSeller isShippedByWalmart seller{...SellerFragment}id itemCount items{...LiteLineItemFragment}pickupPerson{firstName lastName email}accessPointId shipment{...ShipmentFragment}returnEligibilityMessage actions{...OrderGroupActionsFragment}recipientEmailAddress digitalDelivery{...DigitalDeliveryFragment}tireInstallationReservation{status extraText}}fragment OrderGroupStatusFragment on OrderGroupStatus{statusType showStatusTracker statusTracker{status label isCurrent}message{...textFragment}subtext subMessage{...textFragment}notice helpCenterText{...textFragment}}fragment textFragment on Text{parts{bold url text nativeAction lineBreak}}fragment LiteLineItemFragment on OrderLineItem{id quantity product{name usItemId imageInfo{thumbnailUrl}offerId isAlcohol}priceInfo{linePrice{...price}}}fragment SellerFragment on GroupSeller{id name isPro}fragment DigitalDeliveryFragment on DigitalDelivery{title name instructions{...textFragment}}fragment ShipmentFragment on Shipment{id trackingNumber isExternalTracking trackingUrl proofOfDelivery{photoUrl photoPreviewUrl showPreview}}fragment OrderGroupActionsFragment on OrderGroupActions{reorder edit track changeSlot checkin editDeliveryInstructions editPickupPerson editTip tip cancel enableTip{...orderActionFragment}enableEdit{...orderActionFragment}rescheduleTireInstall{...orderActionFragment}cancelTireInstall{...orderActionFragment}help viewCancellationDetails{...cancellationDetailsActionFragment}}fragment cancellationDetailsActionFragment on CancellationDetailsAction{label heading text{...textFragment}}fragment ODPGroupCategoryFragment on OrderCategory{type name subtext returnMessage substitutionsBanner{...textFragment}showExtendedSubstitutions actions{substitutions{message label type}nilPickReshop{message action{text url}}returnDetails viewCancellationDetails{...cancellationDetailsActionFragment}trackOnInHomeApp}banner{...textFragment}accordionState items{...orderLineItem}substitutions{...orderLineItem fulfilledItems{...orderLineItem}}returnInfo{...returnInfoFragment}}fragment ODPGroupFragment on OrderGroup{id fulfillmentType deliveryMessage deliveryAddress{fullName firstName lastName address{...addressFragment}}deliveryInstructions{text type typeText}deliveryPreferences{text{...textFragment}cta{...orderActionFragment}}editSubstitutionsCutOff status{statusType showStatusTracker message{...textFragment}notice helpCenterText{...textFragment}}itemCount isCategorized categories{...ODPGroupCategoryFragment}seller{id name isPro}shipment{id trackingNumber}actions{reorder edit track changeSlot checkin editDeliveryInstructions editPickupPerson tip cancel help enableTip{...orderActionFragment}enableEdit{...orderActionFragment}viewCancellationDetails{...cancellationDetailsActionFragment}enableInHome{...orderActionFragment}createGiftReceipt}cutOffTimestamp isEditSubstitutionsEligible isInHome giftDetails{recipientAddress{fullName}recipientEmail senderName giftMessage}donationDetails{...orderDonationDetails}}fragment returnInfoFragment on ReturnInfo{returnOrderId type refundPriceDetails{__typename...refundPriceDetailsFragment}refundMessage tierRefundMessage paymentMethods{__typename description cardType paymentType displayValues message{...textFragment}}actions{__typename generate scheduleOrModifyPickup{text url}reschedulePickup editPickupContact}shippingLabelUrl qrCodeImageUrl carriers{__typename id name}pickupCarrier pickupContact{nameAndAddress{fullName firstName lastName address{addressString city state postalCode addressLineOne addressLineTwo country}}phone}pickupConfirmationNumber bannerMessage{...textFragment}}fragment refundPriceDetailsFragment on RefundPriceDetails{subTotal{__typename...orderPriceDetailRowFragment}fees{__typename...orderPriceDetailRowFragment}discounts{__typename...orderPriceDetailRowFragment}taxTotal{__typename...orderPriceDetailRowFragment}grandTotal{__typename...orderPriceDetailRowFragment}}fragment orderPriceDetailRowFragment on OrderPriceDetailRow{label displayValue value info{__typename title message}}fragment addressFragment on OrderAddress{addressString addressLineOne addressLineTwo state postalCode city}fragment ODPPickupInfo on OrderGroup{pickupInstructions pickupPerson{...person}alternatePickupPerson{...person}store{id name address{...addressFragment}}}fragment person on OrderPickupPerson{firstName lastName email}fragment ODPTippingInfo on OrderGroup{addTipMessage{...textFragment}driver{...DriverFragment}tipping{min{...price}max{...price}suggested{...price}preselected}subtotal{...price}}fragment orderActionFragment on Action{text url}fragment orderCustomer on OrderCustomer{id firstName lastName email isGuest isEmailRegistered}fragment OrderFieldsFragment on Order{__typename id version type customer{...orderCustomer}displayId idBarcodeImageUrl(barWidth:3 barHeight:100) isFuelPurchase title shortTitle timezone tippableGroup{...OrderGroupFragment}amendableGroup{id changeSlotIterationsLeft cutOffTimestamp fulfillmentType deliveryAddress{fullName firstName lastName address{addressString addressLineOne addressLineTwo state postalCode city country}}isAmendInProgress}substitutionsBanner{heading subheading longSubheading}groups_2101{__typename...OrderGroupFragment...ODPGroupFragment...ODPPickupInfo...ODPTippingInfo}multiboxBundles{...orderLineItem}itemCancelReasons{__typename...cancelReason}groupCancelReasons{__typename...cancelReason}priceDetails{__typename subTotal{__typename...priceDetailFragment}taxTotal{__typename...priceDetailFragment}grandTotal{__typename...priceDetailFragment}authorizationAmount{__typename...priceDetailFragment}fees{__typename...priceDetailFragment}discounts{__typename...priceDetailFragment}minimumThreshold{__typename...price}belowMinimumFee{__typename...priceDetailFragment}driverTip{__typename...priceDetailFragment}donations{__typename...priceDetailFragment}}paymentMethods{__typename description cardType paymentType displayValues message{...textFragment}actions{connectToCapitalOne{...orderActionFragment}visitAffirm{...orderActionFragment}}}actions{__typename return pendingReturn cancel startReturn{...orderActionFragment}reorder}banners{...textFragment}}","variables":{"orderId":"2842234926606","emailAddress":"aldino62@yahoo.com"}}' \
  --compressed`
 
for (( i=0; i<=4; i++ ))
do
  if [[ $curl53 =~ "error"  || $curl53 =~ "blocked" ]]; then
    echo "Lỗi email số 53"
    indexOrder53=`echo error`
    break
  elif [[ `echo $curl53 | jq '.data.guestOrder.groups_2101['${i[@]}'].items[0].product.usItemId'` == '"318995418"' ]]; then
    indexOrder53=`echo $i`
    indexItem53=`echo 0`
  elif [[ `echo $curl53 | jq '.data.guestOrder.groups_2101['${i[@]}'].items[1].product.usItemId'` == '"318995418"' ]]; then
    indexOrder53=`echo $i`
    indexItem53=`echo 1`
  elif [[ `echo $curl53 | jq '.data.guestOrder.groups_2101['${i[@]}'].items[2].product.usItemId'` == '"318995418"' ]]; then
    indexOrder53=`echo $i`
    indexItem53=`echo 2`
  elif [[ `echo $curl53 | jq '.data.guestOrder.groups_2101['${i[@]}'].items[3].product.usItemId'` == '"318995418"' ]]; then
    indexOrder53=`echo $i`
    indexItem53=`echo 3`
  fi
done

if [[ $indexOrder53 != "error" ]]; then
echo $curl53 | jq '.data.guestOrder.id' >> track-OrderID.txt
echo $curl53 | jq '.data.guestOrder.customer.email' >> track-email.txt
echo $curl53 | jq '.data.guestOrder.groups_2101['$indexOrder53'].items['$indexItem53'].product.usItemId' >> track-usItemId.txt
echo $curl53 | jq '.data.guestOrder.groups_2101['$indexOrder53'].items['$indexItem53'].priceInfo.linePrice.value' >> track-priceValue.txt
echo $curl53 | jq '.data.guestOrder.groups_2101['$indexOrder53'].deliveryAddress.fullName' >> track-fullName.txt
echo $curl53 | jq '.data.guestOrder.groups_2101['$indexOrder53'].deliveryAddress.address.addressString' >> track-address.txt
echo $curl53 | jq '.data.guestOrder.groups_2101['$indexOrder53'].status.message.parts[].text' >> track-status.txt
echo $curl53 | jq '.data.guestOrder.groups_2101['$indexOrder53'].shipment.trackingNumber' >> track-number.txt
echo $curl53 | jq '.data.guestOrder.groups_2101['$indexOrder53'].shipment.trackingUrl' >> track-url.txt
fi

curl54=`curl 'https://www.walmart.com/orchestra/home/graphql' \
  -H 'authority: www.walmart.com' \
  -H 'sec-ch-ua: " Not A;Brand";v="99", "Chromium";v="96", "Microsoft Edge";v="96"' \
  -H 'x-o-platform: rweb' \
  -H 'dnt: 1' \
  -H 'x-o-correlation-id: wrvYiSFTlAmd8j7a8DDmpuyOpCN_heAnwM3v' \
  -H 'device_profile_ref_id: _s1F3NO8Y2JjaBUKPDcY4iFDWiIl9CyqiJjf' \
  -H 'x-latency-trace: 1' \
  -H 'wm_mp: true' \
  -H 'x-o-market: us' \
  -H 'x-o-platform-version: main-253-ebbb47' \
  -H 'x-o-gql-query: query getGuestOrder' \
  -H 'wm_page_url: https://www.walmart.com/orders' \
  -H 'x-apollo-operation-name: getGuestOrder' \
  -H 'sec-ch-ua-platform: "macOS"' \
  -H 'sec-ch-ua-mobile: ?0' \
  -H 'user-agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/96.0.4664.110 Safari/537.36 Edg/96.0.1054.62' \
  -H 'x-o-segment: oaoh' \
  -H 'content-type: application/json' \
  -H 'accept: application/json' \
  -H 'x-enable-server-timing: 1' \
  -H 'x-o-ccm: server' \
  -H 'wm_qos.correlation_id: wrvYiSFTlAmd8j7a8DDmpuyOpCN_heAnwM3v' \
  -H 'origin: https://www.walmart.com' \
  -H 'sec-fetch-site: same-origin' \
  -H 'sec-fetch-mode: cors' \
  -H 'sec-fetch-dest: empty' \
  -H 'referer: https://www.walmart.com/orders' \
  -H 'accept-language: vi' \
  --data-raw $'{"query":"query getGuestOrder($orderId:ID\u0021 $emailAddress:String\u0021){guestOrder(input:{id:$orderId emailAddress:$emailAddress}){...OrderFieldsFragment}}fragment cancelReason on OrderCancelReason{__typename subReasonCode subDescription}fragment priceDetailFragment on OrderPriceDetailRow{label value displayValue info{title message}rowInfo{...orderPriceDetailRowInfo}}fragment orderPriceDetailRowInfo on OrderPriceDetailRowInfo{title message{...textFragment}}fragment price on Price{displayValue value}fragment variants on MapEntry{name value}fragment OrderAddOn on OrderAddOn{lineId uniqueLineId productInfo{name usItemId offerId}quantityString quantityLabel type fulfillmentInstructions{...textFragment}actions{manageProtectionPlan{...orderActionFragment}cancel}priceInfo{linePrice{...price}}quantity isActive}fragment orderDonationDetails on OrderDonationDetails{message{...textFragment}emailReceipt emailReceiptToken status{...textFragment}errorStatus}fragment orderLineItem on OrderLineItem{id uniqueId actions{contactSeller cancel addToCart configureCake reviewItem resendEGiftCardToken protectionPlan{...orderActionFragment}manageProtectionPlan{...orderActionFragment}}isGift digitalDeliveryMessage quantity quantityString quantityLabel isSubstitutionSelected fulfilledItems{id quantityString priceInfo{itemPrice{value}}product{usItemId name}}isReturnable returnEligibilityMessage product{name usItemId imageInfo{thumbnailUrl}canonicalUrl offerId sellerId sellerName hasSellerBadge seller{sellerId name}orderLimit orderMinLimit weightIncrement salesUnit salesUnitType isSubstitutionEligible isAlcohol}reshop{reshopMessage isShippingAvailable minPromiseDate maxPromiseDate}selectedVariants{...variants}variantAdditionalInfo{parts{text nativeAction}}priceInfo{priceDisplayCodes{showItemPrice priceDisplayCondition finalCostByWeight}itemPrice{...price}linePrice{...price}unitPrice{...price}preDiscountedLinePrice{...price}additionalLines{name value}}discounts{label labelText{...textFragment}}itemReviewed activationCodes{label code}protectionPlanMessage{...textFragment}showSeller isShippedByWalmart seller{id name isPro}digitalDeliveryPhoneNumber addOns{...OrderAddOn}multiboxBundleId}fragment DriverFragment on Driver{id firstName photoUrl}fragment OrderGroupFragment on OrderGroup{driver{...DriverFragment}deliveryDate fulfillmentType status{...OrderGroupStatusFragment}showSeller isShippedByWalmart seller{...SellerFragment}id itemCount items{...LiteLineItemFragment}pickupPerson{firstName lastName email}accessPointId shipment{...ShipmentFragment}returnEligibilityMessage actions{...OrderGroupActionsFragment}recipientEmailAddress digitalDelivery{...DigitalDeliveryFragment}tireInstallationReservation{status extraText}}fragment OrderGroupStatusFragment on OrderGroupStatus{statusType showStatusTracker statusTracker{status label isCurrent}message{...textFragment}subtext subMessage{...textFragment}notice helpCenterText{...textFragment}}fragment textFragment on Text{parts{bold url text nativeAction lineBreak}}fragment LiteLineItemFragment on OrderLineItem{id quantity product{name usItemId imageInfo{thumbnailUrl}offerId isAlcohol}priceInfo{linePrice{...price}}}fragment SellerFragment on GroupSeller{id name isPro}fragment DigitalDeliveryFragment on DigitalDelivery{title name instructions{...textFragment}}fragment ShipmentFragment on Shipment{id trackingNumber isExternalTracking trackingUrl proofOfDelivery{photoUrl photoPreviewUrl showPreview}}fragment OrderGroupActionsFragment on OrderGroupActions{reorder edit track changeSlot checkin editDeliveryInstructions editPickupPerson editTip tip cancel enableTip{...orderActionFragment}enableEdit{...orderActionFragment}rescheduleTireInstall{...orderActionFragment}cancelTireInstall{...orderActionFragment}help viewCancellationDetails{...cancellationDetailsActionFragment}}fragment cancellationDetailsActionFragment on CancellationDetailsAction{label heading text{...textFragment}}fragment ODPGroupCategoryFragment on OrderCategory{type name subtext returnMessage substitutionsBanner{...textFragment}showExtendedSubstitutions actions{substitutions{message label type}nilPickReshop{message action{text url}}returnDetails viewCancellationDetails{...cancellationDetailsActionFragment}trackOnInHomeApp}banner{...textFragment}accordionState items{...orderLineItem}substitutions{...orderLineItem fulfilledItems{...orderLineItem}}returnInfo{...returnInfoFragment}}fragment ODPGroupFragment on OrderGroup{id fulfillmentType deliveryMessage deliveryAddress{fullName firstName lastName address{...addressFragment}}deliveryInstructions{text type typeText}deliveryPreferences{text{...textFragment}cta{...orderActionFragment}}editSubstitutionsCutOff status{statusType showStatusTracker message{...textFragment}notice helpCenterText{...textFragment}}itemCount isCategorized categories{...ODPGroupCategoryFragment}seller{id name isPro}shipment{id trackingNumber}actions{reorder edit track changeSlot checkin editDeliveryInstructions editPickupPerson tip cancel help enableTip{...orderActionFragment}enableEdit{...orderActionFragment}viewCancellationDetails{...cancellationDetailsActionFragment}enableInHome{...orderActionFragment}createGiftReceipt}cutOffTimestamp isEditSubstitutionsEligible isInHome giftDetails{recipientAddress{fullName}recipientEmail senderName giftMessage}donationDetails{...orderDonationDetails}}fragment returnInfoFragment on ReturnInfo{returnOrderId type refundPriceDetails{__typename...refundPriceDetailsFragment}refundMessage tierRefundMessage paymentMethods{__typename description cardType paymentType displayValues message{...textFragment}}actions{__typename generate scheduleOrModifyPickup{text url}reschedulePickup editPickupContact}shippingLabelUrl qrCodeImageUrl carriers{__typename id name}pickupCarrier pickupContact{nameAndAddress{fullName firstName lastName address{addressString city state postalCode addressLineOne addressLineTwo country}}phone}pickupConfirmationNumber bannerMessage{...textFragment}}fragment refundPriceDetailsFragment on RefundPriceDetails{subTotal{__typename...orderPriceDetailRowFragment}fees{__typename...orderPriceDetailRowFragment}discounts{__typename...orderPriceDetailRowFragment}taxTotal{__typename...orderPriceDetailRowFragment}grandTotal{__typename...orderPriceDetailRowFragment}}fragment orderPriceDetailRowFragment on OrderPriceDetailRow{label displayValue value info{__typename title message}}fragment addressFragment on OrderAddress{addressString addressLineOne addressLineTwo state postalCode city}fragment ODPPickupInfo on OrderGroup{pickupInstructions pickupPerson{...person}alternatePickupPerson{...person}store{id name address{...addressFragment}}}fragment person on OrderPickupPerson{firstName lastName email}fragment ODPTippingInfo on OrderGroup{addTipMessage{...textFragment}driver{...DriverFragment}tipping{min{...price}max{...price}suggested{...price}preselected}subtotal{...price}}fragment orderActionFragment on Action{text url}fragment orderCustomer on OrderCustomer{id firstName lastName email isGuest isEmailRegistered}fragment OrderFieldsFragment on Order{__typename id version type customer{...orderCustomer}displayId idBarcodeImageUrl(barWidth:3 barHeight:100) isFuelPurchase title shortTitle timezone tippableGroup{...OrderGroupFragment}amendableGroup{id changeSlotIterationsLeft cutOffTimestamp fulfillmentType deliveryAddress{fullName firstName lastName address{addressString addressLineOne addressLineTwo state postalCode city country}}isAmendInProgress}substitutionsBanner{heading subheading longSubheading}groups_2101{__typename...OrderGroupFragment...ODPGroupFragment...ODPPickupInfo...ODPTippingInfo}multiboxBundles{...orderLineItem}itemCancelReasons{__typename...cancelReason}groupCancelReasons{__typename...cancelReason}priceDetails{__typename subTotal{__typename...priceDetailFragment}taxTotal{__typename...priceDetailFragment}grandTotal{__typename...priceDetailFragment}authorizationAmount{__typename...priceDetailFragment}fees{__typename...priceDetailFragment}discounts{__typename...priceDetailFragment}minimumThreshold{__typename...price}belowMinimumFee{__typename...priceDetailFragment}driverTip{__typename...priceDetailFragment}donations{__typename...priceDetailFragment}}paymentMethods{__typename description cardType paymentType displayValues message{...textFragment}actions{connectToCapitalOne{...orderActionFragment}visitAffirm{...orderActionFragment}}}actions{__typename return pendingReturn cancel startReturn{...orderActionFragment}reorder}banners{...textFragment}}","variables":{"orderId":"2832232974710","emailAddress":"bpkorpanty@yahoo.com"}}' \
  --compressed`
 
for (( i=0; i<=4; i++ ))
do
  if [[ $curl54 =~ "error"  || $curl54 =~ "blocked" ]]; then
    echo "Lỗi email số 54"
    indexOrder54=`echo error`
    break
  elif [[ `echo $curl54 | jq '.data.guestOrder.groups_2101['${i[@]}'].items[0].product.usItemId'` == '"217281734"' ]]; then
    indexOrder54=`echo $i`
    indexItem54=`echo 0`
  elif [[ `echo $curl54 | jq '.data.guestOrder.groups_2101['${i[@]}'].items[1].product.usItemId'` == '"217281734"' ]]; then
    indexOrder54=`echo $i`
    indexItem54=`echo 1`
  elif [[ `echo $curl54 | jq '.data.guestOrder.groups_2101['${i[@]}'].items[2].product.usItemId'` == '"217281734"' ]]; then
    indexOrder54=`echo $i`
    indexItem54=`echo 2`
  elif [[ `echo $curl54 | jq '.data.guestOrder.groups_2101['${i[@]}'].items[3].product.usItemId'` == '"217281734"' ]]; then
    indexOrder54=`echo $i`
    indexItem54=`echo 3`
  fi
done

if [[ $indexOrder54 != "error" ]]; then
echo $curl54 | jq '.data.guestOrder.id' >> track-OrderID.txt
echo $curl54 | jq '.data.guestOrder.customer.email' >> track-email.txt
echo $curl54 | jq '.data.guestOrder.groups_2101['$indexOrder54'].items['$indexItem54'].product.usItemId' >> track-usItemId.txt
echo $curl54 | jq '.data.guestOrder.groups_2101['$indexOrder54'].items['$indexItem54'].priceInfo.linePrice.value' >> track-priceValue.txt
echo $curl54 | jq '.data.guestOrder.groups_2101['$indexOrder54'].deliveryAddress.fullName' >> track-fullName.txt
echo $curl54 | jq '.data.guestOrder.groups_2101['$indexOrder54'].deliveryAddress.address.addressString' >> track-address.txt
echo $curl54 | jq '.data.guestOrder.groups_2101['$indexOrder54'].status.message.parts[].text' >> track-status.txt
echo $curl54 | jq '.data.guestOrder.groups_2101['$indexOrder54'].shipment.trackingNumber' >> track-number.txt
echo $curl54 | jq '.data.guestOrder.groups_2101['$indexOrder54'].shipment.trackingUrl' >> track-url.txt
fi

curl55=`curl 'https://www.walmart.com/orchestra/home/graphql' \
  -H 'authority: www.walmart.com' \
  -H 'sec-ch-ua: " Not A;Brand";v="99", "Chromium";v="96", "Microsoft Edge";v="96"' \
  -H 'x-o-platform: rweb' \
  -H 'dnt: 1' \
  -H 'x-o-correlation-id: wrvYiSFTlAmd8j7a8DDmpuyOpCN_heAnwM3v' \
  -H 'device_profile_ref_id: _s1F3NO8Y2JjaBUKPDcY4iFDWiIl9CyqiJjf' \
  -H 'x-latency-trace: 1' \
  -H 'wm_mp: true' \
  -H 'x-o-market: us' \
  -H 'x-o-platform-version: main-253-ebbb47' \
  -H 'x-o-gql-query: query getGuestOrder' \
  -H 'wm_page_url: https://www.walmart.com/orders' \
  -H 'x-apollo-operation-name: getGuestOrder' \
  -H 'sec-ch-ua-platform: "macOS"' \
  -H 'sec-ch-ua-mobile: ?0' \
  -H 'user-agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/96.0.4664.110 Safari/537.36 Edg/96.0.1054.62' \
  -H 'x-o-segment: oaoh' \
  -H 'content-type: application/json' \
  -H 'accept: application/json' \
  -H 'x-enable-server-timing: 1' \
  -H 'x-o-ccm: server' \
  -H 'wm_qos.correlation_id: wrvYiSFTlAmd8j7a8DDmpuyOpCN_heAnwM3v' \
  -H 'origin: https://www.walmart.com' \
  -H 'sec-fetch-site: same-origin' \
  -H 'sec-fetch-mode: cors' \
  -H 'sec-fetch-dest: empty' \
  -H 'referer: https://www.walmart.com/orders' \
  -H 'accept-language: vi' \
  --data-raw $'{"query":"query getGuestOrder($orderId:ID\u0021 $emailAddress:String\u0021){guestOrder(input:{id:$orderId emailAddress:$emailAddress}){...OrderFieldsFragment}}fragment cancelReason on OrderCancelReason{__typename subReasonCode subDescription}fragment priceDetailFragment on OrderPriceDetailRow{label value displayValue info{title message}rowInfo{...orderPriceDetailRowInfo}}fragment orderPriceDetailRowInfo on OrderPriceDetailRowInfo{title message{...textFragment}}fragment price on Price{displayValue value}fragment variants on MapEntry{name value}fragment OrderAddOn on OrderAddOn{lineId uniqueLineId productInfo{name usItemId offerId}quantityString quantityLabel type fulfillmentInstructions{...textFragment}actions{manageProtectionPlan{...orderActionFragment}cancel}priceInfo{linePrice{...price}}quantity isActive}fragment orderDonationDetails on OrderDonationDetails{message{...textFragment}emailReceipt emailReceiptToken status{...textFragment}errorStatus}fragment orderLineItem on OrderLineItem{id uniqueId actions{contactSeller cancel addToCart configureCake reviewItem resendEGiftCardToken protectionPlan{...orderActionFragment}manageProtectionPlan{...orderActionFragment}}isGift digitalDeliveryMessage quantity quantityString quantityLabel isSubstitutionSelected fulfilledItems{id quantityString priceInfo{itemPrice{value}}product{usItemId name}}isReturnable returnEligibilityMessage product{name usItemId imageInfo{thumbnailUrl}canonicalUrl offerId sellerId sellerName hasSellerBadge seller{sellerId name}orderLimit orderMinLimit weightIncrement salesUnit salesUnitType isSubstitutionEligible isAlcohol}reshop{reshopMessage isShippingAvailable minPromiseDate maxPromiseDate}selectedVariants{...variants}variantAdditionalInfo{parts{text nativeAction}}priceInfo{priceDisplayCodes{showItemPrice priceDisplayCondition finalCostByWeight}itemPrice{...price}linePrice{...price}unitPrice{...price}preDiscountedLinePrice{...price}additionalLines{name value}}discounts{label labelText{...textFragment}}itemReviewed activationCodes{label code}protectionPlanMessage{...textFragment}showSeller isShippedByWalmart seller{id name isPro}digitalDeliveryPhoneNumber addOns{...OrderAddOn}multiboxBundleId}fragment DriverFragment on Driver{id firstName photoUrl}fragment OrderGroupFragment on OrderGroup{driver{...DriverFragment}deliveryDate fulfillmentType status{...OrderGroupStatusFragment}showSeller isShippedByWalmart seller{...SellerFragment}id itemCount items{...LiteLineItemFragment}pickupPerson{firstName lastName email}accessPointId shipment{...ShipmentFragment}returnEligibilityMessage actions{...OrderGroupActionsFragment}recipientEmailAddress digitalDelivery{...DigitalDeliveryFragment}tireInstallationReservation{status extraText}}fragment OrderGroupStatusFragment on OrderGroupStatus{statusType showStatusTracker statusTracker{status label isCurrent}message{...textFragment}subtext subMessage{...textFragment}notice helpCenterText{...textFragment}}fragment textFragment on Text{parts{bold url text nativeAction lineBreak}}fragment LiteLineItemFragment on OrderLineItem{id quantity product{name usItemId imageInfo{thumbnailUrl}offerId isAlcohol}priceInfo{linePrice{...price}}}fragment SellerFragment on GroupSeller{id name isPro}fragment DigitalDeliveryFragment on DigitalDelivery{title name instructions{...textFragment}}fragment ShipmentFragment on Shipment{id trackingNumber isExternalTracking trackingUrl proofOfDelivery{photoUrl photoPreviewUrl showPreview}}fragment OrderGroupActionsFragment on OrderGroupActions{reorder edit track changeSlot checkin editDeliveryInstructions editPickupPerson editTip tip cancel enableTip{...orderActionFragment}enableEdit{...orderActionFragment}rescheduleTireInstall{...orderActionFragment}cancelTireInstall{...orderActionFragment}help viewCancellationDetails{...cancellationDetailsActionFragment}}fragment cancellationDetailsActionFragment on CancellationDetailsAction{label heading text{...textFragment}}fragment ODPGroupCategoryFragment on OrderCategory{type name subtext returnMessage substitutionsBanner{...textFragment}showExtendedSubstitutions actions{substitutions{message label type}nilPickReshop{message action{text url}}returnDetails viewCancellationDetails{...cancellationDetailsActionFragment}trackOnInHomeApp}banner{...textFragment}accordionState items{...orderLineItem}substitutions{...orderLineItem fulfilledItems{...orderLineItem}}returnInfo{...returnInfoFragment}}fragment ODPGroupFragment on OrderGroup{id fulfillmentType deliveryMessage deliveryAddress{fullName firstName lastName address{...addressFragment}}deliveryInstructions{text type typeText}deliveryPreferences{text{...textFragment}cta{...orderActionFragment}}editSubstitutionsCutOff status{statusType showStatusTracker message{...textFragment}notice helpCenterText{...textFragment}}itemCount isCategorized categories{...ODPGroupCategoryFragment}seller{id name isPro}shipment{id trackingNumber}actions{reorder edit track changeSlot checkin editDeliveryInstructions editPickupPerson tip cancel help enableTip{...orderActionFragment}enableEdit{...orderActionFragment}viewCancellationDetails{...cancellationDetailsActionFragment}enableInHome{...orderActionFragment}createGiftReceipt}cutOffTimestamp isEditSubstitutionsEligible isInHome giftDetails{recipientAddress{fullName}recipientEmail senderName giftMessage}donationDetails{...orderDonationDetails}}fragment returnInfoFragment on ReturnInfo{returnOrderId type refundPriceDetails{__typename...refundPriceDetailsFragment}refundMessage tierRefundMessage paymentMethods{__typename description cardType paymentType displayValues message{...textFragment}}actions{__typename generate scheduleOrModifyPickup{text url}reschedulePickup editPickupContact}shippingLabelUrl qrCodeImageUrl carriers{__typename id name}pickupCarrier pickupContact{nameAndAddress{fullName firstName lastName address{addressString city state postalCode addressLineOne addressLineTwo country}}phone}pickupConfirmationNumber bannerMessage{...textFragment}}fragment refundPriceDetailsFragment on RefundPriceDetails{subTotal{__typename...orderPriceDetailRowFragment}fees{__typename...orderPriceDetailRowFragment}discounts{__typename...orderPriceDetailRowFragment}taxTotal{__typename...orderPriceDetailRowFragment}grandTotal{__typename...orderPriceDetailRowFragment}}fragment orderPriceDetailRowFragment on OrderPriceDetailRow{label displayValue value info{__typename title message}}fragment addressFragment on OrderAddress{addressString addressLineOne addressLineTwo state postalCode city}fragment ODPPickupInfo on OrderGroup{pickupInstructions pickupPerson{...person}alternatePickupPerson{...person}store{id name address{...addressFragment}}}fragment person on OrderPickupPerson{firstName lastName email}fragment ODPTippingInfo on OrderGroup{addTipMessage{...textFragment}driver{...DriverFragment}tipping{min{...price}max{...price}suggested{...price}preselected}subtotal{...price}}fragment orderActionFragment on Action{text url}fragment orderCustomer on OrderCustomer{id firstName lastName email isGuest isEmailRegistered}fragment OrderFieldsFragment on Order{__typename id version type customer{...orderCustomer}displayId idBarcodeImageUrl(barWidth:3 barHeight:100) isFuelPurchase title shortTitle timezone tippableGroup{...OrderGroupFragment}amendableGroup{id changeSlotIterationsLeft cutOffTimestamp fulfillmentType deliveryAddress{fullName firstName lastName address{addressString addressLineOne addressLineTwo state postalCode city country}}isAmendInProgress}substitutionsBanner{heading subheading longSubheading}groups_2101{__typename...OrderGroupFragment...ODPGroupFragment...ODPPickupInfo...ODPTippingInfo}multiboxBundles{...orderLineItem}itemCancelReasons{__typename...cancelReason}groupCancelReasons{__typename...cancelReason}priceDetails{__typename subTotal{__typename...priceDetailFragment}taxTotal{__typename...priceDetailFragment}grandTotal{__typename...priceDetailFragment}authorizationAmount{__typename...priceDetailFragment}fees{__typename...priceDetailFragment}discounts{__typename...priceDetailFragment}minimumThreshold{__typename...price}belowMinimumFee{__typename...priceDetailFragment}driverTip{__typename...priceDetailFragment}donations{__typename...priceDetailFragment}}paymentMethods{__typename description cardType paymentType displayValues message{...textFragment}actions{connectToCapitalOne{...orderActionFragment}visitAffirm{...orderActionFragment}}}actions{__typename return pendingReturn cancel startReturn{...orderActionFragment}reorder}banners{...textFragment}}","variables":{"orderId":"2812229409020","emailAddress":"bryson.colley@gmail.com"}}' \
  --compressed`
 
for (( i=0; i<=4; i++ ))
do
  if [[ $curl55 =~ "error"  || $curl55 =~ "blocked" ]]; then
    echo "Lỗi email số 55"
    indexOrder55=`echo error`
    break
  elif [[ `echo $curl55 | jq '.data.guestOrder.groups_2101['${i[@]}'].items[0].product.usItemId'` == '"713811084"' ]]; then
    indexOrder55=`echo $i`
    indexItem55=`echo 0`
  elif [[ `echo $curl55 | jq '.data.guestOrder.groups_2101['${i[@]}'].items[1].product.usItemId'` == '"713811084"' ]]; then
    indexOrder55=`echo $i`
    indexItem55=`echo 1`
  elif [[ `echo $curl55 | jq '.data.guestOrder.groups_2101['${i[@]}'].items[2].product.usItemId'` == '"713811084"' ]]; then
    indexOrder55=`echo $i`
    indexItem55=`echo 2`
  elif [[ `echo $curl55 | jq '.data.guestOrder.groups_2101['${i[@]}'].items[3].product.usItemId'` == '"713811084"' ]]; then
    indexOrder55=`echo $i`
    indexItem55=`echo 3`
  fi
done

if [[ $indexOrder55 != "error" ]]; then
echo $curl55 | jq '.data.guestOrder.id' >> track-OrderID.txt
echo $curl55 | jq '.data.guestOrder.customer.email' >> track-email.txt
echo $curl55 | jq '.data.guestOrder.groups_2101['$indexOrder55'].items['$indexItem55'].product.usItemId' >> track-usItemId.txt
echo $curl55 | jq '.data.guestOrder.groups_2101['$indexOrder55'].items['$indexItem55'].priceInfo.linePrice.value' >> track-priceValue.txt
echo $curl55 | jq '.data.guestOrder.groups_2101['$indexOrder55'].deliveryAddress.fullName' >> track-fullName.txt
echo $curl55 | jq '.data.guestOrder.groups_2101['$indexOrder55'].deliveryAddress.address.addressString' >> track-address.txt
echo $curl55 | jq '.data.guestOrder.groups_2101['$indexOrder55'].status.message.parts[].text' >> track-status.txt
echo $curl55 | jq '.data.guestOrder.groups_2101['$indexOrder55'].shipment.trackingNumber' >> track-number.txt
echo $curl55 | jq '.data.guestOrder.groups_2101['$indexOrder55'].shipment.trackingUrl' >> track-url.txt
fi

curl56=`curl 'https://www.walmart.com/orchestra/home/graphql' \
  -H 'authority: www.walmart.com' \
  -H 'sec-ch-ua: " Not A;Brand";v="99", "Chromium";v="96", "Microsoft Edge";v="96"' \
  -H 'x-o-platform: rweb' \
  -H 'dnt: 1' \
  -H 'x-o-correlation-id: wrvYiSFTlAmd8j7a8DDmpuyOpCN_heAnwM3v' \
  -H 'device_profile_ref_id: _s1F3NO8Y2JjaBUKPDcY4iFDWiIl9CyqiJjf' \
  -H 'x-latency-trace: 1' \
  -H 'wm_mp: true' \
  -H 'x-o-market: us' \
  -H 'x-o-platform-version: main-253-ebbb47' \
  -H 'x-o-gql-query: query getGuestOrder' \
  -H 'wm_page_url: https://www.walmart.com/orders' \
  -H 'x-apollo-operation-name: getGuestOrder' \
  -H 'sec-ch-ua-platform: "macOS"' \
  -H 'sec-ch-ua-mobile: ?0' \
  -H 'user-agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/96.0.4664.110 Safari/537.36 Edg/96.0.1054.62' \
  -H 'x-o-segment: oaoh' \
  -H 'content-type: application/json' \
  -H 'accept: application/json' \
  -H 'x-enable-server-timing: 1' \
  -H 'x-o-ccm: server' \
  -H 'wm_qos.correlation_id: wrvYiSFTlAmd8j7a8DDmpuyOpCN_heAnwM3v' \
  -H 'origin: https://www.walmart.com' \
  -H 'sec-fetch-site: same-origin' \
  -H 'sec-fetch-mode: cors' \
  -H 'sec-fetch-dest: empty' \
  -H 'referer: https://www.walmart.com/orders' \
  -H 'accept-language: vi' \
  --data-raw $'{"query":"query getGuestOrder($orderId:ID\u0021 $emailAddress:String\u0021){guestOrder(input:{id:$orderId emailAddress:$emailAddress}){...OrderFieldsFragment}}fragment cancelReason on OrderCancelReason{__typename subReasonCode subDescription}fragment priceDetailFragment on OrderPriceDetailRow{label value displayValue info{title message}rowInfo{...orderPriceDetailRowInfo}}fragment orderPriceDetailRowInfo on OrderPriceDetailRowInfo{title message{...textFragment}}fragment price on Price{displayValue value}fragment variants on MapEntry{name value}fragment OrderAddOn on OrderAddOn{lineId uniqueLineId productInfo{name usItemId offerId}quantityString quantityLabel type fulfillmentInstructions{...textFragment}actions{manageProtectionPlan{...orderActionFragment}cancel}priceInfo{linePrice{...price}}quantity isActive}fragment orderDonationDetails on OrderDonationDetails{message{...textFragment}emailReceipt emailReceiptToken status{...textFragment}errorStatus}fragment orderLineItem on OrderLineItem{id uniqueId actions{contactSeller cancel addToCart configureCake reviewItem resendEGiftCardToken protectionPlan{...orderActionFragment}manageProtectionPlan{...orderActionFragment}}isGift digitalDeliveryMessage quantity quantityString quantityLabel isSubstitutionSelected fulfilledItems{id quantityString priceInfo{itemPrice{value}}product{usItemId name}}isReturnable returnEligibilityMessage product{name usItemId imageInfo{thumbnailUrl}canonicalUrl offerId sellerId sellerName hasSellerBadge seller{sellerId name}orderLimit orderMinLimit weightIncrement salesUnit salesUnitType isSubstitutionEligible isAlcohol}reshop{reshopMessage isShippingAvailable minPromiseDate maxPromiseDate}selectedVariants{...variants}variantAdditionalInfo{parts{text nativeAction}}priceInfo{priceDisplayCodes{showItemPrice priceDisplayCondition finalCostByWeight}itemPrice{...price}linePrice{...price}unitPrice{...price}preDiscountedLinePrice{...price}additionalLines{name value}}discounts{label labelText{...textFragment}}itemReviewed activationCodes{label code}protectionPlanMessage{...textFragment}showSeller isShippedByWalmart seller{id name isPro}digitalDeliveryPhoneNumber addOns{...OrderAddOn}multiboxBundleId}fragment DriverFragment on Driver{id firstName photoUrl}fragment OrderGroupFragment on OrderGroup{driver{...DriverFragment}deliveryDate fulfillmentType status{...OrderGroupStatusFragment}showSeller isShippedByWalmart seller{...SellerFragment}id itemCount items{...LiteLineItemFragment}pickupPerson{firstName lastName email}accessPointId shipment{...ShipmentFragment}returnEligibilityMessage actions{...OrderGroupActionsFragment}recipientEmailAddress digitalDelivery{...DigitalDeliveryFragment}tireInstallationReservation{status extraText}}fragment OrderGroupStatusFragment on OrderGroupStatus{statusType showStatusTracker statusTracker{status label isCurrent}message{...textFragment}subtext subMessage{...textFragment}notice helpCenterText{...textFragment}}fragment textFragment on Text{parts{bold url text nativeAction lineBreak}}fragment LiteLineItemFragment on OrderLineItem{id quantity product{name usItemId imageInfo{thumbnailUrl}offerId isAlcohol}priceInfo{linePrice{...price}}}fragment SellerFragment on GroupSeller{id name isPro}fragment DigitalDeliveryFragment on DigitalDelivery{title name instructions{...textFragment}}fragment ShipmentFragment on Shipment{id trackingNumber isExternalTracking trackingUrl proofOfDelivery{photoUrl photoPreviewUrl showPreview}}fragment OrderGroupActionsFragment on OrderGroupActions{reorder edit track changeSlot checkin editDeliveryInstructions editPickupPerson editTip tip cancel enableTip{...orderActionFragment}enableEdit{...orderActionFragment}rescheduleTireInstall{...orderActionFragment}cancelTireInstall{...orderActionFragment}help viewCancellationDetails{...cancellationDetailsActionFragment}}fragment cancellationDetailsActionFragment on CancellationDetailsAction{label heading text{...textFragment}}fragment ODPGroupCategoryFragment on OrderCategory{type name subtext returnMessage substitutionsBanner{...textFragment}showExtendedSubstitutions actions{substitutions{message label type}nilPickReshop{message action{text url}}returnDetails viewCancellationDetails{...cancellationDetailsActionFragment}trackOnInHomeApp}banner{...textFragment}accordionState items{...orderLineItem}substitutions{...orderLineItem fulfilledItems{...orderLineItem}}returnInfo{...returnInfoFragment}}fragment ODPGroupFragment on OrderGroup{id fulfillmentType deliveryMessage deliveryAddress{fullName firstName lastName address{...addressFragment}}deliveryInstructions{text type typeText}deliveryPreferences{text{...textFragment}cta{...orderActionFragment}}editSubstitutionsCutOff status{statusType showStatusTracker message{...textFragment}notice helpCenterText{...textFragment}}itemCount isCategorized categories{...ODPGroupCategoryFragment}seller{id name isPro}shipment{id trackingNumber}actions{reorder edit track changeSlot checkin editDeliveryInstructions editPickupPerson tip cancel help enableTip{...orderActionFragment}enableEdit{...orderActionFragment}viewCancellationDetails{...cancellationDetailsActionFragment}enableInHome{...orderActionFragment}createGiftReceipt}cutOffTimestamp isEditSubstitutionsEligible isInHome giftDetails{recipientAddress{fullName}recipientEmail senderName giftMessage}donationDetails{...orderDonationDetails}}fragment returnInfoFragment on ReturnInfo{returnOrderId type refundPriceDetails{__typename...refundPriceDetailsFragment}refundMessage tierRefundMessage paymentMethods{__typename description cardType paymentType displayValues message{...textFragment}}actions{__typename generate scheduleOrModifyPickup{text url}reschedulePickup editPickupContact}shippingLabelUrl qrCodeImageUrl carriers{__typename id name}pickupCarrier pickupContact{nameAndAddress{fullName firstName lastName address{addressString city state postalCode addressLineOne addressLineTwo country}}phone}pickupConfirmationNumber bannerMessage{...textFragment}}fragment refundPriceDetailsFragment on RefundPriceDetails{subTotal{__typename...orderPriceDetailRowFragment}fees{__typename...orderPriceDetailRowFragment}discounts{__typename...orderPriceDetailRowFragment}taxTotal{__typename...orderPriceDetailRowFragment}grandTotal{__typename...orderPriceDetailRowFragment}}fragment orderPriceDetailRowFragment on OrderPriceDetailRow{label displayValue value info{__typename title message}}fragment addressFragment on OrderAddress{addressString addressLineOne addressLineTwo state postalCode city}fragment ODPPickupInfo on OrderGroup{pickupInstructions pickupPerson{...person}alternatePickupPerson{...person}store{id name address{...addressFragment}}}fragment person on OrderPickupPerson{firstName lastName email}fragment ODPTippingInfo on OrderGroup{addTipMessage{...textFragment}driver{...DriverFragment}tipping{min{...price}max{...price}suggested{...price}preselected}subtotal{...price}}fragment orderActionFragment on Action{text url}fragment orderCustomer on OrderCustomer{id firstName lastName email isGuest isEmailRegistered}fragment OrderFieldsFragment on Order{__typename id version type customer{...orderCustomer}displayId idBarcodeImageUrl(barWidth:3 barHeight:100) isFuelPurchase title shortTitle timezone tippableGroup{...OrderGroupFragment}amendableGroup{id changeSlotIterationsLeft cutOffTimestamp fulfillmentType deliveryAddress{fullName firstName lastName address{addressString addressLineOne addressLineTwo state postalCode city country}}isAmendInProgress}substitutionsBanner{heading subheading longSubheading}groups_2101{__typename...OrderGroupFragment...ODPGroupFragment...ODPPickupInfo...ODPTippingInfo}multiboxBundles{...orderLineItem}itemCancelReasons{__typename...cancelReason}groupCancelReasons{__typename...cancelReason}priceDetails{__typename subTotal{__typename...priceDetailFragment}taxTotal{__typename...priceDetailFragment}grandTotal{__typename...priceDetailFragment}authorizationAmount{__typename...priceDetailFragment}fees{__typename...priceDetailFragment}discounts{__typename...priceDetailFragment}minimumThreshold{__typename...price}belowMinimumFee{__typename...priceDetailFragment}driverTip{__typename...priceDetailFragment}donations{__typename...priceDetailFragment}}paymentMethods{__typename description cardType paymentType displayValues message{...textFragment}actions{connectToCapitalOne{...orderActionFragment}visitAffirm{...orderActionFragment}}}actions{__typename return pendingReturn cancel startReturn{...orderActionFragment}reorder}banners{...textFragment}}","variables":{"orderId":"2812227950488","emailAddress":"dougmorris64@gmail.com"}}' \
  --compressed`
 
for (( i=0; i<=4; i++ ))
do
  if [[ $curl56 =~ "error"  || $curl56 =~ "blocked" ]]; then
    echo "Lỗi email số 56"
    indexOrder56=`echo error`
    break
  elif [[ `echo $curl56 | jq '.data.guestOrder.groups_2101['${i[@]}'].items[0].product.usItemId'` == '"251382558"' ]]; then
    indexOrder56=`echo $i`
    indexItem56=`echo 0`
  elif [[ `echo $curl56 | jq '.data.guestOrder.groups_2101['${i[@]}'].items[1].product.usItemId'` == '"251382558"' ]]; then
    indexOrder56=`echo $i`
    indexItem56=`echo 1`
  elif [[ `echo $curl56 | jq '.data.guestOrder.groups_2101['${i[@]}'].items[2].product.usItemId'` == '"251382558"' ]]; then
    indexOrder56=`echo $i`
    indexItem56=`echo 2`
  elif [[ `echo $curl56 | jq '.data.guestOrder.groups_2101['${i[@]}'].items[3].product.usItemId'` == '"251382558"' ]]; then
    indexOrder56=`echo $i`
    indexItem56=`echo 3`
  fi
done

if [[ $indexOrder56 != "error" ]]; then
echo $curl56 | jq '.data.guestOrder.id' >> track-OrderID.txt
echo $curl56 | jq '.data.guestOrder.customer.email' >> track-email.txt
echo $curl56 | jq '.data.guestOrder.groups_2101['$indexOrder56'].items['$indexItem56'].product.usItemId' >> track-usItemId.txt
echo $curl56 | jq '.data.guestOrder.groups_2101['$indexOrder56'].items['$indexItem56'].priceInfo.linePrice.value' >> track-priceValue.txt
echo $curl56 | jq '.data.guestOrder.groups_2101['$indexOrder56'].deliveryAddress.fullName' >> track-fullName.txt
echo $curl56 | jq '.data.guestOrder.groups_2101['$indexOrder56'].deliveryAddress.address.addressString' >> track-address.txt
echo $curl56 | jq '.data.guestOrder.groups_2101['$indexOrder56'].status.message.parts[].text' >> track-status.txt
echo $curl56 | jq '.data.guestOrder.groups_2101['$indexOrder56'].shipment.trackingNumber' >> track-number.txt
echo $curl56 | jq '.data.guestOrder.groups_2101['$indexOrder56'].shipment.trackingUrl' >> track-url.txt
fi

curl57=`curl 'https://www.walmart.com/orchestra/home/graphql' \
  -H 'authority: www.walmart.com' \
  -H 'sec-ch-ua: " Not A;Brand";v="99", "Chromium";v="96", "Microsoft Edge";v="96"' \
  -H 'x-o-platform: rweb' \
  -H 'dnt: 1' \
  -H 'x-o-correlation-id: wrvYiSFTlAmd8j7a8DDmpuyOpCN_heAnwM3v' \
  -H 'device_profile_ref_id: _s1F3NO8Y2JjaBUKPDcY4iFDWiIl9CyqiJjf' \
  -H 'x-latency-trace: 1' \
  -H 'wm_mp: true' \
  -H 'x-o-market: us' \
  -H 'x-o-platform-version: main-253-ebbb47' \
  -H 'x-o-gql-query: query getGuestOrder' \
  -H 'wm_page_url: https://www.walmart.com/orders' \
  -H 'x-apollo-operation-name: getGuestOrder' \
  -H 'sec-ch-ua-platform: "macOS"' \
  -H 'sec-ch-ua-mobile: ?0' \
  -H 'user-agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/96.0.4664.110 Safari/537.36 Edg/96.0.1054.62' \
  -H 'x-o-segment: oaoh' \
  -H 'content-type: application/json' \
  -H 'accept: application/json' \
  -H 'x-enable-server-timing: 1' \
  -H 'x-o-ccm: server' \
  -H 'wm_qos.correlation_id: wrvYiSFTlAmd8j7a8DDmpuyOpCN_heAnwM3v' \
  -H 'origin: https://www.walmart.com' \
  -H 'sec-fetch-site: same-origin' \
  -H 'sec-fetch-mode: cors' \
  -H 'sec-fetch-dest: empty' \
  -H 'referer: https://www.walmart.com/orders' \
  -H 'accept-language: vi' \
  --data-raw $'{"query":"query getGuestOrder($orderId:ID\u0021 $emailAddress:String\u0021){guestOrder(input:{id:$orderId emailAddress:$emailAddress}){...OrderFieldsFragment}}fragment cancelReason on OrderCancelReason{__typename subReasonCode subDescription}fragment priceDetailFragment on OrderPriceDetailRow{label value displayValue info{title message}rowInfo{...orderPriceDetailRowInfo}}fragment orderPriceDetailRowInfo on OrderPriceDetailRowInfo{title message{...textFragment}}fragment price on Price{displayValue value}fragment variants on MapEntry{name value}fragment OrderAddOn on OrderAddOn{lineId uniqueLineId productInfo{name usItemId offerId}quantityString quantityLabel type fulfillmentInstructions{...textFragment}actions{manageProtectionPlan{...orderActionFragment}cancel}priceInfo{linePrice{...price}}quantity isActive}fragment orderDonationDetails on OrderDonationDetails{message{...textFragment}emailReceipt emailReceiptToken status{...textFragment}errorStatus}fragment orderLineItem on OrderLineItem{id uniqueId actions{contactSeller cancel addToCart configureCake reviewItem resendEGiftCardToken protectionPlan{...orderActionFragment}manageProtectionPlan{...orderActionFragment}}isGift digitalDeliveryMessage quantity quantityString quantityLabel isSubstitutionSelected fulfilledItems{id quantityString priceInfo{itemPrice{value}}product{usItemId name}}isReturnable returnEligibilityMessage product{name usItemId imageInfo{thumbnailUrl}canonicalUrl offerId sellerId sellerName hasSellerBadge seller{sellerId name}orderLimit orderMinLimit weightIncrement salesUnit salesUnitType isSubstitutionEligible isAlcohol}reshop{reshopMessage isShippingAvailable minPromiseDate maxPromiseDate}selectedVariants{...variants}variantAdditionalInfo{parts{text nativeAction}}priceInfo{priceDisplayCodes{showItemPrice priceDisplayCondition finalCostByWeight}itemPrice{...price}linePrice{...price}unitPrice{...price}preDiscountedLinePrice{...price}additionalLines{name value}}discounts{label labelText{...textFragment}}itemReviewed activationCodes{label code}protectionPlanMessage{...textFragment}showSeller isShippedByWalmart seller{id name isPro}digitalDeliveryPhoneNumber addOns{...OrderAddOn}multiboxBundleId}fragment DriverFragment on Driver{id firstName photoUrl}fragment OrderGroupFragment on OrderGroup{driver{...DriverFragment}deliveryDate fulfillmentType status{...OrderGroupStatusFragment}showSeller isShippedByWalmart seller{...SellerFragment}id itemCount items{...LiteLineItemFragment}pickupPerson{firstName lastName email}accessPointId shipment{...ShipmentFragment}returnEligibilityMessage actions{...OrderGroupActionsFragment}recipientEmailAddress digitalDelivery{...DigitalDeliveryFragment}tireInstallationReservation{status extraText}}fragment OrderGroupStatusFragment on OrderGroupStatus{statusType showStatusTracker statusTracker{status label isCurrent}message{...textFragment}subtext subMessage{...textFragment}notice helpCenterText{...textFragment}}fragment textFragment on Text{parts{bold url text nativeAction lineBreak}}fragment LiteLineItemFragment on OrderLineItem{id quantity product{name usItemId imageInfo{thumbnailUrl}offerId isAlcohol}priceInfo{linePrice{...price}}}fragment SellerFragment on GroupSeller{id name isPro}fragment DigitalDeliveryFragment on DigitalDelivery{title name instructions{...textFragment}}fragment ShipmentFragment on Shipment{id trackingNumber isExternalTracking trackingUrl proofOfDelivery{photoUrl photoPreviewUrl showPreview}}fragment OrderGroupActionsFragment on OrderGroupActions{reorder edit track changeSlot checkin editDeliveryInstructions editPickupPerson editTip tip cancel enableTip{...orderActionFragment}enableEdit{...orderActionFragment}rescheduleTireInstall{...orderActionFragment}cancelTireInstall{...orderActionFragment}help viewCancellationDetails{...cancellationDetailsActionFragment}}fragment cancellationDetailsActionFragment on CancellationDetailsAction{label heading text{...textFragment}}fragment ODPGroupCategoryFragment on OrderCategory{type name subtext returnMessage substitutionsBanner{...textFragment}showExtendedSubstitutions actions{substitutions{message label type}nilPickReshop{message action{text url}}returnDetails viewCancellationDetails{...cancellationDetailsActionFragment}trackOnInHomeApp}banner{...textFragment}accordionState items{...orderLineItem}substitutions{...orderLineItem fulfilledItems{...orderLineItem}}returnInfo{...returnInfoFragment}}fragment ODPGroupFragment on OrderGroup{id fulfillmentType deliveryMessage deliveryAddress{fullName firstName lastName address{...addressFragment}}deliveryInstructions{text type typeText}deliveryPreferences{text{...textFragment}cta{...orderActionFragment}}editSubstitutionsCutOff status{statusType showStatusTracker message{...textFragment}notice helpCenterText{...textFragment}}itemCount isCategorized categories{...ODPGroupCategoryFragment}seller{id name isPro}shipment{id trackingNumber}actions{reorder edit track changeSlot checkin editDeliveryInstructions editPickupPerson tip cancel help enableTip{...orderActionFragment}enableEdit{...orderActionFragment}viewCancellationDetails{...cancellationDetailsActionFragment}enableInHome{...orderActionFragment}createGiftReceipt}cutOffTimestamp isEditSubstitutionsEligible isInHome giftDetails{recipientAddress{fullName}recipientEmail senderName giftMessage}donationDetails{...orderDonationDetails}}fragment returnInfoFragment on ReturnInfo{returnOrderId type refundPriceDetails{__typename...refundPriceDetailsFragment}refundMessage tierRefundMessage paymentMethods{__typename description cardType paymentType displayValues message{...textFragment}}actions{__typename generate scheduleOrModifyPickup{text url}reschedulePickup editPickupContact}shippingLabelUrl qrCodeImageUrl carriers{__typename id name}pickupCarrier pickupContact{nameAndAddress{fullName firstName lastName address{addressString city state postalCode addressLineOne addressLineTwo country}}phone}pickupConfirmationNumber bannerMessage{...textFragment}}fragment refundPriceDetailsFragment on RefundPriceDetails{subTotal{__typename...orderPriceDetailRowFragment}fees{__typename...orderPriceDetailRowFragment}discounts{__typename...orderPriceDetailRowFragment}taxTotal{__typename...orderPriceDetailRowFragment}grandTotal{__typename...orderPriceDetailRowFragment}}fragment orderPriceDetailRowFragment on OrderPriceDetailRow{label displayValue value info{__typename title message}}fragment addressFragment on OrderAddress{addressString addressLineOne addressLineTwo state postalCode city}fragment ODPPickupInfo on OrderGroup{pickupInstructions pickupPerson{...person}alternatePickupPerson{...person}store{id name address{...addressFragment}}}fragment person on OrderPickupPerson{firstName lastName email}fragment ODPTippingInfo on OrderGroup{addTipMessage{...textFragment}driver{...DriverFragment}tipping{min{...price}max{...price}suggested{...price}preselected}subtotal{...price}}fragment orderActionFragment on Action{text url}fragment orderCustomer on OrderCustomer{id firstName lastName email isGuest isEmailRegistered}fragment OrderFieldsFragment on Order{__typename id version type customer{...orderCustomer}displayId idBarcodeImageUrl(barWidth:3 barHeight:100) isFuelPurchase title shortTitle timezone tippableGroup{...OrderGroupFragment}amendableGroup{id changeSlotIterationsLeft cutOffTimestamp fulfillmentType deliveryAddress{fullName firstName lastName address{addressString addressLineOne addressLineTwo state postalCode city country}}isAmendInProgress}substitutionsBanner{heading subheading longSubheading}groups_2101{__typename...OrderGroupFragment...ODPGroupFragment...ODPPickupInfo...ODPTippingInfo}multiboxBundles{...orderLineItem}itemCancelReasons{__typename...cancelReason}groupCancelReasons{__typename...cancelReason}priceDetails{__typename subTotal{__typename...priceDetailFragment}taxTotal{__typename...priceDetailFragment}grandTotal{__typename...priceDetailFragment}authorizationAmount{__typename...priceDetailFragment}fees{__typename...priceDetailFragment}discounts{__typename...priceDetailFragment}minimumThreshold{__typename...price}belowMinimumFee{__typename...priceDetailFragment}driverTip{__typename...priceDetailFragment}donations{__typename...priceDetailFragment}}paymentMethods{__typename description cardType paymentType displayValues message{...textFragment}actions{connectToCapitalOne{...orderActionFragment}visitAffirm{...orderActionFragment}}}actions{__typename return pendingReturn cancel startReturn{...orderActionFragment}reorder}banners{...textFragment}}","variables":{"orderId":"2812227451442","emailAddress":"sam.arone@hotmail.com"}}' \
  --compressed`
 
for (( i=0; i<=4; i++ ))
do
  if [[ $curl57 =~ "error"  || $curl57 =~ "blocked" ]]; then
    echo "Lỗi email số 57"
    indexOrder57=`echo error`
    break
  elif [[ `echo $curl57 | jq '.data.guestOrder.groups_2101['${i[@]}'].items[0].product.usItemId'` == '"504678442"' ]]; then
    indexOrder57=`echo $i`
    indexItem57=`echo 0`
  elif [[ `echo $curl57 | jq '.data.guestOrder.groups_2101['${i[@]}'].items[1].product.usItemId'` == '"504678442"' ]]; then
    indexOrder57=`echo $i`
    indexItem57=`echo 1`
  elif [[ `echo $curl57 | jq '.data.guestOrder.groups_2101['${i[@]}'].items[2].product.usItemId'` == '"504678442"' ]]; then
    indexOrder57=`echo $i`
    indexItem57=`echo 2`
  elif [[ `echo $curl57 | jq '.data.guestOrder.groups_2101['${i[@]}'].items[3].product.usItemId'` == '"504678442"' ]]; then
    indexOrder57=`echo $i`
    indexItem57=`echo 3`
  fi
done

if [[ $indexOrder57 != "error" ]]; then
echo $curl57 | jq '.data.guestOrder.id' >> track-OrderID.txt
echo $curl57 | jq '.data.guestOrder.customer.email' >> track-email.txt
echo $curl57 | jq '.data.guestOrder.groups_2101['$indexOrder57'].items['$indexItem57'].product.usItemId' >> track-usItemId.txt
echo $curl57 | jq '.data.guestOrder.groups_2101['$indexOrder57'].items['$indexItem57'].priceInfo.linePrice.value' >> track-priceValue.txt
echo $curl57 | jq '.data.guestOrder.groups_2101['$indexOrder57'].deliveryAddress.fullName' >> track-fullName.txt
echo $curl57 | jq '.data.guestOrder.groups_2101['$indexOrder57'].deliveryAddress.address.addressString' >> track-address.txt
echo $curl57 | jq '.data.guestOrder.groups_2101['$indexOrder57'].status.message.parts[].text' >> track-status.txt
echo $curl57 | jq '.data.guestOrder.groups_2101['$indexOrder57'].shipment.trackingNumber' >> track-number.txt
echo $curl57 | jq '.data.guestOrder.groups_2101['$indexOrder57'].shipment.trackingUrl' >> track-url.txt
fi

curl58=`curl 'https://www.walmart.com/orchestra/home/graphql' \
  -H 'authority: www.walmart.com' \
  -H 'sec-ch-ua: " Not A;Brand";v="99", "Chromium";v="96", "Microsoft Edge";v="96"' \
  -H 'x-o-platform: rweb' \
  -H 'dnt: 1' \
  -H 'x-o-correlation-id: wrvYiSFTlAmd8j7a8DDmpuyOpCN_heAnwM3v' \
  -H 'device_profile_ref_id: _s1F3NO8Y2JjaBUKPDcY4iFDWiIl9CyqiJjf' \
  -H 'x-latency-trace: 1' \
  -H 'wm_mp: true' \
  -H 'x-o-market: us' \
  -H 'x-o-platform-version: main-253-ebbb47' \
  -H 'x-o-gql-query: query getGuestOrder' \
  -H 'wm_page_url: https://www.walmart.com/orders' \
  -H 'x-apollo-operation-name: getGuestOrder' \
  -H 'sec-ch-ua-platform: "macOS"' \
  -H 'sec-ch-ua-mobile: ?0' \
  -H 'user-agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/96.0.4664.110 Safari/537.36 Edg/96.0.1054.62' \
  -H 'x-o-segment: oaoh' \
  -H 'content-type: application/json' \
  -H 'accept: application/json' \
  -H 'x-enable-server-timing: 1' \
  -H 'x-o-ccm: server' \
  -H 'wm_qos.correlation_id: wrvYiSFTlAmd8j7a8DDmpuyOpCN_heAnwM3v' \
  -H 'origin: https://www.walmart.com' \
  -H 'sec-fetch-site: same-origin' \
  -H 'sec-fetch-mode: cors' \
  -H 'sec-fetch-dest: empty' \
  -H 'referer: https://www.walmart.com/orders' \
  -H 'accept-language: vi' \
  --data-raw $'{"query":"query getGuestOrder($orderId:ID\u0021 $emailAddress:String\u0021){guestOrder(input:{id:$orderId emailAddress:$emailAddress}){...OrderFieldsFragment}}fragment cancelReason on OrderCancelReason{__typename subReasonCode subDescription}fragment priceDetailFragment on OrderPriceDetailRow{label value displayValue info{title message}rowInfo{...orderPriceDetailRowInfo}}fragment orderPriceDetailRowInfo on OrderPriceDetailRowInfo{title message{...textFragment}}fragment price on Price{displayValue value}fragment variants on MapEntry{name value}fragment OrderAddOn on OrderAddOn{lineId uniqueLineId productInfo{name usItemId offerId}quantityString quantityLabel type fulfillmentInstructions{...textFragment}actions{manageProtectionPlan{...orderActionFragment}cancel}priceInfo{linePrice{...price}}quantity isActive}fragment orderDonationDetails on OrderDonationDetails{message{...textFragment}emailReceipt emailReceiptToken status{...textFragment}errorStatus}fragment orderLineItem on OrderLineItem{id uniqueId actions{contactSeller cancel addToCart configureCake reviewItem resendEGiftCardToken protectionPlan{...orderActionFragment}manageProtectionPlan{...orderActionFragment}}isGift digitalDeliveryMessage quantity quantityString quantityLabel isSubstitutionSelected fulfilledItems{id quantityString priceInfo{itemPrice{value}}product{usItemId name}}isReturnable returnEligibilityMessage product{name usItemId imageInfo{thumbnailUrl}canonicalUrl offerId sellerId sellerName hasSellerBadge seller{sellerId name}orderLimit orderMinLimit weightIncrement salesUnit salesUnitType isSubstitutionEligible isAlcohol}reshop{reshopMessage isShippingAvailable minPromiseDate maxPromiseDate}selectedVariants{...variants}variantAdditionalInfo{parts{text nativeAction}}priceInfo{priceDisplayCodes{showItemPrice priceDisplayCondition finalCostByWeight}itemPrice{...price}linePrice{...price}unitPrice{...price}preDiscountedLinePrice{...price}additionalLines{name value}}discounts{label labelText{...textFragment}}itemReviewed activationCodes{label code}protectionPlanMessage{...textFragment}showSeller isShippedByWalmart seller{id name isPro}digitalDeliveryPhoneNumber addOns{...OrderAddOn}multiboxBundleId}fragment DriverFragment on Driver{id firstName photoUrl}fragment OrderGroupFragment on OrderGroup{driver{...DriverFragment}deliveryDate fulfillmentType status{...OrderGroupStatusFragment}showSeller isShippedByWalmart seller{...SellerFragment}id itemCount items{...LiteLineItemFragment}pickupPerson{firstName lastName email}accessPointId shipment{...ShipmentFragment}returnEligibilityMessage actions{...OrderGroupActionsFragment}recipientEmailAddress digitalDelivery{...DigitalDeliveryFragment}tireInstallationReservation{status extraText}}fragment OrderGroupStatusFragment on OrderGroupStatus{statusType showStatusTracker statusTracker{status label isCurrent}message{...textFragment}subtext subMessage{...textFragment}notice helpCenterText{...textFragment}}fragment textFragment on Text{parts{bold url text nativeAction lineBreak}}fragment LiteLineItemFragment on OrderLineItem{id quantity product{name usItemId imageInfo{thumbnailUrl}offerId isAlcohol}priceInfo{linePrice{...price}}}fragment SellerFragment on GroupSeller{id name isPro}fragment DigitalDeliveryFragment on DigitalDelivery{title name instructions{...textFragment}}fragment ShipmentFragment on Shipment{id trackingNumber isExternalTracking trackingUrl proofOfDelivery{photoUrl photoPreviewUrl showPreview}}fragment OrderGroupActionsFragment on OrderGroupActions{reorder edit track changeSlot checkin editDeliveryInstructions editPickupPerson editTip tip cancel enableTip{...orderActionFragment}enableEdit{...orderActionFragment}rescheduleTireInstall{...orderActionFragment}cancelTireInstall{...orderActionFragment}help viewCancellationDetails{...cancellationDetailsActionFragment}}fragment cancellationDetailsActionFragment on CancellationDetailsAction{label heading text{...textFragment}}fragment ODPGroupCategoryFragment on OrderCategory{type name subtext returnMessage substitutionsBanner{...textFragment}showExtendedSubstitutions actions{substitutions{message label type}nilPickReshop{message action{text url}}returnDetails viewCancellationDetails{...cancellationDetailsActionFragment}trackOnInHomeApp}banner{...textFragment}accordionState items{...orderLineItem}substitutions{...orderLineItem fulfilledItems{...orderLineItem}}returnInfo{...returnInfoFragment}}fragment ODPGroupFragment on OrderGroup{id fulfillmentType deliveryMessage deliveryAddress{fullName firstName lastName address{...addressFragment}}deliveryInstructions{text type typeText}deliveryPreferences{text{...textFragment}cta{...orderActionFragment}}editSubstitutionsCutOff status{statusType showStatusTracker message{...textFragment}notice helpCenterText{...textFragment}}itemCount isCategorized categories{...ODPGroupCategoryFragment}seller{id name isPro}shipment{id trackingNumber}actions{reorder edit track changeSlot checkin editDeliveryInstructions editPickupPerson tip cancel help enableTip{...orderActionFragment}enableEdit{...orderActionFragment}viewCancellationDetails{...cancellationDetailsActionFragment}enableInHome{...orderActionFragment}createGiftReceipt}cutOffTimestamp isEditSubstitutionsEligible isInHome giftDetails{recipientAddress{fullName}recipientEmail senderName giftMessage}donationDetails{...orderDonationDetails}}fragment returnInfoFragment on ReturnInfo{returnOrderId type refundPriceDetails{__typename...refundPriceDetailsFragment}refundMessage tierRefundMessage paymentMethods{__typename description cardType paymentType displayValues message{...textFragment}}actions{__typename generate scheduleOrModifyPickup{text url}reschedulePickup editPickupContact}shippingLabelUrl qrCodeImageUrl carriers{__typename id name}pickupCarrier pickupContact{nameAndAddress{fullName firstName lastName address{addressString city state postalCode addressLineOne addressLineTwo country}}phone}pickupConfirmationNumber bannerMessage{...textFragment}}fragment refundPriceDetailsFragment on RefundPriceDetails{subTotal{__typename...orderPriceDetailRowFragment}fees{__typename...orderPriceDetailRowFragment}discounts{__typename...orderPriceDetailRowFragment}taxTotal{__typename...orderPriceDetailRowFragment}grandTotal{__typename...orderPriceDetailRowFragment}}fragment orderPriceDetailRowFragment on OrderPriceDetailRow{label displayValue value info{__typename title message}}fragment addressFragment on OrderAddress{addressString addressLineOne addressLineTwo state postalCode city}fragment ODPPickupInfo on OrderGroup{pickupInstructions pickupPerson{...person}alternatePickupPerson{...person}store{id name address{...addressFragment}}}fragment person on OrderPickupPerson{firstName lastName email}fragment ODPTippingInfo on OrderGroup{addTipMessage{...textFragment}driver{...DriverFragment}tipping{min{...price}max{...price}suggested{...price}preselected}subtotal{...price}}fragment orderActionFragment on Action{text url}fragment orderCustomer on OrderCustomer{id firstName lastName email isGuest isEmailRegistered}fragment OrderFieldsFragment on Order{__typename id version type customer{...orderCustomer}displayId idBarcodeImageUrl(barWidth:3 barHeight:100) isFuelPurchase title shortTitle timezone tippableGroup{...OrderGroupFragment}amendableGroup{id changeSlotIterationsLeft cutOffTimestamp fulfillmentType deliveryAddress{fullName firstName lastName address{addressString addressLineOne addressLineTwo state postalCode city country}}isAmendInProgress}substitutionsBanner{heading subheading longSubheading}groups_2101{__typename...OrderGroupFragment...ODPGroupFragment...ODPPickupInfo...ODPTippingInfo}multiboxBundles{...orderLineItem}itemCancelReasons{__typename...cancelReason}groupCancelReasons{__typename...cancelReason}priceDetails{__typename subTotal{__typename...priceDetailFragment}taxTotal{__typename...priceDetailFragment}grandTotal{__typename...priceDetailFragment}authorizationAmount{__typename...priceDetailFragment}fees{__typename...priceDetailFragment}discounts{__typename...priceDetailFragment}minimumThreshold{__typename...price}belowMinimumFee{__typename...priceDetailFragment}driverTip{__typename...priceDetailFragment}donations{__typename...priceDetailFragment}}paymentMethods{__typename description cardType paymentType displayValues message{...textFragment}actions{connectToCapitalOne{...orderActionFragment}visitAffirm{...orderActionFragment}}}actions{__typename return pendingReturn cancel startReturn{...orderActionFragment}reorder}banners{...textFragment}}","variables":{"orderId":"2832232556469","emailAddress":"janice.markey@yahoo.com"}}' \
  --compressed`
 
for (( i=0; i<=4; i++ ))
do
  if [[ $curl58 =~ "error"  || $curl58 =~ "blocked" ]]; then
    echo "Lỗi email số 58"
    indexOrder58=`echo error`
    break
  elif [[ `echo $curl58 | jq '.data.guestOrder.groups_2101['${i[@]}'].items[0].product.usItemId'` == '"3084"' ]]; then
    indexOrder58=`echo $i`
    indexItem58=`echo 0`
  elif [[ `echo $curl58 | jq '.data.guestOrder.groups_2101['${i[@]}'].items[1].product.usItemId'` == '"3084"' ]]; then
    indexOrder58=`echo $i`
    indexItem58=`echo 1`
  elif [[ `echo $curl58 | jq '.data.guestOrder.groups_2101['${i[@]}'].items[2].product.usItemId'` == '"3084"' ]]; then
    indexOrder58=`echo $i`
    indexItem58=`echo 2`
  elif [[ `echo $curl58 | jq '.data.guestOrder.groups_2101['${i[@]}'].items[3].product.usItemId'` == '"3084"' ]]; then
    indexOrder58=`echo $i`
    indexItem58=`echo 3`
  fi
done

if [[ $indexOrder58 != "error" ]]; then
echo $curl58 | jq '.data.guestOrder.id' >> track-OrderID.txt
echo $curl58 | jq '.data.guestOrder.customer.email' >> track-email.txt
echo $curl58 | jq '.data.guestOrder.groups_2101['$indexOrder58'].items['$indexItem58'].product.usItemId' >> track-usItemId.txt
echo $curl58 | jq '.data.guestOrder.groups_2101['$indexOrder58'].items['$indexItem58'].priceInfo.linePrice.value' >> track-priceValue.txt
echo $curl58 | jq '.data.guestOrder.groups_2101['$indexOrder58'].deliveryAddress.fullName' >> track-fullName.txt
echo $curl58 | jq '.data.guestOrder.groups_2101['$indexOrder58'].deliveryAddress.address.addressString' >> track-address.txt
echo $curl58 | jq '.data.guestOrder.groups_2101['$indexOrder58'].status.message.parts[].text' >> track-status.txt
echo $curl58 | jq '.data.guestOrder.groups_2101['$indexOrder58'].shipment.trackingNumber' >> track-number.txt
echo $curl58 | jq '.data.guestOrder.groups_2101['$indexOrder58'].shipment.trackingUrl' >> track-url.txt
fi

curl59=`curl 'https://www.walmart.com/orchestra/home/graphql' \
  -H 'authority: www.walmart.com' \
  -H 'sec-ch-ua: " Not A;Brand";v="99", "Chromium";v="96", "Microsoft Edge";v="96"' \
  -H 'x-o-platform: rweb' \
  -H 'dnt: 1' \
  -H 'x-o-correlation-id: wrvYiSFTlAmd8j7a8DDmpuyOpCN_heAnwM3v' \
  -H 'device_profile_ref_id: _s1F3NO8Y2JjaBUKPDcY4iFDWiIl9CyqiJjf' \
  -H 'x-latency-trace: 1' \
  -H 'wm_mp: true' \
  -H 'x-o-market: us' \
  -H 'x-o-platform-version: main-253-ebbb47' \
  -H 'x-o-gql-query: query getGuestOrder' \
  -H 'wm_page_url: https://www.walmart.com/orders' \
  -H 'x-apollo-operation-name: getGuestOrder' \
  -H 'sec-ch-ua-platform: "macOS"' \
  -H 'sec-ch-ua-mobile: ?0' \
  -H 'user-agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/96.0.4664.110 Safari/537.36 Edg/96.0.1054.62' \
  -H 'x-o-segment: oaoh' \
  -H 'content-type: application/json' \
  -H 'accept: application/json' \
  -H 'x-enable-server-timing: 1' \
  -H 'x-o-ccm: server' \
  -H 'wm_qos.correlation_id: wrvYiSFTlAmd8j7a8DDmpuyOpCN_heAnwM3v' \
  -H 'origin: https://www.walmart.com' \
  -H 'sec-fetch-site: same-origin' \
  -H 'sec-fetch-mode: cors' \
  -H 'sec-fetch-dest: empty' \
  -H 'referer: https://www.walmart.com/orders' \
  -H 'accept-language: vi' \
  --data-raw $'{"query":"query getGuestOrder($orderId:ID\u0021 $emailAddress:String\u0021){guestOrder(input:{id:$orderId emailAddress:$emailAddress}){...OrderFieldsFragment}}fragment cancelReason on OrderCancelReason{__typename subReasonCode subDescription}fragment priceDetailFragment on OrderPriceDetailRow{label value displayValue info{title message}rowInfo{...orderPriceDetailRowInfo}}fragment orderPriceDetailRowInfo on OrderPriceDetailRowInfo{title message{...textFragment}}fragment price on Price{displayValue value}fragment variants on MapEntry{name value}fragment OrderAddOn on OrderAddOn{lineId uniqueLineId productInfo{name usItemId offerId}quantityString quantityLabel type fulfillmentInstructions{...textFragment}actions{manageProtectionPlan{...orderActionFragment}cancel}priceInfo{linePrice{...price}}quantity isActive}fragment orderDonationDetails on OrderDonationDetails{message{...textFragment}emailReceipt emailReceiptToken status{...textFragment}errorStatus}fragment orderLineItem on OrderLineItem{id uniqueId actions{contactSeller cancel addToCart configureCake reviewItem resendEGiftCardToken protectionPlan{...orderActionFragment}manageProtectionPlan{...orderActionFragment}}isGift digitalDeliveryMessage quantity quantityString quantityLabel isSubstitutionSelected fulfilledItems{id quantityString priceInfo{itemPrice{value}}product{usItemId name}}isReturnable returnEligibilityMessage product{name usItemId imageInfo{thumbnailUrl}canonicalUrl offerId sellerId sellerName hasSellerBadge seller{sellerId name}orderLimit orderMinLimit weightIncrement salesUnit salesUnitType isSubstitutionEligible isAlcohol}reshop{reshopMessage isShippingAvailable minPromiseDate maxPromiseDate}selectedVariants{...variants}variantAdditionalInfo{parts{text nativeAction}}priceInfo{priceDisplayCodes{showItemPrice priceDisplayCondition finalCostByWeight}itemPrice{...price}linePrice{...price}unitPrice{...price}preDiscountedLinePrice{...price}additionalLines{name value}}discounts{label labelText{...textFragment}}itemReviewed activationCodes{label code}protectionPlanMessage{...textFragment}showSeller isShippedByWalmart seller{id name isPro}digitalDeliveryPhoneNumber addOns{...OrderAddOn}multiboxBundleId}fragment DriverFragment on Driver{id firstName photoUrl}fragment OrderGroupFragment on OrderGroup{driver{...DriverFragment}deliveryDate fulfillmentType status{...OrderGroupStatusFragment}showSeller isShippedByWalmart seller{...SellerFragment}id itemCount items{...LiteLineItemFragment}pickupPerson{firstName lastName email}accessPointId shipment{...ShipmentFragment}returnEligibilityMessage actions{...OrderGroupActionsFragment}recipientEmailAddress digitalDelivery{...DigitalDeliveryFragment}tireInstallationReservation{status extraText}}fragment OrderGroupStatusFragment on OrderGroupStatus{statusType showStatusTracker statusTracker{status label isCurrent}message{...textFragment}subtext subMessage{...textFragment}notice helpCenterText{...textFragment}}fragment textFragment on Text{parts{bold url text nativeAction lineBreak}}fragment LiteLineItemFragment on OrderLineItem{id quantity product{name usItemId imageInfo{thumbnailUrl}offerId isAlcohol}priceInfo{linePrice{...price}}}fragment SellerFragment on GroupSeller{id name isPro}fragment DigitalDeliveryFragment on DigitalDelivery{title name instructions{...textFragment}}fragment ShipmentFragment on Shipment{id trackingNumber isExternalTracking trackingUrl proofOfDelivery{photoUrl photoPreviewUrl showPreview}}fragment OrderGroupActionsFragment on OrderGroupActions{reorder edit track changeSlot checkin editDeliveryInstructions editPickupPerson editTip tip cancel enableTip{...orderActionFragment}enableEdit{...orderActionFragment}rescheduleTireInstall{...orderActionFragment}cancelTireInstall{...orderActionFragment}help viewCancellationDetails{...cancellationDetailsActionFragment}}fragment cancellationDetailsActionFragment on CancellationDetailsAction{label heading text{...textFragment}}fragment ODPGroupCategoryFragment on OrderCategory{type name subtext returnMessage substitutionsBanner{...textFragment}showExtendedSubstitutions actions{substitutions{message label type}nilPickReshop{message action{text url}}returnDetails viewCancellationDetails{...cancellationDetailsActionFragment}trackOnInHomeApp}banner{...textFragment}accordionState items{...orderLineItem}substitutions{...orderLineItem fulfilledItems{...orderLineItem}}returnInfo{...returnInfoFragment}}fragment ODPGroupFragment on OrderGroup{id fulfillmentType deliveryMessage deliveryAddress{fullName firstName lastName address{...addressFragment}}deliveryInstructions{text type typeText}deliveryPreferences{text{...textFragment}cta{...orderActionFragment}}editSubstitutionsCutOff status{statusType showStatusTracker message{...textFragment}notice helpCenterText{...textFragment}}itemCount isCategorized categories{...ODPGroupCategoryFragment}seller{id name isPro}shipment{id trackingNumber}actions{reorder edit track changeSlot checkin editDeliveryInstructions editPickupPerson tip cancel help enableTip{...orderActionFragment}enableEdit{...orderActionFragment}viewCancellationDetails{...cancellationDetailsActionFragment}enableInHome{...orderActionFragment}createGiftReceipt}cutOffTimestamp isEditSubstitutionsEligible isInHome giftDetails{recipientAddress{fullName}recipientEmail senderName giftMessage}donationDetails{...orderDonationDetails}}fragment returnInfoFragment on ReturnInfo{returnOrderId type refundPriceDetails{__typename...refundPriceDetailsFragment}refundMessage tierRefundMessage paymentMethods{__typename description cardType paymentType displayValues message{...textFragment}}actions{__typename generate scheduleOrModifyPickup{text url}reschedulePickup editPickupContact}shippingLabelUrl qrCodeImageUrl carriers{__typename id name}pickupCarrier pickupContact{nameAndAddress{fullName firstName lastName address{addressString city state postalCode addressLineOne addressLineTwo country}}phone}pickupConfirmationNumber bannerMessage{...textFragment}}fragment refundPriceDetailsFragment on RefundPriceDetails{subTotal{__typename...orderPriceDetailRowFragment}fees{__typename...orderPriceDetailRowFragment}discounts{__typename...orderPriceDetailRowFragment}taxTotal{__typename...orderPriceDetailRowFragment}grandTotal{__typename...orderPriceDetailRowFragment}}fragment orderPriceDetailRowFragment on OrderPriceDetailRow{label displayValue value info{__typename title message}}fragment addressFragment on OrderAddress{addressString addressLineOne addressLineTwo state postalCode city}fragment ODPPickupInfo on OrderGroup{pickupInstructions pickupPerson{...person}alternatePickupPerson{...person}store{id name address{...addressFragment}}}fragment person on OrderPickupPerson{firstName lastName email}fragment ODPTippingInfo on OrderGroup{addTipMessage{...textFragment}driver{...DriverFragment}tipping{min{...price}max{...price}suggested{...price}preselected}subtotal{...price}}fragment orderActionFragment on Action{text url}fragment orderCustomer on OrderCustomer{id firstName lastName email isGuest isEmailRegistered}fragment OrderFieldsFragment on Order{__typename id version type customer{...orderCustomer}displayId idBarcodeImageUrl(barWidth:3 barHeight:100) isFuelPurchase title shortTitle timezone tippableGroup{...OrderGroupFragment}amendableGroup{id changeSlotIterationsLeft cutOffTimestamp fulfillmentType deliveryAddress{fullName firstName lastName address{addressString addressLineOne addressLineTwo state postalCode city country}}isAmendInProgress}substitutionsBanner{heading subheading longSubheading}groups_2101{__typename...OrderGroupFragment...ODPGroupFragment...ODPPickupInfo...ODPTippingInfo}multiboxBundles{...orderLineItem}itemCancelReasons{__typename...cancelReason}groupCancelReasons{__typename...cancelReason}priceDetails{__typename subTotal{__typename...priceDetailFragment}taxTotal{__typename...priceDetailFragment}grandTotal{__typename...priceDetailFragment}authorizationAmount{__typename...priceDetailFragment}fees{__typename...priceDetailFragment}discounts{__typename...priceDetailFragment}minimumThreshold{__typename...price}belowMinimumFee{__typename...priceDetailFragment}driverTip{__typename...priceDetailFragment}donations{__typename...priceDetailFragment}}paymentMethods{__typename description cardType paymentType displayValues message{...textFragment}actions{connectToCapitalOne{...orderActionFragment}visitAffirm{...orderActionFragment}}}actions{__typename return pendingReturn cancel startReturn{...orderActionFragment}reorder}banners{...textFragment}}","variables":{"orderId":"2852237144656","emailAddress":"guy1996f@gmail.com"}}' \
  --compressed`
 
for (( i=0; i<=4; i++ ))
do
  if [[ $curl59 =~ "error"  || $curl59 =~ "blocked" ]]; then
    echo "Lỗi email số 59"
    indexOrder59=`echo error`
    break
  elif [[ `echo $curl59 | jq '.data.guestOrder.groups_2101['${i[@]}'].items[0].product.usItemId'` == '"395854693"' ]]; then
    indexOrder59=`echo $i`
    indexItem59=`echo 0`
  elif [[ `echo $curl59 | jq '.data.guestOrder.groups_2101['${i[@]}'].items[1].product.usItemId'` == '"395854693"' ]]; then
    indexOrder59=`echo $i`
    indexItem59=`echo 1`
  elif [[ `echo $curl59 | jq '.data.guestOrder.groups_2101['${i[@]}'].items[2].product.usItemId'` == '"395854693"' ]]; then
    indexOrder59=`echo $i`
    indexItem59=`echo 2`
  elif [[ `echo $curl59 | jq '.data.guestOrder.groups_2101['${i[@]}'].items[3].product.usItemId'` == '"395854693"' ]]; then
    indexOrder59=`echo $i`
    indexItem59=`echo 3`
  fi
done

if [[ $indexOrder59 != "error" ]]; then
echo $curl59 | jq '.data.guestOrder.id' >> track-OrderID.txt
echo $curl59 | jq '.data.guestOrder.customer.email' >> track-email.txt
echo $curl59 | jq '.data.guestOrder.groups_2101['$indexOrder59'].items['$indexItem59'].product.usItemId' >> track-usItemId.txt
echo $curl59 | jq '.data.guestOrder.groups_2101['$indexOrder59'].items['$indexItem59'].priceInfo.linePrice.value' >> track-priceValue.txt
echo $curl59 | jq '.data.guestOrder.groups_2101['$indexOrder59'].deliveryAddress.fullName' >> track-fullName.txt
echo $curl59 | jq '.data.guestOrder.groups_2101['$indexOrder59'].deliveryAddress.address.addressString' >> track-address.txt
echo $curl59 | jq '.data.guestOrder.groups_2101['$indexOrder59'].status.message.parts[].text' >> track-status.txt
echo $curl59 | jq '.data.guestOrder.groups_2101['$indexOrder59'].shipment.trackingNumber' >> track-number.txt
echo $curl59 | jq '.data.guestOrder.groups_2101['$indexOrder59'].shipment.trackingUrl' >> track-url.txt
fi

curl60=`curl 'https://www.walmart.com/orchestra/home/graphql' \
  -H 'authority: www.walmart.com' \
  -H 'sec-ch-ua: " Not A;Brand";v="99", "Chromium";v="96", "Microsoft Edge";v="96"' \
  -H 'x-o-platform: rweb' \
  -H 'dnt: 1' \
  -H 'x-o-correlation-id: wrvYiSFTlAmd8j7a8DDmpuyOpCN_heAnwM3v' \
  -H 'device_profile_ref_id: _s1F3NO8Y2JjaBUKPDcY4iFDWiIl9CyqiJjf' \
  -H 'x-latency-trace: 1' \
  -H 'wm_mp: true' \
  -H 'x-o-market: us' \
  -H 'x-o-platform-version: main-253-ebbb47' \
  -H 'x-o-gql-query: query getGuestOrder' \
  -H 'wm_page_url: https://www.walmart.com/orders' \
  -H 'x-apollo-operation-name: getGuestOrder' \
  -H 'sec-ch-ua-platform: "macOS"' \
  -H 'sec-ch-ua-mobile: ?0' \
  -H 'user-agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/96.0.4664.110 Safari/537.36 Edg/96.0.1054.62' \
  -H 'x-o-segment: oaoh' \
  -H 'content-type: application/json' \
  -H 'accept: application/json' \
  -H 'x-enable-server-timing: 1' \
  -H 'x-o-ccm: server' \
  -H 'wm_qos.correlation_id: wrvYiSFTlAmd8j7a8DDmpuyOpCN_heAnwM3v' \
  -H 'origin: https://www.walmart.com' \
  -H 'sec-fetch-site: same-origin' \
  -H 'sec-fetch-mode: cors' \
  -H 'sec-fetch-dest: empty' \
  -H 'referer: https://www.walmart.com/orders' \
  -H 'accept-language: vi' \
  --data-raw $'{"query":"query getGuestOrder($orderId:ID\u0021 $emailAddress:String\u0021){guestOrder(input:{id:$orderId emailAddress:$emailAddress}){...OrderFieldsFragment}}fragment cancelReason on OrderCancelReason{__typename subReasonCode subDescription}fragment priceDetailFragment on OrderPriceDetailRow{label value displayValue info{title message}rowInfo{...orderPriceDetailRowInfo}}fragment orderPriceDetailRowInfo on OrderPriceDetailRowInfo{title message{...textFragment}}fragment price on Price{displayValue value}fragment variants on MapEntry{name value}fragment OrderAddOn on OrderAddOn{lineId uniqueLineId productInfo{name usItemId offerId}quantityString quantityLabel type fulfillmentInstructions{...textFragment}actions{manageProtectionPlan{...orderActionFragment}cancel}priceInfo{linePrice{...price}}quantity isActive}fragment orderDonationDetails on OrderDonationDetails{message{...textFragment}emailReceipt emailReceiptToken status{...textFragment}errorStatus}fragment orderLineItem on OrderLineItem{id uniqueId actions{contactSeller cancel addToCart configureCake reviewItem resendEGiftCardToken protectionPlan{...orderActionFragment}manageProtectionPlan{...orderActionFragment}}isGift digitalDeliveryMessage quantity quantityString quantityLabel isSubstitutionSelected fulfilledItems{id quantityString priceInfo{itemPrice{value}}product{usItemId name}}isReturnable returnEligibilityMessage product{name usItemId imageInfo{thumbnailUrl}canonicalUrl offerId sellerId sellerName hasSellerBadge seller{sellerId name}orderLimit orderMinLimit weightIncrement salesUnit salesUnitType isSubstitutionEligible isAlcohol}reshop{reshopMessage isShippingAvailable minPromiseDate maxPromiseDate}selectedVariants{...variants}variantAdditionalInfo{parts{text nativeAction}}priceInfo{priceDisplayCodes{showItemPrice priceDisplayCondition finalCostByWeight}itemPrice{...price}linePrice{...price}unitPrice{...price}preDiscountedLinePrice{...price}additionalLines{name value}}discounts{label labelText{...textFragment}}itemReviewed activationCodes{label code}protectionPlanMessage{...textFragment}showSeller isShippedByWalmart seller{id name isPro}digitalDeliveryPhoneNumber addOns{...OrderAddOn}multiboxBundleId}fragment DriverFragment on Driver{id firstName photoUrl}fragment OrderGroupFragment on OrderGroup{driver{...DriverFragment}deliveryDate fulfillmentType status{...OrderGroupStatusFragment}showSeller isShippedByWalmart seller{...SellerFragment}id itemCount items{...LiteLineItemFragment}pickupPerson{firstName lastName email}accessPointId shipment{...ShipmentFragment}returnEligibilityMessage actions{...OrderGroupActionsFragment}recipientEmailAddress digitalDelivery{...DigitalDeliveryFragment}tireInstallationReservation{status extraText}}fragment OrderGroupStatusFragment on OrderGroupStatus{statusType showStatusTracker statusTracker{status label isCurrent}message{...textFragment}subtext subMessage{...textFragment}notice helpCenterText{...textFragment}}fragment textFragment on Text{parts{bold url text nativeAction lineBreak}}fragment LiteLineItemFragment on OrderLineItem{id quantity product{name usItemId imageInfo{thumbnailUrl}offerId isAlcohol}priceInfo{linePrice{...price}}}fragment SellerFragment on GroupSeller{id name isPro}fragment DigitalDeliveryFragment on DigitalDelivery{title name instructions{...textFragment}}fragment ShipmentFragment on Shipment{id trackingNumber isExternalTracking trackingUrl proofOfDelivery{photoUrl photoPreviewUrl showPreview}}fragment OrderGroupActionsFragment on OrderGroupActions{reorder edit track changeSlot checkin editDeliveryInstructions editPickupPerson editTip tip cancel enableTip{...orderActionFragment}enableEdit{...orderActionFragment}rescheduleTireInstall{...orderActionFragment}cancelTireInstall{...orderActionFragment}help viewCancellationDetails{...cancellationDetailsActionFragment}}fragment cancellationDetailsActionFragment on CancellationDetailsAction{label heading text{...textFragment}}fragment ODPGroupCategoryFragment on OrderCategory{type name subtext returnMessage substitutionsBanner{...textFragment}showExtendedSubstitutions actions{substitutions{message label type}nilPickReshop{message action{text url}}returnDetails viewCancellationDetails{...cancellationDetailsActionFragment}trackOnInHomeApp}banner{...textFragment}accordionState items{...orderLineItem}substitutions{...orderLineItem fulfilledItems{...orderLineItem}}returnInfo{...returnInfoFragment}}fragment ODPGroupFragment on OrderGroup{id fulfillmentType deliveryMessage deliveryAddress{fullName firstName lastName address{...addressFragment}}deliveryInstructions{text type typeText}deliveryPreferences{text{...textFragment}cta{...orderActionFragment}}editSubstitutionsCutOff status{statusType showStatusTracker message{...textFragment}notice helpCenterText{...textFragment}}itemCount isCategorized categories{...ODPGroupCategoryFragment}seller{id name isPro}shipment{id trackingNumber}actions{reorder edit track changeSlot checkin editDeliveryInstructions editPickupPerson tip cancel help enableTip{...orderActionFragment}enableEdit{...orderActionFragment}viewCancellationDetails{...cancellationDetailsActionFragment}enableInHome{...orderActionFragment}createGiftReceipt}cutOffTimestamp isEditSubstitutionsEligible isInHome giftDetails{recipientAddress{fullName}recipientEmail senderName giftMessage}donationDetails{...orderDonationDetails}}fragment returnInfoFragment on ReturnInfo{returnOrderId type refundPriceDetails{__typename...refundPriceDetailsFragment}refundMessage tierRefundMessage paymentMethods{__typename description cardType paymentType displayValues message{...textFragment}}actions{__typename generate scheduleOrModifyPickup{text url}reschedulePickup editPickupContact}shippingLabelUrl qrCodeImageUrl carriers{__typename id name}pickupCarrier pickupContact{nameAndAddress{fullName firstName lastName address{addressString city state postalCode addressLineOne addressLineTwo country}}phone}pickupConfirmationNumber bannerMessage{...textFragment}}fragment refundPriceDetailsFragment on RefundPriceDetails{subTotal{__typename...orderPriceDetailRowFragment}fees{__typename...orderPriceDetailRowFragment}discounts{__typename...orderPriceDetailRowFragment}taxTotal{__typename...orderPriceDetailRowFragment}grandTotal{__typename...orderPriceDetailRowFragment}}fragment orderPriceDetailRowFragment on OrderPriceDetailRow{label displayValue value info{__typename title message}}fragment addressFragment on OrderAddress{addressString addressLineOne addressLineTwo state postalCode city}fragment ODPPickupInfo on OrderGroup{pickupInstructions pickupPerson{...person}alternatePickupPerson{...person}store{id name address{...addressFragment}}}fragment person on OrderPickupPerson{firstName lastName email}fragment ODPTippingInfo on OrderGroup{addTipMessage{...textFragment}driver{...DriverFragment}tipping{min{...price}max{...price}suggested{...price}preselected}subtotal{...price}}fragment orderActionFragment on Action{text url}fragment orderCustomer on OrderCustomer{id firstName lastName email isGuest isEmailRegistered}fragment OrderFieldsFragment on Order{__typename id version type customer{...orderCustomer}displayId idBarcodeImageUrl(barWidth:3 barHeight:100) isFuelPurchase title shortTitle timezone tippableGroup{...OrderGroupFragment}amendableGroup{id changeSlotIterationsLeft cutOffTimestamp fulfillmentType deliveryAddress{fullName firstName lastName address{addressString addressLineOne addressLineTwo state postalCode city country}}isAmendInProgress}substitutionsBanner{heading subheading longSubheading}groups_2101{__typename...OrderGroupFragment...ODPGroupFragment...ODPPickupInfo...ODPTippingInfo}multiboxBundles{...orderLineItem}itemCancelReasons{__typename...cancelReason}groupCancelReasons{__typename...cancelReason}priceDetails{__typename subTotal{__typename...priceDetailFragment}taxTotal{__typename...priceDetailFragment}grandTotal{__typename...priceDetailFragment}authorizationAmount{__typename...priceDetailFragment}fees{__typename...priceDetailFragment}discounts{__typename...priceDetailFragment}minimumThreshold{__typename...price}belowMinimumFee{__typename...priceDetailFragment}driverTip{__typename...priceDetailFragment}donations{__typename...priceDetailFragment}}paymentMethods{__typename description cardType paymentType displayValues message{...textFragment}actions{connectToCapitalOne{...orderActionFragment}visitAffirm{...orderActionFragment}}}actions{__typename return pendingReturn cancel startReturn{...orderActionFragment}reorder}banners{...textFragment}}","variables":{"orderId":"2852237124866","emailAddress":"ymoneal06@gmail.com"}}' \
  --compressed`
 
for (( i=0; i<=4; i++ ))
do
  if [[ $curl60 =~ "error"  || $curl60 =~ "blocked" ]]; then
    echo "Lỗi email số 60"
    indexOrder60=`echo error`
    break
  elif [[ `echo $curl60 | jq '.data.guestOrder.groups_2101['${i[@]}'].items[0].product.usItemId'` == '"504678442"' ]]; then
    indexOrder60=`echo $i`
    indexItem60=`echo 0`
  elif [[ `echo $curl60 | jq '.data.guestOrder.groups_2101['${i[@]}'].items[1].product.usItemId'` == '"504678442"' ]]; then
    indexOrder60=`echo $i`
    indexItem60=`echo 1`
  elif [[ `echo $curl60 | jq '.data.guestOrder.groups_2101['${i[@]}'].items[2].product.usItemId'` == '"504678442"' ]]; then
    indexOrder60=`echo $i`
    indexItem60=`echo 2`
  elif [[ `echo $curl60 | jq '.data.guestOrder.groups_2101['${i[@]}'].items[3].product.usItemId'` == '"504678442"' ]]; then
    indexOrder60=`echo $i`
    indexItem60=`echo 3`
  fi
done

if [[ $indexOrder60 != "error" ]]; then
echo $curl60 | jq '.data.guestOrder.id' >> track-OrderID.txt
echo $curl60 | jq '.data.guestOrder.customer.email' >> track-email.txt
echo $curl60 | jq '.data.guestOrder.groups_2101['$indexOrder60'].items['$indexItem60'].product.usItemId' >> track-usItemId.txt
echo $curl60 | jq '.data.guestOrder.groups_2101['$indexOrder60'].items['$indexItem60'].priceInfo.linePrice.value' >> track-priceValue.txt
echo $curl60 | jq '.data.guestOrder.groups_2101['$indexOrder60'].deliveryAddress.fullName' >> track-fullName.txt
echo $curl60 | jq '.data.guestOrder.groups_2101['$indexOrder60'].deliveryAddress.address.addressString' >> track-address.txt
echo $curl60 | jq '.data.guestOrder.groups_2101['$indexOrder60'].status.message.parts[].text' >> track-status.txt
echo $curl60 | jq '.data.guestOrder.groups_2101['$indexOrder60'].shipment.trackingNumber' >> track-number.txt
echo $curl60 | jq '.data.guestOrder.groups_2101['$indexOrder60'].shipment.trackingUrl' >> track-url.txt
fi

curl61=`curl 'https://www.walmart.com/orchestra/home/graphql' \
  -H 'authority: www.walmart.com' \
  -H 'sec-ch-ua: " Not A;Brand";v="99", "Chromium";v="96", "Microsoft Edge";v="96"' \
  -H 'x-o-platform: rweb' \
  -H 'dnt: 1' \
  -H 'x-o-correlation-id: wrvYiSFTlAmd8j7a8DDmpuyOpCN_heAnwM3v' \
  -H 'device_profile_ref_id: _s1F3NO8Y2JjaBUKPDcY4iFDWiIl9CyqiJjf' \
  -H 'x-latency-trace: 1' \
  -H 'wm_mp: true' \
  -H 'x-o-market: us' \
  -H 'x-o-platform-version: main-253-ebbb47' \
  -H 'x-o-gql-query: query getGuestOrder' \
  -H 'wm_page_url: https://www.walmart.com/orders' \
  -H 'x-apollo-operation-name: getGuestOrder' \
  -H 'sec-ch-ua-platform: "macOS"' \
  -H 'sec-ch-ua-mobile: ?0' \
  -H 'user-agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/96.0.4664.110 Safari/537.36 Edg/96.0.1054.62' \
  -H 'x-o-segment: oaoh' \
  -H 'content-type: application/json' \
  -H 'accept: application/json' \
  -H 'x-enable-server-timing: 1' \
  -H 'x-o-ccm: server' \
  -H 'wm_qos.correlation_id: wrvYiSFTlAmd8j7a8DDmpuyOpCN_heAnwM3v' \
  -H 'origin: https://www.walmart.com' \
  -H 'sec-fetch-site: same-origin' \
  -H 'sec-fetch-mode: cors' \
  -H 'sec-fetch-dest: empty' \
  -H 'referer: https://www.walmart.com/orders' \
  -H 'accept-language: vi' \
  --data-raw $'{"query":"query getGuestOrder($orderId:ID\u0021 $emailAddress:String\u0021){guestOrder(input:{id:$orderId emailAddress:$emailAddress}){...OrderFieldsFragment}}fragment cancelReason on OrderCancelReason{__typename subReasonCode subDescription}fragment priceDetailFragment on OrderPriceDetailRow{label value displayValue info{title message}rowInfo{...orderPriceDetailRowInfo}}fragment orderPriceDetailRowInfo on OrderPriceDetailRowInfo{title message{...textFragment}}fragment price on Price{displayValue value}fragment variants on MapEntry{name value}fragment OrderAddOn on OrderAddOn{lineId uniqueLineId productInfo{name usItemId offerId}quantityString quantityLabel type fulfillmentInstructions{...textFragment}actions{manageProtectionPlan{...orderActionFragment}cancel}priceInfo{linePrice{...price}}quantity isActive}fragment orderDonationDetails on OrderDonationDetails{message{...textFragment}emailReceipt emailReceiptToken status{...textFragment}errorStatus}fragment orderLineItem on OrderLineItem{id uniqueId actions{contactSeller cancel addToCart configureCake reviewItem resendEGiftCardToken protectionPlan{...orderActionFragment}manageProtectionPlan{...orderActionFragment}}isGift digitalDeliveryMessage quantity quantityString quantityLabel isSubstitutionSelected fulfilledItems{id quantityString priceInfo{itemPrice{value}}product{usItemId name}}isReturnable returnEligibilityMessage product{name usItemId imageInfo{thumbnailUrl}canonicalUrl offerId sellerId sellerName hasSellerBadge seller{sellerId name}orderLimit orderMinLimit weightIncrement salesUnit salesUnitType isSubstitutionEligible isAlcohol}reshop{reshopMessage isShippingAvailable minPromiseDate maxPromiseDate}selectedVariants{...variants}variantAdditionalInfo{parts{text nativeAction}}priceInfo{priceDisplayCodes{showItemPrice priceDisplayCondition finalCostByWeight}itemPrice{...price}linePrice{...price}unitPrice{...price}preDiscountedLinePrice{...price}additionalLines{name value}}discounts{label labelText{...textFragment}}itemReviewed activationCodes{label code}protectionPlanMessage{...textFragment}showSeller isShippedByWalmart seller{id name isPro}digitalDeliveryPhoneNumber addOns{...OrderAddOn}multiboxBundleId}fragment DriverFragment on Driver{id firstName photoUrl}fragment OrderGroupFragment on OrderGroup{driver{...DriverFragment}deliveryDate fulfillmentType status{...OrderGroupStatusFragment}showSeller isShippedByWalmart seller{...SellerFragment}id itemCount items{...LiteLineItemFragment}pickupPerson{firstName lastName email}accessPointId shipment{...ShipmentFragment}returnEligibilityMessage actions{...OrderGroupActionsFragment}recipientEmailAddress digitalDelivery{...DigitalDeliveryFragment}tireInstallationReservation{status extraText}}fragment OrderGroupStatusFragment on OrderGroupStatus{statusType showStatusTracker statusTracker{status label isCurrent}message{...textFragment}subtext subMessage{...textFragment}notice helpCenterText{...textFragment}}fragment textFragment on Text{parts{bold url text nativeAction lineBreak}}fragment LiteLineItemFragment on OrderLineItem{id quantity product{name usItemId imageInfo{thumbnailUrl}offerId isAlcohol}priceInfo{linePrice{...price}}}fragment SellerFragment on GroupSeller{id name isPro}fragment DigitalDeliveryFragment on DigitalDelivery{title name instructions{...textFragment}}fragment ShipmentFragment on Shipment{id trackingNumber isExternalTracking trackingUrl proofOfDelivery{photoUrl photoPreviewUrl showPreview}}fragment OrderGroupActionsFragment on OrderGroupActions{reorder edit track changeSlot checkin editDeliveryInstructions editPickupPerson editTip tip cancel enableTip{...orderActionFragment}enableEdit{...orderActionFragment}rescheduleTireInstall{...orderActionFragment}cancelTireInstall{...orderActionFragment}help viewCancellationDetails{...cancellationDetailsActionFragment}}fragment cancellationDetailsActionFragment on CancellationDetailsAction{label heading text{...textFragment}}fragment ODPGroupCategoryFragment on OrderCategory{type name subtext returnMessage substitutionsBanner{...textFragment}showExtendedSubstitutions actions{substitutions{message label type}nilPickReshop{message action{text url}}returnDetails viewCancellationDetails{...cancellationDetailsActionFragment}trackOnInHomeApp}banner{...textFragment}accordionState items{...orderLineItem}substitutions{...orderLineItem fulfilledItems{...orderLineItem}}returnInfo{...returnInfoFragment}}fragment ODPGroupFragment on OrderGroup{id fulfillmentType deliveryMessage deliveryAddress{fullName firstName lastName address{...addressFragment}}deliveryInstructions{text type typeText}deliveryPreferences{text{...textFragment}cta{...orderActionFragment}}editSubstitutionsCutOff status{statusType showStatusTracker message{...textFragment}notice helpCenterText{...textFragment}}itemCount isCategorized categories{...ODPGroupCategoryFragment}seller{id name isPro}shipment{id trackingNumber}actions{reorder edit track changeSlot checkin editDeliveryInstructions editPickupPerson tip cancel help enableTip{...orderActionFragment}enableEdit{...orderActionFragment}viewCancellationDetails{...cancellationDetailsActionFragment}enableInHome{...orderActionFragment}createGiftReceipt}cutOffTimestamp isEditSubstitutionsEligible isInHome giftDetails{recipientAddress{fullName}recipientEmail senderName giftMessage}donationDetails{...orderDonationDetails}}fragment returnInfoFragment on ReturnInfo{returnOrderId type refundPriceDetails{__typename...refundPriceDetailsFragment}refundMessage tierRefundMessage paymentMethods{__typename description cardType paymentType displayValues message{...textFragment}}actions{__typename generate scheduleOrModifyPickup{text url}reschedulePickup editPickupContact}shippingLabelUrl qrCodeImageUrl carriers{__typename id name}pickupCarrier pickupContact{nameAndAddress{fullName firstName lastName address{addressString city state postalCode addressLineOne addressLineTwo country}}phone}pickupConfirmationNumber bannerMessage{...textFragment}}fragment refundPriceDetailsFragment on RefundPriceDetails{subTotal{__typename...orderPriceDetailRowFragment}fees{__typename...orderPriceDetailRowFragment}discounts{__typename...orderPriceDetailRowFragment}taxTotal{__typename...orderPriceDetailRowFragment}grandTotal{__typename...orderPriceDetailRowFragment}}fragment orderPriceDetailRowFragment on OrderPriceDetailRow{label displayValue value info{__typename title message}}fragment addressFragment on OrderAddress{addressString addressLineOne addressLineTwo state postalCode city}fragment ODPPickupInfo on OrderGroup{pickupInstructions pickupPerson{...person}alternatePickupPerson{...person}store{id name address{...addressFragment}}}fragment person on OrderPickupPerson{firstName lastName email}fragment ODPTippingInfo on OrderGroup{addTipMessage{...textFragment}driver{...DriverFragment}tipping{min{...price}max{...price}suggested{...price}preselected}subtotal{...price}}fragment orderActionFragment on Action{text url}fragment orderCustomer on OrderCustomer{id firstName lastName email isGuest isEmailRegistered}fragment OrderFieldsFragment on Order{__typename id version type customer{...orderCustomer}displayId idBarcodeImageUrl(barWidth:3 barHeight:100) isFuelPurchase title shortTitle timezone tippableGroup{...OrderGroupFragment}amendableGroup{id changeSlotIterationsLeft cutOffTimestamp fulfillmentType deliveryAddress{fullName firstName lastName address{addressString addressLineOne addressLineTwo state postalCode city country}}isAmendInProgress}substitutionsBanner{heading subheading longSubheading}groups_2101{__typename...OrderGroupFragment...ODPGroupFragment...ODPPickupInfo...ODPTippingInfo}multiboxBundles{...orderLineItem}itemCancelReasons{__typename...cancelReason}groupCancelReasons{__typename...cancelReason}priceDetails{__typename subTotal{__typename...priceDetailFragment}taxTotal{__typename...priceDetailFragment}grandTotal{__typename...priceDetailFragment}authorizationAmount{__typename...priceDetailFragment}fees{__typename...priceDetailFragment}discounts{__typename...priceDetailFragment}minimumThreshold{__typename...price}belowMinimumFee{__typename...priceDetailFragment}driverTip{__typename...priceDetailFragment}donations{__typename...priceDetailFragment}}paymentMethods{__typename description cardType paymentType displayValues message{...textFragment}actions{connectToCapitalOne{...orderActionFragment}visitAffirm{...orderActionFragment}}}actions{__typename return pendingReturn cancel startReturn{...orderActionFragment}reorder}banners{...textFragment}}","variables":{"orderId":"2832232589350","emailAddress":"sandrjj1@yahoo.com"}}' \
  --compressed`
 
for (( i=0; i<=4; i++ ))
do
  if [[ $curl61 =~ "error"  || $curl61 =~ "blocked" ]]; then
    echo "Lỗi email số 61"
    indexOrder61=`echo error`
    break
  elif [[ `echo $curl61 | jq '.data.guestOrder.groups_2101['${i[@]}'].items[0].product.usItemId'` == '"520367700"' ]]; then
    indexOrder61=`echo $i`
    indexItem61=`echo 0`
  elif [[ `echo $curl61 | jq '.data.guestOrder.groups_2101['${i[@]}'].items[1].product.usItemId'` == '"520367700"' ]]; then
    indexOrder61=`echo $i`
    indexItem61=`echo 1`
  elif [[ `echo $curl61 | jq '.data.guestOrder.groups_2101['${i[@]}'].items[2].product.usItemId'` == '"520367700"' ]]; then
    indexOrder61=`echo $i`
    indexItem61=`echo 2`
  elif [[ `echo $curl61 | jq '.data.guestOrder.groups_2101['${i[@]}'].items[3].product.usItemId'` == '"520367700"' ]]; then
    indexOrder61=`echo $i`
    indexItem61=`echo 3`
  fi
done

if [[ $indexOrder61 != "error" ]]; then
echo $curl61 | jq '.data.guestOrder.id' >> track-OrderID.txt
echo $curl61 | jq '.data.guestOrder.customer.email' >> track-email.txt
echo $curl61 | jq '.data.guestOrder.groups_2101['$indexOrder61'].items['$indexItem61'].product.usItemId' >> track-usItemId.txt
echo $curl61 | jq '.data.guestOrder.groups_2101['$indexOrder61'].items['$indexItem61'].priceInfo.linePrice.value' >> track-priceValue.txt
echo $curl61 | jq '.data.guestOrder.groups_2101['$indexOrder61'].deliveryAddress.fullName' >> track-fullName.txt
echo $curl61 | jq '.data.guestOrder.groups_2101['$indexOrder61'].deliveryAddress.address.addressString' >> track-address.txt
echo $curl61 | jq '.data.guestOrder.groups_2101['$indexOrder61'].status.message.parts[].text' >> track-status.txt
echo $curl61 | jq '.data.guestOrder.groups_2101['$indexOrder61'].shipment.trackingNumber' >> track-number.txt
echo $curl61 | jq '.data.guestOrder.groups_2101['$indexOrder61'].shipment.trackingUrl' >> track-url.txt
fi

curl62=`curl 'https://www.walmart.com/orchestra/home/graphql' \
  -H 'authority: www.walmart.com' \
  -H 'sec-ch-ua: " Not A;Brand";v="99", "Chromium";v="96", "Microsoft Edge";v="96"' \
  -H 'x-o-platform: rweb' \
  -H 'dnt: 1' \
  -H 'x-o-correlation-id: wrvYiSFTlAmd8j7a8DDmpuyOpCN_heAnwM3v' \
  -H 'device_profile_ref_id: _s1F3NO8Y2JjaBUKPDcY4iFDWiIl9CyqiJjf' \
  -H 'x-latency-trace: 1' \
  -H 'wm_mp: true' \
  -H 'x-o-market: us' \
  -H 'x-o-platform-version: main-253-ebbb47' \
  -H 'x-o-gql-query: query getGuestOrder' \
  -H 'wm_page_url: https://www.walmart.com/orders' \
  -H 'x-apollo-operation-name: getGuestOrder' \
  -H 'sec-ch-ua-platform: "macOS"' \
  -H 'sec-ch-ua-mobile: ?0' \
  -H 'user-agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/96.0.4664.110 Safari/537.36 Edg/96.0.1054.62' \
  -H 'x-o-segment: oaoh' \
  -H 'content-type: application/json' \
  -H 'accept: application/json' \
  -H 'x-enable-server-timing: 1' \
  -H 'x-o-ccm: server' \
  -H 'wm_qos.correlation_id: wrvYiSFTlAmd8j7a8DDmpuyOpCN_heAnwM3v' \
  -H 'origin: https://www.walmart.com' \
  -H 'sec-fetch-site: same-origin' \
  -H 'sec-fetch-mode: cors' \
  -H 'sec-fetch-dest: empty' \
  -H 'referer: https://www.walmart.com/orders' \
  -H 'accept-language: vi' \
  --data-raw $'{"query":"query getGuestOrder($orderId:ID\u0021 $emailAddress:String\u0021){guestOrder(input:{id:$orderId emailAddress:$emailAddress}){...OrderFieldsFragment}}fragment cancelReason on OrderCancelReason{__typename subReasonCode subDescription}fragment priceDetailFragment on OrderPriceDetailRow{label value displayValue info{title message}rowInfo{...orderPriceDetailRowInfo}}fragment orderPriceDetailRowInfo on OrderPriceDetailRowInfo{title message{...textFragment}}fragment price on Price{displayValue value}fragment variants on MapEntry{name value}fragment OrderAddOn on OrderAddOn{lineId uniqueLineId productInfo{name usItemId offerId}quantityString quantityLabel type fulfillmentInstructions{...textFragment}actions{manageProtectionPlan{...orderActionFragment}cancel}priceInfo{linePrice{...price}}quantity isActive}fragment orderDonationDetails on OrderDonationDetails{message{...textFragment}emailReceipt emailReceiptToken status{...textFragment}errorStatus}fragment orderLineItem on OrderLineItem{id uniqueId actions{contactSeller cancel addToCart configureCake reviewItem resendEGiftCardToken protectionPlan{...orderActionFragment}manageProtectionPlan{...orderActionFragment}}isGift digitalDeliveryMessage quantity quantityString quantityLabel isSubstitutionSelected fulfilledItems{id quantityString priceInfo{itemPrice{value}}product{usItemId name}}isReturnable returnEligibilityMessage product{name usItemId imageInfo{thumbnailUrl}canonicalUrl offerId sellerId sellerName hasSellerBadge seller{sellerId name}orderLimit orderMinLimit weightIncrement salesUnit salesUnitType isSubstitutionEligible isAlcohol}reshop{reshopMessage isShippingAvailable minPromiseDate maxPromiseDate}selectedVariants{...variants}variantAdditionalInfo{parts{text nativeAction}}priceInfo{priceDisplayCodes{showItemPrice priceDisplayCondition finalCostByWeight}itemPrice{...price}linePrice{...price}unitPrice{...price}preDiscountedLinePrice{...price}additionalLines{name value}}discounts{label labelText{...textFragment}}itemReviewed activationCodes{label code}protectionPlanMessage{...textFragment}showSeller isShippedByWalmart seller{id name isPro}digitalDeliveryPhoneNumber addOns{...OrderAddOn}multiboxBundleId}fragment DriverFragment on Driver{id firstName photoUrl}fragment OrderGroupFragment on OrderGroup{driver{...DriverFragment}deliveryDate fulfillmentType status{...OrderGroupStatusFragment}showSeller isShippedByWalmart seller{...SellerFragment}id itemCount items{...LiteLineItemFragment}pickupPerson{firstName lastName email}accessPointId shipment{...ShipmentFragment}returnEligibilityMessage actions{...OrderGroupActionsFragment}recipientEmailAddress digitalDelivery{...DigitalDeliveryFragment}tireInstallationReservation{status extraText}}fragment OrderGroupStatusFragment on OrderGroupStatus{statusType showStatusTracker statusTracker{status label isCurrent}message{...textFragment}subtext subMessage{...textFragment}notice helpCenterText{...textFragment}}fragment textFragment on Text{parts{bold url text nativeAction lineBreak}}fragment LiteLineItemFragment on OrderLineItem{id quantity product{name usItemId imageInfo{thumbnailUrl}offerId isAlcohol}priceInfo{linePrice{...price}}}fragment SellerFragment on GroupSeller{id name isPro}fragment DigitalDeliveryFragment on DigitalDelivery{title name instructions{...textFragment}}fragment ShipmentFragment on Shipment{id trackingNumber isExternalTracking trackingUrl proofOfDelivery{photoUrl photoPreviewUrl showPreview}}fragment OrderGroupActionsFragment on OrderGroupActions{reorder edit track changeSlot checkin editDeliveryInstructions editPickupPerson editTip tip cancel enableTip{...orderActionFragment}enableEdit{...orderActionFragment}rescheduleTireInstall{...orderActionFragment}cancelTireInstall{...orderActionFragment}help viewCancellationDetails{...cancellationDetailsActionFragment}}fragment cancellationDetailsActionFragment on CancellationDetailsAction{label heading text{...textFragment}}fragment ODPGroupCategoryFragment on OrderCategory{type name subtext returnMessage substitutionsBanner{...textFragment}showExtendedSubstitutions actions{substitutions{message label type}nilPickReshop{message action{text url}}returnDetails viewCancellationDetails{...cancellationDetailsActionFragment}trackOnInHomeApp}banner{...textFragment}accordionState items{...orderLineItem}substitutions{...orderLineItem fulfilledItems{...orderLineItem}}returnInfo{...returnInfoFragment}}fragment ODPGroupFragment on OrderGroup{id fulfillmentType deliveryMessage deliveryAddress{fullName firstName lastName address{...addressFragment}}deliveryInstructions{text type typeText}deliveryPreferences{text{...textFragment}cta{...orderActionFragment}}editSubstitutionsCutOff status{statusType showStatusTracker message{...textFragment}notice helpCenterText{...textFragment}}itemCount isCategorized categories{...ODPGroupCategoryFragment}seller{id name isPro}shipment{id trackingNumber}actions{reorder edit track changeSlot checkin editDeliveryInstructions editPickupPerson tip cancel help enableTip{...orderActionFragment}enableEdit{...orderActionFragment}viewCancellationDetails{...cancellationDetailsActionFragment}enableInHome{...orderActionFragment}createGiftReceipt}cutOffTimestamp isEditSubstitutionsEligible isInHome giftDetails{recipientAddress{fullName}recipientEmail senderName giftMessage}donationDetails{...orderDonationDetails}}fragment returnInfoFragment on ReturnInfo{returnOrderId type refundPriceDetails{__typename...refundPriceDetailsFragment}refundMessage tierRefundMessage paymentMethods{__typename description cardType paymentType displayValues message{...textFragment}}actions{__typename generate scheduleOrModifyPickup{text url}reschedulePickup editPickupContact}shippingLabelUrl qrCodeImageUrl carriers{__typename id name}pickupCarrier pickupContact{nameAndAddress{fullName firstName lastName address{addressString city state postalCode addressLineOne addressLineTwo country}}phone}pickupConfirmationNumber bannerMessage{...textFragment}}fragment refundPriceDetailsFragment on RefundPriceDetails{subTotal{__typename...orderPriceDetailRowFragment}fees{__typename...orderPriceDetailRowFragment}discounts{__typename...orderPriceDetailRowFragment}taxTotal{__typename...orderPriceDetailRowFragment}grandTotal{__typename...orderPriceDetailRowFragment}}fragment orderPriceDetailRowFragment on OrderPriceDetailRow{label displayValue value info{__typename title message}}fragment addressFragment on OrderAddress{addressString addressLineOne addressLineTwo state postalCode city}fragment ODPPickupInfo on OrderGroup{pickupInstructions pickupPerson{...person}alternatePickupPerson{...person}store{id name address{...addressFragment}}}fragment person on OrderPickupPerson{firstName lastName email}fragment ODPTippingInfo on OrderGroup{addTipMessage{...textFragment}driver{...DriverFragment}tipping{min{...price}max{...price}suggested{...price}preselected}subtotal{...price}}fragment orderActionFragment on Action{text url}fragment orderCustomer on OrderCustomer{id firstName lastName email isGuest isEmailRegistered}fragment OrderFieldsFragment on Order{__typename id version type customer{...orderCustomer}displayId idBarcodeImageUrl(barWidth:3 barHeight:100) isFuelPurchase title shortTitle timezone tippableGroup{...OrderGroupFragment}amendableGroup{id changeSlotIterationsLeft cutOffTimestamp fulfillmentType deliveryAddress{fullName firstName lastName address{addressString addressLineOne addressLineTwo state postalCode city country}}isAmendInProgress}substitutionsBanner{heading subheading longSubheading}groups_2101{__typename...OrderGroupFragment...ODPGroupFragment...ODPPickupInfo...ODPTippingInfo}multiboxBundles{...orderLineItem}itemCancelReasons{__typename...cancelReason}groupCancelReasons{__typename...cancelReason}priceDetails{__typename subTotal{__typename...priceDetailFragment}taxTotal{__typename...priceDetailFragment}grandTotal{__typename...priceDetailFragment}authorizationAmount{__typename...priceDetailFragment}fees{__typename...priceDetailFragment}discounts{__typename...priceDetailFragment}minimumThreshold{__typename...price}belowMinimumFee{__typename...priceDetailFragment}driverTip{__typename...priceDetailFragment}donations{__typename...priceDetailFragment}}paymentMethods{__typename description cardType paymentType displayValues message{...textFragment}actions{connectToCapitalOne{...orderActionFragment}visitAffirm{...orderActionFragment}}}actions{__typename return pendingReturn cancel startReturn{...orderActionFragment}reorder}banners{...textFragment}}","variables":{"orderId":"2812227032975","emailAddress":"cncook09@aol.com"}}' \
  --compressed`
 
for (( i=0; i<=4; i++ ))
do
  if [[ $curl62 =~ "error"  || $curl62 =~ "blocked" ]]; then
    echo "Lỗi email số 62"
    indexOrder62=`echo error`
    break
  elif [[ `echo $curl62 | jq '.data.guestOrder.groups_2101['${i[@]}'].items[0].product.usItemId'` == '"514290555"' ]]; then
    indexOrder62=`echo $i`
    indexItem62=`echo 0`
  elif [[ `echo $curl62 | jq '.data.guestOrder.groups_2101['${i[@]}'].items[1].product.usItemId'` == '"514290555"' ]]; then
    indexOrder62=`echo $i`
    indexItem62=`echo 1`
  elif [[ `echo $curl62 | jq '.data.guestOrder.groups_2101['${i[@]}'].items[2].product.usItemId'` == '"514290555"' ]]; then
    indexOrder62=`echo $i`
    indexItem62=`echo 2`
  elif [[ `echo $curl62 | jq '.data.guestOrder.groups_2101['${i[@]}'].items[3].product.usItemId'` == '"514290555"' ]]; then
    indexOrder62=`echo $i`
    indexItem62=`echo 3`
  fi
done

if [[ $indexOrder62 != "error" ]]; then
echo $curl62 | jq '.data.guestOrder.id' >> track-OrderID.txt
echo $curl62 | jq '.data.guestOrder.customer.email' >> track-email.txt
echo $curl62 | jq '.data.guestOrder.groups_2101['$indexOrder62'].items['$indexItem62'].product.usItemId' >> track-usItemId.txt
echo $curl62 | jq '.data.guestOrder.groups_2101['$indexOrder62'].items['$indexItem62'].priceInfo.linePrice.value' >> track-priceValue.txt
echo $curl62 | jq '.data.guestOrder.groups_2101['$indexOrder62'].deliveryAddress.fullName' >> track-fullName.txt
echo $curl62 | jq '.data.guestOrder.groups_2101['$indexOrder62'].deliveryAddress.address.addressString' >> track-address.txt
echo $curl62 | jq '.data.guestOrder.groups_2101['$indexOrder62'].status.message.parts[].text' >> track-status.txt
echo $curl62 | jq '.data.guestOrder.groups_2101['$indexOrder62'].shipment.trackingNumber' >> track-number.txt
echo $curl62 | jq '.data.guestOrder.groups_2101['$indexOrder62'].shipment.trackingUrl' >> track-url.txt
fi

curl63=`curl 'https://www.walmart.com/orchestra/home/graphql' \
  -H 'authority: www.walmart.com' \
  -H 'sec-ch-ua: " Not A;Brand";v="99", "Chromium";v="96", "Microsoft Edge";v="96"' \
  -H 'x-o-platform: rweb' \
  -H 'dnt: 1' \
  -H 'x-o-correlation-id: wrvYiSFTlAmd8j7a8DDmpuyOpCN_heAnwM3v' \
  -H 'device_profile_ref_id: _s1F3NO8Y2JjaBUKPDcY4iFDWiIl9CyqiJjf' \
  -H 'x-latency-trace: 1' \
  -H 'wm_mp: true' \
  -H 'x-o-market: us' \
  -H 'x-o-platform-version: main-253-ebbb47' \
  -H 'x-o-gql-query: query getGuestOrder' \
  -H 'wm_page_url: https://www.walmart.com/orders' \
  -H 'x-apollo-operation-name: getGuestOrder' \
  -H 'sec-ch-ua-platform: "macOS"' \
  -H 'sec-ch-ua-mobile: ?0' \
  -H 'user-agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/96.0.4664.110 Safari/537.36 Edg/96.0.1054.62' \
  -H 'x-o-segment: oaoh' \
  -H 'content-type: application/json' \
  -H 'accept: application/json' \
  -H 'x-enable-server-timing: 1' \
  -H 'x-o-ccm: server' \
  -H 'wm_qos.correlation_id: wrvYiSFTlAmd8j7a8DDmpuyOpCN_heAnwM3v' \
  -H 'origin: https://www.walmart.com' \
  -H 'sec-fetch-site: same-origin' \
  -H 'sec-fetch-mode: cors' \
  -H 'sec-fetch-dest: empty' \
  -H 'referer: https://www.walmart.com/orders' \
  -H 'accept-language: vi' \
  --data-raw $'{"query":"query getGuestOrder($orderId:ID\u0021 $emailAddress:String\u0021){guestOrder(input:{id:$orderId emailAddress:$emailAddress}){...OrderFieldsFragment}}fragment cancelReason on OrderCancelReason{__typename subReasonCode subDescription}fragment priceDetailFragment on OrderPriceDetailRow{label value displayValue info{title message}rowInfo{...orderPriceDetailRowInfo}}fragment orderPriceDetailRowInfo on OrderPriceDetailRowInfo{title message{...textFragment}}fragment price on Price{displayValue value}fragment variants on MapEntry{name value}fragment OrderAddOn on OrderAddOn{lineId uniqueLineId productInfo{name usItemId offerId}quantityString quantityLabel type fulfillmentInstructions{...textFragment}actions{manageProtectionPlan{...orderActionFragment}cancel}priceInfo{linePrice{...price}}quantity isActive}fragment orderDonationDetails on OrderDonationDetails{message{...textFragment}emailReceipt emailReceiptToken status{...textFragment}errorStatus}fragment orderLineItem on OrderLineItem{id uniqueId actions{contactSeller cancel addToCart configureCake reviewItem resendEGiftCardToken protectionPlan{...orderActionFragment}manageProtectionPlan{...orderActionFragment}}isGift digitalDeliveryMessage quantity quantityString quantityLabel isSubstitutionSelected fulfilledItems{id quantityString priceInfo{itemPrice{value}}product{usItemId name}}isReturnable returnEligibilityMessage product{name usItemId imageInfo{thumbnailUrl}canonicalUrl offerId sellerId sellerName hasSellerBadge seller{sellerId name}orderLimit orderMinLimit weightIncrement salesUnit salesUnitType isSubstitutionEligible isAlcohol}reshop{reshopMessage isShippingAvailable minPromiseDate maxPromiseDate}selectedVariants{...variants}variantAdditionalInfo{parts{text nativeAction}}priceInfo{priceDisplayCodes{showItemPrice priceDisplayCondition finalCostByWeight}itemPrice{...price}linePrice{...price}unitPrice{...price}preDiscountedLinePrice{...price}additionalLines{name value}}discounts{label labelText{...textFragment}}itemReviewed activationCodes{label code}protectionPlanMessage{...textFragment}showSeller isShippedByWalmart seller{id name isPro}digitalDeliveryPhoneNumber addOns{...OrderAddOn}multiboxBundleId}fragment DriverFragment on Driver{id firstName photoUrl}fragment OrderGroupFragment on OrderGroup{driver{...DriverFragment}deliveryDate fulfillmentType status{...OrderGroupStatusFragment}showSeller isShippedByWalmart seller{...SellerFragment}id itemCount items{...LiteLineItemFragment}pickupPerson{firstName lastName email}accessPointId shipment{...ShipmentFragment}returnEligibilityMessage actions{...OrderGroupActionsFragment}recipientEmailAddress digitalDelivery{...DigitalDeliveryFragment}tireInstallationReservation{status extraText}}fragment OrderGroupStatusFragment on OrderGroupStatus{statusType showStatusTracker statusTracker{status label isCurrent}message{...textFragment}subtext subMessage{...textFragment}notice helpCenterText{...textFragment}}fragment textFragment on Text{parts{bold url text nativeAction lineBreak}}fragment LiteLineItemFragment on OrderLineItem{id quantity product{name usItemId imageInfo{thumbnailUrl}offerId isAlcohol}priceInfo{linePrice{...price}}}fragment SellerFragment on GroupSeller{id name isPro}fragment DigitalDeliveryFragment on DigitalDelivery{title name instructions{...textFragment}}fragment ShipmentFragment on Shipment{id trackingNumber isExternalTracking trackingUrl proofOfDelivery{photoUrl photoPreviewUrl showPreview}}fragment OrderGroupActionsFragment on OrderGroupActions{reorder edit track changeSlot checkin editDeliveryInstructions editPickupPerson editTip tip cancel enableTip{...orderActionFragment}enableEdit{...orderActionFragment}rescheduleTireInstall{...orderActionFragment}cancelTireInstall{...orderActionFragment}help viewCancellationDetails{...cancellationDetailsActionFragment}}fragment cancellationDetailsActionFragment on CancellationDetailsAction{label heading text{...textFragment}}fragment ODPGroupCategoryFragment on OrderCategory{type name subtext returnMessage substitutionsBanner{...textFragment}showExtendedSubstitutions actions{substitutions{message label type}nilPickReshop{message action{text url}}returnDetails viewCancellationDetails{...cancellationDetailsActionFragment}trackOnInHomeApp}banner{...textFragment}accordionState items{...orderLineItem}substitutions{...orderLineItem fulfilledItems{...orderLineItem}}returnInfo{...returnInfoFragment}}fragment ODPGroupFragment on OrderGroup{id fulfillmentType deliveryMessage deliveryAddress{fullName firstName lastName address{...addressFragment}}deliveryInstructions{text type typeText}deliveryPreferences{text{...textFragment}cta{...orderActionFragment}}editSubstitutionsCutOff status{statusType showStatusTracker message{...textFragment}notice helpCenterText{...textFragment}}itemCount isCategorized categories{...ODPGroupCategoryFragment}seller{id name isPro}shipment{id trackingNumber}actions{reorder edit track changeSlot checkin editDeliveryInstructions editPickupPerson tip cancel help enableTip{...orderActionFragment}enableEdit{...orderActionFragment}viewCancellationDetails{...cancellationDetailsActionFragment}enableInHome{...orderActionFragment}createGiftReceipt}cutOffTimestamp isEditSubstitutionsEligible isInHome giftDetails{recipientAddress{fullName}recipientEmail senderName giftMessage}donationDetails{...orderDonationDetails}}fragment returnInfoFragment on ReturnInfo{returnOrderId type refundPriceDetails{__typename...refundPriceDetailsFragment}refundMessage tierRefundMessage paymentMethods{__typename description cardType paymentType displayValues message{...textFragment}}actions{__typename generate scheduleOrModifyPickup{text url}reschedulePickup editPickupContact}shippingLabelUrl qrCodeImageUrl carriers{__typename id name}pickupCarrier pickupContact{nameAndAddress{fullName firstName lastName address{addressString city state postalCode addressLineOne addressLineTwo country}}phone}pickupConfirmationNumber bannerMessage{...textFragment}}fragment refundPriceDetailsFragment on RefundPriceDetails{subTotal{__typename...orderPriceDetailRowFragment}fees{__typename...orderPriceDetailRowFragment}discounts{__typename...orderPriceDetailRowFragment}taxTotal{__typename...orderPriceDetailRowFragment}grandTotal{__typename...orderPriceDetailRowFragment}}fragment orderPriceDetailRowFragment on OrderPriceDetailRow{label displayValue value info{__typename title message}}fragment addressFragment on OrderAddress{addressString addressLineOne addressLineTwo state postalCode city}fragment ODPPickupInfo on OrderGroup{pickupInstructions pickupPerson{...person}alternatePickupPerson{...person}store{id name address{...addressFragment}}}fragment person on OrderPickupPerson{firstName lastName email}fragment ODPTippingInfo on OrderGroup{addTipMessage{...textFragment}driver{...DriverFragment}tipping{min{...price}max{...price}suggested{...price}preselected}subtotal{...price}}fragment orderActionFragment on Action{text url}fragment orderCustomer on OrderCustomer{id firstName lastName email isGuest isEmailRegistered}fragment OrderFieldsFragment on Order{__typename id version type customer{...orderCustomer}displayId idBarcodeImageUrl(barWidth:3 barHeight:100) isFuelPurchase title shortTitle timezone tippableGroup{...OrderGroupFragment}amendableGroup{id changeSlotIterationsLeft cutOffTimestamp fulfillmentType deliveryAddress{fullName firstName lastName address{addressString addressLineOne addressLineTwo state postalCode city country}}isAmendInProgress}substitutionsBanner{heading subheading longSubheading}groups_2101{__typename...OrderGroupFragment...ODPGroupFragment...ODPPickupInfo...ODPTippingInfo}multiboxBundles{...orderLineItem}itemCancelReasons{__typename...cancelReason}groupCancelReasons{__typename...cancelReason}priceDetails{__typename subTotal{__typename...priceDetailFragment}taxTotal{__typename...priceDetailFragment}grandTotal{__typename...priceDetailFragment}authorizationAmount{__typename...priceDetailFragment}fees{__typename...priceDetailFragment}discounts{__typename...priceDetailFragment}minimumThreshold{__typename...price}belowMinimumFee{__typename...priceDetailFragment}driverTip{__typename...priceDetailFragment}donations{__typename...priceDetailFragment}}paymentMethods{__typename description cardType paymentType displayValues message{...textFragment}actions{connectToCapitalOne{...orderActionFragment}visitAffirm{...orderActionFragment}}}actions{__typename return pendingReturn cancel startReturn{...orderActionFragment}reorder}banners{...textFragment}}","variables":{"orderId":"2862239531740","emailAddress":"lindsayjohnsonhill@yahoo.com"}}' \
  --compressed`
 
for (( i=0; i<=4; i++ ))
do
  if [[ $curl63 =~ "error"  || $curl63 =~ "blocked" ]]; then
    echo "Lỗi email số 63"
    indexOrder63=`echo error`
    break
  elif [[ `echo $curl63 | jq '.data.guestOrder.groups_2101['${i[@]}'].items[0].product.usItemId'` == '"217281734"' ]]; then
    indexOrder63=`echo $i`
    indexItem63=`echo 0`
  elif [[ `echo $curl63 | jq '.data.guestOrder.groups_2101['${i[@]}'].items[1].product.usItemId'` == '"217281734"' ]]; then
    indexOrder63=`echo $i`
    indexItem63=`echo 1`
  elif [[ `echo $curl63 | jq '.data.guestOrder.groups_2101['${i[@]}'].items[2].product.usItemId'` == '"217281734"' ]]; then
    indexOrder63=`echo $i`
    indexItem63=`echo 2`
  elif [[ `echo $curl63 | jq '.data.guestOrder.groups_2101['${i[@]}'].items[3].product.usItemId'` == '"217281734"' ]]; then
    indexOrder63=`echo $i`
    indexItem63=`echo 3`
  fi
done

if [[ $indexOrder63 != "error" ]]; then
echo $curl63 | jq '.data.guestOrder.id' >> track-OrderID.txt
echo $curl63 | jq '.data.guestOrder.customer.email' >> track-email.txt
echo $curl63 | jq '.data.guestOrder.groups_2101['$indexOrder63'].items['$indexItem63'].product.usItemId' >> track-usItemId.txt
echo $curl63 | jq '.data.guestOrder.groups_2101['$indexOrder63'].items['$indexItem63'].priceInfo.linePrice.value' >> track-priceValue.txt
echo $curl63 | jq '.data.guestOrder.groups_2101['$indexOrder63'].deliveryAddress.fullName' >> track-fullName.txt
echo $curl63 | jq '.data.guestOrder.groups_2101['$indexOrder63'].deliveryAddress.address.addressString' >> track-address.txt
echo $curl63 | jq '.data.guestOrder.groups_2101['$indexOrder63'].status.message.parts[].text' >> track-status.txt
echo $curl63 | jq '.data.guestOrder.groups_2101['$indexOrder63'].shipment.trackingNumber' >> track-number.txt
echo $curl63 | jq '.data.guestOrder.groups_2101['$indexOrder63'].shipment.trackingUrl' >> track-url.txt
fi

curl64=`curl 'https://www.walmart.com/orchestra/home/graphql' \
  -H 'authority: www.walmart.com' \
  -H 'sec-ch-ua: " Not A;Brand";v="99", "Chromium";v="96", "Microsoft Edge";v="96"' \
  -H 'x-o-platform: rweb' \
  -H 'dnt: 1' \
  -H 'x-o-correlation-id: wrvYiSFTlAmd8j7a8DDmpuyOpCN_heAnwM3v' \
  -H 'device_profile_ref_id: _s1F3NO8Y2JjaBUKPDcY4iFDWiIl9CyqiJjf' \
  -H 'x-latency-trace: 1' \
  -H 'wm_mp: true' \
  -H 'x-o-market: us' \
  -H 'x-o-platform-version: main-253-ebbb47' \
  -H 'x-o-gql-query: query getGuestOrder' \
  -H 'wm_page_url: https://www.walmart.com/orders' \
  -H 'x-apollo-operation-name: getGuestOrder' \
  -H 'sec-ch-ua-platform: "macOS"' \
  -H 'sec-ch-ua-mobile: ?0' \
  -H 'user-agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/96.0.4664.110 Safari/537.36 Edg/96.0.1054.62' \
  -H 'x-o-segment: oaoh' \
  -H 'content-type: application/json' \
  -H 'accept: application/json' \
  -H 'x-enable-server-timing: 1' \
  -H 'x-o-ccm: server' \
  -H 'wm_qos.correlation_id: wrvYiSFTlAmd8j7a8DDmpuyOpCN_heAnwM3v' \
  -H 'origin: https://www.walmart.com' \
  -H 'sec-fetch-site: same-origin' \
  -H 'sec-fetch-mode: cors' \
  -H 'sec-fetch-dest: empty' \
  -H 'referer: https://www.walmart.com/orders' \
  -H 'accept-language: vi' \
  --data-raw $'{"query":"query getGuestOrder($orderId:ID\u0021 $emailAddress:String\u0021){guestOrder(input:{id:$orderId emailAddress:$emailAddress}){...OrderFieldsFragment}}fragment cancelReason on OrderCancelReason{__typename subReasonCode subDescription}fragment priceDetailFragment on OrderPriceDetailRow{label value displayValue info{title message}rowInfo{...orderPriceDetailRowInfo}}fragment orderPriceDetailRowInfo on OrderPriceDetailRowInfo{title message{...textFragment}}fragment price on Price{displayValue value}fragment variants on MapEntry{name value}fragment OrderAddOn on OrderAddOn{lineId uniqueLineId productInfo{name usItemId offerId}quantityString quantityLabel type fulfillmentInstructions{...textFragment}actions{manageProtectionPlan{...orderActionFragment}cancel}priceInfo{linePrice{...price}}quantity isActive}fragment orderDonationDetails on OrderDonationDetails{message{...textFragment}emailReceipt emailReceiptToken status{...textFragment}errorStatus}fragment orderLineItem on OrderLineItem{id uniqueId actions{contactSeller cancel addToCart configureCake reviewItem resendEGiftCardToken protectionPlan{...orderActionFragment}manageProtectionPlan{...orderActionFragment}}isGift digitalDeliveryMessage quantity quantityString quantityLabel isSubstitutionSelected fulfilledItems{id quantityString priceInfo{itemPrice{value}}product{usItemId name}}isReturnable returnEligibilityMessage product{name usItemId imageInfo{thumbnailUrl}canonicalUrl offerId sellerId sellerName hasSellerBadge seller{sellerId name}orderLimit orderMinLimit weightIncrement salesUnit salesUnitType isSubstitutionEligible isAlcohol}reshop{reshopMessage isShippingAvailable minPromiseDate maxPromiseDate}selectedVariants{...variants}variantAdditionalInfo{parts{text nativeAction}}priceInfo{priceDisplayCodes{showItemPrice priceDisplayCondition finalCostByWeight}itemPrice{...price}linePrice{...price}unitPrice{...price}preDiscountedLinePrice{...price}additionalLines{name value}}discounts{label labelText{...textFragment}}itemReviewed activationCodes{label code}protectionPlanMessage{...textFragment}showSeller isShippedByWalmart seller{id name isPro}digitalDeliveryPhoneNumber addOns{...OrderAddOn}multiboxBundleId}fragment DriverFragment on Driver{id firstName photoUrl}fragment OrderGroupFragment on OrderGroup{driver{...DriverFragment}deliveryDate fulfillmentType status{...OrderGroupStatusFragment}showSeller isShippedByWalmart seller{...SellerFragment}id itemCount items{...LiteLineItemFragment}pickupPerson{firstName lastName email}accessPointId shipment{...ShipmentFragment}returnEligibilityMessage actions{...OrderGroupActionsFragment}recipientEmailAddress digitalDelivery{...DigitalDeliveryFragment}tireInstallationReservation{status extraText}}fragment OrderGroupStatusFragment on OrderGroupStatus{statusType showStatusTracker statusTracker{status label isCurrent}message{...textFragment}subtext subMessage{...textFragment}notice helpCenterText{...textFragment}}fragment textFragment on Text{parts{bold url text nativeAction lineBreak}}fragment LiteLineItemFragment on OrderLineItem{id quantity product{name usItemId imageInfo{thumbnailUrl}offerId isAlcohol}priceInfo{linePrice{...price}}}fragment SellerFragment on GroupSeller{id name isPro}fragment DigitalDeliveryFragment on DigitalDelivery{title name instructions{...textFragment}}fragment ShipmentFragment on Shipment{id trackingNumber isExternalTracking trackingUrl proofOfDelivery{photoUrl photoPreviewUrl showPreview}}fragment OrderGroupActionsFragment on OrderGroupActions{reorder edit track changeSlot checkin editDeliveryInstructions editPickupPerson editTip tip cancel enableTip{...orderActionFragment}enableEdit{...orderActionFragment}rescheduleTireInstall{...orderActionFragment}cancelTireInstall{...orderActionFragment}help viewCancellationDetails{...cancellationDetailsActionFragment}}fragment cancellationDetailsActionFragment on CancellationDetailsAction{label heading text{...textFragment}}fragment ODPGroupCategoryFragment on OrderCategory{type name subtext returnMessage substitutionsBanner{...textFragment}showExtendedSubstitutions actions{substitutions{message label type}nilPickReshop{message action{text url}}returnDetails viewCancellationDetails{...cancellationDetailsActionFragment}trackOnInHomeApp}banner{...textFragment}accordionState items{...orderLineItem}substitutions{...orderLineItem fulfilledItems{...orderLineItem}}returnInfo{...returnInfoFragment}}fragment ODPGroupFragment on OrderGroup{id fulfillmentType deliveryMessage deliveryAddress{fullName firstName lastName address{...addressFragment}}deliveryInstructions{text type typeText}deliveryPreferences{text{...textFragment}cta{...orderActionFragment}}editSubstitutionsCutOff status{statusType showStatusTracker message{...textFragment}notice helpCenterText{...textFragment}}itemCount isCategorized categories{...ODPGroupCategoryFragment}seller{id name isPro}shipment{id trackingNumber}actions{reorder edit track changeSlot checkin editDeliveryInstructions editPickupPerson tip cancel help enableTip{...orderActionFragment}enableEdit{...orderActionFragment}viewCancellationDetails{...cancellationDetailsActionFragment}enableInHome{...orderActionFragment}createGiftReceipt}cutOffTimestamp isEditSubstitutionsEligible isInHome giftDetails{recipientAddress{fullName}recipientEmail senderName giftMessage}donationDetails{...orderDonationDetails}}fragment returnInfoFragment on ReturnInfo{returnOrderId type refundPriceDetails{__typename...refundPriceDetailsFragment}refundMessage tierRefundMessage paymentMethods{__typename description cardType paymentType displayValues message{...textFragment}}actions{__typename generate scheduleOrModifyPickup{text url}reschedulePickup editPickupContact}shippingLabelUrl qrCodeImageUrl carriers{__typename id name}pickupCarrier pickupContact{nameAndAddress{fullName firstName lastName address{addressString city state postalCode addressLineOne addressLineTwo country}}phone}pickupConfirmationNumber bannerMessage{...textFragment}}fragment refundPriceDetailsFragment on RefundPriceDetails{subTotal{__typename...orderPriceDetailRowFragment}fees{__typename...orderPriceDetailRowFragment}discounts{__typename...orderPriceDetailRowFragment}taxTotal{__typename...orderPriceDetailRowFragment}grandTotal{__typename...orderPriceDetailRowFragment}}fragment orderPriceDetailRowFragment on OrderPriceDetailRow{label displayValue value info{__typename title message}}fragment addressFragment on OrderAddress{addressString addressLineOne addressLineTwo state postalCode city}fragment ODPPickupInfo on OrderGroup{pickupInstructions pickupPerson{...person}alternatePickupPerson{...person}store{id name address{...addressFragment}}}fragment person on OrderPickupPerson{firstName lastName email}fragment ODPTippingInfo on OrderGroup{addTipMessage{...textFragment}driver{...DriverFragment}tipping{min{...price}max{...price}suggested{...price}preselected}subtotal{...price}}fragment orderActionFragment on Action{text url}fragment orderCustomer on OrderCustomer{id firstName lastName email isGuest isEmailRegistered}fragment OrderFieldsFragment on Order{__typename id version type customer{...orderCustomer}displayId idBarcodeImageUrl(barWidth:3 barHeight:100) isFuelPurchase title shortTitle timezone tippableGroup{...OrderGroupFragment}amendableGroup{id changeSlotIterationsLeft cutOffTimestamp fulfillmentType deliveryAddress{fullName firstName lastName address{addressString addressLineOne addressLineTwo state postalCode city country}}isAmendInProgress}substitutionsBanner{heading subheading longSubheading}groups_2101{__typename...OrderGroupFragment...ODPGroupFragment...ODPPickupInfo...ODPTippingInfo}multiboxBundles{...orderLineItem}itemCancelReasons{__typename...cancelReason}groupCancelReasons{__typename...cancelReason}priceDetails{__typename subTotal{__typename...priceDetailFragment}taxTotal{__typename...priceDetailFragment}grandTotal{__typename...priceDetailFragment}authorizationAmount{__typename...priceDetailFragment}fees{__typename...priceDetailFragment}discounts{__typename...priceDetailFragment}minimumThreshold{__typename...price}belowMinimumFee{__typename...priceDetailFragment}driverTip{__typename...priceDetailFragment}donations{__typename...priceDetailFragment}}paymentMethods{__typename description cardType paymentType displayValues message{...textFragment}actions{connectToCapitalOne{...orderActionFragment}visitAffirm{...orderActionFragment}}}actions{__typename return pendingReturn cancel startReturn{...orderActionFragment}reorder}banners{...textFragment}}","variables":{"orderId":"2862239008511","emailAddress":"abain1970@yahoo.com"}}' \
  --compressed`
 
for (( i=0; i<=4; i++ ))
do
  if [[ $curl64 =~ "error"  || $curl64 =~ "blocked" ]]; then
    echo "Lỗi email số 64"
    indexOrder64=`echo error`
    break
  elif [[ `echo $curl64 | jq '.data.guestOrder.groups_2101['${i[@]}'].items[0].product.usItemId'` == '"45465229"' ]]; then
    indexOrder64=`echo $i`
    indexItem64=`echo 0`
  elif [[ `echo $curl64 | jq '.data.guestOrder.groups_2101['${i[@]}'].items[1].product.usItemId'` == '"45465229"' ]]; then
    indexOrder64=`echo $i`
    indexItem64=`echo 1`
  elif [[ `echo $curl64 | jq '.data.guestOrder.groups_2101['${i[@]}'].items[2].product.usItemId'` == '"45465229"' ]]; then
    indexOrder64=`echo $i`
    indexItem64=`echo 2`
  elif [[ `echo $curl64 | jq '.data.guestOrder.groups_2101['${i[@]}'].items[3].product.usItemId'` == '"45465229"' ]]; then
    indexOrder64=`echo $i`
    indexItem64=`echo 3`
  fi
done

if [[ $indexOrder64 != "error" ]]; then
echo $curl64 | jq '.data.guestOrder.id' >> track-OrderID.txt
echo $curl64 | jq '.data.guestOrder.customer.email' >> track-email.txt
echo $curl64 | jq '.data.guestOrder.groups_2101['$indexOrder64'].items['$indexItem64'].product.usItemId' >> track-usItemId.txt
echo $curl64 | jq '.data.guestOrder.groups_2101['$indexOrder64'].items['$indexItem64'].priceInfo.linePrice.value' >> track-priceValue.txt
echo $curl64 | jq '.data.guestOrder.groups_2101['$indexOrder64'].deliveryAddress.fullName' >> track-fullName.txt
echo $curl64 | jq '.data.guestOrder.groups_2101['$indexOrder64'].deliveryAddress.address.addressString' >> track-address.txt
echo $curl64 | jq '.data.guestOrder.groups_2101['$indexOrder64'].status.message.parts[].text' >> track-status.txt
echo $curl64 | jq '.data.guestOrder.groups_2101['$indexOrder64'].shipment.trackingNumber' >> track-number.txt
echo $curl64 | jq '.data.guestOrder.groups_2101['$indexOrder64'].shipment.trackingUrl' >> track-url.txt
fi

curl65=`curl 'https://www.walmart.com/orchestra/home/graphql' \
  -H 'authority: www.walmart.com' \
  -H 'sec-ch-ua: " Not A;Brand";v="99", "Chromium";v="96", "Microsoft Edge";v="96"' \
  -H 'x-o-platform: rweb' \
  -H 'dnt: 1' \
  -H 'x-o-correlation-id: wrvYiSFTlAmd8j7a8DDmpuyOpCN_heAnwM3v' \
  -H 'device_profile_ref_id: _s1F3NO8Y2JjaBUKPDcY4iFDWiIl9CyqiJjf' \
  -H 'x-latency-trace: 1' \
  -H 'wm_mp: true' \
  -H 'x-o-market: us' \
  -H 'x-o-platform-version: main-253-ebbb47' \
  -H 'x-o-gql-query: query getGuestOrder' \
  -H 'wm_page_url: https://www.walmart.com/orders' \
  -H 'x-apollo-operation-name: getGuestOrder' \
  -H 'sec-ch-ua-platform: "macOS"' \
  -H 'sec-ch-ua-mobile: ?0' \
  -H 'user-agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/96.0.4664.110 Safari/537.36 Edg/96.0.1054.62' \
  -H 'x-o-segment: oaoh' \
  -H 'content-type: application/json' \
  -H 'accept: application/json' \
  -H 'x-enable-server-timing: 1' \
  -H 'x-o-ccm: server' \
  -H 'wm_qos.correlation_id: wrvYiSFTlAmd8j7a8DDmpuyOpCN_heAnwM3v' \
  -H 'origin: https://www.walmart.com' \
  -H 'sec-fetch-site: same-origin' \
  -H 'sec-fetch-mode: cors' \
  -H 'sec-fetch-dest: empty' \
  -H 'referer: https://www.walmart.com/orders' \
  -H 'accept-language: vi' \
  --data-raw $'{"query":"query getGuestOrder($orderId:ID\u0021 $emailAddress:String\u0021){guestOrder(input:{id:$orderId emailAddress:$emailAddress}){...OrderFieldsFragment}}fragment cancelReason on OrderCancelReason{__typename subReasonCode subDescription}fragment priceDetailFragment on OrderPriceDetailRow{label value displayValue info{title message}rowInfo{...orderPriceDetailRowInfo}}fragment orderPriceDetailRowInfo on OrderPriceDetailRowInfo{title message{...textFragment}}fragment price on Price{displayValue value}fragment variants on MapEntry{name value}fragment OrderAddOn on OrderAddOn{lineId uniqueLineId productInfo{name usItemId offerId}quantityString quantityLabel type fulfillmentInstructions{...textFragment}actions{manageProtectionPlan{...orderActionFragment}cancel}priceInfo{linePrice{...price}}quantity isActive}fragment orderDonationDetails on OrderDonationDetails{message{...textFragment}emailReceipt emailReceiptToken status{...textFragment}errorStatus}fragment orderLineItem on OrderLineItem{id uniqueId actions{contactSeller cancel addToCart configureCake reviewItem resendEGiftCardToken protectionPlan{...orderActionFragment}manageProtectionPlan{...orderActionFragment}}isGift digitalDeliveryMessage quantity quantityString quantityLabel isSubstitutionSelected fulfilledItems{id quantityString priceInfo{itemPrice{value}}product{usItemId name}}isReturnable returnEligibilityMessage product{name usItemId imageInfo{thumbnailUrl}canonicalUrl offerId sellerId sellerName hasSellerBadge seller{sellerId name}orderLimit orderMinLimit weightIncrement salesUnit salesUnitType isSubstitutionEligible isAlcohol}reshop{reshopMessage isShippingAvailable minPromiseDate maxPromiseDate}selectedVariants{...variants}variantAdditionalInfo{parts{text nativeAction}}priceInfo{priceDisplayCodes{showItemPrice priceDisplayCondition finalCostByWeight}itemPrice{...price}linePrice{...price}unitPrice{...price}preDiscountedLinePrice{...price}additionalLines{name value}}discounts{label labelText{...textFragment}}itemReviewed activationCodes{label code}protectionPlanMessage{...textFragment}showSeller isShippedByWalmart seller{id name isPro}digitalDeliveryPhoneNumber addOns{...OrderAddOn}multiboxBundleId}fragment DriverFragment on Driver{id firstName photoUrl}fragment OrderGroupFragment on OrderGroup{driver{...DriverFragment}deliveryDate fulfillmentType status{...OrderGroupStatusFragment}showSeller isShippedByWalmart seller{...SellerFragment}id itemCount items{...LiteLineItemFragment}pickupPerson{firstName lastName email}accessPointId shipment{...ShipmentFragment}returnEligibilityMessage actions{...OrderGroupActionsFragment}recipientEmailAddress digitalDelivery{...DigitalDeliveryFragment}tireInstallationReservation{status extraText}}fragment OrderGroupStatusFragment on OrderGroupStatus{statusType showStatusTracker statusTracker{status label isCurrent}message{...textFragment}subtext subMessage{...textFragment}notice helpCenterText{...textFragment}}fragment textFragment on Text{parts{bold url text nativeAction lineBreak}}fragment LiteLineItemFragment on OrderLineItem{id quantity product{name usItemId imageInfo{thumbnailUrl}offerId isAlcohol}priceInfo{linePrice{...price}}}fragment SellerFragment on GroupSeller{id name isPro}fragment DigitalDeliveryFragment on DigitalDelivery{title name instructions{...textFragment}}fragment ShipmentFragment on Shipment{id trackingNumber isExternalTracking trackingUrl proofOfDelivery{photoUrl photoPreviewUrl showPreview}}fragment OrderGroupActionsFragment on OrderGroupActions{reorder edit track changeSlot checkin editDeliveryInstructions editPickupPerson editTip tip cancel enableTip{...orderActionFragment}enableEdit{...orderActionFragment}rescheduleTireInstall{...orderActionFragment}cancelTireInstall{...orderActionFragment}help viewCancellationDetails{...cancellationDetailsActionFragment}}fragment cancellationDetailsActionFragment on CancellationDetailsAction{label heading text{...textFragment}}fragment ODPGroupCategoryFragment on OrderCategory{type name subtext returnMessage substitutionsBanner{...textFragment}showExtendedSubstitutions actions{substitutions{message label type}nilPickReshop{message action{text url}}returnDetails viewCancellationDetails{...cancellationDetailsActionFragment}trackOnInHomeApp}banner{...textFragment}accordionState items{...orderLineItem}substitutions{...orderLineItem fulfilledItems{...orderLineItem}}returnInfo{...returnInfoFragment}}fragment ODPGroupFragment on OrderGroup{id fulfillmentType deliveryMessage deliveryAddress{fullName firstName lastName address{...addressFragment}}deliveryInstructions{text type typeText}deliveryPreferences{text{...textFragment}cta{...orderActionFragment}}editSubstitutionsCutOff status{statusType showStatusTracker message{...textFragment}notice helpCenterText{...textFragment}}itemCount isCategorized categories{...ODPGroupCategoryFragment}seller{id name isPro}shipment{id trackingNumber}actions{reorder edit track changeSlot checkin editDeliveryInstructions editPickupPerson tip cancel help enableTip{...orderActionFragment}enableEdit{...orderActionFragment}viewCancellationDetails{...cancellationDetailsActionFragment}enableInHome{...orderActionFragment}createGiftReceipt}cutOffTimestamp isEditSubstitutionsEligible isInHome giftDetails{recipientAddress{fullName}recipientEmail senderName giftMessage}donationDetails{...orderDonationDetails}}fragment returnInfoFragment on ReturnInfo{returnOrderId type refundPriceDetails{__typename...refundPriceDetailsFragment}refundMessage tierRefundMessage paymentMethods{__typename description cardType paymentType displayValues message{...textFragment}}actions{__typename generate scheduleOrModifyPickup{text url}reschedulePickup editPickupContact}shippingLabelUrl qrCodeImageUrl carriers{__typename id name}pickupCarrier pickupContact{nameAndAddress{fullName firstName lastName address{addressString city state postalCode addressLineOne addressLineTwo country}}phone}pickupConfirmationNumber bannerMessage{...textFragment}}fragment refundPriceDetailsFragment on RefundPriceDetails{subTotal{__typename...orderPriceDetailRowFragment}fees{__typename...orderPriceDetailRowFragment}discounts{__typename...orderPriceDetailRowFragment}taxTotal{__typename...orderPriceDetailRowFragment}grandTotal{__typename...orderPriceDetailRowFragment}}fragment orderPriceDetailRowFragment on OrderPriceDetailRow{label displayValue value info{__typename title message}}fragment addressFragment on OrderAddress{addressString addressLineOne addressLineTwo state postalCode city}fragment ODPPickupInfo on OrderGroup{pickupInstructions pickupPerson{...person}alternatePickupPerson{...person}store{id name address{...addressFragment}}}fragment person on OrderPickupPerson{firstName lastName email}fragment ODPTippingInfo on OrderGroup{addTipMessage{...textFragment}driver{...DriverFragment}tipping{min{...price}max{...price}suggested{...price}preselected}subtotal{...price}}fragment orderActionFragment on Action{text url}fragment orderCustomer on OrderCustomer{id firstName lastName email isGuest isEmailRegistered}fragment OrderFieldsFragment on Order{__typename id version type customer{...orderCustomer}displayId idBarcodeImageUrl(barWidth:3 barHeight:100) isFuelPurchase title shortTitle timezone tippableGroup{...OrderGroupFragment}amendableGroup{id changeSlotIterationsLeft cutOffTimestamp fulfillmentType deliveryAddress{fullName firstName lastName address{addressString addressLineOne addressLineTwo state postalCode city country}}isAmendInProgress}substitutionsBanner{heading subheading longSubheading}groups_2101{__typename...OrderGroupFragment...ODPGroupFragment...ODPPickupInfo...ODPTippingInfo}multiboxBundles{...orderLineItem}itemCancelReasons{__typename...cancelReason}groupCancelReasons{__typename...cancelReason}priceDetails{__typename subTotal{__typename...priceDetailFragment}taxTotal{__typename...priceDetailFragment}grandTotal{__typename...priceDetailFragment}authorizationAmount{__typename...priceDetailFragment}fees{__typename...priceDetailFragment}discounts{__typename...priceDetailFragment}minimumThreshold{__typename...price}belowMinimumFee{__typename...priceDetailFragment}driverTip{__typename...priceDetailFragment}donations{__typename...priceDetailFragment}}paymentMethods{__typename description cardType paymentType displayValues message{...textFragment}actions{connectToCapitalOne{...orderActionFragment}visitAffirm{...orderActionFragment}}}actions{__typename return pendingReturn cancel startReturn{...orderActionFragment}reorder}banners{...textFragment}}","variables":{"orderId":"2862239424323","emailAddress":"abain1970@yahoo.com"}}' \
  --compressed`
 
for (( i=0; i<=4; i++ ))
do
  if [[ $curl65 =~ "error"  || $curl65 =~ "blocked" ]]; then
    echo "Lỗi email số 65"
    indexOrder65=`echo error`
    break
  elif [[ `echo $curl65 | jq '.data.guestOrder.groups_2101['${i[@]}'].items[0].product.usItemId'` == '"251382558"' ]]; then
    indexOrder65=`echo $i`
    indexItem65=`echo 0`
  elif [[ `echo $curl65 | jq '.data.guestOrder.groups_2101['${i[@]}'].items[1].product.usItemId'` == '"251382558"' ]]; then
    indexOrder65=`echo $i`
    indexItem65=`echo 1`
  elif [[ `echo $curl65 | jq '.data.guestOrder.groups_2101['${i[@]}'].items[2].product.usItemId'` == '"251382558"' ]]; then
    indexOrder65=`echo $i`
    indexItem65=`echo 2`
  elif [[ `echo $curl65 | jq '.data.guestOrder.groups_2101['${i[@]}'].items[3].product.usItemId'` == '"251382558"' ]]; then
    indexOrder65=`echo $i`
    indexItem65=`echo 3`
  fi
done

if [[ $indexOrder65 != "error" ]]; then
echo $curl65 | jq '.data.guestOrder.id' >> track-OrderID.txt
echo $curl65 | jq '.data.guestOrder.customer.email' >> track-email.txt
echo $curl65 | jq '.data.guestOrder.groups_2101['$indexOrder65'].items['$indexItem65'].product.usItemId' >> track-usItemId.txt
echo $curl65 | jq '.data.guestOrder.groups_2101['$indexOrder65'].items['$indexItem65'].priceInfo.linePrice.value' >> track-priceValue.txt
echo $curl65 | jq '.data.guestOrder.groups_2101['$indexOrder65'].deliveryAddress.fullName' >> track-fullName.txt
echo $curl65 | jq '.data.guestOrder.groups_2101['$indexOrder65'].deliveryAddress.address.addressString' >> track-address.txt
echo $curl65 | jq '.data.guestOrder.groups_2101['$indexOrder65'].status.message.parts[].text' >> track-status.txt
echo $curl65 | jq '.data.guestOrder.groups_2101['$indexOrder65'].shipment.trackingNumber' >> track-number.txt
echo $curl65 | jq '.data.guestOrder.groups_2101['$indexOrder65'].shipment.trackingUrl' >> track-url.txt
fi

curl66=`curl 'https://www.walmart.com/orchestra/home/graphql' \
  -H 'authority: www.walmart.com' \
  -H 'sec-ch-ua: " Not A;Brand";v="99", "Chromium";v="96", "Microsoft Edge";v="96"' \
  -H 'x-o-platform: rweb' \
  -H 'dnt: 1' \
  -H 'x-o-correlation-id: wrvYiSFTlAmd8j7a8DDmpuyOpCN_heAnwM3v' \
  -H 'device_profile_ref_id: _s1F3NO8Y2JjaBUKPDcY4iFDWiIl9CyqiJjf' \
  -H 'x-latency-trace: 1' \
  -H 'wm_mp: true' \
  -H 'x-o-market: us' \
  -H 'x-o-platform-version: main-253-ebbb47' \
  -H 'x-o-gql-query: query getGuestOrder' \
  -H 'wm_page_url: https://www.walmart.com/orders' \
  -H 'x-apollo-operation-name: getGuestOrder' \
  -H 'sec-ch-ua-platform: "macOS"' \
  -H 'sec-ch-ua-mobile: ?0' \
  -H 'user-agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/96.0.4664.110 Safari/537.36 Edg/96.0.1054.62' \
  -H 'x-o-segment: oaoh' \
  -H 'content-type: application/json' \
  -H 'accept: application/json' \
  -H 'x-enable-server-timing: 1' \
  -H 'x-o-ccm: server' \
  -H 'wm_qos.correlation_id: wrvYiSFTlAmd8j7a8DDmpuyOpCN_heAnwM3v' \
  -H 'origin: https://www.walmart.com' \
  -H 'sec-fetch-site: same-origin' \
  -H 'sec-fetch-mode: cors' \
  -H 'sec-fetch-dest: empty' \
  -H 'referer: https://www.walmart.com/orders' \
  -H 'accept-language: vi' \
  --data-raw $'{"query":"query getGuestOrder($orderId:ID\u0021 $emailAddress:String\u0021){guestOrder(input:{id:$orderId emailAddress:$emailAddress}){...OrderFieldsFragment}}fragment cancelReason on OrderCancelReason{__typename subReasonCode subDescription}fragment priceDetailFragment on OrderPriceDetailRow{label value displayValue info{title message}rowInfo{...orderPriceDetailRowInfo}}fragment orderPriceDetailRowInfo on OrderPriceDetailRowInfo{title message{...textFragment}}fragment price on Price{displayValue value}fragment variants on MapEntry{name value}fragment OrderAddOn on OrderAddOn{lineId uniqueLineId productInfo{name usItemId offerId}quantityString quantityLabel type fulfillmentInstructions{...textFragment}actions{manageProtectionPlan{...orderActionFragment}cancel}priceInfo{linePrice{...price}}quantity isActive}fragment orderDonationDetails on OrderDonationDetails{message{...textFragment}emailReceipt emailReceiptToken status{...textFragment}errorStatus}fragment orderLineItem on OrderLineItem{id uniqueId actions{contactSeller cancel addToCart configureCake reviewItem resendEGiftCardToken protectionPlan{...orderActionFragment}manageProtectionPlan{...orderActionFragment}}isGift digitalDeliveryMessage quantity quantityString quantityLabel isSubstitutionSelected fulfilledItems{id quantityString priceInfo{itemPrice{value}}product{usItemId name}}isReturnable returnEligibilityMessage product{name usItemId imageInfo{thumbnailUrl}canonicalUrl offerId sellerId sellerName hasSellerBadge seller{sellerId name}orderLimit orderMinLimit weightIncrement salesUnit salesUnitType isSubstitutionEligible isAlcohol}reshop{reshopMessage isShippingAvailable minPromiseDate maxPromiseDate}selectedVariants{...variants}variantAdditionalInfo{parts{text nativeAction}}priceInfo{priceDisplayCodes{showItemPrice priceDisplayCondition finalCostByWeight}itemPrice{...price}linePrice{...price}unitPrice{...price}preDiscountedLinePrice{...price}additionalLines{name value}}discounts{label labelText{...textFragment}}itemReviewed activationCodes{label code}protectionPlanMessage{...textFragment}showSeller isShippedByWalmart seller{id name isPro}digitalDeliveryPhoneNumber addOns{...OrderAddOn}multiboxBundleId}fragment DriverFragment on Driver{id firstName photoUrl}fragment OrderGroupFragment on OrderGroup{driver{...DriverFragment}deliveryDate fulfillmentType status{...OrderGroupStatusFragment}showSeller isShippedByWalmart seller{...SellerFragment}id itemCount items{...LiteLineItemFragment}pickupPerson{firstName lastName email}accessPointId shipment{...ShipmentFragment}returnEligibilityMessage actions{...OrderGroupActionsFragment}recipientEmailAddress digitalDelivery{...DigitalDeliveryFragment}tireInstallationReservation{status extraText}}fragment OrderGroupStatusFragment on OrderGroupStatus{statusType showStatusTracker statusTracker{status label isCurrent}message{...textFragment}subtext subMessage{...textFragment}notice helpCenterText{...textFragment}}fragment textFragment on Text{parts{bold url text nativeAction lineBreak}}fragment LiteLineItemFragment on OrderLineItem{id quantity product{name usItemId imageInfo{thumbnailUrl}offerId isAlcohol}priceInfo{linePrice{...price}}}fragment SellerFragment on GroupSeller{id name isPro}fragment DigitalDeliveryFragment on DigitalDelivery{title name instructions{...textFragment}}fragment ShipmentFragment on Shipment{id trackingNumber isExternalTracking trackingUrl proofOfDelivery{photoUrl photoPreviewUrl showPreview}}fragment OrderGroupActionsFragment on OrderGroupActions{reorder edit track changeSlot checkin editDeliveryInstructions editPickupPerson editTip tip cancel enableTip{...orderActionFragment}enableEdit{...orderActionFragment}rescheduleTireInstall{...orderActionFragment}cancelTireInstall{...orderActionFragment}help viewCancellationDetails{...cancellationDetailsActionFragment}}fragment cancellationDetailsActionFragment on CancellationDetailsAction{label heading text{...textFragment}}fragment ODPGroupCategoryFragment on OrderCategory{type name subtext returnMessage substitutionsBanner{...textFragment}showExtendedSubstitutions actions{substitutions{message label type}nilPickReshop{message action{text url}}returnDetails viewCancellationDetails{...cancellationDetailsActionFragment}trackOnInHomeApp}banner{...textFragment}accordionState items{...orderLineItem}substitutions{...orderLineItem fulfilledItems{...orderLineItem}}returnInfo{...returnInfoFragment}}fragment ODPGroupFragment on OrderGroup{id fulfillmentType deliveryMessage deliveryAddress{fullName firstName lastName address{...addressFragment}}deliveryInstructions{text type typeText}deliveryPreferences{text{...textFragment}cta{...orderActionFragment}}editSubstitutionsCutOff status{statusType showStatusTracker message{...textFragment}notice helpCenterText{...textFragment}}itemCount isCategorized categories{...ODPGroupCategoryFragment}seller{id name isPro}shipment{id trackingNumber}actions{reorder edit track changeSlot checkin editDeliveryInstructions editPickupPerson tip cancel help enableTip{...orderActionFragment}enableEdit{...orderActionFragment}viewCancellationDetails{...cancellationDetailsActionFragment}enableInHome{...orderActionFragment}createGiftReceipt}cutOffTimestamp isEditSubstitutionsEligible isInHome giftDetails{recipientAddress{fullName}recipientEmail senderName giftMessage}donationDetails{...orderDonationDetails}}fragment returnInfoFragment on ReturnInfo{returnOrderId type refundPriceDetails{__typename...refundPriceDetailsFragment}refundMessage tierRefundMessage paymentMethods{__typename description cardType paymentType displayValues message{...textFragment}}actions{__typename generate scheduleOrModifyPickup{text url}reschedulePickup editPickupContact}shippingLabelUrl qrCodeImageUrl carriers{__typename id name}pickupCarrier pickupContact{nameAndAddress{fullName firstName lastName address{addressString city state postalCode addressLineOne addressLineTwo country}}phone}pickupConfirmationNumber bannerMessage{...textFragment}}fragment refundPriceDetailsFragment on RefundPriceDetails{subTotal{__typename...orderPriceDetailRowFragment}fees{__typename...orderPriceDetailRowFragment}discounts{__typename...orderPriceDetailRowFragment}taxTotal{__typename...orderPriceDetailRowFragment}grandTotal{__typename...orderPriceDetailRowFragment}}fragment orderPriceDetailRowFragment on OrderPriceDetailRow{label displayValue value info{__typename title message}}fragment addressFragment on OrderAddress{addressString addressLineOne addressLineTwo state postalCode city}fragment ODPPickupInfo on OrderGroup{pickupInstructions pickupPerson{...person}alternatePickupPerson{...person}store{id name address{...addressFragment}}}fragment person on OrderPickupPerson{firstName lastName email}fragment ODPTippingInfo on OrderGroup{addTipMessage{...textFragment}driver{...DriverFragment}tipping{min{...price}max{...price}suggested{...price}preselected}subtotal{...price}}fragment orderActionFragment on Action{text url}fragment orderCustomer on OrderCustomer{id firstName lastName email isGuest isEmailRegistered}fragment OrderFieldsFragment on Order{__typename id version type customer{...orderCustomer}displayId idBarcodeImageUrl(barWidth:3 barHeight:100) isFuelPurchase title shortTitle timezone tippableGroup{...OrderGroupFragment}amendableGroup{id changeSlotIterationsLeft cutOffTimestamp fulfillmentType deliveryAddress{fullName firstName lastName address{addressString addressLineOne addressLineTwo state postalCode city country}}isAmendInProgress}substitutionsBanner{heading subheading longSubheading}groups_2101{__typename...OrderGroupFragment...ODPGroupFragment...ODPPickupInfo...ODPTippingInfo}multiboxBundles{...orderLineItem}itemCancelReasons{__typename...cancelReason}groupCancelReasons{__typename...cancelReason}priceDetails{__typename subTotal{__typename...priceDetailFragment}taxTotal{__typename...priceDetailFragment}grandTotal{__typename...priceDetailFragment}authorizationAmount{__typename...priceDetailFragment}fees{__typename...priceDetailFragment}discounts{__typename...priceDetailFragment}minimumThreshold{__typename...price}belowMinimumFee{__typename...priceDetailFragment}driverTip{__typename...priceDetailFragment}donations{__typename...priceDetailFragment}}paymentMethods{__typename description cardType paymentType displayValues message{...textFragment}actions{connectToCapitalOne{...orderActionFragment}visitAffirm{...orderActionFragment}}}actions{__typename return pendingReturn cancel startReturn{...orderActionFragment}reorder}banners{...textFragment}}","variables":{"orderId":"2832232239457","emailAddress":"all4muttz@yahoo.com"}}' \
  --compressed`
 
for (( i=0; i<=4; i++ ))
do
  if [[ $curl66 =~ "error"  || $curl66 =~ "blocked" ]]; then
    echo "Lỗi email số 66"
    indexOrder66=`echo error`
    break
  elif [[ `echo $curl66 | jq '.data.guestOrder.groups_2101['${i[@]}'].items[0].product.usItemId'` == '"50753947"' ]]; then
    indexOrder66=`echo $i`
    indexItem66=`echo 0`
  elif [[ `echo $curl66 | jq '.data.guestOrder.groups_2101['${i[@]}'].items[1].product.usItemId'` == '"50753947"' ]]; then
    indexOrder66=`echo $i`
    indexItem66=`echo 1`
  elif [[ `echo $curl66 | jq '.data.guestOrder.groups_2101['${i[@]}'].items[2].product.usItemId'` == '"50753947"' ]]; then
    indexOrder66=`echo $i`
    indexItem66=`echo 2`
  elif [[ `echo $curl66 | jq '.data.guestOrder.groups_2101['${i[@]}'].items[3].product.usItemId'` == '"50753947"' ]]; then
    indexOrder66=`echo $i`
    indexItem66=`echo 3`
  fi
done

if [[ $indexOrder66 != "error" ]]; then
echo $curl66 | jq '.data.guestOrder.id' >> track-OrderID.txt
echo $curl66 | jq '.data.guestOrder.customer.email' >> track-email.txt
echo $curl66 | jq '.data.guestOrder.groups_2101['$indexOrder66'].items['$indexItem66'].product.usItemId' >> track-usItemId.txt
echo $curl66 | jq '.data.guestOrder.groups_2101['$indexOrder66'].items['$indexItem66'].priceInfo.linePrice.value' >> track-priceValue.txt
echo $curl66 | jq '.data.guestOrder.groups_2101['$indexOrder66'].deliveryAddress.fullName' >> track-fullName.txt
echo $curl66 | jq '.data.guestOrder.groups_2101['$indexOrder66'].deliveryAddress.address.addressString' >> track-address.txt
echo $curl66 | jq '.data.guestOrder.groups_2101['$indexOrder66'].status.message.parts[].text' >> track-status.txt
echo $curl66 | jq '.data.guestOrder.groups_2101['$indexOrder66'].shipment.trackingNumber' >> track-number.txt
echo $curl66 | jq '.data.guestOrder.groups_2101['$indexOrder66'].shipment.trackingUrl' >> track-url.txt
fi

curl67=`curl 'https://www.walmart.com/orchestra/home/graphql' \
  -H 'authority: www.walmart.com' \
  -H 'sec-ch-ua: " Not A;Brand";v="99", "Chromium";v="96", "Microsoft Edge";v="96"' \
  -H 'x-o-platform: rweb' \
  -H 'dnt: 1' \
  -H 'x-o-correlation-id: wrvYiSFTlAmd8j7a8DDmpuyOpCN_heAnwM3v' \
  -H 'device_profile_ref_id: _s1F3NO8Y2JjaBUKPDcY4iFDWiIl9CyqiJjf' \
  -H 'x-latency-trace: 1' \
  -H 'wm_mp: true' \
  -H 'x-o-market: us' \
  -H 'x-o-platform-version: main-253-ebbb47' \
  -H 'x-o-gql-query: query getGuestOrder' \
  -H 'wm_page_url: https://www.walmart.com/orders' \
  -H 'x-apollo-operation-name: getGuestOrder' \
  -H 'sec-ch-ua-platform: "macOS"' \
  -H 'sec-ch-ua-mobile: ?0' \
  -H 'user-agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/96.0.4664.110 Safari/537.36 Edg/96.0.1054.62' \
  -H 'x-o-segment: oaoh' \
  -H 'content-type: application/json' \
  -H 'accept: application/json' \
  -H 'x-enable-server-timing: 1' \
  -H 'x-o-ccm: server' \
  -H 'wm_qos.correlation_id: wrvYiSFTlAmd8j7a8DDmpuyOpCN_heAnwM3v' \
  -H 'origin: https://www.walmart.com' \
  -H 'sec-fetch-site: same-origin' \
  -H 'sec-fetch-mode: cors' \
  -H 'sec-fetch-dest: empty' \
  -H 'referer: https://www.walmart.com/orders' \
  -H 'accept-language: vi' \
  --data-raw $'{"query":"query getGuestOrder($orderId:ID\u0021 $emailAddress:String\u0021){guestOrder(input:{id:$orderId emailAddress:$emailAddress}){...OrderFieldsFragment}}fragment cancelReason on OrderCancelReason{__typename subReasonCode subDescription}fragment priceDetailFragment on OrderPriceDetailRow{label value displayValue info{title message}rowInfo{...orderPriceDetailRowInfo}}fragment orderPriceDetailRowInfo on OrderPriceDetailRowInfo{title message{...textFragment}}fragment price on Price{displayValue value}fragment variants on MapEntry{name value}fragment OrderAddOn on OrderAddOn{lineId uniqueLineId productInfo{name usItemId offerId}quantityString quantityLabel type fulfillmentInstructions{...textFragment}actions{manageProtectionPlan{...orderActionFragment}cancel}priceInfo{linePrice{...price}}quantity isActive}fragment orderDonationDetails on OrderDonationDetails{message{...textFragment}emailReceipt emailReceiptToken status{...textFragment}errorStatus}fragment orderLineItem on OrderLineItem{id uniqueId actions{contactSeller cancel addToCart configureCake reviewItem resendEGiftCardToken protectionPlan{...orderActionFragment}manageProtectionPlan{...orderActionFragment}}isGift digitalDeliveryMessage quantity quantityString quantityLabel isSubstitutionSelected fulfilledItems{id quantityString priceInfo{itemPrice{value}}product{usItemId name}}isReturnable returnEligibilityMessage product{name usItemId imageInfo{thumbnailUrl}canonicalUrl offerId sellerId sellerName hasSellerBadge seller{sellerId name}orderLimit orderMinLimit weightIncrement salesUnit salesUnitType isSubstitutionEligible isAlcohol}reshop{reshopMessage isShippingAvailable minPromiseDate maxPromiseDate}selectedVariants{...variants}variantAdditionalInfo{parts{text nativeAction}}priceInfo{priceDisplayCodes{showItemPrice priceDisplayCondition finalCostByWeight}itemPrice{...price}linePrice{...price}unitPrice{...price}preDiscountedLinePrice{...price}additionalLines{name value}}discounts{label labelText{...textFragment}}itemReviewed activationCodes{label code}protectionPlanMessage{...textFragment}showSeller isShippedByWalmart seller{id name isPro}digitalDeliveryPhoneNumber addOns{...OrderAddOn}multiboxBundleId}fragment DriverFragment on Driver{id firstName photoUrl}fragment OrderGroupFragment on OrderGroup{driver{...DriverFragment}deliveryDate fulfillmentType status{...OrderGroupStatusFragment}showSeller isShippedByWalmart seller{...SellerFragment}id itemCount items{...LiteLineItemFragment}pickupPerson{firstName lastName email}accessPointId shipment{...ShipmentFragment}returnEligibilityMessage actions{...OrderGroupActionsFragment}recipientEmailAddress digitalDelivery{...DigitalDeliveryFragment}tireInstallationReservation{status extraText}}fragment OrderGroupStatusFragment on OrderGroupStatus{statusType showStatusTracker statusTracker{status label isCurrent}message{...textFragment}subtext subMessage{...textFragment}notice helpCenterText{...textFragment}}fragment textFragment on Text{parts{bold url text nativeAction lineBreak}}fragment LiteLineItemFragment on OrderLineItem{id quantity product{name usItemId imageInfo{thumbnailUrl}offerId isAlcohol}priceInfo{linePrice{...price}}}fragment SellerFragment on GroupSeller{id name isPro}fragment DigitalDeliveryFragment on DigitalDelivery{title name instructions{...textFragment}}fragment ShipmentFragment on Shipment{id trackingNumber isExternalTracking trackingUrl proofOfDelivery{photoUrl photoPreviewUrl showPreview}}fragment OrderGroupActionsFragment on OrderGroupActions{reorder edit track changeSlot checkin editDeliveryInstructions editPickupPerson editTip tip cancel enableTip{...orderActionFragment}enableEdit{...orderActionFragment}rescheduleTireInstall{...orderActionFragment}cancelTireInstall{...orderActionFragment}help viewCancellationDetails{...cancellationDetailsActionFragment}}fragment cancellationDetailsActionFragment on CancellationDetailsAction{label heading text{...textFragment}}fragment ODPGroupCategoryFragment on OrderCategory{type name subtext returnMessage substitutionsBanner{...textFragment}showExtendedSubstitutions actions{substitutions{message label type}nilPickReshop{message action{text url}}returnDetails viewCancellationDetails{...cancellationDetailsActionFragment}trackOnInHomeApp}banner{...textFragment}accordionState items{...orderLineItem}substitutions{...orderLineItem fulfilledItems{...orderLineItem}}returnInfo{...returnInfoFragment}}fragment ODPGroupFragment on OrderGroup{id fulfillmentType deliveryMessage deliveryAddress{fullName firstName lastName address{...addressFragment}}deliveryInstructions{text type typeText}deliveryPreferences{text{...textFragment}cta{...orderActionFragment}}editSubstitutionsCutOff status{statusType showStatusTracker message{...textFragment}notice helpCenterText{...textFragment}}itemCount isCategorized categories{...ODPGroupCategoryFragment}seller{id name isPro}shipment{id trackingNumber}actions{reorder edit track changeSlot checkin editDeliveryInstructions editPickupPerson tip cancel help enableTip{...orderActionFragment}enableEdit{...orderActionFragment}viewCancellationDetails{...cancellationDetailsActionFragment}enableInHome{...orderActionFragment}createGiftReceipt}cutOffTimestamp isEditSubstitutionsEligible isInHome giftDetails{recipientAddress{fullName}recipientEmail senderName giftMessage}donationDetails{...orderDonationDetails}}fragment returnInfoFragment on ReturnInfo{returnOrderId type refundPriceDetails{__typename...refundPriceDetailsFragment}refundMessage tierRefundMessage paymentMethods{__typename description cardType paymentType displayValues message{...textFragment}}actions{__typename generate scheduleOrModifyPickup{text url}reschedulePickup editPickupContact}shippingLabelUrl qrCodeImageUrl carriers{__typename id name}pickupCarrier pickupContact{nameAndAddress{fullName firstName lastName address{addressString city state postalCode addressLineOne addressLineTwo country}}phone}pickupConfirmationNumber bannerMessage{...textFragment}}fragment refundPriceDetailsFragment on RefundPriceDetails{subTotal{__typename...orderPriceDetailRowFragment}fees{__typename...orderPriceDetailRowFragment}discounts{__typename...orderPriceDetailRowFragment}taxTotal{__typename...orderPriceDetailRowFragment}grandTotal{__typename...orderPriceDetailRowFragment}}fragment orderPriceDetailRowFragment on OrderPriceDetailRow{label displayValue value info{__typename title message}}fragment addressFragment on OrderAddress{addressString addressLineOne addressLineTwo state postalCode city}fragment ODPPickupInfo on OrderGroup{pickupInstructions pickupPerson{...person}alternatePickupPerson{...person}store{id name address{...addressFragment}}}fragment person on OrderPickupPerson{firstName lastName email}fragment ODPTippingInfo on OrderGroup{addTipMessage{...textFragment}driver{...DriverFragment}tipping{min{...price}max{...price}suggested{...price}preselected}subtotal{...price}}fragment orderActionFragment on Action{text url}fragment orderCustomer on OrderCustomer{id firstName lastName email isGuest isEmailRegistered}fragment OrderFieldsFragment on Order{__typename id version type customer{...orderCustomer}displayId idBarcodeImageUrl(barWidth:3 barHeight:100) isFuelPurchase title shortTitle timezone tippableGroup{...OrderGroupFragment}amendableGroup{id changeSlotIterationsLeft cutOffTimestamp fulfillmentType deliveryAddress{fullName firstName lastName address{addressString addressLineOne addressLineTwo state postalCode city country}}isAmendInProgress}substitutionsBanner{heading subheading longSubheading}groups_2101{__typename...OrderGroupFragment...ODPGroupFragment...ODPPickupInfo...ODPTippingInfo}multiboxBundles{...orderLineItem}itemCancelReasons{__typename...cancelReason}groupCancelReasons{__typename...cancelReason}priceDetails{__typename subTotal{__typename...priceDetailFragment}taxTotal{__typename...priceDetailFragment}grandTotal{__typename...priceDetailFragment}authorizationAmount{__typename...priceDetailFragment}fees{__typename...priceDetailFragment}discounts{__typename...priceDetailFragment}minimumThreshold{__typename...price}belowMinimumFee{__typename...priceDetailFragment}driverTip{__typename...priceDetailFragment}donations{__typename...priceDetailFragment}}paymentMethods{__typename description cardType paymentType displayValues message{...textFragment}actions{connectToCapitalOne{...orderActionFragment}visitAffirm{...orderActionFragment}}}actions{__typename return pendingReturn cancel startReturn{...orderActionFragment}reorder}banners{...textFragment}}","variables":{"orderId":"2832232741742","emailAddress":"shortyp_72@yahoo.com"}}' \
  --compressed`
 
for (( i=0; i<=4; i++ ))
do
  if [[ $curl67 =~ "error"  || $curl67 =~ "blocked" ]]; then
    echo "Lỗi email số 67"
    indexOrder67=`echo error`
    break
  elif [[ `echo $curl67 | jq '.data.guestOrder.groups_2101['${i[@]}'].items[0].product.usItemId'` == '"337077643"' ]]; then
    indexOrder67=`echo $i`
    indexItem67=`echo 0`
  elif [[ `echo $curl67 | jq '.data.guestOrder.groups_2101['${i[@]}'].items[1].product.usItemId'` == '"337077643"' ]]; then
    indexOrder67=`echo $i`
    indexItem67=`echo 1`
  elif [[ `echo $curl67 | jq '.data.guestOrder.groups_2101['${i[@]}'].items[2].product.usItemId'` == '"337077643"' ]]; then
    indexOrder67=`echo $i`
    indexItem67=`echo 2`
  elif [[ `echo $curl67 | jq '.data.guestOrder.groups_2101['${i[@]}'].items[3].product.usItemId'` == '"337077643"' ]]; then
    indexOrder67=`echo $i`
    indexItem67=`echo 3`
  fi
done

if [[ $indexOrder67 != "error" ]]; then
echo $curl67 | jq '.data.guestOrder.id' >> track-OrderID.txt
echo $curl67 | jq '.data.guestOrder.customer.email' >> track-email.txt
echo $curl67 | jq '.data.guestOrder.groups_2101['$indexOrder67'].items['$indexItem67'].product.usItemId' >> track-usItemId.txt
echo $curl67 | jq '.data.guestOrder.groups_2101['$indexOrder67'].items['$indexItem67'].priceInfo.linePrice.value' >> track-priceValue.txt
echo $curl67 | jq '.data.guestOrder.groups_2101['$indexOrder67'].deliveryAddress.fullName' >> track-fullName.txt
echo $curl67 | jq '.data.guestOrder.groups_2101['$indexOrder67'].deliveryAddress.address.addressString' >> track-address.txt
echo $curl67 | jq '.data.guestOrder.groups_2101['$indexOrder67'].status.message.parts[].text' >> track-status.txt
echo $curl67 | jq '.data.guestOrder.groups_2101['$indexOrder67'].shipment.trackingNumber' >> track-number.txt
echo $curl67 | jq '.data.guestOrder.groups_2101['$indexOrder67'].shipment.trackingUrl' >> track-url.txt
fi

curl68=`curl 'https://www.walmart.com/orchestra/home/graphql' \
  -H 'authority: www.walmart.com' \
  -H 'sec-ch-ua: " Not A;Brand";v="99", "Chromium";v="96", "Microsoft Edge";v="96"' \
  -H 'x-o-platform: rweb' \
  -H 'dnt: 1' \
  -H 'x-o-correlation-id: wrvYiSFTlAmd8j7a8DDmpuyOpCN_heAnwM3v' \
  -H 'device_profile_ref_id: _s1F3NO8Y2JjaBUKPDcY4iFDWiIl9CyqiJjf' \
  -H 'x-latency-trace: 1' \
  -H 'wm_mp: true' \
  -H 'x-o-market: us' \
  -H 'x-o-platform-version: main-253-ebbb47' \
  -H 'x-o-gql-query: query getGuestOrder' \
  -H 'wm_page_url: https://www.walmart.com/orders' \
  -H 'x-apollo-operation-name: getGuestOrder' \
  -H 'sec-ch-ua-platform: "macOS"' \
  -H 'sec-ch-ua-mobile: ?0' \
  -H 'user-agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/96.0.4664.110 Safari/537.36 Edg/96.0.1054.62' \
  -H 'x-o-segment: oaoh' \
  -H 'content-type: application/json' \
  -H 'accept: application/json' \
  -H 'x-enable-server-timing: 1' \
  -H 'x-o-ccm: server' \
  -H 'wm_qos.correlation_id: wrvYiSFTlAmd8j7a8DDmpuyOpCN_heAnwM3v' \
  -H 'origin: https://www.walmart.com' \
  -H 'sec-fetch-site: same-origin' \
  -H 'sec-fetch-mode: cors' \
  -H 'sec-fetch-dest: empty' \
  -H 'referer: https://www.walmart.com/orders' \
  -H 'accept-language: vi' \
  --data-raw $'{"query":"query getGuestOrder($orderId:ID\u0021 $emailAddress:String\u0021){guestOrder(input:{id:$orderId emailAddress:$emailAddress}){...OrderFieldsFragment}}fragment cancelReason on OrderCancelReason{__typename subReasonCode subDescription}fragment priceDetailFragment on OrderPriceDetailRow{label value displayValue info{title message}rowInfo{...orderPriceDetailRowInfo}}fragment orderPriceDetailRowInfo on OrderPriceDetailRowInfo{title message{...textFragment}}fragment price on Price{displayValue value}fragment variants on MapEntry{name value}fragment OrderAddOn on OrderAddOn{lineId uniqueLineId productInfo{name usItemId offerId}quantityString quantityLabel type fulfillmentInstructions{...textFragment}actions{manageProtectionPlan{...orderActionFragment}cancel}priceInfo{linePrice{...price}}quantity isActive}fragment orderDonationDetails on OrderDonationDetails{message{...textFragment}emailReceipt emailReceiptToken status{...textFragment}errorStatus}fragment orderLineItem on OrderLineItem{id uniqueId actions{contactSeller cancel addToCart configureCake reviewItem resendEGiftCardToken protectionPlan{...orderActionFragment}manageProtectionPlan{...orderActionFragment}}isGift digitalDeliveryMessage quantity quantityString quantityLabel isSubstitutionSelected fulfilledItems{id quantityString priceInfo{itemPrice{value}}product{usItemId name}}isReturnable returnEligibilityMessage product{name usItemId imageInfo{thumbnailUrl}canonicalUrl offerId sellerId sellerName hasSellerBadge seller{sellerId name}orderLimit orderMinLimit weightIncrement salesUnit salesUnitType isSubstitutionEligible isAlcohol}reshop{reshopMessage isShippingAvailable minPromiseDate maxPromiseDate}selectedVariants{...variants}variantAdditionalInfo{parts{text nativeAction}}priceInfo{priceDisplayCodes{showItemPrice priceDisplayCondition finalCostByWeight}itemPrice{...price}linePrice{...price}unitPrice{...price}preDiscountedLinePrice{...price}additionalLines{name value}}discounts{label labelText{...textFragment}}itemReviewed activationCodes{label code}protectionPlanMessage{...textFragment}showSeller isShippedByWalmart seller{id name isPro}digitalDeliveryPhoneNumber addOns{...OrderAddOn}multiboxBundleId}fragment DriverFragment on Driver{id firstName photoUrl}fragment OrderGroupFragment on OrderGroup{driver{...DriverFragment}deliveryDate fulfillmentType status{...OrderGroupStatusFragment}showSeller isShippedByWalmart seller{...SellerFragment}id itemCount items{...LiteLineItemFragment}pickupPerson{firstName lastName email}accessPointId shipment{...ShipmentFragment}returnEligibilityMessage actions{...OrderGroupActionsFragment}recipientEmailAddress digitalDelivery{...DigitalDeliveryFragment}tireInstallationReservation{status extraText}}fragment OrderGroupStatusFragment on OrderGroupStatus{statusType showStatusTracker statusTracker{status label isCurrent}message{...textFragment}subtext subMessage{...textFragment}notice helpCenterText{...textFragment}}fragment textFragment on Text{parts{bold url text nativeAction lineBreak}}fragment LiteLineItemFragment on OrderLineItem{id quantity product{name usItemId imageInfo{thumbnailUrl}offerId isAlcohol}priceInfo{linePrice{...price}}}fragment SellerFragment on GroupSeller{id name isPro}fragment DigitalDeliveryFragment on DigitalDelivery{title name instructions{...textFragment}}fragment ShipmentFragment on Shipment{id trackingNumber isExternalTracking trackingUrl proofOfDelivery{photoUrl photoPreviewUrl showPreview}}fragment OrderGroupActionsFragment on OrderGroupActions{reorder edit track changeSlot checkin editDeliveryInstructions editPickupPerson editTip tip cancel enableTip{...orderActionFragment}enableEdit{...orderActionFragment}rescheduleTireInstall{...orderActionFragment}cancelTireInstall{...orderActionFragment}help viewCancellationDetails{...cancellationDetailsActionFragment}}fragment cancellationDetailsActionFragment on CancellationDetailsAction{label heading text{...textFragment}}fragment ODPGroupCategoryFragment on OrderCategory{type name subtext returnMessage substitutionsBanner{...textFragment}showExtendedSubstitutions actions{substitutions{message label type}nilPickReshop{message action{text url}}returnDetails viewCancellationDetails{...cancellationDetailsActionFragment}trackOnInHomeApp}banner{...textFragment}accordionState items{...orderLineItem}substitutions{...orderLineItem fulfilledItems{...orderLineItem}}returnInfo{...returnInfoFragment}}fragment ODPGroupFragment on OrderGroup{id fulfillmentType deliveryMessage deliveryAddress{fullName firstName lastName address{...addressFragment}}deliveryInstructions{text type typeText}deliveryPreferences{text{...textFragment}cta{...orderActionFragment}}editSubstitutionsCutOff status{statusType showStatusTracker message{...textFragment}notice helpCenterText{...textFragment}}itemCount isCategorized categories{...ODPGroupCategoryFragment}seller{id name isPro}shipment{id trackingNumber}actions{reorder edit track changeSlot checkin editDeliveryInstructions editPickupPerson tip cancel help enableTip{...orderActionFragment}enableEdit{...orderActionFragment}viewCancellationDetails{...cancellationDetailsActionFragment}enableInHome{...orderActionFragment}createGiftReceipt}cutOffTimestamp isEditSubstitutionsEligible isInHome giftDetails{recipientAddress{fullName}recipientEmail senderName giftMessage}donationDetails{...orderDonationDetails}}fragment returnInfoFragment on ReturnInfo{returnOrderId type refundPriceDetails{__typename...refundPriceDetailsFragment}refundMessage tierRefundMessage paymentMethods{__typename description cardType paymentType displayValues message{...textFragment}}actions{__typename generate scheduleOrModifyPickup{text url}reschedulePickup editPickupContact}shippingLabelUrl qrCodeImageUrl carriers{__typename id name}pickupCarrier pickupContact{nameAndAddress{fullName firstName lastName address{addressString city state postalCode addressLineOne addressLineTwo country}}phone}pickupConfirmationNumber bannerMessage{...textFragment}}fragment refundPriceDetailsFragment on RefundPriceDetails{subTotal{__typename...orderPriceDetailRowFragment}fees{__typename...orderPriceDetailRowFragment}discounts{__typename...orderPriceDetailRowFragment}taxTotal{__typename...orderPriceDetailRowFragment}grandTotal{__typename...orderPriceDetailRowFragment}}fragment orderPriceDetailRowFragment on OrderPriceDetailRow{label displayValue value info{__typename title message}}fragment addressFragment on OrderAddress{addressString addressLineOne addressLineTwo state postalCode city}fragment ODPPickupInfo on OrderGroup{pickupInstructions pickupPerson{...person}alternatePickupPerson{...person}store{id name address{...addressFragment}}}fragment person on OrderPickupPerson{firstName lastName email}fragment ODPTippingInfo on OrderGroup{addTipMessage{...textFragment}driver{...DriverFragment}tipping{min{...price}max{...price}suggested{...price}preselected}subtotal{...price}}fragment orderActionFragment on Action{text url}fragment orderCustomer on OrderCustomer{id firstName lastName email isGuest isEmailRegistered}fragment OrderFieldsFragment on Order{__typename id version type customer{...orderCustomer}displayId idBarcodeImageUrl(barWidth:3 barHeight:100) isFuelPurchase title shortTitle timezone tippableGroup{...OrderGroupFragment}amendableGroup{id changeSlotIterationsLeft cutOffTimestamp fulfillmentType deliveryAddress{fullName firstName lastName address{addressString addressLineOne addressLineTwo state postalCode city country}}isAmendInProgress}substitutionsBanner{heading subheading longSubheading}groups_2101{__typename...OrderGroupFragment...ODPGroupFragment...ODPPickupInfo...ODPTippingInfo}multiboxBundles{...orderLineItem}itemCancelReasons{__typename...cancelReason}groupCancelReasons{__typename...cancelReason}priceDetails{__typename subTotal{__typename...priceDetailFragment}taxTotal{__typename...priceDetailFragment}grandTotal{__typename...priceDetailFragment}authorizationAmount{__typename...priceDetailFragment}fees{__typename...priceDetailFragment}discounts{__typename...priceDetailFragment}minimumThreshold{__typename...price}belowMinimumFee{__typename...priceDetailFragment}driverTip{__typename...priceDetailFragment}donations{__typename...priceDetailFragment}}paymentMethods{__typename description cardType paymentType displayValues message{...textFragment}actions{connectToCapitalOne{...orderActionFragment}visitAffirm{...orderActionFragment}}}actions{__typename return pendingReturn cancel startReturn{...orderActionFragment}reorder}banners{...textFragment}}","variables":{"orderId":"2812228298601","emailAddress":"patwill@centex.net"}}' \
  --compressed`
 
for (( i=0; i<=4; i++ ))
do
  if [[ $curl68 =~ "error"  || $curl68 =~ "blocked" ]]; then
    echo "Lỗi email số 68"
    indexOrder68=`echo error`
    break
  elif [[ `echo $curl68 | jq '.data.guestOrder.groups_2101['${i[@]}'].items[0].product.usItemId'` == '"755361385"' ]]; then
    indexOrder68=`echo $i`
    indexItem68=`echo 0`
  elif [[ `echo $curl68 | jq '.data.guestOrder.groups_2101['${i[@]}'].items[1].product.usItemId'` == '"755361385"' ]]; then
    indexOrder68=`echo $i`
    indexItem68=`echo 1`
  elif [[ `echo $curl68 | jq '.data.guestOrder.groups_2101['${i[@]}'].items[2].product.usItemId'` == '"755361385"' ]]; then
    indexOrder68=`echo $i`
    indexItem68=`echo 2`
  elif [[ `echo $curl68 | jq '.data.guestOrder.groups_2101['${i[@]}'].items[3].product.usItemId'` == '"755361385"' ]]; then
    indexOrder68=`echo $i`
    indexItem68=`echo 3`
  fi
done

if [[ $indexOrder68 != "error" ]]; then
echo $curl68 | jq '.data.guestOrder.id' >> track-OrderID.txt
echo $curl68 | jq '.data.guestOrder.customer.email' >> track-email.txt
echo $curl68 | jq '.data.guestOrder.groups_2101['$indexOrder68'].items['$indexItem68'].product.usItemId' >> track-usItemId.txt
echo $curl68 | jq '.data.guestOrder.groups_2101['$indexOrder68'].items['$indexItem68'].priceInfo.linePrice.value' >> track-priceValue.txt
echo $curl68 | jq '.data.guestOrder.groups_2101['$indexOrder68'].deliveryAddress.fullName' >> track-fullName.txt
echo $curl68 | jq '.data.guestOrder.groups_2101['$indexOrder68'].deliveryAddress.address.addressString' >> track-address.txt
echo $curl68 | jq '.data.guestOrder.groups_2101['$indexOrder68'].status.message.parts[].text' >> track-status.txt
echo $curl68 | jq '.data.guestOrder.groups_2101['$indexOrder68'].shipment.trackingNumber' >> track-number.txt
echo $curl68 | jq '.data.guestOrder.groups_2101['$indexOrder68'].shipment.trackingUrl' >> track-url.txt
fi

curl69=`curl 'https://www.walmart.com/orchestra/home/graphql' \
  -H 'authority: www.walmart.com' \
  -H 'sec-ch-ua: " Not A;Brand";v="99", "Chromium";v="96", "Microsoft Edge";v="96"' \
  -H 'x-o-platform: rweb' \
  -H 'dnt: 1' \
  -H 'x-o-correlation-id: wrvYiSFTlAmd8j7a8DDmpuyOpCN_heAnwM3v' \
  -H 'device_profile_ref_id: _s1F3NO8Y2JjaBUKPDcY4iFDWiIl9CyqiJjf' \
  -H 'x-latency-trace: 1' \
  -H 'wm_mp: true' \
  -H 'x-o-market: us' \
  -H 'x-o-platform-version: main-253-ebbb47' \
  -H 'x-o-gql-query: query getGuestOrder' \
  -H 'wm_page_url: https://www.walmart.com/orders' \
  -H 'x-apollo-operation-name: getGuestOrder' \
  -H 'sec-ch-ua-platform: "macOS"' \
  -H 'sec-ch-ua-mobile: ?0' \
  -H 'user-agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/96.0.4664.110 Safari/537.36 Edg/96.0.1054.62' \
  -H 'x-o-segment: oaoh' \
  -H 'content-type: application/json' \
  -H 'accept: application/json' \
  -H 'x-enable-server-timing: 1' \
  -H 'x-o-ccm: server' \
  -H 'wm_qos.correlation_id: wrvYiSFTlAmd8j7a8DDmpuyOpCN_heAnwM3v' \
  -H 'origin: https://www.walmart.com' \
  -H 'sec-fetch-site: same-origin' \
  -H 'sec-fetch-mode: cors' \
  -H 'sec-fetch-dest: empty' \
  -H 'referer: https://www.walmart.com/orders' \
  -H 'accept-language: vi' \
  --data-raw $'{"query":"query getGuestOrder($orderId:ID\u0021 $emailAddress:String\u0021){guestOrder(input:{id:$orderId emailAddress:$emailAddress}){...OrderFieldsFragment}}fragment cancelReason on OrderCancelReason{__typename subReasonCode subDescription}fragment priceDetailFragment on OrderPriceDetailRow{label value displayValue info{title message}rowInfo{...orderPriceDetailRowInfo}}fragment orderPriceDetailRowInfo on OrderPriceDetailRowInfo{title message{...textFragment}}fragment price on Price{displayValue value}fragment variants on MapEntry{name value}fragment OrderAddOn on OrderAddOn{lineId uniqueLineId productInfo{name usItemId offerId}quantityString quantityLabel type fulfillmentInstructions{...textFragment}actions{manageProtectionPlan{...orderActionFragment}cancel}priceInfo{linePrice{...price}}quantity isActive}fragment orderDonationDetails on OrderDonationDetails{message{...textFragment}emailReceipt emailReceiptToken status{...textFragment}errorStatus}fragment orderLineItem on OrderLineItem{id uniqueId actions{contactSeller cancel addToCart configureCake reviewItem resendEGiftCardToken protectionPlan{...orderActionFragment}manageProtectionPlan{...orderActionFragment}}isGift digitalDeliveryMessage quantity quantityString quantityLabel isSubstitutionSelected fulfilledItems{id quantityString priceInfo{itemPrice{value}}product{usItemId name}}isReturnable returnEligibilityMessage product{name usItemId imageInfo{thumbnailUrl}canonicalUrl offerId sellerId sellerName hasSellerBadge seller{sellerId name}orderLimit orderMinLimit weightIncrement salesUnit salesUnitType isSubstitutionEligible isAlcohol}reshop{reshopMessage isShippingAvailable minPromiseDate maxPromiseDate}selectedVariants{...variants}variantAdditionalInfo{parts{text nativeAction}}priceInfo{priceDisplayCodes{showItemPrice priceDisplayCondition finalCostByWeight}itemPrice{...price}linePrice{...price}unitPrice{...price}preDiscountedLinePrice{...price}additionalLines{name value}}discounts{label labelText{...textFragment}}itemReviewed activationCodes{label code}protectionPlanMessage{...textFragment}showSeller isShippedByWalmart seller{id name isPro}digitalDeliveryPhoneNumber addOns{...OrderAddOn}multiboxBundleId}fragment DriverFragment on Driver{id firstName photoUrl}fragment OrderGroupFragment on OrderGroup{driver{...DriverFragment}deliveryDate fulfillmentType status{...OrderGroupStatusFragment}showSeller isShippedByWalmart seller{...SellerFragment}id itemCount items{...LiteLineItemFragment}pickupPerson{firstName lastName email}accessPointId shipment{...ShipmentFragment}returnEligibilityMessage actions{...OrderGroupActionsFragment}recipientEmailAddress digitalDelivery{...DigitalDeliveryFragment}tireInstallationReservation{status extraText}}fragment OrderGroupStatusFragment on OrderGroupStatus{statusType showStatusTracker statusTracker{status label isCurrent}message{...textFragment}subtext subMessage{...textFragment}notice helpCenterText{...textFragment}}fragment textFragment on Text{parts{bold url text nativeAction lineBreak}}fragment LiteLineItemFragment on OrderLineItem{id quantity product{name usItemId imageInfo{thumbnailUrl}offerId isAlcohol}priceInfo{linePrice{...price}}}fragment SellerFragment on GroupSeller{id name isPro}fragment DigitalDeliveryFragment on DigitalDelivery{title name instructions{...textFragment}}fragment ShipmentFragment on Shipment{id trackingNumber isExternalTracking trackingUrl proofOfDelivery{photoUrl photoPreviewUrl showPreview}}fragment OrderGroupActionsFragment on OrderGroupActions{reorder edit track changeSlot checkin editDeliveryInstructions editPickupPerson editTip tip cancel enableTip{...orderActionFragment}enableEdit{...orderActionFragment}rescheduleTireInstall{...orderActionFragment}cancelTireInstall{...orderActionFragment}help viewCancellationDetails{...cancellationDetailsActionFragment}}fragment cancellationDetailsActionFragment on CancellationDetailsAction{label heading text{...textFragment}}fragment ODPGroupCategoryFragment on OrderCategory{type name subtext returnMessage substitutionsBanner{...textFragment}showExtendedSubstitutions actions{substitutions{message label type}nilPickReshop{message action{text url}}returnDetails viewCancellationDetails{...cancellationDetailsActionFragment}trackOnInHomeApp}banner{...textFragment}accordionState items{...orderLineItem}substitutions{...orderLineItem fulfilledItems{...orderLineItem}}returnInfo{...returnInfoFragment}}fragment ODPGroupFragment on OrderGroup{id fulfillmentType deliveryMessage deliveryAddress{fullName firstName lastName address{...addressFragment}}deliveryInstructions{text type typeText}deliveryPreferences{text{...textFragment}cta{...orderActionFragment}}editSubstitutionsCutOff status{statusType showStatusTracker message{...textFragment}notice helpCenterText{...textFragment}}itemCount isCategorized categories{...ODPGroupCategoryFragment}seller{id name isPro}shipment{id trackingNumber}actions{reorder edit track changeSlot checkin editDeliveryInstructions editPickupPerson tip cancel help enableTip{...orderActionFragment}enableEdit{...orderActionFragment}viewCancellationDetails{...cancellationDetailsActionFragment}enableInHome{...orderActionFragment}createGiftReceipt}cutOffTimestamp isEditSubstitutionsEligible isInHome giftDetails{recipientAddress{fullName}recipientEmail senderName giftMessage}donationDetails{...orderDonationDetails}}fragment returnInfoFragment on ReturnInfo{returnOrderId type refundPriceDetails{__typename...refundPriceDetailsFragment}refundMessage tierRefundMessage paymentMethods{__typename description cardType paymentType displayValues message{...textFragment}}actions{__typename generate scheduleOrModifyPickup{text url}reschedulePickup editPickupContact}shippingLabelUrl qrCodeImageUrl carriers{__typename id name}pickupCarrier pickupContact{nameAndAddress{fullName firstName lastName address{addressString city state postalCode addressLineOne addressLineTwo country}}phone}pickupConfirmationNumber bannerMessage{...textFragment}}fragment refundPriceDetailsFragment on RefundPriceDetails{subTotal{__typename...orderPriceDetailRowFragment}fees{__typename...orderPriceDetailRowFragment}discounts{__typename...orderPriceDetailRowFragment}taxTotal{__typename...orderPriceDetailRowFragment}grandTotal{__typename...orderPriceDetailRowFragment}}fragment orderPriceDetailRowFragment on OrderPriceDetailRow{label displayValue value info{__typename title message}}fragment addressFragment on OrderAddress{addressString addressLineOne addressLineTwo state postalCode city}fragment ODPPickupInfo on OrderGroup{pickupInstructions pickupPerson{...person}alternatePickupPerson{...person}store{id name address{...addressFragment}}}fragment person on OrderPickupPerson{firstName lastName email}fragment ODPTippingInfo on OrderGroup{addTipMessage{...textFragment}driver{...DriverFragment}tipping{min{...price}max{...price}suggested{...price}preselected}subtotal{...price}}fragment orderActionFragment on Action{text url}fragment orderCustomer on OrderCustomer{id firstName lastName email isGuest isEmailRegistered}fragment OrderFieldsFragment on Order{__typename id version type customer{...orderCustomer}displayId idBarcodeImageUrl(barWidth:3 barHeight:100) isFuelPurchase title shortTitle timezone tippableGroup{...OrderGroupFragment}amendableGroup{id changeSlotIterationsLeft cutOffTimestamp fulfillmentType deliveryAddress{fullName firstName lastName address{addressString addressLineOne addressLineTwo state postalCode city country}}isAmendInProgress}substitutionsBanner{heading subheading longSubheading}groups_2101{__typename...OrderGroupFragment...ODPGroupFragment...ODPPickupInfo...ODPTippingInfo}multiboxBundles{...orderLineItem}itemCancelReasons{__typename...cancelReason}groupCancelReasons{__typename...cancelReason}priceDetails{__typename subTotal{__typename...priceDetailFragment}taxTotal{__typename...priceDetailFragment}grandTotal{__typename...priceDetailFragment}authorizationAmount{__typename...priceDetailFragment}fees{__typename...priceDetailFragment}discounts{__typename...priceDetailFragment}minimumThreshold{__typename...price}belowMinimumFee{__typename...priceDetailFragment}driverTip{__typename...priceDetailFragment}donations{__typename...priceDetailFragment}}paymentMethods{__typename description cardType paymentType displayValues message{...textFragment}actions{connectToCapitalOne{...orderActionFragment}visitAffirm{...orderActionFragment}}}actions{__typename return pendingReturn cancel startReturn{...orderActionFragment}reorder}banners{...textFragment}}","variables":{"orderId":"2822231919112","emailAddress":"maddwag2658@gmail.com"}}' \
  --compressed`
 
for (( i=0; i<=4; i++ ))
do
  if [[ $curl69 =~ "error"  || $curl69 =~ "blocked" ]]; then
    echo "Lỗi email số 69"
    indexOrder69=`echo error`
    break
  elif [[ `echo $curl69 | jq '.data.guestOrder.groups_2101['${i[@]}'].items[0].product.usItemId'` == '"399596583"' ]]; then
    indexOrder69=`echo $i`
    indexItem69=`echo 0`
  elif [[ `echo $curl69 | jq '.data.guestOrder.groups_2101['${i[@]}'].items[1].product.usItemId'` == '"399596583"' ]]; then
    indexOrder69=`echo $i`
    indexItem69=`echo 1`
  elif [[ `echo $curl69 | jq '.data.guestOrder.groups_2101['${i[@]}'].items[2].product.usItemId'` == '"399596583"' ]]; then
    indexOrder69=`echo $i`
    indexItem69=`echo 2`
  elif [[ `echo $curl69 | jq '.data.guestOrder.groups_2101['${i[@]}'].items[3].product.usItemId'` == '"399596583"' ]]; then
    indexOrder69=`echo $i`
    indexItem69=`echo 3`
  fi
done

if [[ $indexOrder69 != "error" ]]; then
echo $curl69 | jq '.data.guestOrder.id' >> track-OrderID.txt
echo $curl69 | jq '.data.guestOrder.customer.email' >> track-email.txt
echo $curl69 | jq '.data.guestOrder.groups_2101['$indexOrder69'].items['$indexItem69'].product.usItemId' >> track-usItemId.txt
echo $curl69 | jq '.data.guestOrder.groups_2101['$indexOrder69'].items['$indexItem69'].priceInfo.linePrice.value' >> track-priceValue.txt
echo $curl69 | jq '.data.guestOrder.groups_2101['$indexOrder69'].deliveryAddress.fullName' >> track-fullName.txt
echo $curl69 | jq '.data.guestOrder.groups_2101['$indexOrder69'].deliveryAddress.address.addressString' >> track-address.txt
echo $curl69 | jq '.data.guestOrder.groups_2101['$indexOrder69'].status.message.parts[].text' >> track-status.txt
echo $curl69 | jq '.data.guestOrder.groups_2101['$indexOrder69'].shipment.trackingNumber' >> track-number.txt
echo $curl69 | jq '.data.guestOrder.groups_2101['$indexOrder69'].shipment.trackingUrl' >> track-url.txt
fi

curl70=`curl 'https://www.walmart.com/orchestra/home/graphql' \
  -H 'authority: www.walmart.com' \
  -H 'sec-ch-ua: " Not A;Brand";v="99", "Chromium";v="96", "Microsoft Edge";v="96"' \
  -H 'x-o-platform: rweb' \
  -H 'dnt: 1' \
  -H 'x-o-correlation-id: wrvYiSFTlAmd8j7a8DDmpuyOpCN_heAnwM3v' \
  -H 'device_profile_ref_id: _s1F3NO8Y2JjaBUKPDcY4iFDWiIl9CyqiJjf' \
  -H 'x-latency-trace: 1' \
  -H 'wm_mp: true' \
  -H 'x-o-market: us' \
  -H 'x-o-platform-version: main-253-ebbb47' \
  -H 'x-o-gql-query: query getGuestOrder' \
  -H 'wm_page_url: https://www.walmart.com/orders' \
  -H 'x-apollo-operation-name: getGuestOrder' \
  -H 'sec-ch-ua-platform: "macOS"' \
  -H 'sec-ch-ua-mobile: ?0' \
  -H 'user-agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/96.0.4664.110 Safari/537.36 Edg/96.0.1054.62' \
  -H 'x-o-segment: oaoh' \
  -H 'content-type: application/json' \
  -H 'accept: application/json' \
  -H 'x-enable-server-timing: 1' \
  -H 'x-o-ccm: server' \
  -H 'wm_qos.correlation_id: wrvYiSFTlAmd8j7a8DDmpuyOpCN_heAnwM3v' \
  -H 'origin: https://www.walmart.com' \
  -H 'sec-fetch-site: same-origin' \
  -H 'sec-fetch-mode: cors' \
  -H 'sec-fetch-dest: empty' \
  -H 'referer: https://www.walmart.com/orders' \
  -H 'accept-language: vi' \
  --data-raw $'{"query":"query getGuestOrder($orderId:ID\u0021 $emailAddress:String\u0021){guestOrder(input:{id:$orderId emailAddress:$emailAddress}){...OrderFieldsFragment}}fragment cancelReason on OrderCancelReason{__typename subReasonCode subDescription}fragment priceDetailFragment on OrderPriceDetailRow{label value displayValue info{title message}rowInfo{...orderPriceDetailRowInfo}}fragment orderPriceDetailRowInfo on OrderPriceDetailRowInfo{title message{...textFragment}}fragment price on Price{displayValue value}fragment variants on MapEntry{name value}fragment OrderAddOn on OrderAddOn{lineId uniqueLineId productInfo{name usItemId offerId}quantityString quantityLabel type fulfillmentInstructions{...textFragment}actions{manageProtectionPlan{...orderActionFragment}cancel}priceInfo{linePrice{...price}}quantity isActive}fragment orderDonationDetails on OrderDonationDetails{message{...textFragment}emailReceipt emailReceiptToken status{...textFragment}errorStatus}fragment orderLineItem on OrderLineItem{id uniqueId actions{contactSeller cancel addToCart configureCake reviewItem resendEGiftCardToken protectionPlan{...orderActionFragment}manageProtectionPlan{...orderActionFragment}}isGift digitalDeliveryMessage quantity quantityString quantityLabel isSubstitutionSelected fulfilledItems{id quantityString priceInfo{itemPrice{value}}product{usItemId name}}isReturnable returnEligibilityMessage product{name usItemId imageInfo{thumbnailUrl}canonicalUrl offerId sellerId sellerName hasSellerBadge seller{sellerId name}orderLimit orderMinLimit weightIncrement salesUnit salesUnitType isSubstitutionEligible isAlcohol}reshop{reshopMessage isShippingAvailable minPromiseDate maxPromiseDate}selectedVariants{...variants}variantAdditionalInfo{parts{text nativeAction}}priceInfo{priceDisplayCodes{showItemPrice priceDisplayCondition finalCostByWeight}itemPrice{...price}linePrice{...price}unitPrice{...price}preDiscountedLinePrice{...price}additionalLines{name value}}discounts{label labelText{...textFragment}}itemReviewed activationCodes{label code}protectionPlanMessage{...textFragment}showSeller isShippedByWalmart seller{id name isPro}digitalDeliveryPhoneNumber addOns{...OrderAddOn}multiboxBundleId}fragment DriverFragment on Driver{id firstName photoUrl}fragment OrderGroupFragment on OrderGroup{driver{...DriverFragment}deliveryDate fulfillmentType status{...OrderGroupStatusFragment}showSeller isShippedByWalmart seller{...SellerFragment}id itemCount items{...LiteLineItemFragment}pickupPerson{firstName lastName email}accessPointId shipment{...ShipmentFragment}returnEligibilityMessage actions{...OrderGroupActionsFragment}recipientEmailAddress digitalDelivery{...DigitalDeliveryFragment}tireInstallationReservation{status extraText}}fragment OrderGroupStatusFragment on OrderGroupStatus{statusType showStatusTracker statusTracker{status label isCurrent}message{...textFragment}subtext subMessage{...textFragment}notice helpCenterText{...textFragment}}fragment textFragment on Text{parts{bold url text nativeAction lineBreak}}fragment LiteLineItemFragment on OrderLineItem{id quantity product{name usItemId imageInfo{thumbnailUrl}offerId isAlcohol}priceInfo{linePrice{...price}}}fragment SellerFragment on GroupSeller{id name isPro}fragment DigitalDeliveryFragment on DigitalDelivery{title name instructions{...textFragment}}fragment ShipmentFragment on Shipment{id trackingNumber isExternalTracking trackingUrl proofOfDelivery{photoUrl photoPreviewUrl showPreview}}fragment OrderGroupActionsFragment on OrderGroupActions{reorder edit track changeSlot checkin editDeliveryInstructions editPickupPerson editTip tip cancel enableTip{...orderActionFragment}enableEdit{...orderActionFragment}rescheduleTireInstall{...orderActionFragment}cancelTireInstall{...orderActionFragment}help viewCancellationDetails{...cancellationDetailsActionFragment}}fragment cancellationDetailsActionFragment on CancellationDetailsAction{label heading text{...textFragment}}fragment ODPGroupCategoryFragment on OrderCategory{type name subtext returnMessage substitutionsBanner{...textFragment}showExtendedSubstitutions actions{substitutions{message label type}nilPickReshop{message action{text url}}returnDetails viewCancellationDetails{...cancellationDetailsActionFragment}trackOnInHomeApp}banner{...textFragment}accordionState items{...orderLineItem}substitutions{...orderLineItem fulfilledItems{...orderLineItem}}returnInfo{...returnInfoFragment}}fragment ODPGroupFragment on OrderGroup{id fulfillmentType deliveryMessage deliveryAddress{fullName firstName lastName address{...addressFragment}}deliveryInstructions{text type typeText}deliveryPreferences{text{...textFragment}cta{...orderActionFragment}}editSubstitutionsCutOff status{statusType showStatusTracker message{...textFragment}notice helpCenterText{...textFragment}}itemCount isCategorized categories{...ODPGroupCategoryFragment}seller{id name isPro}shipment{id trackingNumber}actions{reorder edit track changeSlot checkin editDeliveryInstructions editPickupPerson tip cancel help enableTip{...orderActionFragment}enableEdit{...orderActionFragment}viewCancellationDetails{...cancellationDetailsActionFragment}enableInHome{...orderActionFragment}createGiftReceipt}cutOffTimestamp isEditSubstitutionsEligible isInHome giftDetails{recipientAddress{fullName}recipientEmail senderName giftMessage}donationDetails{...orderDonationDetails}}fragment returnInfoFragment on ReturnInfo{returnOrderId type refundPriceDetails{__typename...refundPriceDetailsFragment}refundMessage tierRefundMessage paymentMethods{__typename description cardType paymentType displayValues message{...textFragment}}actions{__typename generate scheduleOrModifyPickup{text url}reschedulePickup editPickupContact}shippingLabelUrl qrCodeImageUrl carriers{__typename id name}pickupCarrier pickupContact{nameAndAddress{fullName firstName lastName address{addressString city state postalCode addressLineOne addressLineTwo country}}phone}pickupConfirmationNumber bannerMessage{...textFragment}}fragment refundPriceDetailsFragment on RefundPriceDetails{subTotal{__typename...orderPriceDetailRowFragment}fees{__typename...orderPriceDetailRowFragment}discounts{__typename...orderPriceDetailRowFragment}taxTotal{__typename...orderPriceDetailRowFragment}grandTotal{__typename...orderPriceDetailRowFragment}}fragment orderPriceDetailRowFragment on OrderPriceDetailRow{label displayValue value info{__typename title message}}fragment addressFragment on OrderAddress{addressString addressLineOne addressLineTwo state postalCode city}fragment ODPPickupInfo on OrderGroup{pickupInstructions pickupPerson{...person}alternatePickupPerson{...person}store{id name address{...addressFragment}}}fragment person on OrderPickupPerson{firstName lastName email}fragment ODPTippingInfo on OrderGroup{addTipMessage{...textFragment}driver{...DriverFragment}tipping{min{...price}max{...price}suggested{...price}preselected}subtotal{...price}}fragment orderActionFragment on Action{text url}fragment orderCustomer on OrderCustomer{id firstName lastName email isGuest isEmailRegistered}fragment OrderFieldsFragment on Order{__typename id version type customer{...orderCustomer}displayId idBarcodeImageUrl(barWidth:3 barHeight:100) isFuelPurchase title shortTitle timezone tippableGroup{...OrderGroupFragment}amendableGroup{id changeSlotIterationsLeft cutOffTimestamp fulfillmentType deliveryAddress{fullName firstName lastName address{addressString addressLineOne addressLineTwo state postalCode city country}}isAmendInProgress}substitutionsBanner{heading subheading longSubheading}groups_2101{__typename...OrderGroupFragment...ODPGroupFragment...ODPPickupInfo...ODPTippingInfo}multiboxBundles{...orderLineItem}itemCancelReasons{__typename...cancelReason}groupCancelReasons{__typename...cancelReason}priceDetails{__typename subTotal{__typename...priceDetailFragment}taxTotal{__typename...priceDetailFragment}grandTotal{__typename...priceDetailFragment}authorizationAmount{__typename...priceDetailFragment}fees{__typename...priceDetailFragment}discounts{__typename...priceDetailFragment}minimumThreshold{__typename...price}belowMinimumFee{__typename...priceDetailFragment}driverTip{__typename...priceDetailFragment}donations{__typename...priceDetailFragment}}paymentMethods{__typename description cardType paymentType displayValues message{...textFragment}actions{connectToCapitalOne{...orderActionFragment}visitAffirm{...orderActionFragment}}}actions{__typename return pendingReturn cancel startReturn{...orderActionFragment}reorder}banners{...textFragment}}","variables":{"orderId":"2832232531518","emailAddress":"owen.haring@yahoo.com"}}' \
  --compressed`
 
for (( i=0; i<=4; i++ ))
do
  if [[ $curl70 =~ "error"  || $curl70 =~ "blocked" ]]; then
    echo "Lỗi email số 70"
    indexOrder70=`echo error`
    break
  elif [[ `echo $curl70 | jq '.data.guestOrder.groups_2101['${i[@]}'].items[0].product.usItemId'` == '"755361385"' ]]; then
    indexOrder70=`echo $i`
    indexItem70=`echo 0`
  elif [[ `echo $curl70 | jq '.data.guestOrder.groups_2101['${i[@]}'].items[1].product.usItemId'` == '"755361385"' ]]; then
    indexOrder70=`echo $i`
    indexItem70=`echo 1`
  elif [[ `echo $curl70 | jq '.data.guestOrder.groups_2101['${i[@]}'].items[2].product.usItemId'` == '"755361385"' ]]; then
    indexOrder70=`echo $i`
    indexItem70=`echo 2`
  elif [[ `echo $curl70 | jq '.data.guestOrder.groups_2101['${i[@]}'].items[3].product.usItemId'` == '"755361385"' ]]; then
    indexOrder70=`echo $i`
    indexItem70=`echo 3`
  fi
done

if [[ $indexOrder70 != "error" ]]; then
echo $curl70 | jq '.data.guestOrder.id' >> track-OrderID.txt
echo $curl70 | jq '.data.guestOrder.customer.email' >> track-email.txt
echo $curl70 | jq '.data.guestOrder.groups_2101['$indexOrder70'].items['$indexItem70'].product.usItemId' >> track-usItemId.txt
echo $curl70 | jq '.data.guestOrder.groups_2101['$indexOrder70'].items['$indexItem70'].priceInfo.linePrice.value' >> track-priceValue.txt
echo $curl70 | jq '.data.guestOrder.groups_2101['$indexOrder70'].deliveryAddress.fullName' >> track-fullName.txt
echo $curl70 | jq '.data.guestOrder.groups_2101['$indexOrder70'].deliveryAddress.address.addressString' >> track-address.txt
echo $curl70 | jq '.data.guestOrder.groups_2101['$indexOrder70'].status.message.parts[].text' >> track-status.txt
echo $curl70 | jq '.data.guestOrder.groups_2101['$indexOrder70'].shipment.trackingNumber' >> track-number.txt
echo $curl70 | jq '.data.guestOrder.groups_2101['$indexOrder70'].shipment.trackingUrl' >> track-url.txt
fi

curl71=`curl 'https://www.walmart.com/orchestra/home/graphql' \
  -H 'authority: www.walmart.com' \
  -H 'sec-ch-ua: " Not A;Brand";v="99", "Chromium";v="96", "Microsoft Edge";v="96"' \
  -H 'x-o-platform: rweb' \
  -H 'dnt: 1' \
  -H 'x-o-correlation-id: wrvYiSFTlAmd8j7a8DDmpuyOpCN_heAnwM3v' \
  -H 'device_profile_ref_id: _s1F3NO8Y2JjaBUKPDcY4iFDWiIl9CyqiJjf' \
  -H 'x-latency-trace: 1' \
  -H 'wm_mp: true' \
  -H 'x-o-market: us' \
  -H 'x-o-platform-version: main-253-ebbb47' \
  -H 'x-o-gql-query: query getGuestOrder' \
  -H 'wm_page_url: https://www.walmart.com/orders' \
  -H 'x-apollo-operation-name: getGuestOrder' \
  -H 'sec-ch-ua-platform: "macOS"' \
  -H 'sec-ch-ua-mobile: ?0' \
  -H 'user-agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/96.0.4664.110 Safari/537.36 Edg/96.0.1054.62' \
  -H 'x-o-segment: oaoh' \
  -H 'content-type: application/json' \
  -H 'accept: application/json' \
  -H 'x-enable-server-timing: 1' \
  -H 'x-o-ccm: server' \
  -H 'wm_qos.correlation_id: wrvYiSFTlAmd8j7a8DDmpuyOpCN_heAnwM3v' \
  -H 'origin: https://www.walmart.com' \
  -H 'sec-fetch-site: same-origin' \
  -H 'sec-fetch-mode: cors' \
  -H 'sec-fetch-dest: empty' \
  -H 'referer: https://www.walmart.com/orders' \
  -H 'accept-language: vi' \
  --data-raw $'{"query":"query getGuestOrder($orderId:ID\u0021 $emailAddress:String\u0021){guestOrder(input:{id:$orderId emailAddress:$emailAddress}){...OrderFieldsFragment}}fragment cancelReason on OrderCancelReason{__typename subReasonCode subDescription}fragment priceDetailFragment on OrderPriceDetailRow{label value displayValue info{title message}rowInfo{...orderPriceDetailRowInfo}}fragment orderPriceDetailRowInfo on OrderPriceDetailRowInfo{title message{...textFragment}}fragment price on Price{displayValue value}fragment variants on MapEntry{name value}fragment OrderAddOn on OrderAddOn{lineId uniqueLineId productInfo{name usItemId offerId}quantityString quantityLabel type fulfillmentInstructions{...textFragment}actions{manageProtectionPlan{...orderActionFragment}cancel}priceInfo{linePrice{...price}}quantity isActive}fragment orderDonationDetails on OrderDonationDetails{message{...textFragment}emailReceipt emailReceiptToken status{...textFragment}errorStatus}fragment orderLineItem on OrderLineItem{id uniqueId actions{contactSeller cancel addToCart configureCake reviewItem resendEGiftCardToken protectionPlan{...orderActionFragment}manageProtectionPlan{...orderActionFragment}}isGift digitalDeliveryMessage quantity quantityString quantityLabel isSubstitutionSelected fulfilledItems{id quantityString priceInfo{itemPrice{value}}product{usItemId name}}isReturnable returnEligibilityMessage product{name usItemId imageInfo{thumbnailUrl}canonicalUrl offerId sellerId sellerName hasSellerBadge seller{sellerId name}orderLimit orderMinLimit weightIncrement salesUnit salesUnitType isSubstitutionEligible isAlcohol}reshop{reshopMessage isShippingAvailable minPromiseDate maxPromiseDate}selectedVariants{...variants}variantAdditionalInfo{parts{text nativeAction}}priceInfo{priceDisplayCodes{showItemPrice priceDisplayCondition finalCostByWeight}itemPrice{...price}linePrice{...price}unitPrice{...price}preDiscountedLinePrice{...price}additionalLines{name value}}discounts{label labelText{...textFragment}}itemReviewed activationCodes{label code}protectionPlanMessage{...textFragment}showSeller isShippedByWalmart seller{id name isPro}digitalDeliveryPhoneNumber addOns{...OrderAddOn}multiboxBundleId}fragment DriverFragment on Driver{id firstName photoUrl}fragment OrderGroupFragment on OrderGroup{driver{...DriverFragment}deliveryDate fulfillmentType status{...OrderGroupStatusFragment}showSeller isShippedByWalmart seller{...SellerFragment}id itemCount items{...LiteLineItemFragment}pickupPerson{firstName lastName email}accessPointId shipment{...ShipmentFragment}returnEligibilityMessage actions{...OrderGroupActionsFragment}recipientEmailAddress digitalDelivery{...DigitalDeliveryFragment}tireInstallationReservation{status extraText}}fragment OrderGroupStatusFragment on OrderGroupStatus{statusType showStatusTracker statusTracker{status label isCurrent}message{...textFragment}subtext subMessage{...textFragment}notice helpCenterText{...textFragment}}fragment textFragment on Text{parts{bold url text nativeAction lineBreak}}fragment LiteLineItemFragment on OrderLineItem{id quantity product{name usItemId imageInfo{thumbnailUrl}offerId isAlcohol}priceInfo{linePrice{...price}}}fragment SellerFragment on GroupSeller{id name isPro}fragment DigitalDeliveryFragment on DigitalDelivery{title name instructions{...textFragment}}fragment ShipmentFragment on Shipment{id trackingNumber isExternalTracking trackingUrl proofOfDelivery{photoUrl photoPreviewUrl showPreview}}fragment OrderGroupActionsFragment on OrderGroupActions{reorder edit track changeSlot checkin editDeliveryInstructions editPickupPerson editTip tip cancel enableTip{...orderActionFragment}enableEdit{...orderActionFragment}rescheduleTireInstall{...orderActionFragment}cancelTireInstall{...orderActionFragment}help viewCancellationDetails{...cancellationDetailsActionFragment}}fragment cancellationDetailsActionFragment on CancellationDetailsAction{label heading text{...textFragment}}fragment ODPGroupCategoryFragment on OrderCategory{type name subtext returnMessage substitutionsBanner{...textFragment}showExtendedSubstitutions actions{substitutions{message label type}nilPickReshop{message action{text url}}returnDetails viewCancellationDetails{...cancellationDetailsActionFragment}trackOnInHomeApp}banner{...textFragment}accordionState items{...orderLineItem}substitutions{...orderLineItem fulfilledItems{...orderLineItem}}returnInfo{...returnInfoFragment}}fragment ODPGroupFragment on OrderGroup{id fulfillmentType deliveryMessage deliveryAddress{fullName firstName lastName address{...addressFragment}}deliveryInstructions{text type typeText}deliveryPreferences{text{...textFragment}cta{...orderActionFragment}}editSubstitutionsCutOff status{statusType showStatusTracker message{...textFragment}notice helpCenterText{...textFragment}}itemCount isCategorized categories{...ODPGroupCategoryFragment}seller{id name isPro}shipment{id trackingNumber}actions{reorder edit track changeSlot checkin editDeliveryInstructions editPickupPerson tip cancel help enableTip{...orderActionFragment}enableEdit{...orderActionFragment}viewCancellationDetails{...cancellationDetailsActionFragment}enableInHome{...orderActionFragment}createGiftReceipt}cutOffTimestamp isEditSubstitutionsEligible isInHome giftDetails{recipientAddress{fullName}recipientEmail senderName giftMessage}donationDetails{...orderDonationDetails}}fragment returnInfoFragment on ReturnInfo{returnOrderId type refundPriceDetails{__typename...refundPriceDetailsFragment}refundMessage tierRefundMessage paymentMethods{__typename description cardType paymentType displayValues message{...textFragment}}actions{__typename generate scheduleOrModifyPickup{text url}reschedulePickup editPickupContact}shippingLabelUrl qrCodeImageUrl carriers{__typename id name}pickupCarrier pickupContact{nameAndAddress{fullName firstName lastName address{addressString city state postalCode addressLineOne addressLineTwo country}}phone}pickupConfirmationNumber bannerMessage{...textFragment}}fragment refundPriceDetailsFragment on RefundPriceDetails{subTotal{__typename...orderPriceDetailRowFragment}fees{__typename...orderPriceDetailRowFragment}discounts{__typename...orderPriceDetailRowFragment}taxTotal{__typename...orderPriceDetailRowFragment}grandTotal{__typename...orderPriceDetailRowFragment}}fragment orderPriceDetailRowFragment on OrderPriceDetailRow{label displayValue value info{__typename title message}}fragment addressFragment on OrderAddress{addressString addressLineOne addressLineTwo state postalCode city}fragment ODPPickupInfo on OrderGroup{pickupInstructions pickupPerson{...person}alternatePickupPerson{...person}store{id name address{...addressFragment}}}fragment person on OrderPickupPerson{firstName lastName email}fragment ODPTippingInfo on OrderGroup{addTipMessage{...textFragment}driver{...DriverFragment}tipping{min{...price}max{...price}suggested{...price}preselected}subtotal{...price}}fragment orderActionFragment on Action{text url}fragment orderCustomer on OrderCustomer{id firstName lastName email isGuest isEmailRegistered}fragment OrderFieldsFragment on Order{__typename id version type customer{...orderCustomer}displayId idBarcodeImageUrl(barWidth:3 barHeight:100) isFuelPurchase title shortTitle timezone tippableGroup{...OrderGroupFragment}amendableGroup{id changeSlotIterationsLeft cutOffTimestamp fulfillmentType deliveryAddress{fullName firstName lastName address{addressString addressLineOne addressLineTwo state postalCode city country}}isAmendInProgress}substitutionsBanner{heading subheading longSubheading}groups_2101{__typename...OrderGroupFragment...ODPGroupFragment...ODPPickupInfo...ODPTippingInfo}multiboxBundles{...orderLineItem}itemCancelReasons{__typename...cancelReason}groupCancelReasons{__typename...cancelReason}priceDetails{__typename subTotal{__typename...priceDetailFragment}taxTotal{__typename...priceDetailFragment}grandTotal{__typename...priceDetailFragment}authorizationAmount{__typename...priceDetailFragment}fees{__typename...priceDetailFragment}discounts{__typename...priceDetailFragment}minimumThreshold{__typename...price}belowMinimumFee{__typename...priceDetailFragment}driverTip{__typename...priceDetailFragment}donations{__typename...priceDetailFragment}}paymentMethods{__typename description cardType paymentType displayValues message{...textFragment}actions{connectToCapitalOne{...orderActionFragment}visitAffirm{...orderActionFragment}}}actions{__typename return pendingReturn cancel startReturn{...orderActionFragment}reorder}banners{...textFragment}}","variables":{"orderId":"2832232228105","emailAddress":"miangelclark.mc@gmail.com"}}' \
  --compressed`
 
for (( i=0; i<=4; i++ ))
do
  if [[ $curl71 =~ "error"  || $curl71 =~ "blocked" ]]; then
    echo "Lỗi email số 71"
    indexOrder71=`echo error`
    break
  elif [[ `echo $curl71 | jq '.data.guestOrder.groups_2101['${i[@]}'].items[0].product.usItemId'` == '"689830322"' ]]; then
    indexOrder71=`echo $i`
    indexItem71=`echo 0`
  elif [[ `echo $curl71 | jq '.data.guestOrder.groups_2101['${i[@]}'].items[1].product.usItemId'` == '"689830322"' ]]; then
    indexOrder71=`echo $i`
    indexItem71=`echo 1`
  elif [[ `echo $curl71 | jq '.data.guestOrder.groups_2101['${i[@]}'].items[2].product.usItemId'` == '"689830322"' ]]; then
    indexOrder71=`echo $i`
    indexItem71=`echo 2`
  elif [[ `echo $curl71 | jq '.data.guestOrder.groups_2101['${i[@]}'].items[3].product.usItemId'` == '"689830322"' ]]; then
    indexOrder71=`echo $i`
    indexItem71=`echo 3`
  fi
done

if [[ $indexOrder71 != "error" ]]; then
echo $curl71 | jq '.data.guestOrder.id' >> track-OrderID.txt
echo $curl71 | jq '.data.guestOrder.customer.email' >> track-email.txt
echo $curl71 | jq '.data.guestOrder.groups_2101['$indexOrder71'].items['$indexItem71'].product.usItemId' >> track-usItemId.txt
echo $curl71 | jq '.data.guestOrder.groups_2101['$indexOrder71'].items['$indexItem71'].priceInfo.linePrice.value' >> track-priceValue.txt
echo $curl71 | jq '.data.guestOrder.groups_2101['$indexOrder71'].deliveryAddress.fullName' >> track-fullName.txt
echo $curl71 | jq '.data.guestOrder.groups_2101['$indexOrder71'].deliveryAddress.address.addressString' >> track-address.txt
echo $curl71 | jq '.data.guestOrder.groups_2101['$indexOrder71'].status.message.parts[].text' >> track-status.txt
echo $curl71 | jq '.data.guestOrder.groups_2101['$indexOrder71'].shipment.trackingNumber' >> track-number.txt
echo $curl71 | jq '.data.guestOrder.groups_2101['$indexOrder71'].shipment.trackingUrl' >> track-url.txt
fi

curl72=`curl 'https://www.walmart.com/orchestra/home/graphql' \
  -H 'authority: www.walmart.com' \
  -H 'sec-ch-ua: " Not A;Brand";v="99", "Chromium";v="96", "Microsoft Edge";v="96"' \
  -H 'x-o-platform: rweb' \
  -H 'dnt: 1' \
  -H 'x-o-correlation-id: wrvYiSFTlAmd8j7a8DDmpuyOpCN_heAnwM3v' \
  -H 'device_profile_ref_id: _s1F3NO8Y2JjaBUKPDcY4iFDWiIl9CyqiJjf' \
  -H 'x-latency-trace: 1' \
  -H 'wm_mp: true' \
  -H 'x-o-market: us' \
  -H 'x-o-platform-version: main-253-ebbb47' \
  -H 'x-o-gql-query: query getGuestOrder' \
  -H 'wm_page_url: https://www.walmart.com/orders' \
  -H 'x-apollo-operation-name: getGuestOrder' \
  -H 'sec-ch-ua-platform: "macOS"' \
  -H 'sec-ch-ua-mobile: ?0' \
  -H 'user-agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/96.0.4664.110 Safari/537.36 Edg/96.0.1054.62' \
  -H 'x-o-segment: oaoh' \
  -H 'content-type: application/json' \
  -H 'accept: application/json' \
  -H 'x-enable-server-timing: 1' \
  -H 'x-o-ccm: server' \
  -H 'wm_qos.correlation_id: wrvYiSFTlAmd8j7a8DDmpuyOpCN_heAnwM3v' \
  -H 'origin: https://www.walmart.com' \
  -H 'sec-fetch-site: same-origin' \
  -H 'sec-fetch-mode: cors' \
  -H 'sec-fetch-dest: empty' \
  -H 'referer: https://www.walmart.com/orders' \
  -H 'accept-language: vi' \
  --data-raw $'{"query":"query getGuestOrder($orderId:ID\u0021 $emailAddress:String\u0021){guestOrder(input:{id:$orderId emailAddress:$emailAddress}){...OrderFieldsFragment}}fragment cancelReason on OrderCancelReason{__typename subReasonCode subDescription}fragment priceDetailFragment on OrderPriceDetailRow{label value displayValue info{title message}rowInfo{...orderPriceDetailRowInfo}}fragment orderPriceDetailRowInfo on OrderPriceDetailRowInfo{title message{...textFragment}}fragment price on Price{displayValue value}fragment variants on MapEntry{name value}fragment OrderAddOn on OrderAddOn{lineId uniqueLineId productInfo{name usItemId offerId}quantityString quantityLabel type fulfillmentInstructions{...textFragment}actions{manageProtectionPlan{...orderActionFragment}cancel}priceInfo{linePrice{...price}}quantity isActive}fragment orderDonationDetails on OrderDonationDetails{message{...textFragment}emailReceipt emailReceiptToken status{...textFragment}errorStatus}fragment orderLineItem on OrderLineItem{id uniqueId actions{contactSeller cancel addToCart configureCake reviewItem resendEGiftCardToken protectionPlan{...orderActionFragment}manageProtectionPlan{...orderActionFragment}}isGift digitalDeliveryMessage quantity quantityString quantityLabel isSubstitutionSelected fulfilledItems{id quantityString priceInfo{itemPrice{value}}product{usItemId name}}isReturnable returnEligibilityMessage product{name usItemId imageInfo{thumbnailUrl}canonicalUrl offerId sellerId sellerName hasSellerBadge seller{sellerId name}orderLimit orderMinLimit weightIncrement salesUnit salesUnitType isSubstitutionEligible isAlcohol}reshop{reshopMessage isShippingAvailable minPromiseDate maxPromiseDate}selectedVariants{...variants}variantAdditionalInfo{parts{text nativeAction}}priceInfo{priceDisplayCodes{showItemPrice priceDisplayCondition finalCostByWeight}itemPrice{...price}linePrice{...price}unitPrice{...price}preDiscountedLinePrice{...price}additionalLines{name value}}discounts{label labelText{...textFragment}}itemReviewed activationCodes{label code}protectionPlanMessage{...textFragment}showSeller isShippedByWalmart seller{id name isPro}digitalDeliveryPhoneNumber addOns{...OrderAddOn}multiboxBundleId}fragment DriverFragment on Driver{id firstName photoUrl}fragment OrderGroupFragment on OrderGroup{driver{...DriverFragment}deliveryDate fulfillmentType status{...OrderGroupStatusFragment}showSeller isShippedByWalmart seller{...SellerFragment}id itemCount items{...LiteLineItemFragment}pickupPerson{firstName lastName email}accessPointId shipment{...ShipmentFragment}returnEligibilityMessage actions{...OrderGroupActionsFragment}recipientEmailAddress digitalDelivery{...DigitalDeliveryFragment}tireInstallationReservation{status extraText}}fragment OrderGroupStatusFragment on OrderGroupStatus{statusType showStatusTracker statusTracker{status label isCurrent}message{...textFragment}subtext subMessage{...textFragment}notice helpCenterText{...textFragment}}fragment textFragment on Text{parts{bold url text nativeAction lineBreak}}fragment LiteLineItemFragment on OrderLineItem{id quantity product{name usItemId imageInfo{thumbnailUrl}offerId isAlcohol}priceInfo{linePrice{...price}}}fragment SellerFragment on GroupSeller{id name isPro}fragment DigitalDeliveryFragment on DigitalDelivery{title name instructions{...textFragment}}fragment ShipmentFragment on Shipment{id trackingNumber isExternalTracking trackingUrl proofOfDelivery{photoUrl photoPreviewUrl showPreview}}fragment OrderGroupActionsFragment on OrderGroupActions{reorder edit track changeSlot checkin editDeliveryInstructions editPickupPerson editTip tip cancel enableTip{...orderActionFragment}enableEdit{...orderActionFragment}rescheduleTireInstall{...orderActionFragment}cancelTireInstall{...orderActionFragment}help viewCancellationDetails{...cancellationDetailsActionFragment}}fragment cancellationDetailsActionFragment on CancellationDetailsAction{label heading text{...textFragment}}fragment ODPGroupCategoryFragment on OrderCategory{type name subtext returnMessage substitutionsBanner{...textFragment}showExtendedSubstitutions actions{substitutions{message label type}nilPickReshop{message action{text url}}returnDetails viewCancellationDetails{...cancellationDetailsActionFragment}trackOnInHomeApp}banner{...textFragment}accordionState items{...orderLineItem}substitutions{...orderLineItem fulfilledItems{...orderLineItem}}returnInfo{...returnInfoFragment}}fragment ODPGroupFragment on OrderGroup{id fulfillmentType deliveryMessage deliveryAddress{fullName firstName lastName address{...addressFragment}}deliveryInstructions{text type typeText}deliveryPreferences{text{...textFragment}cta{...orderActionFragment}}editSubstitutionsCutOff status{statusType showStatusTracker message{...textFragment}notice helpCenterText{...textFragment}}itemCount isCategorized categories{...ODPGroupCategoryFragment}seller{id name isPro}shipment{id trackingNumber}actions{reorder edit track changeSlot checkin editDeliveryInstructions editPickupPerson tip cancel help enableTip{...orderActionFragment}enableEdit{...orderActionFragment}viewCancellationDetails{...cancellationDetailsActionFragment}enableInHome{...orderActionFragment}createGiftReceipt}cutOffTimestamp isEditSubstitutionsEligible isInHome giftDetails{recipientAddress{fullName}recipientEmail senderName giftMessage}donationDetails{...orderDonationDetails}}fragment returnInfoFragment on ReturnInfo{returnOrderId type refundPriceDetails{__typename...refundPriceDetailsFragment}refundMessage tierRefundMessage paymentMethods{__typename description cardType paymentType displayValues message{...textFragment}}actions{__typename generate scheduleOrModifyPickup{text url}reschedulePickup editPickupContact}shippingLabelUrl qrCodeImageUrl carriers{__typename id name}pickupCarrier pickupContact{nameAndAddress{fullName firstName lastName address{addressString city state postalCode addressLineOne addressLineTwo country}}phone}pickupConfirmationNumber bannerMessage{...textFragment}}fragment refundPriceDetailsFragment on RefundPriceDetails{subTotal{__typename...orderPriceDetailRowFragment}fees{__typename...orderPriceDetailRowFragment}discounts{__typename...orderPriceDetailRowFragment}taxTotal{__typename...orderPriceDetailRowFragment}grandTotal{__typename...orderPriceDetailRowFragment}}fragment orderPriceDetailRowFragment on OrderPriceDetailRow{label displayValue value info{__typename title message}}fragment addressFragment on OrderAddress{addressString addressLineOne addressLineTwo state postalCode city}fragment ODPPickupInfo on OrderGroup{pickupInstructions pickupPerson{...person}alternatePickupPerson{...person}store{id name address{...addressFragment}}}fragment person on OrderPickupPerson{firstName lastName email}fragment ODPTippingInfo on OrderGroup{addTipMessage{...textFragment}driver{...DriverFragment}tipping{min{...price}max{...price}suggested{...price}preselected}subtotal{...price}}fragment orderActionFragment on Action{text url}fragment orderCustomer on OrderCustomer{id firstName lastName email isGuest isEmailRegistered}fragment OrderFieldsFragment on Order{__typename id version type customer{...orderCustomer}displayId idBarcodeImageUrl(barWidth:3 barHeight:100) isFuelPurchase title shortTitle timezone tippableGroup{...OrderGroupFragment}amendableGroup{id changeSlotIterationsLeft cutOffTimestamp fulfillmentType deliveryAddress{fullName firstName lastName address{addressString addressLineOne addressLineTwo state postalCode city country}}isAmendInProgress}substitutionsBanner{heading subheading longSubheading}groups_2101{__typename...OrderGroupFragment...ODPGroupFragment...ODPPickupInfo...ODPTippingInfo}multiboxBundles{...orderLineItem}itemCancelReasons{__typename...cancelReason}groupCancelReasons{__typename...cancelReason}priceDetails{__typename subTotal{__typename...priceDetailFragment}taxTotal{__typename...priceDetailFragment}grandTotal{__typename...priceDetailFragment}authorizationAmount{__typename...priceDetailFragment}fees{__typename...priceDetailFragment}discounts{__typename...priceDetailFragment}minimumThreshold{__typename...price}belowMinimumFee{__typename...priceDetailFragment}driverTip{__typename...priceDetailFragment}donations{__typename...priceDetailFragment}}paymentMethods{__typename description cardType paymentType displayValues message{...textFragment}actions{connectToCapitalOne{...orderActionFragment}visitAffirm{...orderActionFragment}}}actions{__typename return pendingReturn cancel startReturn{...orderActionFragment}reorder}banners{...textFragment}}","variables":{"orderId":"2832232543693","emailAddress":"browneyes_70068@yahoo.com"}}' \
  --compressed`
 
for (( i=0; i<=4; i++ ))
do
  if [[ $curl72 =~ "error"  || $curl72 =~ "blocked" ]]; then
    echo "Lỗi email số 72"
    indexOrder72=`echo error`
    break
  elif [[ `echo $curl72 | jq '.data.guestOrder.groups_2101['${i[@]}'].items[0].product.usItemId'` == '"121639349"' ]]; then
    indexOrder72=`echo $i`
    indexItem72=`echo 0`
  elif [[ `echo $curl72 | jq '.data.guestOrder.groups_2101['${i[@]}'].items[1].product.usItemId'` == '"121639349"' ]]; then
    indexOrder72=`echo $i`
    indexItem72=`echo 1`
  elif [[ `echo $curl72 | jq '.data.guestOrder.groups_2101['${i[@]}'].items[2].product.usItemId'` == '"121639349"' ]]; then
    indexOrder72=`echo $i`
    indexItem72=`echo 2`
  elif [[ `echo $curl72 | jq '.data.guestOrder.groups_2101['${i[@]}'].items[3].product.usItemId'` == '"121639349"' ]]; then
    indexOrder72=`echo $i`
    indexItem72=`echo 3`
  fi
done

if [[ $indexOrder72 != "error" ]]; then
echo $curl72 | jq '.data.guestOrder.id' >> track-OrderID.txt
echo $curl72 | jq '.data.guestOrder.customer.email' >> track-email.txt
echo $curl72 | jq '.data.guestOrder.groups_2101['$indexOrder72'].items['$indexItem72'].product.usItemId' >> track-usItemId.txt
echo $curl72 | jq '.data.guestOrder.groups_2101['$indexOrder72'].items['$indexItem72'].priceInfo.linePrice.value' >> track-priceValue.txt
echo $curl72 | jq '.data.guestOrder.groups_2101['$indexOrder72'].deliveryAddress.fullName' >> track-fullName.txt
echo $curl72 | jq '.data.guestOrder.groups_2101['$indexOrder72'].deliveryAddress.address.addressString' >> track-address.txt
echo $curl72 | jq '.data.guestOrder.groups_2101['$indexOrder72'].status.message.parts[].text' >> track-status.txt
echo $curl72 | jq '.data.guestOrder.groups_2101['$indexOrder72'].shipment.trackingNumber' >> track-number.txt
echo $curl72 | jq '.data.guestOrder.groups_2101['$indexOrder72'].shipment.trackingUrl' >> track-url.txt
fi

curl73=`curl 'https://www.walmart.com/orchestra/home/graphql' \
  -H 'authority: www.walmart.com' \
  -H 'sec-ch-ua: " Not A;Brand";v="99", "Chromium";v="96", "Microsoft Edge";v="96"' \
  -H 'x-o-platform: rweb' \
  -H 'dnt: 1' \
  -H 'x-o-correlation-id: wrvYiSFTlAmd8j7a8DDmpuyOpCN_heAnwM3v' \
  -H 'device_profile_ref_id: _s1F3NO8Y2JjaBUKPDcY4iFDWiIl9CyqiJjf' \
  -H 'x-latency-trace: 1' \
  -H 'wm_mp: true' \
  -H 'x-o-market: us' \
  -H 'x-o-platform-version: main-253-ebbb47' \
  -H 'x-o-gql-query: query getGuestOrder' \
  -H 'wm_page_url: https://www.walmart.com/orders' \
  -H 'x-apollo-operation-name: getGuestOrder' \
  -H 'sec-ch-ua-platform: "macOS"' \
  -H 'sec-ch-ua-mobile: ?0' \
  -H 'user-agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/96.0.4664.110 Safari/537.36 Edg/96.0.1054.62' \
  -H 'x-o-segment: oaoh' \
  -H 'content-type: application/json' \
  -H 'accept: application/json' \
  -H 'x-enable-server-timing: 1' \
  -H 'x-o-ccm: server' \
  -H 'wm_qos.correlation_id: wrvYiSFTlAmd8j7a8DDmpuyOpCN_heAnwM3v' \
  -H 'origin: https://www.walmart.com' \
  -H 'sec-fetch-site: same-origin' \
  -H 'sec-fetch-mode: cors' \
  -H 'sec-fetch-dest: empty' \
  -H 'referer: https://www.walmart.com/orders' \
  -H 'accept-language: vi' \
  --data-raw $'{"query":"query getGuestOrder($orderId:ID\u0021 $emailAddress:String\u0021){guestOrder(input:{id:$orderId emailAddress:$emailAddress}){...OrderFieldsFragment}}fragment cancelReason on OrderCancelReason{__typename subReasonCode subDescription}fragment priceDetailFragment on OrderPriceDetailRow{label value displayValue info{title message}rowInfo{...orderPriceDetailRowInfo}}fragment orderPriceDetailRowInfo on OrderPriceDetailRowInfo{title message{...textFragment}}fragment price on Price{displayValue value}fragment variants on MapEntry{name value}fragment OrderAddOn on OrderAddOn{lineId uniqueLineId productInfo{name usItemId offerId}quantityString quantityLabel type fulfillmentInstructions{...textFragment}actions{manageProtectionPlan{...orderActionFragment}cancel}priceInfo{linePrice{...price}}quantity isActive}fragment orderDonationDetails on OrderDonationDetails{message{...textFragment}emailReceipt emailReceiptToken status{...textFragment}errorStatus}fragment orderLineItem on OrderLineItem{id uniqueId actions{contactSeller cancel addToCart configureCake reviewItem resendEGiftCardToken protectionPlan{...orderActionFragment}manageProtectionPlan{...orderActionFragment}}isGift digitalDeliveryMessage quantity quantityString quantityLabel isSubstitutionSelected fulfilledItems{id quantityString priceInfo{itemPrice{value}}product{usItemId name}}isReturnable returnEligibilityMessage product{name usItemId imageInfo{thumbnailUrl}canonicalUrl offerId sellerId sellerName hasSellerBadge seller{sellerId name}orderLimit orderMinLimit weightIncrement salesUnit salesUnitType isSubstitutionEligible isAlcohol}reshop{reshopMessage isShippingAvailable minPromiseDate maxPromiseDate}selectedVariants{...variants}variantAdditionalInfo{parts{text nativeAction}}priceInfo{priceDisplayCodes{showItemPrice priceDisplayCondition finalCostByWeight}itemPrice{...price}linePrice{...price}unitPrice{...price}preDiscountedLinePrice{...price}additionalLines{name value}}discounts{label labelText{...textFragment}}itemReviewed activationCodes{label code}protectionPlanMessage{...textFragment}showSeller isShippedByWalmart seller{id name isPro}digitalDeliveryPhoneNumber addOns{...OrderAddOn}multiboxBundleId}fragment DriverFragment on Driver{id firstName photoUrl}fragment OrderGroupFragment on OrderGroup{driver{...DriverFragment}deliveryDate fulfillmentType status{...OrderGroupStatusFragment}showSeller isShippedByWalmart seller{...SellerFragment}id itemCount items{...LiteLineItemFragment}pickupPerson{firstName lastName email}accessPointId shipment{...ShipmentFragment}returnEligibilityMessage actions{...OrderGroupActionsFragment}recipientEmailAddress digitalDelivery{...DigitalDeliveryFragment}tireInstallationReservation{status extraText}}fragment OrderGroupStatusFragment on OrderGroupStatus{statusType showStatusTracker statusTracker{status label isCurrent}message{...textFragment}subtext subMessage{...textFragment}notice helpCenterText{...textFragment}}fragment textFragment on Text{parts{bold url text nativeAction lineBreak}}fragment LiteLineItemFragment on OrderLineItem{id quantity product{name usItemId imageInfo{thumbnailUrl}offerId isAlcohol}priceInfo{linePrice{...price}}}fragment SellerFragment on GroupSeller{id name isPro}fragment DigitalDeliveryFragment on DigitalDelivery{title name instructions{...textFragment}}fragment ShipmentFragment on Shipment{id trackingNumber isExternalTracking trackingUrl proofOfDelivery{photoUrl photoPreviewUrl showPreview}}fragment OrderGroupActionsFragment on OrderGroupActions{reorder edit track changeSlot checkin editDeliveryInstructions editPickupPerson editTip tip cancel enableTip{...orderActionFragment}enableEdit{...orderActionFragment}rescheduleTireInstall{...orderActionFragment}cancelTireInstall{...orderActionFragment}help viewCancellationDetails{...cancellationDetailsActionFragment}}fragment cancellationDetailsActionFragment on CancellationDetailsAction{label heading text{...textFragment}}fragment ODPGroupCategoryFragment on OrderCategory{type name subtext returnMessage substitutionsBanner{...textFragment}showExtendedSubstitutions actions{substitutions{message label type}nilPickReshop{message action{text url}}returnDetails viewCancellationDetails{...cancellationDetailsActionFragment}trackOnInHomeApp}banner{...textFragment}accordionState items{...orderLineItem}substitutions{...orderLineItem fulfilledItems{...orderLineItem}}returnInfo{...returnInfoFragment}}fragment ODPGroupFragment on OrderGroup{id fulfillmentType deliveryMessage deliveryAddress{fullName firstName lastName address{...addressFragment}}deliveryInstructions{text type typeText}deliveryPreferences{text{...textFragment}cta{...orderActionFragment}}editSubstitutionsCutOff status{statusType showStatusTracker message{...textFragment}notice helpCenterText{...textFragment}}itemCount isCategorized categories{...ODPGroupCategoryFragment}seller{id name isPro}shipment{id trackingNumber}actions{reorder edit track changeSlot checkin editDeliveryInstructions editPickupPerson tip cancel help enableTip{...orderActionFragment}enableEdit{...orderActionFragment}viewCancellationDetails{...cancellationDetailsActionFragment}enableInHome{...orderActionFragment}createGiftReceipt}cutOffTimestamp isEditSubstitutionsEligible isInHome giftDetails{recipientAddress{fullName}recipientEmail senderName giftMessage}donationDetails{...orderDonationDetails}}fragment returnInfoFragment on ReturnInfo{returnOrderId type refundPriceDetails{__typename...refundPriceDetailsFragment}refundMessage tierRefundMessage paymentMethods{__typename description cardType paymentType displayValues message{...textFragment}}actions{__typename generate scheduleOrModifyPickup{text url}reschedulePickup editPickupContact}shippingLabelUrl qrCodeImageUrl carriers{__typename id name}pickupCarrier pickupContact{nameAndAddress{fullName firstName lastName address{addressString city state postalCode addressLineOne addressLineTwo country}}phone}pickupConfirmationNumber bannerMessage{...textFragment}}fragment refundPriceDetailsFragment on RefundPriceDetails{subTotal{__typename...orderPriceDetailRowFragment}fees{__typename...orderPriceDetailRowFragment}discounts{__typename...orderPriceDetailRowFragment}taxTotal{__typename...orderPriceDetailRowFragment}grandTotal{__typename...orderPriceDetailRowFragment}}fragment orderPriceDetailRowFragment on OrderPriceDetailRow{label displayValue value info{__typename title message}}fragment addressFragment on OrderAddress{addressString addressLineOne addressLineTwo state postalCode city}fragment ODPPickupInfo on OrderGroup{pickupInstructions pickupPerson{...person}alternatePickupPerson{...person}store{id name address{...addressFragment}}}fragment person on OrderPickupPerson{firstName lastName email}fragment ODPTippingInfo on OrderGroup{addTipMessage{...textFragment}driver{...DriverFragment}tipping{min{...price}max{...price}suggested{...price}preselected}subtotal{...price}}fragment orderActionFragment on Action{text url}fragment orderCustomer on OrderCustomer{id firstName lastName email isGuest isEmailRegistered}fragment OrderFieldsFragment on Order{__typename id version type customer{...orderCustomer}displayId idBarcodeImageUrl(barWidth:3 barHeight:100) isFuelPurchase title shortTitle timezone tippableGroup{...OrderGroupFragment}amendableGroup{id changeSlotIterationsLeft cutOffTimestamp fulfillmentType deliveryAddress{fullName firstName lastName address{addressString addressLineOne addressLineTwo state postalCode city country}}isAmendInProgress}substitutionsBanner{heading subheading longSubheading}groups_2101{__typename...OrderGroupFragment...ODPGroupFragment...ODPPickupInfo...ODPTippingInfo}multiboxBundles{...orderLineItem}itemCancelReasons{__typename...cancelReason}groupCancelReasons{__typename...cancelReason}priceDetails{__typename subTotal{__typename...priceDetailFragment}taxTotal{__typename...priceDetailFragment}grandTotal{__typename...priceDetailFragment}authorizationAmount{__typename...priceDetailFragment}fees{__typename...priceDetailFragment}discounts{__typename...priceDetailFragment}minimumThreshold{__typename...price}belowMinimumFee{__typename...priceDetailFragment}driverTip{__typename...priceDetailFragment}donations{__typename...priceDetailFragment}}paymentMethods{__typename description cardType paymentType displayValues message{...textFragment}actions{connectToCapitalOne{...orderActionFragment}visitAffirm{...orderActionFragment}}}actions{__typename return pendingReturn cancel startReturn{...orderActionFragment}reorder}banners{...textFragment}}","variables":{"orderId":"2832231647926","emailAddress":"camifife@gmail.com"}}' \
  --compressed`
 
for (( i=0; i<=4; i++ ))
do
  if [[ $curl73 =~ "error"  || $curl73 =~ "blocked" ]]; then
    echo "Lỗi email số 73"
    indexOrder73=`echo error`
    break
  elif [[ `echo $curl73 | jq '.data.guestOrder.groups_2101['${i[@]}'].items[0].product.usItemId'` == '"378936130"' ]]; then
    indexOrder73=`echo $i`
    indexItem73=`echo 0`
  elif [[ `echo $curl73 | jq '.data.guestOrder.groups_2101['${i[@]}'].items[1].product.usItemId'` == '"378936130"' ]]; then
    indexOrder73=`echo $i`
    indexItem73=`echo 1`
  elif [[ `echo $curl73 | jq '.data.guestOrder.groups_2101['${i[@]}'].items[2].product.usItemId'` == '"378936130"' ]]; then
    indexOrder73=`echo $i`
    indexItem73=`echo 2`
  elif [[ `echo $curl73 | jq '.data.guestOrder.groups_2101['${i[@]}'].items[3].product.usItemId'` == '"378936130"' ]]; then
    indexOrder73=`echo $i`
    indexItem73=`echo 3`
  fi
done

if [[ $indexOrder73 != "error" ]]; then
echo $curl73 | jq '.data.guestOrder.id' >> track-OrderID.txt
echo $curl73 | jq '.data.guestOrder.customer.email' >> track-email.txt
echo $curl73 | jq '.data.guestOrder.groups_2101['$indexOrder73'].items['$indexItem73'].product.usItemId' >> track-usItemId.txt
echo $curl73 | jq '.data.guestOrder.groups_2101['$indexOrder73'].items['$indexItem73'].priceInfo.linePrice.value' >> track-priceValue.txt
echo $curl73 | jq '.data.guestOrder.groups_2101['$indexOrder73'].deliveryAddress.fullName' >> track-fullName.txt
echo $curl73 | jq '.data.guestOrder.groups_2101['$indexOrder73'].deliveryAddress.address.addressString' >> track-address.txt
echo $curl73 | jq '.data.guestOrder.groups_2101['$indexOrder73'].status.message.parts[].text' >> track-status.txt
echo $curl73 | jq '.data.guestOrder.groups_2101['$indexOrder73'].shipment.trackingNumber' >> track-number.txt
echo $curl73 | jq '.data.guestOrder.groups_2101['$indexOrder73'].shipment.trackingUrl' >> track-url.txt
fi

curl74=`curl 'https://www.walmart.com/orchestra/home/graphql' \
  -H 'authority: www.walmart.com' \
  -H 'sec-ch-ua: " Not A;Brand";v="99", "Chromium";v="96", "Microsoft Edge";v="96"' \
  -H 'x-o-platform: rweb' \
  -H 'dnt: 1' \
  -H 'x-o-correlation-id: wrvYiSFTlAmd8j7a8DDmpuyOpCN_heAnwM3v' \
  -H 'device_profile_ref_id: _s1F3NO8Y2JjaBUKPDcY4iFDWiIl9CyqiJjf' \
  -H 'x-latency-trace: 1' \
  -H 'wm_mp: true' \
  -H 'x-o-market: us' \
  -H 'x-o-platform-version: main-253-ebbb47' \
  -H 'x-o-gql-query: query getGuestOrder' \
  -H 'wm_page_url: https://www.walmart.com/orders' \
  -H 'x-apollo-operation-name: getGuestOrder' \
  -H 'sec-ch-ua-platform: "macOS"' \
  -H 'sec-ch-ua-mobile: ?0' \
  -H 'user-agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/96.0.4664.110 Safari/537.36 Edg/96.0.1054.62' \
  -H 'x-o-segment: oaoh' \
  -H 'content-type: application/json' \
  -H 'accept: application/json' \
  -H 'x-enable-server-timing: 1' \
  -H 'x-o-ccm: server' \
  -H 'wm_qos.correlation_id: wrvYiSFTlAmd8j7a8DDmpuyOpCN_heAnwM3v' \
  -H 'origin: https://www.walmart.com' \
  -H 'sec-fetch-site: same-origin' \
  -H 'sec-fetch-mode: cors' \
  -H 'sec-fetch-dest: empty' \
  -H 'referer: https://www.walmart.com/orders' \
  -H 'accept-language: vi' \
  --data-raw $'{"query":"query getGuestOrder($orderId:ID\u0021 $emailAddress:String\u0021){guestOrder(input:{id:$orderId emailAddress:$emailAddress}){...OrderFieldsFragment}}fragment cancelReason on OrderCancelReason{__typename subReasonCode subDescription}fragment priceDetailFragment on OrderPriceDetailRow{label value displayValue info{title message}rowInfo{...orderPriceDetailRowInfo}}fragment orderPriceDetailRowInfo on OrderPriceDetailRowInfo{title message{...textFragment}}fragment price on Price{displayValue value}fragment variants on MapEntry{name value}fragment OrderAddOn on OrderAddOn{lineId uniqueLineId productInfo{name usItemId offerId}quantityString quantityLabel type fulfillmentInstructions{...textFragment}actions{manageProtectionPlan{...orderActionFragment}cancel}priceInfo{linePrice{...price}}quantity isActive}fragment orderDonationDetails on OrderDonationDetails{message{...textFragment}emailReceipt emailReceiptToken status{...textFragment}errorStatus}fragment orderLineItem on OrderLineItem{id uniqueId actions{contactSeller cancel addToCart configureCake reviewItem resendEGiftCardToken protectionPlan{...orderActionFragment}manageProtectionPlan{...orderActionFragment}}isGift digitalDeliveryMessage quantity quantityString quantityLabel isSubstitutionSelected fulfilledItems{id quantityString priceInfo{itemPrice{value}}product{usItemId name}}isReturnable returnEligibilityMessage product{name usItemId imageInfo{thumbnailUrl}canonicalUrl offerId sellerId sellerName hasSellerBadge seller{sellerId name}orderLimit orderMinLimit weightIncrement salesUnit salesUnitType isSubstitutionEligible isAlcohol}reshop{reshopMessage isShippingAvailable minPromiseDate maxPromiseDate}selectedVariants{...variants}variantAdditionalInfo{parts{text nativeAction}}priceInfo{priceDisplayCodes{showItemPrice priceDisplayCondition finalCostByWeight}itemPrice{...price}linePrice{...price}unitPrice{...price}preDiscountedLinePrice{...price}additionalLines{name value}}discounts{label labelText{...textFragment}}itemReviewed activationCodes{label code}protectionPlanMessage{...textFragment}showSeller isShippedByWalmart seller{id name isPro}digitalDeliveryPhoneNumber addOns{...OrderAddOn}multiboxBundleId}fragment DriverFragment on Driver{id firstName photoUrl}fragment OrderGroupFragment on OrderGroup{driver{...DriverFragment}deliveryDate fulfillmentType status{...OrderGroupStatusFragment}showSeller isShippedByWalmart seller{...SellerFragment}id itemCount items{...LiteLineItemFragment}pickupPerson{firstName lastName email}accessPointId shipment{...ShipmentFragment}returnEligibilityMessage actions{...OrderGroupActionsFragment}recipientEmailAddress digitalDelivery{...DigitalDeliveryFragment}tireInstallationReservation{status extraText}}fragment OrderGroupStatusFragment on OrderGroupStatus{statusType showStatusTracker statusTracker{status label isCurrent}message{...textFragment}subtext subMessage{...textFragment}notice helpCenterText{...textFragment}}fragment textFragment on Text{parts{bold url text nativeAction lineBreak}}fragment LiteLineItemFragment on OrderLineItem{id quantity product{name usItemId imageInfo{thumbnailUrl}offerId isAlcohol}priceInfo{linePrice{...price}}}fragment SellerFragment on GroupSeller{id name isPro}fragment DigitalDeliveryFragment on DigitalDelivery{title name instructions{...textFragment}}fragment ShipmentFragment on Shipment{id trackingNumber isExternalTracking trackingUrl proofOfDelivery{photoUrl photoPreviewUrl showPreview}}fragment OrderGroupActionsFragment on OrderGroupActions{reorder edit track changeSlot checkin editDeliveryInstructions editPickupPerson editTip tip cancel enableTip{...orderActionFragment}enableEdit{...orderActionFragment}rescheduleTireInstall{...orderActionFragment}cancelTireInstall{...orderActionFragment}help viewCancellationDetails{...cancellationDetailsActionFragment}}fragment cancellationDetailsActionFragment on CancellationDetailsAction{label heading text{...textFragment}}fragment ODPGroupCategoryFragment on OrderCategory{type name subtext returnMessage substitutionsBanner{...textFragment}showExtendedSubstitutions actions{substitutions{message label type}nilPickReshop{message action{text url}}returnDetails viewCancellationDetails{...cancellationDetailsActionFragment}trackOnInHomeApp}banner{...textFragment}accordionState items{...orderLineItem}substitutions{...orderLineItem fulfilledItems{...orderLineItem}}returnInfo{...returnInfoFragment}}fragment ODPGroupFragment on OrderGroup{id fulfillmentType deliveryMessage deliveryAddress{fullName firstName lastName address{...addressFragment}}deliveryInstructions{text type typeText}deliveryPreferences{text{...textFragment}cta{...orderActionFragment}}editSubstitutionsCutOff status{statusType showStatusTracker message{...textFragment}notice helpCenterText{...textFragment}}itemCount isCategorized categories{...ODPGroupCategoryFragment}seller{id name isPro}shipment{id trackingNumber}actions{reorder edit track changeSlot checkin editDeliveryInstructions editPickupPerson tip cancel help enableTip{...orderActionFragment}enableEdit{...orderActionFragment}viewCancellationDetails{...cancellationDetailsActionFragment}enableInHome{...orderActionFragment}createGiftReceipt}cutOffTimestamp isEditSubstitutionsEligible isInHome giftDetails{recipientAddress{fullName}recipientEmail senderName giftMessage}donationDetails{...orderDonationDetails}}fragment returnInfoFragment on ReturnInfo{returnOrderId type refundPriceDetails{__typename...refundPriceDetailsFragment}refundMessage tierRefundMessage paymentMethods{__typename description cardType paymentType displayValues message{...textFragment}}actions{__typename generate scheduleOrModifyPickup{text url}reschedulePickup editPickupContact}shippingLabelUrl qrCodeImageUrl carriers{__typename id name}pickupCarrier pickupContact{nameAndAddress{fullName firstName lastName address{addressString city state postalCode addressLineOne addressLineTwo country}}phone}pickupConfirmationNumber bannerMessage{...textFragment}}fragment refundPriceDetailsFragment on RefundPriceDetails{subTotal{__typename...orderPriceDetailRowFragment}fees{__typename...orderPriceDetailRowFragment}discounts{__typename...orderPriceDetailRowFragment}taxTotal{__typename...orderPriceDetailRowFragment}grandTotal{__typename...orderPriceDetailRowFragment}}fragment orderPriceDetailRowFragment on OrderPriceDetailRow{label displayValue value info{__typename title message}}fragment addressFragment on OrderAddress{addressString addressLineOne addressLineTwo state postalCode city}fragment ODPPickupInfo on OrderGroup{pickupInstructions pickupPerson{...person}alternatePickupPerson{...person}store{id name address{...addressFragment}}}fragment person on OrderPickupPerson{firstName lastName email}fragment ODPTippingInfo on OrderGroup{addTipMessage{...textFragment}driver{...DriverFragment}tipping{min{...price}max{...price}suggested{...price}preselected}subtotal{...price}}fragment orderActionFragment on Action{text url}fragment orderCustomer on OrderCustomer{id firstName lastName email isGuest isEmailRegistered}fragment OrderFieldsFragment on Order{__typename id version type customer{...orderCustomer}displayId idBarcodeImageUrl(barWidth:3 barHeight:100) isFuelPurchase title shortTitle timezone tippableGroup{...OrderGroupFragment}amendableGroup{id changeSlotIterationsLeft cutOffTimestamp fulfillmentType deliveryAddress{fullName firstName lastName address{addressString addressLineOne addressLineTwo state postalCode city country}}isAmendInProgress}substitutionsBanner{heading subheading longSubheading}groups_2101{__typename...OrderGroupFragment...ODPGroupFragment...ODPPickupInfo...ODPTippingInfo}multiboxBundles{...orderLineItem}itemCancelReasons{__typename...cancelReason}groupCancelReasons{__typename...cancelReason}priceDetails{__typename subTotal{__typename...priceDetailFragment}taxTotal{__typename...priceDetailFragment}grandTotal{__typename...priceDetailFragment}authorizationAmount{__typename...priceDetailFragment}fees{__typename...priceDetailFragment}discounts{__typename...priceDetailFragment}minimumThreshold{__typename...price}belowMinimumFee{__typename...priceDetailFragment}driverTip{__typename...priceDetailFragment}donations{__typename...priceDetailFragment}}paymentMethods{__typename description cardType paymentType displayValues message{...textFragment}actions{connectToCapitalOne{...orderActionFragment}visitAffirm{...orderActionFragment}}}actions{__typename return pendingReturn cancel startReturn{...orderActionFragment}reorder}banners{...textFragment}}","variables":{"orderId":"2832232530620","emailAddress":"melehov14@gmail.com"}}' \
  --compressed`
 
for (( i=0; i<=4; i++ ))
do
  if [[ $curl74 =~ "error"  || $curl74 =~ "blocked" ]]; then
    echo "Lỗi email số 74"
    indexOrder74=`echo error`
    break
  elif [[ `echo $curl74 | jq '.data.guestOrder.groups_2101['${i[@]}'].items[0].product.usItemId'` == '"50109305"' ]]; then
    indexOrder74=`echo $i`
    indexItem74=`echo 0`
  elif [[ `echo $curl74 | jq '.data.guestOrder.groups_2101['${i[@]}'].items[1].product.usItemId'` == '"50109305"' ]]; then
    indexOrder74=`echo $i`
    indexItem74=`echo 1`
  elif [[ `echo $curl74 | jq '.data.guestOrder.groups_2101['${i[@]}'].items[2].product.usItemId'` == '"50109305"' ]]; then
    indexOrder74=`echo $i`
    indexItem74=`echo 2`
  elif [[ `echo $curl74 | jq '.data.guestOrder.groups_2101['${i[@]}'].items[3].product.usItemId'` == '"50109305"' ]]; then
    indexOrder74=`echo $i`
    indexItem74=`echo 3`
  fi
done

if [[ $indexOrder74 != "error" ]]; then
echo $curl74 | jq '.data.guestOrder.id' >> track-OrderID.txt
echo $curl74 | jq '.data.guestOrder.customer.email' >> track-email.txt
echo $curl74 | jq '.data.guestOrder.groups_2101['$indexOrder74'].items['$indexItem74'].product.usItemId' >> track-usItemId.txt
echo $curl74 | jq '.data.guestOrder.groups_2101['$indexOrder74'].items['$indexItem74'].priceInfo.linePrice.value' >> track-priceValue.txt
echo $curl74 | jq '.data.guestOrder.groups_2101['$indexOrder74'].deliveryAddress.fullName' >> track-fullName.txt
echo $curl74 | jq '.data.guestOrder.groups_2101['$indexOrder74'].deliveryAddress.address.addressString' >> track-address.txt
echo $curl74 | jq '.data.guestOrder.groups_2101['$indexOrder74'].status.message.parts[].text' >> track-status.txt
echo $curl74 | jq '.data.guestOrder.groups_2101['$indexOrder74'].shipment.trackingNumber' >> track-number.txt
echo $curl74 | jq '.data.guestOrder.groups_2101['$indexOrder74'].shipment.trackingUrl' >> track-url.txt
fi

curl75=`curl 'https://www.walmart.com/orchestra/home/graphql' \
  -H 'authority: www.walmart.com' \
  -H 'sec-ch-ua: " Not A;Brand";v="99", "Chromium";v="96", "Microsoft Edge";v="96"' \
  -H 'x-o-platform: rweb' \
  -H 'dnt: 1' \
  -H 'x-o-correlation-id: wrvYiSFTlAmd8j7a8DDmpuyOpCN_heAnwM3v' \
  -H 'device_profile_ref_id: _s1F3NO8Y2JjaBUKPDcY4iFDWiIl9CyqiJjf' \
  -H 'x-latency-trace: 1' \
  -H 'wm_mp: true' \
  -H 'x-o-market: us' \
  -H 'x-o-platform-version: main-253-ebbb47' \
  -H 'x-o-gql-query: query getGuestOrder' \
  -H 'wm_page_url: https://www.walmart.com/orders' \
  -H 'x-apollo-operation-name: getGuestOrder' \
  -H 'sec-ch-ua-platform: "macOS"' \
  -H 'sec-ch-ua-mobile: ?0' \
  -H 'user-agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/96.0.4664.110 Safari/537.36 Edg/96.0.1054.62' \
  -H 'x-o-segment: oaoh' \
  -H 'content-type: application/json' \
  -H 'accept: application/json' \
  -H 'x-enable-server-timing: 1' \
  -H 'x-o-ccm: server' \
  -H 'wm_qos.correlation_id: wrvYiSFTlAmd8j7a8DDmpuyOpCN_heAnwM3v' \
  -H 'origin: https://www.walmart.com' \
  -H 'sec-fetch-site: same-origin' \
  -H 'sec-fetch-mode: cors' \
  -H 'sec-fetch-dest: empty' \
  -H 'referer: https://www.walmart.com/orders' \
  -H 'accept-language: vi' \
  --data-raw $'{"query":"query getGuestOrder($orderId:ID\u0021 $emailAddress:String\u0021){guestOrder(input:{id:$orderId emailAddress:$emailAddress}){...OrderFieldsFragment}}fragment cancelReason on OrderCancelReason{__typename subReasonCode subDescription}fragment priceDetailFragment on OrderPriceDetailRow{label value displayValue info{title message}rowInfo{...orderPriceDetailRowInfo}}fragment orderPriceDetailRowInfo on OrderPriceDetailRowInfo{title message{...textFragment}}fragment price on Price{displayValue value}fragment variants on MapEntry{name value}fragment OrderAddOn on OrderAddOn{lineId uniqueLineId productInfo{name usItemId offerId}quantityString quantityLabel type fulfillmentInstructions{...textFragment}actions{manageProtectionPlan{...orderActionFragment}cancel}priceInfo{linePrice{...price}}quantity isActive}fragment orderDonationDetails on OrderDonationDetails{message{...textFragment}emailReceipt emailReceiptToken status{...textFragment}errorStatus}fragment orderLineItem on OrderLineItem{id uniqueId actions{contactSeller cancel addToCart configureCake reviewItem resendEGiftCardToken protectionPlan{...orderActionFragment}manageProtectionPlan{...orderActionFragment}}isGift digitalDeliveryMessage quantity quantityString quantityLabel isSubstitutionSelected fulfilledItems{id quantityString priceInfo{itemPrice{value}}product{usItemId name}}isReturnable returnEligibilityMessage product{name usItemId imageInfo{thumbnailUrl}canonicalUrl offerId sellerId sellerName hasSellerBadge seller{sellerId name}orderLimit orderMinLimit weightIncrement salesUnit salesUnitType isSubstitutionEligible isAlcohol}reshop{reshopMessage isShippingAvailable minPromiseDate maxPromiseDate}selectedVariants{...variants}variantAdditionalInfo{parts{text nativeAction}}priceInfo{priceDisplayCodes{showItemPrice priceDisplayCondition finalCostByWeight}itemPrice{...price}linePrice{...price}unitPrice{...price}preDiscountedLinePrice{...price}additionalLines{name value}}discounts{label labelText{...textFragment}}itemReviewed activationCodes{label code}protectionPlanMessage{...textFragment}showSeller isShippedByWalmart seller{id name isPro}digitalDeliveryPhoneNumber addOns{...OrderAddOn}multiboxBundleId}fragment DriverFragment on Driver{id firstName photoUrl}fragment OrderGroupFragment on OrderGroup{driver{...DriverFragment}deliveryDate fulfillmentType status{...OrderGroupStatusFragment}showSeller isShippedByWalmart seller{...SellerFragment}id itemCount items{...LiteLineItemFragment}pickupPerson{firstName lastName email}accessPointId shipment{...ShipmentFragment}returnEligibilityMessage actions{...OrderGroupActionsFragment}recipientEmailAddress digitalDelivery{...DigitalDeliveryFragment}tireInstallationReservation{status extraText}}fragment OrderGroupStatusFragment on OrderGroupStatus{statusType showStatusTracker statusTracker{status label isCurrent}message{...textFragment}subtext subMessage{...textFragment}notice helpCenterText{...textFragment}}fragment textFragment on Text{parts{bold url text nativeAction lineBreak}}fragment LiteLineItemFragment on OrderLineItem{id quantity product{name usItemId imageInfo{thumbnailUrl}offerId isAlcohol}priceInfo{linePrice{...price}}}fragment SellerFragment on GroupSeller{id name isPro}fragment DigitalDeliveryFragment on DigitalDelivery{title name instructions{...textFragment}}fragment ShipmentFragment on Shipment{id trackingNumber isExternalTracking trackingUrl proofOfDelivery{photoUrl photoPreviewUrl showPreview}}fragment OrderGroupActionsFragment on OrderGroupActions{reorder edit track changeSlot checkin editDeliveryInstructions editPickupPerson editTip tip cancel enableTip{...orderActionFragment}enableEdit{...orderActionFragment}rescheduleTireInstall{...orderActionFragment}cancelTireInstall{...orderActionFragment}help viewCancellationDetails{...cancellationDetailsActionFragment}}fragment cancellationDetailsActionFragment on CancellationDetailsAction{label heading text{...textFragment}}fragment ODPGroupCategoryFragment on OrderCategory{type name subtext returnMessage substitutionsBanner{...textFragment}showExtendedSubstitutions actions{substitutions{message label type}nilPickReshop{message action{text url}}returnDetails viewCancellationDetails{...cancellationDetailsActionFragment}trackOnInHomeApp}banner{...textFragment}accordionState items{...orderLineItem}substitutions{...orderLineItem fulfilledItems{...orderLineItem}}returnInfo{...returnInfoFragment}}fragment ODPGroupFragment on OrderGroup{id fulfillmentType deliveryMessage deliveryAddress{fullName firstName lastName address{...addressFragment}}deliveryInstructions{text type typeText}deliveryPreferences{text{...textFragment}cta{...orderActionFragment}}editSubstitutionsCutOff status{statusType showStatusTracker message{...textFragment}notice helpCenterText{...textFragment}}itemCount isCategorized categories{...ODPGroupCategoryFragment}seller{id name isPro}shipment{id trackingNumber}actions{reorder edit track changeSlot checkin editDeliveryInstructions editPickupPerson tip cancel help enableTip{...orderActionFragment}enableEdit{...orderActionFragment}viewCancellationDetails{...cancellationDetailsActionFragment}enableInHome{...orderActionFragment}createGiftReceipt}cutOffTimestamp isEditSubstitutionsEligible isInHome giftDetails{recipientAddress{fullName}recipientEmail senderName giftMessage}donationDetails{...orderDonationDetails}}fragment returnInfoFragment on ReturnInfo{returnOrderId type refundPriceDetails{__typename...refundPriceDetailsFragment}refundMessage tierRefundMessage paymentMethods{__typename description cardType paymentType displayValues message{...textFragment}}actions{__typename generate scheduleOrModifyPickup{text url}reschedulePickup editPickupContact}shippingLabelUrl qrCodeImageUrl carriers{__typename id name}pickupCarrier pickupContact{nameAndAddress{fullName firstName lastName address{addressString city state postalCode addressLineOne addressLineTwo country}}phone}pickupConfirmationNumber bannerMessage{...textFragment}}fragment refundPriceDetailsFragment on RefundPriceDetails{subTotal{__typename...orderPriceDetailRowFragment}fees{__typename...orderPriceDetailRowFragment}discounts{__typename...orderPriceDetailRowFragment}taxTotal{__typename...orderPriceDetailRowFragment}grandTotal{__typename...orderPriceDetailRowFragment}}fragment orderPriceDetailRowFragment on OrderPriceDetailRow{label displayValue value info{__typename title message}}fragment addressFragment on OrderAddress{addressString addressLineOne addressLineTwo state postalCode city}fragment ODPPickupInfo on OrderGroup{pickupInstructions pickupPerson{...person}alternatePickupPerson{...person}store{id name address{...addressFragment}}}fragment person on OrderPickupPerson{firstName lastName email}fragment ODPTippingInfo on OrderGroup{addTipMessage{...textFragment}driver{...DriverFragment}tipping{min{...price}max{...price}suggested{...price}preselected}subtotal{...price}}fragment orderActionFragment on Action{text url}fragment orderCustomer on OrderCustomer{id firstName lastName email isGuest isEmailRegistered}fragment OrderFieldsFragment on Order{__typename id version type customer{...orderCustomer}displayId idBarcodeImageUrl(barWidth:3 barHeight:100) isFuelPurchase title shortTitle timezone tippableGroup{...OrderGroupFragment}amendableGroup{id changeSlotIterationsLeft cutOffTimestamp fulfillmentType deliveryAddress{fullName firstName lastName address{addressString addressLineOne addressLineTwo state postalCode city country}}isAmendInProgress}substitutionsBanner{heading subheading longSubheading}groups_2101{__typename...OrderGroupFragment...ODPGroupFragment...ODPPickupInfo...ODPTippingInfo}multiboxBundles{...orderLineItem}itemCancelReasons{__typename...cancelReason}groupCancelReasons{__typename...cancelReason}priceDetails{__typename subTotal{__typename...priceDetailFragment}taxTotal{__typename...priceDetailFragment}grandTotal{__typename...priceDetailFragment}authorizationAmount{__typename...priceDetailFragment}fees{__typename...priceDetailFragment}discounts{__typename...priceDetailFragment}minimumThreshold{__typename...price}belowMinimumFee{__typename...priceDetailFragment}driverTip{__typename...priceDetailFragment}donations{__typename...priceDetailFragment}}paymentMethods{__typename description cardType paymentType displayValues message{...textFragment}actions{connectToCapitalOne{...orderActionFragment}visitAffirm{...orderActionFragment}}}actions{__typename return pendingReturn cancel startReturn{...orderActionFragment}reorder}banners{...textFragment}}","variables":{"orderId":"2822231425239","emailAddress":"mchev08@yahoo.com"}}' \
  --compressed`
 
for (( i=0; i<=4; i++ ))
do
  if [[ $curl75 =~ "error"  || $curl75 =~ "blocked" ]]; then
    echo "Lỗi email số 75"
    indexOrder75=`echo error`
    break
  elif [[ `echo $curl75 | jq '.data.guestOrder.groups_2101['${i[@]}'].items[0].product.usItemId'` == '"480863972"' ]]; then
    indexOrder75=`echo $i`
    indexItem75=`echo 0`
  elif [[ `echo $curl75 | jq '.data.guestOrder.groups_2101['${i[@]}'].items[1].product.usItemId'` == '"480863972"' ]]; then
    indexOrder75=`echo $i`
    indexItem75=`echo 1`
  elif [[ `echo $curl75 | jq '.data.guestOrder.groups_2101['${i[@]}'].items[2].product.usItemId'` == '"480863972"' ]]; then
    indexOrder75=`echo $i`
    indexItem75=`echo 2`
  elif [[ `echo $curl75 | jq '.data.guestOrder.groups_2101['${i[@]}'].items[3].product.usItemId'` == '"480863972"' ]]; then
    indexOrder75=`echo $i`
    indexItem75=`echo 3`
  fi
done

if [[ $indexOrder75 != "error" ]]; then
echo $curl75 | jq '.data.guestOrder.id' >> track-OrderID.txt
echo $curl75 | jq '.data.guestOrder.customer.email' >> track-email.txt
echo $curl75 | jq '.data.guestOrder.groups_2101['$indexOrder75'].items['$indexItem75'].product.usItemId' >> track-usItemId.txt
echo $curl75 | jq '.data.guestOrder.groups_2101['$indexOrder75'].items['$indexItem75'].priceInfo.linePrice.value' >> track-priceValue.txt
echo $curl75 | jq '.data.guestOrder.groups_2101['$indexOrder75'].deliveryAddress.fullName' >> track-fullName.txt
echo $curl75 | jq '.data.guestOrder.groups_2101['$indexOrder75'].deliveryAddress.address.addressString' >> track-address.txt
echo $curl75 | jq '.data.guestOrder.groups_2101['$indexOrder75'].status.message.parts[].text' >> track-status.txt
echo $curl75 | jq '.data.guestOrder.groups_2101['$indexOrder75'].shipment.trackingNumber' >> track-number.txt
echo $curl75 | jq '.data.guestOrder.groups_2101['$indexOrder75'].shipment.trackingUrl' >> track-url.txt
fi

curl76=`curl 'https://www.walmart.com/orchestra/home/graphql' \
  -H 'authority: www.walmart.com' \
  -H 'sec-ch-ua: " Not A;Brand";v="99", "Chromium";v="96", "Microsoft Edge";v="96"' \
  -H 'x-o-platform: rweb' \
  -H 'dnt: 1' \
  -H 'x-o-correlation-id: wrvYiSFTlAmd8j7a8DDmpuyOpCN_heAnwM3v' \
  -H 'device_profile_ref_id: _s1F3NO8Y2JjaBUKPDcY4iFDWiIl9CyqiJjf' \
  -H 'x-latency-trace: 1' \
  -H 'wm_mp: true' \
  -H 'x-o-market: us' \
  -H 'x-o-platform-version: main-253-ebbb47' \
  -H 'x-o-gql-query: query getGuestOrder' \
  -H 'wm_page_url: https://www.walmart.com/orders' \
  -H 'x-apollo-operation-name: getGuestOrder' \
  -H 'sec-ch-ua-platform: "macOS"' \
  -H 'sec-ch-ua-mobile: ?0' \
  -H 'user-agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/96.0.4664.110 Safari/537.36 Edg/96.0.1054.62' \
  -H 'x-o-segment: oaoh' \
  -H 'content-type: application/json' \
  -H 'accept: application/json' \
  -H 'x-enable-server-timing: 1' \
  -H 'x-o-ccm: server' \
  -H 'wm_qos.correlation_id: wrvYiSFTlAmd8j7a8DDmpuyOpCN_heAnwM3v' \
  -H 'origin: https://www.walmart.com' \
  -H 'sec-fetch-site: same-origin' \
  -H 'sec-fetch-mode: cors' \
  -H 'sec-fetch-dest: empty' \
  -H 'referer: https://www.walmart.com/orders' \
  -H 'accept-language: vi' \
  --data-raw $'{"query":"query getGuestOrder($orderId:ID\u0021 $emailAddress:String\u0021){guestOrder(input:{id:$orderId emailAddress:$emailAddress}){...OrderFieldsFragment}}fragment cancelReason on OrderCancelReason{__typename subReasonCode subDescription}fragment priceDetailFragment on OrderPriceDetailRow{label value displayValue info{title message}rowInfo{...orderPriceDetailRowInfo}}fragment orderPriceDetailRowInfo on OrderPriceDetailRowInfo{title message{...textFragment}}fragment price on Price{displayValue value}fragment variants on MapEntry{name value}fragment OrderAddOn on OrderAddOn{lineId uniqueLineId productInfo{name usItemId offerId}quantityString quantityLabel type fulfillmentInstructions{...textFragment}actions{manageProtectionPlan{...orderActionFragment}cancel}priceInfo{linePrice{...price}}quantity isActive}fragment orderDonationDetails on OrderDonationDetails{message{...textFragment}emailReceipt emailReceiptToken status{...textFragment}errorStatus}fragment orderLineItem on OrderLineItem{id uniqueId actions{contactSeller cancel addToCart configureCake reviewItem resendEGiftCardToken protectionPlan{...orderActionFragment}manageProtectionPlan{...orderActionFragment}}isGift digitalDeliveryMessage quantity quantityString quantityLabel isSubstitutionSelected fulfilledItems{id quantityString priceInfo{itemPrice{value}}product{usItemId name}}isReturnable returnEligibilityMessage product{name usItemId imageInfo{thumbnailUrl}canonicalUrl offerId sellerId sellerName hasSellerBadge seller{sellerId name}orderLimit orderMinLimit weightIncrement salesUnit salesUnitType isSubstitutionEligible isAlcohol}reshop{reshopMessage isShippingAvailable minPromiseDate maxPromiseDate}selectedVariants{...variants}variantAdditionalInfo{parts{text nativeAction}}priceInfo{priceDisplayCodes{showItemPrice priceDisplayCondition finalCostByWeight}itemPrice{...price}linePrice{...price}unitPrice{...price}preDiscountedLinePrice{...price}additionalLines{name value}}discounts{label labelText{...textFragment}}itemReviewed activationCodes{label code}protectionPlanMessage{...textFragment}showSeller isShippedByWalmart seller{id name isPro}digitalDeliveryPhoneNumber addOns{...OrderAddOn}multiboxBundleId}fragment DriverFragment on Driver{id firstName photoUrl}fragment OrderGroupFragment on OrderGroup{driver{...DriverFragment}deliveryDate fulfillmentType status{...OrderGroupStatusFragment}showSeller isShippedByWalmart seller{...SellerFragment}id itemCount items{...LiteLineItemFragment}pickupPerson{firstName lastName email}accessPointId shipment{...ShipmentFragment}returnEligibilityMessage actions{...OrderGroupActionsFragment}recipientEmailAddress digitalDelivery{...DigitalDeliveryFragment}tireInstallationReservation{status extraText}}fragment OrderGroupStatusFragment on OrderGroupStatus{statusType showStatusTracker statusTracker{status label isCurrent}message{...textFragment}subtext subMessage{...textFragment}notice helpCenterText{...textFragment}}fragment textFragment on Text{parts{bold url text nativeAction lineBreak}}fragment LiteLineItemFragment on OrderLineItem{id quantity product{name usItemId imageInfo{thumbnailUrl}offerId isAlcohol}priceInfo{linePrice{...price}}}fragment SellerFragment on GroupSeller{id name isPro}fragment DigitalDeliveryFragment on DigitalDelivery{title name instructions{...textFragment}}fragment ShipmentFragment on Shipment{id trackingNumber isExternalTracking trackingUrl proofOfDelivery{photoUrl photoPreviewUrl showPreview}}fragment OrderGroupActionsFragment on OrderGroupActions{reorder edit track changeSlot checkin editDeliveryInstructions editPickupPerson editTip tip cancel enableTip{...orderActionFragment}enableEdit{...orderActionFragment}rescheduleTireInstall{...orderActionFragment}cancelTireInstall{...orderActionFragment}help viewCancellationDetails{...cancellationDetailsActionFragment}}fragment cancellationDetailsActionFragment on CancellationDetailsAction{label heading text{...textFragment}}fragment ODPGroupCategoryFragment on OrderCategory{type name subtext returnMessage substitutionsBanner{...textFragment}showExtendedSubstitutions actions{substitutions{message label type}nilPickReshop{message action{text url}}returnDetails viewCancellationDetails{...cancellationDetailsActionFragment}trackOnInHomeApp}banner{...textFragment}accordionState items{...orderLineItem}substitutions{...orderLineItem fulfilledItems{...orderLineItem}}returnInfo{...returnInfoFragment}}fragment ODPGroupFragment on OrderGroup{id fulfillmentType deliveryMessage deliveryAddress{fullName firstName lastName address{...addressFragment}}deliveryInstructions{text type typeText}deliveryPreferences{text{...textFragment}cta{...orderActionFragment}}editSubstitutionsCutOff status{statusType showStatusTracker message{...textFragment}notice helpCenterText{...textFragment}}itemCount isCategorized categories{...ODPGroupCategoryFragment}seller{id name isPro}shipment{id trackingNumber}actions{reorder edit track changeSlot checkin editDeliveryInstructions editPickupPerson tip cancel help enableTip{...orderActionFragment}enableEdit{...orderActionFragment}viewCancellationDetails{...cancellationDetailsActionFragment}enableInHome{...orderActionFragment}createGiftReceipt}cutOffTimestamp isEditSubstitutionsEligible isInHome giftDetails{recipientAddress{fullName}recipientEmail senderName giftMessage}donationDetails{...orderDonationDetails}}fragment returnInfoFragment on ReturnInfo{returnOrderId type refundPriceDetails{__typename...refundPriceDetailsFragment}refundMessage tierRefundMessage paymentMethods{__typename description cardType paymentType displayValues message{...textFragment}}actions{__typename generate scheduleOrModifyPickup{text url}reschedulePickup editPickupContact}shippingLabelUrl qrCodeImageUrl carriers{__typename id name}pickupCarrier pickupContact{nameAndAddress{fullName firstName lastName address{addressString city state postalCode addressLineOne addressLineTwo country}}phone}pickupConfirmationNumber bannerMessage{...textFragment}}fragment refundPriceDetailsFragment on RefundPriceDetails{subTotal{__typename...orderPriceDetailRowFragment}fees{__typename...orderPriceDetailRowFragment}discounts{__typename...orderPriceDetailRowFragment}taxTotal{__typename...orderPriceDetailRowFragment}grandTotal{__typename...orderPriceDetailRowFragment}}fragment orderPriceDetailRowFragment on OrderPriceDetailRow{label displayValue value info{__typename title message}}fragment addressFragment on OrderAddress{addressString addressLineOne addressLineTwo state postalCode city}fragment ODPPickupInfo on OrderGroup{pickupInstructions pickupPerson{...person}alternatePickupPerson{...person}store{id name address{...addressFragment}}}fragment person on OrderPickupPerson{firstName lastName email}fragment ODPTippingInfo on OrderGroup{addTipMessage{...textFragment}driver{...DriverFragment}tipping{min{...price}max{...price}suggested{...price}preselected}subtotal{...price}}fragment orderActionFragment on Action{text url}fragment orderCustomer on OrderCustomer{id firstName lastName email isGuest isEmailRegistered}fragment OrderFieldsFragment on Order{__typename id version type customer{...orderCustomer}displayId idBarcodeImageUrl(barWidth:3 barHeight:100) isFuelPurchase title shortTitle timezone tippableGroup{...OrderGroupFragment}amendableGroup{id changeSlotIterationsLeft cutOffTimestamp fulfillmentType deliveryAddress{fullName firstName lastName address{addressString addressLineOne addressLineTwo state postalCode city country}}isAmendInProgress}substitutionsBanner{heading subheading longSubheading}groups_2101{__typename...OrderGroupFragment...ODPGroupFragment...ODPPickupInfo...ODPTippingInfo}multiboxBundles{...orderLineItem}itemCancelReasons{__typename...cancelReason}groupCancelReasons{__typename...cancelReason}priceDetails{__typename subTotal{__typename...priceDetailFragment}taxTotal{__typename...priceDetailFragment}grandTotal{__typename...priceDetailFragment}authorizationAmount{__typename...priceDetailFragment}fees{__typename...priceDetailFragment}discounts{__typename...priceDetailFragment}minimumThreshold{__typename...price}belowMinimumFee{__typename...priceDetailFragment}driverTip{__typename...priceDetailFragment}donations{__typename...priceDetailFragment}}paymentMethods{__typename description cardType paymentType displayValues message{...textFragment}actions{connectToCapitalOne{...orderActionFragment}visitAffirm{...orderActionFragment}}}actions{__typename return pendingReturn cancel startReturn{...orderActionFragment}reorder}banners{...textFragment}}","variables":{"orderId":"2832232752683","emailAddress":"montelltaylor12@gmail.com"}}' \
  --compressed`
 
for (( i=0; i<=4; i++ ))
do
  if [[ $curl76 =~ "error"  || $curl76 =~ "blocked" ]]; then
    echo "Lỗi email số 76"
    indexOrder76=`echo error`
    break
  elif [[ `echo $curl76 | jq '.data.guestOrder.groups_2101['${i[@]}'].items[0].product.usItemId'` == '"251382558"' ]]; then
    indexOrder76=`echo $i`
    indexItem76=`echo 0`
  elif [[ `echo $curl76 | jq '.data.guestOrder.groups_2101['${i[@]}'].items[1].product.usItemId'` == '"251382558"' ]]; then
    indexOrder76=`echo $i`
    indexItem76=`echo 1`
  elif [[ `echo $curl76 | jq '.data.guestOrder.groups_2101['${i[@]}'].items[2].product.usItemId'` == '"251382558"' ]]; then
    indexOrder76=`echo $i`
    indexItem76=`echo 2`
  elif [[ `echo $curl76 | jq '.data.guestOrder.groups_2101['${i[@]}'].items[3].product.usItemId'` == '"251382558"' ]]; then
    indexOrder76=`echo $i`
    indexItem76=`echo 3`
  fi
done

if [[ $indexOrder76 != "error" ]]; then
echo $curl76 | jq '.data.guestOrder.id' >> track-OrderID.txt
echo $curl76 | jq '.data.guestOrder.customer.email' >> track-email.txt
echo $curl76 | jq '.data.guestOrder.groups_2101['$indexOrder76'].items['$indexItem76'].product.usItemId' >> track-usItemId.txt
echo $curl76 | jq '.data.guestOrder.groups_2101['$indexOrder76'].items['$indexItem76'].priceInfo.linePrice.value' >> track-priceValue.txt
echo $curl76 | jq '.data.guestOrder.groups_2101['$indexOrder76'].deliveryAddress.fullName' >> track-fullName.txt
echo $curl76 | jq '.data.guestOrder.groups_2101['$indexOrder76'].deliveryAddress.address.addressString' >> track-address.txt
echo $curl76 | jq '.data.guestOrder.groups_2101['$indexOrder76'].status.message.parts[].text' >> track-status.txt
echo $curl76 | jq '.data.guestOrder.groups_2101['$indexOrder76'].shipment.trackingNumber' >> track-number.txt
echo $curl76 | jq '.data.guestOrder.groups_2101['$indexOrder76'].shipment.trackingUrl' >> track-url.txt
fi

curl77=`curl 'https://www.walmart.com/orchestra/home/graphql' \
  -H 'authority: www.walmart.com' \
  -H 'sec-ch-ua: " Not A;Brand";v="99", "Chromium";v="96", "Microsoft Edge";v="96"' \
  -H 'x-o-platform: rweb' \
  -H 'dnt: 1' \
  -H 'x-o-correlation-id: wrvYiSFTlAmd8j7a8DDmpuyOpCN_heAnwM3v' \
  -H 'device_profile_ref_id: _s1F3NO8Y2JjaBUKPDcY4iFDWiIl9CyqiJjf' \
  -H 'x-latency-trace: 1' \
  -H 'wm_mp: true' \
  -H 'x-o-market: us' \
  -H 'x-o-platform-version: main-253-ebbb47' \
  -H 'x-o-gql-query: query getGuestOrder' \
  -H 'wm_page_url: https://www.walmart.com/orders' \
  -H 'x-apollo-operation-name: getGuestOrder' \
  -H 'sec-ch-ua-platform: "macOS"' \
  -H 'sec-ch-ua-mobile: ?0' \
  -H 'user-agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/96.0.4664.110 Safari/537.36 Edg/96.0.1054.62' \
  -H 'x-o-segment: oaoh' \
  -H 'content-type: application/json' \
  -H 'accept: application/json' \
  -H 'x-enable-server-timing: 1' \
  -H 'x-o-ccm: server' \
  -H 'wm_qos.correlation_id: wrvYiSFTlAmd8j7a8DDmpuyOpCN_heAnwM3v' \
  -H 'origin: https://www.walmart.com' \
  -H 'sec-fetch-site: same-origin' \
  -H 'sec-fetch-mode: cors' \
  -H 'sec-fetch-dest: empty' \
  -H 'referer: https://www.walmart.com/orders' \
  -H 'accept-language: vi' \
  --data-raw $'{"query":"query getGuestOrder($orderId:ID\u0021 $emailAddress:String\u0021){guestOrder(input:{id:$orderId emailAddress:$emailAddress}){...OrderFieldsFragment}}fragment cancelReason on OrderCancelReason{__typename subReasonCode subDescription}fragment priceDetailFragment on OrderPriceDetailRow{label value displayValue info{title message}rowInfo{...orderPriceDetailRowInfo}}fragment orderPriceDetailRowInfo on OrderPriceDetailRowInfo{title message{...textFragment}}fragment price on Price{displayValue value}fragment variants on MapEntry{name value}fragment OrderAddOn on OrderAddOn{lineId uniqueLineId productInfo{name usItemId offerId}quantityString quantityLabel type fulfillmentInstructions{...textFragment}actions{manageProtectionPlan{...orderActionFragment}cancel}priceInfo{linePrice{...price}}quantity isActive}fragment orderDonationDetails on OrderDonationDetails{message{...textFragment}emailReceipt emailReceiptToken status{...textFragment}errorStatus}fragment orderLineItem on OrderLineItem{id uniqueId actions{contactSeller cancel addToCart configureCake reviewItem resendEGiftCardToken protectionPlan{...orderActionFragment}manageProtectionPlan{...orderActionFragment}}isGift digitalDeliveryMessage quantity quantityString quantityLabel isSubstitutionSelected fulfilledItems{id quantityString priceInfo{itemPrice{value}}product{usItemId name}}isReturnable returnEligibilityMessage product{name usItemId imageInfo{thumbnailUrl}canonicalUrl offerId sellerId sellerName hasSellerBadge seller{sellerId name}orderLimit orderMinLimit weightIncrement salesUnit salesUnitType isSubstitutionEligible isAlcohol}reshop{reshopMessage isShippingAvailable minPromiseDate maxPromiseDate}selectedVariants{...variants}variantAdditionalInfo{parts{text nativeAction}}priceInfo{priceDisplayCodes{showItemPrice priceDisplayCondition finalCostByWeight}itemPrice{...price}linePrice{...price}unitPrice{...price}preDiscountedLinePrice{...price}additionalLines{name value}}discounts{label labelText{...textFragment}}itemReviewed activationCodes{label code}protectionPlanMessage{...textFragment}showSeller isShippedByWalmart seller{id name isPro}digitalDeliveryPhoneNumber addOns{...OrderAddOn}multiboxBundleId}fragment DriverFragment on Driver{id firstName photoUrl}fragment OrderGroupFragment on OrderGroup{driver{...DriverFragment}deliveryDate fulfillmentType status{...OrderGroupStatusFragment}showSeller isShippedByWalmart seller{...SellerFragment}id itemCount items{...LiteLineItemFragment}pickupPerson{firstName lastName email}accessPointId shipment{...ShipmentFragment}returnEligibilityMessage actions{...OrderGroupActionsFragment}recipientEmailAddress digitalDelivery{...DigitalDeliveryFragment}tireInstallationReservation{status extraText}}fragment OrderGroupStatusFragment on OrderGroupStatus{statusType showStatusTracker statusTracker{status label isCurrent}message{...textFragment}subtext subMessage{...textFragment}notice helpCenterText{...textFragment}}fragment textFragment on Text{parts{bold url text nativeAction lineBreak}}fragment LiteLineItemFragment on OrderLineItem{id quantity product{name usItemId imageInfo{thumbnailUrl}offerId isAlcohol}priceInfo{linePrice{...price}}}fragment SellerFragment on GroupSeller{id name isPro}fragment DigitalDeliveryFragment on DigitalDelivery{title name instructions{...textFragment}}fragment ShipmentFragment on Shipment{id trackingNumber isExternalTracking trackingUrl proofOfDelivery{photoUrl photoPreviewUrl showPreview}}fragment OrderGroupActionsFragment on OrderGroupActions{reorder edit track changeSlot checkin editDeliveryInstructions editPickupPerson editTip tip cancel enableTip{...orderActionFragment}enableEdit{...orderActionFragment}rescheduleTireInstall{...orderActionFragment}cancelTireInstall{...orderActionFragment}help viewCancellationDetails{...cancellationDetailsActionFragment}}fragment cancellationDetailsActionFragment on CancellationDetailsAction{label heading text{...textFragment}}fragment ODPGroupCategoryFragment on OrderCategory{type name subtext returnMessage substitutionsBanner{...textFragment}showExtendedSubstitutions actions{substitutions{message label type}nilPickReshop{message action{text url}}returnDetails viewCancellationDetails{...cancellationDetailsActionFragment}trackOnInHomeApp}banner{...textFragment}accordionState items{...orderLineItem}substitutions{...orderLineItem fulfilledItems{...orderLineItem}}returnInfo{...returnInfoFragment}}fragment ODPGroupFragment on OrderGroup{id fulfillmentType deliveryMessage deliveryAddress{fullName firstName lastName address{...addressFragment}}deliveryInstructions{text type typeText}deliveryPreferences{text{...textFragment}cta{...orderActionFragment}}editSubstitutionsCutOff status{statusType showStatusTracker message{...textFragment}notice helpCenterText{...textFragment}}itemCount isCategorized categories{...ODPGroupCategoryFragment}seller{id name isPro}shipment{id trackingNumber}actions{reorder edit track changeSlot checkin editDeliveryInstructions editPickupPerson tip cancel help enableTip{...orderActionFragment}enableEdit{...orderActionFragment}viewCancellationDetails{...cancellationDetailsActionFragment}enableInHome{...orderActionFragment}createGiftReceipt}cutOffTimestamp isEditSubstitutionsEligible isInHome giftDetails{recipientAddress{fullName}recipientEmail senderName giftMessage}donationDetails{...orderDonationDetails}}fragment returnInfoFragment on ReturnInfo{returnOrderId type refundPriceDetails{__typename...refundPriceDetailsFragment}refundMessage tierRefundMessage paymentMethods{__typename description cardType paymentType displayValues message{...textFragment}}actions{__typename generate scheduleOrModifyPickup{text url}reschedulePickup editPickupContact}shippingLabelUrl qrCodeImageUrl carriers{__typename id name}pickupCarrier pickupContact{nameAndAddress{fullName firstName lastName address{addressString city state postalCode addressLineOne addressLineTwo country}}phone}pickupConfirmationNumber bannerMessage{...textFragment}}fragment refundPriceDetailsFragment on RefundPriceDetails{subTotal{__typename...orderPriceDetailRowFragment}fees{__typename...orderPriceDetailRowFragment}discounts{__typename...orderPriceDetailRowFragment}taxTotal{__typename...orderPriceDetailRowFragment}grandTotal{__typename...orderPriceDetailRowFragment}}fragment orderPriceDetailRowFragment on OrderPriceDetailRow{label displayValue value info{__typename title message}}fragment addressFragment on OrderAddress{addressString addressLineOne addressLineTwo state postalCode city}fragment ODPPickupInfo on OrderGroup{pickupInstructions pickupPerson{...person}alternatePickupPerson{...person}store{id name address{...addressFragment}}}fragment person on OrderPickupPerson{firstName lastName email}fragment ODPTippingInfo on OrderGroup{addTipMessage{...textFragment}driver{...DriverFragment}tipping{min{...price}max{...price}suggested{...price}preselected}subtotal{...price}}fragment orderActionFragment on Action{text url}fragment orderCustomer on OrderCustomer{id firstName lastName email isGuest isEmailRegistered}fragment OrderFieldsFragment on Order{__typename id version type customer{...orderCustomer}displayId idBarcodeImageUrl(barWidth:3 barHeight:100) isFuelPurchase title shortTitle timezone tippableGroup{...OrderGroupFragment}amendableGroup{id changeSlotIterationsLeft cutOffTimestamp fulfillmentType deliveryAddress{fullName firstName lastName address{addressString addressLineOne addressLineTwo state postalCode city country}}isAmendInProgress}substitutionsBanner{heading subheading longSubheading}groups_2101{__typename...OrderGroupFragment...ODPGroupFragment...ODPPickupInfo...ODPTippingInfo}multiboxBundles{...orderLineItem}itemCancelReasons{__typename...cancelReason}groupCancelReasons{__typename...cancelReason}priceDetails{__typename subTotal{__typename...priceDetailFragment}taxTotal{__typename...priceDetailFragment}grandTotal{__typename...priceDetailFragment}authorizationAmount{__typename...priceDetailFragment}fees{__typename...priceDetailFragment}discounts{__typename...priceDetailFragment}minimumThreshold{__typename...price}belowMinimumFee{__typename...priceDetailFragment}driverTip{__typename...priceDetailFragment}donations{__typename...priceDetailFragment}}paymentMethods{__typename description cardType paymentType displayValues message{...textFragment}actions{connectToCapitalOne{...orderActionFragment}visitAffirm{...orderActionFragment}}}actions{__typename return pendingReturn cancel startReturn{...orderActionFragment}reorder}banners{...textFragment}}","variables":{"orderId":"2832232638511","emailAddress":"tamar.morales@gmail.com"}}' \
  --compressed`
 
for (( i=0; i<=4; i++ ))
do
  if [[ $curl77 =~ "error"  || $curl77 =~ "blocked" ]]; then
    echo "Lỗi email số 77"
    indexOrder77=`echo error`
    break
  elif [[ `echo $curl77 | jq '.data.guestOrder.groups_2101['${i[@]}'].items[0].product.usItemId'` == '"969841770"' ]]; then
    indexOrder77=`echo $i`
    indexItem77=`echo 0`
  elif [[ `echo $curl77 | jq '.data.guestOrder.groups_2101['${i[@]}'].items[1].product.usItemId'` == '"969841770"' ]]; then
    indexOrder77=`echo $i`
    indexItem77=`echo 1`
  elif [[ `echo $curl77 | jq '.data.guestOrder.groups_2101['${i[@]}'].items[2].product.usItemId'` == '"969841770"' ]]; then
    indexOrder77=`echo $i`
    indexItem77=`echo 2`
  elif [[ `echo $curl77 | jq '.data.guestOrder.groups_2101['${i[@]}'].items[3].product.usItemId'` == '"969841770"' ]]; then
    indexOrder77=`echo $i`
    indexItem77=`echo 3`
  fi
done

if [[ $indexOrder77 != "error" ]]; then
echo $curl77 | jq '.data.guestOrder.id' >> track-OrderID.txt
echo $curl77 | jq '.data.guestOrder.customer.email' >> track-email.txt
echo $curl77 | jq '.data.guestOrder.groups_2101['$indexOrder77'].items['$indexItem77'].product.usItemId' >> track-usItemId.txt
echo $curl77 | jq '.data.guestOrder.groups_2101['$indexOrder77'].items['$indexItem77'].priceInfo.linePrice.value' >> track-priceValue.txt
echo $curl77 | jq '.data.guestOrder.groups_2101['$indexOrder77'].deliveryAddress.fullName' >> track-fullName.txt
echo $curl77 | jq '.data.guestOrder.groups_2101['$indexOrder77'].deliveryAddress.address.addressString' >> track-address.txt
echo $curl77 | jq '.data.guestOrder.groups_2101['$indexOrder77'].status.message.parts[].text' >> track-status.txt
echo $curl77 | jq '.data.guestOrder.groups_2101['$indexOrder77'].shipment.trackingNumber' >> track-number.txt
echo $curl77 | jq '.data.guestOrder.groups_2101['$indexOrder77'].shipment.trackingUrl' >> track-url.txt
fi

curl78=`curl 'https://www.walmart.com/orchestra/home/graphql' \
  -H 'authority: www.walmart.com' \
  -H 'sec-ch-ua: " Not A;Brand";v="99", "Chromium";v="96", "Microsoft Edge";v="96"' \
  -H 'x-o-platform: rweb' \
  -H 'dnt: 1' \
  -H 'x-o-correlation-id: wrvYiSFTlAmd8j7a8DDmpuyOpCN_heAnwM3v' \
  -H 'device_profile_ref_id: _s1F3NO8Y2JjaBUKPDcY4iFDWiIl9CyqiJjf' \
  -H 'x-latency-trace: 1' \
  -H 'wm_mp: true' \
  -H 'x-o-market: us' \
  -H 'x-o-platform-version: main-253-ebbb47' \
  -H 'x-o-gql-query: query getGuestOrder' \
  -H 'wm_page_url: https://www.walmart.com/orders' \
  -H 'x-apollo-operation-name: getGuestOrder' \
  -H 'sec-ch-ua-platform: "macOS"' \
  -H 'sec-ch-ua-mobile: ?0' \
  -H 'user-agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/96.0.4664.110 Safari/537.36 Edg/96.0.1054.62' \
  -H 'x-o-segment: oaoh' \
  -H 'content-type: application/json' \
  -H 'accept: application/json' \
  -H 'x-enable-server-timing: 1' \
  -H 'x-o-ccm: server' \
  -H 'wm_qos.correlation_id: wrvYiSFTlAmd8j7a8DDmpuyOpCN_heAnwM3v' \
  -H 'origin: https://www.walmart.com' \
  -H 'sec-fetch-site: same-origin' \
  -H 'sec-fetch-mode: cors' \
  -H 'sec-fetch-dest: empty' \
  -H 'referer: https://www.walmart.com/orders' \
  -H 'accept-language: vi' \
  --data-raw $'{"query":"query getGuestOrder($orderId:ID\u0021 $emailAddress:String\u0021){guestOrder(input:{id:$orderId emailAddress:$emailAddress}){...OrderFieldsFragment}}fragment cancelReason on OrderCancelReason{__typename subReasonCode subDescription}fragment priceDetailFragment on OrderPriceDetailRow{label value displayValue info{title message}rowInfo{...orderPriceDetailRowInfo}}fragment orderPriceDetailRowInfo on OrderPriceDetailRowInfo{title message{...textFragment}}fragment price on Price{displayValue value}fragment variants on MapEntry{name value}fragment OrderAddOn on OrderAddOn{lineId uniqueLineId productInfo{name usItemId offerId}quantityString quantityLabel type fulfillmentInstructions{...textFragment}actions{manageProtectionPlan{...orderActionFragment}cancel}priceInfo{linePrice{...price}}quantity isActive}fragment orderDonationDetails on OrderDonationDetails{message{...textFragment}emailReceipt emailReceiptToken status{...textFragment}errorStatus}fragment orderLineItem on OrderLineItem{id uniqueId actions{contactSeller cancel addToCart configureCake reviewItem resendEGiftCardToken protectionPlan{...orderActionFragment}manageProtectionPlan{...orderActionFragment}}isGift digitalDeliveryMessage quantity quantityString quantityLabel isSubstitutionSelected fulfilledItems{id quantityString priceInfo{itemPrice{value}}product{usItemId name}}isReturnable returnEligibilityMessage product{name usItemId imageInfo{thumbnailUrl}canonicalUrl offerId sellerId sellerName hasSellerBadge seller{sellerId name}orderLimit orderMinLimit weightIncrement salesUnit salesUnitType isSubstitutionEligible isAlcohol}reshop{reshopMessage isShippingAvailable minPromiseDate maxPromiseDate}selectedVariants{...variants}variantAdditionalInfo{parts{text nativeAction}}priceInfo{priceDisplayCodes{showItemPrice priceDisplayCondition finalCostByWeight}itemPrice{...price}linePrice{...price}unitPrice{...price}preDiscountedLinePrice{...price}additionalLines{name value}}discounts{label labelText{...textFragment}}itemReviewed activationCodes{label code}protectionPlanMessage{...textFragment}showSeller isShippedByWalmart seller{id name isPro}digitalDeliveryPhoneNumber addOns{...OrderAddOn}multiboxBundleId}fragment DriverFragment on Driver{id firstName photoUrl}fragment OrderGroupFragment on OrderGroup{driver{...DriverFragment}deliveryDate fulfillmentType status{...OrderGroupStatusFragment}showSeller isShippedByWalmart seller{...SellerFragment}id itemCount items{...LiteLineItemFragment}pickupPerson{firstName lastName email}accessPointId shipment{...ShipmentFragment}returnEligibilityMessage actions{...OrderGroupActionsFragment}recipientEmailAddress digitalDelivery{...DigitalDeliveryFragment}tireInstallationReservation{status extraText}}fragment OrderGroupStatusFragment on OrderGroupStatus{statusType showStatusTracker statusTracker{status label isCurrent}message{...textFragment}subtext subMessage{...textFragment}notice helpCenterText{...textFragment}}fragment textFragment on Text{parts{bold url text nativeAction lineBreak}}fragment LiteLineItemFragment on OrderLineItem{id quantity product{name usItemId imageInfo{thumbnailUrl}offerId isAlcohol}priceInfo{linePrice{...price}}}fragment SellerFragment on GroupSeller{id name isPro}fragment DigitalDeliveryFragment on DigitalDelivery{title name instructions{...textFragment}}fragment ShipmentFragment on Shipment{id trackingNumber isExternalTracking trackingUrl proofOfDelivery{photoUrl photoPreviewUrl showPreview}}fragment OrderGroupActionsFragment on OrderGroupActions{reorder edit track changeSlot checkin editDeliveryInstructions editPickupPerson editTip tip cancel enableTip{...orderActionFragment}enableEdit{...orderActionFragment}rescheduleTireInstall{...orderActionFragment}cancelTireInstall{...orderActionFragment}help viewCancellationDetails{...cancellationDetailsActionFragment}}fragment cancellationDetailsActionFragment on CancellationDetailsAction{label heading text{...textFragment}}fragment ODPGroupCategoryFragment on OrderCategory{type name subtext returnMessage substitutionsBanner{...textFragment}showExtendedSubstitutions actions{substitutions{message label type}nilPickReshop{message action{text url}}returnDetails viewCancellationDetails{...cancellationDetailsActionFragment}trackOnInHomeApp}banner{...textFragment}accordionState items{...orderLineItem}substitutions{...orderLineItem fulfilledItems{...orderLineItem}}returnInfo{...returnInfoFragment}}fragment ODPGroupFragment on OrderGroup{id fulfillmentType deliveryMessage deliveryAddress{fullName firstName lastName address{...addressFragment}}deliveryInstructions{text type typeText}deliveryPreferences{text{...textFragment}cta{...orderActionFragment}}editSubstitutionsCutOff status{statusType showStatusTracker message{...textFragment}notice helpCenterText{...textFragment}}itemCount isCategorized categories{...ODPGroupCategoryFragment}seller{id name isPro}shipment{id trackingNumber}actions{reorder edit track changeSlot checkin editDeliveryInstructions editPickupPerson tip cancel help enableTip{...orderActionFragment}enableEdit{...orderActionFragment}viewCancellationDetails{...cancellationDetailsActionFragment}enableInHome{...orderActionFragment}createGiftReceipt}cutOffTimestamp isEditSubstitutionsEligible isInHome giftDetails{recipientAddress{fullName}recipientEmail senderName giftMessage}donationDetails{...orderDonationDetails}}fragment returnInfoFragment on ReturnInfo{returnOrderId type refundPriceDetails{__typename...refundPriceDetailsFragment}refundMessage tierRefundMessage paymentMethods{__typename description cardType paymentType displayValues message{...textFragment}}actions{__typename generate scheduleOrModifyPickup{text url}reschedulePickup editPickupContact}shippingLabelUrl qrCodeImageUrl carriers{__typename id name}pickupCarrier pickupContact{nameAndAddress{fullName firstName lastName address{addressString city state postalCode addressLineOne addressLineTwo country}}phone}pickupConfirmationNumber bannerMessage{...textFragment}}fragment refundPriceDetailsFragment on RefundPriceDetails{subTotal{__typename...orderPriceDetailRowFragment}fees{__typename...orderPriceDetailRowFragment}discounts{__typename...orderPriceDetailRowFragment}taxTotal{__typename...orderPriceDetailRowFragment}grandTotal{__typename...orderPriceDetailRowFragment}}fragment orderPriceDetailRowFragment on OrderPriceDetailRow{label displayValue value info{__typename title message}}fragment addressFragment on OrderAddress{addressString addressLineOne addressLineTwo state postalCode city}fragment ODPPickupInfo on OrderGroup{pickupInstructions pickupPerson{...person}alternatePickupPerson{...person}store{id name address{...addressFragment}}}fragment person on OrderPickupPerson{firstName lastName email}fragment ODPTippingInfo on OrderGroup{addTipMessage{...textFragment}driver{...DriverFragment}tipping{min{...price}max{...price}suggested{...price}preselected}subtotal{...price}}fragment orderActionFragment on Action{text url}fragment orderCustomer on OrderCustomer{id firstName lastName email isGuest isEmailRegistered}fragment OrderFieldsFragment on Order{__typename id version type customer{...orderCustomer}displayId idBarcodeImageUrl(barWidth:3 barHeight:100) isFuelPurchase title shortTitle timezone tippableGroup{...OrderGroupFragment}amendableGroup{id changeSlotIterationsLeft cutOffTimestamp fulfillmentType deliveryAddress{fullName firstName lastName address{addressString addressLineOne addressLineTwo state postalCode city country}}isAmendInProgress}substitutionsBanner{heading subheading longSubheading}groups_2101{__typename...OrderGroupFragment...ODPGroupFragment...ODPPickupInfo...ODPTippingInfo}multiboxBundles{...orderLineItem}itemCancelReasons{__typename...cancelReason}groupCancelReasons{__typename...cancelReason}priceDetails{__typename subTotal{__typename...priceDetailFragment}taxTotal{__typename...priceDetailFragment}grandTotal{__typename...priceDetailFragment}authorizationAmount{__typename...priceDetailFragment}fees{__typename...priceDetailFragment}discounts{__typename...priceDetailFragment}minimumThreshold{__typename...price}belowMinimumFee{__typename...priceDetailFragment}driverTip{__typename...priceDetailFragment}donations{__typename...priceDetailFragment}}paymentMethods{__typename description cardType paymentType displayValues message{...textFragment}actions{connectToCapitalOne{...orderActionFragment}visitAffirm{...orderActionFragment}}}actions{__typename return pendingReturn cancel startReturn{...orderActionFragment}reorder}banners{...textFragment}}","variables":{"orderId":"2832232750220","emailAddress":"kaselewallens@yahoo.com"}}' \
  --compressed`
 
for (( i=0; i<=4; i++ ))
do
  if [[ $curl78 =~ "error"  || $curl78 =~ "blocked" ]]; then
    echo "Lỗi email số 78"
    indexOrder78=`echo error`
    break
  elif [[ `echo $curl78 | jq '.data.guestOrder.groups_2101['${i[@]}'].items[0].product.usItemId'` == '"38444962"' ]]; then
    indexOrder78=`echo $i`
    indexItem78=`echo 0`
  elif [[ `echo $curl78 | jq '.data.guestOrder.groups_2101['${i[@]}'].items[1].product.usItemId'` == '"38444962"' ]]; then
    indexOrder78=`echo $i`
    indexItem78=`echo 1`
  elif [[ `echo $curl78 | jq '.data.guestOrder.groups_2101['${i[@]}'].items[2].product.usItemId'` == '"38444962"' ]]; then
    indexOrder78=`echo $i`
    indexItem78=`echo 2`
  elif [[ `echo $curl78 | jq '.data.guestOrder.groups_2101['${i[@]}'].items[3].product.usItemId'` == '"38444962"' ]]; then
    indexOrder78=`echo $i`
    indexItem78=`echo 3`
  fi
done

if [[ $indexOrder78 != "error" ]]; then
echo $curl78 | jq '.data.guestOrder.id' >> track-OrderID.txt
echo $curl78 | jq '.data.guestOrder.customer.email' >> track-email.txt
echo $curl78 | jq '.data.guestOrder.groups_2101['$indexOrder78'].items['$indexItem78'].product.usItemId' >> track-usItemId.txt
echo $curl78 | jq '.data.guestOrder.groups_2101['$indexOrder78'].items['$indexItem78'].priceInfo.linePrice.value' >> track-priceValue.txt
echo $curl78 | jq '.data.guestOrder.groups_2101['$indexOrder78'].deliveryAddress.fullName' >> track-fullName.txt
echo $curl78 | jq '.data.guestOrder.groups_2101['$indexOrder78'].deliveryAddress.address.addressString' >> track-address.txt
echo $curl78 | jq '.data.guestOrder.groups_2101['$indexOrder78'].status.message.parts[].text' >> track-status.txt
echo $curl78 | jq '.data.guestOrder.groups_2101['$indexOrder78'].shipment.trackingNumber' >> track-number.txt
echo $curl78 | jq '.data.guestOrder.groups_2101['$indexOrder78'].shipment.trackingUrl' >> track-url.txt
fi

curl79=`curl 'https://www.walmart.com/orchestra/home/graphql' \
  -H 'authority: www.walmart.com' \
  -H 'sec-ch-ua: " Not A;Brand";v="99", "Chromium";v="96", "Microsoft Edge";v="96"' \
  -H 'x-o-platform: rweb' \
  -H 'dnt: 1' \
  -H 'x-o-correlation-id: wrvYiSFTlAmd8j7a8DDmpuyOpCN_heAnwM3v' \
  -H 'device_profile_ref_id: _s1F3NO8Y2JjaBUKPDcY4iFDWiIl9CyqiJjf' \
  -H 'x-latency-trace: 1' \
  -H 'wm_mp: true' \
  -H 'x-o-market: us' \
  -H 'x-o-platform-version: main-253-ebbb47' \
  -H 'x-o-gql-query: query getGuestOrder' \
  -H 'wm_page_url: https://www.walmart.com/orders' \
  -H 'x-apollo-operation-name: getGuestOrder' \
  -H 'sec-ch-ua-platform: "macOS"' \
  -H 'sec-ch-ua-mobile: ?0' \
  -H 'user-agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/96.0.4664.110 Safari/537.36 Edg/96.0.1054.62' \
  -H 'x-o-segment: oaoh' \
  -H 'content-type: application/json' \
  -H 'accept: application/json' \
  -H 'x-enable-server-timing: 1' \
  -H 'x-o-ccm: server' \
  -H 'wm_qos.correlation_id: wrvYiSFTlAmd8j7a8DDmpuyOpCN_heAnwM3v' \
  -H 'origin: https://www.walmart.com' \
  -H 'sec-fetch-site: same-origin' \
  -H 'sec-fetch-mode: cors' \
  -H 'sec-fetch-dest: empty' \
  -H 'referer: https://www.walmart.com/orders' \
  -H 'accept-language: vi' \
  --data-raw $'{"query":"query getGuestOrder($orderId:ID\u0021 $emailAddress:String\u0021){guestOrder(input:{id:$orderId emailAddress:$emailAddress}){...OrderFieldsFragment}}fragment cancelReason on OrderCancelReason{__typename subReasonCode subDescription}fragment priceDetailFragment on OrderPriceDetailRow{label value displayValue info{title message}rowInfo{...orderPriceDetailRowInfo}}fragment orderPriceDetailRowInfo on OrderPriceDetailRowInfo{title message{...textFragment}}fragment price on Price{displayValue value}fragment variants on MapEntry{name value}fragment OrderAddOn on OrderAddOn{lineId uniqueLineId productInfo{name usItemId offerId}quantityString quantityLabel type fulfillmentInstructions{...textFragment}actions{manageProtectionPlan{...orderActionFragment}cancel}priceInfo{linePrice{...price}}quantity isActive}fragment orderDonationDetails on OrderDonationDetails{message{...textFragment}emailReceipt emailReceiptToken status{...textFragment}errorStatus}fragment orderLineItem on OrderLineItem{id uniqueId actions{contactSeller cancel addToCart configureCake reviewItem resendEGiftCardToken protectionPlan{...orderActionFragment}manageProtectionPlan{...orderActionFragment}}isGift digitalDeliveryMessage quantity quantityString quantityLabel isSubstitutionSelected fulfilledItems{id quantityString priceInfo{itemPrice{value}}product{usItemId name}}isReturnable returnEligibilityMessage product{name usItemId imageInfo{thumbnailUrl}canonicalUrl offerId sellerId sellerName hasSellerBadge seller{sellerId name}orderLimit orderMinLimit weightIncrement salesUnit salesUnitType isSubstitutionEligible isAlcohol}reshop{reshopMessage isShippingAvailable minPromiseDate maxPromiseDate}selectedVariants{...variants}variantAdditionalInfo{parts{text nativeAction}}priceInfo{priceDisplayCodes{showItemPrice priceDisplayCondition finalCostByWeight}itemPrice{...price}linePrice{...price}unitPrice{...price}preDiscountedLinePrice{...price}additionalLines{name value}}discounts{label labelText{...textFragment}}itemReviewed activationCodes{label code}protectionPlanMessage{...textFragment}showSeller isShippedByWalmart seller{id name isPro}digitalDeliveryPhoneNumber addOns{...OrderAddOn}multiboxBundleId}fragment DriverFragment on Driver{id firstName photoUrl}fragment OrderGroupFragment on OrderGroup{driver{...DriverFragment}deliveryDate fulfillmentType status{...OrderGroupStatusFragment}showSeller isShippedByWalmart seller{...SellerFragment}id itemCount items{...LiteLineItemFragment}pickupPerson{firstName lastName email}accessPointId shipment{...ShipmentFragment}returnEligibilityMessage actions{...OrderGroupActionsFragment}recipientEmailAddress digitalDelivery{...DigitalDeliveryFragment}tireInstallationReservation{status extraText}}fragment OrderGroupStatusFragment on OrderGroupStatus{statusType showStatusTracker statusTracker{status label isCurrent}message{...textFragment}subtext subMessage{...textFragment}notice helpCenterText{...textFragment}}fragment textFragment on Text{parts{bold url text nativeAction lineBreak}}fragment LiteLineItemFragment on OrderLineItem{id quantity product{name usItemId imageInfo{thumbnailUrl}offerId isAlcohol}priceInfo{linePrice{...price}}}fragment SellerFragment on GroupSeller{id name isPro}fragment DigitalDeliveryFragment on DigitalDelivery{title name instructions{...textFragment}}fragment ShipmentFragment on Shipment{id trackingNumber isExternalTracking trackingUrl proofOfDelivery{photoUrl photoPreviewUrl showPreview}}fragment OrderGroupActionsFragment on OrderGroupActions{reorder edit track changeSlot checkin editDeliveryInstructions editPickupPerson editTip tip cancel enableTip{...orderActionFragment}enableEdit{...orderActionFragment}rescheduleTireInstall{...orderActionFragment}cancelTireInstall{...orderActionFragment}help viewCancellationDetails{...cancellationDetailsActionFragment}}fragment cancellationDetailsActionFragment on CancellationDetailsAction{label heading text{...textFragment}}fragment ODPGroupCategoryFragment on OrderCategory{type name subtext returnMessage substitutionsBanner{...textFragment}showExtendedSubstitutions actions{substitutions{message label type}nilPickReshop{message action{text url}}returnDetails viewCancellationDetails{...cancellationDetailsActionFragment}trackOnInHomeApp}banner{...textFragment}accordionState items{...orderLineItem}substitutions{...orderLineItem fulfilledItems{...orderLineItem}}returnInfo{...returnInfoFragment}}fragment ODPGroupFragment on OrderGroup{id fulfillmentType deliveryMessage deliveryAddress{fullName firstName lastName address{...addressFragment}}deliveryInstructions{text type typeText}deliveryPreferences{text{...textFragment}cta{...orderActionFragment}}editSubstitutionsCutOff status{statusType showStatusTracker message{...textFragment}notice helpCenterText{...textFragment}}itemCount isCategorized categories{...ODPGroupCategoryFragment}seller{id name isPro}shipment{id trackingNumber}actions{reorder edit track changeSlot checkin editDeliveryInstructions editPickupPerson tip cancel help enableTip{...orderActionFragment}enableEdit{...orderActionFragment}viewCancellationDetails{...cancellationDetailsActionFragment}enableInHome{...orderActionFragment}createGiftReceipt}cutOffTimestamp isEditSubstitutionsEligible isInHome giftDetails{recipientAddress{fullName}recipientEmail senderName giftMessage}donationDetails{...orderDonationDetails}}fragment returnInfoFragment on ReturnInfo{returnOrderId type refundPriceDetails{__typename...refundPriceDetailsFragment}refundMessage tierRefundMessage paymentMethods{__typename description cardType paymentType displayValues message{...textFragment}}actions{__typename generate scheduleOrModifyPickup{text url}reschedulePickup editPickupContact}shippingLabelUrl qrCodeImageUrl carriers{__typename id name}pickupCarrier pickupContact{nameAndAddress{fullName firstName lastName address{addressString city state postalCode addressLineOne addressLineTwo country}}phone}pickupConfirmationNumber bannerMessage{...textFragment}}fragment refundPriceDetailsFragment on RefundPriceDetails{subTotal{__typename...orderPriceDetailRowFragment}fees{__typename...orderPriceDetailRowFragment}discounts{__typename...orderPriceDetailRowFragment}taxTotal{__typename...orderPriceDetailRowFragment}grandTotal{__typename...orderPriceDetailRowFragment}}fragment orderPriceDetailRowFragment on OrderPriceDetailRow{label displayValue value info{__typename title message}}fragment addressFragment on OrderAddress{addressString addressLineOne addressLineTwo state postalCode city}fragment ODPPickupInfo on OrderGroup{pickupInstructions pickupPerson{...person}alternatePickupPerson{...person}store{id name address{...addressFragment}}}fragment person on OrderPickupPerson{firstName lastName email}fragment ODPTippingInfo on OrderGroup{addTipMessage{...textFragment}driver{...DriverFragment}tipping{min{...price}max{...price}suggested{...price}preselected}subtotal{...price}}fragment orderActionFragment on Action{text url}fragment orderCustomer on OrderCustomer{id firstName lastName email isGuest isEmailRegistered}fragment OrderFieldsFragment on Order{__typename id version type customer{...orderCustomer}displayId idBarcodeImageUrl(barWidth:3 barHeight:100) isFuelPurchase title shortTitle timezone tippableGroup{...OrderGroupFragment}amendableGroup{id changeSlotIterationsLeft cutOffTimestamp fulfillmentType deliveryAddress{fullName firstName lastName address{addressString addressLineOne addressLineTwo state postalCode city country}}isAmendInProgress}substitutionsBanner{heading subheading longSubheading}groups_2101{__typename...OrderGroupFragment...ODPGroupFragment...ODPPickupInfo...ODPTippingInfo}multiboxBundles{...orderLineItem}itemCancelReasons{__typename...cancelReason}groupCancelReasons{__typename...cancelReason}priceDetails{__typename subTotal{__typename...priceDetailFragment}taxTotal{__typename...priceDetailFragment}grandTotal{__typename...priceDetailFragment}authorizationAmount{__typename...priceDetailFragment}fees{__typename...priceDetailFragment}discounts{__typename...priceDetailFragment}minimumThreshold{__typename...price}belowMinimumFee{__typename...priceDetailFragment}driverTip{__typename...priceDetailFragment}donations{__typename...priceDetailFragment}}paymentMethods{__typename description cardType paymentType displayValues message{...textFragment}actions{connectToCapitalOne{...orderActionFragment}visitAffirm{...orderActionFragment}}}actions{__typename return pendingReturn cancel startReturn{...orderActionFragment}reorder}banners{...textFragment}}","variables":{"orderId":"2832232339519","emailAddress":"shaunakgupte@gmail.com"}}' \
  --compressed`
 
for (( i=0; i<=4; i++ ))
do
  if [[ $curl79 =~ "error"  || $curl79 =~ "blocked" ]]; then
    echo "Lỗi email số 79"
    indexOrder79=`echo error`
    break
  elif [[ `echo $curl79 | jq '.data.guestOrder.groups_2101['${i[@]}'].items[0].product.usItemId'` == '"251382558"' ]]; then
    indexOrder79=`echo $i`
    indexItem79=`echo 0`
  elif [[ `echo $curl79 | jq '.data.guestOrder.groups_2101['${i[@]}'].items[1].product.usItemId'` == '"251382558"' ]]; then
    indexOrder79=`echo $i`
    indexItem79=`echo 1`
  elif [[ `echo $curl79 | jq '.data.guestOrder.groups_2101['${i[@]}'].items[2].product.usItemId'` == '"251382558"' ]]; then
    indexOrder79=`echo $i`
    indexItem79=`echo 2`
  elif [[ `echo $curl79 | jq '.data.guestOrder.groups_2101['${i[@]}'].items[3].product.usItemId'` == '"251382558"' ]]; then
    indexOrder79=`echo $i`
    indexItem79=`echo 3`
  fi
done

if [[ $indexOrder79 != "error" ]]; then
echo $curl79 | jq '.data.guestOrder.id' >> track-OrderID.txt
echo $curl79 | jq '.data.guestOrder.customer.email' >> track-email.txt
echo $curl79 | jq '.data.guestOrder.groups_2101['$indexOrder79'].items['$indexItem79'].product.usItemId' >> track-usItemId.txt
echo $curl79 | jq '.data.guestOrder.groups_2101['$indexOrder79'].items['$indexItem79'].priceInfo.linePrice.value' >> track-priceValue.txt
echo $curl79 | jq '.data.guestOrder.groups_2101['$indexOrder79'].deliveryAddress.fullName' >> track-fullName.txt
echo $curl79 | jq '.data.guestOrder.groups_2101['$indexOrder79'].deliveryAddress.address.addressString' >> track-address.txt
echo $curl79 | jq '.data.guestOrder.groups_2101['$indexOrder79'].status.message.parts[].text' >> track-status.txt
echo $curl79 | jq '.data.guestOrder.groups_2101['$indexOrder79'].shipment.trackingNumber' >> track-number.txt
echo $curl79 | jq '.data.guestOrder.groups_2101['$indexOrder79'].shipment.trackingUrl' >> track-url.txt
fi

curl80=`curl 'https://www.walmart.com/orchestra/home/graphql' \
  -H 'authority: www.walmart.com' \
  -H 'sec-ch-ua: " Not A;Brand";v="99", "Chromium";v="96", "Microsoft Edge";v="96"' \
  -H 'x-o-platform: rweb' \
  -H 'dnt: 1' \
  -H 'x-o-correlation-id: wrvYiSFTlAmd8j7a8DDmpuyOpCN_heAnwM3v' \
  -H 'device_profile_ref_id: _s1F3NO8Y2JjaBUKPDcY4iFDWiIl9CyqiJjf' \
  -H 'x-latency-trace: 1' \
  -H 'wm_mp: true' \
  -H 'x-o-market: us' \
  -H 'x-o-platform-version: main-253-ebbb47' \
  -H 'x-o-gql-query: query getGuestOrder' \
  -H 'wm_page_url: https://www.walmart.com/orders' \
  -H 'x-apollo-operation-name: getGuestOrder' \
  -H 'sec-ch-ua-platform: "macOS"' \
  -H 'sec-ch-ua-mobile: ?0' \
  -H 'user-agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/96.0.4664.110 Safari/537.36 Edg/96.0.1054.62' \
  -H 'x-o-segment: oaoh' \
  -H 'content-type: application/json' \
  -H 'accept: application/json' \
  -H 'x-enable-server-timing: 1' \
  -H 'x-o-ccm: server' \
  -H 'wm_qos.correlation_id: wrvYiSFTlAmd8j7a8DDmpuyOpCN_heAnwM3v' \
  -H 'origin: https://www.walmart.com' \
  -H 'sec-fetch-site: same-origin' \
  -H 'sec-fetch-mode: cors' \
  -H 'sec-fetch-dest: empty' \
  -H 'referer: https://www.walmart.com/orders' \
  -H 'accept-language: vi' \
  --data-raw $'{"query":"query getGuestOrder($orderId:ID\u0021 $emailAddress:String\u0021){guestOrder(input:{id:$orderId emailAddress:$emailAddress}){...OrderFieldsFragment}}fragment cancelReason on OrderCancelReason{__typename subReasonCode subDescription}fragment priceDetailFragment on OrderPriceDetailRow{label value displayValue info{title message}rowInfo{...orderPriceDetailRowInfo}}fragment orderPriceDetailRowInfo on OrderPriceDetailRowInfo{title message{...textFragment}}fragment price on Price{displayValue value}fragment variants on MapEntry{name value}fragment OrderAddOn on OrderAddOn{lineId uniqueLineId productInfo{name usItemId offerId}quantityString quantityLabel type fulfillmentInstructions{...textFragment}actions{manageProtectionPlan{...orderActionFragment}cancel}priceInfo{linePrice{...price}}quantity isActive}fragment orderDonationDetails on OrderDonationDetails{message{...textFragment}emailReceipt emailReceiptToken status{...textFragment}errorStatus}fragment orderLineItem on OrderLineItem{id uniqueId actions{contactSeller cancel addToCart configureCake reviewItem resendEGiftCardToken protectionPlan{...orderActionFragment}manageProtectionPlan{...orderActionFragment}}isGift digitalDeliveryMessage quantity quantityString quantityLabel isSubstitutionSelected fulfilledItems{id quantityString priceInfo{itemPrice{value}}product{usItemId name}}isReturnable returnEligibilityMessage product{name usItemId imageInfo{thumbnailUrl}canonicalUrl offerId sellerId sellerName hasSellerBadge seller{sellerId name}orderLimit orderMinLimit weightIncrement salesUnit salesUnitType isSubstitutionEligible isAlcohol}reshop{reshopMessage isShippingAvailable minPromiseDate maxPromiseDate}selectedVariants{...variants}variantAdditionalInfo{parts{text nativeAction}}priceInfo{priceDisplayCodes{showItemPrice priceDisplayCondition finalCostByWeight}itemPrice{...price}linePrice{...price}unitPrice{...price}preDiscountedLinePrice{...price}additionalLines{name value}}discounts{label labelText{...textFragment}}itemReviewed activationCodes{label code}protectionPlanMessage{...textFragment}showSeller isShippedByWalmart seller{id name isPro}digitalDeliveryPhoneNumber addOns{...OrderAddOn}multiboxBundleId}fragment DriverFragment on Driver{id firstName photoUrl}fragment OrderGroupFragment on OrderGroup{driver{...DriverFragment}deliveryDate fulfillmentType status{...OrderGroupStatusFragment}showSeller isShippedByWalmart seller{...SellerFragment}id itemCount items{...LiteLineItemFragment}pickupPerson{firstName lastName email}accessPointId shipment{...ShipmentFragment}returnEligibilityMessage actions{...OrderGroupActionsFragment}recipientEmailAddress digitalDelivery{...DigitalDeliveryFragment}tireInstallationReservation{status extraText}}fragment OrderGroupStatusFragment on OrderGroupStatus{statusType showStatusTracker statusTracker{status label isCurrent}message{...textFragment}subtext subMessage{...textFragment}notice helpCenterText{...textFragment}}fragment textFragment on Text{parts{bold url text nativeAction lineBreak}}fragment LiteLineItemFragment on OrderLineItem{id quantity product{name usItemId imageInfo{thumbnailUrl}offerId isAlcohol}priceInfo{linePrice{...price}}}fragment SellerFragment on GroupSeller{id name isPro}fragment DigitalDeliveryFragment on DigitalDelivery{title name instructions{...textFragment}}fragment ShipmentFragment on Shipment{id trackingNumber isExternalTracking trackingUrl proofOfDelivery{photoUrl photoPreviewUrl showPreview}}fragment OrderGroupActionsFragment on OrderGroupActions{reorder edit track changeSlot checkin editDeliveryInstructions editPickupPerson editTip tip cancel enableTip{...orderActionFragment}enableEdit{...orderActionFragment}rescheduleTireInstall{...orderActionFragment}cancelTireInstall{...orderActionFragment}help viewCancellationDetails{...cancellationDetailsActionFragment}}fragment cancellationDetailsActionFragment on CancellationDetailsAction{label heading text{...textFragment}}fragment ODPGroupCategoryFragment on OrderCategory{type name subtext returnMessage substitutionsBanner{...textFragment}showExtendedSubstitutions actions{substitutions{message label type}nilPickReshop{message action{text url}}returnDetails viewCancellationDetails{...cancellationDetailsActionFragment}trackOnInHomeApp}banner{...textFragment}accordionState items{...orderLineItem}substitutions{...orderLineItem fulfilledItems{...orderLineItem}}returnInfo{...returnInfoFragment}}fragment ODPGroupFragment on OrderGroup{id fulfillmentType deliveryMessage deliveryAddress{fullName firstName lastName address{...addressFragment}}deliveryInstructions{text type typeText}deliveryPreferences{text{...textFragment}cta{...orderActionFragment}}editSubstitutionsCutOff status{statusType showStatusTracker message{...textFragment}notice helpCenterText{...textFragment}}itemCount isCategorized categories{...ODPGroupCategoryFragment}seller{id name isPro}shipment{id trackingNumber}actions{reorder edit track changeSlot checkin editDeliveryInstructions editPickupPerson tip cancel help enableTip{...orderActionFragment}enableEdit{...orderActionFragment}viewCancellationDetails{...cancellationDetailsActionFragment}enableInHome{...orderActionFragment}createGiftReceipt}cutOffTimestamp isEditSubstitutionsEligible isInHome giftDetails{recipientAddress{fullName}recipientEmail senderName giftMessage}donationDetails{...orderDonationDetails}}fragment returnInfoFragment on ReturnInfo{returnOrderId type refundPriceDetails{__typename...refundPriceDetailsFragment}refundMessage tierRefundMessage paymentMethods{__typename description cardType paymentType displayValues message{...textFragment}}actions{__typename generate scheduleOrModifyPickup{text url}reschedulePickup editPickupContact}shippingLabelUrl qrCodeImageUrl carriers{__typename id name}pickupCarrier pickupContact{nameAndAddress{fullName firstName lastName address{addressString city state postalCode addressLineOne addressLineTwo country}}phone}pickupConfirmationNumber bannerMessage{...textFragment}}fragment refundPriceDetailsFragment on RefundPriceDetails{subTotal{__typename...orderPriceDetailRowFragment}fees{__typename...orderPriceDetailRowFragment}discounts{__typename...orderPriceDetailRowFragment}taxTotal{__typename...orderPriceDetailRowFragment}grandTotal{__typename...orderPriceDetailRowFragment}}fragment orderPriceDetailRowFragment on OrderPriceDetailRow{label displayValue value info{__typename title message}}fragment addressFragment on OrderAddress{addressString addressLineOne addressLineTwo state postalCode city}fragment ODPPickupInfo on OrderGroup{pickupInstructions pickupPerson{...person}alternatePickupPerson{...person}store{id name address{...addressFragment}}}fragment person on OrderPickupPerson{firstName lastName email}fragment ODPTippingInfo on OrderGroup{addTipMessage{...textFragment}driver{...DriverFragment}tipping{min{...price}max{...price}suggested{...price}preselected}subtotal{...price}}fragment orderActionFragment on Action{text url}fragment orderCustomer on OrderCustomer{id firstName lastName email isGuest isEmailRegistered}fragment OrderFieldsFragment on Order{__typename id version type customer{...orderCustomer}displayId idBarcodeImageUrl(barWidth:3 barHeight:100) isFuelPurchase title shortTitle timezone tippableGroup{...OrderGroupFragment}amendableGroup{id changeSlotIterationsLeft cutOffTimestamp fulfillmentType deliveryAddress{fullName firstName lastName address{addressString addressLineOne addressLineTwo state postalCode city country}}isAmendInProgress}substitutionsBanner{heading subheading longSubheading}groups_2101{__typename...OrderGroupFragment...ODPGroupFragment...ODPPickupInfo...ODPTippingInfo}multiboxBundles{...orderLineItem}itemCancelReasons{__typename...cancelReason}groupCancelReasons{__typename...cancelReason}priceDetails{__typename subTotal{__typename...priceDetailFragment}taxTotal{__typename...priceDetailFragment}grandTotal{__typename...priceDetailFragment}authorizationAmount{__typename...priceDetailFragment}fees{__typename...priceDetailFragment}discounts{__typename...priceDetailFragment}minimumThreshold{__typename...price}belowMinimumFee{__typename...priceDetailFragment}driverTip{__typename...priceDetailFragment}donations{__typename...priceDetailFragment}}paymentMethods{__typename description cardType paymentType displayValues message{...textFragment}actions{connectToCapitalOne{...orderActionFragment}visitAffirm{...orderActionFragment}}}actions{__typename return pendingReturn cancel startReturn{...orderActionFragment}reorder}banners{...textFragment}}","variables":{"orderId":"2842234322387","emailAddress":"kchiev215@gmail.com"}}' \
  --compressed`
 
for (( i=0; i<=4; i++ ))
do
  if [[ $curl80 =~ "error"  || $curl80 =~ "blocked" ]]; then
    echo "Lỗi email số 80"
    indexOrder80=`echo error`
    break
  elif [[ `echo $curl80 | jq '.data.guestOrder.groups_2101['${i[@]}'].items[0].product.usItemId'` == '"54315959"' ]]; then
    indexOrder80=`echo $i`
    indexItem80=`echo 0`
  elif [[ `echo $curl80 | jq '.data.guestOrder.groups_2101['${i[@]}'].items[1].product.usItemId'` == '"54315959"' ]]; then
    indexOrder80=`echo $i`
    indexItem80=`echo 1`
  elif [[ `echo $curl80 | jq '.data.guestOrder.groups_2101['${i[@]}'].items[2].product.usItemId'` == '"54315959"' ]]; then
    indexOrder80=`echo $i`
    indexItem80=`echo 2`
  elif [[ `echo $curl80 | jq '.data.guestOrder.groups_2101['${i[@]}'].items[3].product.usItemId'` == '"54315959"' ]]; then
    indexOrder80=`echo $i`
    indexItem80=`echo 3`
  fi
done

if [[ $indexOrder80 != "error" ]]; then
echo $curl80 | jq '.data.guestOrder.id' >> track-OrderID.txt
echo $curl80 | jq '.data.guestOrder.customer.email' >> track-email.txt
echo $curl80 | jq '.data.guestOrder.groups_2101['$indexOrder80'].items['$indexItem80'].product.usItemId' >> track-usItemId.txt
echo $curl80 | jq '.data.guestOrder.groups_2101['$indexOrder80'].items['$indexItem80'].priceInfo.linePrice.value' >> track-priceValue.txt
echo $curl80 | jq '.data.guestOrder.groups_2101['$indexOrder80'].deliveryAddress.fullName' >> track-fullName.txt
echo $curl80 | jq '.data.guestOrder.groups_2101['$indexOrder80'].deliveryAddress.address.addressString' >> track-address.txt
echo $curl80 | jq '.data.guestOrder.groups_2101['$indexOrder80'].status.message.parts[].text' >> track-status.txt
echo $curl80 | jq '.data.guestOrder.groups_2101['$indexOrder80'].shipment.trackingNumber' >> track-number.txt
echo $curl80 | jq '.data.guestOrder.groups_2101['$indexOrder80'].shipment.trackingUrl' >> track-url.txt
fi


git add -A .
git commit -m --allow-empty
git push
git push origin HEAD -f
gitCommit=`git rev-parse HEAD`
linkGit=`echo https://raw.githubusercontent.com/DungSherlock/eBay/`$gitCommit`echo /`
linkApi=`echo https://script.google.com/macros/s/AKfycbxTUZPtaHbpL6Sdf4PXWLmCg1PcRotJWSyJQ-cKMC9AxPb-du0q4h3mmFAICVNeGp8GNQ/exec?`
linkPost=$linkApi`echo Item ID==IMPORTDATA\(\"`$linkGit`echo track-usItemId.txt\"\)\&Giá==IMPORTDATA\(\"`$linkGit`echo track-priceValue.txt\"\)\&Tên==IMPORTDATA\(\"`$linkGit`echo track-fullName.txt\"\)\&Địa chỉ==IMPORTDATA\(\"`$linkGit`echo track-address.txt\"\)\&Status==IMPORTDATA\(\"`$linkGit`echo track-status.txt\"\)\&Tracking Number==IMPORTDATA\(\"`$linkGit`echo track-number.txt\"\)\&Tracking URL==IMPORTDATA\(\"`$linkGit`echo track-url.txt\"\)\&Email==IMPORTDATA\(\"`$linkGit`echo track-email.txt\"\)\&Order==IMPORTDATA\(\"`$linkGit`echo track-OrderID.txt\"\)`
echo $linkPost
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

curl1=`curl -s 'https://www.walmart.com/orchestra/home/graphql' \
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
  if [[ $curl1 =~ "error" ]]; then
    echo "Sai thông tin đăng nhập-Record số 1"
    break
  elif [[ $curl1 =~ "blocked" ]]; then
    echo "Lỗi blocked-Record số 1"
    break
  else
    for (( j=0; j<=4; j++))
    do
      if [[ `echo $curl1 | jq '.data.guestOrder.groups_2101['${i[@]}'].items['${j[@]}'].product.usItemId'` == '"129706644"' ]]; then
        echo $curl1 | jq '.data.guestOrder.id' >> track-OrderID.txt
        echo $curl1 | jq '.data.guestOrder.customer.email' >> track-email.txt
        echo $curl1 | jq '.data.guestOrder.groups_2101['${i[@]}'].items['${j[@]}'].product.usItemId' >> track-usItemId.txt
        echo $curl1 | jq '.data.guestOrder.groups_2101['${i[@]}'].items['${j[@]}'].priceInfo.linePrice.value' >> track-priceValue.txt
        echo $curl1 | jq '.data.guestOrder.groups_2101['${i[@]}'].deliveryAddress.fullName' >> track-fullName.txt
        echo $curl1 | jq '.data.guestOrder.groups_2101['${i[@]}'].deliveryAddress.address.addressString' >> track-address.txt
        echo $curl1 | jq '.data.guestOrder.groups_2101['${i[@]}'].status.message.parts[].text' >> track-status.txt
        echo $curl1 | jq '.data.guestOrder.groups_2101['${i[@]}'].shipment.trackingNumber' >> track-number.txt
        echo $curl1 | jq '.data.guestOrder.groups_2101['${i[@]}'].shipment.trackingUrl' >> track-url.txt
        echo "1"
        break
      fi
    done
  fi
done

curl2=`curl -s 'https://www.walmart.com/orchestra/home/graphql' \
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
  if [[ $curl2 =~ "error" ]]; then
    echo "Sai thông tin đăng nhập-Record số 2"
    break
  elif [[ $curl2 =~ "blocked" ]]; then
    echo "Lỗi blocked-Record số 2"
    break
  else
    for (( j=0; j<=4; j++))
    do
      if [[ `echo $curl2 | jq '.data.guestOrder.groups_2101['${i[@]}'].items['${j[@]}'].product.usItemId'` == '"226026281"' ]]; then
        echo $curl2 | jq '.data.guestOrder.id' >> track-OrderID.txt
        echo $curl2 | jq '.data.guestOrder.customer.email' >> track-email.txt
        echo $curl2 | jq '.data.guestOrder.groups_2101['${i[@]}'].items['${j[@]}'].product.usItemId' >> track-usItemId.txt
        echo $curl2 | jq '.data.guestOrder.groups_2101['${i[@]}'].items['${j[@]}'].priceInfo.linePrice.value' >> track-priceValue.txt
        echo $curl2 | jq '.data.guestOrder.groups_2101['${i[@]}'].deliveryAddress.fullName' >> track-fullName.txt
        echo $curl2 | jq '.data.guestOrder.groups_2101['${i[@]}'].deliveryAddress.address.addressString' >> track-address.txt
        echo $curl2 | jq '.data.guestOrder.groups_2101['${i[@]}'].status.message.parts[].text' >> track-status.txt
        echo $curl2 | jq '.data.guestOrder.groups_2101['${i[@]}'].shipment.trackingNumber' >> track-number.txt
        echo $curl2 | jq '.data.guestOrder.groups_2101['${i[@]}'].shipment.trackingUrl' >> track-url.txt
        echo "2"
        break
      fi
    done
  fi
done

curl3=`curl -s 'https://www.walmart.com/orchestra/home/graphql' \
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
  if [[ $curl3 =~ "error" ]]; then
    echo "Sai thông tin đăng nhập-Record số 3"
    break
  elif [[ $curl3 =~ "blocked" ]]; then
    echo "Lỗi blocked-Record số 3"
    break
  else
    for (( j=0; j<=4; j++))
    do
      if [[ `echo $curl3 | jq '.data.guestOrder.groups_2101['${i[@]}'].items['${j[@]}'].product.usItemId'` == '"137359681"' ]]; then
        echo $curl3 | jq '.data.guestOrder.id' >> track-OrderID.txt
        echo $curl3 | jq '.data.guestOrder.customer.email' >> track-email.txt
        echo $curl3 | jq '.data.guestOrder.groups_2101['${i[@]}'].items['${j[@]}'].product.usItemId' >> track-usItemId.txt
        echo $curl3 | jq '.data.guestOrder.groups_2101['${i[@]}'].items['${j[@]}'].priceInfo.linePrice.value' >> track-priceValue.txt
        echo $curl3 | jq '.data.guestOrder.groups_2101['${i[@]}'].deliveryAddress.fullName' >> track-fullName.txt
        echo $curl3 | jq '.data.guestOrder.groups_2101['${i[@]}'].deliveryAddress.address.addressString' >> track-address.txt
        echo $curl3 | jq '.data.guestOrder.groups_2101['${i[@]}'].status.message.parts[].text' >> track-status.txt
        echo $curl3 | jq '.data.guestOrder.groups_2101['${i[@]}'].shipment.trackingNumber' >> track-number.txt
        echo $curl3 | jq '.data.guestOrder.groups_2101['${i[@]}'].shipment.trackingUrl' >> track-url.txt
        echo "3"
        break
      fi
    done
  fi
done

curl4=`curl -s 'https://www.walmart.com/orchestra/home/graphql' \
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
  if [[ $curl4 =~ "error" ]]; then
    echo "Sai thông tin đăng nhập-Record số 4"
    break
  elif [[ $curl4 =~ "blocked" ]]; then
    echo "Lỗi blocked-Record số 4"
    break
  else
    for (( j=0; j<=4; j++))
    do
      if [[ `echo $curl4 | jq '.data.guestOrder.groups_2101['${i[@]}'].items['${j[@]}'].product.usItemId'` == '"918843213"' ]]; then
        echo $curl4 | jq '.data.guestOrder.id' >> track-OrderID.txt
        echo $curl4 | jq '.data.guestOrder.customer.email' >> track-email.txt
        echo $curl4 | jq '.data.guestOrder.groups_2101['${i[@]}'].items['${j[@]}'].product.usItemId' >> track-usItemId.txt
        echo $curl4 | jq '.data.guestOrder.groups_2101['${i[@]}'].items['${j[@]}'].priceInfo.linePrice.value' >> track-priceValue.txt
        echo $curl4 | jq '.data.guestOrder.groups_2101['${i[@]}'].deliveryAddress.fullName' >> track-fullName.txt
        echo $curl4 | jq '.data.guestOrder.groups_2101['${i[@]}'].deliveryAddress.address.addressString' >> track-address.txt
        echo $curl4 | jq '.data.guestOrder.groups_2101['${i[@]}'].status.message.parts[].text' >> track-status.txt
        echo $curl4 | jq '.data.guestOrder.groups_2101['${i[@]}'].shipment.trackingNumber' >> track-number.txt
        echo $curl4 | jq '.data.guestOrder.groups_2101['${i[@]}'].shipment.trackingUrl' >> track-url.txt
        echo "4"
        break
      fi
    done
  fi
done

curl5=`curl -s 'https://www.walmart.com/orchestra/home/graphql' \
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
  if [[ $curl5 =~ "error" ]]; then
    echo "Sai thông tin đăng nhập-Record số 5"
    break
  elif [[ $curl5 =~ "blocked" ]]; then
    echo "Lỗi blocked-Record số 5"
    break
  else
    for (( j=0; j<=4; j++))
    do
      if [[ `echo $curl5 | jq '.data.guestOrder.groups_2101['${i[@]}'].items['${j[@]}'].product.usItemId'` == '"129706644"' ]]; then
        echo $curl5 | jq '.data.guestOrder.id' >> track-OrderID.txt
        echo $curl5 | jq '.data.guestOrder.customer.email' >> track-email.txt
        echo $curl5 | jq '.data.guestOrder.groups_2101['${i[@]}'].items['${j[@]}'].product.usItemId' >> track-usItemId.txt
        echo $curl5 | jq '.data.guestOrder.groups_2101['${i[@]}'].items['${j[@]}'].priceInfo.linePrice.value' >> track-priceValue.txt
        echo $curl5 | jq '.data.guestOrder.groups_2101['${i[@]}'].deliveryAddress.fullName' >> track-fullName.txt
        echo $curl5 | jq '.data.guestOrder.groups_2101['${i[@]}'].deliveryAddress.address.addressString' >> track-address.txt
        echo $curl5 | jq '.data.guestOrder.groups_2101['${i[@]}'].status.message.parts[].text' >> track-status.txt
        echo $curl5 | jq '.data.guestOrder.groups_2101['${i[@]}'].shipment.trackingNumber' >> track-number.txt
        echo $curl5 | jq '.data.guestOrder.groups_2101['${i[@]}'].shipment.trackingUrl' >> track-url.txt
        echo "5"
        break
      fi
    done
  fi
done

curl6=`curl -s 'https://www.walmart.com/orchestra/home/graphql' \
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
  --data-raw $'{"query":"query getGuestOrder($orderId:ID\u0021 $emailAddress:String\u0021){guestOrder(input:{id:$orderId emailAddress:$emailAddress}){...OrderFieldsFragment}}fragment cancelReason on OrderCancelReason{__typename subReasonCode subDescription}fragment priceDetailFragment on OrderPriceDetailRow{label value displayValue info{title message}rowInfo{...orderPriceDetailRowInfo}}fragment orderPriceDetailRowInfo on OrderPriceDetailRowInfo{title message{...textFragment}}fragment price on Price{displayValue value}fragment variants on MapEntry{name value}fragment OrderAddOn on OrderAddOn{lineId uniqueLineId productInfo{name usItemId offerId}quantityString quantityLabel type fulfillmentInstructions{...textFragment}actions{manageProtectionPlan{...orderActionFragment}cancel}priceInfo{linePrice{...price}}quantity isActive}fragment orderDonationDetails on OrderDonationDetails{message{...textFragment}emailReceipt emailReceiptToken status{...textFragment}errorStatus}fragment orderLineItem on OrderLineItem{id uniqueId actions{contactSeller cancel addToCart configureCake reviewItem resendEGiftCardToken protectionPlan{...orderActionFragment}manageProtectionPlan{...orderActionFragment}}isGift digitalDeliveryMessage quantity quantityString quantityLabel isSubstitutionSelected fulfilledItems{id quantityString priceInfo{itemPrice{value}}product{usItemId name}}isReturnable returnEligibilityMessage product{name usItemId imageInfo{thumbnailUrl}canonicalUrl offerId sellerId sellerName hasSellerBadge seller{sellerId name}orderLimit orderMinLimit weightIncrement salesUnit salesUnitType isSubstitutionEligible isAlcohol}reshop{reshopMessage isShippingAvailable minPromiseDate maxPromiseDate}selectedVariants{...variants}variantAdditionalInfo{parts{text nativeAction}}priceInfo{priceDisplayCodes{showItemPrice priceDisplayCondition finalCostByWeight}itemPrice{...price}linePrice{...price}unitPrice{...price}preDiscountedLinePrice{...price}additionalLines{name value}}discounts{label labelText{...textFragment}}itemReviewed activationCodes{label code}protectionPlanMessage{...textFragment}showSeller isShippedByWalmart seller{id name isPro}digitalDeliveryPhoneNumber addOns{...OrderAddOn}multiboxBundleId}fragment DriverFragment on Driver{id firstName photoUrl}fragment OrderGroupFragment on OrderGroup{driver{...DriverFragment}deliveryDate fulfillmentType status{...OrderGroupStatusFragment}showSeller isShippedByWalmart seller{...SellerFragment}id itemCount items{...LiteLineItemFragment}pickupPerson{firstName lastName email}accessPointId shipment{...ShipmentFragment}returnEligibilityMessage actions{...OrderGroupActionsFragment}recipientEmailAddress digitalDelivery{...DigitalDeliveryFragment}tireInstallationReservation{status extraText}}fragment OrderGroupStatusFragment on OrderGroupStatus{statusType showStatusTracker statusTracker{status label isCurrent}message{...textFragment}subtext subMessage{...textFragment}notice helpCenterText{...textFragment}}fragment textFragment on Text{parts{bold url text nativeAction lineBreak}}fragment LiteLineItemFragment on OrderLineItem{id quantity product{name usItemId imageInfo{thumbnailUrl}offerId isAlcohol}priceInfo{linePrice{...price}}}fragment SellerFragment on GroupSeller{id name isPro}fragment DigitalDeliveryFragment on DigitalDelivery{title name instructions{...textFragment}}fragment ShipmentFragment on Shipment{id trackingNumber isExternalTracking trackingUrl proofOfDelivery{photoUrl photoPreviewUrl showPreview}}fragment OrderGroupActionsFragment on OrderGroupActions{reorder edit track changeSlot checkin editDeliveryInstructions editPickupPerson editTip tip cancel enableTip{...orderActionFragment}enableEdit{...orderActionFragment}rescheduleTireInstall{...orderActionFragment}cancelTireInstall{...orderActionFragment}help viewCancellationDetails{...cancellationDetailsActionFragment}}fragment cancellationDetailsActionFragment on CancellationDetailsAction{label heading text{...textFragment}}fragment ODPGroupCategoryFragment on OrderCategory{type name subtext returnMessage substitutionsBanner{...textFragment}showExtendedSubstitutions actions{substitutions{message label type}nilPickReshop{message action{text url}}returnDetails viewCancellationDetails{...cancellationDetailsActionFragment}trackOnInHomeApp}banner{...textFragment}accordionState items{...orderLineItem}substitutions{...orderLineItem fulfilledItems{...orderLineItem}}returnInfo{...returnInfoFragment}}fragment ODPGroupFragment on OrderGroup{id fulfillmentType deliveryMessage deliveryAddress{fullName firstName lastName address{...addressFragment}}deliveryInstructions{text type typeText}deliveryPreferences{text{...textFragment}cta{...orderActionFragment}}editSubstitutionsCutOff status{statusType showStatusTracker message{...textFragment}notice helpCenterText{...textFragment}}itemCount isCategorized categories{...ODPGroupCategoryFragment}seller{id name isPro}shipment{id trackingNumber}actions{reorder edit track changeSlot checkin editDeliveryInstructions editPickupPerson tip cancel help enableTip{...orderActionFragment}enableEdit{...orderActionFragment}viewCancellationDetails{...cancellationDetailsActionFragment}enableInHome{...orderActionFragment}createGiftReceipt}cutOffTimestamp isEditSubstitutionsEligible isInHome giftDetails{recipientAddress{fullName}recipientEmail senderName giftMessage}donationDetails{...orderDonationDetails}}fragment returnInfoFragment on ReturnInfo{returnOrderId type refundPriceDetails{__typename...refundPriceDetailsFragment}refundMessage tierRefundMessage paymentMethods{__typename description cardType paymentType displayValues message{...textFragment}}actions{__typename generate scheduleOrModifyPickup{text url}reschedulePickup editPickupContact}shippingLabelUrl qrCodeImageUrl carriers{__typename id name}pickupCarrier pickupContact{nameAndAddress{fullName firstName lastName address{addressString city state postalCode addressLineOne addressLineTwo country}}phone}pickupConfirmationNumber bannerMessage{...textFragment}}fragment refundPriceDetailsFragment on RefundPriceDetails{subTotal{__typename...orderPriceDetailRowFragment}fees{__typename...orderPriceDetailRowFragment}discounts{__typename...orderPriceDetailRowFragment}taxTotal{__typename...orderPriceDetailRowFragment}grandTotal{__typename...orderPriceDetailRowFragment}}fragment orderPriceDetailRowFragment on OrderPriceDetailRow{label displayValue value info{__typename title message}}fragment addressFragment on OrderAddress{addressString addressLineOne addressLineTwo state postalCode city}fragment ODPPickupInfo on OrderGroup{pickupInstructions pickupPerson{...person}alternatePickupPerson{...person}store{id name address{...addressFragment}}}fragment person on OrderPickupPerson{firstName lastName email}fragment ODPTippingInfo on OrderGroup{addTipMessage{...textFragment}driver{...DriverFragment}tipping{min{...price}max{...price}suggested{...price}preselected}subtotal{...price}}fragment orderActionFragment on Action{text url}fragment orderCustomer on OrderCustomer{id firstName lastName email isGuest isEmailRegistered}fragment OrderFieldsFragment on Order{__typename id version type customer{...orderCustomer}displayId idBarcodeImageUrl(barWidth:3 barHeight:100) isFuelPurchase title shortTitle timezone tippableGroup{...OrderGroupFragment}amendableGroup{id changeSlotIterationsLeft cutOffTimestamp fulfillmentType deliveryAddress{fullName firstName lastName address{addressString addressLineOne addressLineTwo state postalCode city country}}isAmendInProgress}substitutionsBanner{heading subheading longSubheading}groups_2101{__typename...OrderGroupFragment...ODPGroupFragment...ODPPickupInfo...ODPTippingInfo}multiboxBundles{...orderLineItem}itemCancelReasons{__typename...cancelReason}groupCancelReasons{__typename...cancelReason}priceDetails{__typename subTotal{__typename...priceDetailFragment}taxTotal{__typename...priceDetailFragment}grandTotal{__typename...priceDetailFragment}authorizationAmount{__typename...priceDetailFragment}fees{__typename...priceDetailFragment}discounts{__typename...priceDetailFragment}minimumThreshold{__typename...price}belowMinimumFee{__typename...priceDetailFragment}driverTip{__typename...priceDetailFragment}donations{__typename...priceDetailFragment}}paymentMethods{__typename description cardType paymentType displayValues message{...textFragment}actions{connectToCapitalOne{...orderActionFragment}visitAffirm{...orderActionFragment}}}actions{__typename return pendingReturn cancel startReturn{...orderActionFragment}reorder}banners{...textFragment}}","variables":{"orderId":"2862239321183","emailAddress":"dorrieleighlombardi78@hotmail.com"}}' \
  --compressed`
 
for (( i=0; i<=4; i++ ))
  do
  if [[ $curl6 =~ "error" ]]; then
    echo "Sai thông tin đăng nhập-Record số 6"
    break
  elif [[ $curl6 =~ "blocked" ]]; then
    echo "Lỗi blocked-Record số 6"
    break
  else
    for (( j=0; j<=4; j++))
    do
      if [[ `echo $curl6 | jq '.data.guestOrder.groups_2101['${i[@]}'].items['${j[@]}'].product.usItemId'` == '"755361385"' ]]; then
        echo $curl6 | jq '.data.guestOrder.id' >> track-OrderID.txt
        echo $curl6 | jq '.data.guestOrder.customer.email' >> track-email.txt
        echo $curl6 | jq '.data.guestOrder.groups_2101['${i[@]}'].items['${j[@]}'].product.usItemId' >> track-usItemId.txt
        echo $curl6 | jq '.data.guestOrder.groups_2101['${i[@]}'].items['${j[@]}'].priceInfo.linePrice.value' >> track-priceValue.txt
        echo $curl6 | jq '.data.guestOrder.groups_2101['${i[@]}'].deliveryAddress.fullName' >> track-fullName.txt
        echo $curl6 | jq '.data.guestOrder.groups_2101['${i[@]}'].deliveryAddress.address.addressString' >> track-address.txt
        echo $curl6 | jq '.data.guestOrder.groups_2101['${i[@]}'].status.message.parts[].text' >> track-status.txt
        echo $curl6 | jq '.data.guestOrder.groups_2101['${i[@]}'].shipment.trackingNumber' >> track-number.txt
        echo $curl6 | jq '.data.guestOrder.groups_2101['${i[@]}'].shipment.trackingUrl' >> track-url.txt
        echo "6"
        break
      fi
    done
  fi
done

curl7=`curl -s 'https://www.walmart.com/orchestra/home/graphql' \
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
  if [[ $curl7 =~ "error" ]]; then
    echo "Sai thông tin đăng nhập-Record số 7"
    break
  elif [[ $curl7 =~ "blocked" ]]; then
    echo "Lỗi blocked-Record số 7"
    break
  else
    for (( j=0; j<=4; j++))
    do
      if [[ `echo $curl7 | jq '.data.guestOrder.groups_2101['${i[@]}'].items['${j[@]}'].product.usItemId'` == '"10752553"' ]]; then
        echo $curl7 | jq '.data.guestOrder.id' >> track-OrderID.txt
        echo $curl7 | jq '.data.guestOrder.customer.email' >> track-email.txt
        echo $curl7 | jq '.data.guestOrder.groups_2101['${i[@]}'].items['${j[@]}'].product.usItemId' >> track-usItemId.txt
        echo $curl7 | jq '.data.guestOrder.groups_2101['${i[@]}'].items['${j[@]}'].priceInfo.linePrice.value' >> track-priceValue.txt
        echo $curl7 | jq '.data.guestOrder.groups_2101['${i[@]}'].deliveryAddress.fullName' >> track-fullName.txt
        echo $curl7 | jq '.data.guestOrder.groups_2101['${i[@]}'].deliveryAddress.address.addressString' >> track-address.txt
        echo $curl7 | jq '.data.guestOrder.groups_2101['${i[@]}'].status.message.parts[].text' >> track-status.txt
        echo $curl7 | jq '.data.guestOrder.groups_2101['${i[@]}'].shipment.trackingNumber' >> track-number.txt
        echo $curl7 | jq '.data.guestOrder.groups_2101['${i[@]}'].shipment.trackingUrl' >> track-url.txt
        echo "7"
        break
      fi
    done
  fi
done

curl8=`curl -s 'https://www.walmart.com/orchestra/home/graphql' \
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
  if [[ $curl8 =~ "error" ]]; then
    echo "Sai thông tin đăng nhập-Record số 8"
    break
  elif [[ $curl8 =~ "blocked" ]]; then
    echo "Lỗi blocked-Record số 8"
    break
  else
    for (( j=0; j<=4; j++))
    do
      if [[ `echo $curl8 | jq '.data.guestOrder.groups_2101['${i[@]}'].items['${j[@]}'].product.usItemId'` == '"129706644"' ]]; then
        echo $curl8 | jq '.data.guestOrder.id' >> track-OrderID.txt
        echo $curl8 | jq '.data.guestOrder.customer.email' >> track-email.txt
        echo $curl8 | jq '.data.guestOrder.groups_2101['${i[@]}'].items['${j[@]}'].product.usItemId' >> track-usItemId.txt
        echo $curl8 | jq '.data.guestOrder.groups_2101['${i[@]}'].items['${j[@]}'].priceInfo.linePrice.value' >> track-priceValue.txt
        echo $curl8 | jq '.data.guestOrder.groups_2101['${i[@]}'].deliveryAddress.fullName' >> track-fullName.txt
        echo $curl8 | jq '.data.guestOrder.groups_2101['${i[@]}'].deliveryAddress.address.addressString' >> track-address.txt
        echo $curl8 | jq '.data.guestOrder.groups_2101['${i[@]}'].status.message.parts[].text' >> track-status.txt
        echo $curl8 | jq '.data.guestOrder.groups_2101['${i[@]}'].shipment.trackingNumber' >> track-number.txt
        echo $curl8 | jq '.data.guestOrder.groups_2101['${i[@]}'].shipment.trackingUrl' >> track-url.txt
        echo "8"
        break
      fi
    done
  fi
done

curl9=`curl -s 'https://www.walmart.com/orchestra/home/graphql' \
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
  if [[ $curl9 =~ "error" ]]; then
    echo "Sai thông tin đăng nhập-Record số 9"
    break
  elif [[ $curl9 =~ "blocked" ]]; then
    echo "Lỗi blocked-Record số 9"
    break
  else
    for (( j=0; j<=4; j++))
    do
      if [[ `echo $curl9 | jq '.data.guestOrder.groups_2101['${i[@]}'].items['${j[@]}'].product.usItemId'` == '"766799843"' ]]; then
        echo $curl9 | jq '.data.guestOrder.id' >> track-OrderID.txt
        echo $curl9 | jq '.data.guestOrder.customer.email' >> track-email.txt
        echo $curl9 | jq '.data.guestOrder.groups_2101['${i[@]}'].items['${j[@]}'].product.usItemId' >> track-usItemId.txt
        echo $curl9 | jq '.data.guestOrder.groups_2101['${i[@]}'].items['${j[@]}'].priceInfo.linePrice.value' >> track-priceValue.txt
        echo $curl9 | jq '.data.guestOrder.groups_2101['${i[@]}'].deliveryAddress.fullName' >> track-fullName.txt
        echo $curl9 | jq '.data.guestOrder.groups_2101['${i[@]}'].deliveryAddress.address.addressString' >> track-address.txt
        echo $curl9 | jq '.data.guestOrder.groups_2101['${i[@]}'].status.message.parts[].text' >> track-status.txt
        echo $curl9 | jq '.data.guestOrder.groups_2101['${i[@]}'].shipment.trackingNumber' >> track-number.txt
        echo $curl9 | jq '.data.guestOrder.groups_2101['${i[@]}'].shipment.trackingUrl' >> track-url.txt
        echo "9"
        break
      fi
    done
  fi
done

curl10=`curl -s 'https://www.walmart.com/orchestra/home/graphql' \
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
  if [[ $curl10 =~ "error" ]]; then
    echo "Sai thông tin đăng nhập-Record số 10"
    break
  elif [[ $curl10 =~ "blocked" ]]; then
    echo "Lỗi blocked-Record số 10"
    break
  else
    for (( j=0; j<=4; j++))
    do
      if [[ `echo $curl10 | jq '.data.guestOrder.groups_2101['${i[@]}'].items['${j[@]}'].product.usItemId'` == '"10752553"' ]]; then
        echo $curl10 | jq '.data.guestOrder.id' >> track-OrderID.txt
        echo $curl10 | jq '.data.guestOrder.customer.email' >> track-email.txt
        echo $curl10 | jq '.data.guestOrder.groups_2101['${i[@]}'].items['${j[@]}'].product.usItemId' >> track-usItemId.txt
        echo $curl10 | jq '.data.guestOrder.groups_2101['${i[@]}'].items['${j[@]}'].priceInfo.linePrice.value' >> track-priceValue.txt
        echo $curl10 | jq '.data.guestOrder.groups_2101['${i[@]}'].deliveryAddress.fullName' >> track-fullName.txt
        echo $curl10 | jq '.data.guestOrder.groups_2101['${i[@]}'].deliveryAddress.address.addressString' >> track-address.txt
        echo $curl10 | jq '.data.guestOrder.groups_2101['${i[@]}'].status.message.parts[].text' >> track-status.txt
        echo $curl10 | jq '.data.guestOrder.groups_2101['${i[@]}'].shipment.trackingNumber' >> track-number.txt
        echo $curl10 | jq '.data.guestOrder.groups_2101['${i[@]}'].shipment.trackingUrl' >> track-url.txt
        echo "10"
        break
      fi
    done
  fi
done

curl11=`curl -s 'https://www.walmart.com/orchestra/home/graphql' \
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
  if [[ $curl11 =~ "error" ]]; then
    echo "Sai thông tin đăng nhập-Record số 11"
    break
  elif [[ $curl11 =~ "blocked" ]]; then
    echo "Lỗi blocked-Record số 11"
    break
  else
    for (( j=0; j<=4; j++))
    do
      if [[ `echo $curl11 | jq '.data.guestOrder.groups_2101['${i[@]}'].items['${j[@]}'].product.usItemId'` == '"6371940"' ]]; then
        echo $curl11 | jq '.data.guestOrder.id' >> track-OrderID.txt
        echo $curl11 | jq '.data.guestOrder.customer.email' >> track-email.txt
        echo $curl11 | jq '.data.guestOrder.groups_2101['${i[@]}'].items['${j[@]}'].product.usItemId' >> track-usItemId.txt
        echo $curl11 | jq '.data.guestOrder.groups_2101['${i[@]}'].items['${j[@]}'].priceInfo.linePrice.value' >> track-priceValue.txt
        echo $curl11 | jq '.data.guestOrder.groups_2101['${i[@]}'].deliveryAddress.fullName' >> track-fullName.txt
        echo $curl11 | jq '.data.guestOrder.groups_2101['${i[@]}'].deliveryAddress.address.addressString' >> track-address.txt
        echo $curl11 | jq '.data.guestOrder.groups_2101['${i[@]}'].status.message.parts[].text' >> track-status.txt
        echo $curl11 | jq '.data.guestOrder.groups_2101['${i[@]}'].shipment.trackingNumber' >> track-number.txt
        echo $curl11 | jq '.data.guestOrder.groups_2101['${i[@]}'].shipment.trackingUrl' >> track-url.txt
        echo "11"
        break
      fi
    done
  fi
done

curl12=`curl -s 'https://www.walmart.com/orchestra/home/graphql' \
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
  if [[ $curl12 =~ "error" ]]; then
    echo "Sai thông tin đăng nhập-Record số 12"
    break
  elif [[ $curl12 =~ "blocked" ]]; then
    echo "Lỗi blocked-Record số 12"
    break
  else
    for (( j=0; j<=4; j++))
    do
      if [[ `echo $curl12 | jq '.data.guestOrder.groups_2101['${i[@]}'].items['${j[@]}'].product.usItemId'` == '"337077643"' ]]; then
        echo $curl12 | jq '.data.guestOrder.id' >> track-OrderID.txt
        echo $curl12 | jq '.data.guestOrder.customer.email' >> track-email.txt
        echo $curl12 | jq '.data.guestOrder.groups_2101['${i[@]}'].items['${j[@]}'].product.usItemId' >> track-usItemId.txt
        echo $curl12 | jq '.data.guestOrder.groups_2101['${i[@]}'].items['${j[@]}'].priceInfo.linePrice.value' >> track-priceValue.txt
        echo $curl12 | jq '.data.guestOrder.groups_2101['${i[@]}'].deliveryAddress.fullName' >> track-fullName.txt
        echo $curl12 | jq '.data.guestOrder.groups_2101['${i[@]}'].deliveryAddress.address.addressString' >> track-address.txt
        echo $curl12 | jq '.data.guestOrder.groups_2101['${i[@]}'].status.message.parts[].text' >> track-status.txt
        echo $curl12 | jq '.data.guestOrder.groups_2101['${i[@]}'].shipment.trackingNumber' >> track-number.txt
        echo $curl12 | jq '.data.guestOrder.groups_2101['${i[@]}'].shipment.trackingUrl' >> track-url.txt
        echo "12"
        break
      fi
    done
  fi
done

curl13=`curl -s 'https://www.walmart.com/orchestra/home/graphql' \
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
  if [[ $curl13 =~ "error" ]]; then
    echo "Sai thông tin đăng nhập-Record số 13"
    break
  elif [[ $curl13 =~ "blocked" ]]; then
    echo "Lỗi blocked-Record số 13"
    break
  else
    for (( j=0; j<=4; j++))
    do
      if [[ `echo $curl13 | jq '.data.guestOrder.groups_2101['${i[@]}'].items['${j[@]}'].product.usItemId'` == '"755361385"' ]]; then
        echo $curl13 | jq '.data.guestOrder.id' >> track-OrderID.txt
        echo $curl13 | jq '.data.guestOrder.customer.email' >> track-email.txt
        echo $curl13 | jq '.data.guestOrder.groups_2101['${i[@]}'].items['${j[@]}'].product.usItemId' >> track-usItemId.txt
        echo $curl13 | jq '.data.guestOrder.groups_2101['${i[@]}'].items['${j[@]}'].priceInfo.linePrice.value' >> track-priceValue.txt
        echo $curl13 | jq '.data.guestOrder.groups_2101['${i[@]}'].deliveryAddress.fullName' >> track-fullName.txt
        echo $curl13 | jq '.data.guestOrder.groups_2101['${i[@]}'].deliveryAddress.address.addressString' >> track-address.txt
        echo $curl13 | jq '.data.guestOrder.groups_2101['${i[@]}'].status.message.parts[].text' >> track-status.txt
        echo $curl13 | jq '.data.guestOrder.groups_2101['${i[@]}'].shipment.trackingNumber' >> track-number.txt
        echo $curl13 | jq '.data.guestOrder.groups_2101['${i[@]}'].shipment.trackingUrl' >> track-url.txt
        echo "13"
        break
      fi
    done
  fi
done

curl14=`curl -s 'https://www.walmart.com/orchestra/home/graphql' \
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
  if [[ $curl14 =~ "error" ]]; then
    echo "Sai thông tin đăng nhập-Record số 14"
    break
  elif [[ $curl14 =~ "blocked" ]]; then
    echo "Lỗi blocked-Record số 14"
    break
  else
    for (( j=0; j<=4; j++))
    do
      if [[ `echo $curl14 | jq '.data.guestOrder.groups_2101['${i[@]}'].items['${j[@]}'].product.usItemId'` == '"249900363"' ]]; then
        echo $curl14 | jq '.data.guestOrder.id' >> track-OrderID.txt
        echo $curl14 | jq '.data.guestOrder.customer.email' >> track-email.txt
        echo $curl14 | jq '.data.guestOrder.groups_2101['${i[@]}'].items['${j[@]}'].product.usItemId' >> track-usItemId.txt
        echo $curl14 | jq '.data.guestOrder.groups_2101['${i[@]}'].items['${j[@]}'].priceInfo.linePrice.value' >> track-priceValue.txt
        echo $curl14 | jq '.data.guestOrder.groups_2101['${i[@]}'].deliveryAddress.fullName' >> track-fullName.txt
        echo $curl14 | jq '.data.guestOrder.groups_2101['${i[@]}'].deliveryAddress.address.addressString' >> track-address.txt
        echo $curl14 | jq '.data.guestOrder.groups_2101['${i[@]}'].status.message.parts[].text' >> track-status.txt
        echo $curl14 | jq '.data.guestOrder.groups_2101['${i[@]}'].shipment.trackingNumber' >> track-number.txt
        echo $curl14 | jq '.data.guestOrder.groups_2101['${i[@]}'].shipment.trackingUrl' >> track-url.txt
        echo "14"
        break
      fi
    done
  fi
done

curl15=`curl -s 'https://www.walmart.com/orchestra/home/graphql' \
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
  if [[ $curl15 =~ "error" ]]; then
    echo "Sai thông tin đăng nhập-Record số 15"
    break
  elif [[ $curl15 =~ "blocked" ]]; then
    echo "Lỗi blocked-Record số 15"
    break
  else
    for (( j=0; j<=4; j++))
    do
      if [[ `echo $curl15 | jq '.data.guestOrder.groups_2101['${i[@]}'].items['${j[@]}'].product.usItemId'` == '"55234301"' ]]; then
        echo $curl15 | jq '.data.guestOrder.id' >> track-OrderID.txt
        echo $curl15 | jq '.data.guestOrder.customer.email' >> track-email.txt
        echo $curl15 | jq '.data.guestOrder.groups_2101['${i[@]}'].items['${j[@]}'].product.usItemId' >> track-usItemId.txt
        echo $curl15 | jq '.data.guestOrder.groups_2101['${i[@]}'].items['${j[@]}'].priceInfo.linePrice.value' >> track-priceValue.txt
        echo $curl15 | jq '.data.guestOrder.groups_2101['${i[@]}'].deliveryAddress.fullName' >> track-fullName.txt
        echo $curl15 | jq '.data.guestOrder.groups_2101['${i[@]}'].deliveryAddress.address.addressString' >> track-address.txt
        echo $curl15 | jq '.data.guestOrder.groups_2101['${i[@]}'].status.message.parts[].text' >> track-status.txt
        echo $curl15 | jq '.data.guestOrder.groups_2101['${i[@]}'].shipment.trackingNumber' >> track-number.txt
        echo $curl15 | jq '.data.guestOrder.groups_2101['${i[@]}'].shipment.trackingUrl' >> track-url.txt
        echo "15"
        break
      fi
    done
  fi
done

curl16=`curl -s 'https://www.walmart.com/orchestra/home/graphql' \
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
  if [[ $curl16 =~ "error" ]]; then
    echo "Sai thông tin đăng nhập-Record số 16"
    break
  elif [[ $curl16 =~ "blocked" ]]; then
    echo "Lỗi blocked-Record số 16"
    break
  else
    for (( j=0; j<=4; j++))
    do
      if [[ `echo $curl16 | jq '.data.guestOrder.groups_2101['${i[@]}'].items['${j[@]}'].product.usItemId'` == '"137359681"' ]]; then
        echo $curl16 | jq '.data.guestOrder.id' >> track-OrderID.txt
        echo $curl16 | jq '.data.guestOrder.customer.email' >> track-email.txt
        echo $curl16 | jq '.data.guestOrder.groups_2101['${i[@]}'].items['${j[@]}'].product.usItemId' >> track-usItemId.txt
        echo $curl16 | jq '.data.guestOrder.groups_2101['${i[@]}'].items['${j[@]}'].priceInfo.linePrice.value' >> track-priceValue.txt
        echo $curl16 | jq '.data.guestOrder.groups_2101['${i[@]}'].deliveryAddress.fullName' >> track-fullName.txt
        echo $curl16 | jq '.data.guestOrder.groups_2101['${i[@]}'].deliveryAddress.address.addressString' >> track-address.txt
        echo $curl16 | jq '.data.guestOrder.groups_2101['${i[@]}'].status.message.parts[].text' >> track-status.txt
        echo $curl16 | jq '.data.guestOrder.groups_2101['${i[@]}'].shipment.trackingNumber' >> track-number.txt
        echo $curl16 | jq '.data.guestOrder.groups_2101['${i[@]}'].shipment.trackingUrl' >> track-url.txt
        echo "16"
        break
      fi
    done
  fi
done

curl17=`curl -s 'https://www.walmart.com/orchestra/home/graphql' \
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
  if [[ $curl17 =~ "error" ]]; then
    echo "Sai thông tin đăng nhập-Record số 17"
    break
  elif [[ $curl17 =~ "blocked" ]]; then
    echo "Lỗi blocked-Record số 17"
    break
  else
    for (( j=0; j<=4; j++))
    do
      if [[ `echo $curl17 | jq '.data.guestOrder.groups_2101['${i[@]}'].items['${j[@]}'].product.usItemId'` == '"874080200"' ]]; then
        echo $curl17 | jq '.data.guestOrder.id' >> track-OrderID.txt
        echo $curl17 | jq '.data.guestOrder.customer.email' >> track-email.txt
        echo $curl17 | jq '.data.guestOrder.groups_2101['${i[@]}'].items['${j[@]}'].product.usItemId' >> track-usItemId.txt
        echo $curl17 | jq '.data.guestOrder.groups_2101['${i[@]}'].items['${j[@]}'].priceInfo.linePrice.value' >> track-priceValue.txt
        echo $curl17 | jq '.data.guestOrder.groups_2101['${i[@]}'].deliveryAddress.fullName' >> track-fullName.txt
        echo $curl17 | jq '.data.guestOrder.groups_2101['${i[@]}'].deliveryAddress.address.addressString' >> track-address.txt
        echo $curl17 | jq '.data.guestOrder.groups_2101['${i[@]}'].status.message.parts[].text' >> track-status.txt
        echo $curl17 | jq '.data.guestOrder.groups_2101['${i[@]}'].shipment.trackingNumber' >> track-number.txt
        echo $curl17 | jq '.data.guestOrder.groups_2101['${i[@]}'].shipment.trackingUrl' >> track-url.txt
        echo "17"
        break
      fi
    done
  fi
done

curl18=`curl -s 'https://www.walmart.com/orchestra/home/graphql' \
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
  if [[ $curl18 =~ "error" ]]; then
    echo "Sai thông tin đăng nhập-Record số 18"
    break
  elif [[ $curl18 =~ "blocked" ]]; then
    echo "Lỗi blocked-Record số 18"
    break
  else
    for (( j=0; j<=4; j++))
    do
      if [[ `echo $curl18 | jq '.data.guestOrder.groups_2101['${i[@]}'].items['${j[@]}'].product.usItemId'` == '"54297033"' ]]; then
        echo $curl18 | jq '.data.guestOrder.id' >> track-OrderID.txt
        echo $curl18 | jq '.data.guestOrder.customer.email' >> track-email.txt
        echo $curl18 | jq '.data.guestOrder.groups_2101['${i[@]}'].items['${j[@]}'].product.usItemId' >> track-usItemId.txt
        echo $curl18 | jq '.data.guestOrder.groups_2101['${i[@]}'].items['${j[@]}'].priceInfo.linePrice.value' >> track-priceValue.txt
        echo $curl18 | jq '.data.guestOrder.groups_2101['${i[@]}'].deliveryAddress.fullName' >> track-fullName.txt
        echo $curl18 | jq '.data.guestOrder.groups_2101['${i[@]}'].deliveryAddress.address.addressString' >> track-address.txt
        echo $curl18 | jq '.data.guestOrder.groups_2101['${i[@]}'].status.message.parts[].text' >> track-status.txt
        echo $curl18 | jq '.data.guestOrder.groups_2101['${i[@]}'].shipment.trackingNumber' >> track-number.txt
        echo $curl18 | jq '.data.guestOrder.groups_2101['${i[@]}'].shipment.trackingUrl' >> track-url.txt
        echo "18"
        break
      fi
    done
  fi
done

curl19=`curl -s 'https://www.walmart.com/orchestra/home/graphql' \
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
  if [[ $curl19 =~ "error" ]]; then
    echo "Sai thông tin đăng nhập-Record số 19"
    break
  elif [[ $curl19 =~ "blocked" ]]; then
    echo "Lỗi blocked-Record số 19"
    break
  else
    for (( j=0; j<=4; j++))
    do
      if [[ `echo $curl19 | jq '.data.guestOrder.groups_2101['${i[@]}'].items['${j[@]}'].product.usItemId'` == '"19524988"' ]]; then
        echo $curl19 | jq '.data.guestOrder.id' >> track-OrderID.txt
        echo $curl19 | jq '.data.guestOrder.customer.email' >> track-email.txt
        echo $curl19 | jq '.data.guestOrder.groups_2101['${i[@]}'].items['${j[@]}'].product.usItemId' >> track-usItemId.txt
        echo $curl19 | jq '.data.guestOrder.groups_2101['${i[@]}'].items['${j[@]}'].priceInfo.linePrice.value' >> track-priceValue.txt
        echo $curl19 | jq '.data.guestOrder.groups_2101['${i[@]}'].deliveryAddress.fullName' >> track-fullName.txt
        echo $curl19 | jq '.data.guestOrder.groups_2101['${i[@]}'].deliveryAddress.address.addressString' >> track-address.txt
        echo $curl19 | jq '.data.guestOrder.groups_2101['${i[@]}'].status.message.parts[].text' >> track-status.txt
        echo $curl19 | jq '.data.guestOrder.groups_2101['${i[@]}'].shipment.trackingNumber' >> track-number.txt
        echo $curl19 | jq '.data.guestOrder.groups_2101['${i[@]}'].shipment.trackingUrl' >> track-url.txt
        echo "19"
        break
      fi
    done
  fi
done

curl20=`curl -s 'https://www.walmart.com/orchestra/home/graphql' \
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
  if [[ $curl20 =~ "error" ]]; then
    echo "Sai thông tin đăng nhập-Record số 20"
    break
  elif [[ $curl20 =~ "blocked" ]]; then
    echo "Lỗi blocked-Record số 20"
    break
  else
    for (( j=0; j<=4; j++))
    do
      if [[ `echo $curl20 | jq '.data.guestOrder.groups_2101['${i[@]}'].items['${j[@]}'].product.usItemId'` == '"874080200"' ]]; then
        echo $curl20 | jq '.data.guestOrder.id' >> track-OrderID.txt
        echo $curl20 | jq '.data.guestOrder.customer.email' >> track-email.txt
        echo $curl20 | jq '.data.guestOrder.groups_2101['${i[@]}'].items['${j[@]}'].product.usItemId' >> track-usItemId.txt
        echo $curl20 | jq '.data.guestOrder.groups_2101['${i[@]}'].items['${j[@]}'].priceInfo.linePrice.value' >> track-priceValue.txt
        echo $curl20 | jq '.data.guestOrder.groups_2101['${i[@]}'].deliveryAddress.fullName' >> track-fullName.txt
        echo $curl20 | jq '.data.guestOrder.groups_2101['${i[@]}'].deliveryAddress.address.addressString' >> track-address.txt
        echo $curl20 | jq '.data.guestOrder.groups_2101['${i[@]}'].status.message.parts[].text' >> track-status.txt
        echo $curl20 | jq '.data.guestOrder.groups_2101['${i[@]}'].shipment.trackingNumber' >> track-number.txt
        echo $curl20 | jq '.data.guestOrder.groups_2101['${i[@]}'].shipment.trackingUrl' >> track-url.txt
        echo "20"
        break
      fi
    done
  fi
done

curl21=`curl -s 'https://www.walmart.com/orchestra/home/graphql' \
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
  --data-raw $'{"query":"query getGuestOrder($orderId:ID\u0021 $emailAddress:String\u0021){guestOrder(input:{id:$orderId emailAddress:$emailAddress}){...OrderFieldsFragment}}fragment cancelReason on OrderCancelReason{__typename subReasonCode subDescription}fragment priceDetailFragment on OrderPriceDetailRow{label value displayValue info{title message}rowInfo{...orderPriceDetailRowInfo}}fragment orderPriceDetailRowInfo on OrderPriceDetailRowInfo{title message{...textFragment}}fragment price on Price{displayValue value}fragment variants on MapEntry{name value}fragment OrderAddOn on OrderAddOn{lineId uniqueLineId productInfo{name usItemId offerId}quantityString quantityLabel type fulfillmentInstructions{...textFragment}actions{manageProtectionPlan{...orderActionFragment}cancel}priceInfo{linePrice{...price}}quantity isActive}fragment orderDonationDetails on OrderDonationDetails{message{...textFragment}emailReceipt emailReceiptToken status{...textFragment}errorStatus}fragment orderLineItem on OrderLineItem{id uniqueId actions{contactSeller cancel addToCart configureCake reviewItem resendEGiftCardToken protectionPlan{...orderActionFragment}manageProtectionPlan{...orderActionFragment}}isGift digitalDeliveryMessage quantity quantityString quantityLabel isSubstitutionSelected fulfilledItems{id quantityString priceInfo{itemPrice{value}}product{usItemId name}}isReturnable returnEligibilityMessage product{name usItemId imageInfo{thumbnailUrl}canonicalUrl offerId sellerId sellerName hasSellerBadge seller{sellerId name}orderLimit orderMinLimit weightIncrement salesUnit salesUnitType isSubstitutionEligible isAlcohol}reshop{reshopMessage isShippingAvailable minPromiseDate maxPromiseDate}selectedVariants{...variants}variantAdditionalInfo{parts{text nativeAction}}priceInfo{priceDisplayCodes{showItemPrice priceDisplayCondition finalCostByWeight}itemPrice{...price}linePrice{...price}unitPrice{...price}preDiscountedLinePrice{...price}additionalLines{name value}}discounts{label labelText{...textFragment}}itemReviewed activationCodes{label code}protectionPlanMessage{...textFragment}showSeller isShippedByWalmart seller{id name isPro}digitalDeliveryPhoneNumber addOns{...OrderAddOn}multiboxBundleId}fragment DriverFragment on Driver{id firstName photoUrl}fragment OrderGroupFragment on OrderGroup{driver{...DriverFragment}deliveryDate fulfillmentType status{...OrderGroupStatusFragment}showSeller isShippedByWalmart seller{...SellerFragment}id itemCount items{...LiteLineItemFragment}pickupPerson{firstName lastName email}accessPointId shipment{...ShipmentFragment}returnEligibilityMessage actions{...OrderGroupActionsFragment}recipientEmailAddress digitalDelivery{...DigitalDeliveryFragment}tireInstallationReservation{status extraText}}fragment OrderGroupStatusFragment on OrderGroupStatus{statusType showStatusTracker statusTracker{status label isCurrent}message{...textFragment}subtext subMessage{...textFragment}notice helpCenterText{...textFragment}}fragment textFragment on Text{parts{bold url text nativeAction lineBreak}}fragment LiteLineItemFragment on OrderLineItem{id quantity product{name usItemId imageInfo{thumbnailUrl}offerId isAlcohol}priceInfo{linePrice{...price}}}fragment SellerFragment on GroupSeller{id name isPro}fragment DigitalDeliveryFragment on DigitalDelivery{title name instructions{...textFragment}}fragment ShipmentFragment on Shipment{id trackingNumber isExternalTracking trackingUrl proofOfDelivery{photoUrl photoPreviewUrl showPreview}}fragment OrderGroupActionsFragment on OrderGroupActions{reorder edit track changeSlot checkin editDeliveryInstructions editPickupPerson editTip tip cancel enableTip{...orderActionFragment}enableEdit{...orderActionFragment}rescheduleTireInstall{...orderActionFragment}cancelTireInstall{...orderActionFragment}help viewCancellationDetails{...cancellationDetailsActionFragment}}fragment cancellationDetailsActionFragment on CancellationDetailsAction{label heading text{...textFragment}}fragment ODPGroupCategoryFragment on OrderCategory{type name subtext returnMessage substitutionsBanner{...textFragment}showExtendedSubstitutions actions{substitutions{message label type}nilPickReshop{message action{text url}}returnDetails viewCancellationDetails{...cancellationDetailsActionFragment}trackOnInHomeApp}banner{...textFragment}accordionState items{...orderLineItem}substitutions{...orderLineItem fulfilledItems{...orderLineItem}}returnInfo{...returnInfoFragment}}fragment ODPGroupFragment on OrderGroup{id fulfillmentType deliveryMessage deliveryAddress{fullName firstName lastName address{...addressFragment}}deliveryInstructions{text type typeText}deliveryPreferences{text{...textFragment}cta{...orderActionFragment}}editSubstitutionsCutOff status{statusType showStatusTracker message{...textFragment}notice helpCenterText{...textFragment}}itemCount isCategorized categories{...ODPGroupCategoryFragment}seller{id name isPro}shipment{id trackingNumber}actions{reorder edit track changeSlot checkin editDeliveryInstructions editPickupPerson tip cancel help enableTip{...orderActionFragment}enableEdit{...orderActionFragment}viewCancellationDetails{...cancellationDetailsActionFragment}enableInHome{...orderActionFragment}createGiftReceipt}cutOffTimestamp isEditSubstitutionsEligible isInHome giftDetails{recipientAddress{fullName}recipientEmail senderName giftMessage}donationDetails{...orderDonationDetails}}fragment returnInfoFragment on ReturnInfo{returnOrderId type refundPriceDetails{__typename...refundPriceDetailsFragment}refundMessage tierRefundMessage paymentMethods{__typename description cardType paymentType displayValues message{...textFragment}}actions{__typename generate scheduleOrModifyPickup{text url}reschedulePickup editPickupContact}shippingLabelUrl qrCodeImageUrl carriers{__typename id name}pickupCarrier pickupContact{nameAndAddress{fullName firstName lastName address{addressString city state postalCode addressLineOne addressLineTwo country}}phone}pickupConfirmationNumber bannerMessage{...textFragment}}fragment refundPriceDetailsFragment on RefundPriceDetails{subTotal{__typename...orderPriceDetailRowFragment}fees{__typename...orderPriceDetailRowFragment}discounts{__typename...orderPriceDetailRowFragment}taxTotal{__typename...orderPriceDetailRowFragment}grandTotal{__typename...orderPriceDetailRowFragment}}fragment orderPriceDetailRowFragment on OrderPriceDetailRow{label displayValue value info{__typename title message}}fragment addressFragment on OrderAddress{addressString addressLineOne addressLineTwo state postalCode city}fragment ODPPickupInfo on OrderGroup{pickupInstructions pickupPerson{...person}alternatePickupPerson{...person}store{id name address{...addressFragment}}}fragment person on OrderPickupPerson{firstName lastName email}fragment ODPTippingInfo on OrderGroup{addTipMessage{...textFragment}driver{...DriverFragment}tipping{min{...price}max{...price}suggested{...price}preselected}subtotal{...price}}fragment orderActionFragment on Action{text url}fragment orderCustomer on OrderCustomer{id firstName lastName email isGuest isEmailRegistered}fragment OrderFieldsFragment on Order{__typename id version type customer{...orderCustomer}displayId idBarcodeImageUrl(barWidth:3 barHeight:100) isFuelPurchase title shortTitle timezone tippableGroup{...OrderGroupFragment}amendableGroup{id changeSlotIterationsLeft cutOffTimestamp fulfillmentType deliveryAddress{fullName firstName lastName address{addressString addressLineOne addressLineTwo state postalCode city country}}isAmendInProgress}substitutionsBanner{heading subheading longSubheading}groups_2101{__typename...OrderGroupFragment...ODPGroupFragment...ODPPickupInfo...ODPTippingInfo}multiboxBundles{...orderLineItem}itemCancelReasons{__typename...cancelReason}groupCancelReasons{__typename...cancelReason}priceDetails{__typename subTotal{__typename...priceDetailFragment}taxTotal{__typename...priceDetailFragment}grandTotal{__typename...priceDetailFragment}authorizationAmount{__typename...priceDetailFragment}fees{__typename...priceDetailFragment}discounts{__typename...priceDetailFragment}minimumThreshold{__typename...price}belowMinimumFee{__typename...priceDetailFragment}driverTip{__typename...priceDetailFragment}donations{__typename...priceDetailFragment}}paymentMethods{__typename description cardType paymentType displayValues message{...textFragment}actions{connectToCapitalOne{...orderActionFragment}visitAffirm{...orderActionFragment}}}actions{__typename return pendingReturn cancel startReturn{...orderActionFragment}reorder}banners{...textFragment}}","variables":{"orderId":"2862239293547","emailAddress":"rodneybenson23@hotmail.com"}}' \
  --compressed`
 
for (( i=0; i<=4; i++ ))
  do
  if [[ $curl21 =~ "error" ]]; then
    echo "Sai thông tin đăng nhập-Record số 21"
    break
  elif [[ $curl21 =~ "blocked" ]]; then
    echo "Lỗi blocked-Record số 21"
    break
  else
    for (( j=0; j<=4; j++))
    do
      if [[ `echo $curl21 | jq '.data.guestOrder.groups_2101['${i[@]}'].items['${j[@]}'].product.usItemId'` == '"35702152"' ]]; then
        echo $curl21 | jq '.data.guestOrder.id' >> track-OrderID.txt
        echo $curl21 | jq '.data.guestOrder.customer.email' >> track-email.txt
        echo $curl21 | jq '.data.guestOrder.groups_2101['${i[@]}'].items['${j[@]}'].product.usItemId' >> track-usItemId.txt
        echo $curl21 | jq '.data.guestOrder.groups_2101['${i[@]}'].items['${j[@]}'].priceInfo.linePrice.value' >> track-priceValue.txt
        echo $curl21 | jq '.data.guestOrder.groups_2101['${i[@]}'].deliveryAddress.fullName' >> track-fullName.txt
        echo $curl21 | jq '.data.guestOrder.groups_2101['${i[@]}'].deliveryAddress.address.addressString' >> track-address.txt
        echo $curl21 | jq '.data.guestOrder.groups_2101['${i[@]}'].status.message.parts[].text' >> track-status.txt
        echo $curl21 | jq '.data.guestOrder.groups_2101['${i[@]}'].shipment.trackingNumber' >> track-number.txt
        echo $curl21 | jq '.data.guestOrder.groups_2101['${i[@]}'].shipment.trackingUrl' >> track-url.txt
        echo "21"
        break
      fi
    done
  fi
done

curl22=`curl -s 'https://www.walmart.com/orchestra/home/graphql' \
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
  if [[ $curl22 =~ "error" ]]; then
    echo "Sai thông tin đăng nhập-Record số 22"
    break
  elif [[ $curl22 =~ "blocked" ]]; then
    echo "Lỗi blocked-Record số 22"
    break
  else
    for (( j=0; j<=4; j++))
    do
      if [[ `echo $curl22 | jq '.data.guestOrder.groups_2101['${i[@]}'].items['${j[@]}'].product.usItemId'` == '"217281734"' ]]; then
        echo $curl22 | jq '.data.guestOrder.id' >> track-OrderID.txt
        echo $curl22 | jq '.data.guestOrder.customer.email' >> track-email.txt
        echo $curl22 | jq '.data.guestOrder.groups_2101['${i[@]}'].items['${j[@]}'].product.usItemId' >> track-usItemId.txt
        echo $curl22 | jq '.data.guestOrder.groups_2101['${i[@]}'].items['${j[@]}'].priceInfo.linePrice.value' >> track-priceValue.txt
        echo $curl22 | jq '.data.guestOrder.groups_2101['${i[@]}'].deliveryAddress.fullName' >> track-fullName.txt
        echo $curl22 | jq '.data.guestOrder.groups_2101['${i[@]}'].deliveryAddress.address.addressString' >> track-address.txt
        echo $curl22 | jq '.data.guestOrder.groups_2101['${i[@]}'].status.message.parts[].text' >> track-status.txt
        echo $curl22 | jq '.data.guestOrder.groups_2101['${i[@]}'].shipment.trackingNumber' >> track-number.txt
        echo $curl22 | jq '.data.guestOrder.groups_2101['${i[@]}'].shipment.trackingUrl' >> track-url.txt
        echo "22"
        break
      fi
    done
  fi
done

curl23=`curl -s 'https://www.walmart.com/orchestra/home/graphql' \
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
  if [[ $curl23 =~ "error" ]]; then
    echo "Sai thông tin đăng nhập-Record số 23"
    break
  elif [[ $curl23 =~ "blocked" ]]; then
    echo "Lỗi blocked-Record số 23"
    break
  else
    for (( j=0; j<=4; j++))
    do
      if [[ `echo $curl23 | jq '.data.guestOrder.groups_2101['${i[@]}'].items['${j[@]}'].product.usItemId'` == '"54315959"' ]]; then
        echo $curl23 | jq '.data.guestOrder.id' >> track-OrderID.txt
        echo $curl23 | jq '.data.guestOrder.customer.email' >> track-email.txt
        echo $curl23 | jq '.data.guestOrder.groups_2101['${i[@]}'].items['${j[@]}'].product.usItemId' >> track-usItemId.txt
        echo $curl23 | jq '.data.guestOrder.groups_2101['${i[@]}'].items['${j[@]}'].priceInfo.linePrice.value' >> track-priceValue.txt
        echo $curl23 | jq '.data.guestOrder.groups_2101['${i[@]}'].deliveryAddress.fullName' >> track-fullName.txt
        echo $curl23 | jq '.data.guestOrder.groups_2101['${i[@]}'].deliveryAddress.address.addressString' >> track-address.txt
        echo $curl23 | jq '.data.guestOrder.groups_2101['${i[@]}'].status.message.parts[].text' >> track-status.txt
        echo $curl23 | jq '.data.guestOrder.groups_2101['${i[@]}'].shipment.trackingNumber' >> track-number.txt
        echo $curl23 | jq '.data.guestOrder.groups_2101['${i[@]}'].shipment.trackingUrl' >> track-url.txt
        echo "23"
        break
      fi
    done
  fi
done

curl24=`curl -s 'https://www.walmart.com/orchestra/home/graphql' \
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
  if [[ $curl24 =~ "error" ]]; then
    echo "Sai thông tin đăng nhập-Record số 24"
    break
  elif [[ $curl24 =~ "blocked" ]]; then
    echo "Lỗi blocked-Record số 24"
    break
  else
    for (( j=0; j<=4; j++))
    do
      if [[ `echo $curl24 | jq '.data.guestOrder.groups_2101['${i[@]}'].items['${j[@]}'].product.usItemId'` == '"641220610"' ]]; then
        echo $curl24 | jq '.data.guestOrder.id' >> track-OrderID.txt
        echo $curl24 | jq '.data.guestOrder.customer.email' >> track-email.txt
        echo $curl24 | jq '.data.guestOrder.groups_2101['${i[@]}'].items['${j[@]}'].product.usItemId' >> track-usItemId.txt
        echo $curl24 | jq '.data.guestOrder.groups_2101['${i[@]}'].items['${j[@]}'].priceInfo.linePrice.value' >> track-priceValue.txt
        echo $curl24 | jq '.data.guestOrder.groups_2101['${i[@]}'].deliveryAddress.fullName' >> track-fullName.txt
        echo $curl24 | jq '.data.guestOrder.groups_2101['${i[@]}'].deliveryAddress.address.addressString' >> track-address.txt
        echo $curl24 | jq '.data.guestOrder.groups_2101['${i[@]}'].status.message.parts[].text' >> track-status.txt
        echo $curl24 | jq '.data.guestOrder.groups_2101['${i[@]}'].shipment.trackingNumber' >> track-number.txt
        echo $curl24 | jq '.data.guestOrder.groups_2101['${i[@]}'].shipment.trackingUrl' >> track-url.txt
        echo "24"
        break
      fi
    done
  fi
done

curl25=`curl -s 'https://www.walmart.com/orchestra/home/graphql' \
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
  if [[ $curl25 =~ "error" ]]; then
    echo "Sai thông tin đăng nhập-Record số 25"
    break
  elif [[ $curl25 =~ "blocked" ]]; then
    echo "Lỗi blocked-Record số 25"
    break
  else
    for (( j=0; j<=4; j++))
    do
      if [[ `echo $curl25 | jq '.data.guestOrder.groups_2101['${i[@]}'].items['${j[@]}'].product.usItemId'` == '"325768579"' ]]; then
        echo $curl25 | jq '.data.guestOrder.id' >> track-OrderID.txt
        echo $curl25 | jq '.data.guestOrder.customer.email' >> track-email.txt
        echo $curl25 | jq '.data.guestOrder.groups_2101['${i[@]}'].items['${j[@]}'].product.usItemId' >> track-usItemId.txt
        echo $curl25 | jq '.data.guestOrder.groups_2101['${i[@]}'].items['${j[@]}'].priceInfo.linePrice.value' >> track-priceValue.txt
        echo $curl25 | jq '.data.guestOrder.groups_2101['${i[@]}'].deliveryAddress.fullName' >> track-fullName.txt
        echo $curl25 | jq '.data.guestOrder.groups_2101['${i[@]}'].deliveryAddress.address.addressString' >> track-address.txt
        echo $curl25 | jq '.data.guestOrder.groups_2101['${i[@]}'].status.message.parts[].text' >> track-status.txt
        echo $curl25 | jq '.data.guestOrder.groups_2101['${i[@]}'].shipment.trackingNumber' >> track-number.txt
        echo $curl25 | jq '.data.guestOrder.groups_2101['${i[@]}'].shipment.trackingUrl' >> track-url.txt
        echo "25"
        break
      fi
    done
  fi
done

curl26=`curl -s 'https://www.walmart.com/orchestra/home/graphql' \
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
  if [[ $curl26 =~ "error" ]]; then
    echo "Sai thông tin đăng nhập-Record số 26"
    break
  elif [[ $curl26 =~ "blocked" ]]; then
    echo "Lỗi blocked-Record số 26"
    break
  else
    for (( j=0; j<=4; j++))
    do
      if [[ `echo $curl26 | jq '.data.guestOrder.groups_2101['${i[@]}'].items['${j[@]}'].product.usItemId'` == '"713811084"' ]]; then
        echo $curl26 | jq '.data.guestOrder.id' >> track-OrderID.txt
        echo $curl26 | jq '.data.guestOrder.customer.email' >> track-email.txt
        echo $curl26 | jq '.data.guestOrder.groups_2101['${i[@]}'].items['${j[@]}'].product.usItemId' >> track-usItemId.txt
        echo $curl26 | jq '.data.guestOrder.groups_2101['${i[@]}'].items['${j[@]}'].priceInfo.linePrice.value' >> track-priceValue.txt
        echo $curl26 | jq '.data.guestOrder.groups_2101['${i[@]}'].deliveryAddress.fullName' >> track-fullName.txt
        echo $curl26 | jq '.data.guestOrder.groups_2101['${i[@]}'].deliveryAddress.address.addressString' >> track-address.txt
        echo $curl26 | jq '.data.guestOrder.groups_2101['${i[@]}'].status.message.parts[].text' >> track-status.txt
        echo $curl26 | jq '.data.guestOrder.groups_2101['${i[@]}'].shipment.trackingNumber' >> track-number.txt
        echo $curl26 | jq '.data.guestOrder.groups_2101['${i[@]}'].shipment.trackingUrl' >> track-url.txt
        echo "26"
        break
      fi
    done
  fi
done

curl27=`curl -s 'https://www.walmart.com/orchestra/home/graphql' \
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
  if [[ $curl27 =~ "error" ]]; then
    echo "Sai thông tin đăng nhập-Record số 27"
    break
  elif [[ $curl27 =~ "blocked" ]]; then
    echo "Lỗi blocked-Record số 27"
    break
  else
    for (( j=0; j<=4; j++))
    do
      if [[ `echo $curl27 | jq '.data.guestOrder.groups_2101['${i[@]}'].items['${j[@]}'].product.usItemId'` == '"520367700"' ]]; then
        echo $curl27 | jq '.data.guestOrder.id' >> track-OrderID.txt
        echo $curl27 | jq '.data.guestOrder.customer.email' >> track-email.txt
        echo $curl27 | jq '.data.guestOrder.groups_2101['${i[@]}'].items['${j[@]}'].product.usItemId' >> track-usItemId.txt
        echo $curl27 | jq '.data.guestOrder.groups_2101['${i[@]}'].items['${j[@]}'].priceInfo.linePrice.value' >> track-priceValue.txt
        echo $curl27 | jq '.data.guestOrder.groups_2101['${i[@]}'].deliveryAddress.fullName' >> track-fullName.txt
        echo $curl27 | jq '.data.guestOrder.groups_2101['${i[@]}'].deliveryAddress.address.addressString' >> track-address.txt
        echo $curl27 | jq '.data.guestOrder.groups_2101['${i[@]}'].status.message.parts[].text' >> track-status.txt
        echo $curl27 | jq '.data.guestOrder.groups_2101['${i[@]}'].shipment.trackingNumber' >> track-number.txt
        echo $curl27 | jq '.data.guestOrder.groups_2101['${i[@]}'].shipment.trackingUrl' >> track-url.txt
        echo "27"
        break
      fi
    done
  fi
done

curl28=`curl -s 'https://www.walmart.com/orchestra/home/graphql' \
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
  if [[ $curl28 =~ "error" ]]; then
    echo "Sai thông tin đăng nhập-Record số 28"
    break
  elif [[ $curl28 =~ "blocked" ]]; then
    echo "Lỗi blocked-Record số 28"
    break
  else
    for (( j=0; j<=4; j++))
    do
      if [[ `echo $curl28 | jq '.data.guestOrder.groups_2101['${i[@]}'].items['${j[@]}'].product.usItemId'` == '"171122882"' ]]; then
        echo $curl28 | jq '.data.guestOrder.id' >> track-OrderID.txt
        echo $curl28 | jq '.data.guestOrder.customer.email' >> track-email.txt
        echo $curl28 | jq '.data.guestOrder.groups_2101['${i[@]}'].items['${j[@]}'].product.usItemId' >> track-usItemId.txt
        echo $curl28 | jq '.data.guestOrder.groups_2101['${i[@]}'].items['${j[@]}'].priceInfo.linePrice.value' >> track-priceValue.txt
        echo $curl28 | jq '.data.guestOrder.groups_2101['${i[@]}'].deliveryAddress.fullName' >> track-fullName.txt
        echo $curl28 | jq '.data.guestOrder.groups_2101['${i[@]}'].deliveryAddress.address.addressString' >> track-address.txt
        echo $curl28 | jq '.data.guestOrder.groups_2101['${i[@]}'].status.message.parts[].text' >> track-status.txt
        echo $curl28 | jq '.data.guestOrder.groups_2101['${i[@]}'].shipment.trackingNumber' >> track-number.txt
        echo $curl28 | jq '.data.guestOrder.groups_2101['${i[@]}'].shipment.trackingUrl' >> track-url.txt
        echo "28"
        break
      fi
    done
  fi
done

curl29=`curl -s 'https://www.walmart.com/orchestra/home/graphql' \
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
  if [[ $curl29 =~ "error" ]]; then
    echo "Sai thông tin đăng nhập-Record số 29"
    break
  elif [[ $curl29 =~ "blocked" ]]; then
    echo "Lỗi blocked-Record số 29"
    break
  else
    for (( j=0; j<=4; j++))
    do
      if [[ `echo $curl29 | jq '.data.guestOrder.groups_2101['${i[@]}'].items['${j[@]}'].product.usItemId'` == '"251382558"' ]]; then
        echo $curl29 | jq '.data.guestOrder.id' >> track-OrderID.txt
        echo $curl29 | jq '.data.guestOrder.customer.email' >> track-email.txt
        echo $curl29 | jq '.data.guestOrder.groups_2101['${i[@]}'].items['${j[@]}'].product.usItemId' >> track-usItemId.txt
        echo $curl29 | jq '.data.guestOrder.groups_2101['${i[@]}'].items['${j[@]}'].priceInfo.linePrice.value' >> track-priceValue.txt
        echo $curl29 | jq '.data.guestOrder.groups_2101['${i[@]}'].deliveryAddress.fullName' >> track-fullName.txt
        echo $curl29 | jq '.data.guestOrder.groups_2101['${i[@]}'].deliveryAddress.address.addressString' >> track-address.txt
        echo $curl29 | jq '.data.guestOrder.groups_2101['${i[@]}'].status.message.parts[].text' >> track-status.txt
        echo $curl29 | jq '.data.guestOrder.groups_2101['${i[@]}'].shipment.trackingNumber' >> track-number.txt
        echo $curl29 | jq '.data.guestOrder.groups_2101['${i[@]}'].shipment.trackingUrl' >> track-url.txt
        echo "29"
        break
      fi
    done
  fi
done

curl30=`curl -s 'https://www.walmart.com/orchestra/home/graphql' \
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
  if [[ $curl30 =~ "error" ]]; then
    echo "Sai thông tin đăng nhập-Record số 30"
    break
  elif [[ $curl30 =~ "blocked" ]]; then
    echo "Lỗi blocked-Record số 30"
    break
  else
    for (( j=0; j<=4; j++))
    do
      if [[ `echo $curl30 | jq '.data.guestOrder.groups_2101['${i[@]}'].items['${j[@]}'].product.usItemId'` == '"240828726"' ]]; then
        echo $curl30 | jq '.data.guestOrder.id' >> track-OrderID.txt
        echo $curl30 | jq '.data.guestOrder.customer.email' >> track-email.txt
        echo $curl30 | jq '.data.guestOrder.groups_2101['${i[@]}'].items['${j[@]}'].product.usItemId' >> track-usItemId.txt
        echo $curl30 | jq '.data.guestOrder.groups_2101['${i[@]}'].items['${j[@]}'].priceInfo.linePrice.value' >> track-priceValue.txt
        echo $curl30 | jq '.data.guestOrder.groups_2101['${i[@]}'].deliveryAddress.fullName' >> track-fullName.txt
        echo $curl30 | jq '.data.guestOrder.groups_2101['${i[@]}'].deliveryAddress.address.addressString' >> track-address.txt
        echo $curl30 | jq '.data.guestOrder.groups_2101['${i[@]}'].status.message.parts[].text' >> track-status.txt
        echo $curl30 | jq '.data.guestOrder.groups_2101['${i[@]}'].shipment.trackingNumber' >> track-number.txt
        echo $curl30 | jq '.data.guestOrder.groups_2101['${i[@]}'].shipment.trackingUrl' >> track-url.txt
        echo "30"
        break
      fi
    done
  fi
done

curl31=`curl -s 'https://www.walmart.com/orchestra/home/graphql' \
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
  if [[ $curl31 =~ "error" ]]; then
    echo "Sai thông tin đăng nhập-Record số 31"
    break
  elif [[ $curl31 =~ "blocked" ]]; then
    echo "Lỗi blocked-Record số 31"
    break
  else
    for (( j=0; j<=4; j++))
    do
      if [[ `echo $curl31 | jq '.data.guestOrder.groups_2101['${i[@]}'].items['${j[@]}'].product.usItemId'` == '"488588268"' ]]; then
        echo $curl31 | jq '.data.guestOrder.id' >> track-OrderID.txt
        echo $curl31 | jq '.data.guestOrder.customer.email' >> track-email.txt
        echo $curl31 | jq '.data.guestOrder.groups_2101['${i[@]}'].items['${j[@]}'].product.usItemId' >> track-usItemId.txt
        echo $curl31 | jq '.data.guestOrder.groups_2101['${i[@]}'].items['${j[@]}'].priceInfo.linePrice.value' >> track-priceValue.txt
        echo $curl31 | jq '.data.guestOrder.groups_2101['${i[@]}'].deliveryAddress.fullName' >> track-fullName.txt
        echo $curl31 | jq '.data.guestOrder.groups_2101['${i[@]}'].deliveryAddress.address.addressString' >> track-address.txt
        echo $curl31 | jq '.data.guestOrder.groups_2101['${i[@]}'].status.message.parts[].text' >> track-status.txt
        echo $curl31 | jq '.data.guestOrder.groups_2101['${i[@]}'].shipment.trackingNumber' >> track-number.txt
        echo $curl31 | jq '.data.guestOrder.groups_2101['${i[@]}'].shipment.trackingUrl' >> track-url.txt
        echo "31"
        break
      fi
    done
  fi
done

curl32=`curl -s 'https://www.walmart.com/orchestra/home/graphql' \
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
  if [[ $curl32 =~ "error" ]]; then
    echo "Sai thông tin đăng nhập-Record số 32"
    break
  elif [[ $curl32 =~ "blocked" ]]; then
    echo "Lỗi blocked-Record số 32"
    break
  else
    for (( j=0; j<=4; j++))
    do
      if [[ `echo $curl32 | jq '.data.guestOrder.groups_2101['${i[@]}'].items['${j[@]}'].product.usItemId'` == '"477200308"' ]]; then
        echo $curl32 | jq '.data.guestOrder.id' >> track-OrderID.txt
        echo $curl32 | jq '.data.guestOrder.customer.email' >> track-email.txt
        echo $curl32 | jq '.data.guestOrder.groups_2101['${i[@]}'].items['${j[@]}'].product.usItemId' >> track-usItemId.txt
        echo $curl32 | jq '.data.guestOrder.groups_2101['${i[@]}'].items['${j[@]}'].priceInfo.linePrice.value' >> track-priceValue.txt
        echo $curl32 | jq '.data.guestOrder.groups_2101['${i[@]}'].deliveryAddress.fullName' >> track-fullName.txt
        echo $curl32 | jq '.data.guestOrder.groups_2101['${i[@]}'].deliveryAddress.address.addressString' >> track-address.txt
        echo $curl32 | jq '.data.guestOrder.groups_2101['${i[@]}'].status.message.parts[].text' >> track-status.txt
        echo $curl32 | jq '.data.guestOrder.groups_2101['${i[@]}'].shipment.trackingNumber' >> track-number.txt
        echo $curl32 | jq '.data.guestOrder.groups_2101['${i[@]}'].shipment.trackingUrl' >> track-url.txt
        echo "32"
        break
      fi
    done
  fi
done

curl33=`curl -s 'https://www.walmart.com/orchestra/home/graphql' \
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
  if [[ $curl33 =~ "error" ]]; then
    echo "Sai thông tin đăng nhập-Record số 33"
    break
  elif [[ $curl33 =~ "blocked" ]]; then
    echo "Lỗi blocked-Record số 33"
    break
  else
    for (( j=0; j<=4; j++))
    do
      if [[ `echo $curl33 | jq '.data.guestOrder.groups_2101['${i[@]}'].items['${j[@]}'].product.usItemId'` == '"628834581"' ]]; then
        echo $curl33 | jq '.data.guestOrder.id' >> track-OrderID.txt
        echo $curl33 | jq '.data.guestOrder.customer.email' >> track-email.txt
        echo $curl33 | jq '.data.guestOrder.groups_2101['${i[@]}'].items['${j[@]}'].product.usItemId' >> track-usItemId.txt
        echo $curl33 | jq '.data.guestOrder.groups_2101['${i[@]}'].items['${j[@]}'].priceInfo.linePrice.value' >> track-priceValue.txt
        echo $curl33 | jq '.data.guestOrder.groups_2101['${i[@]}'].deliveryAddress.fullName' >> track-fullName.txt
        echo $curl33 | jq '.data.guestOrder.groups_2101['${i[@]}'].deliveryAddress.address.addressString' >> track-address.txt
        echo $curl33 | jq '.data.guestOrder.groups_2101['${i[@]}'].status.message.parts[].text' >> track-status.txt
        echo $curl33 | jq '.data.guestOrder.groups_2101['${i[@]}'].shipment.trackingNumber' >> track-number.txt
        echo $curl33 | jq '.data.guestOrder.groups_2101['${i[@]}'].shipment.trackingUrl' >> track-url.txt
        echo "33"
        break
      fi
    done
  fi
done

curl34=`curl -s 'https://www.walmart.com/orchestra/home/graphql' \
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
  if [[ $curl34 =~ "error" ]]; then
    echo "Sai thông tin đăng nhập-Record số 34"
    break
  elif [[ $curl34 =~ "blocked" ]]; then
    echo "Lỗi blocked-Record số 34"
    break
  else
    for (( j=0; j<=4; j++))
    do
      if [[ `echo $curl34 | jq '.data.guestOrder.groups_2101['${i[@]}'].items['${j[@]}'].product.usItemId'` == '"988607514"' ]]; then
        echo $curl34 | jq '.data.guestOrder.id' >> track-OrderID.txt
        echo $curl34 | jq '.data.guestOrder.customer.email' >> track-email.txt
        echo $curl34 | jq '.data.guestOrder.groups_2101['${i[@]}'].items['${j[@]}'].product.usItemId' >> track-usItemId.txt
        echo $curl34 | jq '.data.guestOrder.groups_2101['${i[@]}'].items['${j[@]}'].priceInfo.linePrice.value' >> track-priceValue.txt
        echo $curl34 | jq '.data.guestOrder.groups_2101['${i[@]}'].deliveryAddress.fullName' >> track-fullName.txt
        echo $curl34 | jq '.data.guestOrder.groups_2101['${i[@]}'].deliveryAddress.address.addressString' >> track-address.txt
        echo $curl34 | jq '.data.guestOrder.groups_2101['${i[@]}'].status.message.parts[].text' >> track-status.txt
        echo $curl34 | jq '.data.guestOrder.groups_2101['${i[@]}'].shipment.trackingNumber' >> track-number.txt
        echo $curl34 | jq '.data.guestOrder.groups_2101['${i[@]}'].shipment.trackingUrl' >> track-url.txt
        echo "34"
        break
      fi
    done
  fi
done

curl35=`curl -s 'https://www.walmart.com/orchestra/home/graphql' \
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
  if [[ $curl35 =~ "error" ]]; then
    echo "Sai thông tin đăng nhập-Record số 35"
    break
  elif [[ $curl35 =~ "blocked" ]]; then
    echo "Lỗi blocked-Record số 35"
    break
  else
    for (( j=0; j<=4; j++))
    do
      if [[ `echo $curl35 | jq '.data.guestOrder.groups_2101['${i[@]}'].items['${j[@]}'].product.usItemId'` == '"641220610"' ]]; then
        echo $curl35 | jq '.data.guestOrder.id' >> track-OrderID.txt
        echo $curl35 | jq '.data.guestOrder.customer.email' >> track-email.txt
        echo $curl35 | jq '.data.guestOrder.groups_2101['${i[@]}'].items['${j[@]}'].product.usItemId' >> track-usItemId.txt
        echo $curl35 | jq '.data.guestOrder.groups_2101['${i[@]}'].items['${j[@]}'].priceInfo.linePrice.value' >> track-priceValue.txt
        echo $curl35 | jq '.data.guestOrder.groups_2101['${i[@]}'].deliveryAddress.fullName' >> track-fullName.txt
        echo $curl35 | jq '.data.guestOrder.groups_2101['${i[@]}'].deliveryAddress.address.addressString' >> track-address.txt
        echo $curl35 | jq '.data.guestOrder.groups_2101['${i[@]}'].status.message.parts[].text' >> track-status.txt
        echo $curl35 | jq '.data.guestOrder.groups_2101['${i[@]}'].shipment.trackingNumber' >> track-number.txt
        echo $curl35 | jq '.data.guestOrder.groups_2101['${i[@]}'].shipment.trackingUrl' >> track-url.txt
        echo "35"
        break
      fi
    done
  fi
done

curl36=`curl -s 'https://www.walmart.com/orchestra/home/graphql' \
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
  if [[ $curl36 =~ "error" ]]; then
    echo "Sai thông tin đăng nhập-Record số 36"
    break
  elif [[ $curl36 =~ "blocked" ]]; then
    echo "Lỗi blocked-Record số 36"
    break
  else
    for (( j=0; j<=4; j++))
    do
      if [[ `echo $curl36 | jq '.data.guestOrder.groups_2101['${i[@]}'].items['${j[@]}'].product.usItemId'` == '"755361385"' ]]; then
        echo $curl36 | jq '.data.guestOrder.id' >> track-OrderID.txt
        echo $curl36 | jq '.data.guestOrder.customer.email' >> track-email.txt
        echo $curl36 | jq '.data.guestOrder.groups_2101['${i[@]}'].items['${j[@]}'].product.usItemId' >> track-usItemId.txt
        echo $curl36 | jq '.data.guestOrder.groups_2101['${i[@]}'].items['${j[@]}'].priceInfo.linePrice.value' >> track-priceValue.txt
        echo $curl36 | jq '.data.guestOrder.groups_2101['${i[@]}'].deliveryAddress.fullName' >> track-fullName.txt
        echo $curl36 | jq '.data.guestOrder.groups_2101['${i[@]}'].deliveryAddress.address.addressString' >> track-address.txt
        echo $curl36 | jq '.data.guestOrder.groups_2101['${i[@]}'].status.message.parts[].text' >> track-status.txt
        echo $curl36 | jq '.data.guestOrder.groups_2101['${i[@]}'].shipment.trackingNumber' >> track-number.txt
        echo $curl36 | jq '.data.guestOrder.groups_2101['${i[@]}'].shipment.trackingUrl' >> track-url.txt
        echo "36"
        break
      fi
    done
  fi
done

curl37=`curl -s 'https://www.walmart.com/orchestra/home/graphql' \
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
  if [[ $curl37 =~ "error" ]]; then
    echo "Sai thông tin đăng nhập-Record số 37"
    break
  elif [[ $curl37 =~ "blocked" ]]; then
    echo "Lỗi blocked-Record số 37"
    break
  else
    for (( j=0; j<=4; j++))
    do
      if [[ `echo $curl37 | jq '.data.guestOrder.groups_2101['${i[@]}'].items['${j[@]}'].product.usItemId'` == '"749228471"' ]]; then
        echo $curl37 | jq '.data.guestOrder.id' >> track-OrderID.txt
        echo $curl37 | jq '.data.guestOrder.customer.email' >> track-email.txt
        echo $curl37 | jq '.data.guestOrder.groups_2101['${i[@]}'].items['${j[@]}'].product.usItemId' >> track-usItemId.txt
        echo $curl37 | jq '.data.guestOrder.groups_2101['${i[@]}'].items['${j[@]}'].priceInfo.linePrice.value' >> track-priceValue.txt
        echo $curl37 | jq '.data.guestOrder.groups_2101['${i[@]}'].deliveryAddress.fullName' >> track-fullName.txt
        echo $curl37 | jq '.data.guestOrder.groups_2101['${i[@]}'].deliveryAddress.address.addressString' >> track-address.txt
        echo $curl37 | jq '.data.guestOrder.groups_2101['${i[@]}'].status.message.parts[].text' >> track-status.txt
        echo $curl37 | jq '.data.guestOrder.groups_2101['${i[@]}'].shipment.trackingNumber' >> track-number.txt
        echo $curl37 | jq '.data.guestOrder.groups_2101['${i[@]}'].shipment.trackingUrl' >> track-url.txt
        echo "37"
        break
      fi
    done
  fi
done

curl38=`curl -s 'https://www.walmart.com/orchestra/home/graphql' \
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
  if [[ $curl38 =~ "error" ]]; then
    echo "Sai thông tin đăng nhập-Record số 38"
    break
  elif [[ $curl38 =~ "blocked" ]]; then
    echo "Lỗi blocked-Record số 38"
    break
  else
    for (( j=0; j<=4; j++))
    do
      if [[ `echo $curl38 | jq '.data.guestOrder.groups_2101['${i[@]}'].items['${j[@]}'].product.usItemId'` == '"50753941"' ]]; then
        echo $curl38 | jq '.data.guestOrder.id' >> track-OrderID.txt
        echo $curl38 | jq '.data.guestOrder.customer.email' >> track-email.txt
        echo $curl38 | jq '.data.guestOrder.groups_2101['${i[@]}'].items['${j[@]}'].product.usItemId' >> track-usItemId.txt
        echo $curl38 | jq '.data.guestOrder.groups_2101['${i[@]}'].items['${j[@]}'].priceInfo.linePrice.value' >> track-priceValue.txt
        echo $curl38 | jq '.data.guestOrder.groups_2101['${i[@]}'].deliveryAddress.fullName' >> track-fullName.txt
        echo $curl38 | jq '.data.guestOrder.groups_2101['${i[@]}'].deliveryAddress.address.addressString' >> track-address.txt
        echo $curl38 | jq '.data.guestOrder.groups_2101['${i[@]}'].status.message.parts[].text' >> track-status.txt
        echo $curl38 | jq '.data.guestOrder.groups_2101['${i[@]}'].shipment.trackingNumber' >> track-number.txt
        echo $curl38 | jq '.data.guestOrder.groups_2101['${i[@]}'].shipment.trackingUrl' >> track-url.txt
        echo "38"
        break
      fi
    done
  fi
done

curl39=`curl -s 'https://www.walmart.com/orchestra/home/graphql' \
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
  if [[ $curl39 =~ "error" ]]; then
    echo "Sai thông tin đăng nhập-Record số 39"
    break
  elif [[ $curl39 =~ "blocked" ]]; then
    echo "Lỗi blocked-Record số 39"
    break
  else
    for (( j=0; j<=4; j++))
    do
      if [[ `echo $curl39 | jq '.data.guestOrder.groups_2101['${i[@]}'].items['${j[@]}'].product.usItemId'` == '"38444962"' ]]; then
        echo $curl39 | jq '.data.guestOrder.id' >> track-OrderID.txt
        echo $curl39 | jq '.data.guestOrder.customer.email' >> track-email.txt
        echo $curl39 | jq '.data.guestOrder.groups_2101['${i[@]}'].items['${j[@]}'].product.usItemId' >> track-usItemId.txt
        echo $curl39 | jq '.data.guestOrder.groups_2101['${i[@]}'].items['${j[@]}'].priceInfo.linePrice.value' >> track-priceValue.txt
        echo $curl39 | jq '.data.guestOrder.groups_2101['${i[@]}'].deliveryAddress.fullName' >> track-fullName.txt
        echo $curl39 | jq '.data.guestOrder.groups_2101['${i[@]}'].deliveryAddress.address.addressString' >> track-address.txt
        echo $curl39 | jq '.data.guestOrder.groups_2101['${i[@]}'].status.message.parts[].text' >> track-status.txt
        echo $curl39 | jq '.data.guestOrder.groups_2101['${i[@]}'].shipment.trackingNumber' >> track-number.txt
        echo $curl39 | jq '.data.guestOrder.groups_2101['${i[@]}'].shipment.trackingUrl' >> track-url.txt
        echo "39"
        break
      fi
    done
  fi
done

curl40=`curl -s 'https://www.walmart.com/orchestra/home/graphql' \
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
  if [[ $curl40 =~ "error" ]]; then
    echo "Sai thông tin đăng nhập-Record số 40"
    break
  elif [[ $curl40 =~ "blocked" ]]; then
    echo "Lỗi blocked-Record số 40"
    break
  else
    for (( j=0; j<=4; j++))
    do
      if [[ `echo $curl40 | jq '.data.guestOrder.groups_2101['${i[@]}'].items['${j[@]}'].product.usItemId'` == '"54315959"' ]]; then
        echo $curl40 | jq '.data.guestOrder.id' >> track-OrderID.txt
        echo $curl40 | jq '.data.guestOrder.customer.email' >> track-email.txt
        echo $curl40 | jq '.data.guestOrder.groups_2101['${i[@]}'].items['${j[@]}'].product.usItemId' >> track-usItemId.txt
        echo $curl40 | jq '.data.guestOrder.groups_2101['${i[@]}'].items['${j[@]}'].priceInfo.linePrice.value' >> track-priceValue.txt
        echo $curl40 | jq '.data.guestOrder.groups_2101['${i[@]}'].deliveryAddress.fullName' >> track-fullName.txt
        echo $curl40 | jq '.data.guestOrder.groups_2101['${i[@]}'].deliveryAddress.address.addressString' >> track-address.txt
        echo $curl40 | jq '.data.guestOrder.groups_2101['${i[@]}'].status.message.parts[].text' >> track-status.txt
        echo $curl40 | jq '.data.guestOrder.groups_2101['${i[@]}'].shipment.trackingNumber' >> track-number.txt
        echo $curl40 | jq '.data.guestOrder.groups_2101['${i[@]}'].shipment.trackingUrl' >> track-url.txt
        echo "40"
        break
      fi
    done
  fi
done

curl41=`curl -s 'https://www.walmart.com/orchestra/home/graphql' \
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
  if [[ $curl41 =~ "error" ]]; then
    echo "Sai thông tin đăng nhập-Record số 41"
    break
  elif [[ $curl41 =~ "blocked" ]]; then
    echo "Lỗi blocked-Record số 41"
    break
  else
    for (( j=0; j<=4; j++))
    do
      if [[ `echo $curl41 | jq '.data.guestOrder.groups_2101['${i[@]}'].items['${j[@]}'].product.usItemId'` == '"240828726"' ]]; then
        echo $curl41 | jq '.data.guestOrder.id' >> track-OrderID.txt
        echo $curl41 | jq '.data.guestOrder.customer.email' >> track-email.txt
        echo $curl41 | jq '.data.guestOrder.groups_2101['${i[@]}'].items['${j[@]}'].product.usItemId' >> track-usItemId.txt
        echo $curl41 | jq '.data.guestOrder.groups_2101['${i[@]}'].items['${j[@]}'].priceInfo.linePrice.value' >> track-priceValue.txt
        echo $curl41 | jq '.data.guestOrder.groups_2101['${i[@]}'].deliveryAddress.fullName' >> track-fullName.txt
        echo $curl41 | jq '.data.guestOrder.groups_2101['${i[@]}'].deliveryAddress.address.addressString' >> track-address.txt
        echo $curl41 | jq '.data.guestOrder.groups_2101['${i[@]}'].status.message.parts[].text' >> track-status.txt
        echo $curl41 | jq '.data.guestOrder.groups_2101['${i[@]}'].shipment.trackingNumber' >> track-number.txt
        echo $curl41 | jq '.data.guestOrder.groups_2101['${i[@]}'].shipment.trackingUrl' >> track-url.txt
        echo "41"
        break
      fi
    done
  fi
done

curl42=`curl -s 'https://www.walmart.com/orchestra/home/graphql' \
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
  if [[ $curl42 =~ "error" ]]; then
    echo "Sai thông tin đăng nhập-Record số 42"
    break
  elif [[ $curl42 =~ "blocked" ]]; then
    echo "Lỗi blocked-Record số 42"
    break
  else
    for (( j=0; j<=4; j++))
    do
      if [[ `echo $curl42 | jq '.data.guestOrder.groups_2101['${i[@]}'].items['${j[@]}'].product.usItemId'` == '"674470775"' ]]; then
        echo $curl42 | jq '.data.guestOrder.id' >> track-OrderID.txt
        echo $curl42 | jq '.data.guestOrder.customer.email' >> track-email.txt
        echo $curl42 | jq '.data.guestOrder.groups_2101['${i[@]}'].items['${j[@]}'].product.usItemId' >> track-usItemId.txt
        echo $curl42 | jq '.data.guestOrder.groups_2101['${i[@]}'].items['${j[@]}'].priceInfo.linePrice.value' >> track-priceValue.txt
        echo $curl42 | jq '.data.guestOrder.groups_2101['${i[@]}'].deliveryAddress.fullName' >> track-fullName.txt
        echo $curl42 | jq '.data.guestOrder.groups_2101['${i[@]}'].deliveryAddress.address.addressString' >> track-address.txt
        echo $curl42 | jq '.data.guestOrder.groups_2101['${i[@]}'].status.message.parts[].text' >> track-status.txt
        echo $curl42 | jq '.data.guestOrder.groups_2101['${i[@]}'].shipment.trackingNumber' >> track-number.txt
        echo $curl42 | jq '.data.guestOrder.groups_2101['${i[@]}'].shipment.trackingUrl' >> track-url.txt
        echo "42"
        break
      fi
    done
  fi
done

curl43=`curl -s 'https://www.walmart.com/orchestra/home/graphql' \
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
  if [[ $curl43 =~ "error" ]]; then
    echo "Sai thông tin đăng nhập-Record số 43"
    break
  elif [[ $curl43 =~ "blocked" ]]; then
    echo "Lỗi blocked-Record số 43"
    break
  else
    for (( j=0; j<=4; j++))
    do
      if [[ `echo $curl43 | jq '.data.guestOrder.groups_2101['${i[@]}'].items['${j[@]}'].product.usItemId'` == '"265176340"' ]]; then
        echo $curl43 | jq '.data.guestOrder.id' >> track-OrderID.txt
        echo $curl43 | jq '.data.guestOrder.customer.email' >> track-email.txt
        echo $curl43 | jq '.data.guestOrder.groups_2101['${i[@]}'].items['${j[@]}'].product.usItemId' >> track-usItemId.txt
        echo $curl43 | jq '.data.guestOrder.groups_2101['${i[@]}'].items['${j[@]}'].priceInfo.linePrice.value' >> track-priceValue.txt
        echo $curl43 | jq '.data.guestOrder.groups_2101['${i[@]}'].deliveryAddress.fullName' >> track-fullName.txt
        echo $curl43 | jq '.data.guestOrder.groups_2101['${i[@]}'].deliveryAddress.address.addressString' >> track-address.txt
        echo $curl43 | jq '.data.guestOrder.groups_2101['${i[@]}'].status.message.parts[].text' >> track-status.txt
        echo $curl43 | jq '.data.guestOrder.groups_2101['${i[@]}'].shipment.trackingNumber' >> track-number.txt
        echo $curl43 | jq '.data.guestOrder.groups_2101['${i[@]}'].shipment.trackingUrl' >> track-url.txt
        echo "43"
        break
      fi
    done
  fi
done

curl44=`curl -s 'https://www.walmart.com/orchestra/home/graphql' \
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
  if [[ $curl44 =~ "error" ]]; then
    echo "Sai thông tin đăng nhập-Record số 44"
    break
  elif [[ $curl44 =~ "blocked" ]]; then
    echo "Lỗi blocked-Record số 44"
    break
  else
    for (( j=0; j<=4; j++))
    do
      if [[ `echo $curl44 | jq '.data.guestOrder.groups_2101['${i[@]}'].items['${j[@]}'].product.usItemId'` == '"227338487"' ]]; then
        echo $curl44 | jq '.data.guestOrder.id' >> track-OrderID.txt
        echo $curl44 | jq '.data.guestOrder.customer.email' >> track-email.txt
        echo $curl44 | jq '.data.guestOrder.groups_2101['${i[@]}'].items['${j[@]}'].product.usItemId' >> track-usItemId.txt
        echo $curl44 | jq '.data.guestOrder.groups_2101['${i[@]}'].items['${j[@]}'].priceInfo.linePrice.value' >> track-priceValue.txt
        echo $curl44 | jq '.data.guestOrder.groups_2101['${i[@]}'].deliveryAddress.fullName' >> track-fullName.txt
        echo $curl44 | jq '.data.guestOrder.groups_2101['${i[@]}'].deliveryAddress.address.addressString' >> track-address.txt
        echo $curl44 | jq '.data.guestOrder.groups_2101['${i[@]}'].status.message.parts[].text' >> track-status.txt
        echo $curl44 | jq '.data.guestOrder.groups_2101['${i[@]}'].shipment.trackingNumber' >> track-number.txt
        echo $curl44 | jq '.data.guestOrder.groups_2101['${i[@]}'].shipment.trackingUrl' >> track-url.txt
        echo "44"
        break
      fi
    done
  fi
done

curl45=`curl -s 'https://www.walmart.com/orchestra/home/graphql' \
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
  if [[ $curl45 =~ "error" ]]; then
    echo "Sai thông tin đăng nhập-Record số 45"
    break
  elif [[ $curl45 =~ "blocked" ]]; then
    echo "Lỗi blocked-Record số 45"
    break
  else
    for (( j=0; j<=4; j++))
    do
      if [[ `echo $curl45 | jq '.data.guestOrder.groups_2101['${i[@]}'].items['${j[@]}'].product.usItemId'` == '"10771204"' ]]; then
        echo $curl45 | jq '.data.guestOrder.id' >> track-OrderID.txt
        echo $curl45 | jq '.data.guestOrder.customer.email' >> track-email.txt
        echo $curl45 | jq '.data.guestOrder.groups_2101['${i[@]}'].items['${j[@]}'].product.usItemId' >> track-usItemId.txt
        echo $curl45 | jq '.data.guestOrder.groups_2101['${i[@]}'].items['${j[@]}'].priceInfo.linePrice.value' >> track-priceValue.txt
        echo $curl45 | jq '.data.guestOrder.groups_2101['${i[@]}'].deliveryAddress.fullName' >> track-fullName.txt
        echo $curl45 | jq '.data.guestOrder.groups_2101['${i[@]}'].deliveryAddress.address.addressString' >> track-address.txt
        echo $curl45 | jq '.data.guestOrder.groups_2101['${i[@]}'].status.message.parts[].text' >> track-status.txt
        echo $curl45 | jq '.data.guestOrder.groups_2101['${i[@]}'].shipment.trackingNumber' >> track-number.txt
        echo $curl45 | jq '.data.guestOrder.groups_2101['${i[@]}'].shipment.trackingUrl' >> track-url.txt
        echo "45"
        break
      fi
    done
  fi
done

curl46=`curl -s 'https://www.walmart.com/orchestra/home/graphql' \
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
  if [[ $curl46 =~ "error" ]]; then
    echo "Sai thông tin đăng nhập-Record số 46"
    break
  elif [[ $curl46 =~ "blocked" ]]; then
    echo "Lỗi blocked-Record số 46"
    break
  else
    for (( j=0; j<=4; j++))
    do
      if [[ `echo $curl46 | jq '.data.guestOrder.groups_2101['${i[@]}'].items['${j[@]}'].product.usItemId'` == '"526913580"' ]]; then
        echo $curl46 | jq '.data.guestOrder.id' >> track-OrderID.txt
        echo $curl46 | jq '.data.guestOrder.customer.email' >> track-email.txt
        echo $curl46 | jq '.data.guestOrder.groups_2101['${i[@]}'].items['${j[@]}'].product.usItemId' >> track-usItemId.txt
        echo $curl46 | jq '.data.guestOrder.groups_2101['${i[@]}'].items['${j[@]}'].priceInfo.linePrice.value' >> track-priceValue.txt
        echo $curl46 | jq '.data.guestOrder.groups_2101['${i[@]}'].deliveryAddress.fullName' >> track-fullName.txt
        echo $curl46 | jq '.data.guestOrder.groups_2101['${i[@]}'].deliveryAddress.address.addressString' >> track-address.txt
        echo $curl46 | jq '.data.guestOrder.groups_2101['${i[@]}'].status.message.parts[].text' >> track-status.txt
        echo $curl46 | jq '.data.guestOrder.groups_2101['${i[@]}'].shipment.trackingNumber' >> track-number.txt
        echo $curl46 | jq '.data.guestOrder.groups_2101['${i[@]}'].shipment.trackingUrl' >> track-url.txt
        echo "46"
        break
      fi
    done
  fi
done

curl47=`curl -s 'https://www.walmart.com/orchestra/home/graphql' \
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
  if [[ $curl47 =~ "error" ]]; then
    echo "Sai thông tin đăng nhập-Record số 47"
    break
  elif [[ $curl47 =~ "blocked" ]]; then
    echo "Lỗi blocked-Record số 47"
    break
  else
    for (( j=0; j<=4; j++))
    do
      if [[ `echo $curl47 | jq '.data.guestOrder.groups_2101['${i[@]}'].items['${j[@]}'].product.usItemId'` == '"129990153"' ]]; then
        echo $curl47 | jq '.data.guestOrder.id' >> track-OrderID.txt
        echo $curl47 | jq '.data.guestOrder.customer.email' >> track-email.txt
        echo $curl47 | jq '.data.guestOrder.groups_2101['${i[@]}'].items['${j[@]}'].product.usItemId' >> track-usItemId.txt
        echo $curl47 | jq '.data.guestOrder.groups_2101['${i[@]}'].items['${j[@]}'].priceInfo.linePrice.value' >> track-priceValue.txt
        echo $curl47 | jq '.data.guestOrder.groups_2101['${i[@]}'].deliveryAddress.fullName' >> track-fullName.txt
        echo $curl47 | jq '.data.guestOrder.groups_2101['${i[@]}'].deliveryAddress.address.addressString' >> track-address.txt
        echo $curl47 | jq '.data.guestOrder.groups_2101['${i[@]}'].status.message.parts[].text' >> track-status.txt
        echo $curl47 | jq '.data.guestOrder.groups_2101['${i[@]}'].shipment.trackingNumber' >> track-number.txt
        echo $curl47 | jq '.data.guestOrder.groups_2101['${i[@]}'].shipment.trackingUrl' >> track-url.txt
        echo "47"
        break
      fi
    done
  fi
done

curl48=`curl -s 'https://www.walmart.com/orchestra/home/graphql' \
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
  if [[ $curl48 =~ "error" ]]; then
    echo "Sai thông tin đăng nhập-Record số 48"
    break
  elif [[ $curl48 =~ "blocked" ]]; then
    echo "Lỗi blocked-Record số 48"
    break
  else
    for (( j=0; j<=4; j++))
    do
      if [[ `echo $curl48 | jq '.data.guestOrder.groups_2101['${i[@]}'].items['${j[@]}'].product.usItemId'` == '"121639349"' ]]; then
        echo $curl48 | jq '.data.guestOrder.id' >> track-OrderID.txt
        echo $curl48 | jq '.data.guestOrder.customer.email' >> track-email.txt
        echo $curl48 | jq '.data.guestOrder.groups_2101['${i[@]}'].items['${j[@]}'].product.usItemId' >> track-usItemId.txt
        echo $curl48 | jq '.data.guestOrder.groups_2101['${i[@]}'].items['${j[@]}'].priceInfo.linePrice.value' >> track-priceValue.txt
        echo $curl48 | jq '.data.guestOrder.groups_2101['${i[@]}'].deliveryAddress.fullName' >> track-fullName.txt
        echo $curl48 | jq '.data.guestOrder.groups_2101['${i[@]}'].deliveryAddress.address.addressString' >> track-address.txt
        echo $curl48 | jq '.data.guestOrder.groups_2101['${i[@]}'].status.message.parts[].text' >> track-status.txt
        echo $curl48 | jq '.data.guestOrder.groups_2101['${i[@]}'].shipment.trackingNumber' >> track-number.txt
        echo $curl48 | jq '.data.guestOrder.groups_2101['${i[@]}'].shipment.trackingUrl' >> track-url.txt
        echo "48"
        break
      fi
    done
  fi
done

curl49=`curl -s 'https://www.walmart.com/orchestra/home/graphql' \
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
  if [[ $curl49 =~ "error" ]]; then
    echo "Sai thông tin đăng nhập-Record số 49"
    break
  elif [[ $curl49 =~ "blocked" ]]; then
    echo "Lỗi blocked-Record số 49"
    break
  else
    for (( j=0; j<=4; j++))
    do
      if [[ `echo $curl49 | jq '.data.guestOrder.groups_2101['${i[@]}'].items['${j[@]}'].product.usItemId'` == '"755361385"' ]]; then
        echo $curl49 | jq '.data.guestOrder.id' >> track-OrderID.txt
        echo $curl49 | jq '.data.guestOrder.customer.email' >> track-email.txt
        echo $curl49 | jq '.data.guestOrder.groups_2101['${i[@]}'].items['${j[@]}'].product.usItemId' >> track-usItemId.txt
        echo $curl49 | jq '.data.guestOrder.groups_2101['${i[@]}'].items['${j[@]}'].priceInfo.linePrice.value' >> track-priceValue.txt
        echo $curl49 | jq '.data.guestOrder.groups_2101['${i[@]}'].deliveryAddress.fullName' >> track-fullName.txt
        echo $curl49 | jq '.data.guestOrder.groups_2101['${i[@]}'].deliveryAddress.address.addressString' >> track-address.txt
        echo $curl49 | jq '.data.guestOrder.groups_2101['${i[@]}'].status.message.parts[].text' >> track-status.txt
        echo $curl49 | jq '.data.guestOrder.groups_2101['${i[@]}'].shipment.trackingNumber' >> track-number.txt
        echo $curl49 | jq '.data.guestOrder.groups_2101['${i[@]}'].shipment.trackingUrl' >> track-url.txt
        echo "49"
        break
      fi
    done
  fi
done

curl50=`curl -s 'https://www.walmart.com/orchestra/home/graphql' \
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
  if [[ $curl50 =~ "error" ]]; then
    echo "Sai thông tin đăng nhập-Record số 50"
    break
  elif [[ $curl50 =~ "blocked" ]]; then
    echo "Lỗi blocked-Record số 50"
    break
  else
    for (( j=0; j<=4; j++))
    do
      if [[ `echo $curl50 | jq '.data.guestOrder.groups_2101['${i[@]}'].items['${j[@]}'].product.usItemId'` == '"251382558"' ]]; then
        echo $curl50 | jq '.data.guestOrder.id' >> track-OrderID.txt
        echo $curl50 | jq '.data.guestOrder.customer.email' >> track-email.txt
        echo $curl50 | jq '.data.guestOrder.groups_2101['${i[@]}'].items['${j[@]}'].product.usItemId' >> track-usItemId.txt
        echo $curl50 | jq '.data.guestOrder.groups_2101['${i[@]}'].items['${j[@]}'].priceInfo.linePrice.value' >> track-priceValue.txt
        echo $curl50 | jq '.data.guestOrder.groups_2101['${i[@]}'].deliveryAddress.fullName' >> track-fullName.txt
        echo $curl50 | jq '.data.guestOrder.groups_2101['${i[@]}'].deliveryAddress.address.addressString' >> track-address.txt
        echo $curl50 | jq '.data.guestOrder.groups_2101['${i[@]}'].status.message.parts[].text' >> track-status.txt
        echo $curl50 | jq '.data.guestOrder.groups_2101['${i[@]}'].shipment.trackingNumber' >> track-number.txt
        echo $curl50 | jq '.data.guestOrder.groups_2101['${i[@]}'].shipment.trackingUrl' >> track-url.txt
        echo "50"
        break
      fi
    done
  fi
done

curl51=`curl -s 'https://www.walmart.com/orchestra/home/graphql' \
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
  if [[ $curl51 =~ "error" ]]; then
    echo "Sai thông tin đăng nhập-Record số 51"
    break
  elif [[ $curl51 =~ "blocked" ]]; then
    echo "Lỗi blocked-Record số 51"
    break
  else
    for (( j=0; j<=4; j++))
    do
      if [[ `echo $curl51 | jq '.data.guestOrder.groups_2101['${i[@]}'].items['${j[@]}'].product.usItemId'` == '"755857661"' ]]; then
        echo $curl51 | jq '.data.guestOrder.id' >> track-OrderID.txt
        echo $curl51 | jq '.data.guestOrder.customer.email' >> track-email.txt
        echo $curl51 | jq '.data.guestOrder.groups_2101['${i[@]}'].items['${j[@]}'].product.usItemId' >> track-usItemId.txt
        echo $curl51 | jq '.data.guestOrder.groups_2101['${i[@]}'].items['${j[@]}'].priceInfo.linePrice.value' >> track-priceValue.txt
        echo $curl51 | jq '.data.guestOrder.groups_2101['${i[@]}'].deliveryAddress.fullName' >> track-fullName.txt
        echo $curl51 | jq '.data.guestOrder.groups_2101['${i[@]}'].deliveryAddress.address.addressString' >> track-address.txt
        echo $curl51 | jq '.data.guestOrder.groups_2101['${i[@]}'].status.message.parts[].text' >> track-status.txt
        echo $curl51 | jq '.data.guestOrder.groups_2101['${i[@]}'].shipment.trackingNumber' >> track-number.txt
        echo $curl51 | jq '.data.guestOrder.groups_2101['${i[@]}'].shipment.trackingUrl' >> track-url.txt
        echo "51"
        break
      fi
    done
  fi
done

curl52=`curl -s 'https://www.walmart.com/orchestra/home/graphql' \
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
  if [[ $curl52 =~ "error" ]]; then
    echo "Sai thông tin đăng nhập-Record số 52"
    break
  elif [[ $curl52 =~ "blocked" ]]; then
    echo "Lỗi blocked-Record số 52"
    break
  else
    for (( j=0; j<=4; j++))
    do
      if [[ `echo $curl52 | jq '.data.guestOrder.groups_2101['${i[@]}'].items['${j[@]}'].product.usItemId'` == '"514290555"' ]]; then
        echo $curl52 | jq '.data.guestOrder.id' >> track-OrderID.txt
        echo $curl52 | jq '.data.guestOrder.customer.email' >> track-email.txt
        echo $curl52 | jq '.data.guestOrder.groups_2101['${i[@]}'].items['${j[@]}'].product.usItemId' >> track-usItemId.txt
        echo $curl52 | jq '.data.guestOrder.groups_2101['${i[@]}'].items['${j[@]}'].priceInfo.linePrice.value' >> track-priceValue.txt
        echo $curl52 | jq '.data.guestOrder.groups_2101['${i[@]}'].deliveryAddress.fullName' >> track-fullName.txt
        echo $curl52 | jq '.data.guestOrder.groups_2101['${i[@]}'].deliveryAddress.address.addressString' >> track-address.txt
        echo $curl52 | jq '.data.guestOrder.groups_2101['${i[@]}'].status.message.parts[].text' >> track-status.txt
        echo $curl52 | jq '.data.guestOrder.groups_2101['${i[@]}'].shipment.trackingNumber' >> track-number.txt
        echo $curl52 | jq '.data.guestOrder.groups_2101['${i[@]}'].shipment.trackingUrl' >> track-url.txt
        echo "52"
        break
      fi
    done
  fi
done

curl53=`curl -s 'https://www.walmart.com/orchestra/home/graphql' \
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
  if [[ $curl53 =~ "error" ]]; then
    echo "Sai thông tin đăng nhập-Record số 53"
    break
  elif [[ $curl53 =~ "blocked" ]]; then
    echo "Lỗi blocked-Record số 53"
    break
  else
    for (( j=0; j<=4; j++))
    do
      if [[ `echo $curl53 | jq '.data.guestOrder.groups_2101['${i[@]}'].items['${j[@]}'].product.usItemId'` == '"318995418"' ]]; then
        echo $curl53 | jq '.data.guestOrder.id' >> track-OrderID.txt
        echo $curl53 | jq '.data.guestOrder.customer.email' >> track-email.txt
        echo $curl53 | jq '.data.guestOrder.groups_2101['${i[@]}'].items['${j[@]}'].product.usItemId' >> track-usItemId.txt
        echo $curl53 | jq '.data.guestOrder.groups_2101['${i[@]}'].items['${j[@]}'].priceInfo.linePrice.value' >> track-priceValue.txt
        echo $curl53 | jq '.data.guestOrder.groups_2101['${i[@]}'].deliveryAddress.fullName' >> track-fullName.txt
        echo $curl53 | jq '.data.guestOrder.groups_2101['${i[@]}'].deliveryAddress.address.addressString' >> track-address.txt
        echo $curl53 | jq '.data.guestOrder.groups_2101['${i[@]}'].status.message.parts[].text' >> track-status.txt
        echo $curl53 | jq '.data.guestOrder.groups_2101['${i[@]}'].shipment.trackingNumber' >> track-number.txt
        echo $curl53 | jq '.data.guestOrder.groups_2101['${i[@]}'].shipment.trackingUrl' >> track-url.txt
        echo "53"
        break
      fi
    done
  fi
done

curl54=`curl -s 'https://www.walmart.com/orchestra/home/graphql' \
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
  if [[ $curl54 =~ "error" ]]; then
    echo "Sai thông tin đăng nhập-Record số 54"
    break
  elif [[ $curl54 =~ "blocked" ]]; then
    echo "Lỗi blocked-Record số 54"
    break
  else
    for (( j=0; j<=4; j++))
    do
      if [[ `echo $curl54 | jq '.data.guestOrder.groups_2101['${i[@]}'].items['${j[@]}'].product.usItemId'` == '"217281734"' ]]; then
        echo $curl54 | jq '.data.guestOrder.id' >> track-OrderID.txt
        echo $curl54 | jq '.data.guestOrder.customer.email' >> track-email.txt
        echo $curl54 | jq '.data.guestOrder.groups_2101['${i[@]}'].items['${j[@]}'].product.usItemId' >> track-usItemId.txt
        echo $curl54 | jq '.data.guestOrder.groups_2101['${i[@]}'].items['${j[@]}'].priceInfo.linePrice.value' >> track-priceValue.txt
        echo $curl54 | jq '.data.guestOrder.groups_2101['${i[@]}'].deliveryAddress.fullName' >> track-fullName.txt
        echo $curl54 | jq '.data.guestOrder.groups_2101['${i[@]}'].deliveryAddress.address.addressString' >> track-address.txt
        echo $curl54 | jq '.data.guestOrder.groups_2101['${i[@]}'].status.message.parts[].text' >> track-status.txt
        echo $curl54 | jq '.data.guestOrder.groups_2101['${i[@]}'].shipment.trackingNumber' >> track-number.txt
        echo $curl54 | jq '.data.guestOrder.groups_2101['${i[@]}'].shipment.trackingUrl' >> track-url.txt
        echo "54"
        break
      fi
    done
  fi
done

curl55=`curl -s 'https://www.walmart.com/orchestra/home/graphql' \
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
  if [[ $curl55 =~ "error" ]]; then
    echo "Sai thông tin đăng nhập-Record số 55"
    break
  elif [[ $curl55 =~ "blocked" ]]; then
    echo "Lỗi blocked-Record số 55"
    break
  else
    for (( j=0; j<=4; j++))
    do
      if [[ `echo $curl55 | jq '.data.guestOrder.groups_2101['${i[@]}'].items['${j[@]}'].product.usItemId'` == '"713811084"' ]]; then
        echo $curl55 | jq '.data.guestOrder.id' >> track-OrderID.txt
        echo $curl55 | jq '.data.guestOrder.customer.email' >> track-email.txt
        echo $curl55 | jq '.data.guestOrder.groups_2101['${i[@]}'].items['${j[@]}'].product.usItemId' >> track-usItemId.txt
        echo $curl55 | jq '.data.guestOrder.groups_2101['${i[@]}'].items['${j[@]}'].priceInfo.linePrice.value' >> track-priceValue.txt
        echo $curl55 | jq '.data.guestOrder.groups_2101['${i[@]}'].deliveryAddress.fullName' >> track-fullName.txt
        echo $curl55 | jq '.data.guestOrder.groups_2101['${i[@]}'].deliveryAddress.address.addressString' >> track-address.txt
        echo $curl55 | jq '.data.guestOrder.groups_2101['${i[@]}'].status.message.parts[].text' >> track-status.txt
        echo $curl55 | jq '.data.guestOrder.groups_2101['${i[@]}'].shipment.trackingNumber' >> track-number.txt
        echo $curl55 | jq '.data.guestOrder.groups_2101['${i[@]}'].shipment.trackingUrl' >> track-url.txt
        echo "55"
        break
      fi
    done
  fi
done

curl56=`curl -s 'https://www.walmart.com/orchestra/home/graphql' \
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
  if [[ $curl56 =~ "error" ]]; then
    echo "Sai thông tin đăng nhập-Record số 56"
    break
  elif [[ $curl56 =~ "blocked" ]]; then
    echo "Lỗi blocked-Record số 56"
    break
  else
    for (( j=0; j<=4; j++))
    do
      if [[ `echo $curl56 | jq '.data.guestOrder.groups_2101['${i[@]}'].items['${j[@]}'].product.usItemId'` == '"251382558"' ]]; then
        echo $curl56 | jq '.data.guestOrder.id' >> track-OrderID.txt
        echo $curl56 | jq '.data.guestOrder.customer.email' >> track-email.txt
        echo $curl56 | jq '.data.guestOrder.groups_2101['${i[@]}'].items['${j[@]}'].product.usItemId' >> track-usItemId.txt
        echo $curl56 | jq '.data.guestOrder.groups_2101['${i[@]}'].items['${j[@]}'].priceInfo.linePrice.value' >> track-priceValue.txt
        echo $curl56 | jq '.data.guestOrder.groups_2101['${i[@]}'].deliveryAddress.fullName' >> track-fullName.txt
        echo $curl56 | jq '.data.guestOrder.groups_2101['${i[@]}'].deliveryAddress.address.addressString' >> track-address.txt
        echo $curl56 | jq '.data.guestOrder.groups_2101['${i[@]}'].status.message.parts[].text' >> track-status.txt
        echo $curl56 | jq '.data.guestOrder.groups_2101['${i[@]}'].shipment.trackingNumber' >> track-number.txt
        echo $curl56 | jq '.data.guestOrder.groups_2101['${i[@]}'].shipment.trackingUrl' >> track-url.txt
        echo "56"
        break
      fi
    done
  fi
done

curl57=`curl -s 'https://www.walmart.com/orchestra/home/graphql' \
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
  if [[ $curl57 =~ "error" ]]; then
    echo "Sai thông tin đăng nhập-Record số 57"
    break
  elif [[ $curl57 =~ "blocked" ]]; then
    echo "Lỗi blocked-Record số 57"
    break
  else
    for (( j=0; j<=4; j++))
    do
      if [[ `echo $curl57 | jq '.data.guestOrder.groups_2101['${i[@]}'].items['${j[@]}'].product.usItemId'` == '"504678442"' ]]; then
        echo $curl57 | jq '.data.guestOrder.id' >> track-OrderID.txt
        echo $curl57 | jq '.data.guestOrder.customer.email' >> track-email.txt
        echo $curl57 | jq '.data.guestOrder.groups_2101['${i[@]}'].items['${j[@]}'].product.usItemId' >> track-usItemId.txt
        echo $curl57 | jq '.data.guestOrder.groups_2101['${i[@]}'].items['${j[@]}'].priceInfo.linePrice.value' >> track-priceValue.txt
        echo $curl57 | jq '.data.guestOrder.groups_2101['${i[@]}'].deliveryAddress.fullName' >> track-fullName.txt
        echo $curl57 | jq '.data.guestOrder.groups_2101['${i[@]}'].deliveryAddress.address.addressString' >> track-address.txt
        echo $curl57 | jq '.data.guestOrder.groups_2101['${i[@]}'].status.message.parts[].text' >> track-status.txt
        echo $curl57 | jq '.data.guestOrder.groups_2101['${i[@]}'].shipment.trackingNumber' >> track-number.txt
        echo $curl57 | jq '.data.guestOrder.groups_2101['${i[@]}'].shipment.trackingUrl' >> track-url.txt
        echo "57"
        break
      fi
    done
  fi
done

curl58=`curl -s 'https://www.walmart.com/orchestra/home/graphql' \
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
  if [[ $curl58 =~ "error" ]]; then
    echo "Sai thông tin đăng nhập-Record số 58"
    break
  elif [[ $curl58 =~ "blocked" ]]; then
    echo "Lỗi blocked-Record số 58"
    break
  else
    for (( j=0; j<=4; j++))
    do
      if [[ `echo $curl58 | jq '.data.guestOrder.groups_2101['${i[@]}'].items['${j[@]}'].product.usItemId'` == '"3084"' ]]; then
        echo $curl58 | jq '.data.guestOrder.id' >> track-OrderID.txt
        echo $curl58 | jq '.data.guestOrder.customer.email' >> track-email.txt
        echo $curl58 | jq '.data.guestOrder.groups_2101['${i[@]}'].items['${j[@]}'].product.usItemId' >> track-usItemId.txt
        echo $curl58 | jq '.data.guestOrder.groups_2101['${i[@]}'].items['${j[@]}'].priceInfo.linePrice.value' >> track-priceValue.txt
        echo $curl58 | jq '.data.guestOrder.groups_2101['${i[@]}'].deliveryAddress.fullName' >> track-fullName.txt
        echo $curl58 | jq '.data.guestOrder.groups_2101['${i[@]}'].deliveryAddress.address.addressString' >> track-address.txt
        echo $curl58 | jq '.data.guestOrder.groups_2101['${i[@]}'].status.message.parts[].text' >> track-status.txt
        echo $curl58 | jq '.data.guestOrder.groups_2101['${i[@]}'].shipment.trackingNumber' >> track-number.txt
        echo $curl58 | jq '.data.guestOrder.groups_2101['${i[@]}'].shipment.trackingUrl' >> track-url.txt
        echo "58"
        break
      fi
    done
  fi
done

curl59=`curl -s 'https://www.walmart.com/orchestra/home/graphql' \
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
  if [[ $curl59 =~ "error" ]]; then
    echo "Sai thông tin đăng nhập-Record số 59"
    break
  elif [[ $curl59 =~ "blocked" ]]; then
    echo "Lỗi blocked-Record số 59"
    break
  else
    for (( j=0; j<=4; j++))
    do
      if [[ `echo $curl59 | jq '.data.guestOrder.groups_2101['${i[@]}'].items['${j[@]}'].product.usItemId'` == '"395854693"' ]]; then
        echo $curl59 | jq '.data.guestOrder.id' >> track-OrderID.txt
        echo $curl59 | jq '.data.guestOrder.customer.email' >> track-email.txt
        echo $curl59 | jq '.data.guestOrder.groups_2101['${i[@]}'].items['${j[@]}'].product.usItemId' >> track-usItemId.txt
        echo $curl59 | jq '.data.guestOrder.groups_2101['${i[@]}'].items['${j[@]}'].priceInfo.linePrice.value' >> track-priceValue.txt
        echo $curl59 | jq '.data.guestOrder.groups_2101['${i[@]}'].deliveryAddress.fullName' >> track-fullName.txt
        echo $curl59 | jq '.data.guestOrder.groups_2101['${i[@]}'].deliveryAddress.address.addressString' >> track-address.txt
        echo $curl59 | jq '.data.guestOrder.groups_2101['${i[@]}'].status.message.parts[].text' >> track-status.txt
        echo $curl59 | jq '.data.guestOrder.groups_2101['${i[@]}'].shipment.trackingNumber' >> track-number.txt
        echo $curl59 | jq '.data.guestOrder.groups_2101['${i[@]}'].shipment.trackingUrl' >> track-url.txt
        echo "59"
        break
      fi
    done
  fi
done

curl60=`curl -s 'https://www.walmart.com/orchestra/home/graphql' \
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
  if [[ $curl60 =~ "error" ]]; then
    echo "Sai thông tin đăng nhập-Record số 60"
    break
  elif [[ $curl60 =~ "blocked" ]]; then
    echo "Lỗi blocked-Record số 60"
    break
  else
    for (( j=0; j<=4; j++))
    do
      if [[ `echo $curl60 | jq '.data.guestOrder.groups_2101['${i[@]}'].items['${j[@]}'].product.usItemId'` == '"504678442"' ]]; then
        echo $curl60 | jq '.data.guestOrder.id' >> track-OrderID.txt
        echo $curl60 | jq '.data.guestOrder.customer.email' >> track-email.txt
        echo $curl60 | jq '.data.guestOrder.groups_2101['${i[@]}'].items['${j[@]}'].product.usItemId' >> track-usItemId.txt
        echo $curl60 | jq '.data.guestOrder.groups_2101['${i[@]}'].items['${j[@]}'].priceInfo.linePrice.value' >> track-priceValue.txt
        echo $curl60 | jq '.data.guestOrder.groups_2101['${i[@]}'].deliveryAddress.fullName' >> track-fullName.txt
        echo $curl60 | jq '.data.guestOrder.groups_2101['${i[@]}'].deliveryAddress.address.addressString' >> track-address.txt
        echo $curl60 | jq '.data.guestOrder.groups_2101['${i[@]}'].status.message.parts[].text' >> track-status.txt
        echo $curl60 | jq '.data.guestOrder.groups_2101['${i[@]}'].shipment.trackingNumber' >> track-number.txt
        echo $curl60 | jq '.data.guestOrder.groups_2101['${i[@]}'].shipment.trackingUrl' >> track-url.txt
        echo "60"
        break
      fi
    done
  fi
done

curl61=`curl -s 'https://www.walmart.com/orchestra/home/graphql' \
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
  if [[ $curl61 =~ "error" ]]; then
    echo "Sai thông tin đăng nhập-Record số 61"
    break
  elif [[ $curl61 =~ "blocked" ]]; then
    echo "Lỗi blocked-Record số 61"
    break
  else
    for (( j=0; j<=4; j++))
    do
      if [[ `echo $curl61 | jq '.data.guestOrder.groups_2101['${i[@]}'].items['${j[@]}'].product.usItemId'` == '"520367700"' ]]; then
        echo $curl61 | jq '.data.guestOrder.id' >> track-OrderID.txt
        echo $curl61 | jq '.data.guestOrder.customer.email' >> track-email.txt
        echo $curl61 | jq '.data.guestOrder.groups_2101['${i[@]}'].items['${j[@]}'].product.usItemId' >> track-usItemId.txt
        echo $curl61 | jq '.data.guestOrder.groups_2101['${i[@]}'].items['${j[@]}'].priceInfo.linePrice.value' >> track-priceValue.txt
        echo $curl61 | jq '.data.guestOrder.groups_2101['${i[@]}'].deliveryAddress.fullName' >> track-fullName.txt
        echo $curl61 | jq '.data.guestOrder.groups_2101['${i[@]}'].deliveryAddress.address.addressString' >> track-address.txt
        echo $curl61 | jq '.data.guestOrder.groups_2101['${i[@]}'].status.message.parts[].text' >> track-status.txt
        echo $curl61 | jq '.data.guestOrder.groups_2101['${i[@]}'].shipment.trackingNumber' >> track-number.txt
        echo $curl61 | jq '.data.guestOrder.groups_2101['${i[@]}'].shipment.trackingUrl' >> track-url.txt
        echo "61"
        break
      fi
    done
  fi
done

curl62=`curl -s 'https://www.walmart.com/orchestra/home/graphql' \
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
  if [[ $curl62 =~ "error" ]]; then
    echo "Sai thông tin đăng nhập-Record số 62"
    break
  elif [[ $curl62 =~ "blocked" ]]; then
    echo "Lỗi blocked-Record số 62"
    break
  else
    for (( j=0; j<=4; j++))
    do
      if [[ `echo $curl62 | jq '.data.guestOrder.groups_2101['${i[@]}'].items['${j[@]}'].product.usItemId'` == '"514290555"' ]]; then
        echo $curl62 | jq '.data.guestOrder.id' >> track-OrderID.txt
        echo $curl62 | jq '.data.guestOrder.customer.email' >> track-email.txt
        echo $curl62 | jq '.data.guestOrder.groups_2101['${i[@]}'].items['${j[@]}'].product.usItemId' >> track-usItemId.txt
        echo $curl62 | jq '.data.guestOrder.groups_2101['${i[@]}'].items['${j[@]}'].priceInfo.linePrice.value' >> track-priceValue.txt
        echo $curl62 | jq '.data.guestOrder.groups_2101['${i[@]}'].deliveryAddress.fullName' >> track-fullName.txt
        echo $curl62 | jq '.data.guestOrder.groups_2101['${i[@]}'].deliveryAddress.address.addressString' >> track-address.txt
        echo $curl62 | jq '.data.guestOrder.groups_2101['${i[@]}'].status.message.parts[].text' >> track-status.txt
        echo $curl62 | jq '.data.guestOrder.groups_2101['${i[@]}'].shipment.trackingNumber' >> track-number.txt
        echo $curl62 | jq '.data.guestOrder.groups_2101['${i[@]}'].shipment.trackingUrl' >> track-url.txt
        echo "62"
        break
      fi
    done
  fi
done

curl63=`curl -s 'https://www.walmart.com/orchestra/home/graphql' \
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
  if [[ $curl63 =~ "error" ]]; then
    echo "Sai thông tin đăng nhập-Record số 63"
    break
  elif [[ $curl63 =~ "blocked" ]]; then
    echo "Lỗi blocked-Record số 63"
    break
  else
    for (( j=0; j<=4; j++))
    do
      if [[ `echo $curl63 | jq '.data.guestOrder.groups_2101['${i[@]}'].items['${j[@]}'].product.usItemId'` == '"217281734"' ]]; then
        echo $curl63 | jq '.data.guestOrder.id' >> track-OrderID.txt
        echo $curl63 | jq '.data.guestOrder.customer.email' >> track-email.txt
        echo $curl63 | jq '.data.guestOrder.groups_2101['${i[@]}'].items['${j[@]}'].product.usItemId' >> track-usItemId.txt
        echo $curl63 | jq '.data.guestOrder.groups_2101['${i[@]}'].items['${j[@]}'].priceInfo.linePrice.value' >> track-priceValue.txt
        echo $curl63 | jq '.data.guestOrder.groups_2101['${i[@]}'].deliveryAddress.fullName' >> track-fullName.txt
        echo $curl63 | jq '.data.guestOrder.groups_2101['${i[@]}'].deliveryAddress.address.addressString' >> track-address.txt
        echo $curl63 | jq '.data.guestOrder.groups_2101['${i[@]}'].status.message.parts[].text' >> track-status.txt
        echo $curl63 | jq '.data.guestOrder.groups_2101['${i[@]}'].shipment.trackingNumber' >> track-number.txt
        echo $curl63 | jq '.data.guestOrder.groups_2101['${i[@]}'].shipment.trackingUrl' >> track-url.txt
        echo "63"
        break
      fi
    done
  fi
done

curl64=`curl -s 'https://www.walmart.com/orchestra/home/graphql' \
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
  if [[ $curl64 =~ "error" ]]; then
    echo "Sai thông tin đăng nhập-Record số 64"
    break
  elif [[ $curl64 =~ "blocked" ]]; then
    echo "Lỗi blocked-Record số 64"
    break
  else
    for (( j=0; j<=4; j++))
    do
      if [[ `echo $curl64 | jq '.data.guestOrder.groups_2101['${i[@]}'].items['${j[@]}'].product.usItemId'` == '"45465229"' ]]; then
        echo $curl64 | jq '.data.guestOrder.id' >> track-OrderID.txt
        echo $curl64 | jq '.data.guestOrder.customer.email' >> track-email.txt
        echo $curl64 | jq '.data.guestOrder.groups_2101['${i[@]}'].items['${j[@]}'].product.usItemId' >> track-usItemId.txt
        echo $curl64 | jq '.data.guestOrder.groups_2101['${i[@]}'].items['${j[@]}'].priceInfo.linePrice.value' >> track-priceValue.txt
        echo $curl64 | jq '.data.guestOrder.groups_2101['${i[@]}'].deliveryAddress.fullName' >> track-fullName.txt
        echo $curl64 | jq '.data.guestOrder.groups_2101['${i[@]}'].deliveryAddress.address.addressString' >> track-address.txt
        echo $curl64 | jq '.data.guestOrder.groups_2101['${i[@]}'].status.message.parts[].text' >> track-status.txt
        echo $curl64 | jq '.data.guestOrder.groups_2101['${i[@]}'].shipment.trackingNumber' >> track-number.txt
        echo $curl64 | jq '.data.guestOrder.groups_2101['${i[@]}'].shipment.trackingUrl' >> track-url.txt
        echo "64"
        break
      fi
    done
  fi
done

curl65=`curl -s 'https://www.walmart.com/orchestra/home/graphql' \
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
  if [[ $curl65 =~ "error" ]]; then
    echo "Sai thông tin đăng nhập-Record số 65"
    break
  elif [[ $curl65 =~ "blocked" ]]; then
    echo "Lỗi blocked-Record số 65"
    break
  else
    for (( j=0; j<=4; j++))
    do
      if [[ `echo $curl65 | jq '.data.guestOrder.groups_2101['${i[@]}'].items['${j[@]}'].product.usItemId'` == '"251382558"' ]]; then
        echo $curl65 | jq '.data.guestOrder.id' >> track-OrderID.txt
        echo $curl65 | jq '.data.guestOrder.customer.email' >> track-email.txt
        echo $curl65 | jq '.data.guestOrder.groups_2101['${i[@]}'].items['${j[@]}'].product.usItemId' >> track-usItemId.txt
        echo $curl65 | jq '.data.guestOrder.groups_2101['${i[@]}'].items['${j[@]}'].priceInfo.linePrice.value' >> track-priceValue.txt
        echo $curl65 | jq '.data.guestOrder.groups_2101['${i[@]}'].deliveryAddress.fullName' >> track-fullName.txt
        echo $curl65 | jq '.data.guestOrder.groups_2101['${i[@]}'].deliveryAddress.address.addressString' >> track-address.txt
        echo $curl65 | jq '.data.guestOrder.groups_2101['${i[@]}'].status.message.parts[].text' >> track-status.txt
        echo $curl65 | jq '.data.guestOrder.groups_2101['${i[@]}'].shipment.trackingNumber' >> track-number.txt
        echo $curl65 | jq '.data.guestOrder.groups_2101['${i[@]}'].shipment.trackingUrl' >> track-url.txt
        echo "65"
        break
      fi
    done
  fi
done

curl66=`curl -s 'https://www.walmart.com/orchestra/home/graphql' \
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
  if [[ $curl66 =~ "error" ]]; then
    echo "Sai thông tin đăng nhập-Record số 66"
    break
  elif [[ $curl66 =~ "blocked" ]]; then
    echo "Lỗi blocked-Record số 66"
    break
  else
    for (( j=0; j<=4; j++))
    do
      if [[ `echo $curl66 | jq '.data.guestOrder.groups_2101['${i[@]}'].items['${j[@]}'].product.usItemId'` == '"50753947"' ]]; then
        echo $curl66 | jq '.data.guestOrder.id' >> track-OrderID.txt
        echo $curl66 | jq '.data.guestOrder.customer.email' >> track-email.txt
        echo $curl66 | jq '.data.guestOrder.groups_2101['${i[@]}'].items['${j[@]}'].product.usItemId' >> track-usItemId.txt
        echo $curl66 | jq '.data.guestOrder.groups_2101['${i[@]}'].items['${j[@]}'].priceInfo.linePrice.value' >> track-priceValue.txt
        echo $curl66 | jq '.data.guestOrder.groups_2101['${i[@]}'].deliveryAddress.fullName' >> track-fullName.txt
        echo $curl66 | jq '.data.guestOrder.groups_2101['${i[@]}'].deliveryAddress.address.addressString' >> track-address.txt
        echo $curl66 | jq '.data.guestOrder.groups_2101['${i[@]}'].status.message.parts[].text' >> track-status.txt
        echo $curl66 | jq '.data.guestOrder.groups_2101['${i[@]}'].shipment.trackingNumber' >> track-number.txt
        echo $curl66 | jq '.data.guestOrder.groups_2101['${i[@]}'].shipment.trackingUrl' >> track-url.txt
        echo "66"
        break
      fi
    done
  fi
done

curl67=`curl -s 'https://www.walmart.com/orchestra/home/graphql' \
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
  if [[ $curl67 =~ "error" ]]; then
    echo "Sai thông tin đăng nhập-Record số 67"
    break
  elif [[ $curl67 =~ "blocked" ]]; then
    echo "Lỗi blocked-Record số 67"
    break
  else
    for (( j=0; j<=4; j++))
    do
      if [[ `echo $curl67 | jq '.data.guestOrder.groups_2101['${i[@]}'].items['${j[@]}'].product.usItemId'` == '"337077643"' ]]; then
        echo $curl67 | jq '.data.guestOrder.id' >> track-OrderID.txt
        echo $curl67 | jq '.data.guestOrder.customer.email' >> track-email.txt
        echo $curl67 | jq '.data.guestOrder.groups_2101['${i[@]}'].items['${j[@]}'].product.usItemId' >> track-usItemId.txt
        echo $curl67 | jq '.data.guestOrder.groups_2101['${i[@]}'].items['${j[@]}'].priceInfo.linePrice.value' >> track-priceValue.txt
        echo $curl67 | jq '.data.guestOrder.groups_2101['${i[@]}'].deliveryAddress.fullName' >> track-fullName.txt
        echo $curl67 | jq '.data.guestOrder.groups_2101['${i[@]}'].deliveryAddress.address.addressString' >> track-address.txt
        echo $curl67 | jq '.data.guestOrder.groups_2101['${i[@]}'].status.message.parts[].text' >> track-status.txt
        echo $curl67 | jq '.data.guestOrder.groups_2101['${i[@]}'].shipment.trackingNumber' >> track-number.txt
        echo $curl67 | jq '.data.guestOrder.groups_2101['${i[@]}'].shipment.trackingUrl' >> track-url.txt
        echo "67"
        break
      fi
    done
  fi
done

curl68=`curl -s 'https://www.walmart.com/orchestra/home/graphql' \
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
  if [[ $curl68 =~ "error" ]]; then
    echo "Sai thông tin đăng nhập-Record số 68"
    break
  elif [[ $curl68 =~ "blocked" ]]; then
    echo "Lỗi blocked-Record số 68"
    break
  else
    for (( j=0; j<=4; j++))
    do
      if [[ `echo $curl68 | jq '.data.guestOrder.groups_2101['${i[@]}'].items['${j[@]}'].product.usItemId'` == '"755361385"' ]]; then
        echo $curl68 | jq '.data.guestOrder.id' >> track-OrderID.txt
        echo $curl68 | jq '.data.guestOrder.customer.email' >> track-email.txt
        echo $curl68 | jq '.data.guestOrder.groups_2101['${i[@]}'].items['${j[@]}'].product.usItemId' >> track-usItemId.txt
        echo $curl68 | jq '.data.guestOrder.groups_2101['${i[@]}'].items['${j[@]}'].priceInfo.linePrice.value' >> track-priceValue.txt
        echo $curl68 | jq '.data.guestOrder.groups_2101['${i[@]}'].deliveryAddress.fullName' >> track-fullName.txt
        echo $curl68 | jq '.data.guestOrder.groups_2101['${i[@]}'].deliveryAddress.address.addressString' >> track-address.txt
        echo $curl68 | jq '.data.guestOrder.groups_2101['${i[@]}'].status.message.parts[].text' >> track-status.txt
        echo $curl68 | jq '.data.guestOrder.groups_2101['${i[@]}'].shipment.trackingNumber' >> track-number.txt
        echo $curl68 | jq '.data.guestOrder.groups_2101['${i[@]}'].shipment.trackingUrl' >> track-url.txt
        echo "68"
        break
      fi
    done
  fi
done

curl69=`curl -s 'https://www.walmart.com/orchestra/home/graphql' \
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
  if [[ $curl69 =~ "error" ]]; then
    echo "Sai thông tin đăng nhập-Record số 69"
    break
  elif [[ $curl69 =~ "blocked" ]]; then
    echo "Lỗi blocked-Record số 69"
    break
  else
    for (( j=0; j<=4; j++))
    do
      if [[ `echo $curl69 | jq '.data.guestOrder.groups_2101['${i[@]}'].items['${j[@]}'].product.usItemId'` == '"399596583"' ]]; then
        echo $curl69 | jq '.data.guestOrder.id' >> track-OrderID.txt
        echo $curl69 | jq '.data.guestOrder.customer.email' >> track-email.txt
        echo $curl69 | jq '.data.guestOrder.groups_2101['${i[@]}'].items['${j[@]}'].product.usItemId' >> track-usItemId.txt
        echo $curl69 | jq '.data.guestOrder.groups_2101['${i[@]}'].items['${j[@]}'].priceInfo.linePrice.value' >> track-priceValue.txt
        echo $curl69 | jq '.data.guestOrder.groups_2101['${i[@]}'].deliveryAddress.fullName' >> track-fullName.txt
        echo $curl69 | jq '.data.guestOrder.groups_2101['${i[@]}'].deliveryAddress.address.addressString' >> track-address.txt
        echo $curl69 | jq '.data.guestOrder.groups_2101['${i[@]}'].status.message.parts[].text' >> track-status.txt
        echo $curl69 | jq '.data.guestOrder.groups_2101['${i[@]}'].shipment.trackingNumber' >> track-number.txt
        echo $curl69 | jq '.data.guestOrder.groups_2101['${i[@]}'].shipment.trackingUrl' >> track-url.txt
        echo "69"
        break
      fi
    done
  fi
done

curl70=`curl -s 'https://www.walmart.com/orchestra/home/graphql' \
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
  if [[ $curl70 =~ "error" ]]; then
    echo "Sai thông tin đăng nhập-Record số 70"
    break
  elif [[ $curl70 =~ "blocked" ]]; then
    echo "Lỗi blocked-Record số 70"
    break
  else
    for (( j=0; j<=4; j++))
    do
      if [[ `echo $curl70 | jq '.data.guestOrder.groups_2101['${i[@]}'].items['${j[@]}'].product.usItemId'` == '"755361385"' ]]; then
        echo $curl70 | jq '.data.guestOrder.id' >> track-OrderID.txt
        echo $curl70 | jq '.data.guestOrder.customer.email' >> track-email.txt
        echo $curl70 | jq '.data.guestOrder.groups_2101['${i[@]}'].items['${j[@]}'].product.usItemId' >> track-usItemId.txt
        echo $curl70 | jq '.data.guestOrder.groups_2101['${i[@]}'].items['${j[@]}'].priceInfo.linePrice.value' >> track-priceValue.txt
        echo $curl70 | jq '.data.guestOrder.groups_2101['${i[@]}'].deliveryAddress.fullName' >> track-fullName.txt
        echo $curl70 | jq '.data.guestOrder.groups_2101['${i[@]}'].deliveryAddress.address.addressString' >> track-address.txt
        echo $curl70 | jq '.data.guestOrder.groups_2101['${i[@]}'].status.message.parts[].text' >> track-status.txt
        echo $curl70 | jq '.data.guestOrder.groups_2101['${i[@]}'].shipment.trackingNumber' >> track-number.txt
        echo $curl70 | jq '.data.guestOrder.groups_2101['${i[@]}'].shipment.trackingUrl' >> track-url.txt
        echo "70"
        break
      fi
    done
  fi
done

curl71=`curl -s 'https://www.walmart.com/orchestra/home/graphql' \
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
  if [[ $curl71 =~ "error" ]]; then
    echo "Sai thông tin đăng nhập-Record số 71"
    break
  elif [[ $curl71 =~ "blocked" ]]; then
    echo "Lỗi blocked-Record số 71"
    break
  else
    for (( j=0; j<=4; j++))
    do
      if [[ `echo $curl71 | jq '.data.guestOrder.groups_2101['${i[@]}'].items['${j[@]}'].product.usItemId'` == '"689830322"' ]]; then
        echo $curl71 | jq '.data.guestOrder.id' >> track-OrderID.txt
        echo $curl71 | jq '.data.guestOrder.customer.email' >> track-email.txt
        echo $curl71 | jq '.data.guestOrder.groups_2101['${i[@]}'].items['${j[@]}'].product.usItemId' >> track-usItemId.txt
        echo $curl71 | jq '.data.guestOrder.groups_2101['${i[@]}'].items['${j[@]}'].priceInfo.linePrice.value' >> track-priceValue.txt
        echo $curl71 | jq '.data.guestOrder.groups_2101['${i[@]}'].deliveryAddress.fullName' >> track-fullName.txt
        echo $curl71 | jq '.data.guestOrder.groups_2101['${i[@]}'].deliveryAddress.address.addressString' >> track-address.txt
        echo $curl71 | jq '.data.guestOrder.groups_2101['${i[@]}'].status.message.parts[].text' >> track-status.txt
        echo $curl71 | jq '.data.guestOrder.groups_2101['${i[@]}'].shipment.trackingNumber' >> track-number.txt
        echo $curl71 | jq '.data.guestOrder.groups_2101['${i[@]}'].shipment.trackingUrl' >> track-url.txt
        echo "71"
        break
      fi
    done
  fi
done

curl72=`curl -s 'https://www.walmart.com/orchestra/home/graphql' \
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
  if [[ $curl72 =~ "error" ]]; then
    echo "Sai thông tin đăng nhập-Record số 72"
    break
  elif [[ $curl72 =~ "blocked" ]]; then
    echo "Lỗi blocked-Record số 72"
    break
  else
    for (( j=0; j<=4; j++))
    do
      if [[ `echo $curl72 | jq '.data.guestOrder.groups_2101['${i[@]}'].items['${j[@]}'].product.usItemId'` == '"121639349"' ]]; then
        echo $curl72 | jq '.data.guestOrder.id' >> track-OrderID.txt
        echo $curl72 | jq '.data.guestOrder.customer.email' >> track-email.txt
        echo $curl72 | jq '.data.guestOrder.groups_2101['${i[@]}'].items['${j[@]}'].product.usItemId' >> track-usItemId.txt
        echo $curl72 | jq '.data.guestOrder.groups_2101['${i[@]}'].items['${j[@]}'].priceInfo.linePrice.value' >> track-priceValue.txt
        echo $curl72 | jq '.data.guestOrder.groups_2101['${i[@]}'].deliveryAddress.fullName' >> track-fullName.txt
        echo $curl72 | jq '.data.guestOrder.groups_2101['${i[@]}'].deliveryAddress.address.addressString' >> track-address.txt
        echo $curl72 | jq '.data.guestOrder.groups_2101['${i[@]}'].status.message.parts[].text' >> track-status.txt
        echo $curl72 | jq '.data.guestOrder.groups_2101['${i[@]}'].shipment.trackingNumber' >> track-number.txt
        echo $curl72 | jq '.data.guestOrder.groups_2101['${i[@]}'].shipment.trackingUrl' >> track-url.txt
        echo "72"
        break
      fi
    done
  fi
done

curl73=`curl -s 'https://www.walmart.com/orchestra/home/graphql' \
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
  if [[ $curl73 =~ "error" ]]; then
    echo "Sai thông tin đăng nhập-Record số 73"
    break
  elif [[ $curl73 =~ "blocked" ]]; then
    echo "Lỗi blocked-Record số 73"
    break
  else
    for (( j=0; j<=4; j++))
    do
      if [[ `echo $curl73 | jq '.data.guestOrder.groups_2101['${i[@]}'].items['${j[@]}'].product.usItemId'` == '"378936130"' ]]; then
        echo $curl73 | jq '.data.guestOrder.id' >> track-OrderID.txt
        echo $curl73 | jq '.data.guestOrder.customer.email' >> track-email.txt
        echo $curl73 | jq '.data.guestOrder.groups_2101['${i[@]}'].items['${j[@]}'].product.usItemId' >> track-usItemId.txt
        echo $curl73 | jq '.data.guestOrder.groups_2101['${i[@]}'].items['${j[@]}'].priceInfo.linePrice.value' >> track-priceValue.txt
        echo $curl73 | jq '.data.guestOrder.groups_2101['${i[@]}'].deliveryAddress.fullName' >> track-fullName.txt
        echo $curl73 | jq '.data.guestOrder.groups_2101['${i[@]}'].deliveryAddress.address.addressString' >> track-address.txt
        echo $curl73 | jq '.data.guestOrder.groups_2101['${i[@]}'].status.message.parts[].text' >> track-status.txt
        echo $curl73 | jq '.data.guestOrder.groups_2101['${i[@]}'].shipment.trackingNumber' >> track-number.txt
        echo $curl73 | jq '.data.guestOrder.groups_2101['${i[@]}'].shipment.trackingUrl' >> track-url.txt
        echo "73"
        break
      fi
    done
  fi
done

curl74=`curl -s 'https://www.walmart.com/orchestra/home/graphql' \
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
  if [[ $curl74 =~ "error" ]]; then
    echo "Sai thông tin đăng nhập-Record số 74"
    break
  elif [[ $curl74 =~ "blocked" ]]; then
    echo "Lỗi blocked-Record số 74"
    break
  else
    for (( j=0; j<=4; j++))
    do
      if [[ `echo $curl74 | jq '.data.guestOrder.groups_2101['${i[@]}'].items['${j[@]}'].product.usItemId'` == '"50109305"' ]]; then
        echo $curl74 | jq '.data.guestOrder.id' >> track-OrderID.txt
        echo $curl74 | jq '.data.guestOrder.customer.email' >> track-email.txt
        echo $curl74 | jq '.data.guestOrder.groups_2101['${i[@]}'].items['${j[@]}'].product.usItemId' >> track-usItemId.txt
        echo $curl74 | jq '.data.guestOrder.groups_2101['${i[@]}'].items['${j[@]}'].priceInfo.linePrice.value' >> track-priceValue.txt
        echo $curl74 | jq '.data.guestOrder.groups_2101['${i[@]}'].deliveryAddress.fullName' >> track-fullName.txt
        echo $curl74 | jq '.data.guestOrder.groups_2101['${i[@]}'].deliveryAddress.address.addressString' >> track-address.txt
        echo $curl74 | jq '.data.guestOrder.groups_2101['${i[@]}'].status.message.parts[].text' >> track-status.txt
        echo $curl74 | jq '.data.guestOrder.groups_2101['${i[@]}'].shipment.trackingNumber' >> track-number.txt
        echo $curl74 | jq '.data.guestOrder.groups_2101['${i[@]}'].shipment.trackingUrl' >> track-url.txt
        echo "74"
        break
      fi
    done
  fi
done

curl75=`curl -s 'https://www.walmart.com/orchestra/home/graphql' \
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
  if [[ $curl75 =~ "error" ]]; then
    echo "Sai thông tin đăng nhập-Record số 75"
    break
  elif [[ $curl75 =~ "blocked" ]]; then
    echo "Lỗi blocked-Record số 75"
    break
  else
    for (( j=0; j<=4; j++))
    do
      if [[ `echo $curl75 | jq '.data.guestOrder.groups_2101['${i[@]}'].items['${j[@]}'].product.usItemId'` == '"480863972"' ]]; then
        echo $curl75 | jq '.data.guestOrder.id' >> track-OrderID.txt
        echo $curl75 | jq '.data.guestOrder.customer.email' >> track-email.txt
        echo $curl75 | jq '.data.guestOrder.groups_2101['${i[@]}'].items['${j[@]}'].product.usItemId' >> track-usItemId.txt
        echo $curl75 | jq '.data.guestOrder.groups_2101['${i[@]}'].items['${j[@]}'].priceInfo.linePrice.value' >> track-priceValue.txt
        echo $curl75 | jq '.data.guestOrder.groups_2101['${i[@]}'].deliveryAddress.fullName' >> track-fullName.txt
        echo $curl75 | jq '.data.guestOrder.groups_2101['${i[@]}'].deliveryAddress.address.addressString' >> track-address.txt
        echo $curl75 | jq '.data.guestOrder.groups_2101['${i[@]}'].status.message.parts[].text' >> track-status.txt
        echo $curl75 | jq '.data.guestOrder.groups_2101['${i[@]}'].shipment.trackingNumber' >> track-number.txt
        echo $curl75 | jq '.data.guestOrder.groups_2101['${i[@]}'].shipment.trackingUrl' >> track-url.txt
        echo "75"
        break
      fi
    done
  fi
done

curl76=`curl -s 'https://www.walmart.com/orchestra/home/graphql' \
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
  if [[ $curl76 =~ "error" ]]; then
    echo "Sai thông tin đăng nhập-Record số 76"
    break
  elif [[ $curl76 =~ "blocked" ]]; then
    echo "Lỗi blocked-Record số 76"
    break
  else
    for (( j=0; j<=4; j++))
    do
      if [[ `echo $curl76 | jq '.data.guestOrder.groups_2101['${i[@]}'].items['${j[@]}'].product.usItemId'` == '"251382558"' ]]; then
        echo $curl76 | jq '.data.guestOrder.id' >> track-OrderID.txt
        echo $curl76 | jq '.data.guestOrder.customer.email' >> track-email.txt
        echo $curl76 | jq '.data.guestOrder.groups_2101['${i[@]}'].items['${j[@]}'].product.usItemId' >> track-usItemId.txt
        echo $curl76 | jq '.data.guestOrder.groups_2101['${i[@]}'].items['${j[@]}'].priceInfo.linePrice.value' >> track-priceValue.txt
        echo $curl76 | jq '.data.guestOrder.groups_2101['${i[@]}'].deliveryAddress.fullName' >> track-fullName.txt
        echo $curl76 | jq '.data.guestOrder.groups_2101['${i[@]}'].deliveryAddress.address.addressString' >> track-address.txt
        echo $curl76 | jq '.data.guestOrder.groups_2101['${i[@]}'].status.message.parts[].text' >> track-status.txt
        echo $curl76 | jq '.data.guestOrder.groups_2101['${i[@]}'].shipment.trackingNumber' >> track-number.txt
        echo $curl76 | jq '.data.guestOrder.groups_2101['${i[@]}'].shipment.trackingUrl' >> track-url.txt
        echo "76"
        break
      fi
    done
  fi
done

curl77=`curl -s 'https://www.walmart.com/orchestra/home/graphql' \
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
  if [[ $curl77 =~ "error" ]]; then
    echo "Sai thông tin đăng nhập-Record số 77"
    break
  elif [[ $curl77 =~ "blocked" ]]; then
    echo "Lỗi blocked-Record số 77"
    break
  else
    for (( j=0; j<=4; j++))
    do
      if [[ `echo $curl77 | jq '.data.guestOrder.groups_2101['${i[@]}'].items['${j[@]}'].product.usItemId'` == '"969841770"' ]]; then
        echo $curl77 | jq '.data.guestOrder.id' >> track-OrderID.txt
        echo $curl77 | jq '.data.guestOrder.customer.email' >> track-email.txt
        echo $curl77 | jq '.data.guestOrder.groups_2101['${i[@]}'].items['${j[@]}'].product.usItemId' >> track-usItemId.txt
        echo $curl77 | jq '.data.guestOrder.groups_2101['${i[@]}'].items['${j[@]}'].priceInfo.linePrice.value' >> track-priceValue.txt
        echo $curl77 | jq '.data.guestOrder.groups_2101['${i[@]}'].deliveryAddress.fullName' >> track-fullName.txt
        echo $curl77 | jq '.data.guestOrder.groups_2101['${i[@]}'].deliveryAddress.address.addressString' >> track-address.txt
        echo $curl77 | jq '.data.guestOrder.groups_2101['${i[@]}'].status.message.parts[].text' >> track-status.txt
        echo $curl77 | jq '.data.guestOrder.groups_2101['${i[@]}'].shipment.trackingNumber' >> track-number.txt
        echo $curl77 | jq '.data.guestOrder.groups_2101['${i[@]}'].shipment.trackingUrl' >> track-url.txt
        echo "77"
        break
      fi
    done
  fi
done

curl78=`curl -s 'https://www.walmart.com/orchestra/home/graphql' \
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
  if [[ $curl78 =~ "error" ]]; then
    echo "Sai thông tin đăng nhập-Record số 78"
    break
  elif [[ $curl78 =~ "blocked" ]]; then
    echo "Lỗi blocked-Record số 78"
    break
  else
    for (( j=0; j<=4; j++))
    do
      if [[ `echo $curl78 | jq '.data.guestOrder.groups_2101['${i[@]}'].items['${j[@]}'].product.usItemId'` == '"38444962"' ]]; then
        echo $curl78 | jq '.data.guestOrder.id' >> track-OrderID.txt
        echo $curl78 | jq '.data.guestOrder.customer.email' >> track-email.txt
        echo $curl78 | jq '.data.guestOrder.groups_2101['${i[@]}'].items['${j[@]}'].product.usItemId' >> track-usItemId.txt
        echo $curl78 | jq '.data.guestOrder.groups_2101['${i[@]}'].items['${j[@]}'].priceInfo.linePrice.value' >> track-priceValue.txt
        echo $curl78 | jq '.data.guestOrder.groups_2101['${i[@]}'].deliveryAddress.fullName' >> track-fullName.txt
        echo $curl78 | jq '.data.guestOrder.groups_2101['${i[@]}'].deliveryAddress.address.addressString' >> track-address.txt
        echo $curl78 | jq '.data.guestOrder.groups_2101['${i[@]}'].status.message.parts[].text' >> track-status.txt
        echo $curl78 | jq '.data.guestOrder.groups_2101['${i[@]}'].shipment.trackingNumber' >> track-number.txt
        echo $curl78 | jq '.data.guestOrder.groups_2101['${i[@]}'].shipment.trackingUrl' >> track-url.txt
        echo "78"
        break
      fi
    done
  fi
done

curl79=`curl -s 'https://www.walmart.com/orchestra/home/graphql' \
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
  if [[ $curl79 =~ "error" ]]; then
    echo "Sai thông tin đăng nhập-Record số 79"
    break
  elif [[ $curl79 =~ "blocked" ]]; then
    echo "Lỗi blocked-Record số 79"
    break
  else
    for (( j=0; j<=4; j++))
    do
      if [[ `echo $curl79 | jq '.data.guestOrder.groups_2101['${i[@]}'].items['${j[@]}'].product.usItemId'` == '"251382558"' ]]; then
        echo $curl79 | jq '.data.guestOrder.id' >> track-OrderID.txt
        echo $curl79 | jq '.data.guestOrder.customer.email' >> track-email.txt
        echo $curl79 | jq '.data.guestOrder.groups_2101['${i[@]}'].items['${j[@]}'].product.usItemId' >> track-usItemId.txt
        echo $curl79 | jq '.data.guestOrder.groups_2101['${i[@]}'].items['${j[@]}'].priceInfo.linePrice.value' >> track-priceValue.txt
        echo $curl79 | jq '.data.guestOrder.groups_2101['${i[@]}'].deliveryAddress.fullName' >> track-fullName.txt
        echo $curl79 | jq '.data.guestOrder.groups_2101['${i[@]}'].deliveryAddress.address.addressString' >> track-address.txt
        echo $curl79 | jq '.data.guestOrder.groups_2101['${i[@]}'].status.message.parts[].text' >> track-status.txt
        echo $curl79 | jq '.data.guestOrder.groups_2101['${i[@]}'].shipment.trackingNumber' >> track-number.txt
        echo $curl79 | jq '.data.guestOrder.groups_2101['${i[@]}'].shipment.trackingUrl' >> track-url.txt
        echo "79"
        break
      fi
    done
  fi
done

curl80=`curl -s 'https://www.walmart.com/orchestra/home/graphql' \
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
  if [[ $curl80 =~ "error" ]]; then
    echo "Sai thông tin đăng nhập-Record số 80"
    break
  elif [[ $curl80 =~ "blocked" ]]; then
    echo "Lỗi blocked-Record số 80"
    break
  else
    for (( j=0; j<=4; j++))
    do
      if [[ `echo $curl80 | jq '.data.guestOrder.groups_2101['${i[@]}'].items['${j[@]}'].product.usItemId'` == '"54315959"' ]]; then
        echo $curl80 | jq '.data.guestOrder.id' >> track-OrderID.txt
        echo $curl80 | jq '.data.guestOrder.customer.email' >> track-email.txt
        echo $curl80 | jq '.data.guestOrder.groups_2101['${i[@]}'].items['${j[@]}'].product.usItemId' >> track-usItemId.txt
        echo $curl80 | jq '.data.guestOrder.groups_2101['${i[@]}'].items['${j[@]}'].priceInfo.linePrice.value' >> track-priceValue.txt
        echo $curl80 | jq '.data.guestOrder.groups_2101['${i[@]}'].deliveryAddress.fullName' >> track-fullName.txt
        echo $curl80 | jq '.data.guestOrder.groups_2101['${i[@]}'].deliveryAddress.address.addressString' >> track-address.txt
        echo $curl80 | jq '.data.guestOrder.groups_2101['${i[@]}'].status.message.parts[].text' >> track-status.txt
        echo $curl80 | jq '.data.guestOrder.groups_2101['${i[@]}'].shipment.trackingNumber' >> track-number.txt
        echo $curl80 | jq '.data.guestOrder.groups_2101['${i[@]}'].shipment.trackingUrl' >> track-url.txt
        echo "80"
        break
      fi
    done
  fi
done


git add -A .
git commit -m --allow-empty
git push
git push origin HEAD -f
gitCommit=`git rev-parse HEAD`
linkGit=`echo https://raw.githubusercontent.com/DungSherlock/eBay/`$gitCommit`echo /`
linkApi=`echo https://script.google.com/macros/s/AKfycbxTUZPtaHbpL6Sdf4PXWLmCg1PcRotJWSyJQ-cKMC9AxPb-du0q4h3mmFAICVNeGp8GNQ/exec?`
linkPost=$linkApi`echo Item ID==IMPORTDATA\(\"`$linkGit`echo track-usItemId.txt\"\)\&Giá==IMPORTDATA\(\"`$linkGit`echo track-priceValue.txt\"\)\&Tên==IMPORTDATA\(\"`$linkGit`echo track-fullName.txt\"\)\&Địa chỉ==IMPORTDATA\(\"`$linkGit`echo track-address.txt\"\)\&Status==IMPORTDATA\(\"`$linkGit`echo track-status.txt\"\)\&Tracking Number==IMPORTDATA\(\"`$linkGit`echo track-number.txt\"\)\&Tracking URL==IMPORTDATA\(\"`$linkGit`echo track-url.txt\"\)\&Email==IMPORTDATA\(\"`$linkGit`echo track-email.txt\"\)\&Order==IMPORTDATA\(\"`$linkGit`echo track-OrderID.txt\"\)`
echo $linkPost
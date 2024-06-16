var element = document.evaluate('/html/body/div[7]/div[3]/table/tbody/tr/td[1]/div/span/text()', document, null, XPathResult.FIRST_ORDERED_NODE_TYPE, null).singleNodeValue;

if (element) {
  alert(element.textContent);
}

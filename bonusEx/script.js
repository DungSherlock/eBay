document.addEventListener('DOMContentLoaded', function() {
    var executeScriptButton = document.getElementById('executeScriptButton');
  
    if (executeScriptButton) {
      executeScriptButton.addEventListener('click', function() {
        chrome.tabs.query({ active: true, currentWindow: true }, function(tabs) {
          chrome.tabs.sendMessage(tabs[0].id, { action: 'executeScript' });
        });
      });
    } else {
      console.error("Element with id 'executeScriptButton' not found.");
    }
  });
  
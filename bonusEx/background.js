chrome.action.onClicked.addListener(async (tab) => {
  // Lấy tab hiện tại
  const [activeTab] = await chrome.tabs.query({ active: true, currentWindow: true });

  // Gửi yêu cầu lấy thông tin của phần tử từ content script
  chrome.scripting.executeScript({
      target: { tabId: activeTab.id },
      function: getPageElement
  });
});

function getPageElement() {
  // Lấy phần tử từ trang web
  const element = document.querySelector("your-selector"); // Thay "your-selector" bằng selector của phần tử bạn muốn lấy
  if (element) {
      alert(element.innerText); // Hiển thị alert với nội dung của phần tử
  } else {
      alert("Không tìm thấy phần tử trên trang web.");
  }
}

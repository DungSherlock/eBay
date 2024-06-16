document.getElementById("btnAlert").addEventListener("click", () => {
  // Gửi yêu cầu hiển thị alert đến background script khi nút được nhấn
  chrome.runtime.sendMessage({ action: "showAlert" });
});

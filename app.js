const startButton = document.querySelector("#startButton");
const statusTitle = document.querySelector("#statusTitle");
const statusText = document.querySelector("#statusText");
const connectionStatus = document.querySelector("#connectionStatus");

startButton.addEventListener("click", () => {
  statusTitle.textContent = "You're all set!";
  statusText.textContent = "StarterApp is running. Replace this action with the feature you want to build.";
  startButton.textContent = "Started ✓";
});

function updateConnection() {
  connectionStatus.textContent = navigator.onLine ? "Online" : "Offline mode";
}
window.addEventListener("online", updateConnection);
window.addEventListener("offline", updateConnection);
updateConnection();

if ("serviceWorker" in navigator) {
  window.addEventListener("load", () => {
    navigator.serviceWorker.register("./service-worker.js")
      .catch(error => console.error("Service worker registration failed:", error));
  });
}

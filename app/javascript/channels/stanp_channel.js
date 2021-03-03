import consumer from "./consumer"

consumer.subscriptions.create("StanpChannel", {
  connected() {
    // Called when the subscription is ready for use on the server
  },

  disconnected() {
    // Called when the subscription has been terminated by the server
  },

  received(data) {
    const today = new Date();
    const month = ("0"+(today.getMonth() + 1)).slice(-2);
    const day = ("0"+today.getDay()).slice(-2);
    const hours = today.getHours();
    const minutes = ("0"+today.getMinutes()).slice(-2);
    const html = `<div class="mycomment" >${month}/${day} ${hours}:${minutes}<p>${data.content.content}</p></div>`;
    const messages = document.getElementById('messages');
    messages.insertAdjacentHTML('beforeend', html);

    const obj = document.getElementById("messages");
    obj.scrollTop = obj.scrollHeight;
  }
});

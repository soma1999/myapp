import consumer from "./consumer"



consumer.subscriptions.create("MessageChannel", {
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
    const html = `<div class="mycomment" ><a href= "/rooms/${data.content.room_id}/messages/${data.content.id}" class="delete-btn hidden" rel="nofollow">削除する</a>${month}/${day} ${hours}:${minutes} <p>${data.content.content}</p></div>`;
    const messages = document.getElementById('messages');
    const newMessage = document.getElementById('message_content')
    const messageButton = document.getElementById('message-button')
    messages.insertAdjacentHTML('beforeend', html);
    newMessage.value='';
    messageButton.removeAttribute('disabled');

    const obj = document.getElementById("messages");
    obj.scrollTop = obj.scrollHeight;

  }
});

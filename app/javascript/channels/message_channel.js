import consumer from "./consumer"



consumer.subscriptions.create("MessageChannel",{
  connected() {
    // Called when the subscription is ready for use on the server
  },

  disconnected() {
    // Called when the subscription has been terminated by the server
  },

  received(data) {

    const today = new Date();
    const month = ("0"+(today.getMonth() + 1)).slice(-2);
    const day = ("0"+today.getDate()).slice(-2);
    const hours = today.getHours();
    const minutes = ("0"+today.getMinutes()).slice(-2);

    const newMessage = document.getElementById('content')
    const current_user=$("#current_user_id").val();
    
    const room_id=$('#room_id').val();

    const messages = document.getElementById('messages');
    const messageButton = document.getElementById('message-button')
    if( room_id == data.room_id){
    if ( data.content.user_id == current_user || data.content.celeb_id == current_user ){
      const mycomment =   
      `<div class="mycomment">
        <a href= "/rooms/${data.content.room_id}/messages/${data.content.id}" class="delete-btn hidden" rel="nofollow">
        削除する
        </a>
        ${month}/${day} ${hours}:${minutes} 
        <p class='my'>${data.content.content}</p>
      </div>`;
      messages.insertAdjacentHTML('beforeend', mycomment);
      newMessage.value='';
      messageButton.removeAttribute('disabled');
      const obj = document.getElementById("messages");
      obj.scrollTop = obj.scrollHeight;      
    }
    
    else{
      if(data.content.celeb_id == null){
      const fukidasi =
      `<div class='fukidasi'>
        <div class="faceicon">
          <img src= ${data.celeb_image} class= 'img'>
        </div>
        <div class="chatting">
          <div class='says'>
            <p>${data.content.content}</p>
          </div>
          <div class='created_at'>
            ${month}/${day} ${hours}:${minutes} 
          </div>
        </div>
      </div>`;
      messages.insertAdjacentHTML('beforeend', fukidasi);
      const obj = document.getElementById("messages");
      obj.scrollTop = obj.scrollHeight;}

      else{
        const fukidasi =
      `<div class='fukidasi'>
        <div class="faceicon">
          <img src= ${data.user_image} class= 'img'>
        </div>
        <div class="chatting">
          <div class='says'>
            <p>${data.content.content}</p>
          </div>
          <div class='created_at'>
            ${month}/${day} ${hours}:${minutes} 
          </div>
        </div>
      </div>`;
      messages.insertAdjacentHTML('beforeend', fukidasi);
      const obj = document.getElementById("messages");
      obj.scrollTop = obj.scrollHeight;
    }}}
  }
});


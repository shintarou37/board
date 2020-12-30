import consumer from "./consumer"

consumer.subscriptions.create("CommentChannel", {
  connected() {
    // Called when the subscription is ready for use on the server
  },

  disconnected() {
    // Called when the subscription has been terminated by the server
  },

  received(data) {
    // Called when there's incoming data on the websocket for this channel
    if (data.comment.text === "") {
      alert(`コメントを入力してください`);
      return null;
    }
    const html = 
    `<div class="card">
      <div class="card-header">
      コメント投稿者:<a href= "/users/${data.comment.user_id}">${data.user}</a>
      </div>
      <div class="list-group-item mb-2">
      コメント:${data.comment.text}  
      </div>  
    </div>`;
    const comments = document.getElementById('comments');
    const newComment = document.getElementById('comment_text');
    comments.insertAdjacentHTML('afterbegin', html);
    newComment.value='';
  }
});

// $(document).on("turbolinks:load", function () {
  // if ($("meta[name='current-user']").length > 0) {
App.chatrooms = App.cable.subscriptions.create("ChatroomsChannel", {
  connected: function() {
    // Called when the subscription is ready for use on the server
  },

  disconnected: function() {
    // Called when the subscription has been terminated by the server
  },

  received: function(data) {
    // Called when there's incoming data on the websocket for this channel
    var active_chatroom = $("[data-behavior='messages'][data-chatroom-id=" + data.chatroom_id + "]");
    if (active_chatroom.length > 0) {
      active_chatroom.append("<div><strong>" + data.username + ":</strong> " + data.body + "</div>");
      if (document.hidden && Notification.permission === "granted") {
        new Notification(data.username, { body: data.body });
      }
    } else {
      $("[data-behavior='chatroom-link'][data-chatroom-id='#{data.chatroom_id}']").css("font-weight", "bold");
    }
  },

  send_message: function(chatroom_id, message) {
    this.perform("send_message", { 
      chatroom_id: chatroom_id, 
      body: message
    });
  }
});
//   };
// });
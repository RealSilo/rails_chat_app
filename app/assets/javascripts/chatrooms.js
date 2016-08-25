// $(document).on("turbolinks:load", function () {


// });

$(document).on("keypress", "#new_message", function (e) {
  if (e && e.keyCode === 13 && e.target.value.length > 0) {
    e.preventDefault();
    $(this).submit();
  }
});

$(document).on("submit", "#new_message", function (e) {
  e.preventDefault();
  var chatroom_id = $("[data-behavior='messages']").data("chatroom-id");
  var body = $("#message_body");
  App.chatrooms.send_message(chatroom_id, body.val());
  body.val("");
});

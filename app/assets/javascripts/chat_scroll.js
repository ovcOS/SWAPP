function scrollLastMessageIntoView() {

  var messages = document.querySelectorAll(".message");
  if (messages.length > 1) {
    var lastMessage = messages[messages.length - 1]
    lastMessage.scrollIntoView();
  }
}

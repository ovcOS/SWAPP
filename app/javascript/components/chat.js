function autoSize() {
  const chatBox = document.getElementsByClassName('chat_text_box')[0];
  const textArea = chatBox.getElementsByTagName('textarea')[0];
  autosize(textArea);
  scrollLastMessageIntoView()
}

export{ autoSize };

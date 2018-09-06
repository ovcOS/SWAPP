function autoSize() {
  const chatBox = document.getElementsByClassName('chat_text_box')[0];
  if (typeof chatBox !== "undefined") {
    const textArea = chatBox.getElementsByTagName('textarea')[0];
    autosize(textArea);
    scrollLastMessageIntoView();
  }
}

export{ autoSize };

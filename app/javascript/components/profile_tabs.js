function switchTabs() {
  const tabInfo = document.getElementById('info')
  const tabMedia = document.getElementById('media')
  const media = document.getElementById('media-content')
  const info = document.getElementById('info-content')
  if (info) {
    tabInfo.addEventListener('click', (event) => {
      event.preventDefault();
      tabInfo.classList.add('active');
      tabInfo.nextElementSibling.classList.remove('active')
      info.classList.add('active');
      media.classList.remove('active');
    });
    tabMedia.addEventListener('click', (event) => {
      event.preventDefault;
      tabMedia.classList.add('active')
      tabMedia.previousElementSibling.classList.remove('active')
      media.classList.add('active');
      info.classList.remove('active');
    });
  }
}

export { switchTabs };

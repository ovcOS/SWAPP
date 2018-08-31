function inPageUpdate() {
  var button = document.getElementById('btn-update-about');
  if (button) {
    button.addEventListener('click', (event) => {
      console.log(event)
      var descriptionDiv = document.querySelector('.description');
      let form = document.querySelector('.form-update')
      descriptionDiv.innerHTML = ""
      button.innerHTML = ""
      form.classList.add('active')
    });
    const buttons = document.querySelectorAll('.btn-update-other')
    for (let i=0; i<buttons.length; i++) {
      buttons[i].addEventListener('click', (event) => {
        let forms = document.querySelectorAll('.form-update')
        buttons[i].innerHTML = ""
        forms[i+1].classList.add('active')
      })
    }
    var uploadButton = document.querySelector('.btn-upload-image');
    uploadButton.addEventListener('click', (event) => {
      console.log(event)
      let formUpdate = document.querySelectorAll('.form-update');
      formUpdate[3].classList.add('active');
      uploadButton.innerHTML = ""
    })
  }
}

export { inPageUpdate };

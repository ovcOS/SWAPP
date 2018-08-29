function inPageUpdate() {
  var button = document.getElementById('btn-update-about');
  button.addEventListener('click', (event) => {
    console.log(event)
    var descriptionDiv = document.querySelector('.description');
    var descriptionDivText = document.querySelector('.description').innerHTML;
    descriptionDiv.innerHTML = "";
  });
}

export { inPageUpdate };

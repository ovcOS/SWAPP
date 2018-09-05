function fullPageSlide() {
  var fullPageSlide = document.getElementById("fullpage");
  if (fullPageSlide) {
    new fullpage('#fullpage', {
      //options here
      autoScrolling: true,
      scrollHorizontally: true,
      licenseKey: 'OPEN-SOURCE-GPLV3-LICENSE',
      fadingEffect: true
    });
    //methods
    fullpage_api.setAllowScrolling(true);
    var buttonsNext = document.querySelectorAll('.button.fas.fa-check');
    for( let i = 0; buttonsNext.length > i; i++ ) {
      buttonsNext[i].addEventListener('click', (event) => {
        event.preventDefault();
        fullpage_api.moveTo(i+2);
      })
    }
  }
}

export { fullPageSlide };

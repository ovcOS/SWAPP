function fullPageSlide() {
  var fullPageSlide = document.getElementById("fullpage");
  if (fullPageSlide) {
    new fullpage('#fullpage', {
      //options here
      autoScrolling: true,
      scrollHorizontally: true,
      licenseKey: 'OPEN-SOURCE-GPLV3-LICENSE',
      navigation: true,
      navigationPosition: 'left'
    });
    //methods
    fullpage_api.setAllowScrolling(true);
  }
}

export { fullPageSlide };

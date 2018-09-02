function slider() {
  var carousel = document.querySelector('.carousel');
  if (carousel) {
    var hammer = new Hammer(carousel);
    hammer.on('swipeleft', function(e) {
      $('.carousel').carousel('next');
    });
  }
}

export { slider };

//jquery-stealer
function slider() {
  var carousel = document.querySelector('.carousel');
  if (carousel) {
    var hammer = new Hammer(carousel);
    hammer.on('swipeleft', function(e) {
      $('.carousel').carousel('next');
    });
    hammer.on('swiperight', function(e) {
      $('.carousel').carousel('prev');
    });
  }
}

export { slider };

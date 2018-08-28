function carousel() {
  $(document).ready(function() {
    //carousel options
    $('#quote-carousel').carousel({
      pause: true, interval: 10000,
    });
  });
}

export{carousel};

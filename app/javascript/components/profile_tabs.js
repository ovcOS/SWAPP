function switchTabs() {
    // Declare all variables
  $('.button').first().addClass('active');

  $('.button').click(function(){
    var $this = $(this);
    var $siblings = $this.parent().children(),
    position = $siblings.index($this);
    console.log (position);

    $('.content div').removeClass('active').eq(position).addClass('active');

    $siblings.removeClass('active');
    $this.addClass('active');
  })
}

export { switchTabs };

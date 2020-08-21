$(function() {
  $('.menu-trigger').on('click', function(event) {
    $(this).toggleClass('active');
    $('#sp-menu').fadeToggle();
    event.preventDefault();
  });
});

$(function() {
  $('#back a').on('click',function(event){
    $('body, html').animate({
      scrollTop:0
    }, 1000);
    event.preventDefault();
  });
});

$(function() {
  $('.Btn__scrollDown a').on('click',function(event){
    $('body, html').animate({
      scrollTop:750
    }, 1000);
    event.preventDefault();
  });
});
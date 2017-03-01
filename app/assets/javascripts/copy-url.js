$(document).ready(function() {
  $('.copy-url-input').val(window.location.href);
  $('.copy-to-clipboard').on('click', function(el){
    copyText($('.copy-url-input').val())
  });
});

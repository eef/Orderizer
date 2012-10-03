$(document).ready(function() {
   hide_flash_messages();
});

function hide_flash_messages() {
  var flashes = $(".alert");
  if(flashes.length > 0) {
    setTimeout(function(){
      $(".alert").slideUp();
    }, 3000)
  }
}

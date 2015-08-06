// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require turbolinks
//= require_tree .


function ready() {
  $('button span').text("$20.00 - Pay with card");
  $("#hamburger").click(function () {
      $("#menu-list").toggleClass("opacity");
      $(".slice").toggleClass("transform");
  });

  $("#reservation_plates").on("change", function(e){
    var price = 20;
    var multiplier = $(this).val();
    var priceToDisplay = '$' + String(price * multiplier) + '.00';
    $('#payment').text(priceToDisplay);
    $('button span').text(priceToDisplay + " - Pay with card");
  });
  //$('.stripe-button-el').click(function(){
  //  console.log('click');
  //  event.preventDefault();
  //});
}
$(document).on('ready page:load', ready);

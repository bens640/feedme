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
    $(document).ready(function () {
        $("#hamburger").click(function () {
            $("#menu-list").toggleClass("opacity");
            $(".slice").toggleClass("transform");
        });


      $("#reservation_plates").on("change", function(e){
        var price = 20;
        var multiplier = $(this).val();
        var priceToDisplay = '$' + String(price * multiplier) + '.00';
        $('#payment').text(priceToDisplay);
      });

    });




    $('#reservation_plates').click(function(){
      var amount_charge = parseInt($('#reservation_plates').val())*2000+'';
      $('.stripe-button').attr('data-amount', amount_charge);
    });
  //(parseInt($('#reservation_plates'))*20000)+""


}
$(document).on('ready page:load', ready);

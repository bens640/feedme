
function ready() {

  $(document).ready(function () {
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
    $('.stripe-button-el').click(function(){
      console.log('click');
      event.preventDefault();
    });
  });
}
$(document).on('ready page:load', ready);

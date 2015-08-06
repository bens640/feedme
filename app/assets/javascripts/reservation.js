
var validation_helper = function(validation_stats){
  for (var stat in validation_stats){
    if (validation_stats[stat] === ''){
      return false;
    }
  }
  return true;
};
var reservation_validations = function(){
  var reservation_stats = {
    plates: $("#reservation_plates").val(),
    date: $("#reservation_date").val(),
    time: $('#reservation_time').val(),
    address: $('#reservation_address').val(),
    city: $("#reservation_city").val(),
    state: $("#reservation_state").val(),
    zip: $("#reservation_zip").val(),
    phone: $("#reservation_phone").val(),
    recipe: $('#reservation_recipe_id').val()
  };

  if (!validation_helper(reservation_stats)){
    console.log('Please enter all fields.');
    return false;
  }
  return true;
};

payAction = function(){
  var handler = StripeCheckout.configure({
    key: 'pk_test_e8QtgSkRSPlLShtgpcB72KyR',
    token: function(token) {

      var total = parseInt($('#reservation_plates').val())*2000+'';
      var time = $("#reservation_time").val();
      var em = $("#reservation_date_2i").val();
      var ed = $("#reservation_date_3i").val();
      var ey = $("#reservation_date_1i").val();
      var date = new Date(ey,em,ed);
      var recipe = $("#reservation_recipe_id").val();
      var details = $('#reservation_details').val();
      var address = $("#reservation_address").val();
      var address2 = $("#reservation_address2").val();
      var city = $("#reservation_city").val();
      var state = $("#reservation_state").val();
      var zip = $("#reservation_zip").val();
      var phone = $("#reservation_phone").val();
      var postData = {reservation:
        {amount:total,recipe_id:recipe,stripeToken:token.id,details:details,time:time,date:date,address:address,address2:address2,city:city,state:state,zip:zip,phone:phone}
      };
      console.log('beging ajax');
      console.log(postData);
      $.ajax({
        type: 'POST',
        url: '/reservations',
        data: postData,
        success: function() {
          $("#reservation_plates").val("");
          $("#reservation_date").val("");
          $('#reservation_time').val("");
          $('#reservation_address').val("");
          $('#reservation_address2').val("");
          $("#reservation_city").val("");
          $("#reservation_state").val("");
          $("#reservation_zip").val("");
          $("#reservation_phone").val("");
          alert("reservation Complete! You will receive confirmation email in few minutes.");
          window.location = "/";
        },
        error: function(request, error) {
          console.log(arguments);
          alert("failure");
        }
      });
    }
  });

  $('.confirm').on('click', function(event) {
    // Open Checkout with further options
    event.preventDefault();
    if (!reservation_validations()){
      console.log('Second check');
      return false;
    }
    var total = parseInt($('#reservation_plates').val())*2000;

    handler.open({
      name: 'Cookio',
      description: 'short description',
      amount: total,
      image: '/msb-red.png'
    });
  });
}

$(payAction);
$(document).on('page:load', payAction);
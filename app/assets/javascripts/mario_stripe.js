var field_validation_helper = function(validation_stats){
  for (var stat in validation_stats){
    if (validation_stats[stat] === ''){
      return false;
    }
  }
  return true;
}

var booking_field_validations = function(){
  var booking_validation_stats = {
    job_title: $("#booking_job_title").val(),
    job_description: $("#booking_job_description").val(),
    total: $('#booking_amount').val(),
    startdate: $('#startDate').val(),
    enddate: $('#endDate').val(),
    startT: $("#startTime").val(),
    endT: $("#endTime").val(),
    street: $("#booking_street").val(),
    city: $("#booking_city").val(),
    state: $("#booking_state").val(),
    zip: $("#booking_zip").val(),
    client: $("#booking_client_id").val(),
    talent: $("#booking_talent_id").val(),
  }
  console.log(booking_validation_stats);
  if (booking_validation_stats['total'].length < 5){
    console.log('Please enter a valid amount');
    return false;
  }
  if (!field_validation_helper(booking_validation_stats)){
    console.log('Please enter all fields.');
    return false;
  }
  return true;
}

payAction = function(){
  var handler = StripeCheckout.configure({
    key: 'pk_live_mqKI2e84MReYJDfCz6frxUBh',
    token: function(token) {
      // Use the token to create the charge with a server-side script.
      // You can access the token ID with `token.id`

      var start = $("#startDate").val();
      var start_split = start.split("/");
      var sm = Number(start_split[0]) - 1;
      var sd = Number(start_split[1]);
      var sy = Number(start_split[2]);
      var startDate = new Date(sy,sm,sd);

      var end = $("#endDate").val();
      var end_split = end.split("/");
      var em = Number(end_split[0]) - 1;
      var ed = Number(end_split[1]);
      var ey = Number(end_split[2]);
      var endDate = new Date(ey,em,ed);

      var total = $('#booking_amount').val();
      var job_title = $("#booking_job_title").val();
      var job_description = $("#booking_job_description").val();
      var startD = startDate;
      var endD = endDate;
      var startT = $("#startTime").val();
      var endT = $("#endTime").val();
      var street = $("#booking_street").val();
      var city = $("#booking_city").val();
      var state = $("#booking_state").val();
      var zip = $("#booking_zip").val();
      var client = $("#booking_client_id").val();
      var talent = $("#booking_talent_id").val();
      var postData = {booking:
      {job_title: job_title, job_description: job_description, d_start: startD, d_end: endD, start_time: startT,
        end_time: endT, amount: total, street: street, city: city, state: state,
        zip: zip, client_id: client, talent_id: talent}
      };
      $.ajax({
        type: 'POST',
        url: '/bookings',
        data: postData,
        success: function() {
          $("#booking_job_title").val("");
          $("#booking_job_description").val("");
          $("#booking_d_start").val("");
          $("#booking_d_end").val("");
          $("#booking_start_time").val("");
          $("#booking_end_time").val("");
          $("#booking_amount").val("");
          $("#booking_street").val("");
          $("#booking_city").val("");
          $("#booking_state").val("");
          $("#booking_zip").val("");
          $("#booking_client_id").val("");
          $("#booking_talent_id").val("");
          alert("Booking Complete! You will receive confirmation email in few minutes.");
          window.location.reload(true);
        },
        error: function(request, error) {
          console.log(arguments);
          alert("failure");
        }
      });
    }
  });

  $('#stripePay').on('click', function(event) {
    // Open Checkout with further options
    event.preventDefault();
    if (!booking_field_validations()){
      console.log('Second check');
      return false;
    }
    var total = $('#booking_amount').val() * 100;
    var fee = (total * 0.05) + total;

    handler.open({
      name: 'MyStyleBlox.com',
      description: 'Price includes 5% booking fee',
      amount: fee,
      image: '/msb-red.png'
    });
  });
}

$(document).ready(payAction);
$(document).on('page:load', payAction);


// <a href='https://www.expeditedssl.com/simple-ssl-scanner/scan?target_domain=www.mystyleblox.com' target='_blank'><img src='https://www.expeditedssl.com/ssl-secure-badge.png'  alt='Expedited SSL Scanner'></a>


var ready;
ready = function() {

    $( "#tabs" ).tabs();


};

$(ready);
$(document).on('page:load', ready);

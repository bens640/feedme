var ready;
ready = function() {


  $("#tabs").tabs();


};

$ready(ready);
$(document).on('page:load', ready);

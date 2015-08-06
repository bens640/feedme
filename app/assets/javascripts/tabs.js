
var ready;
ready = function() {

    $(function() {
        $( "#tabs" ).tabs();

    });
};

$(document).ready(ready);
$(document).on('page:load', ready);


var ready;
ready = function() {

    $(function() {
        $( "#tabs" ).tabs();

    });
    $('.card').click(function(){
        $(this).toggleClass('flipped');
    });
};

$(document).ready(ready);
$(document).on('page:load', ready);

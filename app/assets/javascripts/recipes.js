
var ready;
ready = function() {


    $('.card').hover(function(){
        $(this).toggleClass('flipped');
    });
};

$(ready);
$(document).on('page:load', ready);

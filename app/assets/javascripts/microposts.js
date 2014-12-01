function updateCountdown() {

    var $countdown = $('.countdown');

    // 140 is the max message length
    var remaining = 140 - $('#micropost_content').val().length;

    $countdown.text(remaining + ' characters remaining');

    var color = 'grey';
    if (remaining < 21) { color = 'black'; }
    if (remaining < 11) { color = 'red'; }
    $countdown.css( { color: color} );

}

$(document).ready(function($) {
    updateCountdown();
    $micropost_content = $('#micropost_content');

    $micropost_content.change(updateCountdown);
    $micropost_content.keyup(updateCountdown);
    $micropost_content.keydown(updateCountdown);
});

// function updateCountdown() {
//   // 140 is the max message length
//   var remaining = 140 - jQuery('#micropost_content').val().length;
//   jQuery('.countdown').text(remaining + ' characters remaining');
// }

// jQuery(document).ready(function($) {
//   updateCountdown();
//   $('#micropost_content').change(updateCountdown);
//   $('#micropost_content').keyup(updateCountdown);
// });

// http://jberczel.github.io/hartl-solutions-ch10/
// http://stackoverflow.com/questions/10234939/add-a-javascript-display-to-the-home-page-to-count-down-from-140-characters-ra

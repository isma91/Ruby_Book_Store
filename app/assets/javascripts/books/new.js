/*jslint browser: true, node : true*/
/*jslint devel : true*/
/*global $, document, this*/
//$(document).ready(function() {
$(document).on('turbolinks:load', function () {
    /* initialize the materialize select */
    $('select').material_select();
    /* initialize the materialize datepicker with personnal limit date */
    $('.datepicker').pickadate({
        selectMonths: true,
        selectYears: 200
    });
    /* display the name of the book in the resume label */
    $(document).on('keyup', '#name', function(event) {
        event.preventDefault();
        $("#labelResume").html("Resume of " + $.trim($(this).val()));
    });
    /* check if the resume is too long or not, display the number of characters in the resume field */
    $(document).on('keyup', '#resume', function (event) {
        event.preventDefault();
        $('#resumeCount').html($.trim($(this).val()).length);
        if ($.trim($(this).val()).length > 600) {
            $('#resumeError').html('Resume too much long !!(max 600 characters)');
            $('#resumeCount').css('color', '#FF0000');
        } else if ($.trim($(this).val()).length === 0) {
            $('#resumeError').html('');
            $('#resumeCount').css('color', '#FF0000');
        } else {
            $('#resumeError').html('');
            $('#resumeCount').css('color', '#000000');
        }
    });
});
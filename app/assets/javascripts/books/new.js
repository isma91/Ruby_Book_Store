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
    /* kind of book can be a novel or a manga, if it's a manga display new kind */
    $(document).on('change', 'select[name=type]', function(event) {
        event.preventDefault();
        if ($(this).val() === "manga") {
            $('#selectKind').html('<option value="kodomo">Kodomo (For Young Child)</option><option value="shojo">Shojo (For Teenage Girl)</option><option value="shonen">Shonen (For Teen Boy)</option><option value="josei">Josei (For Young Women and Adult)</option><option value="seinen">Seinen (For Young Man and Adult)</option><option value="redisu">Redisu (For Adult Woman)</option><option value="seijin">Seijin (For Adult Man)</option>');
        } else {
            $('#selectKind').html('<option value="action">Action</option><option value="adventure">Adventure</option><option value="detective">Detective</option><option value="drama">Drama</option><option value="erotic">Erotic</option><option value="fantasy">Fantasy</option><option value="horror">Horror</option><option value="humour">Humour</option><option value="legend">Legend</option><option value="mystery">Mystery</option><option value="mythology">Mythology</option><option value="romance">Romance</option><option value="science fiction">Science Fiction</option><option value="western">Western</option>');
        }
        $('select').material_select();
        $('#labelKind').html('Kind Of ' + $(this).val().charAt(0).toUpperCase() + $(this).val().slice(1));
    });
});
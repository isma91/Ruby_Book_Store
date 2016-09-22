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
    $(document).on('change', '#editCoverSwitch', function(event) {
        event.preventDefault();
        if ($(this).is(':checked') === true) {
            $('#editCover').html('<div class="row"><div class="file-field input-field"><div class="btn"><span>File</span><input type="file" accept="image/*" name="cover"></div><div class="file-path-wrapper"><input class="file-path" type="text" id="filePath"></div></div>');
        } else {
            $('#editCover').html('');
        }
    });
});

/*jslint browser: true, node : true*/
/*jslint devel : true*/
/*global $, document, this*/
//$(document).ready(function() {
$(document).on('turbolinks:load', function () {
    /* initialize the materialize tabs */
    $('ul.tabs').tabs();
});
/*jslint browser: true, node : true*/
/*jslint devel : true*/
/*global $, document, this*/
//$(document).ready(function() {
$(document).on('turbolinks:load', function () {
    var loginCount = logoutCount = bookCount = customerCount = orderCount = 0;
    $(document).on('click', '#buttonLogin', function (event) {
        event.preventDefault();
        loginCount++;
        if (loginCount % 2 === 1) {
            $('#buttonLogin').html('Hide Login Logs');
            $('#login').show(500);
            $('#login').css({
                'display' : 'inherit',
                'visibility' : 'visible'
            });
        } else {
            $('#buttonLogin').html('Display Login Logs');
            $('#login').hide(500);
        }
    });
    $(document).on('click', '#buttonLogout', function (event) {
        event.preventDefault();
        logoutCount++;
        if (logoutCount % 2 === 1) {
            $('#buttonLogout').html('Hide Logout Logs');
            $('#logout').show(500);
            $('#logout').css({
                'display' : 'inherit',
                'visibility' : 'visible'
            });
        } else {
            $('#buttonLogout').html('Display Logout Logs');
            $('#logout').hide(500);
        }
    });
    $(document).on('click', '#buttonBook', function (event) {
        event.preventDefault();
        bookCount++;
        if (bookCount % 2 === 1) {
            $('#buttonBook').html('Hide Book Logs');
            $('#book').show(500);
            $('#book').css({
                'display' : 'inherit',
                'visibility' : 'visible'
            });
        } else {
            $('#buttonBook').html('Display Book Logs');
            $('#book').hide(500);
        }
    });
    $(document).on('click', '#buttonCustomer', function (event) {
        event.preventDefault();
        customerCount++;
        if (customerCount % 2 === 1) {
            $('#buttonCustomer').html('Hide Customer Logs');
            $('#customer').show(500);
            $('#customer').css({
                'display' : 'inherit',
                'visibility' : 'visible'
            });
        } else {
            $('#buttonCustomer').html('Display Customer Logs');
            $('#customer').hide(500);
        }
    });
    $(document).on('click', '#buttonOrder', function (event) {
        event.preventDefault();
        orderCount++;
        if (orderCount % 2 === 1) {
            $('#buttonOrder').html('Hide Order Logs');
            $('#order').show(500);
            $('#order').css({
                'display' : 'inherit',
                'visibility' : 'visible'
            });
        } else {
            $('#buttonOrder').html('Display Order Logs');
            $('#order').hide(500);
        }
    });
});
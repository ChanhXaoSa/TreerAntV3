/* 
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/JavaScript.js to edit this template
 */

jQuery(document).ready(function () {
    jQuery("#open-menu").click(function () {
        if (jQuery('#page-container').hasClass('show-menu')) {
            jQuery("#page-container").removeClass('show-menu');
        } else {
            jQuery("#page-container").addClass('show-menu');
        }
    });
});






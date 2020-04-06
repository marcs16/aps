/**
 * Variables
 */
$(document).ready(function(){ 
    $('#signup-button').click(function(event) {
      $('.user_options-forms').removeClass('bounceRight').addClass('bounceLeft');
    });
    $('#login-button').click(function(event) {
      event.preventDefault();
      $('.user_options-forms').removeClass('bounceLeft').addClass('bounceRight');
    });
  });
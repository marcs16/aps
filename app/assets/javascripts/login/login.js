/**
 * Variables
 */
$(document).ready(function(){
  $(".login-psd").click(function(event) {
    event.preventDefault();
    $(this).removeClass("fa fa-eye");
    $(this).addClass("fa fa-eye-slash ");
    var input = $("#user_password");
    if (input.attr("type") == "password") {
    input.attr("type", "text");
  } else {
    input.attr("type", "password");
    $(this).removeClass("fa fa-eye-slash");
    $(this).addClass("fa fa-eye");
  }
});
    $('#signup-button').click(function(event) {
      $('.user_options-forms').removeClass('bounceRight').addClass('bounceLeft');
    });
    $('#login-button').click(function(event) {
      event.preventDefault();
      $('.user_options-forms').removeClass('bounceLeft').addClass('bounceRight');
    });
  });

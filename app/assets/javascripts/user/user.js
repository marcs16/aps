$(document).ready(function() {
	/* For editing password see characters*/
		$(".current-psd").click(function(event) {
			event.preventDefault();
			$(this).removeClass("fa fa-eye");
	  	$(this).addClass("fa fa-eye-slash ");
	  	var input = $("#user_current_password");
	  	if (input.attr("type") == "password") {
	    input.attr("type", "text");
	  } else {
	    input.attr("type", "password");
	    $(this).removeClass("fa fa-eye-slash");
	  	$(this).addClass("fa fa-eye");
	  }
	});

	$(".new-psd").click(function(event) {
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

	$(".confirm-psd").click(function(event) {
			event.preventDefault();
			$(this).removeClass("fa fa-eye");
	  	$(this).addClass("fa fa-eye-slash ");
	  	var input = $("#user_password_confirmation");
	  	if (input.attr("type") == "password") {
	    input.attr("type", "text");
	  } else {
	    input.attr("type", "password");
	    $(this).removeClass("fa fa-eye-slash");
	  	$(this).addClass("fa fa-eye");
	  }
	});
	$('#btn-psdlog').click(function(event) {
		$('.pass-fields').slideToggle("slow");
		event.preventDefault();
	});

  $('#btn-psd').click(function(event) {
		$('.pass-fields').slideToggle("slow");
  	event.preventDefault();
  });

});

$(document).ready(function() {
	/* For editing password see characters*/

  var interval =setInterval(function(){
    var  basic_day = 0;
    var basic_month =0;
    if ( $('#salary_user_id').select2('val') == 1) {
      $('#salary_social_benefits').attr('value', 8.0);
      $('#salary_basic_hour').attr('value',5000);
      basic_day = $('#salary_basic_hour').val()*8
      $('#salary_basic_day').val(basic_day);
      basic_month =basic_day*30;
      $('#salary_basic_month').val(basic_month);
    }else{  $('#salary_social_benefits').attr('value', 8.0);
      $('#salary_basic_hour').attr('value',4000);
      basic_day = $('#salary_basic_hour').val()*8
      $('#salary_basic_day').val(basic_day);
      basic_month =basic_day*30;
      $('#salary_basic_month').val(basic_month);};
    }, 5000);

    var selec= 1;
    $.ajax({
				url: '/salaries/try_salary',
				method: 'GET',
				data: { user_id: selec },

			}).done(function(data) {
				console.log(data);
				}).fail(function(xhr, text, error) {

			}).always(function() {
      });
});

$(document).ready(function() {

    $('#salary_user_id').on('select2:select', function() {
      event.preventDefault();
      /* Act on the event */

    var selec = $('#salary_user_id').select2('val');
    $.ajax({
				url: '/salaries/try_salary',
				method: 'GET',
				data: { user_id: selec },

			}).done(function(data) {
        var datos = data[0];
        $(datos).each(function(key, value) {
          for (let x in value) {
            if(value[x] == null){
              $("#salary_"+x).val(0);
            }else{
              $('#salary_'+x).val(value[x]);
            }
          };
        });
		  }).fail(function(xhr, text, error) {
			}).always(function() {
      });
    });
});

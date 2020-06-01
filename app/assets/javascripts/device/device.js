$(document).ready(function() {
	
  /*For reload datatable*/
  $('#btn-rel').click(function(event) {
  	event.preventDefault();
  	$('#devices-datatable').DataTable.ajax.reload();
  });
 
});
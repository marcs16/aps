function eventCalendar() {
  return $('#calendar').fullCalendar({ 
  	header: {
       left: 'prev,next today',
       center: 'title',
       right: 'month,agendaWeek,agendaDay'
    },
  	events:'/events.json'
  });
};
function clearCalendar() {
  $('#calendar').fullCalendar('delete'); 
  $('#calendar').html('');
};
$(document).on('turbolinks:load', function(){
  eventCalendar();  
});
$(document).on('turbolinks:before-cache', clearCalendar);
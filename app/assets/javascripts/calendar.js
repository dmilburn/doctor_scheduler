$(document).ready(function(){
	$('#calendar').fullCalendar({
		defaultView: 'agendaDay',
		events:  [
			        {
			            title  : 'event1',
			            start  : '2017-06-04'
			        },
			        {
			            title  : 'event2',
			            start  : '2017-06-04',
			            end    : '2017-06-05'
			        },
			        {
			            title  : 'event3',
			            start  : '2017-06-04 12:30:00',
			            end  : '2017-06-04 12:55:00',

			            allDay : false
			        }
				],
	});
})
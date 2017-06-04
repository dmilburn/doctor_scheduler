$(document).ready(function(){
	$('#calendar').fullCalendar({
		defaultView: 'agendaDay',
		events:  function(start, end, timezone, callback){
			$.ajax({
				url: '/appointments',
				data: {
					start: encodeURIComponent(start._d.toDateString()),
				},
				success: function(response){
					var events = response.map(function(appointment){
						return {title: appointment.patient, start: appointment.starts_at, end: appointment.ends_at}
					})
					callback(events);
				}
			})
		},
		allDayDefault: false,
	});
})
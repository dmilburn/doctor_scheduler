$(document).ready(function(){
	$('#calendar.all-doctors').fullCalendar({
		defaultView: 'agendaDay',
		events:  function(start, end, timezone, callback){
			$.ajax({
				url: '/appointments',
				data: {
					date: encodeURIComponent(start._d.toJSON()),
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

	$('#calendar.one-doctor').fullCalendar({
		defaultView: 'agendaDay',
		events:  function(start, end, timezone, callback){
			$.ajax({
				url: $(location).attr('pathname') + '/appointments',
				data: {
					date: encodeURIComponent(start._d.toJSON()),
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
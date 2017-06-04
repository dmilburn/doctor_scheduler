$(document).ready(function(){

	var calendarOptions = {
		defaultView: 'agendaDay',
		allDayDefault: false,
	}

	var allDoctorsCalendarOptions = calendarOptions
	allDoctorsCalendarOptions.events = eventsFetcher('/appointments');

	function eventsFetcher(url) {
		return function(start, end, timezone, callback){
			$.ajax({
				url: url,
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
		}
	};

	$('#calendar.all-doctors').fullCalendar(allDoctorsCalendarOptions);

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
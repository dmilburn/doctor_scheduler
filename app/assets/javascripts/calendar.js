function CalendarOptions(url) {
	this.defaultView = 'agendaDay'
	this.allDayDefault = false
	this.events = this.eventsFetcher(url)
}

CalendarOptions.prototype.eventsFetcher = function(url) {
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

$(document).ready(function(){

	$('#calendar.all-doctors').fullCalendar(new CalendarOptions('/appointments'));

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
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
					return {title: appointment.doctor.name + ": " + appointment.patient, start: appointment.starts_at, end: appointment.ends_at}
				})
				callback(events);
			}
		})
	}
};

$(document).ready(function(){

	$('#calendar.all-doctors').fullCalendar(new CalendarOptions('/appointments'));

	$('#calendar.one-doctor').fullCalendar(new CalendarOptions($(location).attr('pathname') + '/appointments'));

	$('#new_appointment').on('submit', function(event){
		event.preventDefault();
		$('#appointment-errors').empty();
		$.ajax({
			url: $(this).attr('action'),
			method: $(this).attr('method'),
			data: $(this).serialize(),
			success: function(response){
				$('#calendar.one-doctor').fullCalendar('refetchEvents');
				$(this).trigger("reset");
			}.bind(this),
			error: function(errors){
				$('#appointment-errors').append(errors.responseJSON.join('|'));
			}
		})
	})
})
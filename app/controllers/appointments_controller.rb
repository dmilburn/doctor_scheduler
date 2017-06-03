class AppointmentsController < ApplicationController
  def index
    date = Date.today
    starts_at = date.to_datetime
    ends_at = starts_at + 1
    render json: Appointment.during(starts_at, ends_at)
  end
end

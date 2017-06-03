class AppointmentsController < ApplicationController
  include TimeControllerConcern

  def index
    starts_at, ends_at = start_and_end_of_date(params[:date])
    render json: Appointment.during(starts_at, ends_at)
  end
end

class AppointmentsController < ApplicationController
  include TimeControllerConcern

  def index
    starts_at, ends_at = start_and_end_of_date(params[:date])
    render json: Appointment.during(starts_at, ends_at)
  end

  def create
    appointment = Appointment.new(appointment_params)
    if appointment.save
      render json: appointment
    else
      render json: appointment.errors.full_messages, status: 500
    end
  end

  private

  def appointment_params
    params.require(:appointment).permit(:doctor_id, :patient, :starts_at, :ends_at)
  end
end

class AppointmentsController < ApplicationController

  def index
    date = if params[:date]
      params[:date]
    else
      Date.today
    end
    starts_at = date.to_datetime
    ends_at = starts_at + 1
    if params[:doctor_id]
      doctor = Doctor.find_by(id: params[:doctor_id])
      render json: doctor.appointments.during(starts_at, ends_at), :include => {:doctor => {:only => :name}}
    else
      render json: Appointment.during(starts_at, ends_at), :include => {:doctor => {:only => :name}}
    end
  end

  def create
    doctor = Doctor.find_by(id: params[:doctor_id])
    appointment = doctor.appointments.new(appointment_params)
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

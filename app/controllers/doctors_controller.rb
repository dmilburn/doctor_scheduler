class DoctorsController < ApplicationController
  def show
    @appointment = Appointment.new
    @doctor = Doctor.find_by(id: params[:id])
  end
end

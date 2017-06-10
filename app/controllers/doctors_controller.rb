class DoctorsController < ApplicationController
  before_action :load_doctors

  def show
    @appointment = Appointment.new
    @doctor = Doctor.find_by(id: params[:id])
  end

  private
  def load_doctors
    @doctors = Doctor.all
  end
end

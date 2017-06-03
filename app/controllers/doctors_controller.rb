class DoctorsController < ApplicationController
  include TimeControllerConcern

  def show
    doctor = Doctor.find_by(id: params[:id])
    starts_at, ends_at = start_and_end_of_date(params[:date])
    render json: doctor.appointments.during(starts_at, ends_at)
  end
end

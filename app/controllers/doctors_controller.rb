class DoctorsController < ApplicationController
  def show
    doctor = Doctor.find_by(id: params[:id])
    date = if params[:date]
      params[:date]
    else
      Date.today
    end
    starts_at = date.to_datetime
    ends_at = starts_at + 1
    render json: doctor.appointments.during(starts_at, ends_at)
  end
end

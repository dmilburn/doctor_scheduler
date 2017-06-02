class Appointment < ActiveRecord::Base
  validates :patient, :doctor, :starts_at, :ends_at, presence: true
  belongs_to :doctor
end

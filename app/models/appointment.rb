class Appointment < ActiveRecord::Base
  validates :patient, :doctor, :starts_at, :ends_at, presence: true
  belongs_to :doctor
  validate :starts_at_after_ends_at, if: Proc.new { |appointment| appointment.ends_at && appointment.starts_at }
  validate :no_conflicting_appointments, if: Proc.new { |appointment| appointment.doctor }

  def starts_at_after_ends_at
    errors.add(:ends_at, "can't be before starts at") if ends_at < starts_at
  end

end

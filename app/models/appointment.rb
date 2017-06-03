class Appointment < ActiveRecord::Base
  validates :patient, :doctor, :starts_at, :ends_at, presence: true
  belongs_to :doctor
  validate :starts_at_after_ends_at, if: Proc.new { |appointment| appointment.ends_at && appointment.starts_at }
  validate :no_conflicting_appointments, if: Proc.new { |appointment| appointment.doctor }

  def starts_at_after_ends_at
    errors.add(:ends_at, "can't be before starts at") if ends_at < starts_at
  end

  def no_conflicting_appointments
    errors.add(:base, "#{self.doctor.name} already has an appointment at that time") if Appointment.where("starts_at <= :ends_at and ends_at >= :starts_at and doctor_id = :doctor_id",{:ends_at => ends_at, :starts_at => starts_at,:doctor_id=>doctor_id})
  end

end

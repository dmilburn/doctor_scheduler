class Appointment < ActiveRecord::Base
  validates :patient, :doctor, :starts_at, :ends_at, presence: true
  belongs_to :doctor
  validate :starts_at_after_ends_at, if: Proc.new { |appointment| appointment.ends_at && appointment.starts_at }
  validate :no_conflicting_appointments, if: Proc.new { |appointment| appointment.doctor }
  scope :during, ->(starts_at, ends_at) { where("starts_at <= :ends_at and ends_at >= :starts_at",{:ends_at => ends_at, :starts_at => starts_at}) }

  def starts_at_after_ends_at
    errors.add(:ends_at, "can't be before starts at") if ends_at < starts_at
  end

  def no_conflicting_appointments
    errors.add(:base, "#{self.doctor.name} already has an appointment during that time") if doctor.appointments.during(starts_at, ends_at).any?
  end

end

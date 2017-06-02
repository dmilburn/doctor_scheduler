class Doctor < ActiveRecord::Base
  validates :name, presence: true, uniqueness: true
  has_many :appointments
end

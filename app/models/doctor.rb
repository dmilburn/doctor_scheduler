class Doctor < ActiveRecord::Base
  validates :name, presence: true, uniqueness: true
end

10.times do
  doctor = Doctor.create(name: "Dr. #{Faker::LordOfTheRings.character}")
end

Doctor.first.appointments.create(starts_at: "2017-06-02 23:59:43 -0400", ends_at: "2017-06-03 00:01:43 -0400", patient: Faker::HarryPotter.character)

Doctor.second.appointments.create(starts_at: "2017-06-03 00:00:43 -0400", ends_at: "2017-06-03 00:29:43 -0400", patient: Faker::HarryPotter.character)

Doctor.second.appointments.create(starts_at: "2017-06-03 00:30:43 -0400", ends_at: "2017-06-03 01:00:43 -0400", patient: Faker::HarryPotter.character)

Doctor.second.appointments.create(starts_at: "2017-06-03 23:30:43 -0400", ends_at: "2017-06-03 23:59:43 -0400", patient: Faker::HarryPotter.character)

Doctor.third.appointments.create(starts_at: "2017-06-03 23:30:43 -0400", ends_at: "2017-06-04 00:01:43 -0400", patient: Faker::HarryPotter.character)

Doctor.fourth.appointments.create(starts_at: "2017-06-02 23:59:43 -0400", ends_at: "2017-06-04 00:01:43 -0400", patient: Faker::HarryPotter.character)

# 1 6/2 11:59PM- 6/3 12:01 AM
# 2 6/3 12:00 AM - 6/3 12:30 AM
# 2 6/3 12:30 AM - 6/3 1:00 AM
# 2 6/3 11:30 PM - 6/3 11:59 PM 
# 3 6/3 11:30 PM - 6/4 12:01 AM
# 4 6/2 11:59 PM - 6/4 12:01 AM

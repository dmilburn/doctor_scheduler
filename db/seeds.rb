10.times do
  doctor = Doctor.create(name: "Dr. #{Faker::LordOfTheRings.character}")
end

Doctor.first.appointments.create(starts_at: "2017-06-02 23:59:43 -0400", ends_at: "2017-06-03 00:01:43 -0400", patient: Faker::HarryPotter.character)

Doctor.second.appointments.create(starts_at: "2017-06-03 00:00:43 -0400", ends_at: "2017-06-03 00:29:43 -0400", patient: Faker::HarryPotter.character)

Doctor.second.appointments.create(starts_at: "2017-06-03 00:30:43 -0400", ends_at: "2017-06-03 01:00:43 -0400", patient: Faker::HarryPotter.character)

Doctor.second.appointments.create(starts_at: "2017-06-03 23:30:43 -0400", ends_at: "2017-06-03 23:59:43 -0400", patient: Faker::HarryPotter.character)

Doctor.third.appointments.create(starts_at: "2017-06-03 23:30:43 -0400", ends_at: "2017-06-04 00:01:43 -0400", patient: Faker::HarryPotter.character)

Doctor.fourth.appointments.create(starts_at: "2017-06-02 23:59:43 -0400", ends_at: "2017-06-04 00:01:43 -0400", patient: Faker::HarryPotter.character)

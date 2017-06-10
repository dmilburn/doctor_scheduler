10.times do
  doctor = Doctor.create(name: "Dr. #{Faker::LordOfTheRings.character}")
end

Doctor.first.appointments.create(starts_at: "2017-06-11 23:59:43.000000", ends_at: "2017-06-12 00:01:43.000000", patient: Faker::HarryPotter.character)

Doctor.second.appointments.create(starts_at: "2017-06-12 00:00:43.000000", ends_at: "2017-06-12 00:29:43.000000", patient: Faker::HarryPotter.character)

Doctor.second.appointments.create(starts_at: "2017-06-12 00:30:43.000000", ends_at: "2017-06-12 01:00:43.000000", patient: Faker::HarryPotter.character)

Doctor.second.appointments.create(starts_at: "2017-06-12 23:30:43.000000", ends_at: "2017-06-12 23:59:43.000000", patient: Faker::HarryPotter.character)

Doctor.third.appointments.create(starts_at: "2017-06-12 23:30:43.000000", ends_at: "2017-06-13 00:01:43.000000", patient: Faker::HarryPotter.character)

Doctor.fourth.appointments.create(starts_at: "2017-06-11 23:00:43.000000", ends_at: "2017-06-13 00:01:43.000000", patient: Faker::HarryPotter.character)

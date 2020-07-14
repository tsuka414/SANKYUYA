# coding: utf-8

User.create!(name: "Sample User",
             email: "sample@email.com",
             staff_number: "398",
             password: "password",
             password_confirmation: "password",
             admin: true)

10.times do |n|
  name  = Faker::Name.name
  email = "sample#{n+1}@email.com"
  staff_number = "#{n+1}"
  password = "password"
  User.create!(name: name,
               email: email,
               staff_number: staff_number,
               password: password,
               password_confirmation: password)
end
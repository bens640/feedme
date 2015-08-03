require 'faker'
require 'bcrypt'

FactoryGirl.define do
  factory :chef do
    first_name {Faker::Name.first_name}
    last_name {Faker::Name.last_name}
    email {Faker::Internet.email}
    address '123 main st'
    address2 'apt 123'
    city  'miami'
    state  'FL'
    zip  '33132'
    phone  '555-555-5555'
    password_digest {BCrypt::Password.create(123)}
    id 1
  end
  factory :many_chefs do
    10.times do |i|
      first_name {Faker::Name.first_name}
      last_name {Faker::Name.last_name}
      email "10#{i}@email.com"
      address '123 main st'
      address2 'apt 123'
      city  'miami'
      state  'FL'
      zip  '33132'
      phone  '555-555-5555'
      password_digest {BCrypt::Password.create(i)}
      id {i}
    end
  end
end


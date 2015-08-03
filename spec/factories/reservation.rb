FactoryGirl.define do
  factory :reservation do
    chef_id 1
    user_id 1
    details "this is reservation long details"
    address '123 main st'
    address2 'apt 123'
    city  'miami'
    state  'FL'
    zip  '33132'
    phone  '555-555-5555'
    time '11:00pm'
    date Faker::Date.forward(1)
  end
end
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
# require 'bcrypt'

num_users = 100
reservations = 25
def get_diet
  diet = []
  r = rand(100)
  if r < 25
    2.times do
      diet << ['Kosher', 'Halal', 'Hindu','Buddhist', 'Vegetarian','Vegans', 'Diabetic', 'Organic', 'Gluten Free','Diary Free'].sample
    end
  end
  diet
end
def get_allergies
  allergies = []
  r = rand(100)
  if r < 10
    2.times do
      allergies << ['peanuts', 'tree nuts', 'fish', 'shellfish', 'milk', 'eggs', 'soy','wheat'].sample
    end
  end
  allergies
end
def get_zip
  [33101,33102,33107,33109,33110,33111,33112,33114,33116,33119,33121,33122,33124,33124].sample.to_s
end
def get_date
  year = 2015
  month = rand(2)+9
  if [4,6,9,11].include?(month)
    days = 30
  elsif month == 2
    days = 28
  else
    days = 31
  end
  day = rand(days)
  Date.new(year, month, day)
end
def get_time
  t = [7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22].sample
  if t > 12
    part = 'pm'
    t -= 12

  else
    part = 'am'
  end
  t = t.to_s
  t + ':00' + part
end
(1..num_users).each do |n|
  u = User.create(first_name:Faker::Name.first_name,
                  last_name:Faker::Name.last_name,
                  email:"#{n}@email.com",
                  address: Faker::Address.street_address,
                  address2: Faker::Address.secondary_address,
                  city: 'Miami',
                  state: 'FL',
                  zip: get_zip,
                  allergies: get_allergies,
                  diet_restrictions: get_diet,
                  password_digest:BCrypt::Password.create(n))
  c = Chef.create(first_name:Faker::Name.first_name,
                  last_name:Faker::Name.last_name,
                  email:"#{n}@email.com",
                  address: Faker::Address.street_address,
                  address2: Faker::Address.secondary_address,
                  city: 'Miami',
                  state: 'FL',
                  zip: get_zip,
                  password_digest:BCrypt::Password.create(n))
end
(1..reservations).each do |n|
  r = Reservation.create(user_id:rand(num_users)+1,
                         details:Faker::Lorem.sentence,
                         date:get_date,
                         time:get_time)
end
#   if (1..50) === n
#     v = u.venues.create(name:Faker::Company.name,
#                         info:Faker::Company.bs,
#                         address:Faker::Address.street_address,
#                         city:Faker::Address.city,
#                         state:Faker::Address.state,
#                         zip:Faker::Address.zip,
#                         country:"United States")
#     20.times do
#       e = u.events.create(venue_id:v.id,
#                           name:Faker::Commerce.product_name,
#                           description:Faker::Lorem.sentence(50),
#                           created_at:Faker::Time.between(DateTime.now - 2, DateTime.now - 1))
#       tempevents << e.id
#       at = Attendance.where(user_id:u.id).where(event_id:e.id).take
#       at.admin = true
#       at.save
#       attendances << [e.id,u.id]
#     end
#   end
# end
#
# 10000.times do
#   e = tempevents.sample
#   u = tempusers.sample
#   unless attendances.include?([e,u])
#     Attendance.create(event_id:e,user_id:u)
#     attendances << [e,u]
#   else
#     redo
#   end
# end

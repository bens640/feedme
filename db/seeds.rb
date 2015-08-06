# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
# require 'bcrypt'
include ActionView::Helpers
require './db/zip_city'
num_users = 100
num_reservations = 30
reservation_factor = num_users/num_reservations
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
  day = rand(days)+1
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
def secondary_address(n)
  if (n % 3 == 0)
    Faker::Address.secondary_address
  else
    ""
  end
end
def get_phone(n)
  number_to_phone(5551000000+n, area_code: true)
end
User.create(first_name: 'admin',
            last_name: 'admin',
            email:"admin@admin.com",
            password_digest: BCrypt::Password.create('admin'))
reservations = 1
(1..num_users).each do |n|
  zipCity = zip_city
  a = Faker::Address.street_address
  a2 = secondary_address(n)
  city = zipCity[1]
  zip = zipCity[0]
  phone = get_phone(n)
  u = User.create(first_name:Faker::Name.first_name,
                  last_name:Faker::Name.last_name,
                  email:"#{n}@email.com",
                  address: a,
                  address2: a2,
                  city: city,
                  state: 'FL',
                  zip: zip,
                  allergies: get_allergies,
                  diet_restrictions: get_diet,
                  phone: phone,
                  password_digest:BCrypt::Password.create(n))
  zipCity = zip_city
  c = Chef.create(first_name:Faker::Name.first_name,
                  last_name:Faker::Name.last_name,
                  email:"#{n}@email.com",
                  address: Faker::Address.street_address,
                  address2: secondary_address(n+1),
                  city: zipCity[1],
                  state: 'FL',
                  zip: zipCity[0].to_s,
                  phone: get_phone(n+1000),
                  active?: true,
                  password_digest:BCrypt::Password.create(n))
  if n % reservation_factor == 0
    reservations += 1
    r = Reservation.create(user_id:u.id,
                         recipe_id:rand(10)+1,
                         details:Faker::Lorem.sentence,
                         date:get_date,
                         time:get_time,
                         address:a,
                         address2:a2,
                         city:city,
                         state:'FL',
                         zip:zip,
                         phone:phone)
    if reservations % 2 == 0
      num_m = rand(4)
      r.chef_id = c.id
      r.save
      num_m.times do |i|
        if i % 2 == 0
          m = Message.create(chef_id:c.id,
                             reservation_id:r.id,
                             subject:Faker::Lorem.sentence,
                             message:Faker::Hacker.say_something_smart)
        else
          m = Message.create(user_id:u.id,
                             reservation_id:r.id,
                             subject:Faker::Lorem.sentence,
                             message:Faker::Hacker.say_something_smart)
        end
      end
    end
  end
end
10.times do
  Recipe.create(title:Faker::Lorem.sentence,
                ingredients:Faker::Lorem.words(8),
                recipe:Faker::Lorem.sentence(25))
end

FactoryGirl.define do
  factory :user do
    email 'sean@cookio.com'
    first_name 'sean'
    last_name 'hendricks'
    city 'blah'
    state 'blah'
    zip '33176'
    phone '555-555-5555'
    password 'secret1'
    password_confirmation 'secret1'
    id 1
  end
end

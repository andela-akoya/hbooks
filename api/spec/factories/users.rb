FactoryGirl.define do
  factory :user do
    lastname { Faker::Name.last_name }
    firstname { Faker::Name.first_name }
    username { Faker::Internet.user_name }
    email { Faker::Internet.free_email }
    password { Faker::Internet.password }
  end
end

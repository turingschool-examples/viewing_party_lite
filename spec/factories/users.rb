require 'faker'

FactoryBot.define do
  factory :user do
    first_name { Faker::Name.first_name }
    last_name { Faker::Name.last_name }
    email {"#{first_name}.#{last_name}@fakewebdomain.fake" }
    password { "test123" }
    password_confirmation { "test123" }
  end
end
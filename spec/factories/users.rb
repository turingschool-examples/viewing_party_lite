require 'faker'

FactoryBot.define do
  factory :user do
    name { Faker::Name.name }
    email { Faker::Internet.email  }
    password_digest { BCrypt::Password.create('bananaBro') } #need to modify this line stopped here , cost: 4
  end
end
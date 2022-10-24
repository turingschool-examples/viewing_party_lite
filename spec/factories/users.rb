require 'faker'

FactoryBot.define do
  factory :user do
    name { Faker::Name.name }
    email { Faker::Internet.email  }
    password { BCrypt::Password.create('bananaBro')  }
  end
end
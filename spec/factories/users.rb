# frozen_string_literal: true

FactoryBot.define do
  password = Faker::Internet.password

  factory :user do
    name { Faker::Fantasy::Tolkien.unique.character }
    email { Faker::Internet.unique.email }
    password { password }
    password_confirmation { password }
  end
end

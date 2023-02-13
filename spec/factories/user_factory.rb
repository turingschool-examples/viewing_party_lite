# frozen_string_literal: true

FactoryBot.define do
  factory :user do
    name { Faker::Movies::HarryPotter.character }
    email { Faker::Internet.email + Faker::Number.number(digits: 2).to_s }
    password {Faker::Alphanumeric.alphanumeric(number: 10, min_alpha: 3, min_numeric: 3)}
  end
end

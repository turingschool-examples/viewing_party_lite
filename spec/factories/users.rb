# frozen_string_literal: true

FactoryBot.define do
  factory :user do
    name { Faker::Fantasy::Tolkien.unique.character }
    email { Faker::Internet.unique.email }
  end
end

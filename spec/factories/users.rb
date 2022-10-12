# frozen_string_literal: true

require 'faker'

FactoryBot.define do
  factory :user do
    user_name { Faker::Internet.username }
    email { Faker::Internet.email }
    password_digest { Faker::Internet.password }
  end
end

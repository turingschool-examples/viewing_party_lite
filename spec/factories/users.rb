# frozen_string_literal: true

FactoryBot.define do
  factory :user do
    name { Faker::Movies::StarWars.character }
    # this seems slow. Might be worth changing if it's a problem down the line
    email do
      Faker::Internet.email(name: name, separators: '_')
    end
  end
end

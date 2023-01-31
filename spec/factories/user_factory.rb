FactoryBot.define do
  factory :user do
    name { Faker::Movies::HarryPotter.character }
    email { Faker::Internet.email + Faker::String.random(length: 5) }
  end
end
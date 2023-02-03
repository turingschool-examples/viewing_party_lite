FactoryBot.define do
  factory :user do
    name { Faker::Movies::HarryPotter.character }
    email { Faker::Internet.email + Faker::Number.number(digits: 2).to_s }
  end
end
FactoryBot.define do
  factory :user do
    name { Faker::Name.name }
    random_email = Faker::Number.number(digits: 3).to_s + Faker::Internet.email
    email { random_email }
  end
end

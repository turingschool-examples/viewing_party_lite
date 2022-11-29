FactoryBot.define do 
  factory :user do 
    name { Faker::Movies::StarWars.character }
    email { Faker::Internet.email }
  end
end
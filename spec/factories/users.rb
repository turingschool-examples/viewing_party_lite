FactoryBot.define do
  factory :user do
    name { Faker::Movies::StarWars.character }
    email { Faker::Internet.email(name: name, separators: '_') } # this seems slow. Might be worth changing if it's a problem down the line
  end
end

FactoryBot.define do
  factory :cast do
    name { Faker::Name.name }
    character { Faker::Movies::StarWars.character }

    initialize_with { new(**attributes) }
  end
end

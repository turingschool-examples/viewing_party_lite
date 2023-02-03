FactoryBot.define do
  factory :review do
    author { Faker::Movies::StarWars.character }
    content { Faker::Movies::StarWars.quote }

    initialize_with { new(**attributes) }
  end
end

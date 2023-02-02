FactoryBot.define do
  factory :movie do
    id { 13 }
    original_title { Faker::Movie.title }
    vote_average { Faker::Number.between(from: 5.0, to: 15.0) }
    runtime { Faker::Number.between(from: 60, to: 180) }
    genre { Faker::Book.genre }
    summary { Faker::String.random(length: 500) }

    initialize_with { new(attributes) }
  end
end

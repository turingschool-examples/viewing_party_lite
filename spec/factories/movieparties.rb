FactoryBot.define do 
  factory :movie_party do 
    movie_title { Faker::Movie.unique.title }
    duration { Faker::Number.between(from: 60, to: 200)}
    start_time { Faker::Time.between(from: DateTime.now - 100, to: DateTime.now) }
    movie_id { 238 }
  end
end
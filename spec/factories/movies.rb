FactoryBot.define do
  factory :movie do
    event_date { Faker::Date.between(from: 1.year.ago, to: Date.today) }
    start_time { Faker::Time.between(from: DateTime.now + 1, to: DateTime.now + 180, format: :long) }
    duration { rand(1..200) }
    movie_id { rand(1..20) }
    title { Faker::Movie.title }
    run_time { rand(1..200) }
    image_url { Faker::Internet.url }
  end
end

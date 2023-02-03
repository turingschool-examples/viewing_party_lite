FactoryBot.define do
  factory :viewing_party do
    host { create(:user) }
    movie_api_id { rand(60..250) }
    start_time { Time.now + 2.hours}
    duration { rand(60..250) }
    date { Date.today + 2.days }
  end
end

FactoryBot.define do
  factory :viewing_party do
    duration { "180" }
    date { "2023-01-30 19:47:54" }
    start_time { "2023-01-30 19:47:54" }
    movie_id { 14 }
    host { create(:user) }
  end
end

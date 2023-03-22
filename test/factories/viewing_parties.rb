FactoryBot.define do
  factory :viewing_party do
    duration { "2:00:00" }
    party_date {Time.now }
    party_time {Time.now.strftime("%I:%M:%S")}
    movie_id { 1 }
  end
end

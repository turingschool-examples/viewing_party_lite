FactoryBot.define do
  factory :viewing_party do
    host { create(:user) }
    # movie_api_id { create(:movie).id }
    duration { rand(60..250) }
    date { Date.today + 2.days }
  end
end

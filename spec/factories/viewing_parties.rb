FactoryBot.define do
  factory :viewing_party do
    host { create(:user) }
    movie { Faker::Movie.title }
    duration { rand(60..250) }
    date { Date.today + 2.days }
  end
end

require 'faker'

FactoryBot.define do
  factory :user, class: User do
    name { Faker::Games::Pokemon.name }
    email { Faker::Internet.email }
  end

  factory :viewing_party, class: ViewingParty do
    movie_title { Faker::Movie.title }
    movie_id { Faker::Number.between(from: 200, to: 240) }
    duration { Faker::Number.between(from: 20, to: 210) }
    date { Faker::Time.forward(days: 365, period: :evening, format: :long) }
  end

  factory :user_party, class: UserParty do
    association :user, factory: :user
    association :viewing_party, factory: :viewing_party
  end
end

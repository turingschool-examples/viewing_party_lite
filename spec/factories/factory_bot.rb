# frozen_string_literal: true

FactoryBot.define do
  factory :user, class: 'User' do
    name { Faker::Name.name }
    email { Faker::Internet.email }
  end

  factory :view_party, class: 'ViewParty' do
    movie_name { Faker::Movie.title }
    movie_id { Faker::Number.within(range: 1..100) }
    duration { Faker::Number.within(range: 90..150) }
    datetime { Faker::Time.between(from: DateTime.now, to: DateTime.now + 20) }
  end

  factory :user_view_party, class: 'UserViewParty' do
    host { Faker::Boolean.boolean(true_ratio: 0.3) }
    association :user, factory: :user
    association :view_party, factory: :view_party
  end
end

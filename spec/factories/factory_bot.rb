# frozen_string_literal: true

FactoryBot.define do
  factory :user, class: User do
    name { Faker::Name.name }
    email { Faker::Internet.safe_email }
  end

  factory :viewing_party, class: ViewingParty do
    duration { Faker::Number.within(range: 90..180) }
    date { Faker::Date.in_date_period }
    time { Faker::Time.forward(days: 23, period: :morning) }
    host_id { Faker::Number.number(digits: 5) }
  end

  factory :viewing_party_users, class: ViewingPartyUser do
    association :user, factory: :user
    association :viewing_party, factory: :viewing_party
  end
end

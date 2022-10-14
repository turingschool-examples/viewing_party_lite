require 'faker'
FactoryBot.define do
    factory :user do
        name { Faker::Name.name }
        email { Faker::Internet.email }
    end

    factory :viewing_party do
        duration { 240 }
        date { Faker::Date.forward(days: 30) }
        start_time { Faker::Time.forward(days: 1, period: :evening) }
        movie_id { rand(1000..2000) }
        host_id { create(:user).id }
    end

    factory :viewing_party_invitee do
        user
        viewing_party
    end
end
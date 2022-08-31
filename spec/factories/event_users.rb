FactoryBot.define do
  factory :event_user do
    user_id { rand(1..20) }
    movie_id { rand(1..15) }
    role { rand(0..1) }
  end
end

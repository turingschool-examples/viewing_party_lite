FactoryBot.define do
  factory :user_viewing_party do
    host {Faker::Boolean.boolean(ratio: 0.5)}
    user
    viewing_party
  end
end

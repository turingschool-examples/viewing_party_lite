FactoryBot.define do
  factory :user_viewing_party do
    host {Faker::Boolean.boolean}
    user
    viewing_party
  end
end

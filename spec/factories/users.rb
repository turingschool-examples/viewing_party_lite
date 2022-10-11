FactoryBot.define do
  factory :random_user, class: User do
    name        {Faker::Name.name}
    email       {Faker::Internet.email}
  end
end
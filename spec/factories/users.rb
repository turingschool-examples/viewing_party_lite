FactoryBot.define do
  factory :random_item, class: Item do
    name        {Faker::Name.name}
    email       {Faker::Internet.email}
  end
end
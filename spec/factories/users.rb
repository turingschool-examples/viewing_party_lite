FactoryBot.define do
  factory :user do
    name { Faker::Name.first_name }
    email { Faker::Internet.unique.email(name: "#{name}") }
    password { 'password' }
    password_confirmation { 'password' }
  end
end

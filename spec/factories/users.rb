FactoryBot.define do
  factory :user do
    name { Faker::Internet.unique.username }
    email { Faker::Internet.unique.free_email }
    password { 'password' }
    password_confirmation { 'password' }
  end
end

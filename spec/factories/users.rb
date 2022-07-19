FactoryBot.define do
  factory :user do
    user_name { Faker::Name.name }
    email { Faker::Internet.email }
    password_digest { 'test123' }
    # password { 'test123' }
    # password_confirmation { 'test123' }

  end
end

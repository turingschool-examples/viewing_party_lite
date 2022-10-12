require 'faker'
valid_status = [:host, :invited, :accepted, :declined]

FactoryBot.define do
  factory :user_party do
    user_status { valid_status.sample }
    user
    party
  end
end 
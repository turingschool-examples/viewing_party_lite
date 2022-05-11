class Person < ApplicationRecord
  has_many :party_people
  has_many :parties, through: :party_people

  validates_presence_of(:name)
  validates_presence_of(:email)
end

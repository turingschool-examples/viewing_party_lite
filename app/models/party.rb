class Party < ApplicationRecord
  belongs_to :movie
  has_many :party_users
  has_many :users, through: :party_users
end

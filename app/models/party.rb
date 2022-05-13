class Party < ApplicationRecord
  has_many :user_parties
  has_many :users, through: :user_parties

  validates_presence_of :host_id
  validates_presence_of :date
  validates_presence_of :duration
end

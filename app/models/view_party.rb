class ViewParty < ApplicationRecord
  has_many :user_view_parties
  has_many :users, through: :user_view_parties
  validates_presence_of :date
  validates_presence_of :duration
end
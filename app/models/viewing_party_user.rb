class ViewingParty < ApplicationRecord

  validates_presence_of :title
  validates_presence_of :date
  validates_presence_of :duration

  belongs_to :user
  has_many :users, through: :viewing_party_users

end

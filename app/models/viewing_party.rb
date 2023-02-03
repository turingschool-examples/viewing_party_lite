class ViewingParty < ApplicationRecord
  has_many :viewing_party_users, dependent: :destroy
  has_many :users, through: :viewing_party_users
  belongs_to :movie
  
  validates :duration, presence: true
  validates :party_date, presence: true
  validates :host_id, presence: true
end
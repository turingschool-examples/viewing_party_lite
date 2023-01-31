class ViewingParty < ApplicationRecord
  belongs_to :movie
  has_many :user_viewing_parties
  has_many :users, through: :user_viewing_parties

  validates_numericality_of :duration, :host
  validates_presence_of :when
end

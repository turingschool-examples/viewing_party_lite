class ViewingParty < ApplicationRecord
  has_many :invitees
  has_many :users, through: :invitees

  validates_presence_of :duration, :when, :start_time
end

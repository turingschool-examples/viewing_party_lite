class ViewingParty < ApplicationRecord
  has_many :user_viewing_parties
  validates_presence_of :duration,
                        :date,
                        :movie_id
end

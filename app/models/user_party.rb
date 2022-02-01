class UserParty < ApplicationRecord
  belongs_to :user
  belongs_to :party

  def user_party_movie
    party.movie
  end
end

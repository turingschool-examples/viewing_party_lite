class ViewingParty < ApplicationRecord
  has_many :viewing_party_users
  has_many :users, through: :viewing_party_users

  # def movie_id_by_title(title)
  #
  # end
end

class Party < ApplicationRecord
  has_many :user_parties
  has_many :users, through: :user_parties

  validates_presence_of :duration, :start_time

  def movie
    MovieFacade.find_movie(self.movie_id)
  end

  def host_of(party)
    userparty = UserParty.where(party_id: party.id, is_host: true).first
    User.where(id: userparty.user_id)[0].name
  end

  
end

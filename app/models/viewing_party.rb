class ViewingParty < ApplicationRecord
  has_many :user_viewing_parties
  has_many :users, through: :user_viewing_parties
  
  def movie_info
    details = MovieFacade.details_results(movie_id)
    
    { title: details[:title], poster: details[:poster_path] }
  end

  def invitees
    users.where("user_viewing_parties.status = 'Invited'")
  end

  def host
    users.where("user_viewing_parties.status = 'Hosting'").first
  end
end

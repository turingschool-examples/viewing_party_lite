class User < ApplicationRecord
  validates_presence_of :email
  validates_uniqueness_of :email
  validates_format_of :email, with: URI::MailTo::EMAIL_REGEXP
  validates_presence_of :name
  
  has_many :user_parties
  has_many :parties, through: :user_parties

  def movie_cards_info
    parties_info = {}
    parties.each do |party|
      parties_info[party.movie_id] = [MovieFacade.movie_image(party.movie_id), MovieFacade.movie_title(party.movie_id)]
    end
    parties_info
  end
end
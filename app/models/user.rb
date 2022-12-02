class User < ApplicationRecord
  validates_presence_of :email
  validates_uniqueness_of :email
  validates_format_of :email, with: URI::MailTo::EMAIL_REGEXP
  validates_presence_of :name
  
  has_many :user_parties
  has_many :parties, through: :user_parties

  def movie_cards_info
    cards = {}
    parties.each do |party|
      cards[party.id] = MovieFacade.movie_card(party.movie_id)
    end
    cards
  end
end
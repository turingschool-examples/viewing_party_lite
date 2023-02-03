class ViewingParty < ApplicationRecord
  belongs_to :host, :class_name => "User" 
  has_many :viewing_party_users
  has_many :users, through: :viewing_party_users

  def movie
    movie ||= MovieFacade.new(movie_id).movie
  end
end


class ViewingParty < ApplicationRecord
  belongs_to :host, :class_name => "User" 
  has_many :viewing_party_users
  has_many :users, through: :viewing_party_users

  #placeholder movie method
  def movie
    Movie.new({
      id: 1,
      title: "Dogs",
      vote_average: 7.2
    })
  end
end

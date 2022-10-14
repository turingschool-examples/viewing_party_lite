class User < ApplicationRecord
  has_many :viewing_party_users
  has_many :viewing_parties, through: :viewing_party_users

  validates_presence_of :name, :email
  validates_uniqueness_of :email

  def friends
    User.where.not(id: self.id)
  end

  #takes a boolean argument true if hosting, false if invited
  def parties(is_host)
    ViewingParty.joins(:viewing_party_users).
      where(viewing_party_users: {
         user_id: self.id, 
         hosting: is_host }
    )
  end

  def movie_ids
    viewing_parties.map { |party| party.movie_id }
  end

  def self.invited_users(param_hash)
    # is this super sketchY?????
    # another option - https://stackoverflow.com/questions/34949505/rails-5-unable-to-retrieve-hash-values-from-parameter
    param_hash = param_hash.to_unsafe_h
    param_hash.filter_map do |user_id,status|
      user = User.find(user_id.to_i)
      status = status.to_i
      if status == 1
        user
      end
    end
  end
end

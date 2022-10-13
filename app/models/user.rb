class User < ApplicationRecord
  has_many :viewing_party_users
  has_many :viewing_parties, through: :viewing_party_users

  validates_presence_of :name, :email
  validates_uniqueness_of :email

  def friends
    User.where.not(id: self.id)
  end

  def self.invited_users(param_hash)
    param_hash.filter_map do |user_id,status|
      user = User.find(user_id.to_i)
      status = status.to_i
      if status == 1
        user
      end
    end
  end
end

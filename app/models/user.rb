class User < ApplicationRecord
  has_many :user_parties
  has_many :parties, through: :user_parties
  validates :name, :email, :password, presence: true
  validates_uniqueness_of :email
  has_secure_password

  def friends
    User.all.where.not(id: self.id)
  end
  
end


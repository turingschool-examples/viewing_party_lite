class User < ApplicationRecord
  has_many :user_parties
  has_many :parties, through: :user_parties

  validates_presence_of :name, :email
  validates_uniqueness_of :email

  def hosted_parties
    parties.where(host_id: self.id)
  end

  def invited_parties
    parties.where(host_id: !self.id)
  end
end

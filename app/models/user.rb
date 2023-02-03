class User < ApplicationRecord
  has_many :user_parties
  has_many :parties, through: :user_parties

  validates_presence_of :name, :email
  validates_uniqueness_of :email

  def hosted_parties
    parties.where(user_parties: {is_host: true})
  end

  def invited_parties
    parties.where(user_parties: {is_host: false})
  end
end

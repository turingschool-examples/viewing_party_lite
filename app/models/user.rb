class User < ApplicationRecord
  has_many :party_users
  has_many :parties, through: :party_users

  validates :email, uniqueness: true
  validates_presence_of :name, :email, :password_digest
  validates_presence_of :password, :password_confirmation, require: true

  has_secure_password

  def invited_parties
    parties.where.not(host: self.id)
  end

  def hosted_parties
    parties.where(host: self.id)
  end

  def self.all_except_host(host_id)
    where.not(id: host_id)
  end
end

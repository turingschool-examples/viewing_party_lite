class User < ApplicationRecord
  has_many :user_parties
  has_many :parties, through: :user_parties

  validates_presence_of :name, :email
  validates_uniqueness_of :email

  # def self.find_host(host_id)
  #   find(host_id)
  # end
end

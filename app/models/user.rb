class User < ApplicationRecord
  validates :name, presence: true
  validates :email, presence: true

  has_many :party_users
  has_many :parties, through: :party_users

  def self.email_list
    pluck(:email)
  end
end

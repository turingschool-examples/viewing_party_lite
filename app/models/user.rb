class User < ApplicationRecord

  validates_presence_of :name
  validates_presence_of :email

  has_many :viewing_parties, dependent: :destroy
  has_many :viewing_parties, through: :viewing_party_users


  def self.all_emails
    pluck(:email)
  end

end

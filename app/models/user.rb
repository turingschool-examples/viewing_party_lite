class User < ApplicationRecord
  has_many :user_parties
  has_many :parties, through: :user_parties

  validates :name, presence: true, uniqueness: true
  validates :email, presence: true, uniqueness: true

  def self.all_emails
    emails = []
    User.all.each do |user|
      emails << user.email
    end
    emails
  end

  def is_host
    user_parties.where("host = true")
  end

  def is_invited
    user_parties.where("host = false")
  end
end

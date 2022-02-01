class User < ApplicationRecord
  has_many :user_parties
  has_many :parties, through: :user_parties

  validates :email, format: { with: URI::MailTo::EMAIL_REGEXP },
            :presence => {message: "can't be blank"},
            :uniqueness => true
  validates :name,
            :presence => {message: "can't be blank"}
end

class User < ApplicationRecord
  # enum status: ["guest", "host"]

  enum status: {
    host: 0,
    guest: 1
  }

  validates_presence_of :name,
                        :email,
                        :status
  
  has_many :user_parties
  has_many :parties, through: :user_parties 


end

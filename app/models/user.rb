class User < ApplicationRecord
  validates :email, uniqueness: true
  validates_presence_of :email,
                        :name,
                        :password_digest
  has_secure_password

  has_many :user_viewing_parties
  has_many :viewing_parties, through: :user_viewing_parties

  def parties_hosted
    viewing_parties.where("host_id = user_id")
  end
end

class User < ApplicationRecord
  has_many :user_viewing_parties
  has_many :viewing_parties, through: :user_viewing_parties

  validates_presence_of :name, :email, :password
  validates :email, uniqueness: { case_sensitive: false, message: 'User already exists with given email' }
  validates :email, email: true
  validates_confirmation_of :password

  has_secure_password

  def find_user_viewing_party(viewing_party)
    user_viewing_parties.find_by(viewing_party_id: viewing_party.id)
  end

  def all_but_self
    User.where.not(id: id)
  end
end

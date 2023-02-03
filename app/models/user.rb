class User < ApplicationRecord
  has_many :user_viewing_parties
  has_many :viewing_parties, through: :user_viewing_parties

  validates_presence_of :name, :email
  validates :email, uniqueness: { case_sensitive: false, message: 'User already exists with given email' }

  before_validation :downcase_email

  def find_user_viewing_party(viewing_party)
    self.user_viewing_parties.find_by(viewing_party_id: viewing_party.id)
  end

  def all_but_self
    User.where.not(id: self.id)
  end

  private

  def downcase_email
    self.email = email.downcase if self.email
  end
end

class User < ApplicationRecord
  has_many :user_viewing_parties
  has_many :viewing_parties, through: :user_viewing_parties

  validates_presence_of :name, :email
  validates :email, uniqueness: { case_sensitive: false, message: 'User already exists with given email' }

  before_validation :downcase_email

  private

  def downcase_email
    self.email = email.downcase if self.email
  end
end

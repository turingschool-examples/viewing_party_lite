class User < ApplicationRecord
  validates :name, presence: true
  validates :email, presence: true
  validates_uniqueness_of :email, case_sensitive: false
  validate :password
  has_many :user_viewing_parties
  has_many :viewing_parties, through: :user_viewing_parties

  before_save :downcase_email
  
  private

  def downcase_email
    email&.downcase!
  end
end

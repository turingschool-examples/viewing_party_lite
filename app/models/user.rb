class User < ApplicationRecord
  validates :name, presence: true
  validates :email, presence: true
  validates_uniqueness_of :email, case_sensitive: false
  has_many :user_viewing_parties
  has_many :viewing_parties, through: :user_viewing_parties
  has_secure_password
  before_save :downcase_email

  def hosted_parties
    viewing_parties.where(host_id: id)
  end

  def invited_parties
    viewing_parties.where.not(host_id: id)
  end

  private

  def downcase_email
    email&.downcase!
  end
end

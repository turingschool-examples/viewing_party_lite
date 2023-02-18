class User < ApplicationRecord
  validates :name, :password_digest, presence: true
  validates :email, presence: true, uniqueness: { case_sensitive: false }
  validates :email, format: { with: URI::MailTo::EMAIL_REGEXP, message: 'Must be valid email address' }

  has_many :user_viewing_parties
  has_many :viewing_parties, through: :user_viewing_parties
  has_secure_password

  enum role: %w(default admin)

  before_save :downcase_email

  def hosted_parties
    viewing_parties.upcoming.where(host_id: id)
  end

  def invited_parties
    viewing_parties.upcoming.where.not(host_id: id)
  end

  def name_and_email
    "#{name} (#{email})"
  end

  private

  def downcase_email
    email&.downcase!
  end
end

class User < ApplicationRecord
  validates_presence_of :name
  validates_presence_of :email, format: { with: URI::MailTo::EMAIL_REGEXP, message: 'Must be valid email address' }
  validates_uniqueness_of :email, case_sensitive: false
  validates_presence_of :password_digest
  has_secure_password

  has_many :user_viewing_parties
  has_many :viewing_parties, through: :user_viewing_parties

  before_save :downcase_email

  def hosted_parties
    viewing_parties.where(host_id: id)
  end

  def invited_parties
    viewing_parties.where.not(host_id: id)
  end

  def name_and_email
    "#{name} (#{email})"
  end

  private

  def downcase_email
    email&.downcase!
  end
end

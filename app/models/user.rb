# frozen_string_literal: true

class User < ApplicationRecord
  has_secure_password
  has_many :user_view_parties
  has_many :view_parties, through: :user_view_parties

  validates :name, :email, :password_digest, presence: true
  validates :email, uniqueness: true

  enum role: %i[default admin]

  before_save { self.email = email.downcase if email }

  def self.default_users
    where(role: 'default')
  end
end

# frozen_string_literal: true

class User < ApplicationRecord
  has_many :viewing_party_users, dependent: :destroy
  has_many :viewing_parties, through: :viewing_party_users, dependent: :destroy

  validates :name, presence: true
  validates :email, presence: true, uniqueness: true
  validates :password_digest, presence: true

  has_secure_password 

  def name_with_email
    "#{name} #{email}"
  end
end

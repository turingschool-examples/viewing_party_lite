# frozen_string_literal: true

class User < ApplicationRecord
  has_many :user_view_parties
  has_many :view_parties, through: :user_view_parties

  validates :name, :email, :password_digest, presence: true
  validates :email, uniqueness: true
  validates :password, confirmation: true, on: :create
  validates :password_confirmation, presence: true, on: :create

  has_secure_password
end

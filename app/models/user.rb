# frozen_string_literal: true

class User < ApplicationRecord
  has_many :user_view_parties
  has_many :view_parties, through: :user_view_parties
  validates_presence_of :name
  validates_presence_of :email
  validates_presence_of :password_digest
  has_secure_password
end

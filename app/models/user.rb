# frozen_string_literal: true

class User < ApplicationRecord
  validates_presence_of :name
  validates_uniqueness_of :email
  validates_presence_of :email
  # validates_presence_of :password

  has_secure_password

  has_many :user_viewing_parties
  has_many :viewing_parties, through: :user_viewing_parties
end

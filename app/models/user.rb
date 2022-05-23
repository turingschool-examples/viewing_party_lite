# frozen_string_literal: true

class User < ApplicationRecord
  validates_presence_of :name, :email
  validates_uniqueness_of :email
  validates_presence_of :password_digest, required: true
  has_secure_password

  has_many :attendees
  has_many :parties
  has_many :parties, through: :attendees
end

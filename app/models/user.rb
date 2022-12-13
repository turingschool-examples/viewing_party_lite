# frozen_string_literal: true
class User < ApplicationRecord

  has_many :user_viewing_parties
  has_many :viewing_parties, through: :user_viewing_parties

  validates_presence_of :name
  validates_presence_of :email
  validates_uniqueness_of :email
  validates :password, confirmation: true, on: :create
  validates :password_confirmation, presence: true, on: :create
  has_secure_password

end 


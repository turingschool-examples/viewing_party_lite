# frozen_string_literal: true

class User < ApplicationRecord

   validates_presence_of :name, :password_digest
   # validates_presence_of :email, uniqueness: true
   # validates_uniqueness_of :email, case_sensitive: false
   validates :email, uniqueness: true, presence: true
   # validates_presence_of :password, require: true

   has_many :party_users
   has_many :parties, through: :party_users

   has_secure_password
  validates_presence_of :name, :email
  validates_uniqueness_of :email, case_sensitive: false

  has_many :party_users
  has_many :parties, through: :party_users

end

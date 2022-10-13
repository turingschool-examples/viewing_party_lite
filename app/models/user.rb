# frozen_string_literal: true

class User < ApplicationRecord
  has_many :user_viewing_parties
  has_many :viewing_parties, through: :user_viewing_parties
  validates_presence_of :name,
                        :email
  validates_uniqueness_of :email
  def self.other_users(user)
    where('email != ?', user.email)
  end
end

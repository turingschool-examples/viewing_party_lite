# frozen_string_literal: true

class User < ApplicationRecord
  validates :name, presence: true
  validates :email, presence: true
  has_many :user_parties
  has_many :viewing_parties, through: :user_parties

  def self.all_but_current(user)
    where.not(id: user.id)
  end
end

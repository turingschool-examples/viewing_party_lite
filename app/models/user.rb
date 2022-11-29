# frozen_string_literal: true

class User < ApplicationRecord
  has_many :user_view_parties
  has_many :view_parties, through: :user_view_parties

  validates :name, :email, presence: true
  validates :email, uniqueness: true
end

# frozen_string_literal: true

class User < ApplicationRecord
  has_many :user_parties
  has_many :viewing_parties, through: :user_parties

  validates_presence_of :name, :email
end

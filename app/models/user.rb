# frozen_string_literal: true

class User < ApplicationRecord
  has_many :viewing_party_users
  has_many :viewing_parties, through: :viewing_party_users

  validates_presence_of :name, :email
  validates_uniqueness_of :email
end

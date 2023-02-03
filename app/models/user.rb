# frozen_string_literal: true

class User < ApplicationRecord
  has_many :viewing_parties, foreign_key: 'host_id'
  has_many :viewing_party_users
  validates :name, presence: true
  validates :email, presence: true, uniqueness: true
end

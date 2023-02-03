# frozen_string_literal: true

class User < ApplicationRecord
  has_many :viewing_parties, foreign_key: 'host_id'
  validates :name, presence: true
  validates :email, presence: true, uniqueness: true
end

# frozen_string_literal: true

class User < ApplicationRecord
  has_many :viewing_parties
  has_many :user_viewing_parties

  validates_presence_of :name
  validates_presence_of :email
end

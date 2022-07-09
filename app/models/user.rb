# frozen_string_literal: true

class User < ApplicationRecord
  has_many :user_viewing_parties
  has_many :viewing_parties, through: :user_viewing_parties

  validates :name, presence: true
  validates :email, presence: true, uniqueness: true

  def is_host?(party_id)
    user_viewing_parties.find_by(viewing_party_id: party_id, hosting: true)
  end

  def self.other_users(id)
    User.where.not(id: id)
  end
end

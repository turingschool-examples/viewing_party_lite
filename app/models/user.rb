# frozen_string_literal: true

class User < ApplicationRecord
  validates :name, presence: true
  validates :email, presence: true, uniqueness: true

  has_many :party_users
  has_many :viewing_parties, through: :party_users

  def is_host?(party_id)
    PartyUser.find_by(user_id: id, viewing_party_id: party_id).host
  end
end

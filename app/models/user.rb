# frozen_string_literal: true

class User < ApplicationRecord
  has_many :viewing_party_users
  has_many :viewing_parties, through: :viewing_party_users

  validates_presence_of :name, :email
  validates_uniqueness_of :email

  def find_viewing_party_user(viewing_party)
    ViewingPartyUser.find_by(user_id: id, viewing_party_id: viewing_party.id)
  end

  def name_and_email
    "#{name} (#{email})"
  end

  def all_other_users
    User.where.not(id: id)
  end
end

# frozen_string_literal: true

class ViewingParty < ApplicationRecord
  belongs_to :user
  has_many :user_parties
  has_many :users, through: :user_parties
  accepts_nested_attributes_for :users
end

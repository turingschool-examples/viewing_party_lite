class ViewingParty < ApplicationRecord
    validates_presence_of :date
    validates :duration, numericality: true
    validates_presence_of :start_time

    has_many :party_users
    has_many :users, through: :party_users
  end
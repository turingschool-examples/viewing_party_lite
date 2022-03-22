# frozen_string_literal: true

class Party < ApplicationRecord
  has_many :user_parties
  has_many :users, through: :user_parties

  validates_presence_of :day
  validates_presence_of :start_time
  validates_presence_of :duration
end

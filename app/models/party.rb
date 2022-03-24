# frozen_string_literal: true

class Party < ApplicationRecord
  belongs_to :user
  has_many :user_parties
  has_many :users, through: :user_parties

  validates_presence_of :duration_time, :start_date, :start_time

  def user_status
  end
end

# frozen_string_literal: true

class Party < ApplicationRecord
  validates_presence_of :duration, :date, :start_time

  has_many :party_users
  has_many :users, through: :party_users


  def host_name(host_id)
    users.where('users.id = ?', host_id)
    .first
    .name
  end

  def invited(host_id)
    users.where.not('users.id = ?', host_id)
  end
end

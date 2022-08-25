class ViewingParty < ApplicationRecord
  validates :movie_id, numericality: true
  validates :duration, numericality: true
  validates_date :date
  validates_time :start_time

  has_many :viewing_party_users
  has_many :users, through: :viewing_party_users

  def find_host
    host_id = viewing_party_users.where(host: true).pluck(:user_id)
    host = User.find(host_id.first)
    host.name
  end
end
class ViewingParty < ApplicationRecord
  validates :movie_id, numericality: true
  validates :duration, numericality: true
  validates_date :date
  validates_time :start_time

  has_many :viewing_party_users
  has_many :users, through: :viewing_party_users

  def find_host
    users
      .joins(:viewing_party_users)
      .select('users.*, viewing_party_users.host')
      .where('viewing_party_users.host = true')
      .distinct
  end

  def host_name
    find_host[0].name
  end

  def host_id
    find_host[0].id
  end
end

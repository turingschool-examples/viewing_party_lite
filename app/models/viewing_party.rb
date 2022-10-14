class ViewingParty < ApplicationRecord
  has_many :viewing_party_users
  has_many :users, through: :viewing_party_users

  def poster_path
    MovieDbFacade.find_by_movie_id(movie_id).poster_path
  end

  def find_host
    host = viewing_party_users.select("user_id").where("status=0")
    User.find(host[0].user_id)
  end

  def invites
    invites = viewing_party_users.select("user_id").where("status=1")
    invites.map do |invite|
      User.find(invite.user_id)
    end
  end

  def valid_date
    if date.present? && date.to_date >= (Date.today)
    else
      errors.add(:date, "Date is not valid")
    end
  end

  validates :start_time, presence: true
  validate :valid_date
end

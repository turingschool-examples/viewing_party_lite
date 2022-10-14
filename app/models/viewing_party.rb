class ViewingParty < ApplicationRecord
  has_many :viewing_party_users
  has_many :users, through: :viewing_party_users

  def poster_path
    MovieDbFacade.find_by_movie_id(movie_id).poster_path
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

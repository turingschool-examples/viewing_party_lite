class ViewingParty < ApplicationRecord
  has_many :user_viewing_parties
  has_many :users, through: :user_viewing_parties

  validates_presence_of :date
  validates_presence_of :start_time

  def host 
    users
      .joins(:user_viewing_parties)
      .find_by("user_viewing_parties.status = 'Hosting'")
      .name
  end

  def invitees
    users
      .joins(:user_viewing_parties)
      .where("user_viewing_parties.status = 'Invited'")
      .pluck(:name)
  end
end
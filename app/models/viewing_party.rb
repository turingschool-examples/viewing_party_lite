class ViewingParty < ApplicationRecord
  validates_presence_of :movie_title, :movie_id, :duration, :date
  validates_numericality_of :duration, :movie_id, greater_than: 0

  has_many :user_parties
  has_many :users, through: :user_parties

  def start_time
    date.strftime('%I:%M %p')
  end

  def start_date
    date.strftime('%B %d, %Y')
  end

  def user_hosting_status(user)
    user_parties.select do |participant|
      return participant.user_status.capitalize if participant.user_id == user.id
    end
  end

  def attendees
    participants = user_parties.select do |participant|
      participant.user_status == 'invited'
    end
    participants.map do |participant|
      participant.user.name
    end
  end

  def host
    user_parties.select do |participant|
      return participant.user.name if participant.user_status == 'hosting'
    end
  end

  def movie_poster
    MovieFacade.new(id)
  end
end

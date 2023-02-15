class Party < ApplicationRecord
  has_many :user_parties
  has_many :users, through: :user_parties

  validates_presence_of :duration, :start_time

  def movie
    MovieFacade.find_movie(movie_id)
  end

  def host
    userparty = UserParty.where(party_id: id, is_host: true).first
    User.where(id: userparty.user_id)[0].name
  end

  def create_parties(params, current_user)
    potential_guests = User.where.not(id: current_user.id)
    UserParty.create!(user_id: current_user.id, party_id: id, is_host: true)

    add_guests_to_party(current_user, params)
  end

  private

  def check_if(guest, params)
    params[guest.id.to_s.to_sym] == '1'
  end

  def add_guests_to_party(current_user, params)
    potential_guests = User.where.not(id: current_user.id)
    potential_guests.each do |guest|
      UserParty.create!(user_id: guest.id, party_id: id, is_host: false) if check_if(guest, params)
    end
  end
end

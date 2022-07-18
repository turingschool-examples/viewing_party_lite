require 'rails_helper'

RSpec.describe ViewingParty, type: :model do
  describe 'relationships' do
    it { should have_many :user_viewing_parties }
    it { should have_many(:users).through(:user_viewing_parties) }
  end

  describe 'validations' do
    it { should validate_presence_of :movie_id }
    it { should validate_presence_of :duration }
    it { should validate_presence_of :date }
    it { should validate_presence_of :start_time }
  end

  it 'returns the title of the movie through the id', :vcr do 
    party1 = ViewingParty.create!(movie_id: 129, duration: 96, date: Date.new(2022,9,7), start_time: "16:00:00")

    expect(party1.movie_title).to eq('Spirited Away')
  end

  it 'returns the poster of the movie through the id', :vcr do 
    party1 = ViewingParty.create!(movie_id: 129, duration: 96, date: Date.new(2022,9,7), start_time: "16:00:00")

    expect(party1.poster_path).to eq("/39wmItIWsg5sZMyRUHLkWBcuVCM.jpg")
  end

  it 'formats the time for the party' do 
    party1 = ViewingParty.create!(movie_id: 129, duration: 96, date: Date.new(2022,9,7), start_time: "16:00:00")

    expect(party1.formatted_time).to eq(" 4:00 PM")
  end

  it 'formats the date for the party' do 
    party1 = ViewingParty.create!(movie_id: 129, duration: 96, date: Date.new(2022,9,7), start_time: "16:00:00")

    expect(party1.formatted_date).to eq("Sep 7, 2022")
  end

  it 'can identify the host' do 
    user1 = User.create!(name: 'Parker', email: 'mangaforever@hootube.net')
    user2 = User.create!(name: 'Lola', email: 'lola@example.com')
    user3 = User.create!(name: 'Squiggles', email: 'goblindog@dogsshouldbeabletovote.org')

    party1 = ViewingParty.create!(movie_id: 129, duration: 96, date: Date.new(2022,9,7), start_time: "16:00:00")

    user_viewing1 = UserViewingParty.create!(user_id: user1.id, viewing_party_id: party1.id, host: false)
    user_viewing2 = UserViewingParty.create!(user_id: user2.id, viewing_party_id: party1.id, host: false)
    user_viewing3 = UserViewingParty.create!(user_id: user3.id, viewing_party_id: party1.id, host: true)
    
    expect(party1.host).to eq('Squiggles')
    expect(party1.host).to_not eq('Parker')
  end

  # it 'lists the attendees' do 
  #   user1 = User.create!(name: 'Parker', email: 'mangaforever@hootube.net')
  #   user2 = User.create!(name: 'Lola', email: 'lola@example.com')
  #   user3 = User.create!(name: 'Squiggles', email: 'goblindog@dogsshouldbeabletovote.org')
  #   user4 = User.create!(name: 'Pancakes', email: 'spacecadet42@hootmail.com')

  #   party1 = ViewingParty.create!(movie_id: 129, duration: 96, date: Date.new(2022,9,7), start_time: "16:00:00")

  #   user_viewing1 = UserViewingParty.create!(user_id: user1.id, viewing_party_id: party1.id, host: false)
  #   user_viewing2 = UserViewingParty.create!(user_id: user2.id, viewing_party_id: party1.id, host: false)
  #   user_viewing3 = UserViewingParty.create!(user_id: user3.id, viewing_party_id: party1.id, host: true)
  #   user_viewing4 = UserViewingParty.create!(user_id: user4.id, viewing_party_id: party1.id, host: false)

  #   expect(party1.attendees).to eq([user2, user4])
  #   expect(party1.attendees).to_not eq([user1, user3])

  # end
end

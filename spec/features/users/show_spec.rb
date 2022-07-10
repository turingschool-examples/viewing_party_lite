require 'rails_helper'

RSpec.describe 'user dashboard page' do
  it 'has users name' do
    user = User.create!(name: 'Tommy Tanktop', email: 'tanktoptitan@aol.com')

    visit "/users/#{user.id}"

    expect(page).to have_content("Tommy Tanktop's Dashboard")
  end

  it 'has a button to discover movies' do
    user = User.create!(name: 'Tommy Tanktop', email: 'tanktoptitan@aol.com')

    visit "/users/#{user.id}"

    click_button('Discover Movies')

    expect(current_path).to eq("/user/#{user.id}/discover")
  end

  it 'has a movie image, title link, who is hosting the event, and a list of invitees' do
    user1 = User.create!(name: 'Tommy Tanktop', email: 'tanktoptitan@aol.com')
    user2 = User.create!(name: 'Jerry Jasmond', email: 'jjasmond@aol.com')
    user3 = User.create!(name: 'Ken Kappersmith', email: 'kkappersmith@aol.com')
    party1 = Party.create!(movie_name: 'Fight Club', movie_id: 1, date: Time.now.strftime('%d/%m/%Y'),
                           start_time: Time.now.strftime('%H:%M'), duration: 120)
    party2 = Party.create!(movie_name: 'Armageddon', movie_id: 4,
                           date: Time.now.strftime('%d/%m/%Y'), start_time: Time.now.strftime('%H:%M'), duration: 120)
    party3 = Party.create!(movie_name: 'Superbad', movie_id: 3, date: Time.now.strftime('%d/%m/%Y'),
                           start_time: Time.now.strftime('%H:%M'), duration: 120)
    PartyUser.create(party_id: party1.id, user_id: user1.id, host: true)
    PartyUser.create(party_id: party1.id, user_id: user2.id, host: false)

    PartyUser.create(party_id: party2.id, user_id: user2.id, host: true)
    PartyUser.create(party_id: party2.id, user_id: user1.id, host: false)
    PartyUser.create(party_id: party2.id, user_id: user3.id, host: false)

    PartyUser.create(party_id: party3.id, user_id: user3.id, host: true)
    PartyUser.create(party_id: party3.id, user_id: user1.id, host: false)
    PartyUser.create(party_id: party3.id, user_id: user2.id, host: false)

    visit "/users/#{user1.id}"

    within '#viewingPartiesInvited' do
      expect(page).to have_content('Host: jjasmond@aol.com')
      expect(page).to have_content('Host: kkappersmith@aol.com')
      expect(page).to have_content('Armageddon')
      expect(page).to have_content('Superbad')
      expect(page).to_not have_content('Fight Club')
    end

    within '#viewingPartiesCreated' do
      expect(page).to have_content('Host: tanktoptitan@aol.com')
      expect(page).to_not have_content('Armageddon')
      expect(page).to_not have_content('Superbad')
      expect(page).to have_content('Fight Club')
      expect(page).to have_content('jjasmond@aol.com')
      expect(page).to_not have_content('kkappersmith@aol.com')
    end
  end
end

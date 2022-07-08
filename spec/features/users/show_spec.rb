require 'rails_helper'

RSpec.describe "Dashboard Page" do
  it 'has correct title' do
    user = User.create(name: 'Geddy', email: '2112@yyz.com')
    visit "/users/#{user.id}"

    expect(page).to have_content("Geddy's Dashboard")
  end

  it 'has a button to navigate to discover movie page', :vcr do
    user = User.create(name: 'Geddy', email: '2112@yyz.com')
    visit "/users/#{user.id}"
    click_button("Discover Movies")

    expect(current_path).to eq("/users/#{user.id}/discover")
  end

  it 'shows all viewing parties the user is invited or hosting with details' do
    user1 = User.create(name: 'Geddy', email: '2112@yyz.com')
    user2 = User.create(name: 'Alex', email: 'cygnus@xanadu.com')
    user3 = User.create(name: 'Neil', email: 'bytor@snowdog.com')
    party1 = Party.create(date: '2022-05-10', duration: 147,  movie: 'Jurassic Park', host: user2.id, movie_image: 'movie picture', host_name:user2.name, start_time: '7:00', movie_id: 123)
    party2 = Party.create(date: '2022-05-14', duration: 147,  movie: 'Jack Ass 3.5', host: user1.id, movie_image: 'movie picture', host_name:user1.name, start_time: '1:00', movie_id: 124)
    PartyUser.create(user_id: user1.id, party_id: party1.id )
    PartyUser.create(user_id: user2.id, party_id: party1.id )
    PartyUser.create(user_id: user3.id, party_id: party1.id )
    PartyUser.create(user_id: user1.id, party_id: party2.id )
    PartyUser.create(user_id: user2.id, party_id: party2.id )

    visit "/users/#{user2.id}"

    within ".invited" do
      expect(page).to have_content("Geddy")
      expect(page).to have_content("Alex")
      expect(page).to have_content("Jack Ass 3.5")
      expect(page).to have_content('2022-05-14 1:00')

      expect(page).to_not have_content("Jurassic Park")
      expect(page).to_not have_content("Neil")
    end

    within ".hosting" do
      expect(page).to have_content("Geddy")
      expect(page).to have_content("Neil")
      expect(page).to have_content("Jurassic Park")
      expect(page).to have_content('2022-05-10 7:00')

      expect(page).to_not have_content("Jack Ass 3.5")
      expect(page).to_not have_content("Alex")
    end
  end
  it 'shows all viewing parties the user is invited or hosting with details' do
    user1 = User.create(name: 'Geddy', email: '2112@yyz.com')
    user2 = User.create(name: 'Alex', email: 'cygnus@xanadu.com')
    user3 = User.create(name: 'Neil', email: 'bytor@snowdog.com')
    party1 = Party.create(date: '2022-05-10', duration: 147,  movie: 'Jurassic Park', host: user2.id, movie_image: 'movie picture', host_name:user2.name, start_time: '7:00', movie_id: 123)
    party2 = Party.create(date: '2022-05-14', duration: 147,  movie: 'Jack Ass 3.5', host: user1.id, movie_image: 'movie picture', host_name:user1.name, start_time: '1:00', movie_id: 124)
    PartyUser.create(user_id: user1.id, party_id: party1.id )
    PartyUser.create(user_id: user2.id, party_id: party1.id )
    PartyUser.create(user_id: user3.id, party_id: party1.id )
    PartyUser.create(user_id: user1.id, party_id: party2.id )
    PartyUser.create(user_id: user2.id, party_id: party2.id )

    visit "/users/#{user2.id}"
    click_link("Jack Ass 3.5")
  end
end

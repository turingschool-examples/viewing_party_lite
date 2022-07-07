require 'rails_helper'

RSpec.describe "Dashboard Page" do
  it 'has correct title' do
    user = User.create(name: 'Geddy', email: '2112@yyz.com')
    visit "/users/#{user.id}"

    expect(page).to have_content("Geddy's Dashboard")
  end

  it 'has a button to navigate to discover movie page' do
    user = User.create(name: 'Geddy', email: '2112@yyz.com')
    visit "/users/#{user.id}"
    click_button("Discover Movies")

    expect(current_path).to eq("/users/#{user.id}/discover")
  end

  it 'shows all viewing parties the user is invited to with details' do
    user1 = User.create(name: 'Geddy', email: '2112@yyz.com')
    user2 = User.create(name: 'Alex', email: 'cygnus@xanadu.com')
    user3 = User.create(name: 'Neil', email: 'bytor@snowdog.com')
    party1 = Party.create(date: '2022-05-10', duration: 147,  movie: 'Jurassic Park', host: user1.id, movie_image: 'movie picture')
    PartyUser.create(user_id: user2.id, party_id: party1.id )
    PartyUser.create(user_id: user3.id, party_id: party1.id )
    binding.pry
  end
end

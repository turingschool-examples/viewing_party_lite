require 'rails_helper'

RSpec.describe 'User Discover Page' do
  before :each do
    @user1 = User.create(name: "Jake", email: "imjakekim@gmail.com")
    @user2 = User.create(name: "Riley", email: "rileybmccullough@gmail.com")

    @party1 = ViewingParty.create(movie_title: 'Fellowship of the Ring', length: 200, start_time: "2022-11-18 03:45")
    @party2 = ViewingParty.create(movie_title: 'Psych the Movie', length: 150, start_time: "2022-12-30 18:45")

    @user_party1 = ViewingPartyUser.create(viewing_party_id: @party1.id, user_id: @user1.id, status: 0)
    @user_party2 = ViewingPartyUser.create(viewing_party_id: @party2.id, user_id: @user1.id, status: 1)
  end

  it 'can search movies' do
    visit "/users/#{@user1.id}/discover"
    fill_in "search", with: "Phoenix"
    click_on "Find Movies"
    expect(current_path).to eq("/users/#{@user1.id}/movies?q=Phoenix")
  end

  it 'can search movies' do
    visit "/users/#{@user1.id}/discover"
    click_on "Discover Top Rated Movies"
    save_and_open_page
    expect(current_path).to eq("/users/#{@user1.id}/movies")
  end

end

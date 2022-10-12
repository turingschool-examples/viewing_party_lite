require 'rails_helper'

RSpec.describe 'User Movies Page', :vcr do
  before :each do
    @user1 = User.create(name: "Jake", email: "imjakekim@gmail.com")
    @user2 = User.create(name: "Riley", email: "rileybmccullough@gmail.com")

    @party1 = ViewingParty.create(movie_title: 'Fellowship of the Ring', length: 200, start_time: "2022-11-18 03:45")
    @party2 = ViewingParty.create(movie_title: 'Psych the Movie', length: 150, start_time: "2022-12-30 18:45")

    @user_party1 = ViewingPartyUser.create(viewing_party_id: @party1.id, user_id: @user1.id, status: 0)
    @user_party2 = ViewingPartyUser.create(viewing_party_id: @party2.id, user_id: @user1.id, status: 1)
  end
  
  it 'buttons back to discover page' do
    visit "/users/#{@user1.id}/movies?q=top%20rated"
    click_button "Discover Page"
    expect(current_path).to eq("/users/#{@user1.id}/discover")
  end

  it 'links to specific movie show pages' do
    visit "/users/#{@user1.id}/movies?q=top%20rated"
    click_on "The Godfather"
    expect(current_path).to eq("/users/#{@user1.id}/movies/238")

  end

  # it '' do
  #   visit "/users/#{@user1.id}/movies?search=phoenix"
  #   click_on "Discover Page"
  # end

end

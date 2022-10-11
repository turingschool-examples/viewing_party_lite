require 'rails_helper'

RSpec.describe 'User Dashboard Page' do
  before :each do
    @user1 = User.create(name: "Jake", email: "imjakekim@gmail.com")
    @user2 = User.create(name: "Riley", email: "rileybmccullough@gmail.com")

    @party1 = ViewingParty.create(movie_title: 'Fellowship of the Ring', length: 200, start_time: "2022-11-18 03:45")
    @party2 = ViewingParty.create(movie_title: 'Psych the Movie', length: 150, start_time: "2022-12-30 18:45")

    @user_party1 = ViewingPartyUser.create(viewing_party_id: @party1.id, user_id: @user1.id, status: 0)
    @user_party2 = ViewingPartyUser.create(viewing_party_id: @party2.id, user_id: @user1.id, status: 1)
  end

  it "shows user's viewing_parties" do
    visit "/users/#{@user1.id}"
    # require 'pry', binding.pry
    # save_and_open_page

    expect(page).to have_content("#{@user1.name}'s Dashboard")
    expect(page).to have_content("Date: #{@party1.start_time.strftime("%Y-%m-%d")}")
    expect(page).to have_content("Starting Time: #{@party1.start_time.strftime("%H:%M:%S")}")
    expect(page).to have_content("Status: #{@user_party1.status}")
  end

  it 'has a discover movie button' do
    visit "/users/#{@user1.id}"
    expect(page).to have_button("Discover Movies")
    click_on "Discover Movies"
    expect(current_path).to eq("/users/#{@user1.id}/discover")
  end

end

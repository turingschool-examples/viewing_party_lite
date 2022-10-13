require 'rails_helper'

RSpec.describe 'User Viewing Party New Page', :vcr do
  before :each do
    @user1 = User.create(name: "Jake", email: "imjakekim@gmail.com")
    @user2 = User.create(name: "Riley", email: "rileybmccullough@gmail.com")
    @user3 = User.create(name: "123", email: "123@gmail.com")
    @user4 = User.create(name: "abc", email: "abc@gmail.com")


    @party1 = ViewingParty.create(movie_title: 'Fellowship of the Ring', length: 200, start_time: "2022-11-18 03:45")
    @party2 = ViewingParty.create(movie_title: 'Psych the Movie', length: 150, start_time: "2022-12-30 18:45")

    @user_party1 = ViewingPartyUser.create(viewing_party_id: @party1.id, user_id: @user1.id, status: 0)
    @user_party2 = ViewingPartyUser.create(viewing_party_id: @party2.id, user_id: @user1.id, status: 1)
  end

  it 'has required fixed content on new page' do
    visit "/users/#{@user1.id}/movies/238/viewing_party/new"
    save_and_open_page
    expect(page).to have_content("Discover Page")
    expect(page).to have_button("Create Party")
    expect(page).to have_content("Movie Title")
    expect(page).to have_content("Duration of Party")
    expect(page).to have_content("Day")
    expect(page).to have_content("Start Time")
    expect(page).to have_content("Invite Other Users")
  end

  xit 'has required varying content on new page' do
    visit "/users/#{@user1.id}/movies/238/viewing_party/new"

    expect(page).to have_content("Create Viewing Party")
    expect(page).to have_content("The Godfather")
    expect(page).to have_content("Create Party")
    expect(page).to have_content("Riley (rileybmccullough@gmail.com)")
  end

  xit 'can use the Discover Page button to go back' do
    visit "/users/#{@user1.id}/movies/238/viewing_party/new"
    click_button 'Discover Page'

    expect(current_path).to eq("/users/#{@user1.id}/movies")
  end

  xit 'can create new viewing party' do
    visit "/users/#{@user1.id}/movies/238/viewing_party/new"

    fill_in 'Duration of Party', with: '240'
    fill_in 'Day', with: '10/10/31'
    fill_in 'Start Time', with: '20:00'
    click_box "Riley (rileybmccullough@gmail.com)"

    click_button 'Create Party'
    expect(current_path).to eq("/users/#{@user1.id}")
    # expect(ViewingParty.find())
  end

end

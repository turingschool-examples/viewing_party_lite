require 'rails_helper'

RSpec.describe 'User Viewing Party New Page', :vcr do
  before :each do
    @user1 = User.create(name: "Jake", email: "imjakekim@gmail.com")
    @user2 = User.create(name: "Riley", email: "rileybmccullough@gmail.com")
    @user3 = User.create(name: "123", email: "123@gmail.com")
    @user4 = User.create(name: "abc", email: "abc@gmail.com")
  end

  it 'has required fixed content on new page' do
    visit "/users/#{@user1.id}/movies/238/viewing_party/new"
    # save_and_open_page
    expect(page).to have_button("Discover Page")
    expect(page).to have_button("Create Party")
    expect(page).to have_content("Movie Title")
    expect(page).to have_content("Duration of Party")
    expect(page).to have_content("Day")
    expect(page).to have_content("Start Time")
    expect(page).to have_content("Invite Other Users")
  end

  it 'has required varying content on new page' do
    visit "/users/#{@user1.id}/movies/238/viewing_party/new"

    expect(page).to have_content("The Godfather")
    expect(page).to have_content("Riley (rileybmccullough@gmail.com)")
  end

  it 'can use the Discover Page button to go back' do
    visit "/users/#{@user1.id}/movies/238/viewing_party/new"
    click_button 'Discover Page'

    expect(current_path).to eq("/users/#{@user1.id}/discover")
  end

  it 'can submit new viewing party form' do
    visit "/users/#{@user1.id}/movies/238/viewing_party/new"

    fill_in 'Duration of Party', with: '240'
    fill_in 'Day', with: '10/10/31'
    fill_in 'Start Time', with: '20:00'
    check "user_#{@user2.id}"
    check "user_#{@user3.id}"
    # save_and_open_page
    click_button 'Create Party'
    expect(current_path).to eq("/users/#{@user1.id}")
  end

  it 'can create new viewing party and viewing party users' do
    visit "/users/#{@user1.id}/movies/238/viewing_party/new"

    fill_in 'Duration of Party', with: '240'
    fill_in 'Day', with: '10/10/31'
    fill_in 'Start Time', with: '20:00'
    check "user_#{@user2.id}"
    check "user_#{@user3.id}"

    click_button 'Create Party'

    newest_view_party = ViewingParty.find_by(length: 240)

    expect(newest_view_party)
    expect(ViewingPartyUser.find_by(viewing_party_id: newest_view_party.id, user_id: @user1.id).status).to eq('hosting')
    expect(ViewingPartyUser.find_by(viewing_party_id: newest_view_party.id, user_id: @user2.id).status).to eq('invited')
    expect(ViewingPartyUser.find_by(viewing_party_id: newest_view_party.id, user_id: @user3.id).status).to eq('invited')
  end

  it 'cannot create new viewing party if length is short than runtime' do
    visit "/users/#{@user1.id}/movies/238/viewing_party/new"

    fill_in 'Duration of Party', with: '170'
    fill_in 'Day', with: '10/10/31'
    fill_in 'Start Time', with: '20:00'
    check "user_#{@user2.id}"
    check "user_#{@user3.id}"

    click_button 'Create Party'

    expect(current_path).to eq("/users/#{@user1.id}/movies/238/viewing_party/create")
    newest_view_party = ViewingParty.find_by(length: 170)
    expect(newest_view_party).to eq(nil)
  end


end

require 'rails_helper'

RSpec.describe 'User Dashboard Page', :vcr do
  before :each do
    @user1 = User.create(name: 'Jake', email: 'imjakekim@gmail.com')
    @user2 = User.create(name: 'Riley', email: 'rileybmccullough@gmail.com')

    @party1 = ViewingParty.create(movie_id: 120, movie_title: 'Fellowship of the Ring', length: 200, start_time: '03:45', date: '2022-12-23')
    @party2 = ViewingParty.create(movie_id: 457840, movie_title: 'Psych the Movie', length: 150, start_time: '18:45', date: '2022-11-23')

    @user_party1 = ViewingPartyUser.create(viewing_party_id: @party1.id, user_id: @user1.id, status: 0)
    @user_party2 = ViewingPartyUser.create(viewing_party_id: @party2.id, user_id: @user1.id, status: 1)
  end

  it 'has propper page attributes from only user 1' do
    visit "/users/#{@user1.id}"

    expect(page).to have_content('Viewing Party Lite')
    expect(page).to have_content("Jake's Dashboard")
    expect(page).to have_button('Return to the Homepage')

    expect(page).to have_content('Viewing Parties')

    expect(page).to_not have_content(@user2.name)
    expect(page).to_not have_content(@user2.email)
  end

  it "shows user's viewing_parties" do
    visit "/users/#{@user1.id}"
    # save_and_open_page

    expect(page).to have_content("#{@user1.name}'s Dashboard")
    expect(page).to have_content("Date: #{@party1.date.strftime("%B %-d, %Y")}")
    expect(page).to have_content("Starting Time: #{@party1.start_time.strftime('%H:%M')}")
    expect(page).to have_content("Status: #{@user_party1.status}")

    expect(page).to_not have_content(@user2.name)
  end

  it 'has a discover movie button' do
    visit "/users/#{@user1.id}"
    expect(page).to have_button('Discover Movies')
    click_on 'Discover Movies'
    expect(current_path).to eq("/users/#{@user1.id}/discover")
  end
end

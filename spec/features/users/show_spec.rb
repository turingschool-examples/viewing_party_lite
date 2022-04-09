require 'rails_helper'

RSpec.describe 'the user dashboard' do
  before :each do 
    UserParty.destroy_all
    User.destroy_all
    Party.destroy_all
    visit register_path
    fill_in 'Name', with: 'Plain Name'
    fill_in 'Email', with: 'User@gmail.com'
    fill_in 'Password', with: '1234'
    fill_in 'Password confirmation', with: '1234'

    click_button('Register')
    @user_1 = User.last

    visit register_path
    fill_in 'Name', with: 'User 2'
    fill_in 'Email', with: 'User2@gmail.com'
    fill_in 'Password', with: '1234'
    fill_in 'Password confirmation', with: '1234'

    click_button('Register')
    @user_2 = User.last

    visit register_path
    fill_in 'Name', with: 'User 3'
    fill_in 'Email', with: 'User3@gmail.com'
    fill_in 'Password', with: '1234'
    fill_in 'Password confirmation', with: '1234'

    click_button('Register')
    @user_3 = User.last
  end 

  it "exists and has a dynamic title for a user" do

    visit dashboard_path

    expect(current_path).to eq(dashboard_path)

    within '#title' do
      expect(page).to have_content("#{@user_3.name}'s Dashboard")
      expect(page).to_not have_content("#{@user_2.name}'s Dashboard")
    end
  end

  it "has a discover movies button which links to the discover page" do

    visit dashboard_path

    within '#discover' do
      expect(page).to have_button("Discover Movies")
      click_button "Discover Movies"
      expect(current_path).to eq("/discover")
    end
  end

  it "has a section that shows information about viewing parties where the user is not the host" do
    party_1 = Party.create!(start_date: '2022-03-25', duration: 90, start_time: '5:00', movie_id: 24126,
      host_id: @user_1.id)
    party_2 = Party.create!(start_date: '2022-03-25', duration: 100, start_time: '6:00', movie_id: 278,
      host_id: @user_2.id)
    UserParty.create!(party_id: party_1.id, user_id: @user_1.id)
    UserParty.create!(party_id: party_2.id, user_id: @user_2.id)
    UserParty.create!(party_id: party_2.id, user_id: @user_3.id)

    VCR.use_cassette('viewing_party_invites') do
      visit dashboard_path
      within '#parties' do
        expect(page).to have_content("My Viewing Parties")
        within '#invitations' do
          expect(page).to have_content("My Invitations")
          expect(page).to have_content("Date: 2022-03-25")
          expect(page).to have_content("Time: 2000-01-01 06:00:00 UTC")
          expect(page).to have_content("Host: User 2")
          expect(page).to have_content("Invited People")
          expect(page).to have_link("The Shawshank Redemption")
          click_link "The Shawshank Redemption"
          expect(current_path).to eq("/movies/278")
        end
      end
    end
  end

  it "has a section that shows information about viewing parties where the user is the host" do
    party_1 = Party.create!(start_date: '2022-03-25', duration: 90, start_time: '5:00', movie_id: 24126,
      host_id: @user_3.id)
    party_2 = Party.create!(start_date: '2022-03-25', duration: 100, start_time: '6:00', movie_id: 278,
      host_id: @user_1.id)

    UserParty.create!(party_id: party_1.id, user_id: @user_3.id)
    UserParty.create!(party_id: party_1.id, user_id: @user_2.id)
    UserParty.create!(party_id: party_2.id, user_id: @user_1.id)
    UserParty.create!(party_id: party_2.id, user_id: @user_3.id)

    VCR.use_cassette('viewing_party_invites_1') do
      visit dashboard_path
      within '#parties' do
        within '#hosting' do
          expect(page).to have_content("Hosted Parties")
          expect(page).to have_content("Date: 2022-03-25")
          expect(page).to have_content("Time: 2000-01-01 05:00:00 UTC")
          expect(page).to have_content("Invited People")
          expect(page).to have_content("You are the host of this party! User 3")
          expect(page).to have_link("Warlock: The Armageddon")
          click_link "Warlock: The Armageddon"
          expect(current_path).to eq("/movies/24126")
        end
      end
    end
  end
end

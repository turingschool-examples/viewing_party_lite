require 'rails_helper'

RSpec.describe 'the user dashboard' do
  it "exists and has a dynamic title for a user" do
    UserParty.destroy_all
    User.destroy_all
    Party.destroy_all
    user_1 = User.create!(name: 'user_1', email: 'email@gmail.com')
    user_2 = User.create!(name: 'user_2', email: 'email2@gmail.com')

    visit user_path(user_1.id)

    expect(current_path).to eq(user_path(user_1.id))

    within '#title' do
      expect(page).to have_content("#{user_1.name}'s Dashboard")
      expect(page).to_not have_content("#{user_2.name}'s Dashboard")
    end
  end

  it "has a discover movies button which links to the discover page" do
    UserParty.destroy_all
    User.destroy_all
    Party.destroy_all
    user_1 = User.create!(name: 'user_1', email: 'email@gmail.com')

    visit user_path(user_1.id)

    within '#discover' do
      expect(page).to have_button("Discover Movies")
      click_button "Discover Movies"
      expect(current_path).to eq("/users/#{user_1.id}/discover")
    end
  end

  it "has a section that shows information about viewing parties where the user is not the host" do
    UserParty.destroy_all
    User.destroy_all
    Party.destroy_all
    user = User.create!(name: 'Host', email: 'host@mail.com')
    user_1 = User.create!(name: 'not host', email: 'nohost@mail.com')
    user_2 = User.create!(name: 'also not host', email: 'neitherhost@mail.com')
    party_1 = Party.create!(start_date: '2022-03-25', duration: 90, start_time: '5:00', movie_id: 24126,
      host_id: user.id)
    party_2 = Party.create!(start_date: '2022-03-25', duration: 100, start_time: '6:00', movie_id: 278,
      host_id: user_2.id)
    user.user_parties.create!(party_id: party_1.id, user_id: user.id)
    user.user_parties.create!(party_id: party_2.id, user_id: user.id)
    user_2.user_parties.create!(party_id: party_2.id, user_id: user_2.id)

    VCR.use_cassette('viewing_party_invites') do
      visit user_path(user.id)
      within '#parties' do
        expect(page).to have_content("My Viewing Parties")
        within '#invitations' do
          expect(page).to have_content("My Invitations")
          expect(page).to have_content("Date: 2022-03-25")
          expect(page).to have_content("Time: 2000-01-01 06:00:00 UTC")
          expect(page).to have_content("Host: also not host")
          expect(page).to have_content("Invited People")
          expect(page).to have_link("The Shawshank Redemption")
          click_link "The Shawshank Redemption"
          expect(current_path).to eq(user_movie_path(user.id, 278))
        end
      end
    end
  end

  it "has a section that shows information about viewing parties where the user is not the host" do
    UserParty.destroy_all
    User.destroy_all
    Party.destroy_all
    user = User.create!(name: 'Host', email: 'host@mail.com')
    user_1 = User.create!(name: 'not host', email: 'nohost@mail.com')
    user_2 = User.create!(name: 'also not host', email: 'neitherhost@mail.com')
    party_1 = Party.create!(start_date: '2022-03-25', duration: 90, start_time: '5:00', movie_id: 24126,
      host_id: user.id)
    party_2 = Party.create!(start_date: '2022-03-25', duration: 100, start_time: '6:00', movie_id: 278,
      host_id: user_2.id)
    user.user_parties.create!(party_id: party_1.id, user_id: user.id)
    user.user_parties.create!(party_id: party_2.id, user_id: user.id)
    user_2.user_parties.create!(party_id: party_2.id, user_id: user_2.id)

    VCR.use_cassette('viewing_party_invites') do
      visit user_path(user.id)
      within '#parties' do
        within '#hosting' do
          expect(page).to have_content("Hosted Parties")
          expect(page).to have_content("Date: 2022-03-25")
          expect(page).to have_content("Time: 2000-01-01 05:00:00 UTC")
          expect(page).to have_content("Invited People")
          expect(page).to have_content("You are the host of this party! Host")
          expect(page).to have_link("The Shawshank Redemption")
          click_link "The Shawshank Redemption"
          expect(current_path).to eq(user_movie_path(user.id, 278))
        end
      end
    end
  end
end

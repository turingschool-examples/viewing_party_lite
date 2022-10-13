require 'rails_helper'

RSpec.describe 'Create Viewing Party' do
  let!(:users) { create_list(:user, 4) }
  let!(:user1) { users.first }
  let!(:user2) { users.second }
  let!(:user3) { users.third }
  let!(:user4) { users.last }

  it 'links from user movie show page', :vcr do
    visit user_movie_path(user1, 238)

    click_on ('Create Viewing Party for The Godfather')

    # expect(current_path).to eq("/users/#{user1.id}/movies/238/viewing-party/new")
    expect(current_path).to eq(user_movie_viewing_party_new_path(user1, 238))
  end

  describe 'page tests', :vcr do
    before :each do
      visit user_movie_viewing_party_new_path(user1, 238)
    end

    it 'has a header' do
      expect(page).to have_content('Create a Movie Party for The Godfather')
    end

    it 'has button for redirecting to discover page' do
      expect(page).to have_button('Discover Page')

      click_on 'Discover Page'

      expect(current_path).to eq(user_discover_path(user1))
    end

    it 'has a field for entering party deets' do
      expect(page).to have_field('Duration of Party', with: 175)
      expect(page).to have_field(:date)
      expect(page).to have_field(:start_time)

      within("#invite_others") do
        expect(page).to have_field("attendees_#{user2.id}", unchecked: true)
        expect(page).to have_field("attendees_#{user3.id}", unchecked: true)
        expect(page).to have_field("attendees_#{user4.id}", unchecked: true)
      end
      expect(page).to have_button('Create Party')
    end

    it 'redirects to dashboard if successfully created' do
      fill_in 'Day', with: Date.tomorrow
      fill_in 'Start Time', with: Time.now + 600

      check("attendees_#{user2.id}")
      check("attendees_#{user3.id}")

      within("#invite_others") do
        expect(page).to have_field("attendees_#{user2.id}", checked: true)
        expect(page).to have_field("attendees_#{user3.id}", checked: true)
        expect(page).to have_field("attendees_#{user4.id}", unchecked: true)
      end

      click_button 'Create Party'

      expect(current_path).to eq(user_dashboard_path(user1))
    end
  end
end

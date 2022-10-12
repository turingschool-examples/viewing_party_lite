require 'rails_helper'

RSpec.describe 'Create Viewing Part' do
  let!(:users) { create_list(:user, 3) }
  let!(:user1) { users.first }
  let!(:user2) { users.second}
  let!(:user3) { users.last}

  it 'links from user movie show page', :vcr do
    visit user_movie_path(user1, 238)

    click_on ('Create Viewing Party for The Godfather')

    expect(current_path).to eq(user_movie_viewing_party_path(user1, 238))
  end

  describe 'page tests', :vcr do
    before :each do
      visit user_movie_viewing_party_path(user1, 238)
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
      expect(page).to have_field(:duration)
      expect(page).to have_field(:date)
      expect(page).to have_field(:start_time)

      within("#invite_others") do
        expect(page).to_not have_checkbox(user1.name)
        expect(page).to_not have_field(user1, unchecked: true) # checked: false or unchecked: true for not checked
        expect(page).to have_checkbox(user2.name)
        expect(page).to have_field(user2, unchecked: true) # checked: false or unchecked: true for not checked
        expect(page).to have_checkbox(user3.name)
        expect(page).to have_field(user3, unchecked: true) # checked: false or unchecked: true for not checked
      end
    end

    it 'has button to create the party' do
      expect(page).to have_button('Create Party')

      click_on 'Create Party'

      expect(current_path).to eq(user_dashboard_path(user1))
    end
  end
end
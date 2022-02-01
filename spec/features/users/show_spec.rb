require 'rails_helper'

RSpec.describe 'User Dashboard', type: :feature do
  describe 'user visits /users/:id, where :id is valid' do
    let!(:user_1) { create :user }
    let!(:user_2) { create :user }

    let!(:viewing_party_1) { Party.create!(duration: 150, time: Time.now, date: Date.today)}

    it 'displays a title with the users name at the top' do
      visit user_path(user_1.id)
      within '#header' do
        expect(page).to have_content("#{user_1.name}'s Dashboard")
        expect(page).to_not have_content("#{user_2.name}'s Dashboard")
      end
    end

    it 'has a button to Discover Movies' do
      visit user_path(user_1.id)
      expect(page).to have_button("Discover Movies")

      click_button "Discover Movies"
      expect(current_path).to eq(user_discover_index_path(user_1.id))
    end

    it 'displays a section that lists viewing parties' do
      #More on this as we encounter later user stories
      visit user_path(user_1.id)
      expect(page).to have_content("Viewing Parties")
    end
  end
end

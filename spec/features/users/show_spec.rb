require 'rails_helper'

RSpec.describe 'user show page' do
  describe '/user/:id' do
    let!(:user1) { create(:user) }
    let!(:user2) { create(:user) }

    it 'displays appropriate informations and links' do
      visit user_path(user1)

      expect(page).to have_content("#{user1.name}'s Dashboard")
      expect(page).to have_link 'Discover Movies'
      expect(page).to have_content('Viewing Parties')
      expect(page).to_not have_content("#{user2.name}'s Dashboard")
    end

    it 'has link to discover page' do
      visit user_path(user1)
      click_on 'Discover Movies'

      expect(current_path).to eq "/users/#{user1.id}/discover"
    end
  end
end

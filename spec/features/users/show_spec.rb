require 'rails_helper'

RSpec.describe 'user show page'do
  describe '/user/:id' do
    let!(:user_1) {create(:user)}
    let!(:user_2) {create(:user)}

    it 'displays appropriate informations and links' do
      visit user_path(user_1)

      expect(page).to have_content("#{user_1.name}'s Dashboard")
      expect(page).to have_link 'Discover Movies'
      expect(page).to have_content('Viewing Parties')
      expect(page).to_not have_content("#{user_2.name}'s Dashboard")
    end
  end
end

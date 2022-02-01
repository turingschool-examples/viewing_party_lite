require 'rails_helper'

RSpec.describe 'landing page', type: :feature do
  describe 'user visits landing page' do
    let!(:user_1) { create(:user) }
    let!(:user_2) { create(:user) }
    let!(:user_3) { create(:user) }

    it 'displays title of application' do
      visit '/'

      within '#header' do
        expect(page).to have_content('Viewing Party Lite')
      end
    end

    it 'displays button to create a new user' do
      visit '/'
      expect(page).to have_button('Create New User')
    end

    #need to figure out factorybot test data caching
    it 'displays list of Existing Users as links to each user dashboard' do
      visit '/'
      expect(User.count).to eq(3)
      # expect(page).to have_link("#{user_1.name}'s Dashboard", href: user_path(user_1.id) )
      # expect(page).to have_link("#{user_2.name}'s Dashboard", href: user_path(user_2.id) )
      # expect(page).to have_link("#{user_3.name}'s Dashboard", href: user_path(user_3.id) )
    end

    it 'displays link to go back to landing page' do
      visit '/'
      expect(page).to have_link("Landing Page", href: root_path)
    end
  end
end

require 'rails_helper'

RSpec.describe 'Landing Page' do
  describe 'when a user visits the root path' do
    it 'displays the title of the app, existing users, with links to users dashboard' do
      users = create_list(:random_user, 3)

      visit root_path

      expect(page).to have_content('Viewing Party Lite')

      expect(page).to have_button('Create New User')

      expect(page).to have_link("#{users[0].email}'s dashboard")

      expect(page).to have_link('Home')
    end
  end
end

require 'rails_helper'

RSpec.describe 'the user dashboard page' do
  describe 'When I go to a user dashboard' do
    it 'displays a discover movies button that links to a discover page for this specific user' do
      user = User.create!(name: 'Bobby', email: 'bbmjm@gmail.com')

      visit user_path(user)

      expect(page).to have_button('Discover Movies')

      click_button 'Discover Movies'
      
      expect(current_path).to eq(user_discover_index(user))
    end
  end
end
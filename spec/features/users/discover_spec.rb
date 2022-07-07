require 'rails_helper'

RSpec.describe 'Discover Page', type: :feature do 
  describe 'correct user id' do 
    it 'has is the same user id from the dashboard' do
      user1 = User.create!(name: 'Parker', email: 'mangaforever@hootube.net')
      user2 = User.create!(name: 'Jim', email: 'musk42@trenches.org')

      visit "/users/#{user1.id}/discover" 
      expect(page).to have_content("#{user1.name}'s Discover Page")
    end
  end
end
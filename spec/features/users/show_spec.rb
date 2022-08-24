require 'rails_helper'

RSpec.describe 'User Dashboard' do
  @users = let!(:users) { create_list(:user, 3) }

  describe 'When I visit /users/:id where :id is a valid user id' do
    it 'I should see the user names dasboard at the top of the page, a button to discover movies, and a section that lists viewing parties' do
      user1 = users[0]
      user2 = users[1]
      user3 = users[2]

      visit user_path(user1)
      
      expect(page).to have_content("#{user1.name}'s Dashboard")
      expect(page).to_not have_content("#{user2.name}'s Dashboard")
      expect(page).to have_button("Discover Movies")
      expect(page).to have_content("Viewing Parties")
    end
    
  end
end
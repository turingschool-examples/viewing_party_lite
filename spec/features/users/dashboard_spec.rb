require 'rails_helper'

RSpec.describe 'Users dashboard' do 
  describe 'when a user visits their dashboard' do
    it "displays user's name, button to discover movies, and a section to list viewing parties" do
      user = User.create!(name: 'John', email: 'john@user.com')
      user_2 = User.create!(name: 'Rick', email: 'rick@user.com')
      # When I visit '/users/:id' where :id is a valid user id,
      visit user_path(user)
      # I should see:
      # _ "<user's name>'s Dashboard" at the top of the page
      expect(page).to have_content("#{user.name}'s Dashboard")
      expect(page).to_not have_content("#{user_2.name}'s Dashboard")
      # _ A button to Discover Movies*
      expect(page).to have_button('Discover Movies')
      # _ A section that lists viewing parties**
      expect(page).to have_content('Viewing Parties:')

      # *more instructions on this in the Dashboard:Discover Movies issue.
      # **more instructions on this in the Dashboard:Viewing Parties issue.
    end

    it "will redirect to a movie discover page involving the user's id of the dashboard it came from" do
      user = User.create!(name: 'John', email: 'john@user.com')
      user_2 = User.create!(name: 'Rick', email: 'rick@user.com')
      # As a user,
      # When I go to a user dashbaord,
      visit user_path(user)
      # and click "Discover Movies" button,
      click_on('Discover Movies')
      # I am redirected to a discover page '/users/:id/discover', where :id is the user id of the user who's dashboard I was just on.
      expect(current_path).to eq(user_discover_path(user))
    end
  end
end
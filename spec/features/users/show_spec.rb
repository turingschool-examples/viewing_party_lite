require 'rails_helper'

RSpec.describe 'User Dashboard', type: :feature do
   it 'shows users names dashboard at top of page' do
      user_1 = User.create!(name: 'First User', email: 'firstuser@mail.com')
      user_2 = User.create!(name: 'Second Visitor', email: 'secondvisitor@email.com')
      
      visit "/users/#{user_1.id}"

      expect(page).to have_content(user_1.name)
      expect(page).to have_content("First User's Dashboard")
      expect(page).to_not have_content("Second Visitor's Dashboard")
   end

   it 'has a button to discover movies' do
      user_1 = User.create!(name: 'First User', email: 'firstuser@mail.com')
      visit "/users/#{user_1.id}"
      expect(page).to have_button("Discover Movies")
  end

   it 'has a section that lists viewing parties' do
      user_1 = User.create!(name: 'First User', email: 'firstuser@mail.com')
      visit "/users/#{user_1.id}"
      expect(page).to have_content("Viewing Parties")
   end
end
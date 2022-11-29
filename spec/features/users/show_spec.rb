require 'rails_helper'

RSpec.describe 'user show page' do
  describe ' When I visit /users/:id' do
    describe 'should see' do 
      it 'has user information' do 
        user1 = create(:user)
        visit "/users/#{user1.id}"
# save_and_open_page
        expect(page).to have_link("Home")
        expect(page).to have_content("Viewing Party Lite")
        expect(page).to have_content("#{user1.name}'s Dashboard")
        expect(page).to have_button("Discover Movies")
      end
    end
    
    describe 'viewing party section' do 
      it 'has a list of users viewing parties' do
        user1 = create(:user)
        viewing_party1 = user1.create
        visit "/users/#{user1.id}"


      end
  end
end

#   "<user's name>'s Dashboard" at the top of the page
# A button to Discover Movies*
# A section that lists viewing parties**
# *more instructions on this in the Dashboard:Discover Movies issue.
# **more instructions on this in the Dashboard:Viewing Parties issue.
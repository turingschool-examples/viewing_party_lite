require 'rails_helper'

RSpec.describe 'New User' do
  describe 'as a user' do
    it "I see a form to register a new user. Once the user registers they 
    should be taken to a dashboard page '/users/:id', where :id is the id 
    for the user that was just created." do
      visit '/register'

      fill_in "name", with: "Sherlock"
      fill_in "email", with: "sherlockh@sleuth.com"
      click_button 'Register User'

      expect(page).to have_content("Sherlock")
      expect(page).to have_content("sherlockh@sleuth.com")
    end
  end
end
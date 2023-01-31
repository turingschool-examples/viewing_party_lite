require 'rails_helper'

RSpec.describe "Landing Page" do
  describe "As a user when I visit the root_path" do
    it 'has the title of the application' do
      user_1 = User.create!(name: "Drew", email: "drew@drew.com")
      user_2 = User.create!(name: "Mike", email: "mike@mike.com")
      visit root_path

      expect(page).to have_content('Viewing Party')
      expect(page).to have_button('Create a New User')
      expect(page).to have_content(user_1.email)
      expect(page).to have_content(user_2.email)
      expect(page).to have_link('Home', href: root_path)

      click_link user_1.email
      expect(current_path).to eq("/users/#{user_1.id}")
      
    end
  end
end
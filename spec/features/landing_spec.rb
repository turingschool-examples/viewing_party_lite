require 'rails_helper'

RSpec.describe "Landing Page" do
  describe "As a user when I visit the root_path" do
    before :each do
      @user_1 = User.create!(name: "Drew", email: "drew@drew.com")
      @user_2 = User.create!(name: "Mike", email: "mike@mike.com")
      visit root_path
    end

    it 'has the title of the application and link to root' do
      expect(page).to have_link('Home', href: root_path)
      expect(page).to have_content('Viewing Party')
    end
    
    it "lists existing user emails with links to their dashboards" do
      expect(page).to have_link(@user_1.email, href: user_path(@user_1))
      expect(page).to have_link(@user_2.email, href: user_path(@user_2))
    end

    it 'has a button to create a new user' do
      click_button 'Create a New User'

      expect(current_path).to eq(register_path)
    end
  end
end
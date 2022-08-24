require 'rails_helper'

RSpec.describe 'landing page' do

  describe 'ALL landing page functionality' do
    it "can display the apps name" do
      visit '/'

      expect(page).to have_content('Viewing Party Lite')
    end

    it "has a button to create a new user" do
      visit '/'

      expect(page).to have_button('Create a New User')
      click_button('Create a New User')
      expect(current_path).to eq('/register')
    end

    it "displays existing user emails only" do
      user1 = User.create!(name: 'Hai Sall', email: 'shoe_eater@payless.com')
      user2 = User.create!(name: 'Sryce Bimmons', email: 'valhiemhero@hotmail.com')

      visit '/'

      expect(page).to have_content('shoe_eater@payless.com')
      expect(page).to have_content('valhiemhero@hotmail.com')
      expect(page).to_not have_content('Hai Sall')
      expect(page).to_not have_content('Sryce Bimmons')
    end

    it "links existing users to the user dashboard" do
      user1 = User.create!(name: 'Hai Sall', email: 'shoe_eater@payless.com')
      user2 = User.create!(name: 'Sryce Bimmons', email: 'valhiemhero@hotmail.com')

      visit '/'
      click_link("shoe_eater@payless.com's Dashboard")
      expect(current_path).to eq("/users/#{user1.id}")

      visit '/'
      click_link("valhiemhero@hotmail.com's Dashboard")
      expect(current_path).to eq("/users/#{user2.id}")
    end
  end
end

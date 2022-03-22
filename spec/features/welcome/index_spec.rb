require 'rails_helper'

RSpec.describe 'Landing Page' do
  describe 'has a link in header back to home page' do
    it 'has link that takes me to home page' do
      visit root_path
      expect(current_path).to eq(root_path)

      within 'div.home' do
        expect(page).to have_link("Home")
        click_on "Home"
        expect(current_path).to eq(root_path)
      end
    end
  end

  describe 'has title' do
    it "has title 'Viewing Party Light'" do
      visit root_path
      expect(current_path).to eq(root_path)

      within 'div.title' do
        expect(page).to have_content('Viewing Party Light')
      end
    end
  end

  describe 'has button to create new user' do
    it "has Create New User button that takes me to register path" do
      visit root_path
      expect(current_path).to eq(root_path)

      within 'div.new_user' do
        expect(page).to have_button('Create a New User')
        click_on 'Create a New User'
        expect(current_path).to eq(register_path)
      end
    end
  end

  describe 'lists all existing users' do
    before(:each) do
      @user1 = User.create!(name: "User 1", email: 'first_email@gmail.com' )
      @user2 = User.create!(name: "User 2", email: 'second_email@yahoo.com' )
    end

    it "has a section 'Existing Users:' which lists all users" do
      visit root_path
      expect(current_path).to eq(root_path)

      within 'div.all_users' do
        expect(page).to have_content('Existing Users:')
        save_and_open_page
        expect(page).to have_link("first_email@gmail.com's Dashboard")
        expect(page).to have_link("second_email@yahoo.com's Dashboard")
      end
    end
  end
end

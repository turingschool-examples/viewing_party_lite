require 'rails_helper'

RSpec.describe 'Landing/Home Page', type: :feature do
  before :each do
    @user_1 = User.create!(name: 'Oscar', email: 'example@gmail.com')
    @user_2 = User.create!(name: 'James', email: 'morning@gmail.com')
    visit '/'
  end

  describe 'Landing Page' do
    it 'displays title of application' do
      expect(page).to have_content('Movie Madness')
    end

    it 'has a button to create a user' do
      click_button 'New User'
      expect(current_path).to eq('/register')
    end

    it 'displays existing users and links to user dashboard' do
      expect(page).to have_content('Oscar')
      expect(page).to_not have_content('John')
      click_link 'James'
      expect(current_path).to eq("/users/#{@user_2.id}")
      expect(page).to have_content('James')
    end

    it 'has link for landing page' do
      click_link 'Home'
      expect(current_path).to eq('/')
    end

  end
end

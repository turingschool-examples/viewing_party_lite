require 'rails_helper'

RSpec.describe 'Landing Page' do
  describe 'as a logged in user' do
    before :each do
      @jose = User.create!(name: 'Jose Andres', email: 'jose.andres@gmail.com', password: '111',
                           password_confirmation: '111')
      @amy = User.create!(name: 'Amy Adams', email: 'amy.adams@gmail.com', password: '111',
                          password_confirmation: '111')
      @quincy = User.create!(name: 'Quincy Jones', email: 'quincy.jones@gmail.com', password: '111',
                             password_confirmation: '111')

      visit login_path

      within '#form' do
        fill_in :email, with: @jose.email
        fill_in :password, with: '111'
        click_on 'Sign In'
      end

      visit root_path
    end

    it 'displays the name of the app' do
      expect(page).to have_content('Viewing Party Lite')
    end

    it 'displays all current users' do
      expect(page).to have_content('jose.andres@gmail.com')
      expect(page).to have_content('amy.adams@gmail.com')
      expect(page).to have_content('quincy.jones@gmail.com')
    end
  end
end

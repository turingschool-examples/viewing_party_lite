# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'The landing page index', type: :feature do
  describe 'landing page index' do
    before :each do
      @user1 = create(:user)
      create_list(:user, 5)

      visit root_path
    end
    it 'displays the application title' do
      expect(page).to have_content('Viewing Party')
    end

    it 'displays a button to create a new user' do
      expect(page).to have_button('Create a New User')

      click_button 'Create a New User'

      expect(current_path).to eq(register_path)
    end

    it 'displays existing users which links to the users dashboard' do
      within('.users') do
        within("section#user-#{@user1.id}") do
          expect(page).to have_content(@user1.email)
        end
        expect(page).to have_selector('section', count: 6)
      end
    end

    it 'displays a home link to go back to the landing page' do
      expect(page).to have_link('Home')

      click_on 'Home'

      expect(current_path).to eq('/')
    end
  end
end

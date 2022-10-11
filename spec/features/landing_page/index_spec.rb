# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Landing Page | Index', type: :feature do
  describe 'As a user when I visit the Landing Page,' do
    before(:each) { visit root_path }
    it 'I see the title of the Applications' do
      within('#application_title') do
        expect(page).to have_content 'Viewing Party'
      end
    end
    it 'I see a button to create a new user' do
      within('#user_creation') do
        expect(page).to have_button '#create_user'
        # TODO: Create expectation clause to ensure create user button links to creation path
      end
    end
    it 'I see a list of existing users which links to each users dashboard' do
      within('#current_users') do
        within('#user-1') do
          expect(page).to have_link("jojo_binks@gmail.com's dashboard")
          expect(page).to_not have_link("dominicodonnell99@gmail.com's dashboard")
        end
        within('#user-2') do

        end
        within('#user-3') do

        end
      end
      # TODO: Create expectation clause to ensure user dashboard links to the correct user dashboard path
    end
    it 'I see a link back to the home page' do
      within('#home_page_link') do
        expect(page).to have_link('#home')
        click_on '#home'
        expect(page.current_path).to eq root_path
      end
    end
  end
end

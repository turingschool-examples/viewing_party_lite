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

  end
end

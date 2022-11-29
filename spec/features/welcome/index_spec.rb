require 'rails_helper'

RSpec.describe 'Welcome' do
  before(:each) do
    visit '/'
  end

  describe 'index' do
    it 'has a button for home' do
      expect(page).to have_link('Home')
      click_link('Home')
      expect(current_path).to eq('/')
    end

    it 'has a title' do
      expect(page).to have_content('Viewing Party Lite')
    end

    it 'has a button to create a new user' do
      expect(page).to have_button('Create a New User')
    end

    it 'has a heading for existing users' do
      expect(page).to have_content('Existing Users')
    end
  end
end

require 'rails_helper'

RSpec.describe 'Landing Page' do
  before :each do
    @sherlock = User.create!(name: 'Sherlock', email: 'sherlockh@sleuth.com')
    @watson = User.create!(name: 'Watson', email: 'watson@sleuth.com')
    visit '/'
  end

  describe 'as a user' do 
    it 'I see the title of the application' do
      expect(page).to have_content('Viewing Party')
    end

    it 'I see a button to create a new user' do
      expect(page).to have_button('Create New User')
      click_button('Create New User')
      expect(current_path).to eq('/register')
    end

    it 'I see a list of existing users' do
      within("#users") do
        expect(page).to have_content(@sherlock.name)
        expect(page).to have_content(@watson.name)
      end
    end

    it 'I see a link to the landing page' do
      expect(page).to have_link('Landing Page')
      click_link('Landing Page')
      expect(current_path).to eq('/')
    end
  end
end
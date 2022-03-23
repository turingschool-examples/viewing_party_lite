require 'rails_helper'

RSpec.describe 'landing page' do
  before(:each) do
    @user1 = User.create!(name: "Paul", email: "paul@fake.com")
    visit "/"
  end
  describe 'when user visits landing page' do
    scenario 'visitor sees title of application' do
      expect(page).to have_content('Viewing Party')
    end

    scenario 'visitor sees link to landing page' do
      click_link('Landing Page')
      expect(current_path).to eq('/')
    end

    scenario 'visitor sees a button to create a new user' do
      click_button("Create User")
      expect(current_path).to eq("/register")
    end

    scenario 'visitor sees existing users as links to their dashboard' do
      click_link("Paul")

      expect(current_path).to eq("/users/#{@user1.id}")
    end
  end
end

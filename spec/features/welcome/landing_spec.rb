require 'rails_helper'

RSpec.describe 'landing page' do
  describe 'when I visit the landing page' do
    let!(:users) { create_list(:user, 10) }
    let!(:user_1) { users.first }
    let!(:user_2) { users.last }
    let!(:random_user) { users.sample }

    before(:each) do
      visit '/'
    end

    it 'displays the title of the application' do
      expect(page).to have_content 'Viewing Party'
    end

    it 'has a button to create a new account' do
      expect(page).to have_button('Create a New Account')

      click_button 'Create a New Account'

      expect(current_path).to eq(register_path)
    end

    it 'has a button to log in' do
      expect(page).to have_button('Log In')

      click_button 'Log In'

      expect(current_path).to eq(login_path)

      fill_in 'Email', with: "#{user_1.email}"
      fill_in 'Password', with: "#{user_1.password}"

      click_button 'Log In'

      expect(current_path).to eq(dashboard_path)
    end

    it 'displays a list of all current users' do
      expect(page).to have_content(user_1.name)
      expect(page).to have_content(user_1.email)
      expect(page).to have_content(user_2.name)
      expect(page).to have_content(user_2.email)
    end

    it 'links to each users profile page' do
      visit login_path
        
      fill_in 'Email', with: "#{user_1.email}"
      fill_in 'Password', with: "#{user_1.password}"
  
      click_button 'Log In'

      visit "/"

      within "#user-#{random_user.id}" do
        click_on 'User Page'
      end
      expect(current_path).to eq(dashboard_path)
    end

    it 'links back to landing page' do
      expect(page).to have_link('Home')

      click_on 'Home'

      expect(current_path).to eq(root_path)
    end
  end
 
  describe 'As a visitor when I visit the landing page' do
    it 'does not display existing users' do
      visit '/'

      expect(page).to_not have_content('Current Users')
    end
  end

  describe 'As a logged in user' do
    let!(:users) { create_list(:user, 10) }
    let!(:user_1) { users.first }
    let!(:user_2) { users.last }
    let!(:random_user) { users.sample }
    before :each do
      visit login_path
        
      fill_in 'Email', with: "#{user_1.email}"
      fill_in 'Password', with: "#{user_1.password}"
  
      click_button 'Log In'

      visit '/'
    end

    describe 'When I visit the landing page I no longer see a link to log in or create an account' do
      it 'displays a link to log out which redirects me to the landing page and I see a log in link' do
        expect(page).to have_button("Log Out")
        expect(page).to_not have_button("Log In")
        expect(page).to_not have_button("Create a New Account")

        click_button("Log Out")

        expect(current_path).to eq('/')
        expect(page).to have_button('Log In')
      end
    end
  end
end

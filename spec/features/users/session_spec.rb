require 'rails_helper'

RSpec.describe 'User Sessions' do
  let!(:users) { create_list(:user, 3) }
  let!(:user1) { users.first }
  let!(:user2) { users.second }
  let!(:user3) { users.third }
  let!(:admin) { create(:user, role: 1) }

  before :each do
    visit root_path
  end

  feature 'User log in' do
    it 'can log in and log out' do

      fill_in :email, with: "#{user1.email}"
      fill_in :password, with: "#{user1.password}"
      click_on 'Login 🎟'

      expect(current_path).to eq(dashboard_path)
      expect(page).to have_content("Welcome #{user1.name}!")
      expect(page).to_not have_button('Login 🎟')
      expect(page).to_not have_link('Create a New User')
      expect(page).to_not have_link('Admin Dashboard')
      expect(page).to have_link('Log Out')

      click_link 'Log Out'

      expect(current_path).to eq(root_path)
      expect(page).to have_button('Login 🎟')
      expect(page).to have_link('Create a New User')
      expect(page).to_not have_link('Log Out')
      expect(page).to have_content('Existing Users:')
      expect(page).to_not have_link('Admin Dashboard')

      within "#user-#{user1.id}" do
        expect(page).to have_content("#{user1.email.gsub(/(?<=[\w\d])[\w\d]+(?=[\w\d])/, "**")}")
      end

      within "#user-#{user2.id}" do
        expect(page).to have_content("#{user2.email.gsub(/(?<=[\w\d])[\w\d]+(?=[\w\d])/, "**")}")
      end

      within "#user-#{user3.id}" do
        expect(page).to have_content("#{user3.email.gsub(/(?<=[\w\d])[\w\d]+(?=[\w\d])/, "**")}")
      end
    end

    it 'cannot visit an admin page' do
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user1)

      visit admin_dashboard_index_path

      expect(current_path).to eq(root_path)
      expect(page).to have_content('Not authorized')
    end

    it 'shows an error if password is incorrect' do

      fill_in :email, with: "#{user1.email}"
      fill_in :password, with: '12345'
      click_on 'Login 🎟'

      expect(current_path).to eq(root_path)
      expect(page).to have_content('Invalid credentials!')
    end

    it 'shows an error if user does not exist' do

      fill_in :email, with: 'ricki@trashtv.com'
      fill_in :password, with: 'password'
      click_on 'Login 🎟'

      expect(current_path).to eq(root_path)
      expect(page).to have_content('Invalid credentials!')
    end
  end

  feature 'Admin log in' do
    it 'can log in as an admin and get to admin dashboard' do

      fill_in :email, with: admin.email
      fill_in :password, with: admin.password
      click_button 'Login 🎟'

      expect(current_path).to eq(admin_dashboard_index_path)
      expect(page).to have_link('Home')
      expect(page).to have_link('My User Dashboard')

      within "#user-#{user1.id}" do
        expect(page).to have_link("#{user1.email}'s Dashboard")
      end

      within "#user-#{user2.id}" do
        expect(page).to have_link("#{user2.email}'s Dashboard")
      end

      within "#user-#{user3.id}" do
        expect(page).to have_link("#{user3.email}'s Dashboard")
      end
    end

    it 'can visit another users dashboard' do
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)

      visit admin_dashboard_index_path

      click_link "#{user1.email}'s Dashboard"

      expect(current_path).to eq(admin_dashboard_path(user1))
      expect(page).to have_content("#{user1.name}'s Dashboard")
      expect(page).to have_button('Discover Movies')
      expect(page).to have_content('Viewing Parties')
    end

    it 'can visit its own user dashboard' do
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)

      visit admin_dashboard_index_path

      click_link 'My User Dashboard'

      expect(current_path).to eq(dashboard_path)
      expect(page).to have_content("#{admin.name}'s Dashboard")
      expect(page).to have_button('Discover Movies')
      expect(page).to have_content('Viewing Parties')
    end

    it 'has a link to admin dashboard' do
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)

      visit admin_dashboard_index_path

      click_link 'Home'

      expect(current_path).to eq(root_path)
      expect(page).to have_link('Admin Dashboard')

      click_link 'Admin Dashboard'

      expect(current_path).to eq(admin_dashboard_index_path)
    end
  end
end

require 'rails_helper'

RSpec.describe "index page", type: :feature do
  let!(:user1) { User.create!(name: 'Brian', email: 'brian@test.com', password: 'password123', password_confirmation: 'password123') }
  let!(:user2) { User.create!(name: 'Peter', email: 'peter@test.com', password: 'password123', password_confirmation: 'password123') }
  let!(:user3) { User.create!(name: 'Chris', email: 'chris@test.com', password: 'password123', password_confirmation: 'password123') }
  let!(:user4) { User.create!(name: 'Meg', email: 'meg@test.com', password: 'password123', password_confirmation: 'password123') }
  let!(:user5) { User.create!(name: 'Anth', email: 'anth@test.com', password: 'password123', password_confirmation: 'password123') }
  let!(:user6) { User.create!(name: 'Thomas', email: 'thomas@test.com', password: 'password123', password_confirmation: 'password123') }

  describe 'Page Defaults' do
    it 'The title of the application' do
      visit root_path

      expect(page).to have_content("Viewing Party")
    end

    it 'has a link to landing page' do
      visit root_path

      within("#navigation") do
        expect(page).to have_link("Home", href: root_path)
      end
    end
  end

  describe "Create new user button" do
    it 'has a button to create a new user' do
      visit root_path

      expect(page).to have_button("Create New User")
    end

    it 'will load the New User Page' do
      visit root_path

      expect(current_path).to eq(root_path)

      click_button "Create New User"

      expect(current_path).to eq(register_path)
    end
  end

  describe 'the existing users area' do
    it 'has a list of existing users names' do
      visit root_path

      within("#user-list-home") do
        expect(page).to have_content(user1.email)
        expect(page).to have_content(user2.email)
        expect(page).to have_content(user3.email)
        expect(page).to have_content(user4.email)
        expect(page).to have_content(user5.email)
      end
    end

    it 'has a link to each users show page' do
      visit root_path
      
      within("#user-#{user1.id}") do
        expect(page).to have_link("#{user1.email}", href: user_path(user1))
      end

      within("#user-#{user2.id}") do
        expect(page).to have_link("#{user2.email}", href: user_path(user2))
      end

      within("#user-#{user3.id}") do
        expect(page).to have_link("#{user3.email}", href: user_path(user3))
      end
    end
  end
end
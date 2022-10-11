require 'rails_helper'

RSpec.describe 'application welcome page', type: :feature do
  describe 'As a user' do
    describe 'When I visit the root path/welcome page' do

      it 'I can see the application titlem  a button to create a new user, & a link to go back to the landing page' do

        visit root_path
        expect(page).to have_content('Viewing Party Lite')
        expect(page).to have_button('New User')
        expect(page).to have_link('Home Page')

        click_on('Home Page')
        expect(current_path).to eq(root_path)
      end

      it 'I can also see a list of existing users which links to the user dashboard & ' do
        user1 = User.create!(name: Faker::Name.name , email: Faker::Internet.email, password_digest: BCrypt::Password.create('bananaBro'))
        user2 = User.create!(name: Faker::Name.name , email: Faker::Internet.email, password_digest: BCrypt::Password.create('Ilovecode'))
        user3 = User.create!(name: Faker::Name.name , email: Faker::Internet.email, password_digest: BCrypt::Password.create('IlovecOde2!'))
        user4 = create(:user, password_digest:BCrypt::Password.create('IlovecOde2!'))
        
        visit root_path
        within('#all_users') do
          expect(page).to have_content("#{user1.email}")
          expect(page).to have_content("#{user2.email}")
          expect(page).to have_content("#{user3.email}")
          expect(page).to have_content("#{user4.email}")
        end
      end

      it 'The register a new user button should lead to the registration page' do
        visit root_path

        click_on('New User')
        expect(current_path).to eq('/register')
      end

    end
  end
end
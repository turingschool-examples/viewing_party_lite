require 'rails_helper'

RSpec.describe 'application welcome page', type: :feature do
  describe 'As a user' do
    describe 'When I visit the root path/welcome page' do

      it 'I can see the application titlem  a button to create a new user, & a link to go back to the landing page' do
        #button should link to  '/register' 

        visit root_path
        expect(page).to have_content('Viewing Party Lite')
        expect(page).to have_button('New User')
        expect(page).to have_link('Home Page')

        click_on('Home Page')
        expect(current_path).to eq(root_path)
      end

      it 'I can also see a list of existing users which links to the user dashboard & ' do
        visit root_path
        #make users
        expect(page).to have_content('alaina.movies@gmail.com')
        expect(page).to have_content('gavin.movies@gmail.com')
        expect(page).to have_content('alyssa.movies@gmail.com')
        expect(page).to have_content('alyssa.movies@gmail.com')
      end

      it 'The register a new user button should lead to the registration page' do
        visit root_path
        click_on('New User')
        expect(current_path).to eq('/registration')
      end

    end
  end
end
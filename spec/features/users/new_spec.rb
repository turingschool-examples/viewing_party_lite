require 'rails_helper'

RSpec.describe "user registration page" do
  describe 'as a user' do
    describe 'when a user visits the /register path' do 
      it 'should should see a form to fill out a new user' do 
        visit '/register'
        expect(page).to have_content("Name")
        expect(page).to have_field(:name)
        expect(page).to have_content("Email")
        expect(page).to have_field(:email)
        expect(page).to have_button("Create New User")
        expect(page).to have_link("Home")
        expect(page).to have_content("Viewing Party Lite")
      end
    end
    describe 'when i fill in form with a valid name and email and click create new user' do 
      it 'I am redirected to the user show page' do 
        visit '/register'
        
        fill_in :name, with: 'kristen'
        fill_in :email, with: 'kn@gmail.com'
        
        click_on 'Create New User'
        save_and_open_page

        expect(current_path).to eq("/users/#{User.last.id}")

      end
    end
  end
  
end
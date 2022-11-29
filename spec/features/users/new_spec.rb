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
        

        expect(current_path).to eq("/users/#{User.last.id}")

      end
    end

    describe 'sad path testing' do 
      describe 'when I fill in invalid name' do 
        it 'I am redirected to the registration page and see error message' do 
          visit '/register'
          
          fill_in :name, with: ''
          fill_in :email, with: 'kn@gmail.com'
          
          click_on 'Create New User'
          
          expect(page).to have_content("ERROR: Please enter a valid name")
          expect(current_path).to eq("/register")

        end
      end

      describe 'when I fill in invalid email' do 
        it 'I am redirected to the registration page and see error message' do 
          visit '/register'
          
          fill_in :name, with: 'Kristen'
          fill_in :email, with: ''
          
          click_on 'Create New User'
          
          expect(page).to have_content("ERROR: Please enter a valid email")
          expect(current_path).to eq("/register")

        end
      end

      describe 'when I fill in invalid name and email' do 
        it 'I am redirected to the registration page and see error message' do 
          visit '/register'
          
          fill_in :name, with: ''
          fill_in :email, with: ''
          
          click_on 'Create New User'
          expect(page).to have_content("ERROR: Please enter a valid name and email")
          expect(current_path).to eq("/register")
          
        end
      end
      
      describe 'when I fill in a non-unique email' do 
        it 'I am redirected to the registration page and see error message' do 
          user = User.create!(name: 'Eli', email: 'eli@gmail.com')
          visit '/register'
          
          fill_in :name, with: 'Eli F'
          fill_in :email, with: 'eli@gmail.com'
          
          click_on 'Create New User'
          
          expect(page).to have_content("ERROR: Email already in use. Please enter a different email")
          expect(current_path).to eq("/register")
          
        end
      end
    end
  end
  
end
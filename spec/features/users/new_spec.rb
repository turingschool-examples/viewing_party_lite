require 'rails_helper' 

RSpec.describe 'User Registration Page', type: :feature do 
  before :each do 
    visit '/register'
  end

  describe 'user registration form - happy path' do 
    it 'displays a form to fill in users name and email. Once created user is taken to their dashdoard page' do 

      fill_in('Name', with: 'River')
      fill_in('Email', with: 'river@gmail.com')

      click_button 'Create New User'

      # expect(current_path).to eq(user_path)
      expect(User.last.name).to eq('River')
    end
  end

  describe 'user registration form - sad path' do
    xit 'can only create a user if all form fields are filled out' do 

      fill_in('Name', with: "")
      fill_in('Email', with: "")

      click_button 'Create New User'

      expect(current_path).to eq('/register')
      expect(page).to have_content('User was not created')
      expect(User.count).to eq(0)
    end

    xit 'can only create a new user when the email is unique' do 
      create(:user, name: "River", email: "river@gmail.com")

      fill_in('Name', with: "Moose")
      fill_in('Email', with: "river@gmail.com")
      click_button 'Create New User'

      expect(current_path).to eq('/register')
      expect(page).to have_content('User was not created')
      expect(User.count).to eq(1)
    end
  end
end
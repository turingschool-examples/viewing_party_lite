require 'rails_helper' 

RSpec.describe 'User Registration Page', type: :feature do 
  before :each do 
    visit '/register'
  end

  describe 'user registration form - happy path' do 
    it 'displays a form to fill in users name and unique email. Once created user is taken to their dashdoard page' do 

      fill_in('Name', with: 'River')
      fill_in('Email', with: 'river@gmail.com')
      fill_in('Password', with: 'password123')
      fill_in('Password Confirmation', with: 'password123')

      click_button 'Create New User'

      user = User.last
      expect(current_path).to eq(user_path(user))
      expect(User.last.name).to eq('River')
    end
  end

  describe 'user registration form - sad path' do
    it 'can only create a user if all form fields are filled out' do 

      fill_in('Name', with: "")
      fill_in('Email', with: "")
      
      click_button 'Create New User'

      expect(current_path).to eq('/register')
      expect(page).to have_content("Name can't be blank, Password can't be blank, and Email can't be blank")
      expect(User.count).to eq(0)
    end

    it 'can only create a user if all form fields are filled out - password' do 

      fill_in('Name', with: "River")
      fill_in('Email', with: "River@gmail.com")
      fill_in('Password', with: '')
      fill_in('Password Confirmation', with: '')

      click_button 'Create New User'

      expect(current_path).to eq('/register')
      expect(page).to have_content("Password can't be blank")
      expect(User.count).to eq(0)
    end

    it 'can only create a user if all form fields are filled out - password confirmation' do 

      fill_in('Name', with: "River")
      fill_in('Email', with: "River@gmail.com")
      fill_in('Password', with: 'test123')
      fill_in('Password Confirmation', with: '')

      click_button 'Create New User'

      expect(current_path).to eq('/register')
      expect(page).to have_content("Password confirmation doesn't match Password")
      expect(User.count).to eq(0)
    end

    it 'can only create a user if password and password confirmation match' do 

      fill_in('Name', with: "River")
      fill_in('Email', with: "River@gmail.com")
      fill_in('Password', with: 'test123')
      fill_in('Password Confirmation', with: 'test1')

      click_button 'Create New User'

      expect(current_path).to eq('/register')
      expect(page).to have_content("Password confirmation doesn't match Password")
      expect(User.count).to eq(0)
    end

    it 'can only create a new user when the email is unique' do 
      create(:user, name: "River", email: "river@gmail.com", password: 'test123', password_confirmation: 'test123')

      fill_in('Name', with: "Moose")
      fill_in('Email', with: "river@gmail.com")
      fill_in('Password', with: 'password123')
      fill_in('Password Confirmation', with: 'password123')

      click_button 'Create New User'

      expect(current_path).to eq('/register')
      expect(page).to have_content('User was not created')
      expect(User.count).to eq(1)
    end
  end
end
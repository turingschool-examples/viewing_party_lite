require 'rails_helper'

RSpec.describe 'user registration page' do
  before :each do
    visit register_path
  end
  
  describe 'initial tests' do
    it 'has a form to create a new user' do
      User.delete_all
      
      expect(page).to have_field('Name')
      expect(page).to have_field('Email')
      expect(page).to have_button('Submit')
    end
    
    it 'can be filled in and submitted' do
      fill_in('Name', with: 'Jeff Goldblum')
      fill_in('Email', with: 'JurassicSnark@gmail.com')
      click_on 'Submit'
      
      expect(current_path).to eq(user_path(User.last.id))
      
      expect(page).to have_content('Jeff Goldblum')
      expect(page).to have_content('User has been created!')
    end
    
    it 'returns an error if the email has an existing user' do
      fill_in('Name', with: 'Jeff Goldblum')
      fill_in('Email', with: 'JurassicSnark@gmail.com')
      click_on 'Submit'
      visit register_path
      
      fill_in('Name', with: 'John Doe')
      fill_in('Email', with: 'JurassicSnark@gmail.com')
      click_on 'Submit'
      
      expect(current_path).to eq(register_path)
      expect(page).to have_content('Cannot use existing email')
    end
  end
end

require 'rails_helper'

RSpec.describe 'the register page' do
  describe 'When I visit /register' do
    describe 'I see a form to fill in name/email/password/password confirmation' do
      it 'displays a form to register as a user' do
        visit register_path

        fill_in 'Name', with: 'Vivian'
        fill_in 'Email', with: 'viv1234@gmail.com'
        fill_in 'Password', with: 'passwordtest'
        fill_in 'Confirm password', with: 'passwordtest'

        click_button 'Register'

        expect(current_path).to eq(dashboard_path)
      end

      it 'redirects to the register page if an email is not unique' do
        visit register_path
    
        fill_in 'Name', with: 'Vivian'
        fill_in 'Email', with: 'viv1234@gmail.com'
        fill_in 'Password', with: 'passwordtest'
        fill_in 'Confirm password', with: 'passwordtest'
    
        click_button 'Register'
    
        visit register_path
    
        fill_in 'Name', with: 'V'
        fill_in 'Email', with: 'viv1234@gmail.com'
        fill_in 'Password', with: 'passwordtest'
        fill_in 'Confirm password', with: 'passwordtest'
    
        click_button 'Register'
    
        expect(current_path).to eq(register_path)
        expect(page).to have_content('Error: Email has already been taken')
      end
      
      it 'redirects to the register page if email/password is not filled in' do
        visit register_path

        fill_in 'Name', with: 'Vivian'
        click_button 'Register'

        expect(current_path).to eq(register_path)
        expect(page).to have_content("Error: Email can't be blank")
      end

      it 'redirects to the register page if the passwords do not match' do
        visit register_path

        fill_in 'Name', with: 'Viv'
        fill_in 'Email', with: 'viv1234@gmail.com'
        fill_in 'Password', with: 'test123'
        fill_in 'Confirm password', with: 'test'

        click_button 'Register'

        expect(current_path).to eq(register_path)
        expect(page).to have_content("Error: Password confirmation doesn't match Password")
      end
    end
  end
end
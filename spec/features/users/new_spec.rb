require 'rails_helper'

RSpec.describe 'user registration page' do
   it 'can visit the register path' do
      visit register_path

      expect(current_path).to eq(register_path)
  end

   it 'has a form to register with name and email, submit with register button' do
      visit register_path

      fill_in 'user[name]', with: "Nancy"
      fill_in 'user[email]', with: "nancydrew@email.com"

      click_button 'Create New User'

      user = User.last
   end
end
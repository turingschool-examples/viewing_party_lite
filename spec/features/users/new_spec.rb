require 'rails_helper' 

RSpec.describe 'Register User Page', type: :feature do 
  describe 'When a user visits the /register path' do 
    it 'shows a form to register with a name, unique email, and a register button' do
      visit '/register' 

      fill_in 'Name', with: ''
      fill_in 'Email', with: '1234' 
      click_button 'Register User' 

      expect(current_path).to eq '/register'
    end
  end
end
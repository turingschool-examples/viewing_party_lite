require 'rails_helper' 

RSpec.describe 'Register User Page', type: :feature do 
  describe 'When a user visits the /register path' do 
    it 'shows a form to register with a name, unique email, and a register button' do
      visit '/register' 

      fill_in 'Name', with: ''
      fill_in 'Email', with: '1234' 
      click_button 'Register User' 

      expect(current_path).to eq '/register'
      expect(page).to have_content 'Error'

      fill_in 'Name', with: 'Sally Smith'
      fill_in 'Email', with: 'sallysmith@gmail.com' 
      click_button 'Register User'

      sally = User.all.last
      expect(current_path).to eq user_path(sally.id)
    end
  end
end
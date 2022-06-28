require 'rails_helper'

RSpec.describe "register page" do 
    it  'has a page to register' do 

        visit '/register'
        
        fill_in "name",	with: "Rupert" 
        fill_in "email",	with: "rupert@gmail.com" 
        click_button 'Register'
        
        rup = User.first
        expect(current_path).to eq("/users/#{rup.id}")
        expect(page).to have_content("Rupert's Dashboard")
    end

end
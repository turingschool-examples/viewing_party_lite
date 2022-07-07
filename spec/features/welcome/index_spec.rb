require 'rails_helper'

RSpec.describe 'Welcome Index' do 
  describe 'landing page' do
    it 'has the title of the application' do 
      visit root_path

      expect(page).to have_content('Viewing Party Lite')
    end 

    xit 'has a button to create a new user' do 
      visit root_path

      expect(page).to have_button('Create a New User')
    end

    xit 'has a list of existing users which links to the users dashboard' do 
      user1 = User.create!(name: 'Deannah', email: 'rockyhorrorfan@gmail.com')
      user2 = User.create!(name: 'Sai', email: 'movieluvr55@hotmail.com')

      visit root_path

      expect(page).to have_link "#{user1.name}"
      expect(page).to have_link "#{user2.name}"

        within "#user-#{user1.id}" do 
          click_link "#{user1.name}"
        end
      expect(current_path).to eq("/users/#{user1.id}")
    end

    xit 'has a link to go back to the landing page' do 
      visit root_path

      click_link "Home"
      expect(current_path).to eq(root_path)
    end
  end
end
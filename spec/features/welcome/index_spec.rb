require 'rails_helper'

RSpec.describe 'welcome page', type: :feature do 
   it 'user visits welcome page' do 
      visit '/'

      expect(page).to have_content("Viewing Party Lite")
   end 

   it 'has a create new user button' do 
      visit '/'

      expect(page).to have_button("New User")
   end 

   it 'lists existing users' do 
      user1 = User.create(name: "Asil Rolyat", email: "asil.rolyat@yourmom.com")
      user2 = User.create(name: "Mas Htims", email: "mas.htims@whoisyourdaddy.com")
      user3 = User.create(name: "Ekalb Yespmed", email: "ekalb.yespmed@pupsandsuds.com")
      visit '/'

      expect(page).to have_content(user1.email)
      expect(page).to have_content(user2.email)
      expect(page).to have_content(user3.email)
   end 
end
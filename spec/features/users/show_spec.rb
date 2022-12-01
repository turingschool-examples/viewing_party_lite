require 'rails_helper'

RSpec.describe 'user dashboard page' do
   it 'see users name at top' do
      visit register_path

      fill_in 'user[name]', with: "Nancy"
      fill_in 'user[email]', with: "nancydrew@email.com"

      click_button 'Create New User'

      user = User.last

      expect(current_path).to eq(user_path(user.id))
      expect(page).to have_content("Nancy's Dashboard")
   end

   it 'has a button to Discover Movies' do
      user = User.create!(name: "Nancy", email: "nancydrew@email.com")

      visit user_path(user.id)
      expect(page).to have_content("Discover Movies")

      click_link "Discover Movies"
      expect(current_path).to eq(user_discover_index_path(user.id))
   end

   it 'has a section for Viewing Parties' do
      user = User.create!(name: "Nancy", email: "nancydrew@email.com")

      visit user_path(user.id)
      expect(page).to have_content("Viewing Parties")
   end
end
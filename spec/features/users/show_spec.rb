require 'rails_helper'

RSpec.describe 'user dashboard page' do
   it 'redirects to dashboard path' do
      visit register_path

      fill_in 'user[name]', with: "Nancy"
      fill_in 'user[email]', with: "nancydrew@email.com"

      click_button 'Create New User'

      user = User.last

      expect(current_path).to eq(user_path(user.id))
      expect(page).to have_content("Nancy's Dashboard")
   end
end
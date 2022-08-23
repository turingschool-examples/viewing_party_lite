require 'rails_helper'

RSpec.describe 'discover movies page', type: :feature do
   it 'has title' do
      user = User.create!(name: "Nancy", email: "nancydrew@email.com")

      visit user_path(user.id)
      expect(page).to have_content("Discover Movies")

      click_link "Discover Movies"
      expect(current_path).to eq(user_discover_index_path(user.id))
   end
end
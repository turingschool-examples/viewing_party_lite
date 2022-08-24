require 'rails_helper'

RSpec.describe 'Movies Page', type: :feature do
   it 'shows top rated movies' do
      user = User.create!(name: "Nancy", email: "nancydrew@email.com")

      visit "/users/#{user.id}/discover"

      click_button('Discover Top Rated Movies')

      expect(page).to have_content("The Shawshank Redemption")
   end
   # click_link 'Search'
   # expect(current_path).to eq("/users/:user_id/movies?q=keyword")
end
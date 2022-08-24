require 'rails_helper'

RSpec.describe 'Movies Page', type: :feature do
   it 'shows top rated movies' do
      user = User.create!(name: "Nancy", email: "nancydrew@email.com")

      visit "/users/#{user.id}/discover"

      click_button('Discover Top Rated Movies')

      expect(page).to have_content("The Shawshank Redemption")
      expect(page).to have_content("Average Review Score: 8.7")
   end
end
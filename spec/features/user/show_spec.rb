require 'rails_helper'

RSpec.describe 'The User Show Page', type: :feature do
  describe 'dashboard' do
    it 'has the users name in the title' do
      user = User.create!(name: "Rand", email: "randalthor@gmail.com")

      visit "/users/#{user.id}"
      # save_and_open_page
      expect(page).to have_content("Viewing Party Lite")
      expect(page).to have_content("#{user.name}'s Dashboard")
    end

    it 'has a button to discover movies'

    it 'has a section that lists viewing parties'
  end
end

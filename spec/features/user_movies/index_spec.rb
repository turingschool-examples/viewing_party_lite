require 'rails_helper'

RSpec.describe "The User Movies Index page" do
  describe 'top rated movies' do
    it 'has a list of top rated movies', :vcr do
      oakley = User.create!(name: "Oakley", email: "good_dog@gmail.com")

      visit "/users/#{oakley.id}/movies?q=top%20rated"

      expect(page).to have_content("Viewing Party Lite")
      expect(page).to have_content("Top Rated Movies")
      expect(page).to have_content("Vote Average:")
    end
  end
end

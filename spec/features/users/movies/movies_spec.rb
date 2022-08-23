require 'rails_helper'

RSpec.describe 'Movies Search' do
  describe 'happy path' do
    it 'allows user to search for movies', :vcr do
        user = User.create!(first_name: "Homer", last_name: "Simpson", email:"name@test.com", created_at: Time.now, updated_at: Time.now)

        visit "/users/#{user.id}/discover"

        fill_in :search, with: 'Pulp Fiction'
        click_button 'Search'

        expect(page.status_code).to eq 200
        expect(page).to have_content("Title: Pulp Fiction")
        expect(page).to have_content("Vote Average: 8.5")
        expect(page).to have_selector(".movies", count: 6)
    end
  end
end
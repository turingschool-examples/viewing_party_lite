require 'rails_helper'

RSpec.describe 'Movies Display Page' do
  describe 'search function' do
    it 'allows user to search for movies', :vcr do
        user = User.create!(first_name: "Homer", last_name: "Simpson", email:"name@test.com", created_at: Time.now, updated_at: Time.now)

        visit "/users/#{user.id}/discover"

        fill_in :search, with: 'Pulp Fiction'
        click_button 'Search'

        expect(page.status_code).to eq 200
        expect(page).to have_content("Title: Pulp Fiction")
        expect(page).to have_content("Vote Average: 8.5")
        expect(page).to have_selector(".movie", count: 6)
    end
  end

  describe 'top movies function' do
    it 'allows user to view top rated movies', :vcr do
        user = User.create!(first_name: "Homer", last_name: "Simpson", email:"name@test.com", created_at: Time.now, updated_at: Time.now)

        visit "/users/#{user.id}/discover"

        click_button("Discover Top Rated Movies")

        expect(page.status_code).to eq 200

         within ("#movies") do 
            expect(page.all('.movie')[0]).to have_content("The Shawshank Redemption")
            expect(page.all('.movie')[0]).to have_content("Vote Average: 8.7")
            expect(page.all('.movie')[1]).to have_content("Dilwale Dulhania Le Jayenge")
            expect(page.all('.movie')[1]).to have_content("Vote Average: 8.7")
        end 

        expect(page).to have_selector(".movie", count: 40)
    end
  end
end
require 'rails_helper'

RSpec.describe 'a users movies show page', type: :feature do
  describe 'As a user once I am logged in' do
    describe 'When I have already searched for a movie & see the list of results' do

      it 'I can click on one movie result link and be taken to that movies details page', :vcr do
        user = create(:user)
        visit "/users/#{user.id}/discover"
        fill_in('Search by Movie Title', with: 'fight')
        click_button('Search by Movie Title')

        click_link('Fight Club') 
        expect(current_path).to eq("/users/#{user.id}/movies/550")

      end

      it 'I can see a button to create a viewing party &  a button to return to the discover page which takes you back to the discover page', :vcr do
        user = create(:user)
        visit "/users/#{user.id}/movies/550"

        expect(page).to have_button('Create a Viewing Party')
        expect(page).to have_button('Return to Discover Page')
        click_button('Return to Discover Page')
        expect(current_path).to eq("/users/#{user.id}/discover") 
      end

      it 'The viewing party button should take the user to a new viewing party page', :vcr do

        user = create(:user)
        visit "/users/#{user.id}/movies/550"
        click_button('Create a Viewing Party')

        expect(current_path).to eq("/users/#{user.id}/movies/550/viewing-party/new")
      end

      it 'has the movie attributes on the movie show page', :vcr do
        user = create(:user)
        visit "/users/#{user.id}/movies/550"
        expect(page).to have_content('Fight Club')
        expect(page).to have_content('2:19')
        expect(page).to have_content(8.433)
        expect(page).to have_content("A ticking-time-bomb insomniac")
        expect(page).to have_content("Drama")
      end

      it 'has the movie total review count, reviewed information, and top 10 cast members for the movie', :vcr do
        user = create(:user)
        visit "/users/#{user.id}/movies/550"

        expect(page).to have_content("Review Count: 7")
        expect(page).to have_content("Brett Pascoe") #author
        expect(page).to have_content("In my top 5 of all time favourite movies. Great story line and a movie you can watch over and over again.") #content

        expect(page).to have_content("Edward Norton")
        expect(page).to have_content("Brad Pitt")
        expect(page).to have_content("Helena Bonham Carter")
        expect(page).to have_content("Meat Loaf")
        expect(page).to have_content("Jared Leto")
        expect(page).to have_content("Zach Grenier")
        expect(page).to have_content("Holt McCallany")
        expect(page).to have_content("Eion Bailey")
        expect(page).to have_content("Eion Bailey")
        expect(page).to have_content("Richmond Arquette")
        expect(page).to have_content("David Andrews")

      end

    end
  end
end
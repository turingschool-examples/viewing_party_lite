require 'rails_helper'

RSpec.describe 'Discover Movies Page' do 
    context "When I visit the 'users/:id/discover path,
    where the :id is the id of a valid user" do 
        before :each do
            @user1 = User.create!(name: 'Jared', email: 'jared@example.com')
            visit "users/#{@user1.id}/discover"
        end

        it 'I see a button to discover top rated movies' do
            expect(page).to have_button("Discover Top Rated Movies")
        end

        it 'and when the user clicks on the discover top rated movies button
        they should be taken to the movie results page' do
            click_button("Discover Top Rated Movies")
            expect(current_path).to eq("/users/#{@user1.id}/movies")
        end

        it 'I see a text field to enter keyword(s) to search by movie title' do
            expect(page).to have_field("search")
        end

        it 'I see a button to search by movie title' do 
            expect(page).to have_button("Search by Movie Title")
        end

        it 'and when the user clicks on the search button
        they should be taken to the movie results page' do
            click_button('Search by Movie Title')
            expect(current_path).to eq("/users/#{@user1.id}/movies")
        end
    end
end
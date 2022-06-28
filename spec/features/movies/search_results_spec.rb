require 'rails_helper'

RSpec.describe 'Search Results page ' do 
   it 'returns the search results of a single word search' do 
        user = User.create!(name: "will", email: "will@g.com")
        visit "/users/#{user.id}/discover"
        fill_in "search",	with: "Batman"
        click_button 'Search'
        expect(current_path).to eq('/movies/search_results')
        expect(page).to have_content("Batman Begins")
   end

   it 'returns the results from a multi word search' do 
        user = User.create!(name: "will", email: "will@g.com")
        visit "/users/#{user.id}/discover"
        fill_in "search",	with: "Mad Max"
        click_button 'Search'
        expect(current_path).to eq('/movies/search_results')
        expect(page).to have_content("Mad Max")
   end
end
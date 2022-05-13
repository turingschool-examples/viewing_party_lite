require 'rails_helper'

RSpec.describe 'discover page' do
    it 'has a top rated movies link' do
        user = User.create!(name: "will", email: "will@g.com")
        visit "/users/#{user.id}/discover"
        click_button 'Top Movies'
        expect(current_path).to eq('/movies/top_movies')
        expect(page).to have_content("Top Movies")
        expect(page).to have_content("Shawshank Redemption - With an average rating of: 8.7")
        expect(page).to_not have_content("Fight Club")
        click_button 'Return to Discover Page'
        expect(current_path).to eq("/users/#{user.id}/discover")
    end

    # it 'has a search field to find a movie' do
    #     user = User.create!(name: "will", email: "will@g.com")
    #     visit "/users/#{user.id}/discover"
    #     fill_in "search",	with: "Batman"
    #     click_button 'Search'
    #     expect(current_path).to eq('/movies/search_results')
    #     expect(page).to have_content("Batman Begins")
    #     expect(page).to have_content("The Batman")
    #     expect(page).to_not have_content("Moneyball")
    # end
    # it 'previous search results dont effect new search results' do
    #     user = User.create!(name: "will", email: "will@g.com")
    #     visit "/users/#{user.id}/discover"
    #     fill_in "search",	with: "Batman"
    #     click_button 'Search'
    #
    #     expect(current_path).to eq('/movies/search_results')
    #     expect(page).to have_content("Batman Begins")
    #     expect(page).to_not have_content("Moneyball")
    #
    #     click_button 'Return to Discover Page'
    #     expect(current_path).to eq("/users/#{user.id}/discover")
    #
    #     fill_in "search",	with: "Moneyball"
    #     click_button 'Search'
    #
    #     expect(current_path).to eq('/movies/search_results')
    #     expect(page).to_not have_content("Batman Begins")
    #     expect(page).to have_content("Moneyball")
    # end
end

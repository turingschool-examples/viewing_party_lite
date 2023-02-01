require 'rails_helper'

RSpec.describe 'discover page', type: :feature do
  let!(:u1) { create(:user) }

  describe "when I visit '/users/:id/discover', it" do
    it 'displays the results of my discover top rated button' do
      WebMock.allow_net_connect!
      movies = { 'The Godfather' => 8.7,
                 'The Shawshank Redemption' => 8.7,
                 'The Godfather Part II' => 8.6,
                 'Puss in Boots: The Last Wish' => 8.6,
                 "Schindler's List" => 8.6,
                 'Dilwale Dulhania Le Jayenge' => 8.6,
                 'Spirited Away' => 8.5,
                 '12 Angry Men' => 8.5,
                 'Your Name.' => 8.5,
                 'Parasite' => 8.5,
                 'The Green Mile' => 8.5,
                 'The Dark Knight' => 8.5,
                 'Pulp Fiction' => 8.5,
                 'The Good, the Bad and the Ugly' => 8.5,
                 'Forrest Gump' => 8.5,
                 'Dou kyu sei – Classmates' => 8.5,
                 "Gabriel's Inferno" => 8.5,
                 'The Lord of the Rings: The Return of the King' => 8.5,
                 'GoodFellas' => 8.5,
                 'Teen Wolf: The Movie' => 8.4 }
      visit discover_user_path(u1)

      click_button 'Discover Top Rated Movies'

      movies.each_with_index do |m, index|
        within "#movie-#{index}" do
          expect(page).to have_content(m[0])
          expect(page).to have_content("Vote Average: #{m[1]}")
        end
      end
    end

    it 'displays the results of my title search'
  end
end

require 'rails_helper'

RSpec.describe 'discover page', type: :feature do
  let!(:u1) { create(:user) }
  let(:top) do
    { 'The Godfather' => 8.7,
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
  end

  let(:search) do
    { 'Alien Sniperess' => 3.9,
      'Alien' => 8.1,
      'Alien: Covenant' => 6.1,
      'Alien³' => 6.4,
      'Alien Abduction' => 5.8,
      'Alien Resurrection' => 6.1,
      'AVP: Alien vs. Predator' => 5.9,
      'Alien Outpost' => 5.3,
      'Alien 2: On Earth' => 3.1,
      'Alien Warfare' => 4.1,
      'Ben 10 Alien Swarm' => 6.3,
      'Alien Autopsy' => 5.6,
      'Alien Outbreak' => 3.9,
      'Alien Xmas' => 6.6,
      'Alien Nation' => 6.1,
      'Alien Hunter' => 5.2,
      'Alien Tornado' => 4.2,
      'Alien Raiders' => 5.3,
      'Alien Overlords' => 4,
      'Alien Trespass' => 5.2 }
  end

  describe "when I visit '/users/:id/discover', it" do
    it 'displays the results of my discover top rated button' do
      stub_request(:get, 'https://api.themoviedb.org/3/movie/top_rated?api_key=c4d6d86f378d33bacc04481f7e6380b2&language=en')
        .to_return(status: 200,
                   body: File.read('spec/fixtures/tmdb_top_response.json'),
                   headers: {})

      visit discover_user_path(u1)

      click_button 'Discover Top Rated Movies'
      
      within '#results' do
        expect(all('tr').count).to be <= 20
        top.each_with_index do |m, index|
          within "#movie-#{index}" do
            expect(page).to have_content(m[0])
            expect(page).to have_content("Vote Average: #{m[1]}")
          end
        end
      end
    end

    it 'displays the results of my title search' do
      stub_request(:get, 'https://api.themoviedb.org/3/search/movie?api_key=c4d6d86f378d33bacc04481f7e6380b2&language=en&query=Alien')
        .to_return(status: 200,
                   body: File.read('spec/fixtures/tmdb_search_title_response.json'),
                   headers: {})

      visit discover_user_path(u1)

      fill_in 'title',	with: 'Alien'

      click_button 'Search By Movie Title'

      within '#results' do
        expect(all('tr').count).to be <= 20
        search.each_with_index do |m, index|
          within "#movie-#{index}" do
            expect(page).to have_content(m[0])
            expect(page).to have_content("Vote Average: #{m[1]}")
          end
        end
      end
    end
  end
end

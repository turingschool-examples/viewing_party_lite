require 'rails_helper'

RSpec.describe "Movies Results Page" do
  before :each do
    @user = User.create!(name: "John Cena", email: "johnc@email.com")
  end

  describe 'Top Rated Movies functionality' do
    before :each do
      json_response = File.read('spec/fixtures/top_rated_movies.json')

      stub_request(:get, "https://api.themoviedb.org/3/movie/top_rated?api_key=5b03ee47af6e087159e9baca0f110161")
        .to_return(status: 200, body: json_response, headers: {})
      
      visit user_discover_index_path(@user)
      click_button "Top Rated Movies"
    end
    
    it 'The discover movie page top rated movies redirects to the movie results page showing top rated movies' do
      expect(page).to have_content("Title: The Godfather\nVote Average: 8.7\nTitle: The Shawshank Redemption\nVote Average: 8.7\nTitle: The Godfather Part II\nVote Average: 8.6\nTitle: Puss in Boots: The Last Wish\nVote Average: 8.6\nTitle: Dilwale Dulhania Le Jayenge\nVote Average: 8.6\nTitle: Schindler's List\nVote Average: 8.6\nTitle: Spirited Away\nVote Average: 8.5\nTitle: 12 Angry Men\nVote Average: 8.5\nTitle: Your Name.\nVote Average: 8.5\nTitle: Parasite\nVote Average: 8.5\nTitle: The Green Mile\nVote Average: 8.5\nTitle: The Dark Knight\nVote Average: 8.5\nTitle: Pulp Fiction\nVote Average: 8.5\nTitle: The Good, the Bad and the Ugly\nVote Average: 8.5\nTitle: Forrest Gump\nVote Average: 8.5\nTitle: Dou kyu sei – Classmates\nVote Average: 8.5\nTitle: Gabriel's Inferno\nVote Average: 8.5\nTitle: The Lord of the Rings: The Return of the King\nVote Average: 8.5\nTitle: GoodFellas\nVote Average: 8.5\nTitle: Gabriel's Inferno: Part II\nVote Average: 8.5")
    end

    it 'Movie titles are links to their show page' do
      within "div#movie_238" do
        expect(page).to have_link("The Godfather", href: user_movie_path(@user, "238"))
      end
    end
  end

  describe 'Search Movies functionality' do
    before :each do
      json_response = File.read('spec/fixtures/fight_movies.json')

      stub_request(:get, "https://api.themoviedb.org/3/search/movie?api_key=5b03ee47af6e087159e9baca0f110161&query=Fight")
        .to_return(status: 200, body: json_response, headers: {})
      
      visit user_discover_index_path(@user)
      fill_in :movie_search, with: "Fight"
      click_button "Search"
    end
    
    it 'The discover movie page search bar redirects to the movie results page showing matching results' do
      expect(page).to have_content("Title: Fight Club\nVote Average: 8.4\nTitle: GCW Fight Club\nVote Average: 0\nTitle: Fight Club: Members Only\nVote Average: 3.4\nTitle: Lure: Teen Fight Club\nVote Average: 5.4\nTitle: Insane Fight Club\nVote Average: 0\nTitle: Musangwe: Fight Club\nVote Average: 6.3\nTitle: Girls Fight Club\nVote Average: 0\nTitle: Insane Fight Club II - This Time It’s Personal\nVote Average: 0\nTitle: Jurassic Fight Club\nVote Average: 6.7\nTitle: Florence Fight Club\nVote Average: 0\nTitle: Fight Club Rush 11\nVote Average: 0\nTitle: Leopard Fight Club\nVote Average: 0\nTitle: Superhero Fight Club\nVote Average: 6.8\nTitle: GCW: Fight Club Houston\nVote Average: 0\nTitle: Superhero Fight Club 2.0\nVote Average: 6.5\nTitle: Fight Club Rush 12\nVote Average: 0\nTitle: Fight Club Rush 10\nVote Average: 0\nTitle: Fight club camp kusse\nVote Average: 0\nTitle: Comedy Fight Club Live\nVote Average: 0\nTitle: GCW: Fight Club 2 Houston\nVote Average: 0")
    end

    it 'Movie titles are links to their show page' do
      within "div#movie_550" do
        expect(page).to have_link("Fight Club", href: user_movie_path(@user, "550"))
      end
    end
  end
end
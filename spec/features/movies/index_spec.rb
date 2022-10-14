require 'rails_helper'

RSpec.describe 'Movie Index' do
  before(:each) do
    @user = User.create!(name: 'John', email: 'john@user.com')
  end

  describe 'Top Rated Movies' do
    before(:each) do
      visit user_discover_path(@user)
    end

    it 'should have a link to return to user movie discover page', :vcr do
      click_button 'Discover Top Rated Movies'

      expect(page).to have_link("Return to Discover")
      click_link "Return to Discover"
      expect(current_path).to eq user_discover_path(@user)
    end

    it 'top_rated_movies' do
      VCR.use_cassette("top_rated_movies") do
        click_button 'Discover Top Rated Movies'

        expect(current_path).to eq(user_movies_path(@user))
        expect(page).to have_link("Godfather")
        expect(page).to have_link("Shawshank Redemption")
        expect(page).to_not have_link("Forrest Gump")
      end
    end

    it 'when I click on a link, I am taken to the movie details page' do
      VCR.use_cassette("top_rated_movies_2_this_time_its_personal") do
        # click_button 'Discover Top Rated Movies'
        visit user_movies_path(@user)
        movies = MoviesFacade.top_rated_movies
        click_link "#{movies.first.title}"
        expect(current_path).to eq(user_movie_path(@user, movies.first.id))
        expect(current_path).to_not eq(user_movie_path(@user, movies.second.id))
      end
    end
  end

  describe 'when a user searches for a movie by title' do
    it 'searched_movies' do
      visit user_discover_path(@user)

      VCR.use_cassette("search_falcon") do
        fill_in "search", with: "falcon"
        click_button "Search by movie title"

        expect(current_path).to eq user_movies_path(@user)

        movies = MoviesFacade.searched_movies("falcon")

        expect(page).to have_link(movies.last.title)
        expect(page).to have_link(movies.first.title)
      end
    end

    it 'when I click on a link, I am taken to the movie details page' do
      visit user_discover_path(@user)

      VCR.use_cassette("falcon_details") do
        fill_in "search", with: "falcon"
        click_button "Search by movie title"

        movies = MoviesFacade.searched_movies("falcon")

        click_link "#{movies.first.title}"
        expect(current_path).to eq(user_movie_path(@user, movies.first.id))
      end
    end
  end
end

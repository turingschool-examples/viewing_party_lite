require 'rails_helper'

RSpec.describe 'Movies show page' do
  before :each do
    VCR.use_cassette('example_movie') do
      @user = User.create!(name: 'John', email: 'john@user.com')
      @movie = MoviesFacade.movie_details(238)
    end
  end
  describe 'buttons and links' do
    it 'has a button for viewing party creation', :vcr do
      visit user_movie_path(@user, @movie.id)
      #   When I visit a movie's detail page (/users/:user_id/movies/:movie_id where :id is a valid user id,
      # I should see
      # _ Button to create a viewing party
      expect(page).to have_button("Create Viewing Party")
      click_button("Create Viewing Party")
      expect(current_path).to eq(new_user_movie_viewing_party_path(@user, @movie.id))
      # Details: This viewing party button should take the user to the new viewing party page (/users/:user_id/movies/:movie_id/viewing-party/new)
    end

    it 'has a button to return to Discover Page', :vcr do
      visit user_movie_path(@user, @movie.id)
      # _ Button to return to the Discover Page
      expect(page).to have_button("Return to Discover Page")
      click_button("Return to Discover Page")
      expect(current_path).to eq(user_discover_path(@user))
    end
  end

  describe 'page content' do
    it 'can display all details of the movie', :vcr do
      visit user_movie_path(@user, @movie.id)
      # And I should see the following information about the movie:

      # _Movie Title
      expect(page).to have_content(@movie.title)
      # _ Vote Average of the movie
      expect(page).to have_content(@movie.vote_average)
      # _ Runtime in hours & minutes
      expect(page).to have_content(@movie.hours_and_minutes)
      # _ Genre(s) associated to movie
      expect(page).to have_content(@movie.genres)
      # _ Summary description
      expect(page).to have_content(@movie.summary)
      # _ List the first 10 cast members (characters&actress/actors)
      expect(page).to have_content(@movie.cast)
      # _ Count of total reviews
      expect(page).to have_content(@movie.reviews.count)
      # _ Each review's author and information
      expect(page).to have_content(@movie.reviews.first[:author])
    end
  end
end
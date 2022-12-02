# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Movie show page' do
  before :each do
    @mostafa = User.create!(name: 'Mostafa', email: 'sasa2020@hotmail.com')
    @jim = User.create!(name: 'Jimothy', email: 'jimmyboy@hotmail.com')
    @bryan = User.create!(name: 'Bryan', email: 'breakingbad2020@hotmail.com')

    json_response = File.read('spec/fixtures/pulp_fiction.json')
    json_response_2 = File.read('spec/fixtures/pulp_fiction_credits.json')
    json_response_3 = File.read('spec/fixtures/pulp_fiction_reviews.json')

    stub_request(:get, 'https://api.themoviedb.org/3/movie/680?api_key=fcffd3018e92893c2d9bde84c969cedc')
      .with(
        headers: {
          'Accept' => '*/*',
          'Accept-Encoding' => 'gzip;q=1.0,deflate;q=0.6,identity;q=0.3',
          'User-Agent' => 'Faraday v2.7.1'
        }
      )
      .to_return(status: 200, body: json_response, headers: {})

    stub_request(:get, 'https://api.themoviedb.org/3/movie/680/credits?api_key=fcffd3018e92893c2d9bde84c969cedc')
      .with(
        headers: {
          'Accept' => '*/*',
          'Accept-Encoding' => 'gzip;q=1.0,deflate;q=0.6,identity;q=0.3',
          'User-Agent' => 'Faraday v2.7.1'
        }
      )
      .to_return(status: 200, body: json_response_2, headers: {})

    stub_request(:get, 'https://api.themoviedb.org/3/movie/680/reviews?api_key=fcffd3018e92893c2d9bde84c969cedc')
      .with(
        headers: {
          'Accept' => '*/*',
          'Accept-Encoding' => 'gzip;q=1.0,deflate;q=0.6,identity;q=0.3',
          'User-Agent' => 'Faraday v2.7.1'
        }
      )
      .to_return(status: 200, body: json_response_3, headers: {})
  end

  describe 'As a visitor' do
    it 'When I visit user/:user_id/movies/:id I see a button to create a viewing party' do
      visit "/users/#{@jim.id}/movies/680"

      expect(page).to have_button('Create a Viewing Party')

      click_button 'Create a Viewing Party'

      expect(current_path).to eql("/users/#{@jim.id}/movies/680/viewing-party/new")
    end

    it 'When I visit user/:user_id/movies/:id I see a button to go back to the discover page' do
      visit "/users/#{@jim.id}/movies/680"

      expect(page).to have_button('Discover Page')

      click_button 'Discover Page'

      expect(current_path).to eql("/users/#{@jim.id}/discover")
    end

    it 'When I visit user/:user_id/movies/:id I see the following details about the movie: title, vote average, runtime in hours and minutes, genre(s)' do
      visit "/users/#{@jim.id}/movies/680"

      expect(page).to have_content('Pulp Fiction')
      expect(page).to have_content('Vote: 8.491')
      expect(page).to have_content('Runtime: 2 hours 34 minutes')
      expect(page).to have_content('Genre(s):')
      expect(page).to have_content('Thriller')
      expect(page).to have_content('Crime')
    end

    it 'When I visit user/:user_id/movies/:id I see the a summary of the movie' do
      visit "/users/#{@jim.id}/movies/680"

      expect(page).to have_content("A burger-loving hit man, his philosophical partner, a drug-addled gangster's moll and a washed-up boxer converge in this sprawling, comedic crime caper. Their adventures unfurl in three stories that ingeniously trip back and forth in time.")
    end

    it 'When I visit user/:user_id/movies/:id I see the cast list (first 10) of the movie' do
      visit "/users/#{@jim.id}/movies/680"

      expect(page).to have_content('Cast:')
      expect(page).to have_content('John Travolta as Vincent Vega')
      expect(page).to have_content('Samuel L. Jackson as Jules Winnfield')
      expect(page).to have_content('Uma Thurman as Mia Wallace')
      expect(page).to have_content('Bruce Willis as Butch Coolidge')
      expect(page).to have_content('Ving Rhames as Marsellus Wallace')
      expect(page).to have_content('Harvey Keitel as Winston "The Wolf" Wolfe')
      expect(page).to have_content('Eric Stoltz as Lance')
      expect(page).to have_content('Tim Roth as Ringo ("Pumpkin")')
      expect(page).to have_content('Amanda Plummer as Yolanda ("Honey Bunny")')
      expect(page).to have_content('Maria de Medeiros as Fabienne')
    end

    it "When I visit user/:user_id/movies/:id I see the total number of reviews along with reviewers' information" do
      visit "/users/#{@jim.id}/movies/680"

      expect(page).to have_content('Count of Reviews: 4')

      expect(page).to have_content('Author: Wuchak')
      expect(page).to have_content('name:')
      expect(page).to have_content('username: Wuchak')
      expect(page).to have_content('rating: 9.0')

      expect(page).to have_content('Author: Erick Cabral')
      expect(page).to have_content('name: Erick Cabral')
      expect(page).to have_content('username: erick_cabral')
      expect(page).to have_content('rating: 10.0')

      expect(page).to have_content('Author: CinemaSerf')
      expect(page).to have_content('name: CinemaSerf')
      expect(page).to have_content('username: Geronimo1967')
      expect(page).to have_content('rating: 7.0')

      expect(page).to have_content('Author: crastana')
      expect(page).to have_content('name:')
      expect(page).to have_content('username: crastana')
      expect(page).to have_content('rating:')

      expect(page).to have_css("img[src*='image.tmdb.org/t/p/original']", count: 4)
    end
  end
end

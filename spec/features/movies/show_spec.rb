require 'rails_helper'

RSpec.describe 'Movie show page' do
  before :each do
    @mostafa = User.create!(name: "Mostafa", email: "sasa2020@hotmail.com")
    @jim = User.create!(name: "Jimothy", email: "jimmyboy@hotmail.com")
    @bryan = User.create!(name: "Bryan", email: "breakingbad2020@hotmail.com")
  end

  describe 'As a visitor' do
    it 'When I visit user/:user_id/movies/:id I see a button to create a viewing party' do
      json_response = File.read('spec/fixtures/pulp_fiction.json')

      stub_request(:get, "https://api.themoviedb.org/3/movie/680?api_key=fcffd3018e92893c2d9bde84c969cedc").
      with(
        headers: {
       'Accept'=>'*/*',
       'Accept-Encoding'=>'gzip;q=1.0,deflate;q=0.6,identity;q=0.3',
       'User-Agent'=>'Faraday v2.7.1'
        }).
        to_return(status: 200, body: json_response, headers: {})

      visit "/users/#{@jim.id}/movies/680"

      expect(page).to have_button("Create a Viewing Party")
      
      click_button "Create a Viewing Party"

      expect(current_path).to eql("/users/#{@jim.id}/movies/680/viewing-party/new")
    end
  end
end

# expect(page).to have_button("Discover Page")

# -Button to create a viewing party
# -Button to return to the Discover Page
# Details This viewing party button should take the user to the new viewing party page (/users/:user_id/movies/:movie_id/viewing-party/new)

# And I should see the following information about the movie:

# -Movie Title
# -Vote Average of the movie
# -Runtime in hours & minutes
# -Genre(s) associated to movie
# -Summary description
# -List the first 10 cast members (characters&actress/actors)
# -Count of total reviews
# -Each review's author and information
# Details: This information should come from 3 different endpoints from The Movie DB API
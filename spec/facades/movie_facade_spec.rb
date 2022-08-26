require 'rails_helper'


RSpec.describe MovieFacade do 
  
  
  it 'can return top rated movies' do
      json_response = File.read('spec/fixtures/top_rated_movies.json')
      stub_request(:get, "https://api.themoviedb.org/3/movie/top_rated?api_key=73c37a0fb30ac13df0c132c1df149b3f").
         with(
           headers: {
       	  'Accept'=>'*/*',
       	  'Accept-Encoding'=>'gzip;q=1.0,deflate;q=0.6,identity;q=0.3',
       	  'User-Agent'=>'Faraday v2.5.2'
           }).
         to_return(status: 200, body: json_response, headers: {})
      movies = MovieFacade.top_rated
      expect(movies).to be_a(Array)
      expect(movies).to be_all Movie

  end

  it 'can return movies matching a search keyword' do
    movies = MovieFacade.search_for_movies("Star Trek: First Contact")
    expect(movies).to be_a(Array)
    expect(movies).to be_all Movie
    expect(movies.first.title).to eq("Star Trek: First Contact")
  end 

  it 'can return a movie when given an id' do
    movie = MovieFacade.movie_id(1381)
    expect(movie).to be_a Movie 
    expect(movie.title).to eq("The Fountain")
  end 

  it 'can return multiple movies when given multiple ids' do
    movies = MovieFacade.multiple_movies([1381, 199])
    expect(movies).to be_a(Array)
    expect(movies).to be_all Movie
    expect(movies.first.title).to eq("The Fountain")
    expect(movies.last.title).to eq("Star Trek: First Contact")
  end
end
# RSpec.describe "discover movies page" do
#   it "has a button to discover top rated movies" do
#     json_response = File.read("./spec/fixtures/top_rated.json")
#     stub_request(:get, "https://api.themoviedb.org/3/movie/550?api_key=1a7e2460516ee96364f52f0875cf649e").
#          with(
#            headers: {
#        	  'Accept'=>'*/*',
#        	  'Accept-Encoding'=>'gzip;q=1.0,deflate;q=0.6,identity;q=0.3',
#        	  'User-Agent'=>'Faraday v2.3.0'
#            })
#          .to_return(status: 200, body: json_response, headers: {})
#     user1 = User.create!(name: 'Jared', email: 'jared@example.com')
#     visit "/users/#{user1.id}/discover"

#     click_link "Discover Top Rated Movies"
#     expect(current_path).to eq("/users/#{user1.id}/movies")
#   end

#   it "has a section to search by movie title" do
#     json_response = File.read("./spec/fixtures/search_for_nemo.json")
#     stub_request(:get, "").
#       with(
#         headers: {
#        	  'Accept'=>'*/*',
#        	  'Accept-Encoding'=>'gzip;q=1.0,deflate;q=0.6,identity;q=0.3',
#        	  'User-Agent'=>'Faraday v2.3.0'
#         })
#         .to_return(status: 200, body: json_response, headers: {})

#     user1 = User.create!(name: 'Jared', email: 'jared@example.com')
#     visit "/users/#{user1.id}/discover"

#     expect(page).to have_field("Movie Title")
#     fill_in "Movie Title", with: ""
#     click_button "Search by Movie Title"

#     expect(page).to have_content("")
#     expect(page).to have_content("")
#     expect(page.status_code).to eq 200
#   end
# end
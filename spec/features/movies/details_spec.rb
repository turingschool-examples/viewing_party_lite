require 'rails_helper'

RSpec.describe "new viewing party page" do
  it "has the name of the movie and form to create new party" do
    json_response = File.read("./spec/fixtures/shawshank.json")
    user_1 = User.create!(name: "Twitch", email: "twitch@dogmail.com")
    stub_request(:get, "https://api.themoviedb.org/3/movie/278?api_key=131d23d3e9d511ff6fce6fdc6799d9be&append_to_response=credits,reviews").
         with(
           headers: {
       	  'Accept'=>'*/*',
       	  'Accept-Encoding'=>'gzip;q=1.0,deflate;q=0.6,identity;q=0.3',
       	  'User-Agent'=>'Faraday v2.3.0'
           }).
         to_return(status: 200, body: json_response, headers: {})
    visit "/users/#{user_1.id}/movies/278"
    expect(page).to have_button("Create Viewing Party")
    expect(page).to have_link("Discover Page")

    # Refactor - tests below should really be in a within block to avoid cross-contamination false positives
    expect(page).to have_content("The Shawshank Redemption") # Has movie title
    expect(page).to have_content("8.7") # Average vote
    expect(page).to have_content("2 hours 22 minutes") # Runtime
    expect(page).to have_content("Drama") # Genres
    expect(page).to have_content("Crime") # Genres
    expect(page).to have_content("Framed in the 1940s for the double murder of his wife and her lover, upstanding banker Andy Dufresne begins a new life at the Shawshank prison, where he puts his accounting skills to work for an amoral warden. During his long stretch in prison, Dufresne comes to be admired by the other inmates -- including an older prisoner named Red -- for his integrity and unquenchable sense of hope.") # Summary AKA Overview
    expect(page).to have_content("Crime") # Genres
    expect(page).to have_content("Tim Robbins - Andy Dufresne") # First actor
    expect(page).to have_content("Larry Brandenburg - Skeet") # Tenth actor
    expect(page).to have_content("7") # Total num reviews
    expect(page).to have_content("Author: elshaarawy") # First review's author's name
    expect(page).to have_content("Rating: 6.0") # Third review's rating
    expect(page).to have_content("Content: First time seeing this in probably close to 20 years, maybe longer. Forgot how excellent of a movie this was, amazing all around from the performances, Morgan Freeman and Tim Robbins especially, with a roller coaster of emotions. The writing (from Stephen King's novel) direction from Frank Darabont was precise and just all around fantastic. This is the very rare 5 star movies I've given but it is easily one of the best movies, right up there in my book with The Godfather. **5.0/5**") # Last review's details

  end
end

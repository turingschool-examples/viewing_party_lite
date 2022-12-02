require 'rails_helper'

RSpec.describe 'Movie index page' do
  before :each do
    @mostafa = User.create!(name: "Mostafa", email: "sasa2020@hotmail.com")
    @jim = User.create!(name: "Jimothy", email: "jimmyboy@hotmail.com")
    @bryan = User.create!(name: "Bryan", email: "breakingbad2020@hotmail.com")
  end

  describe 'As a visitor' do
    it 'When I visit user/:id/discover I see a button to discover top rated movies' do
      json_response = File.read('spec/fixtures/top_rated_movies.json')

      stub_request(:get, "https://api.themoviedb.org/3/movie/top_rated?api_key=fcffd3018e92893c2d9bde84c969cedc").
      with(
        headers: {
       'Accept'=>'*/*',
       'Accept-Encoding'=>'gzip;q=1.0,deflate;q=0.6,identity;q=0.3',
       'User-Agent'=>'Faraday v2.7.1'
        }).
      to_return(status: 200, body: json_response, headers: {})

      visit "/users/#{@jim.id}/discover"

      expect(page).to have_button("Find Top Rated Movies")
      
      click_button "Find Top Rated Movies"
 
      expect(current_path).to eq("/users/#{@jim.id}/movies")
      expect(page).to have_link("20세기 소녀")
      expect(page).to have_content("Vote Average:8.7")
      expect(page).to have_link("Pulp Fiction")
      expect(page).to have_content("Vote Average:8.5")
    end

  end
  it 'can search for a movie by keywords' do
    
      json_response = File.read('spec/fixtures/hi_search.json')

      stub_request(:get, "https://api.themoviedb.org/3/search/movie?api_key=fcffd3018e92893c2d9bde84c969cedc&query=hi").
      with(
        headers: {
        'Accept'=>'*/*',
        'Accept-Encoding'=>'gzip;q=1.0,deflate;q=0.6,identity;q=0.3',
        'User-Agent'=>'Faraday v2.7.1'
        }).
      to_return(status: 200, body: json_response, headers: {})
    visit "/users/#{@jim.id}/discover"

    expect(page).to have_button("Submit")
    

    fill_in('q', with: "hi")
    click_button('Submit')

    expect(current_path).to eq("/users/#{@jim.id}/movies")
    expect(page).to have_content("Hi Stranger")
  end

  it 'has a discover page button that routes to users/:id/discover' do 
    json_response = File.read('spec/fixtures/hi_search.json')

        stub_request(:get, "https://api.themoviedb.org/3/search/movie?api_key=fcffd3018e92893c2d9bde84c969cedc&query=hi").
        with(
          headers: {
          'Accept'=>'*/*',
          'Accept-Encoding'=>'gzip;q=1.0,deflate;q=0.6,identity;q=0.3',
          'User-Agent'=>'Faraday v2.7.1'
          }).
        to_return(status: 200, body: json_response, headers: {})
      visit "/users/#{@jim.id}/discover"

      expect(page).to have_button("Submit")
      

      fill_in('q', with: "hi")
      click_button('Submit')
      
    expect(page).to have_button("Discover Page")

    click_button('Discover Page')
    expect(current_path).to eq("/users/#{@jim.id}/discover")
  end
end
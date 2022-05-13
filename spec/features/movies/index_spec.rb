require 'rails_helper'

RSpec.describe "discover movies page" do
  it "has a button to discover top rated movies" do
    json_response = File.read("./spec/fixtures/top_rated.json")
    stub_request(:get, "https://api.themoviedb.org/3/movie/top_rated?api_key=#{ENV["api_key"]}").
         with(
           headers: {
       	  'Accept'=>'*/*',
       	  'Accept-Encoding'=>'gzip;q=1.0,deflate;q=0.6,identity;q=0.3',
       	  'User-Agent'=>'Faraday v2.3.0'
           })
         .to_return(status: 200, body: json_response, headers: {})
    user_1 = User.create!(name: "Twitch", email: "twitch@dogmail.com")
    visit "/users/#{user_1.id}/discover"

    click_link "Discover Top Rated Movies"
    expect(current_path).to eq("/users/#{user_1.id}/movies")
  end

  it "has a section to search by movie title" do
    json_response = File.read("./spec/fixtures/search_for_gabriel.json")
    stub_request(:get, "https://api.themoviedb.org/3/search/movie?api_key=#{ENV["api_key"]}&include_adult=false&language=en-US&page=1&query=Gabriel").
      with(
        headers: {
       	  'Accept'=>'*/*',
       	  'Accept-Encoding'=>'gzip;q=1.0,deflate;q=0.6,identity;q=0.3',
       	  'User-Agent'=>'Faraday v2.3.0'
        })
        .to_return(status: 200, body: json_response, headers: {})

    user_1 = User.create!(name: "Twitch", email: "twitch@dogmail.com")
    visit "/users/#{user_1.id}/discover"

    expect(page).to have_field("Movie Title")
    fill_in "Movie Title", with: "Gabriel"
    click_button "Search by Movie Title"

    expect(page).to have_content("Gabriel's Inferno")
    expect(page).to have_content("Gabriel's Inferno: Part II")
    expect(page).to have_content("Gabriel's Inferno: Part III")
    expect(page.status_code).to eq 200
  end
end

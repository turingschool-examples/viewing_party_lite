require 'rails_helper'

RSpec.describe "new viewing party page" do
  it "has the name of the movie and form to create new party" do
    json_response = File.read("./spec/fixtures/shawshank.json")
    user_1 = User.create!(name: "Twitch", email: "twitch@dogmail.com")
    stub_request(:get, "https://api.themoviedb.org/3/movie/278?api_key=131d23d3e9d511ff6fce6fdc6799d9be").
         with(
           headers: {
       	  'Accept'=>'*/*',
       	  'Accept-Encoding'=>'gzip;q=1.0,deflate;q=0.6,identity;q=0.3',
       	  'User-Agent'=>'Faraday v2.3.0'
           }).
         to_return(status: 200, body: json_response, headers: {})
    visit "/users/#{user_1.id}/discover"
  end
end
require 'rails_helper'

RSpec.describe "movies results page" do
  it "has top rated movies" do
    json_response = File.read("./spec/fixtures/top_rated.json")
    stub_request(:get, "https://api.themoviedb.org/3/movie/top_rated?api_key=131d23d3e9d511ff6fce6fdc6799d9be")
    .to_return(status: 200, body: json_response, headers: {})
    user_1 = User.create!(name: "Twitch", email: "twitch@dogmail.com")
    visit "/users/#{user_1.id}/movies?q=top%20rated"

  end
end

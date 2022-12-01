require 'rails_helper'

RSpec.describe "movies index page" do
  xit "has top rated movies" do
    json_response = File.open("spec/fixtures/top_rated.json")
    stub_request(:get, "https://www.themoviedb.org/3/movie/top_rated?api_key=35493517a3da99ce44fdd268008a69d1").to_return(status: 200, body: json_response)

    user_1 = User.create!(name: "Bryan", email: "bryan@bryan.com", password: 'password123', password_confirmation: 'password123')

    visit "/users/#{user_1.id}/movies?q=top%20rated"

    expect(page).to have_content "Top Rated Movies"
  end
end

require 'rails_helper'


RSpec.describe "New User", type: :feature do
  it 'displays top 20 rated movies' do
    user = User.create!(name: "Tim", email: "Tim@mail.com")
    visit "users/#{user.id}/movies?q=top%20rated"

    #json_response = File.read('spec/fixtures/top_20_movies.json')
    #stub_request(:get, "http://api.themoviedb.org/3/movie/top_rated?api_key=#{ENV['movie_api_key']}")
    #.with(
    #      headers: {
    #     'Accept'=>'*/*',
    #     'Accept-Encoding'=>'gzip;q=1.0,deflate;q=0.6,identity;q=0.3',
    #     'User-Agent'=>'Faraday v2.3.0'
    #      })
    #.to_return(status: 200, body: json_response, headers: {})


    save_and_open_page
  expect(page).to have_content("Shawshank Redemption")
  expect(page).to have_content("Vote Average: 8.7")
  expect(page).to have_content("Dilwale Dulhania Le Jayenge")
  expect(page).to have_content("Vote Average: 8.7")
  expect(page).to have_content("The Godfather")
  expect(page).to have_content("Vote Average: 8.7")


  end

end

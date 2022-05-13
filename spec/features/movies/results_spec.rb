require 'rails_helper'


RSpec.describe "New User", type: :feature do
  it 'displays top 20 rated movies', :vcr do
    user = User.create!(name: "Tim", email: "Tim@mail.com")
    visit "/users/#{user.id}/movies?q=top%20rated"

    # json_response = File.read('spec/fixtures/top_20_movies.json')
    # stub_request(:get, "http://api.themoviedb.org/3/movie/top_rated?")
    # .with(
    #   headers: {
    #    'Accept'=>'*/*',
    #    'Accept-Encoding'=>'gzip;q=1.0,deflate;q=0.6,identity;q=0.3',
    #    'User-Agent'=>'Faraday v2.3.0'
    #     },
    #     params: {'api_key' => ENV['movie_api_key']})
    # .to_return(status: 200, body: json_response, headers: {})

  expect(page).to have_content("Shawshank Redemption")
  expect(page).to have_content("Vote Average: 8.7")
  expect(page).to have_content("Dilwale Dulhania Le Jayenge")
  expect(page).to have_content("Vote Average: 8.7")
  expect(page).to have_content("The Godfather")
  expect(page).to have_content("Vote Average: 8.7")
  end

  it 'has links to movie detail page', :vcr do
    user = User.create!(name: "Tim", email: "Tim@mail.com")
    visit "/users/#{user.id}/movies?q=top%20rated"
    click_link "Shawshank Redemption"

    expect(current_path).to eq("/users/#{user.id}/movies/278")

  end


  it 'has a button to return to the discover page', :vcr do
    user = User.create!(name: "Tim", email: "Tim@mail.com")
    movie = Movie.new(id: 1, title: "Movie", vote_average: "8.2")
    visit "/users/#{user.id}/movies?q=top%20rated"
    
    click_on "Return to Discover"
    expect(current_path).to eq("/users/#{user.id}/discover")
  end


end

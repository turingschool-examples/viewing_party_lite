require 'rails_helper'

RSpec.describe 'Discover Index' do
  let!(:users) { create_list(:user, 10) }
  let(:user) { users.first }

  it 'has a link to view top rated movies' do
    json_response = File.read('spec/fixtures/top_rated_movies.json')
    stub_request(:get, "https://api.themoviedb.org/3/discover/movie?api_key=2f8f6c343a2a2acbd770dfbfbb00e38a&language=en-US&sort_by=vote_average.desc&include_adult=false&include_video=false&page=1&vote_count.gte=1000").
      to_return(status: 200, body: json_response)

    visit user_discover_index_path(user)

    click_button('Find Top Rated Movies')

    expect(current_path).to eq(user_movies_path(user))
  end

  it 'has a field to search for movies by title' do
    json_response = File.read('spec/fixtures/movies_with_green.json')
    stub_request(:get, "https://api.themoviedb.org/3/search/movie?api_key=2f8f6c343a2a2acbd770dfbfbb00e38a&language=en-US&query=Green&page=1&include_adult=false").
      to_return(status: 200, body: json_response)

    visit user_discover_index_path(user)

    fill_in(:title, with: 'Green')
    click_button('Find Movies')

    expect(current_path).to eq(user_movies_path(user))
  end
end
require 'rails_helper'

RSpec.describe 'Movies Show' do
  let!(:users) { create_list(:user, 10) }
  let(:user) { users.first }

  it 'is linked on the results page' do
    json_response = File.read('spec/fixtures/top_rated_movies.json')
    stub_request(:get, "https://api.themoviedb.org/3/discover/movie?api_key=2f8f6c343a2a2acbd770dfbfbb00e38a&language=en-US&sort_by=vote_average.desc&include_adult=false&include_video=false&page=1&vote_count.gte=1000").
      to_return(status: 200, body: json_response)

    visit user_discover_index_path(user)
    click_button 'Find Top Rated Movies'

    click_link('The Godfather')

    expect(current_path).to eq(user_movie_path(user, 238))
  end
end
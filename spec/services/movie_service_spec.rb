require 'rails_helper'

RSpec.describe MovieService do
  it 'gets movie data' do
    json_response1 = File.read('spec/fixtures/fight_club_details.json')
    stub_request(:get, "https://api.themoviedb.org/3/movie/550?api_key=5b03ee47af6e087159e9baca0f110161").to_return(status: 200, body: json_response1, headers: {})
    
    json_response2 = File.read('spec/fixtures/fight_club_cast.json')
    stub_request(:get, "https://api.themoviedb.org/3/movie/550/credits?api_key=5b03ee47af6e087159e9baca0f110161&language=en-US").to_return(status: 200, body: json_response2, headers: {})
      
    json_response3 = File.read('spec/fixtures/fight_club_reviews.json')
    stub_request(:get, "https://api.themoviedb.org/3/movie/550/reviews?api_key=5b03ee47af6e087159e9baca0f110161&language=en-US&page=1").to_return(status: 200, body: json_response3, headers: {})

    ms = MovieService.new
    data = ms.movie_details(550)
  end
end
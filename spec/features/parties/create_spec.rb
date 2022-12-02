require 'rails_helper'

RSpec.describe 'creating a new party' do
  before :each do
    @mostafa = User.create!(name: "Mostafa", email: "sasa2020@hotmail.com")
    @jim = User.create!(name: "Jimothy", email: "jimmyboy@hotmail.com")
    @bryan = User.create!(name: "Bryan", email: "breakingbad2020@hotmail.com")

    json_response = File.read('spec/fixtures/pulp_fiction.json')
    json_response_2 = File.read('spec/fixtures/pulp_fiction_credits.json')
    json_response_3 = File.read('spec/fixtures/pulp_fiction_reviews.json')

    stub_request(:get, "https://api.themoviedb.org/3/movie/680?api_key=fcffd3018e92893c2d9bde84c969cedc").
    with(
      headers: {
      'Accept'=>'*/*',
      'Accept-Encoding'=>'gzip;q=1.0,deflate;q=0.6,identity;q=0.3',
      'User-Agent'=>'Faraday v2.7.1'
      }).
      to_return(status: 200, body: json_response, headers: {})

    stub_request(:get, "https://api.themoviedb.org/3/movie/680/credits?api_key=fcffd3018e92893c2d9bde84c969cedc").
    with(
        headers: {
      'Accept'=>'*/*',
      'Accept-Encoding'=>'gzip;q=1.0,deflate;q=0.6,identity;q=0.3',
      'User-Agent'=>'Faraday v2.7.1'
        }).
      to_return(status: 200, body: json_response_2, headers: {})

    stub_request(:get, "https://api.themoviedb.org/3/movie/680/reviews?api_key=fcffd3018e92893c2d9bde84c969cedc").
    with(
        headers: {
      'Accept'=>'*/*',
      'Accept-Encoding'=>'gzip;q=1.0,deflate;q=0.6,identity;q=0.3',
      'User-Agent'=>'Faraday v2.7.1'
        }).
      to_return(status: 200, body: json_response_3, headers: {})
  end
 
end
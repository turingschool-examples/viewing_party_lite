require 'rails_helper'

RSpec.describe 'the new party form' do
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

  it "has the movie title at the top" do
    visit "/users/#{@jim.id}/movies/680/viewing-party/new"

    expect(page).to have_content("Pulp Fiction")
  end

  it "has a form with fields for duration of the party, date of the party, start time of the party" do
    visit "/users/#{@jim.id}/movies/680/viewing-party/new"
    
    expect(page).to have_selector(:css, 'form')
    expect(page).to have_field("duration")
    expect(page).to have_field("[date(1i)]")
    expect(page).to have_field("[date(2i)]")
    expect(page).to have_field("[date(3i)]")
    expect(page).to have_field("[time(4i)]")
    expect(page).to have_field("[time(5i)]")
  end

  it "the form has a list of users with checkboxes next to each one" do
    visit "/users/#{@jim.id}/movies/680/viewing-party/new"
    
    expect(page).to have_unchecked_field("#{@mostafa.id}")
    expect(page).to have_unchecked_field("#{@bryan.id}")
    expect(page).to_not have_unchecked_field("#{@jim.id}")
    expect(page).to_not have_checked_field("#{@jim.id}")
  end

  it "has a submit button" do
    visit "/users/#{@jim.id}/movies/680/viewing-party/new"
    
    expect(page).to have_button("Submit")
  end
end
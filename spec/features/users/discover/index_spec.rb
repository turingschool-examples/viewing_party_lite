require 'rails_helper'

RSpec.describe 'discover movies page' do
  before :each do
    @user1 = User.create!(name: "William", email: "William@gmail.com", password: 'pw123', password_confirmation: 'pw123')
    @user2 = User.create!(name: "Ashley", email: "Ashley@gmail.com", password: 'pw123', password_confirmation: 'pw123')
    @user3 = User.create!(name: "Abdul", email: "Abdul@gmail.com", password: 'pw123', password_confirmation: 'pw123')

    visit(user_discover_index_path(@user1.id))
  end
  it 'should have a button to discover top rated movies' do
    json_response = File.read('spec/fixtures/top_rated_movies.json')
    stub_request(:get, "https://api.themoviedb.org/3/movie/top_rated?api_key=#{ENV["movie_api_key"]}").
      to_return(status: 200, body: json_response)

    expect(page).to have_button("Discover Top Rated Movies")
    click_button "Discover Top Rated Movies"
    
    expect(current_path).to eq(user_movies_path(@user1.id))
  end
  it 'should have a form to search for movies by title' do
    json_response = File.read('spec/fixtures/search_movies.json')
    stub_request(:get, "https://api.themoviedb.org/3/search/movie?api_key=#{ENV["movie_api_key"]}&query=Test").
      to_return(status: 200, body: json_response)

    expect(page).to have_field(:title)
    expect(page).to have_button("Search")
    
    fill_in "Search by Title:", with: "Test"
    click_button "Search"
    
    expect(current_path).to eq(user_movies_path(@user1.id))
  end
end

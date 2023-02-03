require 'rails_helper'

RSpec.describe 'new viewing party page' do
  it 'has a form to create new viewing party' do
    stub_request(:get, "https://api.themoviedb.org/3/movie/550?api_key=#{ENV['api_key']}&language=en-US").
      to_return(status: 200, body: File.read('spec/fixtures/details_response.json'), headers: {})
    stub_request(:get, "https://api.themoviedb.org/3/movie/550/credits?api_key=#{ENV['api_key']}&language=en-US").      
      to_return(status: 200, body: File.read('spec/fixtures/cast_response.json'), headers: {})
    stub_request(:get, "https://api.themoviedb.org/3/movie/550/reviews?api_key=#{ENV['api_key']}&language=en-US").
      to_return(status: 200, body: File.read('spec/fixtures/reviews_response.json'), headers: {})

    @user_1 = User.create!(name: "Mike", email: "mike@mike.com")
    @user_2 = User.create!(name: "Drew", email: "drew@drew.com")
    @user_3 = User.create!(name: "John", email: "john@john.com")
    @movie = Movie.new(id: 550,
                       title: "Fight Club",
                       runtime: 139)
    visit new_user_movie_viewing_party_path(@user_1, @movie.id)

    save_and_open_page
    
  end
end
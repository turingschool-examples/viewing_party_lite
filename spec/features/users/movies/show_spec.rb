require 'rails_helper'

RSpec.describe 'movie details page' do 
  before :each do 
    @user1 = User.create!(name: "William", email: "William@gmail.com")
    @user2 = User.create!(name: "Ashley", email: "Ashley@gmail.com")
    @user3 = User.create!(name: "Abdul", email: "Abdul@gmail.com")

    # json_response = File.read('spec/fixtures/top_rated_movies.json')

    # stub_request(:get, "https://api.themoviedb.org/3/movie/top_rated?api_key=#{ENV["movie_api_key"]}").
    #   to_return(status: 200, body: json_response)

    visit(user_movie_path(@user1.id))
    require 'pry'; binding.pry
  end

  describe 'when I visit a movie details page' do 
    it 'I see a button to create a viewing party' do 
      expect(page).to have_button("Create Viewing Party")
    end
  end
end
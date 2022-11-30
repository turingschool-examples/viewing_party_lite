require 'rails_helper'

RSpec.describe 'movie details page' do 
  before :each do 
    @user1 = User.create!(name: "William", email: "William@gmail.com")
    @user2 = User.create!(name: "Ashley", email: "Ashley@gmail.com")
    @user3 = User.create!(name: "Abdul", email: "Abdul@gmail.com")

    details_response = File.read('spec/fixtures/shawshank_details.json')
    stub_request(:get, "https://api.themoviedb.org/3/movie/278?api_key=#{ENV["movie_api_key"]}").
      to_return(status: 200, body: details_response)

    credits_response = File.read('spec/fixtures/shawshank_credits.json')
    stub_request(:get, "https://api.themoviedb.org/3/movie/278/credits?api_key=#{ENV["movie_api_key"]}").
      to_return(status: 200, body: credits_response)

    reviews_response = File.read('spec/fixtures/shawshank_reviews.json')
    stub_request(:get, "https://api.themoviedb.org/3/movie/278/reviews?api_key=#{ENV["movie_api_key"]}").
      to_return(status: 200, body: reviews_response)

    visit(user_movie_path(@user1.id, 278))
    
  end

  describe 'when I visit a movie details page' do 
    it 'I see a button to create a viewing party' do 
      expect(page).to have_button("Create Viewing Party")
      click_button "Create Viewing Party"
      expect(current_path).to eq(new_user_movie_viewing_party_path(@user1.id, 278))
    end

    it 'I see title and vote average of the movie' do 
      expect(page).to have_content("The Shawshank Redemption")
      expect(page).to have_content("Vote Average: 8.7")
      save_and_open_page
    end
  end
end
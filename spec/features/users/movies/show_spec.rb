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
    end

    it 'I see the runtime in hours and minutes' do
      expect(page).to have_content("Run Time: 2h 22min")
    end

    it 'I see genres associated to the movie' do
      expect(page).to have_content("Genres: Drama and Crime")
    end

    it 'I see summary description' do
      expect(page).to have_content("Summary:")
    end

    it 'I see the first 10 characters government names and character names' do
      expect(page).to have_content("Name: Tim Robbins Character Name: Andy Dufresne")
      expect(page).to have_content("Name: Morgan Freeman Character Name: Ellis Boyd 'Red' Redding")
      expect(page).to have_content("Name: Bob Gunton Character Name: Warden Norton")
    end

    it 'I see count of total reviews' do
      expect(page).to have_content("Total Reviews: 7")
    end

    it 'I see each reviews author and information' do
      expect(page).to have_content("Name: elshaarawy Rating: 9.0")
      expect(page).to_not have_content("Name: ashuhleyt Rating: 9.0")
    end

    it 'contains a link to return to the discover page' do
      expect(page).to have_button("Return to Discover Page")
      click_button "Return to Discover Page"
      expect(current_path).to eq(user_discover_index_path(@user1.id))
    end
  end
end

require 'rails_helper' 

RSpec.describe 'new viewing party', type: :feature do 
  let!(:u1) { create(:user) }

  describe 'when I visit the new viewing party page' do
    before :each do
      json_response = File.read('spec/fixtures/the_godfather.json')
      stub_request(:get, "https://api.themoviedb.org/3/movie/238?api_key=#{ENV['tmdb_api_key']}&language=en&movie_id=238")
        .to_return(status: 200, body: json_response, headers: {})
      stub_request(:get, "https://api.themoviedb.org/3/movie/238/credits?api_key=#{ENV['tmdb_api_key']}&language=en")
        .to_return(status: 200, body: "{ \"cast\": [{}] }", headers: {})
      stub_request(:get, "https://api.themoviedb.org/3/movie/238/reviews?api_key=#{ENV['tmdb_api_key']}&language=en")
        .to_return(status: 200, body: "{ \"results\": [{}] }", headers: {})
    end

    it 'displays movie title' do
      visit new_user_movie_viewing_party_path(u1, 238)
      expect(page).to have_content('The Godfather')
    end

    it 'displays viewing party creation form' do
      visit new_user_movie_viewing_party_path(u1, 238)
      expect(page).to have_content('Duration:')
    end
  end
end
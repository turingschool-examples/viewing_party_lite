require 'rails_helper' 

RSpec.describe 'new viewing party', type: :feature do 
  let!(:u1) { create(:user) }
  let!(:u2) { create(:user) }
  let!(:u3) { create(:user) }
  let!(:u4) { create(:user) }

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
      expect(page).to have_field(:duration)
      expect(page).to have_content('Day:')
      expect(page).to have_field(:date)
      expect(page).to have_content('Start Time:')
      expect(page).to have_field(:start_time)
    end

    # TODO: add testing to make sure viewing parties with duration < movie duration are UNABLE to be created

    it 'displays list of all users to add to viewing party' do
      visit new_user_movie_viewing_party_path(u1, 238)
      expect(page).to have_field(u1.id)
      expect(page).to have_content(u1.name)
      expect(page).to have_content(u1.email)
    end

    it 'can create a new viewing party' do
      visit new_user_movie_viewing_party_path(u1, 238)
      start_time = Time.now
      expect(page).to have_field(:duration, with: 175)
      fill_in :date, with: Date.today
      fill_in :start_time, with: start_time
      page.check(u2.id)
      page.check(u3.id)
      click_button 'Create Viewing Party'
    end
  end
end
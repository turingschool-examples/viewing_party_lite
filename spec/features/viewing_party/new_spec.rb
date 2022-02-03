require 'rails_helper'

RSpec.describe 'Viewing Party New Page' do
  describe 'view' do
    before(:each) do
      @user_1 = User.create!(name: "David", email: "david@email.com")
      @party_1 = @user_1.parties.create!(duration: 180, day: "December 12, 2021", start_time: "7:00 pm", movie_id: 1, user_id: @user_1.id)
    end

    it 'includes all information about the viewing party' do
      top_movie = MovieService.top_movies.first

      visit "/users/#{@user_1.id}/movies/#{top_movie.id}/viewing-party/new"

      # fill_in :title, with: 'Aliens'
      fill_in :duration, with: '180'
      fill_in :day, with: 'February 5th'
      fill_in :start_time, with: '120'

      click_button 'Submit'

      expect(current_path).to eq("/users/#{@user_1.id}")

      expect(page).to have_content(top_movie.title)
      expect(page).to have_content(top_movie.start_time)
      # Movie Title
      # Vote Average of the movie
      # Runtime in hours & minutes
      # Genre(s) associated to movie
      # Summary description
      # List the first 10 cast members (characters&actress/actors)
      # Count of total reviews
      # Each review's author and information
    end
  end
end

# frozen_string_literal: true

require 'rails_helper'
require 'faker'

RSpec.describe 'Movie Details Page' do
  describe 'As a user when I visit the movie details page' do
    before(:each) do
      @alex = User.create!(user_name: 'Alex', email: Faker::Internet.email,
                             password_digest: Faker::Internet.password)
  
      @inglorious_bastards = double(id: 1, title: 'Inglorious Bastards')
      visit user_movie_path(@alex, @inglorious_bastards.id)
    end
    it 'I see a button to create a viewing party' do
      expect(page).to have_button("Create Viewing Party for #{@movie.title}")
    end

    it 'I see a button to return to the Discover Page' do
      expect(page).to have_button("Discover Page")
    end

    xit 'has a header for the movie title' do
      # @alex = User.create!(user_name: 'Alex', email: Faker::Internet.email,
      #                      password_digest: Faker::Internet.password)

      # @inglorious_bastards = double(id: 1, title: 'Inglorious Bastards')

      # movie_data = ''

      # allow(Movie).to receive(:new).with(movie_data).and_return(@inglorious_bastards)

      # visit user_movie_path(@alex, @inglorious_bastards.id)

      expect(page).to have_content("#{@movie.title}")
    end

    xit 'I see the vote Average of the movie' do
      expect(page).to have_content("Vote Average: #{@movie.vote_average}")
    end

    xit 'I see the runtime in hours & minutes of the movie' do
      expect(page).to have_content("Runtime: #{@movie.runtime}")
    end

    xit 'I see the genre(s) associated to the movie' do
      expect(page).to have_content("Genre(s): #{[@movie.genres]}")
    end

    xit 'I see the list the summary for the movie' do
      expect(page).to have_content("Summary")
    end

    xit 'I see the list the first 10 cast members (characters&actress/actors) in the movie' do
      expect(page).to have_content("Cast")
    end

    xit 'I see the count of total reviews for the movie' do
      expect(page).to have_content("8 Reviews")
    end

    xit 'I see each reviews author and information for the movie' do
      expect(page).to have_content("Author:")
    end
  end
end

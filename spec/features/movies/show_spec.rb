# frozen_string_literal: true

require 'rails_helper'
require 'faker'

RSpec.describe 'Movie Details Page' do
  describe 'As a user when I visit the movie details page' do
    before(:each) do
      visit user_movie_path(@alex, @movie.id)
    end
    it 'I see a button to create a viewing party' do

    end

    it 'I see a button to return to the Discover Page' do

    end

    xit 'has a header for the movie title' do
      @alex = User.create!(user_name: 'Alex', email: Faker::Internet.email,
                           password_digest: Faker::Internet.password)

      @inglorious_bastards = double(id: 1, title: 'Inglorious Bastards')

      movie_data = ''

      allow(Movie).to receive(:new).with(movie_data).and_return(@inglorious_bastards)

      visit user_movie_path(@alex, @inglorious_bastards.id)

      expect(page).to have_content('Inglorious Bastards')
    end

    it 'I see the vote Average of the movie' do

    end

    it 'I see the runtime in hours & minutes of the movie' do

    end

    it 'I see the genre(s) associated to the movie' do

    end

    it 'I see the list the first 10 cast members (characters&actress/actors) in the movie' do

    end

    it 'I see the count of total reviews for the movie' do

    end

    it 'I see each reviews author and information for the movie' do

    end
  end
end

# frozen_string_literal: true

require 'rails_helper'
require 'faker'

RSpec.describe 'Movie Details Page' do
  describe 'As a user when I visit the movie details page' do
    before(:each) do
      VCR.use_cassette('fight_club_movie_data_v1') do
        @alex = User.create!(user_name: 'Alex', email: Faker::Internet.email,
                              password_digest: Faker::Internet.password)
    
        @fight_club = double(id: 550, title: 'Fight Club')
        visit user_movie_path(@alex, @fight_club.id)
      end
    end
    it 'I see a button to create a viewing party' do
      expect(page).to have_button("Create Viewing Party for Fight Club")
    end

    it 'I see a button to return to the Discover Page' do
      expect(page).to have_button("Discover Page")
    end

    it 'has a header for the movie title' do
      expect(page).to have_content("Fight Club")
    end

    it 'I see the vote Average of the movie' do
      expect(page).to have_content("Vote Average: 8.433")
    end

    it 'I see the runtime in hours & minutes of the movie' do
      expect(page).to have_content("Runtime: 139")
    end

    it 'I see the genre(s) associated to the movie' do
      expect(page).to have_content("Genre(s):")
      expect(page).to have_content("Drama")
      expect(page).to have_content("Thriller")
      expect(page).to have_content("Comedy")
    end

    it 'I see the list the summary for the movie' do
      expect(page).to have_content("Summary")
    end

    it 'I see the list the first 10 cast members (characters&actress/actors) in the movie' do
      save_and_open_page
      expect(page).to have_content("Cast")
    end

    it 'I see the count of total reviews for the movie' do
      expect(page).to have_content("7 Reviews")
    end

    it 'I see each reviews author and information for the movie' do
      expect(page).to have_content("Author:")
    end
  end
end

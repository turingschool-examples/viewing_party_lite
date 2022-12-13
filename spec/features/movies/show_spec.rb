# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Movies Detail (show) page' do
  before :each do
    @user = create(:user)
    @godfather_genres = [{ id: 18,
                           name: 'Drama' },
                         { id: 80,
                           name: 'Crime' }]
    @godfather_hash = { id: 238,
                        title: 'The Godfather',
                        vote_average: 8.715,
                        runtime: 175,
                        genres: @godfather_genres,
                        overview: 'Spanning the years 1945 to 1955, a chronicle of the fictional Italian-American Corleone crime family. When organized crime family patriarch, Vito Corleone barely survives an attempt on his life, his youngest son, Michael steps in to take care of the would-be killers, launching a campaign of bloody revenge.' }
    VCR.use_cassette('movie_credits') do
      VCR.use_cassette('movie_reviews') do
        @godfather = MovieHeavy.new(@godfather_hash)
      end
    end

    VCR.use_cassette('search_green_mile') do
      movie_data = MoviesService.search('The Green Mile')[:results].first
      @another_movie = MovieLite.new(movie_data)
    end

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(@user)

    VCR.use_cassette('movie_details') do
      VCR.use_cassette('movie_credits') do
        VCR.use_cassette('movie_reviews') do
          visit "/movies/#{@godfather.id}"
        end
      end
    end
  end

  describe 'as a user' do
    it 'I see a button to create a viewing party' do
      expect(page).to have_button("Create Viewing Party for #{@godfather.movie_title}")

      VCR.use_cassette('movie_details') do
        VCR.use_cassette('movie_credits') do
          VCR.use_cassette('movie_reviews') do
            click_button("Create Viewing Party for #{@godfather.movie_title}")
          end
        end
      end

      expect(current_path).to eq(new_movie_viewing_party_path(@godfather.id))
    end

    it 'I see a button to return to the discover page' do
      expect(page).to have_button('Discover')
      click_button('Discover')

      expect(current_path).to eq(discover_index_path)
    end

    it 'I see the details related to the movie' do
      expect(page).to have_content(@godfather.movie_title)
      expect(page).to have_content(@godfather.vote_average)
      expect(page).to have_content("#{@godfather.runtime / 60}h #{@godfather.runtime % 60}min")

      within('#genre') do
        expect(page).to have_content(@godfather.genres.first[:name])
        expect(page).to have_content(@godfather.genres.last[:name])
      end

      expect(page).to have_content(@godfather.summary)
      within('#cast') do
        expect(page).to have_content(@godfather.first_10_cast_members.first.actor)
        expect(page).to have_content(@godfather.first_10_cast_members.first.character)
        expect(page).to have_content(@godfather.first_10_cast_members[9].actor)
        expect(page).to have_content(@godfather.first_10_cast_members[9].character)
      end
      within('#reviews') do
        expect(page).to have_content(@godfather.reviews.first.author)
        expect(page).to have_content(@godfather.reviews.first.content.gsub(/\n/, ' '))
        expect(page).to have_content(@godfather.reviews.last.author)
        expect(page).to have_content(@godfather.reviews.last.content.gsub(/\n/, ' '))
        expect(page).to have_content("Review Count: #{@godfather.reviews.size}")
      end
    end
    it 'I do not see content related to other movies' do
      expect(page).to_not have_content(@another_movie.movie_title)
    end
  end
end

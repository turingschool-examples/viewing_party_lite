require 'rails_helper'

RSpec.describe 'Movie Details', type: :feature do
  
  let!(:user) { create(:user) }

  before :each do
    movie_id = 14

    @movie = MovieFacade.new(movie_id).movie
    visit user_movie_path(user, movie_id)
  end

  describe 'the movie show page' do
    describe 'navigation' do
      it 'has a button to create a viewing party' do
        click_button "Create Viewing Party for #{@movie.title}" 

        expect(current_path).to eq new_user_movie_viewing_party_path(user, @movie.id)
      end

      it 'has a button to return to the Discover Page' do
        expect(page).to have_button "Discover"
        click_button "Discover"

        expect(current_path).to eq discover_user_path(user)
      end
    end

    describe 'movie data' do
      it 'displays the movies title, vote_avg, runtime, genre, summary, cast, and review info' do

        within ".movie_data" do
          expect(page).to have_content "Vote: #{@movie.vote_average}"
          expect(page).to have_content "Runtime: #{@movie.runtime}"
          expect(page).to have_content "Genre: #{@movie.genres}"
        end

        within "#movie" do
          expect(page).to have_content @movie.title
          expect(page).to have_content @movie.overview

          @movie.cast.each do |cast_member|
            within "#cast" do
              expect(page).to have_content cast_member[:name]
              expect(page).to have_content cast_member[:character]
            end
          end

          expect(page).to have_content "#{@movie.review_total} Reviews"
          @movie.reviews.each do |review|
            within "#reviews" do
              expect(page).to have_content "Review Author: #{review.name}"
              expect(page).to have_content "Review: I first saw this film in my teen years."
            end
          end
        end
      end
    end
  end
end


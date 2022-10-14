require 'rails_helper'

RSpec.describe 'the user movie show page', type: :feature do


  describe 'movie details section' do
    it 'shows the movies details' do
      VCR.use_cassette("user_movies_show", :allow_playback_repeats => true) do
        user = create(:user, id: 50, name: "Bubbles", email: "bubbles@sunnyvale.ca")
        visit "/users/#{user.id}/movies/550"
        within("#movie_details") do
          expect(page).to have_content("Movie Title: Fight Club")
          expect(page).to have_content("Vote Average: 8.433")
          expect(page).to have_content("Runtime: 139")
          expect(page).to have_content("Summary:")
          expect(page).to have_content("Genres: Drama Thriller Comedy")
        end
      end
    end
  end

  describe 'the cast section' do
    it 'shows the first 10 cast members character and name' do
      VCR.use_cassette("user_movies_show_cast", :allow_playback_repeats => true) do
        user = create(:user, id: 50, name: "Bubbles", email: "bubbles@sunnyvale.ca")
        visit "/users/#{user.id}/movies/550"
        within("#cast_info") do
          expect(page).to have_content("Actor:", count: 10)
          expect(page).to have_content("Role:", count: 10)
          expect(page).to have_content("Helena Bonham Carter", count: 1)
          expect(page).to have_content("Angel Face", count: 1)
        end
      end
    end
  end

  describe 'the reviews section' do
    it 'shows the first 10 cast members character and name' do
      VCR.use_cassette("user_movies_show_reviews", :allow_playback_repeats => true) do
        user = create(:user, id: 50, name: "Bubbles", email: "bubbles@sunnyvale.ca")
        visit "/users/#{user.id}/movies/550"
        within("#reviews_info") do
          expect(page).to have_content("Author:", count: 7)
          expect(page).to have_content("Review:", count: 7)
          expect(page).to have_content("Wuchak", count: 1)
          expect(page).to have_content("Madness unbounded. Don't try to make sense of insanity, just ride a wild ride.", count: 1)
        end
      end
    end
  end


end
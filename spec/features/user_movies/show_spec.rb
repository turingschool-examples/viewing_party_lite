require 'rails_helper'

RSpec.describe 'the user movie show page', type: :feature do


  describe 'movie details section' do
    it 'shows the movies details' do
      VCR.use_cassette("user_movies_show", :allow_playback_repeats => true) do
        user = create(:user, id: 50, name: "Bubbles", email: "bubbles@sunnyvale.ca")
        visit "/users/#{user.id}/movies/550"
        within("#movie_details") do
          expect(page).to have_content("Title: Fight Club")
          expect(page).to have_content("Vote Average: 8.433")
          expect(page).to have_content("Runtime: 139")
          expect(page).to have_content("Summary:")
          expect(page).to have_content("Genres: Drama Thriller Comedy")
        end
      end
    end
  end
end
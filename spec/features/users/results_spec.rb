# frozen_string_literal: true

# I should be taken to the movies results page (users/:user_id/movies) where I see:

# Title (As a Link to the Movie Details page)
# Vote Average of the movie
# Details: There should only be a maximum of 20 results. The above details should be listed for each movie.

# I should also see a button to return to the Discover Page.

# require 'rails_helper'

RSpec.describe 'Movie Results Page' do
  describe 'As a User' do
    describe 'when I visit the discover page' do
      describe 'I see a button for top rated movies' do
        describe 'when I click this button' do
          it 'then I am taken to a page where I see top 20 movie titles as links and their vote averages' do
            user1 = create(:user)
            visit "/users/#{user1.id}/movies/"

            expect(page).to have_link('Home')
            expect(page).to have_content('Viewing Party Lite')
            expect(page).to have_content('Vote Average: 8.7')
            expect(page).to have_link('The Godfather')
            expect(page).to have_button('Discover Page')
            expect(page).to have_content('Vote Average', count: 20)
          end
        end
      end
    end
  end
end

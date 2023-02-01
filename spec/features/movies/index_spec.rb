require 'rails_helper'

RSpec.describe 'Movie Results Page' do

  let!(:charlie) { User.create!(name: 'Charlie', email: 'charlie_boy@gmail.com') }

  # xit 'redirects to movies results page (movies index)' do 
  #   visit discover_user_path(charlie) 

  #   click_button "Top Movies"

  #   expect(current_path).to eq user_movies_path(charlie)
  # end

  # xit 'redirects to movies results page (movies index)' do 
  #   visit discover_user_path(charlie) 

  #   click_button "Search"

  #   expect(current_path).to eq user_movies_path(charlie)
  # end

  describe 'when the user visits the movie results page' do
    xit 'lists a maximum of 20 movie results' do
      visit user_movies_path(charlie)

      expect(page.status_code).to eq 200
      # expect(page.results).to be <= 20
    end

    xit 'has a title for each movie as a link to the movie details page' do
    end

    xit 'displays the vote average for each movie' do
    end
  end
end

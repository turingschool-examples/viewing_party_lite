require 'rails_helper'

RSpec.describe 'Movie Index Page', type: :feature do 
  describe 'title section' do 
    it 'has a list of the top rated films', :vcr do 
      user1 = User.create!(name: 'Andrew', email: 'concertenthusiast@musac.org')
      
      visit user_movies_path(user1.id)

      within '.topMovies' do 
        expect(page).to have_content('Doctor Strange in the Multiverse of Madness')
        expect(page).to have_content('Shark Bait')
      end
    end
  end

  xdescribe 'search section' do 
    it 'can find partial matches', :vcr do 
      user1 = User.create!(name: 'Andrew', email: 'concertenthusiast@musac.org')

      visit user_discover_path(user1.id)
      fill_in :search, with: ''

      within '.searchMovies' do 
        
      end
    end
  end
end
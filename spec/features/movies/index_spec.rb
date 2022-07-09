require 'rails_helper'

RSpec.describe 'Movie Index Page', type: :feature do 
  describe 'title section' do 
    it 'has a list of the top rated films with a vote count', :vcr do 
      user1 = User.create!(name: 'Andrew', email: 'concertenthusiast@musac.org')
      user2 = User.create!(name: 'Sai', email: 'allthethings@hottooob.com')
      
      visit user_movies_path(user1.id)
      expect(page.all('.movies').count).to eq(20)
      save_and_open_page
      within '.topMovies' do 
        expect(page).to have_content('Spirited Away')
        expect(page).to have_content('Pulp Fiction')
        expect(page).to have_content(8.7)
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
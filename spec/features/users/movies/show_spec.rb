require 'rails_helper'

RSpec.describe 'Movie Show page' do
  describe 'movie details' do
    before :each do
      @user1 = User.create!(name: 'Jim Bob', email: 'jimb@viewingparty.com')
      @user2 = User.create!(name: 'Cary Berry', email: 'caryb@viewingparty.com')
    end
    
    it 'has the movie title', :vcr do
      @movie = MovieFacade.movie_details(49022)

      visit "/users/#{@user1.id}/movies/#{@movie.id}"

      expect(page).to have_content("Something Borrowed")
    end

    it 'has link to create new viewing party', :vcr do
      @movie = MovieFacade.movie_details(49022)
  
      visit "/users/#{@user1.id}/movies/#{@movie.id}"
  
      expect(page).to have_link("New Viewing Party For Something Borrowed")
    end
  end
end

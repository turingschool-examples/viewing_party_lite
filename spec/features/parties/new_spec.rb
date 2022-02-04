require 'rails_helper'

RSpec.describe 'Party New Page' do
  describe 'view' do
    before(:each) do
      @user_1 = User.create!(name: "David", email: "david@email.com")
    end

    it 'includes all information about the viewing party', :vcr do
      top_movie = MovieFacade.top_movies.first

      visit "/users/#{@user_1.id}/movies/#{top_movie.id}/viewing-party/new"

      fill_in :duration, with: '180'
      fill_in :day, with: '02/03/21'
      fill_in :start_time, with: '7:00'

      click_button 'Submit'
      expect(current_path).to eq("/users/#{@user_1.id}")


      expect(page).to have_content(top_movie.title)
      expect(page).to have_content("Start Time: 2000-01-01 07:00:00")
    end
    it 'sad path: all fields blank', :vcr do
      top_movie = MovieFacade.top_movies.first

      visit "/users/#{@user_1.id}/movies/#{top_movie.id}/viewing-party/new"

      click_button 'Submit'
      expect(current_path).to eq("/users/#{@user_1.id}/movies/#{top_movie.id}/viewing-parties")

      expect(page).to have_content("2 errors prohibited this post from being saved")
      expect(page).to have_content("Day can't be blank")
      expect(page).to have_content("Start time can't be blank")
    end
  end
end

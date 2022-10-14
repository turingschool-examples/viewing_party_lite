require 'rails_helper'

RSpec.describe 'User Movie Show Page' do
  describe 'user visits the movie show page' do

    before :each do
      @user_1 = create(:user)
      movie = File.read('./spec/fixtures/fight_club.json')
      movie_data = JSON.parse(movie, symbolize_names: true)
      @fight_club = Movie.new(movie_data)

    end

    it 'has a button to create a viewing party' do
      visit user_movie_path(@user_1, @fight_club.id)
      click_button "Create Viewing Party"
      expect(current_path).to eq(new_user_movie_viewing_party_path(@user_1, @fight_club.id))
    end

    it 'has a button to return to discover page' do
      visit user_movie_path(@user_1, @fight_club.id)

      click_button "Discover Page"
      expect(current_path).to eq(user_discover_index_path(@user_1))
    end

    it 'shows all the movie information' do
      visit user_movie_path(@user_1, @fight_club.id)
      expect(page).to have_content(@fight_club.original_title)
      expect(page).to have_content(@fight_club.genre_names)
      expect(page).to have_content(@fight_club.overview)
      expect(page).to have_content(@fight_club.standard_runtime)
      expect(page).to have_content(@fight_club.vote_average)
      expect(page).to have_content(@fight_club.vote_count)

      #missing 10 cast members
      #missing each reiews author and information

    end
  end
end

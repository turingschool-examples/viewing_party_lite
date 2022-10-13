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
      visit user_movie_path(@user_1, @fight_club)

      click_button "Create Viewing Party"
      expect(current_path).to eq(new_user_movie_viewing_party_path(@user_1, @fight_club))
    end

    it 'has a button to return to discover page' do
      visit user_movie_path(@user_1, @fight_club)

      click_button "Discover Page"
      expect(current_path).to eq(user_discover_index_path(@user_1))
    end
  end
end

require 'rails_helper'

RSpec.describe 'Discover Page' do
  describe 'happy path' do
    before(:each) do
      @user = User.create!(name: 'Trevor', email: 'trev@yahoo.com')
    end

    it 'should have a button to discover top 20 rated movies' do
      visit user_discover_index_path(@user)
      VCR.use_cassette('top_20_api') do
        click_on 'Find Top Rated Movies'
        expect(current_path).to eq(user_movies_path(@user))
      end
    end

    it 'has a search bar to find up to 40 movies' do
      visit user_discover_index_path(@user)
      VCR.use_cassette('fight_results_api') do
        fill_in "Search", with: "fight"
        click_on 'Find Movies'
        expect(current_path).to eq(user_movies_path(@user))
      end
    end
  end
end

require 'rails_helper'

RSpec.describe 'Discover Page' do
  describe 'happy path' do
    before(:each) do
      @user = User.create!(name: 'Trevor', email: 'trev@yahoo.com')
    end
    #these two tests might ping the API, not sure
    it 'should have a button to discover top 20 rated movies' do
      visit user_discover_index_path(@user)

      click_on 'Find Top Rated Movies'
      expect(current_path).to eq(user_movies_path(@user))
    end

    it 'has a search bar to find up to 40 movies' do
      visit user_discover_index_path(@user)
      vcr.use_cassette
      fill_in "Search", with: "fight"
      click_on 'Find Movies'
      expect(current_path).to eq(user_movies_path(@user))
    end
  end
end

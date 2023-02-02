require 'rails_helper'

RSpec.describe 'Discover Movies Page' do
  describe 'as a user when i visit /users/:id/discover' do
    before :each do
      @user = User.create!(name: 'Drew', email: 'drew@example.com')
    end

    it 'has a link to discover top rated movies' do
      stub_request(:get, "https://api.themoviedb.org/3/movie/top_rated?api_key=d15da2c6fe48d15a51f43f47b05c0ed1&language=en-US&page=1").
        to_return(status: 200, body: File.read('spec/fixtures/top_movies_response.json'), headers: {})

      visit user_discover_index_path(@user)

      expect(page).to have_button 'Find Top Rated Movies'
      click_button 'Find Top Rated Movies'

      expect(page).to have_current_path "/users/#{@user.id}/movies?q=top+rated"
    end
    
    it 'Has a search field for movie names' do
      visit user_discover_index_path(@user)

      expect(page).to have_field :keyword
      fill_in :keyword, with: 'Fast'
      click_on 'Find Movies'

      expect(page).to have_current_path "/users/#{@user.id}/movies?utf8=%E2%9C%93&keyword=Fast&commit=Find+Movies"
    end
  end
end
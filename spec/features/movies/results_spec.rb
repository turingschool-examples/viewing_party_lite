require 'rails_helper'

RSpec.describe 'Movies Results Page Feature' do
  describe 'Movies Results Page', :vcr do
    before :each do
      @user1 = create(:user)
    end
    describe 'When I visit discover movies page and click Top Movies button' do
      it 'I should be taken to the movies results page' do
        visit user_discover_path(@user1)
        click_button("Find Top Rated Movies")
        expect(current_path).to eq(user_movies_path(@user1))
      end

      it 'movies results page should have the 20 top rated movies' do
        visit user_discover_path(@user1)
        click_button("Find Top Rated Movies")

      end
    end
#     When I visit the discover movies page,
# and click on either the Top Movies button or the Search button,
# I should be taken to the movies results page (users/:user_id/movies?q=top%20rated, /users/:user_id/movies?q=keyword respectively) where I see:
  end
end
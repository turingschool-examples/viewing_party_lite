require 'rails_helper'

RSpec.describe 'New Viewing Party Page' do
  describe 'When I visit new viewing party page', :vcr do
    before :each do
      @user_1 = create(:user)
      @user_2 = create(:user)
    end

    it 'I see the name of the movie title' do
      visit new_user_movie_viewing_party_path(@user_1, 278)
      expect(page).to have_content("The Shawshank Redemption")
    end

    it 'Has button to return to Discover Page' do
      click_button("Discover Page")
      expect(current_path).to eq(user_discover_path(@user1))
    end

    
  end
end
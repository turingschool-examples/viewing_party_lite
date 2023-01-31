require 'rails_helper'

RSpec.describe 'user show page' do
  before(:each) do
    @user1 = create(:user)

    visit user_path(@user1)
  end

  describe 'When I go to a user dashbaord' do
    it 'has a button "Discover"' do
      expect(page).to have_button('Discover')
    end

    it 'routes to discover page \'/users/:id/discover\' after click "Discover Movies" button' do
      click_on('Discover')

      expect(current_path).to eq(user_discover_index_path(@user1))
    end
  end
end

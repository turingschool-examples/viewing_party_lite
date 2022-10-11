require 'rails_helper'

RSpec.describe 'User Dashboard Page' do
  describe 'user visits the dashboard page' do
    before :each do
      @users_1 = create_list(:user, 20)
    end

#     "<user's name>'s Dashboard" at the top of the page
# A button to Discover Movies*
# A section that lists viewing parties**

    it 'shows users name at the top of the page' do
      visit user_path(@users_1[0])
      expect(page).to have_content("#{@users_1[0].name}'s Dashboard")

      visit user_path(@users_1[2])
      expect(page).to have_content("#{@users_1[2].name}'s Dashboard")
    end

    it 'has a button to discover movies' do
      visit user_path(@users_1[0])
      click_button "Discover Movies"
      expect(current_path).to eq(user_discover_path(@users_1[0]))
    end 
  end
end

require 'rails_helper'

RSpec.describe 'User Dashboard Page', type: :feature do
  before(:each) do
    @user1 = User.create!(name: 'Parker', email: 'mangaforever@hootube.net')
    @user2 = User.create!(name: 'Lola', email: 'lola@example.com')
  end

  describe 'data is displayed on page'do

    it 'shows user name on dashboard' do
      visit user_path(@user1.id)
      expect(page).to have_content("#{@user1.name}'s Dashboard")
      expect(page).to_not have_content("#{@user2.name}'s Dashboard")
    end

    it 'has a button to Discover Movies' do
      visit user_path(@user1.id)
      expect(page).to have_button('Discover Movies')
      click_button('Discover Movies')
      expect(current_path).to eq("/users/#{@user1.id}/discover")
      expect(page).to have_content("#{@user1.name}'s Discover Page")
    end

    it "has a section that listing viewing parties" do
      visit user_path(@user1.id)
      expect(page).to have_content("Viewing Parties")
    end
  end
end

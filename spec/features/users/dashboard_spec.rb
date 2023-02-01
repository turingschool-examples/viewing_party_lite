require 'rails_helper'

RSpec.describe 'User Dashboard' do
  describe 'As a user when I visit /users/:id' do
    before :each do
      @user_1 = User.create!(name: 'Drew', email: 'drew@example.com')
      @vp_1 = @user_1.viewing_parties.create!(start_day: Date.today)
    end

    it 'Displays the name of the user' do
      visit user_path(@user_1)

      expect(page).to have_content("#{@user_1.name}'s Dashboard")
    end

    it 'Has button to Discover Movies page' do
      visit user_path(@user_1)

      expect(page).to have_button('Discover Movies')
      
      click_button 'Discover Movies'
      
      expect(current_path).to eq(user_discover_index_path(@user_1))
    end

    it 'Has a section for viewing parties' do
      visit user_path(@user_1)

      expect(page).to have_content('Viewing Parties')
    end
  end
end
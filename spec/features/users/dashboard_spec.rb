require 'rails_helper'

RSpec.describe 'User Dashboard Page' do
  describe 'When I visit /users/:id where :id is a valid user id' do
    before :each do
      @user_1 = create(:user)
      @user_2 = create(:user)

      @viewing_party1 = create(:viewing_party)
      @viewing_party2 = create(:viewing_party)

      create(:viewing_party_users, user: @user_1, viewing_party: @viewing_party1)
      create(:viewing_party_users, user: @user_1, viewing_party: @viewing_party2)

      create(:viewing_party_users, user: @user_2, viewing_party: @viewing_party1)
      create(:viewing_party_users, user: @user_2, viewing_party: @viewing_party2)
    end

    it 'I should see <users name>s Dashboard at the top of the page' do
      visit user_path(@user_1)
      expect(page).to have_content("#{@user_1.name}'s Dashboard")
      expect(page).to_not have_content("#{@user_2.name}'s Dashboard")

      visit user_path(@user_2)
      expect(page).to have_content("#{@user_2.name}'s Dashboard")
      expect(page).to_not have_content("#{@user_1.name}'s Dashboard")
    end

    it 'I see A button to Discover Movies' do
      visit user_path(@user_1)
      click_button 'Discover Movies'
      expect(current_path).to eq(user_discover_path(@user_1))

      visit user_path(@user_2)
      click_button 'Discover Movies'
      expect(current_path).to eq(user_discover_path(@user_2))
    end

    it 'A section that lists viewing parties' do
      visit user_path(@user_1)
      expect(page).to have_content('Viewing Parties')

      visit user_path(@user_2)
      expect(page).to have_content('Viewing Parties')
    end
  end
end

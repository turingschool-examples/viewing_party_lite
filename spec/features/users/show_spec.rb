require 'rails_helper'

RSpec.describe 'user show page' do
  before(:each) do
    @user1 = create(:user)
    @viewing_party1 = create(:viewing_party, movie_id: 550)
    @viewing_party2 = create(:viewing_party, movie_id: 540)
    @viewing_party3 = create(:viewing_party, movie_id: 530)
    @viewing_party4 = create(:viewing_party, movie_id: 570)

    @user_viewing_party1 = UserViewingParty.create(user: @user1, viewing_party: @viewing_party1, host: true)
    @user_viewing_party2 = UserViewingParty.create(user: @user1, viewing_party: @viewing_party2, host: true)
    @user_viewing_party3 = UserViewingParty.create(user: @user1, viewing_party: @viewing_party3, host: true)

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

    it 'shows "<user\'s name>\'s Dashboard"' do
      expect(page).to have_content("#{@user1.name}'s Dashboard")
    end

    it 'lists viewing parties' do
      expect(page).to have_content(@viewing_party1.get_movie)
      expect(page).to have_content(@viewing_party2.get_movie)
      expect(page).to have_content(@viewing_party3.get_movie)
      expect(page).to_not have_content(@viewing_party4.get_movie)
    end
  end
end

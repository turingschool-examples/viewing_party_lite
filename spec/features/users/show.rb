require 'rails_helper'

RSpec.describe 'user show page' do
  before(:each) do
    @user1 = create(:user)
    @user2 = create(:user)
    @user3 = create(:user)
    @viewing_party1 = create(:viewing_party, movie_id: 550)
    @viewing_party2 = create(:viewing_party, movie_id: 540)
    @viewing_party3 = create(:viewing_party, movie_id: 530)
    @viewing_party4 = create(:viewing_party, movie_id: 570)

    @user_viewing_party1 = UserViewingParty.create(user: @user1, viewing_party: @viewing_party1, host: true)
    @user_viewing_party2 = UserViewingParty.create(user: @user1, viewing_party: @viewing_party2, host: true)
    @user_viewing_party3 = UserViewingParty.create(user: @user1, viewing_party: @viewing_party3, host: false)
    @user_viewing_party3 = UserViewingParty.create(user: @user2, viewing_party: @viewing_party3, host: true)

    visit user_path(@user1)
  end

  describe 'When I go to a user dashbaord' do
    it 'has a button "Discover Movies"' do
      expect(page).to have_button('Discover Movies')
    end

    it 'routes to discover page \'/users/:id/discover\' after click "Discover Movies" button' do
      click_on('Discover Movies')

      expect(current_path).to eq(user_discover_index_path(@user1))
    end

    it 'shows "<user\'s name>\'s Dashboard"' do
      expect(page).to have_content("#{@user1.name}'s Dashboard")
    end

    it 'lists viewing parties which the user is the host' do
      within("#party-#{@viewing_party1.id}") do
        expect(page).to have_content(@viewing_party1.movie_title)
        expect(page).to have_content(@viewing_party1.date)
        expect(page).to have_content(@viewing_party1.start_time.strftime("%l:%M %P"))
        expect(page).to_not have_content(@viewing_party2.movie_title)
        expect(page).to have_content("Host: #{@user1.name}")
      end

      within("#attending#{@viewing_party3.id}") do
        expect(page).to have_content("#{@user1.name}")
        expect(page).to_not have_content("#{@user3.name}")
      end
    end

    it 'lists viewing parties which the user has been invited' do
      within("#party-#{@viewing_party3.id}") do
        expect(page).to have_content(@viewing_party3.movie_title)
        expect(page).to have_content(@viewing_party3.date)
        expect(page).to have_content(@viewing_party3.start_time.strftime("%l:%M %P"))
        expect(page).to_not have_content(@viewing_party2.movie_title)
        expect(page).to have_content("Host: #{@user_viewing_party3.host_user}")
      end

      within("#attending#{@viewing_party3.id}") do
        expect(page).to have_content("#{@user1.name}")
        expect(page).to have_content("#{@user2.name}")
        expect(page).to_not have_content("#{@user3.name}")
      end
    end

    it 'displays movie poster image' do
      expect(page).to have_xpath('/html/body/div[1]/img')
    end
  end
end

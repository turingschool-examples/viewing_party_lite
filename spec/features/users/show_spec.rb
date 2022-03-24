require 'rails_helper'

RSpec.describe 'User Dashboard Page' do
  before(:each) do
    @vp1 = ViewingParty.create!(movie_id: 111, duration: 151, date: Time.new(2022, 0o4, 12, 21, 0o0),
                                start_time: Time.new(2022, 0o4, 12, 21, 0o0))
    @vp2 = ViewingParty.create!(movie_id: 112, duration: 152, date: Time.new(2022, 0o4, 11, 20, 30),
                                start_time: Time.new(2022, 0o4, 11, 20, 30))
    @user1 = User.create!(name: 'Becky', email: 'becky@example.com')
    @user2 = User.create!(name: 'Steven', email: 'steven@example.com')
    @user5 = User.create!(name: 'Bruce', email: 'Bruce@example.com')
    @user6 = User.create!(name: 'Tony', email: 'Tony@example.com')
    @up1 = UserParty.create!(viewing_party: @vp1, user: @user1, host: true)
    @up2 = UserParty.create!(viewing_party: @vp1, user: @user2, host: false)
    @up5 = UserParty.create!(viewing_party: @vp2, user: @user5, host: true)
    @up6 = UserParty.create!(viewing_party: @vp2, user: @user6, host: false)

    visit user_path(@user1)
  end

  context 'data is displayed on page' do
    it 'shows user name on dashboard header' do
      expect(page).to have_content("#{@user1.name}'s Dashboard")
      expect(page).to_not have_content("#{@user2.name}'s Dashboard")
    end
    it 'has a button to Discover Movies' do
      expect(page).to have_button('Discover Movies')
      click_button('Discover Movies')
      expect(current_path).to eq(user_discover_index_path(@user1))
    end
    it 'has a section that lists viewing parties' do
      within '#viewing_parties' do
        expect(page).to have_content('Viewing Parties')
      end
    end
  end
end

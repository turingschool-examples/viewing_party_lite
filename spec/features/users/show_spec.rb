require 'rails_helper'

RSpec.describe 'user show page', type: :feature do
  let!(:u1) { create(:user) }
  let!(:u2) { create(:user) }

  describe "when I visit '/users/:id' where :id is a valid user id, it" do
    it 'displays the users name' do
      visit user_path(u1)

      expect(page).to have_content("#{u1.name}'s Dashboard")

      visit user_path(u2)

      expect(page).to have_content("#{u2.name}'s Dashboard")
    end

    it "displays a 'Discover Movies' button" do
      visit user_path(u1)

      expect(page).to have_button('Discover Movies')

      click_button 'Discover Movies'

      expect(current_path).to eq discover_user_path(u1)
    end

    it 'displays a section that lists viewing parties' do
      WebMock.allow_net_connect!
      users = create_list(:user, 10)

      vp1 = create(:viewing_party, host: u1)
      vp2 = create(:viewing_party, host: u1)
      vp3 = create(:viewing_party, host: u1)
      vp4 = create(:viewing_party, host: users[0])

      create(:viewing_party_user, viewing_party: vp1, user: users[0])
      create(:viewing_party_user, viewing_party: vp1, user: users[1])
      create(:viewing_party_user, viewing_party: vp1, user: users[2])
      create(:viewing_party_user, viewing_party: vp1, user: users[3])
      create(:viewing_party_user, viewing_party: vp2, user: users[3])
      create(:viewing_party_user, viewing_party: vp2, user: users[4])
      create(:viewing_party_user, viewing_party: vp2, user: users[5])
      create(:viewing_party_user, viewing_party: vp2, user: users[6])
      create(:viewing_party_user, viewing_party: vp2, user: users[7])
      create(:viewing_party_user, viewing_party: vp3, user: users[7])
      create(:viewing_party_user, viewing_party: vp3, user: users[8])
      create(:viewing_party_user, viewing_party: vp3, user: users[9])
      create(:viewing_party_user, viewing_party: vp4, user: u1)

      visit user_path(u1)

      within '#viewing-parties' do
        expect(page).to have_content("#{vp1.movie_details(vp1.movie_api_id).title}", count: 1)
        expect(page).to have_content("#{vp2.movie_details(vp1.movie_api_id).title}", count: 1)
        expect(page).to have_content("#{vp3.movie_details(vp1.movie_api_id).title}", count: 1)
      end

      save_and_open_page
    end
  end
end

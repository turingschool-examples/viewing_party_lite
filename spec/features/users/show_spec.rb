require 'rails_helper'

RSpec.describe 'User dashboard' do
  describe 'when I visit a user dashboard' do
    before(:each) do
      @user_1 = User.create!(name: 'William', email: 'william@gmail.com')
      @user_2 = User.create!(name: 'Christian', email: 'christian@gmail.com')
      @user_3 = User.create!(name: 'Fake', email: 'fake@gmail.com')

      @viewing_party_1 = ViewingParty.create!(title: 'Top Gun', duration: 120, start_time: '14:22', host: @user_2.id)
      @viewing_party_2 = ViewingParty.create!(title: 'Hereditary', duration: 111, start_time: '09:46', host: @user_1.id)

      @viewing_party_user_1 = ViewingPartyUser.create!(user_id: @user_1.id, viewing_party_id: @viewing_party_1.id)
      @viewing_party_user_2 = ViewingPartyUser.create!(user_id: @user_2.id, viewing_party_id: @viewing_party_1.id)

      @viewing_party_user_3 = ViewingPartyUser.create!(user_id: @user_1.id, viewing_party_id: @viewing_party_2.id)
      @viewing_party_user_4 = ViewingPartyUser.create!(user_id: @user_2.id, viewing_party_id: @viewing_party_2.id)

      visit user_path(@user_1)
    end

    it 'displays the users name at the top of the page' do
      expect(page).to have_content("#{@user_1.name}'s Dashboard")
    end

    it 'has a button to Discover Movies' do
      expect(page).to have_button('Discover Movies')
    end

    it 'has a link that takes you to a discover page' do
      click_on 'Discover Movies' do
        expect(current_path).to eq("/users/#{@user_1.id}/discover")
      end
    end
    it 'has a section that lists viewing parties with a link to the movie show page' do
      within("##{@viewing_party_1.id}") do
        expect(page).to have_content(@viewing_party_1.title)
        expect(page).to have_link('Top Gun')
        expect(page).to have_content(@viewing_party_1.start_time)
        expect(page).to have_content(@user_1.name)
        expect(page).to have_content("Host: #{@user_2.name}")
      end
      within("##{@viewing_party_2.id}") do
        expect(page).to have_content(@viewing_party_2.title)
        expect(page).to have_link('Hereditary')
        expect(page).to have_content(@viewing_party_2.start_time)
        expect(page).to have_content(@user_2.name)
        expect(page).to have_content("Host: #{@user_1.name}")
      end
    end
  end
end

require 'rails_helper'

RSpec.describe 'New Viewing Party Page' do
  describe 'When I visit new viewing party page', :vcr do
    before :each do
      @user_1 = create(:user)
      @user_2 = create(:user)
      @user_3 = create(:user)
    end

    it 'I see the name of the movie title' do
      visit new_user_movie_viewing_party_path(@user_1, 278)
      expect(page).to have_content("The Shawshank Redemption")
    end

    it 'Has button to return to Discover Page' do
      visit new_user_movie_viewing_party_path(@user_1, 278)
      click_button("Discover Page")
      expect(current_path).to eq(user_discover_path(@user_1))
    end

    it 'each user has a checkbox to invite user to party, labeled by user name/email' do
      visit new_user_movie_viewing_party_path(@user_1, 278)

      within "#user_checkbox_#{@user_2.id}" do
        expect(page).to have_content(@user_2.name)
        expect(page).to have_content(@user_2.email)
        check "user_#{@user_2.id}" 
        expect(page).to_not have_content(@user_1.name)
        expect(page).to_not have_content(@user_1.email)
        expect(page).to_not have_content(@user_3.name)
        expect(page).to_not have_content(@user_3.email)
      end
    end

    it 'Has form fields for duration, day, time. And checkboxes to invite users. Happy path - Viewing party is created and associated with host and invited people' do
      visit new_user_movie_viewing_party_path(@user_1, 278)
      expect(@user_1.viewing_parties).to eq([])
      fill_in "Duration", with: "143"
      fill_in "Date", with: "Tue, 11 Oct 2022"
      fill_in "Time", with: "6:00 PM"
      check "user_#{@user_2.id}" 
      check "user_#{@user_3.id}"
      click_button("Create Party")
      expect(@user_1.viewing_parties.reload.present?).to eq(true) 
      expect(@user_2.viewing_parties.reload.present?).to eq(true) 
      expect(@user_3.viewing_parties.reload.present?).to eq(true) 
    end

    it 'Sad path - some fields are not entered, so viewing party not created' do
      visit new_user_movie_viewing_party_path(@user_1, 278)
      expect(@user_1.viewing_parties).to eq([])
      fill_in "Duration", with: "143"
      fill_in "Time", with: "6:00 PM"
      check "user_#{@user_2.id}" 
      check "user_#{@user_3.id}"
      click_button("Create Party")
      expect(page).to have_content("Date can't be blank")
      expect(@user_1.viewing_parties).to eq([])
    end

    it 'Sad path - viewing party not created if party duration less than move runtime' do
      visit new_user_movie_viewing_party_path(@user_1, 278)
      expect(@user_1.viewing_parties).to eq([])
      fill_in "Duration", with: "100"
      fill_in "Date", with: "Tue, 11 Oct 2022"
      fill_in "Time", with: "6:00 PM"
      check "user_#{@user_2.id}" 
      check "user_#{@user_3.id}"
      click_button("Create Party")

      expect(page).to have_content("Party duration must be greater than movie runtime and all fields must be filled in")
      expect(@user_1.viewing_parties).to eq([])
    end
  end
end
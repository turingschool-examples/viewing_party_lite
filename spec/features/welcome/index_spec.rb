require 'rails_helper'

RSpec.describe 'landing page' do
  describe 'when a user visits the landing page' do
    before(:each) do
      @user_1 = User.create!(name: 'William', email: 'william@gmail.com')
      @user_2 = User.create!(name: 'Christian', email: 'christian@gmail.com')
      @user_3 = User.create!(name: 'Fake', email: 'fake@gmail.com')

      @viewing_party_1 = ViewingParty.create!(title: 'Top Gun', duration: 120, start_time: '14:22')
      @viewing_party_2 = ViewingParty.create!(title: 'Hereditary', duration: 111, start_time: '09:46')

      @viewing_party_user_1 = ViewingPartyUser.create!(user_id: @user_1.id, viewing_party_id: @viewing_party_1.id)
      @viewing_party_user_2 = ViewingPartyUser.create!(user_id: @user_2.id, viewing_party_id: @viewing_party_1.id)
      
      visit '/'
    end

    it 'displays title of application' do
      expect(page).to have_content('Viewing Party')
    end

    it 'has a button to create a new user' do
      expect(page).to have_button('New User')
    end

    it 'has a list of existing users which links to the users dashboard' do
      expect(page).to have_content('User Dashboard')
      expect(page).to have_content('William')
      expect(page).to have_content('Christian')
      expect(page).to have_content('Fake')
    end

    it 'has a Link to go back to the landing page' do
      expect(page).to have_content('Home')
    end
  end
end
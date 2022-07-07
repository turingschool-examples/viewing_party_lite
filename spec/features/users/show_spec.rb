require 'rails_helper'

RSpec.describe 'User Dashboard Page' do
  before(:each) do
    @vparty1 = ViewingParty.create!(movie_id: 111, duration: 190, date: Time.new(2022, 0o4, 12, 21, 0o0),
                                start_time: Time.new(2022, 0o4, 12, 21, 0o0))
    @vparty2 = ViewingParty.create!(movie_id: 550, duration: 152, date: Time.new(2022, 0o4, 11, 20, 30),
                                start_time: Time.new(2022, 0o4, 11, 20, 30))
    @vparty3 = ViewingParty.create!(movie_id: 314, duration: 154, date: Time.new(2022, 0o4, 14, 18, 30),
                                start_time: Time.new(2022, 0o4, 14, 18, 30))
    @user1 = User.create!(name: 'Ana', email: 'ana@example.com')

    # visit login_form_path
    # fill_in 'email', with: 'ana@example.com'
    # # fill_in 'password', with: 'hola'
    # click_button 'Submit'

    @user2 = User.create!(name: 'Lola', email: 'lola@example.com')
    @user3 = User.create!(name: 'Manolo', email: 'manolo@example.com')
    @uvparty1 = UserViewingParty.create!(viewing_party: @vparty1, user: @user1, host: true)
    @uvparty2 = UserViewingParty.create!(viewing_party: @vparty1, user: @user2, host: true)
    @uvparty3 = UserViewingParty.create!(viewing_party: @vparty2, user: @user3, host: true)
    @uvparty4 = UserViewingParty.create!(viewing_party: @vparty2, user: @user1, host: true)

    # visit '/users/:id'
  end

  describe 'data is displayed on page', :vcr do

    xit 'shows user name on dashboard' do
      # save_and_open_page
      expect(page).to have_content("#{@user1.name}'s Dashboard")
      expect(page).to_not have_content("#{@user2.name}'s Dashboard")
    end

    it 'has a button to Discover Movies', :vcr do
      expect(page).to have_button('Discover Movies')
      click_button('Discover Movies')
      
    end

    xit 'has a section that lists viewing parties', :vcr do
      within '#viewing_parties' do
        expect(page).to have_content('Viewing Parties')
      end
    end
  end
end

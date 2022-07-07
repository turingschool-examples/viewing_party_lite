require 'rails_helper'

RSpec.describe 'User Dashboard Page' do
  before(:each) do
    # @vparty1 = ViewingParty.create!(movie_id: 111, duration: 190, date: Time.new(2022, 0o4, 12, 21, 0o0),
    #                             start_time: Time.new(2022, 0o4, 12, 21, 0o0))
    # @vparty2 = ViewingParty.create!(movie_id: 550, duration: 152, date: Time.new(2022, 0o4, 11, 20, 30),
    #                             start_time: Time.new(2022, 0o4, 11, 20, 30))
    # @vparty3 = ViewingParty.create!(movie_id: 314, duration: 154, date: Time.new(2022, 0o4, 14, 18, 30),
    #                             start_time: Time.new(2022, 0o4, 14, 18, 30))
    @user1 = User.create!(name: 'Ana', email: 'ana@example.com')
    @user2 = User.create!(name: 'Lola', email: 'lola@example.com')
    @user3 = User.create!(name: 'Manolo', email: 'manolo@example.com')

    # @uvparty1 = UserViewingParty.create!(viewing_party: @vparty1, user: @user1, host: true)
    # @uvparty2 = UserViewingParty.create!(viewing_party: @vparty1, user: @user2, host: false)
    # @uvparty3 = UserViewingParty.create!(viewing_party: @vparty2, user: @user3, host: false)
    # @uvparty4 = UserViewingParty.create!(viewing_party: @vparty2, user: @user1, host: true)

    # visit '/users/:id'
  end

  describe 'data is displayed on page'do

    it 'shows user name on dashboard' do
      # save_and_open_page
      visit user_path(@user1.id)
      expect(page).to have_content("#{@user1.name}'s Dashboard")
      expect(page).to_not have_content("#{@user2.name}'s Dashboard")
    end

    it 'has a button to Discover Movies' do
      visit user_path(@user1.id)
      expect(page).to have_button('Discover Movies')
      click_button('Discover Movies')
      expect(current_path).to eq("/users/#{@user1.id}/discover")
    end

    it "has a section that listing viewing parties" do
      visit user_path(@user1.id)
      expect(page).to have_content("Viewing Parties")
    end
  end
end

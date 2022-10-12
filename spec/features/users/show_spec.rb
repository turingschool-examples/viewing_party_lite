# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'User | Show', type: :feature do
  describe 'When I visit user/:id where :id is a valid id;' do
    before(:each) do
      @user1 = User.create!(name: 'jojo binks', email: 'jojo_binks@gmail.com')
      @user2 = User.create!(name: 'bobby', email: 'bobby@yahoo.com')
      @user3 = User.create!(name: 'marissa nicole', email: 'marissa.nicole99@gmail.com')
      @vp1 = @user1.viewing_parties.create!(duration: 180, date: '2022-10-11 17:19:58', time: '17:08', movie_id: 1)
      @vp2 = @user1.viewing_parties.create!(duration: 180, date: '2022-10-12 16:18:58', time: '19:08', movie_id: 128)
      visit user_path(@user1.id)
    end
    it 'I see the users name at the top of the page' do
      within('#user_name') do
        expect(page).to have_content("#{@user1.name}'s dashboard")
        expect(page).to_not have_content("#{@user2.name}'s dashboard")
        expect(page).to_not have_content("#{@user3.name}'s dashboard")
      end
    end
    it 'I see a button to discover movies' do
      within('#discover') do
        expect(page).to have_button('Discover Movies')
        click_on 'Discover Movies'
        expect(page.current_path).to eq user_discover_index_path(@user1.id)
      end
    end
    it 'I see a section that lists all of my viewing parties' do
      within('#viewing_parties') do
        # TODO: Add check to make sure movie.name exists in this instance
        # TODO: Add check to make sure hosting/invited exists in this instance
        within("#party-#{@vp1.id}") do
          expect(page).to have_content('October 11, 2022 05:19 PM')
          expect(page).to_not have_content('October 12, 2022 04:18 PM')
        end
        within("#party-#{@vp2.id}") do
          expect(page).to have_content('October 12, 2022 04:18 PM')
          expect(page).to_not have_content('October 11, 2022 05:19 PM')
        end
      end
    end
  end
end

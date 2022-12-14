# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'user show page' do
  describe 'As a visitor' do
    describe 'When I visit the landing page' do
      describe 'And then try to visit my show page' do
        it 'I remain on the landing page And I see a message telling me that I must be logged in or registered to access my dashboard' do
          user = create(:user)

          visit '/dashboard'

          expect(current_path).to eq(root_path)
          expect(page).to have_content('You must be logged in or registered to access that page')
        end
      end
    end
  end

  describe 'As a registered user' do
    before :each do
      @user1 = create(:user)

      @viewing_party1 = ViewingParty.create!(movie_id: 11, duration: 180, date: 'November 30, 2022',
                                             start_time: '7 PM')
      @viewing_party2 = ViewingParty.create!(movie_id: 550, duration: 175, date: 'December 14, 2022',
                                             start_time: '6:30 PM')
      @vpu1 = ViewingPartyUser.create!(user: @user1, viewing_party: @viewing_party1)
      @vpu2 = ViewingPartyUser.create!(user: @user1, viewing_party: @viewing_party2, host: 1)

      visit '/login'
      fill_in :email, with: @user1.email
      fill_in :password, with: @user1.password

      click_on 'Log In'
    end

    describe ' When I visit my show page' do
      describe 'should see' do
        it 'has user information', :vcr do
          visit '/dashboard'
          # save_and_open_page
          expect(page).to have_link('Home')
          expect(page).to have_content('Viewing Party Lite')
          expect(page).to have_content("#{@user1.name}'s Dashboard")
          expect(page).to have_button('Discover Movies')
        end
      end

      describe 'viewing party section' do
        it 'has a list of users viewing parties', :vcr do
          visit '/dashboard'
          # save_and_open_page

          within("#viewing_party-#{@viewing_party1.id}") do
            expect(page).to have_content('Date: 11/30/2022')
            expect(page).to have_content('Start Time: 07:00PM')
            expect(page).to have_content('Party Length: 180 Minutes')
            expect(page).to have_content('Invited')
            expect(page).to have_css('.movie_poster')
            expect(page).to have_link('Star Wars')
          end

          within("#viewing_party-#{@viewing_party2.id}") do
            expect(page).to have_content('Date: 12/14/2022')
            expect(page).to have_content('Start Time: 06:30PM')
            expect(page).to have_content('Party Length: 175 Minutes')
            expect(page).to have_content('Hosting')
            expect(page).to have_css('.movie_poster')
            expect(page).to have_link('Fight Club')
          end
        end
      end

      describe "When I click on 'Discover Movies' " do
        it "I am redirected to a discover page '/users/:id/discover' ", :vcr do
          visit '/dashboard'
          # save_and_open_page
          click_button('Discover Movies')

          expect(current_path).to eq("/users/#{@user1.id}/discover")
        end
      end
    end
  end
end

# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Viewing Part new page' do
  describe 'As a registered User' do
    before :each do
      @user1 = User.create!(name: 'Eli Fuchsman', email: 'eli@gmail.com', password: 'test2')
      @user2 = User.create!(name: 'Kristen Nestler', email: 'kristen@gmail.com', password: 'test2')
      @user3 = User.create!(name: 'John John', email: 'John@gmail.com', password: 'test2')
      @user4 = User.create!(name: 'Luke Skywalker', email: 'luke@gmail.com', password: 'test2')
      @user5 = User.create!(name: 'Michael Corleone', email: 'mike@gmail.com', password: 'test2')
      @user6 = User.create!(name: 'Tony Montana', email: 'tony@gmail.com', password: 'test2')
      @user7 = User.create!(name: 'Bruce Wayne', email: 'bruce@gmail.com', password: 'test2')
      @user8 = User.create!(name: 'Harvey Dent', email: 'harvey@gmail.com', password: 'test2')

      visit '/login'
      fill_in :email, with: @user2.email
      fill_in :password, with: @user2.password

      click_on 'Log In'
      @movie_id = 11
      @movie = MovieService.movie_by_id(@movie_id)
    end

    describe 'When I visit the new viewing party page /users/:user_id/movies/:movie_id/viewing-party/new' do
      it 'I should see the name of the movie title rendered above a form to create a new party', :vcr do
        visit "/users/#{@user2.id}/movies/#{@movie_id}/viewing-party/new"
        # save_and_open_page

        expect(page).to have_link('Home')
        expect(page).to have_content('Viewing Party Lite')
        expect(page).to have_content("Create a Movie Party for #{@movie[:title]}")

        within('#movie_form') do
          expect(page).to have_field(:date)
          expect(page).to have_content('Day')
          expect(page).to have_field(:start_time)
          expect(page).to have_content('Start time')
          expect(page).to have_field(:duration, with: @movie[:runtime])
          expect(page).to have_button('Create Party')
        end

        within('#guests') do
          expect(page).to have_selector('input', count: 7)
        end
      end

      describe 'When I fill in the form with all valid inputs' do
        it 'I am redirected to my dashboard where the new event is shown', :vcr do
          visit "/users/#{@user2.id}/movies/#{@movie_id}/viewing-party/new"

          fill_in(:date, with: '12/08/2022')
          fill_in(:start_time, with: '08:30PM')
          fill_in(:duration, with: 150)
          page.check(@user1.name.to_s)
          page.check(@user3.name.to_s)
          page.check(@user5.name.to_s)
          click_button('Create Party')

          expect(current_path).to eq("/dashboard")
          # save_and_open_page
          expect(ViewingParty.last.viewing_party_users.count).to eq(4)
        end
      end

      describe 'Sad Path Testing' do
        describe 'When I leave the date blank' do
          it 'redirects back to /users/:user_id/movies/:movie_id/viewing-party/new and I see an error', :vcr do
            visit "/users/#{@user2.id}/movies/#{@movie_id}/viewing-party/new"

            fill_in(:start_time, with: '08:30PM')
            fill_in(:duration, with: 150)
            page.check(@user1.name.to_s)
            page.check(@user3.name.to_s)
            page.check(@user5.name.to_s)
            click_button('Create Party')

            expect(current_path).to eq("/users/#{@user2.id}/movies/#{@movie_id}/viewing-party/new")
            expect(page).to have_content('**Date Cannot Be Blank**')
          end
        end

        describe 'When I leave the start time blank' do
          it 'redirects back to /users/:user_id/movies/:movie_id/viewing-party/new and I see an error', :vcr do
            visit "/users/#{@user2.id}/movies/#{@movie_id}/viewing-party/new"

            fill_in(:date, with: '12/08/2022')
            fill_in(:duration, with: 150)
            page.check(@user1.name.to_s)
            page.check(@user3.name.to_s)
            page.check(@user5.name.to_s)
            click_button('Create Party')

            expect(current_path).to eq("/users/#{@user2.id}/movies/#{@movie_id}/viewing-party/new")
            expect(page).to have_content('**Start Time Cannot Be Blank**')
          end
        end

        describe 'When I leave the start time and date blank' do
          it 'redirects back to /users/:user_id/movies/:movie_id/viewing-party/new and I see an error', :vcr do
            visit "/users/#{@user2.id}/movies/#{@movie_id}/viewing-party/new"

            fill_in(:duration, with: 150)
            page.check(@user1.name.to_s)
            page.check(@user3.name.to_s)
            page.check(@user5.name.to_s)
            click_button('Create Party')

            expect(current_path).to eq("/users/#{@user2.id}/movies/#{@movie_id}/viewing-party/new")
            expect(page).to have_content('**Fields Cannot Be Blank**')
          end
        end
      end
    end
  end

  describe 'As a visitor' do
    describe 'when I try to visit the page to create a new viewing party' do
      it 'I remain on the landing page And I see a message telling me that I must be logged in or registered to create a movie party',
         :vcr do
        user = create(:user)
        movie_id = 11
        movie = MovieService.movie_by_id(movie_id)
        visit "/users/#{user.id}/movies/#{movie_id}/viewing-party/new"

        expect(current_path).to eq(root_path)
        expect(page).to have_content('You must be logged in or registered to create a movie party')
      end
    end
  end
end

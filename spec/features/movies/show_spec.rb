# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'movies show page' do
  describe "As a visitor" do
    before :each do
      @user1 = create(:user)
      @movie_id = 11
      @movie = MovieService.movie_by_id(@movie_id)
    end

    describe 'When I try to visit /users/:user_id/movies/:movie_id' do
      it "I remain on the landing page And I see a message telling me that I must be logged in or registered to access my dashboard", :vcr do

        visit "/users/#{@user1.id}"

        expect(current_path).to eq(root_path)
        expect(page).to have_content("You must be logged in or registered to access that page")
      end
    end
  end

  describe "As a registered user" do
    before :each do
      @user1 = create(:user)

      visit '/login'
      fill_in :email, with: @user1.email
      fill_in :password, with: @user1.password

      click_on "Log In"

      @movie_id = 11
      @movie = MovieService.movie_by_id(@movie_id)
    end

    describe 'When I visit /users/:user_id/movies/:movie_id' do
      it 'I see a button to create a viewing party', :vcr do
        visit "/users/#{@user1.id}/movies/#{@movie[:id]}"

        expect(page).to have_content('Viewing Party Lite')
        expect(page).to have_link('Home')
        expect(page).to have_button("Create Viewing Party for #{@movie[:title]}")
      end

      it 'has Button to return to the Discover Page', :vcr do
        visit "/users/#{@user1.id}/movies/#{@movie[:id]}"

        click_button('Discover Movies')

        expect(current_path).to eq("/users/#{@user1.id}/discover")
      end

      it 'has movie information', :vcr do
        visit "/users/#{@user1.id}/movies/#{@movie[:id]}"
        #  save_and_open_page
        expect(page).to have_content('Viewing Party Lite')
        expect(page).to have_link('Home')
        expect(page).to have_content((@movie[:title]))
        expect(page).to have_content((@movie[:vote_average].round(2)))
        expect(page).to have_content("#{@movie[:runtime]} Minutes")
        expect(@movie[:genres].class).to be Array
        expect(page).to have_content((@movie[:overview]))
      end

      it 'I see 10 cast members from the movie with the actor and character names', :vcr do
        visit "/users/#{@user1.id}/movies/#{@movie[:id]}"

        within('#cast') do
          expect(page).to have_content('Cast:')
          expect(page).to have_content('Actor', count: 10)
          expect(page).to have_content('Character', count: 10)
        end
      end

      it "I see a list of reviews for the movie including the author's name", :vcr do
        visit "/users/#{@user1.id}/movies/#{@movie[:id]}"
        # save_and_open_page

        within('#reviews') do
          expect(page).to have_content('Author:')
        end
      end

      describe 'when I click create a viewing party button' do
        it 'should redirect me to the new viewing party page', :vcr do
          visit "/users/#{@user1.id}/movies/#{@movie[:id]}"

          click_button("Create Viewing Party for #{@movie[:title]}")

          expect(current_path).to eq("/users/#{@user1.id}/movies/#{@movie[:id]}/viewing-party/new")
        end
      end
    end
  end
end

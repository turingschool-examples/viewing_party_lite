# frozen_string_literal: true

# Button to create a viewing party
# Button to return to the Discover Page
# Details This viewing party button should take the user to the new viewing party page (/users/:user_id/movies/:movie_id/viewing-party/new)

# And I should see the following information about the movie:

# Movie Title
# Vote Average of the movie
# Runtime in hours & minutes
# Genre(s) associated to movie
# Summary description
# List the first 10 cast members (characters&actress/actors)
# Count of total reviews
# Each review's author and information
# Details: This information should come from 3 different endpoints from The Movie DB API

require 'rails_helper'

RSpec.describe 'movies show page' do

  before :each do
    @user1 = create(:user)
    @movie_id = 11
    @movie = MovieService.movie_by_id(@movie_id)
  end

  describe 'When I visit /users/:user_id/movies/:movie_id' do
    it 'I see a button to create a viewing party' do
      visit "/users/#{@user1.id}/movies/#{@movie[:id]}"

      expect(page).to have_content('Viewing Party Lite')
      expect(page).to have_link('Home')
      expect(page).to have_button("Create Viewing Party for #{@movie[:title]}")
    end


    it 'has Button to return to the Discover Page' do
      visit "/users/#{@user1.id}/movies/#{@movie[:id]}"

      click_button('Discover Movies')

      expect(current_path).to eq("/users/#{@user1.id}/discover")
    end

    it 'has movie information' do
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

    it 'I see 10 cast members from the movie with the actor and character names' do
      visit "/users/#{@user1.id}/movies/#{@movie[:id]}"

      within("#cast") do
        expect(page).to have_content("Cast:")
        expect(page).to have_content("Actor", count: 10)
        expect(page).to have_content("Character", count: 10)
      end

    end

    describe 'when I click create a viewing party button' do
      it 'should redirect me to the new viewing party page' do
        visit "/users/#{@user1.id}/movies/#{@movie[:id]}"

        click_button("Create Viewing Party for #{@movie[:title]}")

        expect(current_path).to eq("/users/#{@user1.id}/movies/#{@movie[:id]}/viewing-party/new")
      end
    end
  end
end

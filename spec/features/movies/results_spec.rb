# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Movies Results Page Feature' do
  describe 'Movies Results Page' do
    describe 'When I visit discover movies page and click Top Movies button', :vcr do
      before :each do
        @user1 = create(:user)
        @movies = MovieFacade.top_rated_poro
      end

      it 'has button to return to Discover Page' do
        visit user_discover_path(@user1)
        click_button('Find Top Rated Movies')
        click_button('Discover Page')
        expect(current_path).to eq(user_discover_path(@user1))
      end

      it 'I should be taken to the movies results page' do
        visit user_discover_path(@user1)
        click_button('Find Top Rated Movies')

        expect(page.status_code).to eq(200)
        expect(current_path).to eq(user_movies_path(@user1))
      end

      it 'movies results page should have the 20 top rated movies and their vote average' do
        visit user_discover_path(@user1)
        click_button('Find Top Rated Movies')

        @movies.each do |movie|
          expect(page).to have_content(movie.name)
          expect(page).to have_content(movie.vote_average)
        end
        expect(@movies.count).to eq(20)
      end

      it 'each movie title takes user to movies show page' do
        visit user_discover_path(@user1)
        click_button('Find Top Rated Movies')
        click_link 'The Godfather'
        expect(page.status_code).to eq(200)
        expect(current_path).to eq(user_movie_path(@user1, 238))
      end

      it 'each movie title appears in order' do
        visit user_discover_path(@user1)
        click_button('Find Top Rated Movies')
        expect('The Godfather').to appear_before('The Shawshank Redemption')
        expect('The Shawshank Redemption').to appear_before('The Godfather Part II')
      end
    end

    describe 'Movie Results Keyword Search', :vcr do
      before :each do
        @user1 = create(:user)
        @movies = MovieFacade.search_poro('Dark')
      end
      describe 'When I visit discover movies page and search movie title by keyword' do
        it 'has button to return to Discover Page' do
          visit user_discover_path(@user1)
          fill_in 'search_movies', with: 'Dark'
          click_button 'Find Movies'
          click_button('Discover Page')
          expect(current_path).to eq(user_discover_path(@user1))
        end

        it 'I should be taken to the movies results page' do
          visit user_discover_path(@user1)
          fill_in 'search_movies', with: 'Dark'
          click_button 'Find Movies'
          expect(page.status_code).to eq(200)
          expect(current_path).to eq(user_movies_path(@user1))
        end

        it 'should contain movies that match the keyword, and shows name and vote average' do
          visit user_discover_path(@user1)
          fill_in 'search_movies', with: 'Dark'
          click_button 'Find Movies'

          @movies.each do |movie|
            expect(page).to have_content(movie.name)
            expect(page).to have_content(movie.vote_average)
            expect(movie.name).to include('Dark')
          end
        end
      end
    end
  end
end

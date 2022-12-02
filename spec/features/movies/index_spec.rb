require 'rails_helper'
require 'date'

RSpec.describe 'the User Movie Index Page', :vcr do
  let!(:user) { create(:user)}

  before(:each) { visit discover_path(user) }

  context 'top rated' do
    describe 'when the top rated button is clicked' do 
      before(:each) { click_button 'Top Rated Movies'}

      it 'takes you to movie index with top rated movies' do
        expect(page).to have_content("Top Rated Movies")
        expect(page).to_not have_content("Movie results for:")
      end

      it 'has a table of top movies (more than 1)' do
        expect(page).to have_selector("#movie-table")
        within '#movie-table' do
          expect(page).to have_selector(".movie")
          page.assert_selector(:css, ".movie", count: 40)
        end
      end

      it 'each row has a title and a rating' do
        within '#movie-table' do
          first = page.find('.movie', match: :first)
          expect(first).to have_selector('.title')
          expect(first.find('.title')).to have_link
          first_rating = page.find('.rating', match: :first)
          within first_rating do
            expect(html).to match(/[0-9]+\.[0-9]+/)
          end
        end
      end
    end

    describe 'when the search button is clicked but the field is empty' do
      before(:each) {click_button 'Search'}
      
      it 'takes you to movie index with a param of q thats empty, but still shows top rated' do
        expect(page).to have_content("Top Rated Movies")
        expect(page).to_not have_content("Movie results for:")
      end
    end
  end

  context 'term search' do
    describe 'when the search field is filled out and submitted' do
      before :each do
        fill_in 'Movie Search', with: 'Abyss'
        click_button 'Search'
      end
      
      it 'takes you to movie index with a param of q that equals the search term' do
        expect(page).to have_content("Movie results for: 'Abyss'")
      end

      it 'show results that match the search' do
        within "#movie-table" do
          expect(page).to have_content('Abyss')
        end
      end

      it 'each row has a title and a rating' do
        within '#movie-table' do
          first = page.find('.movie', match: :first)
          expect(first).to have_selector('.title')
          expect(first.find('.title')).to have_link
          first_rating = page.find('.rating', match: :first)
          within first_rating do
            expect(html).to match(/[0-9]+\.[0-9]+/)
          end
        end
      end
    end
  end
end
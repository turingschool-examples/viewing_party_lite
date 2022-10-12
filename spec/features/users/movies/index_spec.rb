require 'rails_helper'

RSpec.describe 'Movie Results Page', type: :feature do
  describe 'When I visit the discover movies page' do
    describe 'and click on the top movies button, it takes me to the movies results page' do
      it 'I see the title "top rated movies"' do
        user1 = User.create!(name: 'Becka', email: 'rebecka@gmail.com')
        
        visit user_discover_index_path(user1)
        click_button("Find Top Rated Movies")

        expect(page).to have_content("Top Rated Movies")
      end

      it 'I see the titles of the top 20 rated movies as links' do
        user1 = User.create!(name: 'Becka', email: 'rebecka@gmail.com')

        visit user_discover_index_path(user1)
        click_button("Find Top Rated Movies")
        
        expect(page).to have_css("div", count: 20)
        
        within(first(".movie")) do
          expect(page).to have_link()
        end
      end
      
      it 'and I see the vote average of each movie' do
        user1 = User.create!(name: 'Becka', email: 'rebecka@gmail.com')
        
        visit user_discover_index_path(user1)
        click_button("Find Top Rated Movies")

        within(first(".movie")) do
          expect(page).to have_content("Vote Average:")
        end
      end

      it 'has a button to return back to the discover movies page' do
        user1 = User.create!(name: 'Becka', email: 'rebecka@gmail.com')

        visit user_discover_index_path(user1)
        click_button("Find Top Rated Movies")

        expect(page).to have_button("Discover Page")
        click_button("Discover Page")

        expect(current_path).to eq(user_discover_index_path(user1))
      end
    end
  end
  describe 'and click on the search button, it takes me to the movies results page' do
    it 'I see the title "movie results for: <search parameters>"' do
      user1 = User.create!(name: 'Becka', email: 'rebecka@gmail.com')

      visit user_discover_index_path(user1)
      fill_in(:search, with: "Avatar")
      click_button("Find Movies")

      expect(page).to have_content("Movie Results for: Avatar")
    end

    it 'I see the titles of a maximum of 20 movies that match the search criteria' do
      user1 = User.create!(name: 'Becka', email: 'rebecka@gmail.com')

      visit user_discover_index_path(user1)
      fill_in(:search, with: "Avatar")
      click_button("Find Movies")

      expect(page).to have_css("div", maximum: 20)
    end

    it 'I see the vote average of each movie' do
      user1 = User.create!(name: 'Becka', email: 'rebecka@gmail.com')

      visit user_discover_index_path(user1)
      fill_in(:search, with: "Avatar")
      click_button("Find Movies")

      within(first(".movie")) do
        expect(page).to have_content("Vote Average:")
      end
    end

    it 'has a button to return back to the discover movies page' do
      user1 = User.create!(name: 'Becka', email: 'rebecka@gmail.com')

      visit user_discover_index_path(user1)
      fill_in(:search, with: "Avatar")
      click_button("Find Movies")

      expect(page).to have_button("Discover Page")
      click_button("Discover Page")

      expect(current_path).to eq(user_discover_index_path(user1))
    end
  end
end

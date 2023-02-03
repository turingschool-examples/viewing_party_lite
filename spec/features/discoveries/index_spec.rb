require 'rails_helper'

RSpec.describe "Discover index page (/users/:id/discover)", type: :feature do
  before :each do
    load_test_data
  end

  describe "when user visits a users's dashboard and clicks on discover movies" do
    it "redirects page to '/users/:id/discover' where the :id is the user id of the user who's dashboard the page redirected from" do
      visit user_path(@user1.id)

      click_button "Discover Movies"

      expect(current_path).to eq(user_discoveries_path(@user1.id))
      expect(current_path).to_not eq(user_discoveries_path(@user3.id))
    end
  end

  describe "visiting /users/:id/discover" do
    it "see a button to discover top rated movies" do
      visit user_discoveries_path(@user1.id)

      expect(page).to have_button("Find Top Rated Movies")
    end

    it 'see a text field to enter keyword(s) and an accompanying button to search by movie title' do
      visit user_discoveries_path(@user1.id)

      expect(page).to have_field(:q)
      expect(page).to have_button("Find Movies")
    end

    it 'when user clicks on the Top Rated Movies they are taken to the movies results page' do
      top_rated_movies_stub
      visit user_discoveries_path(@user1.id)

      click_button "Find Top Rated Movies"
      expect(current_path).to eq("/users/#{@user1.id}/movies")
    end

    it 'when user clicks on the search button they are taken to the movies results page' do
      keyword = "Jumanji"
      movie_search_stub(keyword)
      visit user_discoveries_path(@user1.id)

      fill_in :q, with: keyword
      click_button "Find Movies"

      expect(current_path).to eq("/users/#{@user1.id}/movies")
    end
  end
end
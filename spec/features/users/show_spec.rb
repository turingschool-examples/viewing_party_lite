require 'rails_helper'

RSpec.describe "User Show Page", type: :feature do
  before :each do
    load_test_data
    movie_id = 238
    top_rated_movies_stub
    movie_by_id_stub(movie_id)
    movie_cast_stub(movie_id)
    movie_reviews_stub(movie_id)
  end

  describe "when I visit a users show page" do
    it "shows the users name and that its their dashboard" do
      visit user_path(@user1.id)

      expect(page).to have_content("#{@user1.name}")
      expect(page).to_not have_content("#{@user2.name}")
    end

    it "has a button to Discover Movies" do
      visit user_path(@user1.id)

      expect(page).to have_button("Discover Movies")
    end

    it "has a section that lists viewing parties" do
      visit user_path(@user1.id)

      expect(page).to have_css("section#viewing_parties")
    end
  end

  describe "when I visit the users dashboard" do
    before (:each) do
      visit user_path(@user1.id)
      click_button("Discover Movies")
      click_button("Find Top Rated Movies")
      click_link("The Godfather")
      click_button("Create Viewing Party for The Godfather")
      fill_in :duration, with: 186
      select 2023, from: :_date_1i
      select "March", from: :_date_2i
      select "20", from: :_date_3i
      select 12, from: :_time_4i
      select 24, from: :_time_5i
      check @user2.name
      click_button "Create Party"
    end

    xit "should show a movie image" do
      within"#viewing_parties" do
        expect(page).to have_css(HTML)
      end
    end

    it "should show movie title which links to the movie show page" do
      within"#id_238" do
        expect(page).to have_content("The Godfather")
      end
    end

    it "shows the date and time of the event"

    it "shows the user is the host for the party"

    it "shows list of friends invited to viewing party"

  end

end
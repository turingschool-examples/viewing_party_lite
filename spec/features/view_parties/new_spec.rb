require 'rails_helper'

RSpec.describe "Movies details page (/users/:id/movies/:id)", type: :feature do
  before :each do
    load_test_data
    movie_id = 238
    top_rated_movies_stub
    movie_by_id_stub(movie_id)
    movie_cast_stub(movie_id)
    movie_reviews_stub(movie_id)
    visit user_discoveries_path(@user1.id)
    click_button "Find Top Rated Movies"
    click_link "The Godfather"
    click_button "Create Viewing Party for The Godfather"
  end

  describe "visiting the new viewing party for a movie" do
    it "has create a viewing party with title" do
      expect(page).to have_content("Create a Viewing Party for The Godfather")
    end

    it "new form has field for duration in minutes and is greater than or equal to duraiton of the movie" do
      expect(page).to have_field(:duration, with: 175)
    end

    it "has field for selecting a date" do
      expect(page).to have_select(:_date_1i)
      expect(page).to have_select(:_date_2i)
      expect(page).to have_select(:_date_3i)
    end

    it "has field to select a start time" do
      expect(page).to have_select(:_time_4i)
      expect(page).to have_select(:_time_5i)
    end
    it "has users listed as checkboxes" do
      expect(page).to have_unchecked_field(@user2.name)
      expect(page).to have_unchecked_field(@user3.name)
      check @user4.name
      expect(page).to have_checked_field(@user4.name)
    end

    it "dashboard with the new event now displayed" do
      fill_in :duration, with: 186
      select 2023, from: :_date_1i
      select "March", from: :_date_2i
      select "20", from: :_date_3i
      select 12, from: :_time_4i
      select 24, from: :_time_5i
      check @user2.name
      click_button "Create Party"

      expect(current_path).to eq(user_path(@user1.id))
    end
  end
end
require 'rails_helper'

RSpec.describe "Discover Movies Page" do
  before :each do
    @user = create(:user)

    visit user_discover_index_path(@user)
  end

  describe "displays content" do
    it "button to discover top rated movies" do
      expect(page).to have_button("Find Top Rated Movies")
      
      click_button("Find Top Rated Movies")

      expect(current_path).to eq("/users/#{@user.id}/movies")
    end
    
    it "search by movie title text field and button" do
      within "#keyword-search" do
        expect(page).to have_field(:q)
        expect(page).to have_button("Find Movies")
        
        fill_in(:q, with: "Test")

        click_button("Find Movies")
        
        expect(current_path).to eq("/users/#{@user.id}/movies")
      end
    end

    # how to test that button is giving "?q=top%20rated" on button and "?q=keyword" on search field?
    it "passes optional parameters" do
      click_button("Find Top Rated Movies")

      expect(current_url).to include("/users/#{@user.id}/movies?q=top_rated")

      # visit user_discover_index_path(@user)

      # fill_in(:q, with: "Test")

      # click_button("Find Movies")
      # # require 'pry'; binding.pry
      # expect(current_url).to include("/users/#{@user.id}/movies?q=Test")
    end
  end
end
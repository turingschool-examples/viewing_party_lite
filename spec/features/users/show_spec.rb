require 'rails_helper'

RSpec.describe "User Show Page", type: :feature do
  before :each do
    load_test_data
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

end
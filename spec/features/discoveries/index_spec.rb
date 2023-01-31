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
end
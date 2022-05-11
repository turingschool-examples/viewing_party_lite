require "rails_helper"

RSpec.describe "creates new user" do
  describe "has form " do
    it "fills in form" do
      visit "/register"

      fill_in "Name", with: "Pabu"
      fill_in "Email", with: "pabu@gmail.com"

      click_button "Register"

      expect(page).to have_content("Pabu")
    end
  end
end

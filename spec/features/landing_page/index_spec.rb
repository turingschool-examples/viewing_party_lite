require 'rails_helper'


RSpec.describe "Landing Page" do
  describe "when the user visits the root path" do
    it "will have a title" do
      visit "/"

      expect(page).to have_content("Viewing Party")
    end

    it "has a button to create a new user" do
      visit "/"

      expect(page).to have_button("New User")
      save_and_open_page
    end

    it "list of existing users" do
      
    end

    it "has a user be a link to the user's dashboard" do

    end

    it "has a link to go back to the landing page" do

    end
  end
end
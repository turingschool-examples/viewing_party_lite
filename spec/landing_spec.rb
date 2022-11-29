# When a user visits the root path they should be on the landing page ('/') which includes:

# Title of Application
# Button to Create a New User
# List of Existing Users which links to the users dashboard
# Link to go back to the landing page (this link will be present at the top of all pages)
require "rails_helper"

RSpec.describe "Landing Page" do
  describe "As a user" do
    describe "When I visit '/'" do
      it "Then I expect to see Title of Application" do
        visit "/"

        expect(page).to have_content("Viewing Party Lite")
      end

      it "I see a Button to Create a New User" do
        visit "/"

      end
    end
  end
end

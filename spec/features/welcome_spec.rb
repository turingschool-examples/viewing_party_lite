require "rails_helper"

describe "welcome page" do
  describe "as a user" do
    describe "when i visit the root path" do
      before do
        @user_1 = User.create!(name: "James Harkins", email: "jh.harkins@protonmail.com")
        @user_2 = User.create!(name: "Sandisz Thieme", email: "sandiszthieme@gmail.com")
        visit "/"
      end

      it "i see the title of the app" do
        expect(page).to have_content("Welcome to Viewing Party!")
      end

      it "i see a button to create a new user" do
        click_button "Create New User"
        expect(current_path).to eq("/users/new")
      end

      it "i see a list of existing users, whose names link to their user dashboard" do
        expect(page).to have_link("James Harkins")
        expect(page).to have_link("Sandisz Thieme")
        expect(page).to have_content("jh.harkins@protonmail.com")
        expect(page).to have_content("sandiszthieme@gmail.com")

        click_link("James Harkins")

        expect(current_path).to eq("users/#{@user_1.id}")
      end

      it "i see a link to go back to the landing page" do
        click_link("Return to Home Page")

        expect(current_path).to eq("/")
      end
    end
  end
end

require "rails_helper"

describe "welcome page" do
  describe "as a user" do
    describe "when i visit the root path" do
      before do
        @user_1 = User.create!(name: "Tony Soprano", email: "wokeupthismorning@gmail.com", password: "test123", password_confirmation: "test123")
        @user_2 = User.create!(name: "Junior Soprano", email: "varsityathlete@gmail.com", password: "test123", password_confirmation: "test123")
        visit "/login"
        fill_in "Email", with: @user_1.email.to_s
        fill_in "Password", with: @user_1.password.to_s
        click_button "Log In"
        visit "/"
      end

      it "i see the title of the app" do
        expect(page).to have_content("Welcome to Viewing Party!")
      end

      it "i do not see a link to log in" do
        expect(page).not_to have_link("Log In")
      end

      it "i do not see a button to create a new user" do
        expect(page).not_to have_button("Create New User")
      end

      it "i see a link to log out, which ends my session takes me back to the landing page" do
        click_link "Log Out"

        expect(current_path).to eq("/")
        expect(page).to have_link("Log In")
        expect(page).to have_button("Create New User")
        expect(page).not_to have_link("Log Out")
      end

      it "i see a list of existing users and their email addresses" do
        expect(page).to have_link("Tony Soprano")
        expect(page).to have_link("Junior Soprano")
        expect(page).to have_content("wokeupthismorning@gmail.com")
        expect(page).to have_content("varsityathlete@gmail.com")
      end

      it "i see a link to go back to the landing page" do
        click_link("Return to Home Page")

        expect(current_path).to eq("/")
      end
    end

    describe "as a visitor" do
      describe "when i visit the root path" do
        before do
          @user_1 = User.create!(name: "Tony Soprano", email: "wokeupthismorning@gmail.com", password: "test123", password_confirmation: "test123")
          @user_2 = User.create!(name: "Junior Soprano", email: "varsityathlete@gmail.com", password: "test123", password_confirmation: "test123")
          visit "/"
        end

        it "i see a button to create a new user" do
          click_button "Create New User"
          expect(current_path).to eq("/register")
        end

        it "i see a link to log in, which takes me to a login page, where i can log in successfully" do
          click_link "Log In"

          expect(current_path).to eq("/login")

          fill_in "Email", with: "wokeupthismorning@gmail.com"
          fill_in "Password", with: "test123"

          click_button "Log In"

          expect(current_path).to eq("/dashboard")
        end
      end
    end
  end
end

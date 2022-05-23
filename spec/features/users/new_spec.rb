require "rails_helper"

describe "user new page" do
  describe "as a user" do
    describe "when i visit the /register path" do
      before do
        @user_1 = User.create!(name: "Tony Soprano", email: "wokeupthismorning@gmail.com", password: "test123", password_confirmation: "test123")
      end

      it "i see a form to register, including name, email, and password" do
        visit "/register"

        fill_in "Name", with: "Junior Soprano"
        fill_in "Email", with: "varsityathlete@gmail.com"
        fill_in "Password", with: "test123"
        fill_in "Password confirmation", with: "test123"

        click_button "Register"

        expect(page).to have_content("Junior Soprano's page")
        expect(page).not_to have_content("Tony Soprano's page")
      end

      it "the form will not accept the input if the user does not input a name" do
        visit "/register"

        fill_in "Email", with: "varsityathlete@gmail.com"
        fill_in "Password", with: "test123"
        fill_in "Password confirmation", with: "test123"

        click_button "Register"

        expect(current_path).to eq("/register")
        expect(page).to have_content("Name cannot be empty.")
      end

      it "the form will not accept an email that already exists for some other user in the database" do
        visit "/register"

        fill_in "Name", with: "Junior Soprano"
        fill_in "Email", with: "wokeupthismorning@gmail.com"
        fill_in "Password", with: "test123"
        fill_in "Password confirmation", with: "test123"

        click_button "Register"

        expect(page).to have_content("There is already an account associated with this e-mail address.")
      end

      it "the form will not accept the submission if the user only submits a password without a confirmation" do
        visit "/register"

        fill_in "Name", with: "Junior Soprano"
        fill_in "Email", with: "wokeupthismorning@gmail.com"
        fill_in "Password", with: "test123"

        click_button "Register"

        expect(page).to have_content("Passwords must match.")
      end

      it "the form will not accept the submission if the user only submits a password confirmation without an original password" do
        visit "/register"

        fill_in "Name", with: "Junior Soprano"
        fill_in "Email", with: "wokeupthismorning@gmail.com"
        fill_in "Password confirmation", with: "test123"

        click_button "Register"

        expect(page).to have_content("Passwords must match.")
      end

      it "the form will not accept the submission if the user only submits passwords that do not match" do
        visit "/register"

        fill_in "Name", with: "Junior Soprano"
        fill_in "Email", with: "wokeupthismorning@gmail.com"
        fill_in "Password", with: "test123"
        fill_in "Password confirmation", with: "123test"

        click_button "Register"

        expect(page).to have_content("Passwords must match.")
      end
    end
  end
end

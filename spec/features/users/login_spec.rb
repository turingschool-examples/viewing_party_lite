require "rails_helper"

describe "user login page" do
  describe "as a user" do
    describe "when i visit the welcome page" do
      before do
        @user_1 = User.create!(name: "Tony Soprano", email: "wokeupthismorning@gmail.com", password: "test123", password_confirmation: "test123")
        @user_2 = User.create!(name: "Junior Soprano", email: "varsityathlete@gmail.com", password: "test123", password_confirmation: "test123")
        visit "/"
      end

      it "i see a link to log in, which takes me to a login page, where i can log in successfully" do
        visit "/"

        click_link "Log In"

        expect(current_path).to eq("/login")

        fill_in "Email", with: "wokeupthismorning@gmail.com"
        fill_in "Password", with: "test123"

        click_button "Log In"

        expect(current_path).to eq("/users/#{@user_1.id}")
      end

      it "if i enter an email that does not exist, then i see an error message" do
        visit "/login"

        fill_in "Email", with: "woke_up_this_morning@gmail.com"
        fill_in "Password", with: "test123"

        click_button "Log In"

        expect(current_path).to eq("/login")
        expect(page).to have_content("There is no account associated with this email address.")
      end

      it "if i enter the wrong password, then i see an error message" do
        visit "/login"

        fill_in "Email", with: "wokeupthismorning@gmail.com"
        fill_in "Password", with: "123test"

        click_button "Log In"

        expect(current_path).to eq("/login")
        expect(page).to have_content("Invalid password.")
      end
    end
  end
end

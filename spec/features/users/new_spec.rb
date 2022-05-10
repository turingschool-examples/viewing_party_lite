require "rails_helper"

describe "user new page" do
  describe "as a user" do
    describe "when i visit the /register path" do
      before do
        @user_1 = User.create!(name: "Tony Soprano", email: "wokeupthismorning@gmail.com")
      end

      it "i see a form to register, including name and email" do
        visit "/register"

        fill_in "Name", with: "Junior Soprano"
        fill_in "Email", with: "varsityathlete@gmail.com"

        click_button "Register"

        expect(page).to have_content("Junior Soprano's page")
        expect(page).not_to have_content("Tony Soprano's page")
      end

      it "the form will not accept an email that already exists for some other user in the database" do
        visit "/register"

        fill_in "Name", with: "Junior Soprano"
        fill_in "Email", with: "wokeupthismorning@gmail.com"

        click_button "Register"

        expect(page).to have_content("There is already an account associated with this e-mail address.")
      end
    end
  end
end

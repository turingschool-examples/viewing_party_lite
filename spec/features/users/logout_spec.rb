require 'rails_helper'

describe "Logout User" do
  before :each do
    @user = create(:user)
    visit '/login'
    fill_in :email, with: @user.email
    fill_in :password, with: @user.password

    click_on "Log In"
  end

  describe "As a logged in user" do
    describe "When I visit the landing page" do
      it "I no longer see a link to Log In or Create an Account" do
        visit '/'
        # save_and_open_page
        # binding.pry
        expect(page).to_not have_button("Create New User")
        expect(page).to_not have_link("Log In")
      end

      it "has a link to logout" do
        visit '/'
        # save_and_open_page
        expect(page).to have_link("Log Out")
      end

      describe " When I click the link to Log Out" do
        it "I'm taken to the landing page And I can see that the Log Out link has changed back to a Log In link" do
          visit '/'

          click_link("Log Out")

          expect(current_path).to eq("/")
          expect(page).to have_button("Create New User")
          expect(page).to have_link("Log In")
          expect(page).to_not have_link("Log Out")
        end
      end
    end
  end
end

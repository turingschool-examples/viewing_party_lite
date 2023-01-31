require 'rails_helper'


RSpec.describe "Landing Page" do
  before(:each) do
    load_test_data
  end
  describe "when the user visits the root path" do
    it "will have a title" do
      visit "/"

      expect(page).to have_content("Viewing Party")
    end

    it "has a button to create a new user" do
      visit "/"

      expect(page).to have_button("New User")
    end

    it "new user button is clicked an user is directed to new user form" do
      visit "/"

      click_button "New User"

      expect(current_path).to eq(new_user_path)
    end

    it "list of existing users" do
       visit "/"

       within "#users" do
        expect(page).to have_content(@user1.name)
        expect(page).to have_content(@user2.name)
       end
    end

    it "has a user be a link to the user's dashboard" do
       visit "/"

       within "#users" do
          expect(page).to have_link(@user1.name, href:"/users/#{@user1.id}")
          expect(page).to have_link(@user2.name, href:"/users/#{@user2.id}")
       end
    end

    it "has a link to go back to the landing page" do
      visit "/"

      expect(page).to have_link("Landing Page", href:"/")
    end
  end
end
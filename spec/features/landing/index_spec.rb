require "rails_helper"

RSpec.describe "landing page", type: :feature do
  describe "as a visitor" do
    before(:each) do
      @user1 = User.create!(name: "Haewon Jeon", email: "haewon201@gmail.com")
      @user2 = User.create!(name: "Sean Morris", email: "seanmorris@gmail.com")
      visit '/'
    end

    it "I can see the link to go back to the landing page" do
      click_on "Home"
      expect(current_path).to eq("/")
    end

    it "I can see the title of Application" do
      expect(page).to have_content("Viewing Party Light")
    end

    xit "I can see a button to create a new user" do
      click_on "Create a New User"
      expect(current_path).to eq("/legister")
    end

    it "I can see a list of existing users with links" do
      expect(page).to have_content("Existing Users:")
      expect(page).to have_content("haewon201@gmail.com's Dashboard")
      expect(page).to have_content("seanmorris@gmail.com's Dashboard")

      click_on "haewon201@gmail.com's Dashboard"
      save_and_open_page
      expect(current_path).to eq("/users/#{@user1.id}/dashboard")
    end

  end
end

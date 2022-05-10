require 'rails_helper'

RSpec.describe "user/dashboard", type: :feature do
  before (:each) do
    @user = User.create!(name: "Terra Branford", email: "terraff6@square.com")
    visit "/users/#{@user.id}"
  end

  describe "when I visit user/dashboard" do
    it "displays a welcome" do
      expect(page).to have_content("Hello Terra Branford!")
    end

    it "has a button to Discover Movies" do
      expect(page).to have_link("Discover Movies")
    end

    it "has a section to see viewing parties" do
      expect(page).to have_content("Viewing Parties")
    end

  end
end

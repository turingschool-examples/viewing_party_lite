require 'rails_helper'

RSpec.describe "Registration Page", type: :feature do
  describe "when a visitor visits /register" do
    before (:each) do
      @user1 = User.create!(name: "Sabin Figaro", email: "sabinff6@square.com")
      @user2 = User.create!(name: "Edgar Figaro", email: "edgarff6@square.com")
      visit '/register'
    end

    it "has a form" do
      expect(page).to have_content("Name:")
      expect(page).to have_content("Email:")
    end

    it "creates a new user" do
      expect(User.all).to eq([@user1, @user2])

      user3 = User.create!(name: "Celeste Chere", email: "celesff6@square.com")

      fill_in("name", with: "#{user3.name}")
      fill_in("email", with: "#{user3.email}")
      click_on "Register"
      expect(User.all).to eq([@user1, @user2, user3])
    end
  end
end

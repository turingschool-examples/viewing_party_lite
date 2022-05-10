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


      fill_in("name", with: "Celeste Chere")
      fill_in("email", with: "celesff6@square.com")
      click_on "Register"

      user3 = User.last

      expect(user3.name).to eq("Celeste Chere")
      expect(user3.email).to eq("celesff6@square.com")
    end

    it "redirects to user/dashboard" do

      fill_in("name", with: "Celeste Chere")
      fill_in("email", with: "celesff6@square.com")
      click_on "Register"

      user3 = User.last

      expect(current_path).to eq("/users/#{user3.id}")
    end
  end
end

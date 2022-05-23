require 'rails_helper'

RSpec.describe "Registration Page", type: :feature do
  describe "when a visitor visits /register" do
    before (:each) do
      @user1 = User.create!(name: "Sabin Figaro", email: "sabinff6@square.com", password: "sabinff6")
      @user2 = User.create!(name: "Edgar Figaro", email: "edgarff6@square.com", password: "edgarff6")
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
      fill_in("password", with: "celesff6")
      fill_in("password_confirmation", with: "celesff6")
      click_on "Register"

      user3 = User.last

      expect(user3.name).to eq("Celeste Chere")
      expect(user3.email).to eq("celesff6@square.com")
    end

    it "redirects to user/dashboard" do

      fill_in("name", with: "Celeste Chere")
      fill_in("email", with: "celesff6@square.com")
      fill_in("password", with: "celesff6")
      fill_in("password_confirmation", with: "celesff6")
      click_on "Register"

      user3 = User.last

      expect(current_path).to eq("/users/#{user3.id}")
    end

    it "requires a password" do

      fill_in(:name, with: "Joseph")
      fill_in(:email, with: "joseph@turing.edu")
      fill_in(:password, with: "ThisTest")
      fill_in(:password_confirmation, with: "ThisTest")
      click_on "Register"

      user4 = User.last

      expect(user4.name).to eq("Joseph")
      expect(user4).to_not have_attribute(:password)
    end

    it "cannot have blank fields" do
      fill_in(:email, with: "joseph@turing.edu")
      fill_in(:password, with: "ThisTest")
      fill_in(:password_confirmation, with: "ThisTest")
      click_on "Register"

      expect(current_path).to eq(register_path)
    end

    it "verifies that password matches" do
      fill_in(:name, with: "Joseph")
      fill_in(:email, with: "joseph@turing.edu")
      fill_in(:password, with: "ThisTest")
      fill_in(:password_confirmation, with: "This")
      click_on "Register"

      expect(current_path).to eq(register_path)
      expect(page).to have_content("Passwords must match")
    end
  end
end

require 'rails_helper'

RSpec.describe "new page", type: :feature do
  let!(:user1) { User.create!(name: "Anthony", email: "anthony@gmail.com") }

  describe 'new user form' do
    it 'has a name and email' do
      visit register_path

      expect(page).to have_field(:name)
      expect(page).to have_field(:email)
    end

    it 'can create a new user' do
      visit register_path

      fill_in(:name, with: "Tony Pepperoni")
      fill_in(:email, with: "thebigpepperoni@gmail.com")

      click_button "Register"
      
      expect(page).to have_content("Tony Pepperoni's Dashboard")
      # expect(current_path).to eq(user_path())
      #ask about path testing at check in
    end
  end
end
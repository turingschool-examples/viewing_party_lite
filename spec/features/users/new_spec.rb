require 'rails_helper'

RSpec.describe "User Registration", type: :feature do
  before :each do
    load_test_data
  end

  describe "when user visits registration page" do
    it 'should have form fields name, email(must be unique)' do
      visit new_user_path

      expect(page).to have_field(:name)
      expect(page).to have_field(:email)
    end

    it 'has a register button' do
      visit new_user_path

      expect(page).to have_button("Register")
    end

    it 'register button redirects to dashboard user/:id for the user that was just created' do
      visit new_user_path

      fill_in :name, with: "Erica Erickson"
      fill_in :email, with: "EE@gmail.com"
      click_button "Register"

      expect(page).to have_content("Erica Erickson")
    end

    it 'flash message is displayed when any form field is left blank' do
      visit new_user_path

      fill_in :name, with: "Erica Erickson"
      click_button "Register"

      expect(current_path).to eq(new_user_path)
      expect(page).to have_content("Field can't be blank")
    end
  end
end
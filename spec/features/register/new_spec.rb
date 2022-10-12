require 'rails_helper'

RSpec.describe 'The register new user page' do
  before(:each) do
    visit register_path
  end

  describe 'As a user when I visit this page' do
    it 'I see a Register New User header' do
        expect(page).to have_content("Register a New User")
    end

    it 'I see a form to register a new user' do
        expect(page).to have_field(:user_name)
        expect(page).to have_field(:email)

        expect(page).to have_content("Name:")
        expect(page).to have_content("Email:")
    end

    it 'after I fill out the registration I then click the register button' do
        fill_in "Name:", with: "Kat"
        fill_in "Email:", with: "kit.kat@guhmail.com"
        click_button "Register"
    end

    it 'when I click the register button I am redirected to the dashboard page' do
        fill_in "Name:", with: "Kat"
        fill_in "Email:", with: "kit.kat@guhmail.com"
        click_button "Register"

        expect(current_path).to eq(user_path(@kat))
    end
  end
end
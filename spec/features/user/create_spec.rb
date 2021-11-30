require 'rails_helper'

RSpec.describe "user create" do
  describe 'the user new' do
    it 'renders the new form' do
      visit root_path

      expect(page).to have_button('Create New User')
      click_button "Create New User"
      expect(current_path).to eq(register_path)
    end
  end

  describe 'user create' do
    it 'creates a new user' do
      visit register_path
      fill_in "Name", with: "Tammy Tanaka"
      fill_in "Email", with: "tammy@fake_email.com"
      click_button "Save"
      end
  end
end

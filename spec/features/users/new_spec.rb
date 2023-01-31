require 'rails_helper'

RSpec.describe "User Register Page" do

  describe "form to register" do
    it "shows required fields" do
      visit register_path

      expect(page).to have_field("Name")
      expect(page).to have_field("Email")
      expect(page).to have_button("Create New User")
    end
  end
end
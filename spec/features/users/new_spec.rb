require 'rails_helper'

RSpec.describe "User Register Page" do

  describe "form to register" do
    it "shows required fields" do
      visit register_path

      expect(page).to have_field("Name")
      expect(page).to have_field("Email")
      expect(page).to have_button("Create New User")
    end
    
    describe "happy path" do
      it "successfully creates user" do
        visit register_path

        fill_in("Name", with: "Test")
        fill_in("Email", with: "valid@email.com")

        click_button("Create New User")
        
        user = User.all.last
        
        expect(current_path).to eq("/users/#{user.id}")
        expect(page).to have_content("User successfully created")
      end  
    end
    
    describe "sad path" do
      it "name nor email cannot be blank" do
        visit register_path
        
        fill_in("Name", with: "")
        fill_in("Email", with: "valid@email.com")
    
        click_button("Create New User")

        expect(page).to have_field("Name", with: "")
        expect(page).to have_field("Email", with: "valid@email.com")

        expect(page).to have_content("User creation failed")

      end
    end

  end
end
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
      expect(page).to_not have_content(user1.name)
    end

    describe "sad path form testing" do
      it 'will not allow any field to be blank' do
        visit register_path

        click_button "Register"
    
        # expect(current_path).to be(register_path)
        # is there a way to test this path with how we set it up? is that ok?
        expect(page).to have_content("Name can't be blank and Email can't be blank")
      end

      it 'will only allow unique email addresses (no copies) to sign up' do
        visit register_path

        fill_in(:name, with: "Tony")
        fill_in(:email, with: "anthony@gmail.com")

        click_button "Register"

        expect(page).to have_content("Email has already been taken")
      end
    end
  end
end
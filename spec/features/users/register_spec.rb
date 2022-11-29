require "rails_helper"

RSpec.describe "the User registration page" do 
  describe "when a user visits '/register'" do 
    it "shows a form to register, once registered they're directed to the user show page" do 
      # visit '/'

      # expect(page)to_not have_content('amanda@turing.edu')

      # click_on('Create New User')
      visit register_path

      expect(current_path).to eq(register_path)
      expect(page).to have_field(:name)
      expect(page).to have_field(:email)
      expect(page).to have_button('Create New User')

      fill_in(:name, with: 'Amanda')
      fill_in(:email, with: 'amanda@turing.edu')
      click_button('Create New User')

      last_created = User.last
      expect(current_path).to eq(user_path(last_created))

      # visit '/'
      
      # expect(page).to have_contnet('amanda@turing.edu')
    end

    it "doesn't allow you to leave fields blank" do 
      visit register_path
      fill_in(:name, with: 'Amanda')
      click_button('Create New User')

      expect(current_path).to eq(register_path)
      within '#flash-messages' do 
        expect(page).to have_content("Error: Email can't be blank")
      end

      fill_in(:email, with: 'amanda@turing.edu')
      click_button('Create New User')

      expect(current_path).to eq(register_path)
      within '#flash-messages' do 
        expect(page).to have_content("Error: Name can't be blank")
      end
    end

    it "doesn't allow you to register a non-unique email address" do 
      User.create!(name: "Mandy", email: "amanda@turing.edu")
      visit register_path
      fill_in(:name, with: 'Amanda')
      fill_in(:email, with: 'amanda@turing.edu')
      click_button('Create New User')

      expect(current_path).to eq(register_path)
      within '#flash-messages' do 
        expect(page).to have_content("Error: Email has already been taken")
      end
    end
  end
end
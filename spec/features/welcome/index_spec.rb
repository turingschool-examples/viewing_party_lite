require 'rails_helper'

RSpec.describe 'The landing page index', type: :feature do 
  describe 'landing page index' do 
    before :each do 
      @user1 = create(:user)
      create_list(:user, 5)
    
      visit root_path
    end
    it 'displays the application title' do 
      save_and_open_page
      expect(page).to have_content("Viewing Party")
    end

    it 'displays a button to create a new user' do 

      expect(page).to have_button("Create a New User")

      click_button "Create a New User"

      expect(current_path).to eq(register_path)
    end

    it 'displays existing users which links to the users dashboard' do 

      within(".users") do
        within("section#user-#{@user1.id}") do 
          expect(page).to have_content(@user1.email)
        end
        expect(page).to have_selector('section', count: 6)
      end
    end

    it 'displays a home link to go back to the landing page' do 

      expect(page).to have_link("Home")

      click_on "Home"

      expect(current_path).to eq("/")
    end

    it "can log in with valid credentials" do
      click_on "Log In"

      expect(current_path).to eq(login_path)

      fill_in :email, with: @user1.email
      fill_in :password, with: @user1.password

      click_on "Log In"

      expect(current_path).to eq(user_path(@user1))
      expect(page).to have_content("Welcome, #{@user1.name}!")
    end

    it "cannot log in with bad credentials" do
      visit login_path

      fill_in :email, with: @user1.email
      fill_in :password, with: "bad password"

      click_on "Log In"

      expect(current_path).to eq(login_path)
      expect(page).to have_content("Sorry, your credentials are bad")
    end
  end
end
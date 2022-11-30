require "rails_helper"

RSpec.describe "New Users Page", type: :feature do 

  before(:each) do
    @user1 = User.create!(name: 'Chad', email: 'chad1@gmail.com')
    @user2 = User.create!(name: 'Jessica', email: 'jessica2@gmail.com')
    @user3 = User.create!(name: 'Fiona', email: 'Fiona3@gmail.com')
  end

  it "has a form to register a new user, that includes name, email (which is unique) and a 
    'Register' button" do
      visit "/register"

      expect(page).to have_field(:name)
      expect(page).to have_field(:email)
      expect(page).to have_button("Register")
  end

  it "once the form is properly filled out, the user will be taken to their dashboard page ('/users/:id') where the id
    is for the user that was just created" do
      visit "/register"

      fill_in :name,	with: "Max"
      fill_in :email,	with: 'WhatsForDinner@gmail.com'
      click_button "Register"

      @user = User.last

      expect(current_path).to eq(user_path(@user.id))
  end

  it "if the form is not completely filled in, the user will be redirected back to the '/register' page
    and see an alert that the name can't be blank" do
      visit "/register"

      expect(page).to have_no_content("Name can't be blank")
      
      fill_in :name,	with: ''
      fill_in :email,	with: 'pieisdelici0us@gmail.com'
      click_button "Register"

      expect(current_path).to eq("/register")
      expect(page).to have_content("Name can't be blank")
  end

  it "if the email is not unique, the user will be redirected to back to the '/register page and see
    an alert that the email they entered has already been taken" do
      visit "/register"

      expect(page).to have_no_content("Email has already been taken")

      fill_in :name,	with: "Tammy"
      fill_in :email,	with: 'chad1@gmail.com'
      click_button "Register"

      expect(page).to have_content("Email has already been taken")
  end
end
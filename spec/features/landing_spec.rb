require 'rails_helper'

RSpec.describe "Landing Page" do
  before :each do
      @user1 = User.create!(name: 'Jimar', email: "jimar@jimar.com")
      @user2 = User.create!(name: 'NickT', email: "NickT@jimar.com")
  end

  it "shows the title of the application" do
    visit root_path
    # save_and_open_page
    expect(page).to have_content("Welcome to Viewing Party Lite")

  end

  it "has a button to create a new user" do
    visit root_path
    expect(page).to have_button("Create New User")
    click_button "Create New User"
    expect(current_path).to eq(register_path)
  end

  it "list existing users which links to an existing dashboards" do
    visit root_path
    expect(page).to have_link("Jimar")
    expect(page).to have_link("NickT")
    click_link "Jimar"
    expect(current_path).to eq(user_path(@user1))
  end

  it "have a link to go back to the home page on all pagess" do
    visit root_path
    expect(page).to have_link("Home")
    click_link "Home"
    expect(current_path).to eq(root_path)
    click_link "Jimar"
    expect(current_path).to eq(user_path(@user1))
    click_link "Home"
    expect(current_path).to eq(root_path)
  end
end

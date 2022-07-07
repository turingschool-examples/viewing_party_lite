require 'rails_helper'

RSpec.describe "Home page", type: :feature do
  it "Has title of application" do
    visit '/'
    save_and_open_page

    expect(page).to have_content("Viewing Party")
  end

  it "Has button to create new user" do
    visit '/'

    expect(page).to have_button("Create user")
  end

  it "Has a list of existing users" do
    user1 = User.create!(name: "Jimbo", email: "Jimbo@gmail.com")
    visit '/'

    expect(page).to have_link("Jimbo")
  end

  it "Has link to landing page" do
    visit '/'

    expect(page).to have_link("Home")
  end


end

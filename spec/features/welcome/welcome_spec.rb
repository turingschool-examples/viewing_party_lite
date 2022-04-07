require 'rails_helper'

RSpec.describe "Welcome Page" do
  before(:each) do
    @user = User.create!(name: "Benson" ,email: "benson@example.com", password_digest: "12345")
    @user2 = User.create!(name: "Mordecai" ,email: "mc@gmail.com", password_digest: "12345")
    @user3 = User.create!(name: "Rigby" ,email: "rigzbee@aol.com", password_digest: "12345")

    visit '/'
  end

  it "should title of application" do
    expect(page).to have_content("Viewing Party Light")
  end

  it "should have button to create a new user" do
    expect(page).to have_button("Create a New User")
  end

  it "should have list of exisitng users which links to users dashboard" do
    expect(page).to have_link(@user.email)
    expect(page).to have_link(@user2.email)
    expect(page).to have_link(@user3.email)
  end

  it "should have link to home page" do
    expect(page).to have_link("Home Page")
  end
end

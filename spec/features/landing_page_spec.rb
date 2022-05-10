require "rails_helper"

RSpec.describe "Landing page" do
  before :each do
    visit "/"
  end

  it "has title of application" do
    expect(page).to have_content("Viewing Party Lite")
  end

  it "has button to create new user" do
    expect(page).to have_button("Create New User")
  end

  it "has list of existing users w/ links" do
  end

  it "has link to go back to landing page" do
  end
end

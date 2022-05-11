require "rails_helper"

RSpec.describe "Landing page" do
  let!(:pabu) { User.create!(name: "Pabu", email: "pabu@email.com") }
  let!(:loki) { User.create!(name: "Loki", email: "loki@email.com") }
  let!(:thor) { User.create!(name: "Thor", email: "thor@email.com") }
  let!(:ian) { User.create!(name: "Ian", email: "ian@email.com") }
  let!(:phillip) { User.create!(name: "Phillip", email: "phillip@email.com") }

  before :each do
    visit "/"
  end

  it "has title of application" do
    expect(page).to have_content("Viewing Party Lite")
  end

  it "has button to create new user" do
    click_button("Create New User")
    expect(current_path).to eq("/register")
  end

  it "has list of existing users w/ links" do
    within ".Pabu" do
      click_link "Pabu"
    end
  end

  it "has link to go back to landing page" do
    click_link "Landing Page"
    expect(current_path).to eq("/")
  end
end

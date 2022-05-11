require "rails_helper"

RSpec.describe "Register New User" do
  it "has a form to register new user name, email with button" do
    visit people_path

    fill_in "Name", with: "Jamison Ordway"
    fill_in "Email", with: "jordway@mailg.com"
    click_button "Register"

    expect(current_path).to eq(person_path(person.id))
    expect(page).to have_content("Jamison Ordway")
    expect(page).to have_content("jordway@mailg.com")
  end
end

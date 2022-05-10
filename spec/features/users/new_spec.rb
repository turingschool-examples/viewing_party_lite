require "rails_helper"

RSpec.describe "users#new" do
  it "creates a new user" do
    visit root_path

    within(".users") do
      expect(page).to_not have_content("Fake Joe")
    end

    click_link "Create New User"

    fill_in "Name", with: "Fake Joe"
    fill_in "Email", with: "imnotreal@unreal.org"
    click_button "Create New User"
    
    expect(current_path).to eq(root_path)
    within(".users") do
      expect(page).to have_content("Fake Joe")
    end
  end
end

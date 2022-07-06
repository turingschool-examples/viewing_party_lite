require 'rails_helper'

RSpec.describe "Landing Page", type: :feature do
  let!(:users) { create_list(:user, 3)}
  let!(:viewing_party) { create(:viewing_party)}

  it "can display title of the application" do
    visit '/'

    expect(page).to have_content("Viewing Party")
  end

  it "has a button to create a new user" do
    visit '/'

    expect(page).to have_button("Create a New User")
    click_button "Create a New User"

    expect(current_path).to eq('/register')
  end
end

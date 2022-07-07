require 'rails_helper'

RSpec.describe "User Dashboard", type: :feature do
  let!(:users) { create_list(:user, 3)}
  let!(:viewing_party) { create(:viewing_party)}

  it "can display the users name at the top of the page" do
    visit user_path(users[0])

    expect(page).to have_content("#{users[0].user_name} Dashboard")
    expect(page).to_not have_content("#{users[1].user_name} Dashboard")
  end

  it "has a button to take you to the movies page" do
    visit user_path(users[0])

    expect(page).to have_button("Discover Movies")
    click_button "Discover Movies"

    expect(current_path).to eq(user_discover_index_path(users[0].id))

  end
end

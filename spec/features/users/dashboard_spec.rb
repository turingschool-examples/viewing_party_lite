require 'rails_helper'

RSpec.describe "User Dashboard", type: :feature do
  let!(:users) { create_list(:user, 3)}
  let!(:viewing_party) { create(:viewing_party)}

  it "can display the users name at the top of the page" do
    visit user_path(users[0])

    expect(page).to have_content("#{users[0].user_name} Dashboard")
  end
end

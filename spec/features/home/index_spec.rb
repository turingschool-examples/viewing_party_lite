require 'rails_helper'

RSpec.describe 'home page' do
  before :each do
    @user1 = User.create!(name: "Jim Bob", email: "jimb@viewingparty.com")
    @user2 = User.create!(name: "Cary Berry", email: "caryb@viewingparty.com")

    visit '/'
  end

  it 'title of application' do
    expect(page).to have_content("Viewing Party Lite")
    expect(page).to have_button("Create a New User")
    expect(page).to have_link("Jim Bob")
    expect(page).to have_link("Cary Berry")
    expect(page).to have_link("Home")
  end
end

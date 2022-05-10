require 'rails_helper'

describe "User dashboard/show" do
  before do
    @user1 = User.create(name: "User One", email: "user1@test.com")
    @user2 = User.create(name: "User Two", email: "user2@test.com")

    visit "/users/#{@user1.id}"
  end

  it 'displays the users name' do
    expect(page).to have_content("User One's page")
    expect(page).not_to have_content("User Two's page")
  end

  it 'has a button to discover movies' do
    click_button("Discover Movies")

    expect(current_path).to eq("/users/#{@user1.id}/discover")
    expect(current_path).not_to eq("/users/#{@user2.id}/discover")
  end
end

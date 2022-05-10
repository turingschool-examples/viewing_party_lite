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
end

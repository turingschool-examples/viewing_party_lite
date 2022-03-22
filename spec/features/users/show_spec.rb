require 'rails_helper'

RSpec.describe 'User Show Page' do
  it "displays User's Dashboard at top of page" do
    user1 = User.create(name: "Asil Rolyat", email: "asil.rolyat@yourmom.com")

    visit "/users/#{user1.id}"

    expect(page).to have_content("#{user1.name}'s Dashboard")
  end
end
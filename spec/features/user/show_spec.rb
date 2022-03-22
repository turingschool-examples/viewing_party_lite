require 'rails_helper'

RSpec.describe 'User dahsboard:', type: :feature do
  before(:each) do
    @user1 = User.create!(name: "Bliffert Blankship", email: "Bliff@aol.com")
    @user2 = User.create!(name: "Blankert Bliffship", email: "Blank@aol.com")
  end
  it "has stuff on the page" do

    visit "/users/#{@user1.id}"

    expect(page).to have_content("#{@user1.name}'s Magical dashboard")
    expect(page).to_not have_content("#{@user2.name}'s Magical dashboard")
    expect(page).to have_button("Discover Movies")
    expect(page).to have_content("Viewing Parties")
  end
end

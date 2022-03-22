require 'rails_helper'

RSpec.describe 'Discover things:', type: :feature do
  before(:each) do
    @user1 = User.create!(name: "Bliffert Blankship", email: "Bliff@aol.com")
    @user2 = User.create!(name: "Blankert Bliffship", email: "Blank@aol.com")
  end
  it "has stuff on the page" do

    visit "/users/#{@user1.id}/discover"

    expect(page).to have_content("Discover movies and things about yourself #{@user1.name}!")

  end
end

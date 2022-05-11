require 'rails_helper'

describe 'User dashboard', type: :feature do
  before do
    @user1 = User.create!(name: "John", email: "john.hennerich@gmail.com")
    @user2 = User.create!(name: "Brylan", email: "brylan.gannon112@gmail.com")

    visit user_path(@user1)
  end
  it "Displays user dashboard attributes on the page" do
    expect(page).to have_content("#{@user1.name}'s dashboard")
    expect(page).to_not have_content("#{@user2.name}'s dashboard")
    expect(page).to have_button("Discover Movies")
    expect(page).to have_content("Viewing Parties")
  end
end

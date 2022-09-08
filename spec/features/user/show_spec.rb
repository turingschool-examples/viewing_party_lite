require 'rails_helper'

describe 'Create a New User' do
  it "show be able to create a new user" do

    user = User.create!(name: "bob", email: "bob@gmail.com")
    user1 = User.create!(name: "tom", email: "tom@gmail.com")

    visit "/users/#{user.id}"

    expect(page).to have_content("bob")
    expect(page).to have_button("Discover Movies")
    expect(page).to have_content("Viewing Parties")

  end

end

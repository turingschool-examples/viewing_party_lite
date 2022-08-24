require 'rails_helper'

RSpec.describe 'show page', type: :feature do
  it 'has user information on show page' do
    user1 = User.create!(name: "Bob", email: "bob@turing.edu")
    user2 = User.create!(name: "Sally", email: "sally@turing.edu")
    user3 = User.create!(name: "Mike", email: "mike@turing.edu")

    visit user_path(user1)

    expect(page).to have_content(user1.name)
    expect(page).to have_button("Discover Movies")
    expect(page).to have_content("Viewing Parties")

  end
end
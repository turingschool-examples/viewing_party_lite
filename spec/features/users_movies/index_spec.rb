require 'rails_helper'

RSpec.describe 'Index', type: :feature do
  it "shows no more than the top 40 results" do
    user_1 = User.create(name: 'John Doe', email: 'John@gmail.com')

    visit "/users/#{user_1.id}"

    expect(page).to have_content("John Doe's Dashboard")
    expect(page).to have_no_content("Homer Simpson's Dashboard")
    expect(page).to have_button('Discover Movies')
    expect(page).to have_content('Viewing Parties')
  end

  it "has a title of each movie as a link, that when clicked, takes the user to that movies details page" do
    user_1 = User.create(name: 'John Doe', email: 'John@gmail.com')

    visit "/users/#{user_1.id}"

    click_button "Discover Movies"

    click_button "Top Movies"

  end
end
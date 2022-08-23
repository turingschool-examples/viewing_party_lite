require 'rails_helper'

RSpec.describe 'Show', type: :feature do
  it "shows the user's information and parties" do
    user_1 = User.create(name: 'John Doe', email: 'John@gmail.com')
    user_2 = User.create(name: 'Homer Simpson', email: 'Homer@gmail.com')

    visit "/users/#{user_1.id}"

    expect(page).to have_content("John Doe's Dashboard")
    expect(page).to have_no_content("Homer Simpson's Dashboard")
    expect(page).to have_button('Discover Movies')
    expect(page).to have_content('Viewing Parties')
  end
end
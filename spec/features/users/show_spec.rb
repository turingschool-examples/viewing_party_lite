require 'rails_helper'

RSpec.describe 'user dashboard', type: :feature do
  it 'has the specified info' do
    user = User.create(name: "Jill Jillian", email: "jill@gmail.com")
    visit "/users/#{user.id}"
    expect(page).to have_content("#{user.name}'s Dashboard")
    expect(page).to have_button("Discover Movies")
    expect(page).to have_content("Viewing Parties")
  end
end

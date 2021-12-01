require 'rails_helper'

RSpec.describe 'user show page' do
  it 'can show a user attributes' do
    user = User.create!(name: "Stephanie", email: "steph123@hotmail.com")

    visit "/users/#{user.id}"
    expect(page).to have_content(user.name)
    expect(page).to have_content(user.email)
    expect(page).to have_content("#{user.name}'s Dashboard")
  end

  it 'has a button to Discover Movies' do
    user = User.create!(name: "Stephanie", email: "steph123@hotmail.com")
    visit "/users/#{user.id}"

    click_on('Discover Movies')
    expect(current_path).to eq("/users/#{user.id}/discover")
  end

end

require 'rails_helper'

RSpec.describe 'user discover page', :vcr do

  it 'shows top movies button' do
    user1 = User.create!(email: "user1@example.com", name: "Jeff Casimir")

    visit "/users/#{user1.id}/discover"

    click_button 'Top Movies'

    expect(current_path).to eq("/users/#{user1.id}/movies")

    expect(page).to have_link("The Shawshank Redemption")
    expect(page).to have_content("Vote Average: 8.7")
    expect(page).to have_link("Discover")
  end

  it 'has search button' do
    user1 = User.create!(email: "user1@example.com", name: "Jeff Casimir")
    visit "/users/#{user1.id}/discover"
    fill_in('Search', with: 'shrek')
    click_button 'Search'

    expect(current_path).to eq("/users/#{user1.id}/movies")

    expect(page).to have_link("Shrek")
    expect(page).to have_content("Vote Average: 7.7")
    expect(page).to have_link("Discover")
  end
end

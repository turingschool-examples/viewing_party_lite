require 'rails_helper'

RSpec.describe 'Discover Index Page' do
  it 'has a button for Top Rated Movies and Search by Movie Title' do
    user1 = User.create(name: "Asil Rolyat", email: "asil.rolyat@yourmom.com")

    visit user_discover_index_path(user1)

    expect(page).to have_button('Top Rated Movies')
    expect(page).to have_button('Search Movie Title')
  end

  it 'has a text field for key words' do
    user1 = User.create(name: "Asil Rolyat", email: "asil.rolyat@yourmom.com")

    visit user_discover_index_path(user1)

    expect(page).to have_field('Keywords')
  end

  it 'allows user to use Top Rated Button' do
    user1 = User.create(name: "Asil Rolyat", email: "asil.rolyat@yourmom.com")

    visit user_discover_index_path(user1)

    click_button 'Top Rated Movies'
    expect(current_path).to eq(user_movies_path(user1))

    expect(page.status_code).to eq 200
    expect(page).to have_content("Shawshank Redemption")
  end

  it 'allows user to search for govt members' do
    user1 = User.create(name: "Asil Rolyat", email: "asil.rolyat@yourmom.com")

    visit user_discover_index_path(user1)

    fill_in :search, with: 'Shawshank'
    click_button 'Search'

    expect(page.status_code).to eq 200
    expect(page).to have_content("Shawshank Redemption")
  end
end
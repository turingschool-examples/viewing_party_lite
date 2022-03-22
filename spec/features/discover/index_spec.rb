require 'rails_helper'

RSpec.describe 'Discover Index Page' do
  it 'has a button for Top Rated Movies and Search by Movie Title' do
    user1 = User.create(name: "Asil Rolyat", email: "asil.rolyat@yourmom.com")

    visit user_discover_index_path(user1)

    expect(page).to have_button('Top Rated Movies')
    expect(page).to have_button('Search Movie Title')
  end

  # it 'has a text field for key words' do
  #   user1 = User.create(name: "Asil Rolyat", email: "asil.rolyat@yourmom.com")

  #   visit user_discover_index_path(user1)

  #   expect(page).to have_field('Keywords')
  # end
end
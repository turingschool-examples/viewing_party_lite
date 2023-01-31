require 'rails_helper'

RSpec.describe 'Discover Index' do
  let!(:users) { create_list(:user, 10) }
  let(:user) { users.first }

  it 'has a link to view top rated movies' do
    visit user_discover_index_path(user)

    expect(page).to have_button('Find Top Rated Movies')
  end

  it 'field to search for movies by title' do
    visit user_discover_index_path(user)

    expect(page).to have_field(:title)
    expect(page).to have_button('Find Movies')
  end
end
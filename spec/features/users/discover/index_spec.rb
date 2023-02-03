require 'rails_helper'

RSpec.describe 'Discover Index' do
  let!(:users) { create_list(:user, 10) }
  let(:user) { users.first }

  it 'has a link to view top rated movies' do
    visit user_discover_index_path(user)

    click_button('Find Top Rated Movies')

    expect(current_path).to eq(user_movies_path(user))
  end

  it 'has a field to search for movies by title' do
    visit user_discover_index_path(user)

    fill_in(:title, with: 'Green')
    click_button('Find Movies')

    expect(current_path).to eq(user_movies_path(user))
  end

  it 'accepts multiple words in search field' do
    visit user_discover_index_path(user)

    fill_in(:title, with: 'Spider Man')
    click_button('Find Movies')

    expect(current_path).to eq(user_movies_path(user))
  end
end
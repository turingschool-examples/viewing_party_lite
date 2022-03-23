require 'rails_helper'

RSpec.describe 'Movie Results Page', :vcr do

  it 'goes to movie results page' do
    eldridge = User.create!(name: 'Eldridge', email: 'eldridge@gmail.com')

    visit user_discover_index_path(eldridge)

    click_on('Find Top Rated Movies')

    expect(current_path).to eq(user_movies_path(eldridge))
    expect(page).to have_content('The Shawshank Redemption')
    expect(page).to have_link('Discover Page')

    click_on('Discover Page')
    expect(current_path).to eq(user_discover_index_path(eldridge))
  end
end

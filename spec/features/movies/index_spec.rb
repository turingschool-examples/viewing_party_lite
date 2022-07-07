require 'rails_helper'

RSpec.describe '#index' do
  it '#top rated', :vcr do
    @jose = User.create!(name: 'Jose Andres', email: 'jose.andres@gmail.com', password: '111',
                         password_confirmation: '111')

    visit user_movies_discover_path(@jose)

    click_on 'Find Top Rated Movies'

    expect(current_path).to eq(user_movies_path(@jose))

    expect(page).to have_link('Discover Page')

    within '#278' do
      expect(page).to have_link('The Shawshank Redemption')

      expect(page).to have_content('Vote Average: 8.7')
    end
  end
end

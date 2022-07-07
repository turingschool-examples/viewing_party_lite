require 'rails_helper'

RSpec.describe '#discover' do
  it 'has movie selectors' do
    @jose = User.create!(name: 'Jose Andres', email: 'jose.andres@gmail.com', password: '111',
                         password_confirmation: '111')

    visit user_movies_discover_path(@jose)

    click_on 'Find Top Rated Movies'

    expect(current_path).to eq(user_movies_path(@jose))

    visit user_movies_discover_path(@jose)

    fill_in :q, with: 'Pirates'
    click_on 'Find Movie'

    expect(current_path).to eq(user_movies_path(@jose))
  end
end

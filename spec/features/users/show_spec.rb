require 'rails_helper'

RSpec.describe '#show' do
  it 'have button to discover movies' do
    @jose = User.create!(name: 'Jose Andres', email: 'jose.andres@gmail.com', password: '111',
                         password_confirmation: '111')

    visit user_path(@jose)

    click_on 'Discover Movies'

    expect(current_path).to eq(user_movies_discover_path(@jose))
  end
end

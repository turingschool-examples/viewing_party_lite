require 'rails_helper'

RSpec.describe '#discover' do
  it 'has movie selectors', :vcr do
    @jose = User.create!(name: 'Jose Andres', email: 'jose.andres@gmail.com', password: '111',
                         password_confirmation: '111')

    visit discover_path

    click_on 'Find Top Rated Movies'

    expect(current_path).to eq(movies_path)

    visit discover_path

    fill_in :q, with: 'Pirates'
    click_on 'Find Movie'

    expect(current_path).to eq(movies_path)
  end
end

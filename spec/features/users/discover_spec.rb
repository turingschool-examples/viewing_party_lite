require 'rails_helper'

RSpec.describe 'discover page' do
  it 'has a button to find top rated movies' do
    user1 = User.create!(name: 'Geraldo', email: 'geraldo@trashtv.com')

    visit "users/#{user1.id}/discover"

    expect(page).to have_button "Find Top Rated Movies"
    click_button "Find Top Rated Movies"
    expect(current_path).to eq "/users/#{user1.id}/movies?q=top%40rated"
  end
end

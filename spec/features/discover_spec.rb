require 'rails_helper'

RSpec.describe 'Discover' do
  it 'has a button to display top rated movies' do
    user = User.create!(name: 'User', email: 'user@email.com')

    visit "user/#{user.id}/discover"

    expect(page).to have_button("Discover Top Rated Movies")
  end

end
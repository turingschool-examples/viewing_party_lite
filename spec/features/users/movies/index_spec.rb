require 'rails_helper'

RSpec.describe 'User Movies Index Page' do
  it 'displays top 40 movies' do
    user = User.create!(name: 'User', email: 'user@email.com')

    visit "user/#{user.id}/discover"

    click_button("Discover Top Rated Movies")
    expect(page).to have_content("The Shawshank Redemption")
    expect(page).to have_content("Vote Average: 8.7")
    expect(page).to have_content("Schindler's List")
    expect(page).to have_content("Vote Average: 8.6")
  end
end
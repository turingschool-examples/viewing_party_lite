require 'rails_helper'

RSpec.describe 'Movies Show Page' do
  it 'can show the top 40 movies from the API', :vcr do
    user1 = User.create!(name: 'Geraldo', email: 'geraldo@trashtv.com')
    visit "users/#{user1.id}/discover"

    click_button "Find Top Rated Movies"

    expect(current_path).to eq "/users/#{user1.id}/movies"
    expect(page).to have_css('table#top-movies tr', :count=>41)
    expect(page).to have_content('Shawshank Redemption')
  end
end
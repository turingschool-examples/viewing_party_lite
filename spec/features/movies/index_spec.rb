require 'rails_helper'

RSpec.describe 'Movies Index Page' do
  xit 'can show the top 40 movies from the API', :vcr do
    user1 = User.create!(name: 'Geraldo', email: 'geraldo@trashtv.com')
    visit "users/#{user1.id}/discover"

    click_button "Find Top Rated Movies"

    save_and_open_page

    expect(current_path).to eq "/users/#{user1.id}/movies?q=top-rated"

  end

  it 'can show the top 40 movies from the API based on a search string', :vcr do
    user1 = User.create!(name: 'Geraldo', email: 'geraldo@trashtv.com')

    visit "users/#{user1.id}/discover"

    fill_in :q, with: 'spongebob'
    click_button 'Find Movies'

    expect(page.status_code).to eq 200

    # 1 Header row, 40 result rows
    expect(page).to have_content("Movie Results for: spongebob")
    expect(page).to have_css('table#searched-movies-table tr', :count=>41)
  end
end
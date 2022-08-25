require 'rails_helper'

RSpec.describe 'Movies Index Page' do
  it 'can show the top 40 movies from the API', :vcr do
    user1 = User.create!(name: 'Geraldo', email: 'geraldo@trashtv.com')
    visit "users/#{user1.id}/discover"

    click_button "Find Top Rated Movies"

    expect(current_path).to eq "/users/#{user1.id}/movies"
    expect(page).to have_css('table#top-movies tr', :count=>41)
    expect(page).to have_content('Shawshank Redemption')
  end

  it 'can show the top 40 movies from the API based on a search string', :vcr do
    user1 = User.create!(name: 'Geraldo', email: 'geraldo@trashtv.com')

    visit "users/#{user1.id}/discover"

    fill_in :q, with: 'spongebob'
    click_button 'Find Movies'

    expect(page.status_code).to eq 200

    # 1 Header row, 40 result rows
    expect(current_path).to eq "/users/#{user1.id}/movies"
    expect(page).to have_content("Movie Results for: spongebob")
    expect(page).to have_css('table#searched-movies-table tr', :count=>41)
  end

  it 'has a link to the show page for movies', :vcr do
    user1 = User.create!(name: 'Geraldo', email: 'geraldo@trashtv.com')
    visit "users/#{user1.id}/discover"

    click_button "Find Top Rated Movies"

    expect(current_path).to eq "/users/#{user1.id}/movies"

    expect(page).to have_link "The Shawshank Redemption"

    click_link "The Shawshank Redemption"

    expect(current_path).to eq "/users/#{user1.id}/movies/278"

  end
end
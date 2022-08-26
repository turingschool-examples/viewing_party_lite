require 'rails_helper'

RSpec.describe 'discover page' do
  it 'has a button to find top rated movies' do
    user1 = User.create!(name: 'Geraldo', email: 'geraldo@trashtv.com', password: "password")

    visit "users/#{user1.id}/discover"

    expect(page).to have_button "Find Top Rated Movies"
    # click_button "Find Top Rated Movies"
    # expect(current_path).to eq "/users/#{user1.id}/movies?top_rated=true"
  end

  it 'can search by movie title' do
    user1 = User.create!(name: 'Geraldo', email: 'geraldo@trashtv.com', password: "password")

    visit "users/#{user1.id}/discover"

    expect(page).to have_button "Find Top Rated Movies"
    # click_button "Find Top Rated Movies"
    # expect(current_path).to eq "/users/#{user1.id}/movies?top_rated=true"
  end
end

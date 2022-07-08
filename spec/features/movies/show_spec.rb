require 'rails_helper'

RSpec.describe 'movies show page' do
  let!(:user_1) { User.create!(name: "Sam", email: "sam@zmail.com" ) }
  let!(:movie_id) { 453395 }
  it 'can see a button for creating view party and to return to discover page', :vcr do

    visit user_movie_path(user_1.id, movie_id)

    expect(page).to have_button("Create Viewing Party")
    expect(page).to have_button("Discover Movies")
    click_button "Discover Movies"
    expect(current_path).to eq(user_discover_index_path(user_1.id))
  end
end

require 'rails_helper'

describe 'Discover Movies' do
  before do
    @user1 = User.create!(name: "John", email: "john.hennerich@gmail.com")
    @user2 = User.create!(name: "Brylan", email: "brylan.gannon112@gmail.com")

    visit user_discover_index_path(@user1)
  end

  it 'Displays a header' do
    expect(page).to have_content("Discover Movies")
  end

  it 'displays a top 20 movies button that routes to the discover page' do
    click_button 'Top 20 Movies'

    expect(current_path).to eq("/users/#{@user1.id}/movies")
  end 

  it 'displays a search bar to find movies by keyword' do
    fill_in :query, with: 'Mad'
    click_button 'Search by Title'

    expect(current_path).to eq("/users/#{@user1.id}/movies")
  end
end

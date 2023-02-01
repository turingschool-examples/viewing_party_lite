require 'rails_helper'

RSpec.describe "The Discover Movies Page" do
  before :each do
    @user = User.create!(name: "John Cena", email: "johnc@email.com")
  end

  it 'is accessed from a button on a users show page' do
    visit user_dashboard_index_path(@user)

    click_button "Discover Movies"

    expect(current_path).to eq(user_discover_index_path(@user))
  end

  it 'has a button to discover top rated movies' do
    visit user_discover_index_path(@user)

    expect(page).to have_button("Top Rated Movies")
  end

  it 'has a text field to enter keywords to search by movie title and search button' do
    visit user_discover_index_path(@user)

    expect(page).to have_field(:movie_search)
    expect(page).to have_button("Search")
  end
end
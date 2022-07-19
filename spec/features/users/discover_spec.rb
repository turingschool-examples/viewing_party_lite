require 'rails_helper'

RSpec.describe 'Movies Discover Page', type: :feature do
  let!(:users) { create_list(:user, 3)}
  let!(:viewing_party) { create(:viewing_party)}
  let!(:bob) { User.create(user_name: 'Bob', email: 'Bob@gmail.com', password: 'blob', password_confirmation: 'blob') }

  before :each do
    visit login_path
    fill_in :email, with: 'Bob@gmail.com'
    fill_in :password, with: 'blob'
    click_on 'Log In'
  end

  it 'has a button to discover top rated movies', :vcr do
    visit discover_path

    click_button('Top Rated Movies')
    expect(current_path).to eq("/users/#{bob.id}/movies")
    expect(page).to have_content("Shawshank Redemption")
  end

  it 'has a text field to enter keywords to search by movie title and a button to search', :vcr do
    visit discover_path

    expect(page).to have_field('Movie Title')
    expect(page).to have_button('Search')
  end

  it 'can search for movies by title', :vcr do
    visit discover_path
    fill_in 'Movie Title', with: "Shawshank"
    click_button 'Search'
    expect(current_path).to eq(user_movies_path("#{bob.id}"))
    expect(page).to have_content('The Shawshank Redemption')
  end

  it "can return nothing when search by title" do
    visit discover_path
    fill_in 'Movie Title', with: ""
    click_button 'Search'

    expect(current_path).to eq(user_movies_path("#{bob.id}"))
    expect(page).to have_content("0 Search Results")
  end
end

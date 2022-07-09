require 'rails_helper'

RSpec.describe 'Movies Results Page', type: :feature do
  let!(:users) { create_list(:user, 3)}
  let!(:viewing_party) { create(:viewing_party)}


  it 'has a button to return to discover page', :vcr do
    visit user_movies_path(users[0].id)
    expect(page).to have_button("Discover Page")
    click_button "Discover Page"
    expect(current_path).to eq(user_discover_path(users[0].id))
  end

  it "allows to display top 40 movies", :vcr do
    visit user_discover_path(users[0].id)
    click_button "Top Rated Movies"
    expect(current_path).to eq(user_movies_path(users[0].id))
    expect(page).to have_content("The Shawshank Redemption")
    expect(page).to have_content("The Godfather")
    expect(page).to have_content(8.7)
  end

  it "has a movie title that is a link that goes to the movies detail page", :vcr do
    visit user_discover_path(users[0].id)
    click_button "Top Rated Movies"
    expect(current_path).to eq(user_movies_path(users[0].id))
    expect(page).to have_link("The Shawshank Redemption")
    click_link "The Shawshank Redemption"

    expect(current_path).to have_content(user_movie_path(users[0].id, 278))
  end
end

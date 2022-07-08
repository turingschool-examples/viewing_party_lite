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
    expect(current_path).to eq("users/#{users.id}/movies?q=top%20rated")
    expect(page).to have_content("The Shawshank Redemption")
    expect(page).to have_content("The Godfather")
  end
end










require 'rails_helper'

RSpec.describe 'Top Rated Movies' do
  it 'shows top 40 movies based on rating' do
    user = User.create!(name: "Bernie", email: "bernie@gmail.com")
    visit user_movies_discover_path(user)


    click_button 'Top Rated Movies'
    save_and_open_page

    expect(page.status_code).to eq 200
    within "#movie-0" do
      expect(page).to have_link("Shawshank Redemption")
      expect(page).to have_content("Average Rating: 8.7")
    end
    within "#movie-2" do
      expect(page).to have_link("The Godfather")
      expect(page).to have_content("Average Rating: 8.7")
    end
  end
end
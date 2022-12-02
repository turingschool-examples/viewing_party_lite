require 'rails_helper'

RSpec.describe 'Movies Index Page' do
  let!(:user1) { create(:user) }
  let!(:user2) { create(:user) }

  before :each do
    visit discover_path(user1)
  end

  xit 'goes to movie show page when a link is clicked' do
    expect(page).to have_button('Find Top Rated Movies')
    click_button('Find Top Rated Movies')

    expect(page).to have_button("Discover Page")
    expect(page).to have_content("Top Rated Movies")

    expect(page).to have_content("20th Century Girl")
    expect(page).to have_link("20th Century Girl")
    expect(page).to have_content("The Godfather")
    expect(page).to have_link("The Godfather")
    expect(page).to have_content("Impossible Things")
    expect(page).to have_link("Impossible Things")
  end
end

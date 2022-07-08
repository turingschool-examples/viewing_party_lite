require 'rails_helper'

RSpec.describe 'Movies Index/Results Page' do
  before :each do
    @user = User.create!(name: 'Drewb', email: 'Drew@testemail.com')
  end

  it "displays the top rated movies", :vcr do
    visit "users/#{@user.id}/discover"
    click_button("Discover Top Rated Movies")

    expect(page).to have_link("The Shawshank Redemption")
    expect(page).to have_content("Vote Count: 21715")
    expect(page).to have_link("Gabriel's Inferno")
    expect(page).to have_content("Vote Count: 2259")
  end

  it "displays movies related to a prior search", :vcr do
    visit "users/#{@user.id}/discover"
    fill_in "search", with: "Shaw"
    click_button("Search")

    expect(page).to have_link("The Shawshank Redemption")
    expect(page).to have_link("Shawshank: The Redeeming Feature")
    expect(page).to_not have_link("Gabriel's Inferno")
  end

  it "links to a movie's details, show page", :vcr do
    visit "users/#{@user.id}/discover"
    click_button("Discover Top Rated Movies")

    click_link("The Shawshank Redemption")
    expect(current_path).to eq("users/#{@user.id}/movies/496243")
  end
end

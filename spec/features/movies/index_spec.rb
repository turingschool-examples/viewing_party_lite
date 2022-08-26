require 'rails_helper'

RSpec.describe 'Movies Index Page' do
  it 'can search for movies', :vcr do
    user1 = User.create!(name: "#{Faker::TvShows::HowIMetYourMother.character}", email: "#{Faker::TvShows::HowIMetYourMother.character}@centuryfoxtv.com")

    visit "/users/#{user1.id}/discover"

    expect(page).to have_button("Find Movies")
    fill_in :search, with: "The Shawshank Redemption"
    click_button('Find Movies')

    expect(current_path).to eq("/users/#{user1.id}/movies")
    expect(page).to have_content("The Shawshank Redemption")
    expect(page).to have_content("Hope Springs Eternal: A Look Back at The Shawshank Redemption")
    expect(page).to have_content("Vote Average: 8.7")
    expect(page).to have_content("Vote Average: 7")
  end

  it 'can display top 40 movies', :vcr do
    user1 = User.create!(name: "#{Faker::TvShows::HowIMetYourMother.character}", email: "#{Faker::TvShows::HowIMetYourMother.character}@centuryfoxtv.com")

    visit "/users/#{user1.id}/discover"

    expect(page).to have_button("Discover Top Rated Movies")
    click_button('Discover Top Rated Movies')

    expect(current_path).to eq("/users/#{user1.id}/movies")
    expect(page).to have_content("The Shawshank Redemption")
    expect(page).to_not have_content("Jurrasic Park")
    expect(page).to have_content("Vote Average: 8.7")
    expect(page).to_not have_content("Vote Average: 2")
  end
end

require 'rails_helper'

RSpec.describe 'User Discover Page' do
  it 'can search for movies or display top 40 movies', :vcr do
    user1 = User.create!(name: "#{Faker::TvShows::HowIMetYourMother.character}", email: "#{Faker::TvShows::HowIMetYourMother.character}@centuryfoxtv.com", password_digest: "#{Faker::Internet.password}")

    visit "/users/#{user1.id}/discover"

    expect(page).to have_button("Find Movies")
    expect(page).to have_button("Discover Top Rated Movies")

  end
end

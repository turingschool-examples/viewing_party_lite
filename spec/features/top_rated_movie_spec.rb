require 'rails_helper'
require 'faker'

RSpec.describe 'Top Rated Movies' do
  it 'allows user to see the top rated movies', :vcr do
    user1 = User.create!(name: Faker::Name.first_name, email: Faker::Internet.email)

    visit "/users/#{user1.id}/movies?q=top%20rated"
    save_and_open_page
    expect(page.status_code).to eq 200
    expect(page).to have_content("The Shawshank Redemption Vote Average: 8.7")
    expect(page).to have_link("The Shawshank Redemption")
    expect(page).to have_content("दिलवाले दुल्हनिया ले जायेंगे Vote Average: 8.7")
    expect(page).to have_link("दिलवाले दुल्हनिया ले जायेंगे")
    expect(page).to_not have_content("Harry My Pet Lizard")
  end
end
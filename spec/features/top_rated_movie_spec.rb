require 'rails_helper'
require 'faker'

RSpec.describe 'Top Rated Movies' do
  it 'allows user to see the top 40 rated movies', :vcr do
    user1 = User.create!(name: Faker::Name.first_name, email: Faker::Internet.email)

    visit "/users/#{user1.id}/movies?q=top%20rated"

    expect(page.status_code).to eq 200
    expect(page).to have_content("The Shawshank Redemption Vote Average: 8.7")
    expect(page).to have_link("The Shawshank Redemption")
    expect(page).to have_content("दिलवाले दुल्हनिया ले जायेंगे Vote Average: 8.7")
    expect(page).to have_link("दिलवाले दुल्हनिया ले जायेंगे")
    expect(page).to_not have_content("Harry My Pet Lizard")
    expect(page).to have_selector('ol li', count: 40)
    expect(page).to_not have_selector('ol li', count: 41)
    expect(page).to have_button('Discover Page')
  end
end
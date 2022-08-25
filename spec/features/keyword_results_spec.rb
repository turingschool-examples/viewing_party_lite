require 'rails_helper'
require 'faker'

RSpec.describe 'Keyword Results' do
  it 'allows user to see the movies containing the word(s) searched for', :vcr do
    user1 = User.create!(name: Faker::Name.first_name, email: Faker::Internet.email)

    visit "/users/#{user1.id}/movies?q=Shawshank"
    save_and_open_page
    expect(page.status_code).to eq 200
    expect(page).to have_content("The Shawshank Redemption Vote Average: 8.7")
    expect(page).to have_link("The Shawshank Redemption")
    expect(page).to_not have_content("दिलवाले दुल्हनिया ले जायेंगे Vote Average: 8.7")
    expect(page).to have_button('Discover Page')
    expect(page).to have_content('Movie results for: Shawshank')
  end
end
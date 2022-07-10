require 'rails_helper'

RSpec.describe 'discover page' do
  before do
    @user1 = User.create!(name: "Pabu", email: "pabu@pabu.com")
    @user2 = User.create!(name: Faker::JapaneseMedia::OnePiece.character, email: "#{Faker::JapaneseMedia::OnePiece.island}@onepiece.com")
    @user3 = User.create!(name: Faker::JapaneseMedia::SwordArtOnline.real_name, email: "#{Faker::JapaneseMedia::SwordArtOnline.game_name}@swordart.com")

    visit "/users/#{@user1.id}/discover"
  end

  it 'has a button to Discover Top Rated Movies', :vcr do
    click_button "Discover Top Rated Movies"

    expect(current_path).to eq("/users/#{@user1.id}/movies")
    expect(page).to have_content('The Shawshank Redemption')
  end

  it 'has a text field to enter keyword(s) to search by movie title', :vcr do
    fill_in 'movie_title', with: 'Spirited Away'
    click_button "Search By Movie Title"

    expect(page).to have_content("Spirited Away")
  end
end

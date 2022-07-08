require 'rails_helper'

RSpec.describe 'discover page' do
  before do
    visit "/users/#{user1.id}/discover"

    @user1 = User.create!(name: "Pabu", email: "pabu@pabu.com")
    @user2 = User.create!(name: Faker::JapaneseMedia::OnePiece.character, email: "#{Faker::JapaneseMedia::OnePiece.island}@onepiece.com")
    @user3 = User.create!(name: Faker::JapaneseMedia::SwordArtOnline.real_name, email: "#{Faker::JapaneseMedia::SwordArtOnline.game_name}@swordart.com")
  end

  it 'has a button to Discover Top Rated Movies' do
    click_button "Discover Top Rated Movies"
  end

  it 'has a text field to enter keyword(s) to search by movie title' do
    expect(page).to have_field("MovieTitle")
    expect(page).to have_button("Search By Movie Title")
  end
end
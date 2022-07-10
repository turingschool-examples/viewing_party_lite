require 'rails_helper'

RSpec.describe 'movies index page' do
  before do
    @user1 = User.create!(name: "Pabu", email: "pabu@pabu.com")
    @user2 = User.create!(name: Faker::JapaneseMedia::OnePiece.character, email: "#{Faker::JapaneseMedia::OnePiece.island}@onepiece.com")
    @user3 = User.create!(name: Faker::JapaneseMedia::SwordArtOnline.real_name, email: "#{Faker::JapaneseMedia::SwordArtOnline.game_name}@swordart.com")

    visit "/users/#{@user1.id}/movies/278"
  end

  it 'has specifc movie details' do
    expect(page).to have_content("The Shawshank Redemption")
    expect(page).to have_content("Vote average: 8.7")
    expect(page).to have_content("Genres:")
    expect(page).to have_content("Drama")
    expect(page).to have_content("Crime")
    expect(page).to have_content("Summary description: Framed in the 1940s")
    expect(page).to have_content("First 10 cast:")
    expect(page).to have_content("Andy Dufresne, played by Tim Robbins")
    expect(page).to have_content("Skeet, played by Larry Brandenburg")
    expect(page).to have_content("Count of reviews: 21756")
    expect(page).to have_content("Movie reviews:")
    expect(page).to have_content("elshaarawy: very good movie 9.5/10")
  end

  it 'has a button to discover top rated movies' do
    click_button 'Return to Discover Page'

    expect(current_path).to eq("/users/#{@user1.id}/discover")
  end

  it 'has button to make a viewing party' do
    click_button 'Create a viewing party'
    
    expect(current_path).to eq("/users/#{@user1.id}/movies/278/viewing-party/new")
  end
end

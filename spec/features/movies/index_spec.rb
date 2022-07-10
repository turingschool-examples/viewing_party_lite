require 'rails_helper'

RSpec.describe 'movies index page' do
  before do
    @user1 = User.create!(name: "Pabu", email: "pabu@pabu.com")
    @user2 = User.create!(name: Faker::JapaneseMedia::OnePiece.character, email: "#{Faker::JapaneseMedia::OnePiece.island}@onepiece.com")
    @user3 = User.create!(name: Faker::JapaneseMedia::SwordArtOnline.real_name, email: "#{Faker::JapaneseMedia::SwordArtOnline.game_name}@swordart.com")
    
    visit "/users/#{@user1.id}/movies"
  end

  it 'has a button to discover top rated movies' do
    click_button 'Return to Discover Page'
    
    expect(current_path).to eq("/users/#{@user1.id}/discover")
  end
end

require 'rails_helper'
require 'faker'

RSpec.describe 'user dashboard page' do
  before :each do
    @user1 = User.create(name: "Pabu", email: "pabu@pabu.com")
    @user2 = User.create(name: Faker::JapaneseMedia::OnePiece.character ,email: "#{Faker::JapaneseMedia::OnePiece.island}@onepiece.com")

    visit "/users/#{@user1.id}"
  end
  it 'has a users info' do
    expect(page).to have_content("#{@user1.name}'s Dashboard")
    expect(page).to have_content("Viewing Parties")

  end
  it 'has a buttons to movie information' do
    click_button "Discover Movies"
    expect(current_path).to eq("/users/#{@user1.id}/discover")
  end
end

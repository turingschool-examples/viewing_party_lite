require "rails_helper"

RSpec.describe "Landing page" do
  before do
    @user1 = User.create!(name: "Pabu", email: "pabu@pabu.com")
    @user2 = User.create(name: Faker::JapaneseMedia::OnePiece.character ,email: "#{Faker::JapaneseMedia::OnePiece.island}@onepiece.com")
    @user3 = User.create(name: Faker::JapaneseMedia::SwordArtOnline.real_name ,email: "#{Faker::JapaneseMedia::SwordArtOnline.game_name}@swordart.com")

    visit "/"
  end

  it "has title of application" do
    expect(page).to have_content("Viewing Party Lite")
  end

  it "has button to create new user" do
    click_button("Create a New User")
    expect(current_path).to eq("/register")
  end

  it "has list of existing users w/ links" do
    expect(page).to have_content("Existing Users:")
    within "#user-#{@user1.id}" do
      click_link "pabu@pabu.com"
      expect(current_path).to eq("/users/#{@user1.id}")
    end
  end

  it "has link to go back to landing page" do
    click_link "Home"
    expect(current_path).to eq("/")
  end
end

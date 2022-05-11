require 'rails_helper'

RSpec.describe "user dashboard" do
  it "has a button to discover movies" do
    user_1 = User.create!(name: "Twitch", email: "twitch@dogmail.com")
    visit "/users/#{user_1.id}"
    click_button "Discover Movies"

    expect(current_path).to eq("/users/#{user_1.id}/discover")
  end
end
require 'rails_helper'

RSpec.describe 'movie detail page' do
  before(:each) do
    @user1 = User.create!(name: "cory", email: "cory@gmail.com")
  end

  it "has a button to create a viewing party and a button to return to discover page", :vcr do
    visit "/users/#{@user1.id}/movies/278"

    click_button("Create Viewing Party")
    expect(current_path).to eq("/users/#{@user1.id}/movies/278/viewing-party/new")

    visit "/users/#{@user1.id}/movies/278"

    click_button("Discover Page")
    expect(current_path).to eq("/users/#{@user1.id}/discover")
  end
end

require 'rails_helper'

RSpec.describe "Move Index/Discover Page", type: :feature do
  it 'can search for a movie by title', :vcr do
    user = User.create!(name: "Tim", email: "Tim@mail.com", password: "password", password_confirmation: "password")

    visit "/login"
    fill_in :email, with: user.email
    fill_in :password, with: user.password
    click_on "Login"

    visit "/discover"
    fill_in :search, with: "Movie"
    click_on "Search"
    expect(current_path).to eq("/users/#{user.id}/movies")
  end
end

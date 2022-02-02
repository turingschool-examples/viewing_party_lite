require 'rails_helper'

RSpec.describe 'Discover index page' do
  it "checks for description of page" do
    user_1 = User.create!(name: 'User 1', email: 'email1@gmail.com')
    visit user_discover_index_path(user_1)
    expect(page).to have_content("Discover Movies")
  end

  it "check for top rated movies button" do
    user_1 = User.create!(name: 'User 1', email: 'email1@gmail.com')
    visit user_discover_index_path(user_1)
    expect(page).to have_button("Find Top Rated Movies")
    click_button "Find Top Rated Movies"
    expect(current_path).to eq("users/#{user_1.id}/movies?q=top%40rated")
  end

  # it "text" do
  #
  # end
end

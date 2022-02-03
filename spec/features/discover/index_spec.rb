require 'rails_helper'

RSpec.describe 'Discover index page' do
  it "checks for description of page" do
    user_1 = User.create!(name: 'User 1', email: 'email1@gmail.com')
    visit "/users/#{user_1.id}/discover"
    expect(page).to have_content("Discover Movies")
  end

  it "check for top rated movies button" do
    # VCR.use_cassette('movies_data_from_api') do
      user_1 = User.create!(name: 'User 1', email: 'email1@gmail.com')
      visit "/users/#{user_1.id}/discover"
      expect(page).to have_button("Find Top Rated Movies")
      # click_button "Find Top Rated Movies"
      # expect(current_path).to eq("/users/#{user_1.id}/movies")
      # Why doesnt we add the string query here?            ^ "/users/#{@user.id}/movies?q=top%20rated"
    # end
  end

  # it "text" do
  #
  # end
end

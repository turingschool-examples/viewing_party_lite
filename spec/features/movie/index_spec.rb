require 'rails_helper'

RSpec.describe 'Movie index page' do
  it "checks that the API is returning a search result" do
    VCR.use_cassette('movies_data_from_api') do
      user_1 = User.create!(name: 'User 1', email: 'email1@gmail.com')

      visit "/users/#{user_1.id}/discover"

      fill_in(:keyword, with: "Fight")
      click_button "Find Movies"

      expect(current_path).to eq("/users/#{user_1.id}/movies")
      save_and_open_page
      expect(page).to have_content("Fight Club")
    end
  end


end

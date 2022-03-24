require 'rails_helper'

RSpec.describe 'User dashboard:', type: :feature do

  before(:each) do
    @user1 = User.create!(name: "Bliffert Blankship", email: "Bliff@aol.com")
    @user2 = User.create!(name: "Blankert Bliffship", email: "Blank@aol.com")
  end

  it "has stuff on the page", :vcr do

      visit "/users/#{@user1.id}/movies/5244"
      #save_and_open_page
      expect(page).to have_content('"Pleasurecraft" related stuff here')
      expect(page).to have_button("Discover Movies")
      expect(page).to have_button("Create Viewing Party for Pleasurecraft")
      expect(page).to have_content("Starring:")
  end
end

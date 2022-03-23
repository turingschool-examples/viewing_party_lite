require 'rails_helper'

RSpec.describe 'user dashboard page' do
  before(:each) do
    @user1 = User.create!(name: "Jess", email: "Jess@fakemail.com")

    visit "/users/#{@user1.id}"
  end

  describe "When a user visits a user's dashboard" do
    scenario "They see the user's name at the top, button to Discover Movies, and a section that lists viewing parties" do
      expect(page).to have_content("#{@user1.name}'s Dashboard")

      expect(page).to have_button "Discover Movies"
      expect(page).to have_content "Viewing Parties:"
    end

    scenario 'when user clicks on discover movies button, they are taken to the discover page' do
      click_button "Discover Movies"
      expect(current_path).to eq("/users/#{@user1.id}/discover")
    end
  end
end

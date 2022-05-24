require 'rails_helper'

RSpec.describe 'User dashboard:', type: :feature do

  before(:each) do
    @user1 = User.create!(name: "Bliffert Blankship", email: "Bliff@aol.com", password: "12345", password_confirmation: "12345")
    @user2 = User.create!(name: "Blankert Bliffship", email: "Blank@aol.com", password: "12345", password_confirmation: "12345")
    visit '/login'
    fill_in("name", with: @user1.name)
    fill_in("email", with: @user1.email)
    fill_in("Password", with: @user1.password)
    click_button("Log in")

  end

  it "has stuff on the page" do
    VCR.use_cassette('has_stuff', :record => :new_episodes) do

      visit "/users/#{@user1.id}/movies/5244"
      expect(page).to have_content('related stuff here')
      expect(page).to have_button("Discover Movies")
      expect(page).to have_button("Create Viewing Party for Pleasurecraft")
      expect(page).to have_content("Starring:")
    end
  end
end

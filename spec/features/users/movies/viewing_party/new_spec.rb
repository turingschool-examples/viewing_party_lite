require 'rails_helper'

RSpec.describe "create a new viewing party" do
  before(:each) do
    @user1 = User.create!(name: "Max", email: "max@yahoo.com")
    @user2 = User.create!(name: "Joseph", email: "joseph@yahoo.com")
    @user3 = User.create!(name: "Sherman", email: "sherman@yahoo.com")
    @movie = MovieFacade.search("Stardust").first
    visit "/users/#{@user1.id}/movies/#{@movie.id}/viewing-party/new"
  end

  context "visiting the page" do
    it "displays a form" do
      expect(page).to have_content("Stardust")
      expect(page).to have_content("Duration of party")
      expect(page).to have_content("When")
      expect(page).to have_content("Start time")
      expect(page).to have_content("Joseph")
      expect(page).to have_content("Sherman")
    end

    it "creates a new party" do
      save_and_open_page
      fill_in(:duration, with: 127)
      fill_in(:when, with: "05/17/2022")
      fill_in(:start_time, with: "19:00")
      find(:label, for: "Joseph").click
      find(:label, for: "Sherman").click
      click_button "Create New Party!"
    end
  end
end

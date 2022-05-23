require 'rails_helper'

RSpec.describe "create a new viewing party" do
  before(:each) do
    @user1 = User.create!(name: "Max", email: "max@yahoo.com", password: "Max")
    @user2 = User.create!(name: "Susan", email: "susan@yahoo.com", password: "Susans")
    @user3 = User.create!(name: "Sherman", email: "sherman@yahoo.com", password: "Sherman")
    @user4 = User.create!(name: "Joseph", email: "joseph@yahoo.com", password: "Joseph")
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
      fill_in(:length, with: 127)
      fill_in(:date, with: Date.today)
      fill_in(:start_time, with: "19:00")
      check "Joseph"
      check "Sherman"
      click_button "Create New Party!"

      expect(current_path).to eq("/users/#{@user1.id}")
    end
  end
end

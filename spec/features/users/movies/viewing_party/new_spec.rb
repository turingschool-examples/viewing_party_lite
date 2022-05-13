require 'rails_helper'

RSpec.describe "create a new viewing party" do
  before(:each) do
    @user1 = User.create!(name: "Max", email: "max@yahoo.com")
    @user2 = User.create!(name: "Joseph", email: "joseph@yahoo.com")
    @user3 = User.create!(name: "Sherman", email: "sherman@yahoo.com")
    movie = {id: 34, runtime: 120}
    visit "/users/#{@user1.id}/movies/#{movie[:id]}/viewing-party/new"
  end

  context "visiting the page" do
    it "displays a form" do
      expect(page).to have_content("Duration of Party")
      expect(page).to have_content("When")
      expect(page).to have_content("Start time")
      expect(page).to have_content("Max")
      expect(page).to have_content("Joseph")
      expect(page).to have_content("Sherman")
    end
  end
end

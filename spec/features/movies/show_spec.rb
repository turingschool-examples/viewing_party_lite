require "rails_helper"

RSpec.describe "movie detail page" do
  let!(:pabu) { User.create!(name: "Pabu", email: "pabu@email.com") }
  before :each do
    visit "users/#{pabu.id}/movies/550"
  end
  describe "movie show" do
    it "has button to create party" do
      click_button "Create Viewing Party"

      expect(current_path).to eq("/users/#{pabu.id}/movies/550/viewing-party/new")
    end
    it "has button to return to discover" do
      click_button "Discover Page"

      expect(current_path).to eq("/users/#{pabu.id}/discover")
    end
  end
end

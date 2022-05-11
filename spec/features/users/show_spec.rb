require 'rails_helper'
require 'time'

RSpec.describe "user/dashboard", type: :feature do
  before (:each) do
    @date = Date.new(2022, 05, 17)
    @time = Time.now
    @user = User.create!(name: "Terra Branford", email: "terraff6@square.com")
    @party1 = Party.create!(host_id: @user.id, movie_id: 16, date: @date, start_time: @time, length: 120)
    @party2 = Party.create!(host_id: 27, movie_id: 19, date: @date, start_time: @time, length: 120)
    UserParty.create!(user_id: @user.id, party_id: @party1.id, host: true)
    UserParty.create!(user_id: @user.id, party_id: @party2.id, host: false)
    visit "/users/#{@user.id}"
  end

  describe "when I visit user/dashboard" do
    it "displays a welcome" do
      expect(page).to have_content("Hello Terra Branford!")
    end

    it "has a button to Discover Movies" do
      expect(page).to have_link("Discover Movies")
    end

    it "has a section to see viewing parties" do
      save_and_open_page
      expect(page).to have_content("Viewing Parties")
    end

  end
end

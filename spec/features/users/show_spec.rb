require "rails_helper"

RSpec.describe "user dashboard" do
  before :each do
    @user_1 = User.create!(name: "Unreal Ursa", email: "thisaintreal@gotcha.org")
    @user_2 = User.create!(name: "Fake Fanny", email: "nonsense@fake.com")
    @user_3 = User.create!(name: "Ghastly Gary", email: "spooky@dead.org")
    @user_4 = User.create!(name: "Flake Fred", email: "wontshowup@oops.org")

    @party_2 = Party.create!(date: "2022/07/05", start_time: "10:00 PM", duration: 200, host_id: @user_2.id, movie_id: 278)

    @pary_user = PartyUser.create!(party_id: @party_2.id, user_id: @user_1.id)

    visit "/users/#{@user_1.id}/movies/278/viewing-party/new"
    # fill_in "duration", with: "300"
    fill_in "date", with: "2022/07/01"
    fill_in "Start time", with: "09:00 PM"
    check "invited[#{@user_2.id}]"
    click_button "Submit"


  end

  it "displays user name" do
    expect(page).to have_content("Unreal Ursa's Dashboard")
  end

  it "has button that directs to discover page" do
    click_button("Discover Movies")

    expect(current_path).to eq("/users/#{@user_1.id}/discover")
  end

  it "displays parties user is hosting" do
    within(".hosting") do
      expect(page).to have_content("The Shawshank Redemption")
      expect(page).to_not have_content(@party_2.date)
    end
  end

  it "displays parties user is invited to" do
    within(".invited_to") do
      expect(page).to have_content("The Shawshank Redemption")
      expect(page).to have_content(@party_2.date)
    end
  end
end

require "rails_helper"

RSpec.describe "Parties New Page" do
  before :each do
    @user_1 = User.create!(name: "Unreal Ursa", email: "thisaintreal@gotcha.org")
    @user_2 = User.create!(name: "Fake Fanny", email: "nonsense@fake.com")
    @user_3 = User.create!(name: "Ghastly Gary", email: "spooky@dead.org")
    @user_4 = User.create!(name: "Flake Fred", email: "wontshowup@oops.org")
  end

  it "has form to create new party" do
    visit "/users/#{@user_1.id}"

    within(".hosting") do
      expect(page).to_not have_content("Date: 2022/07/01")
    end

    visit "/users/#{@user_1.id}/movies/278/viewing-party/new"
    # fill_in "duration", with: "300"
    fill_in "date", with: "2022/07/01"
    fill_in "Start time", with: "09:00 PM"
    check "invited[#{@user_2.id}]"
    click_button "Submit"

    expect(current_path).to eq("/users/#{@user_1.id}")
  end
end

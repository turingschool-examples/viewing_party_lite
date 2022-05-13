require "rails_helper"

RSpec.describe "Movies Show Page" do
  before :each do
    @user_1 = User.create!(name: "Unreal Ursa", email: "thisaintreal@gotcha.org")
    @user_2 = User.create!(name: "Fake Fanny", email: "nonsense@fake.com")
    @user_3 = User.create!(name: "Ghastly Gary", email: "spooky@dead.org")
    @user_4 = User.create!(name: "Flake Fred", email: "wontshowup@oops.org")

    visit "/users/#{@user_1.id}/movies/278"
  end

  it "has button to create viewing party" do
    click_button "Create Viewing Party"
    # save_and_open_page
    expect(current_path).to eq("/users/#{@user_1.id}/movies/278/viewing-party/new")
  end
end

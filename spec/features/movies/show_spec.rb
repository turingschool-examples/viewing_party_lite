require "rails_helper"

RSpec.describe "Movies Show Page" do
  before :each do
    @user = User.create!(name: "Unreal Ursa", email: "thisaintreal@gotcha.org")

    visit "/users/#{@user.id}/movies/278"
  end

  it "has button to create viewing party" do
    click_button "Create Viewing Party"

    expect(current_path).to eq("/users/#{@user.id}/movies/278/viewing-party/new")
  end
end

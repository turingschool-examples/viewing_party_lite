require "rails_helper"

RSpec.describe "user dashboard" do
  before :each do
    @user_1 = User.create!(name: "Unreal Ursa", email: "thisaintreal@gotcha.org")
  end

  it "displays user name" do
    visit "/users/#{@user_1.id}"

    expect(page).to have_content("Unreal Ursa's Dashboard")
  end
end

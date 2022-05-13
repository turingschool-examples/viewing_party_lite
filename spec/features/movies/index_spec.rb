require "rails_helper"

RSpec.describe "Movies Index" do
  before :each do
    @user_1 = User.create!(name: "Unreal Ursa", email: "thisaintreal@gotcha.org")
    visit "/users/#{@user_1.id}/discover"
  end

  it "lists movie title and vote average" do
    click_button "Top Movies"

    within("#278") do
      expect(page).to have_content("Shawshank Redemption")
      expect(page).to have_content("Vote Average: 8.7")
    end
  end
end

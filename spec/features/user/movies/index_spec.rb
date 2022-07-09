require 'rails_helper'

RSpec.describe "User Movie Results Page", type: :feature do
  before :each do
    @user1 = User.create!(name: 'Sai', email: 'SaiLent@overlord.com')
    @user2 = User.create!(name: 'Parker', email: 'GriffithDidNothing@Wrong.com')
  end

  it 'shows movie title and vote average when query is top 20', :vcr do
    visit "/users/#{@user2.id}/discover"

    click_button("Discover Top Rated Movies")

    expect(page.all(".movie").count).to eq(20)
  end

  # it 'has links to movie show pages', :vcr do
  #   visit "/users/#{@user2.id}/discover"
  #
  #   click_button("Discover Top Rated Movies")
  #
  #
end

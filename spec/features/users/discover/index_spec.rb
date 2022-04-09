require 'rails_helper'

RSpec.describe 'Discover Page' do
  before :each do
    @user = User.create!(name: 'Obama', email: 'obamacare@gmail.com')
  end

  it 'button routes to top rated movies' do
    visit "/users/#{@user.id}/discover"

    click_button('Find Top Rated Movies')

    expect(current_path).to eq("/users/#{@user.id}/movies")
  end

  it "search field routes to movies" do
    visit "/users/#{@user.id}/discover"

    fill_in :search, with: "The Godfather"
    click_button('Find Movies')

    expect(current_path).to eq("/users/#{@user.id}/movies")
  end

  it "can search certain movies" do
    visit "/users/#{@user.id}/discover"

    fill_in :search, with: "Marvel"
    click_button('Find Movies')

    expect(page).to have_content("Captain Marvel")
  end
end

require 'rails_helper'

RSpec.describe 'discover movies page' do
  before(:each) do
    @user1 = User.create!(name: "Jess", email: "Jess@fakemail.com")
    visit "/users/#{@user1.id}/discover"
  end

  it 'has a button to discover top rated movies' do
    click_button("Discover Top Rated Movies")
    expect(current_path).to eq("/users/#{@user1.id}/movies")
  end

  it 'has a form to fill in keywords and search by movie title' do
    fill_in :keywords, with: "Shawsha"
    click_button("Search Movie by Title")
    expect(current_path).to eq("/users/#{@user1.id}/movies")
  end
end

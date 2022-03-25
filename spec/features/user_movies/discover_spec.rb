require 'rails_helper'

RSpec.describe 'discover movies page' do
  before(:each) do
    @user1 = User.create!(name: "Jess", email: "Jess@fakemail.com")
    visit "/users/#{@user1.id}/discover"
  end

  it 'has a button to discover top rated movies' do
    expect(page).to have_button("Discover Top Rated Movies")
  end

  it 'has a form to fill in keywords and search by movie title' do
    fill_in :keywords, with: "Shawshank"
    expect(page).to have_button("Search Movie by Title")
  end
end
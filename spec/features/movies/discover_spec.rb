require 'rails_helper'

RSpec.describe 'the discover movies page' do
  before (:each) do
    @u1 = User.create!(name: 'Mr 1', email: 'Test1@test.com')
  end
  it 'has a button for top rated movies' do
    visit "/users/#{@u1.id}/discover"
    expect(page).to have_button("Top Rated Movies")
    expect(page).to have_button("Search by Title")
  end
end

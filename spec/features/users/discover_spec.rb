require 'rails_helper'

RSpec.describe "User Discover Dashboard" do

  it 'has a button to discover top rated movies' do
    test_user = create(:user)
    visit("users/#{test_user.id}/discover")
    expect(page).to have_button("Top Rated Movies")
  end

  it 'has a form to search movies' do
    test_user = create(:user)
    visit("users/#{test_user.id}/discover")
    within("#movie_search") do
      expect(find('form')).to have_content('Movie Search')
      expect(find('form')).to have_button('Search')
    end
  end
end
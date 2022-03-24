require 'rails_helper'

RSpec.describe 'the movie results page' do
  before (:each) do
    @u1 = User.create!(name: 'Mr 1', email: 'Test1@test.com')
  end

  it 'lists the top 40 movies', :vcr do
    visit "/users/#{@u1.id}/discover"
    click_button "Top Rated Movies"
    expect(current_path).to eq("/users/#{@u1.id}/movies")
    expect(page).to have_content("Top Movies")

  end
end

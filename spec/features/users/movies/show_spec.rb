require 'rails_helper'

RSpec.describe 'Movies Show page', type: :feature do
  let!(:users) { create_list(:user, 3)}
  let!(:viewing_party) { create(:viewing_party)}
  # let!(:movie) { Movie.new({ :title => "Lord of the Rings", :vote_average => 9, :id => 1 }) }

  it 'has a button to create a viewing party', :vcr do
    # require "pry"; binding.pry
    visit user_movie_path(users[0].id, 278)
    click_button 'Create Viewing Party'
    expect(current_path).to eq("/users/#{users[0].id}/movies/278/viewing_partys/new")
  end

  it 'has a button to return to the discover page', :vcr do
    visit user_movie_path(users[0].id, 278 )

    click_button 'Discover Page'
    expect(current_path).to eq(user_discover_path(users[0].id))
  end
end
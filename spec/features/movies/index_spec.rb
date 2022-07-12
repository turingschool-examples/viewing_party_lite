require 'rails_helper'

RSpec.describe 'Movies Index Page' do
  before :each do
    @user = User.create!(name: 'Obama', email: 'obamacare@gmail.com', password: 'password123',
                         password_confirmation: 'password123')
  end

  it 'has title and button to get back to discover page' do
    visit "/users/#{@user.id}/movies"

    expect(page).to have_content('Top Rated Movies')

    click_button('Discover Page')

    expect(current_path).to eq("/users/#{@user.id}/discover")
  end

  it 'has movie name and vote average' do
    visit "/users/#{@user.id}/movies"

    expect(page).to have_content('The Shawshank Redemption')
    expect(page).to have_content('The Godfather')
  end

  it 'links to show page' do
    movie_id = 278
    visit "/users/#{@user.id}/movies"

    click_link('The Shawshank Redemption')

    expect(current_path).to eq("/users/#{@user.id}/movies/#{movie_id}")
  end
end

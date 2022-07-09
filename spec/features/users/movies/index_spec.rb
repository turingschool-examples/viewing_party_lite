require 'rails_helper'

RSpec.describe 'User Movies Index Page' do
  it 'displays top 40 movies' do
    user = User.create!(name: 'User', email: 'user@email.com')

    visit "user/#{user.id}/discover"

    click_button('Discover Top Rated Movies')
    expect(page).to have_link('The Shawshank Redemption')
    expect(page).to have_content('Vote Average: 8.7')
    expect(page).to have_link("Schindler's List")
    expect(page).to have_content('Vote Average: 8.6')
  end

  it 'displays movies containing searched keyword' do
    user = User.create!(name: 'User', email: 'user@email.com')

    visit "user/#{user.id}/discover"
    fill_in 'search', with: 'Star Wars'
    click_on 'Search'

    expect(page).to have_content('Star Wars')
    expect(page).to have_content('Vote Average: 8.2')
    expect(page).to have_content('Star Wars: The Force Awakens')
    expect(page).to have_content('Vote Average: 7.3')
    expect(page).to have_content('Star Wars: The Last Jedi')
    expect(page).to have_content('Vote Average: 6.9')
  end

  it 'has a button that takes user back to the discover page' do
        user = User.create!(name: 'User', email: 'user@email.com')

    visit user_movies_path(user.id)
    click_on "Discover Movies"
    expect(current_path).to eq("/user/#{user.id}/discover")
  end

end

require 'rails_helper'

RSpec.describe 'Movie Show Page', :vcr do

  it 'goes to movie show page' do
    eldridge = User.create!(name: 'Eldridge', email: 'eldridge@gmail.com', id: 1)

    visit user_discover_index_path(eldridge)

    click_on('Find Top Rated Movies')

    expect(current_path).to eq(user_movies_path(eldridge))
    expect(page).to have_link('The Shawshank Redemption')
    expect(page).to have_link('Discover Page')

    click_on('The Shawshank Redemption')
    expect(current_path).to eq("/users/#{eldridge.id}/movies/278")
  end

  it 'has a discover movies button' do
    eldridge = User.create!(name: 'Eldridge', email: 'eldridge@gmail.com', id: 1)

    visit ("/users/#{eldridge.id}/movies/278")

    click_on('Discover Movies')

    expect(current_path).to eq(user_discover_index_path(eldridge))
  end
  it 'has a viewing party button' do
    eldridge = User.create!(name: 'Eldridge', email: 'eldridge@gmail.com', id: 1)

    visit ("/users/#{eldridge.id}/movies/278")

    expect(page).to have_link('Create Viewing Party for The Shawshank Redemption')
    click_on('Create Viewing Party for The Shawshank Redemption')

    expect(current_path).to eq("/users/#{eldridge.id}/movies/278/viewing_party/new")
  end
  it 'has content' do
    eldridge = User.create!(name: 'Eldridge', email: 'eldridge@gmail.com', id: 1)

    visit ("/users/#{eldridge.id}/movies/278")

    expect(page).to have_content("Rating")
    expect(page).to have_content("Runtime")
    expect(page).to have_content("Genre(s)")
    expect(page).to have_content("Summary")
    expect(page).to have_content("Total Reviews")
    expect(page).to have_content("Cast")
    expect(page).to have_content("The Shawshank Redemption")
  end
end

require 'rails_helper'

RSpec.describe '#show' do
  before do
    @jose = User.create!(name: 'Jose Andres', email: 'jose.andres@gmail.com', password: '111',
                         password_confirmation: '111')
    @movie_id = 500
  end

  it 'has button to create viewing party', :vcr do
    visit user_movie_path(@jose, @movie_id)

    click_link 'Create Viewing Party'
    expect(current_path).to eq new_user_movie_viewing_party_path(@jose, @movie_id)
  end

  it 'has button to return to discover page', :vcr do
    visit user_movie_path(@jose, @movie_id)

    click_link 'Discover Page'
    expect(current_path).to eq user_movies_discover_path(@jose)
  end

  it 'displays movie details', :vcr do
    visit user_movie_path(@jose, @movie_id)
    # save_and_open_page
    expect(page).to have_content('Reservoir Dogs')
    expect(page).to have_content('Vote Average: 8.1')
    expect(page).to have_content('Runtime: 1h 39mins')
    expect(page).to have_content('Genre(s): Crime Thriller')
    expect(page).to have_content('Description: A botched robbery indicates a police informant, and the pressure mounts in the aftermath at a warehouse. Crime begets violence as the survivors -- veteran Mr. White, newcomer Mr. Orange, psychopathic parolee Mr. Blonde, bickering weasel Mr. Pink and Nice Guy Eddie -- unravel.')
  end

  it 'displays movie characters and actors', :vcr do
    visit user_movie_path(@jose, @movie_id)

    expect(page).to have_content('Harvey Keitel plays Mr. White / Larry Dimmick')
    expect(page).to have_content('Tim Roth plays Mr. Orange / Freddy Newandyke')
    expect(page).to have_content('Michael Madsen plays Mr. Blonde / Vic Vega')
  end

  it 'displays reviewers and reviews', :vcr do
    visit user_movie_path(@jose, @movie_id)

    expect(page).to have_content('Total Reviews: 2')
    expect(page).to have_content('talisencrw: This unique take on the heist-film-gone-wrong was excellent')
    expect(page).to have_content('Wuchak: The cuss-oriented squabbles of lowlife crooks for 99 minutes')
  end
  # tests for the buttons before
end

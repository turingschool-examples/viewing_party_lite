require 'rails_helper'

describe 'The movie details page' do
  before do
    @user = User.create!(name: 'Brylan', email: 'brylan.gannon112@gmail.com')
    @movie_id = 550
    visit user_movie_path(@user,@movie_id)
  end

  it 'displays movie details for movie' do
    text = "A ticking-time-bomb insomniac and a slippery"
    expect(page).to have_content('Fight Club')
    expect(page).to have_content('Vote Average 8.4')
    expect(page).to have_content('Runtime: 2 hours 19 minutes')
    expect(page).to have_content("Description: #{text}") 
    expect(page).to have_content('Genre(s): Drama')
  end

  it 'displays cast information' do
    expect(page).to have_content('The Narrator: Edward Norton')
    expect(page).to have_content('Tyler Durden: Brad Pitt')
    expect(page).to have_content('Marla Singer: Helena Bonham Carter')
  end

  it 'displays review information' do
    expect(page).to have_content('7 reviews')
    expect(page).to have_content('Author: Goddard')
    expect(page).to have_content('Review: Pretty awesome movie.')
    expect(page).to have_content('Author: Brett Pascoe')
    expect(page).to have_content('Review: In my top 5 of all time favourite movies')
  end
end

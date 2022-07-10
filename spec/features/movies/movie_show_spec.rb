# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Movie show page' do
  it 'shows the movie title, average rating, runtime, genres, summary, cast, number of reviews, review authors, and those authors details' do
    user = User.create!(name: 'Bob', email: 'bob@email.com')
    visit "users/#{user.id}/movies/296/show"

    expect(page).to have_content('Terminator 3: Rise of the Machines')
    expect(page).to have_content('6.1')
    expect(page).to have_content('1:49')
    expect(page).to have_content('Action')
    expect(page).to have_content('Thriller')
    expect(page).to have_content('Science Fiction')
    expect(page).to have_content("It's been 10 years since John Connor saved Earth from Judgment Day, and he's now living under the radar, steering clear of using anything Skynet can trace. That is, until he encounters T-X, a robotic assassin ordered to finish what T-1000 started. Good thing Connor's former nemesis, the Terminator, is back to aid the now-adult Connor … just like he promised.")
    expect(page).to have_content('Arnold Schwarzenegger')
    expect(page).to have_content('Moira Sinise') # The 10th cast member
    expect(page).to_not have_content('Chopper Bernet') # The 11th cast member
    expect(page).to have_content('Number of Reviews: 3')
    expect(page).to have_content('Gimly')
    expect(page).to have_content('Ruuz')
    expect(page).to have_content('Rating: 3.0')
    expect(page).to have_content('CinemaSerf')
    expect(page).to have_content('Geronimo1967')
    expect(page).to have_content('Rating: 5.0')
  end
end

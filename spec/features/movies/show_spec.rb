require 'rails_helper'

RSpec.describe 'movie details page' do
  let!(:user) { User.create!(name: 'person', email: 'email@email.com') }
  before :each do
    details = JSON.parse(File.read('spec/fixtures/movie_details.json'), symbolize_names: true)
    allow(TmdbService).to receive(:movie_details).and_return(details)
    cast = JSON.parse(File.read('spec/fixtures/movie_cast.json'), symbolize_names: true)
    allow(TmdbService).to receive(:movie_cast).and_return(cast)
    review = JSON.parse(File.read('spec/fixtures/movie_review.json'), symbolize_names: true)
    allow(TmdbService).to receive(:movie_review).and_return(review)

    visit "users/#{user.id}/movies/545611"
  end

  it 'lists movie details' do
    expect(page).to have_content('Everything Everywhere All at Once')
    expect(page).to have_content('8.9')
    expect(page).to have_content('2hr 19min')
    expect(page).to have_content('Action / Science Fiction / Comedy / Adventure')
  end

  it 'displays Cast' do
    expect(page).to have_content('Evelyn Wang')
    expect(page).to have_content('Michelle Yeoh')
    expect(page).to have_content('Gong Gong')
    expect(page).to have_content('James Hong')
    expect(page).to have_content('Deirdre Beaubeirdra')
    expect(page).to have_content('Jamie Lee Curtis')
  end

  it 'shows the review info' do
    expect(page).to have_content('MSB')
    expect(page).to have_content('The mother-daughter relationship as the emotional core of the story follows a surprisingly predictable path and needs a few more dialogues to deliver an even more powerful climax, but it still induces tears and a genuine sense of concern for the characters.')
  end

  it 'has a button to create a viewing party' do
    click_on 'Start a Viewing Party'

    expect(current_path).to eq new_user_movie_viewing_party_path(user.id, 545_611)
  end
end

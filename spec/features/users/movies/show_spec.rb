# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'movie details page' do
  before :each do
    @user1 = User.create!(name: 'Jane', email: 'eleven@upsidedown.com', password: 
      'test123')
    attributes = JSON.parse(File.read('./spec/fixtures/movie_details.json'), symbolize_names: true)

    @movie = Movie.new(attributes)
  end

  it 'has a button to create a new viewing party and a link to the discover page', :vcr do
    visit "/users/#{@user1.id}/movies/#{@movie.id}"

    expect(page).to have_button('Create a Viewing Party')
    click_button('Create a Viewing Party')
    expect(current_path).to eq("/users/#{@user1.id}/movies/#{@movie.id}/viewing_party/new")

    visit "/users/#{@user1.id}/movies/#{@movie.id}"
    expect(page).to have_button('Discover Page')
    click_button('Discover Page')
    expect(current_path).to eq("/users/#{@user1.id}/discover")
  end

  it 'displays the title, vote average, runtime, and genres', :vcr do
    visit "/users/#{@user1.id}/movies/#{@movie.id}"

    expect(page).to have_content(@movie.title.to_s)
    expect(page).to have_content("Vote Average: #{@movie.vote_average}")
    expect(page).to have_content("Runtime: #{@movie.runtime}")
    expect(page).to have_content("Genre(s): #{@movie.genres.map { |genre| genre[:name] }.join(', ')}")
  end

  it 'displays the summary and cast', :vcr do
    visit "/users/#{@user1.id}/movies/#{@movie.id}"

    expect(page).to have_content('Summary')
    expect(page).to have_content(@movie.overview)
    within '#cast' do
      expect(page).to have_content('Cast')
      expect(page).to have_content(@movie.cast.first[:name])
      expect(page).to have_content(@movie.cast.first[:character])
      expect(page).to have_content(@movie.cast[9][:name])
      expect(page).to have_content(@movie.cast[9][:character])
      expect(page).to_not have_content(@movie.cast[10][:name])
      expect(page).to_not have_content(@movie.cast[10][:character])
    end
  end

  it 'displays reviews and their authors and the total count of reviews', :vcr do
    visit "/users/#{@user1.id}/movies/#{@movie.id}"

    expect(page).to have_content("#{@movie.reviews.count} Reviews")
    expect(page).to have_content("Author: #{@movie.reviews.first[:author]}")
    expect(page).to have_content(@movie.reviews.first[:content][0..20])
    expect(page).to have_content("Author: #{@movie.reviews.last[:author]}")
    expect(page).to have_content(@movie.reviews.last[:content][0..20])
  end
end

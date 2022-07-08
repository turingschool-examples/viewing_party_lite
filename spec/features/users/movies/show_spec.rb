require 'rails_helper'

RSpec.describe 'movie details page' do

  before :each do
    @user1 = User.create!(name: 'Jane Powell', email: 'jpowell38@gmail.com')
    attributes = JSON.parse(File.read('./spec/fixtures/movie_details.json'), symbolize_names: true)

    @movie = Movie.new(attributes)
    visit "/users/#{@user1.id}/movies/#{@movie.id}"
  end

  it "has a button to create a new viewing party" do
    expect(page).to have_button("Create a Viewing Party")
    click_button("Create a Viewing Party")
    expect(current_path).to eq("/users/#{@user1.id}/movies/#{@movie.id}/viewing_party/new")
  end 

  it 'displays the title, vote average, runtime, and genres' do

    expect(page).to have_content("#{@movie.title}")
    expect(page).to have_content("Vote Average: #{@movie.vote_average}")
    expect(page).to have_content("Runtime: #{@movie.runtime}")
    expect(page).to have_content("Genre(s): #{@movie.genres.map{ |genre| genre[:name]}.join(', ')}")
  end

  it 'displays the summary and cast' do

    expect(page).to have_content("Summary")
    expect(page).to have_content(@movie.overview)
    expect(page).to have_content("Cast")
    expect(page).to have_content(@movie.cast.first[:name])
    expect(page).to have_content(@movie.cast.first[:character])
    expect(page).to have_content(@movie.cast[9][:name])
    expect(page).to have_content(@movie.cast[9][:character])
  end

  it 'displays reviews and their authors and the total count of reviews' do
save_and_open_page
    expect(page).to have_content("#{@movie.reviews.count} Reviews")
    expect(page).to have_content("Author: #{@movie.reviews.first[:author]}")
    # expect(page).to have_content(@movie.reviews.first[:content])
    expect(page).to have_content("Author: #{@movie.reviews.last[:author]}")
    # expect(page).to have_content(@movie.reviews.last[:content])
  end
end
require 'rails_helper'

RSpec.describe 'Movie Show Page' do
  before :each do
    @movie = MoviesFacade.get_movie(1272)
    @user = create(:user)
    visit user_movie_path(@user.id, @movie.id)
  end

  it 'has movie content', :vcr do
    expect(page).to have_content(@movie.title)
    expect(page).to have_content("Vote Average: #{@movie.vote_average.round(1)}")
    expect(page).to have_content("Runtime: #{runtime_view_helper(@movie.runtime)}")
    expect(page).to have_content("Genre(s): #{@movie.genres.join(", ")}")
    expect(page).to have_content("Summary\n#{@movie.summary}")
    expect(page).to have_content("Cast")
    @movie.cast.each do |cast_member|
      expect(page).to have_content("#{cast_member[:name]} as #{cast_member[:character]}")
    end
    expect(page).to have_content("#{@movie.reviews.length} Reviews")
    @movie.reviews.each do |review|
      expect(page).to have_content("Aurthor: #{review[:author]}")
      expect(page).to have_content(review[:content])
    end
  end

  it 'has a button to discover page', :vcr do
    expect(page).to have_button("Discover Page")
    click_button("Discover Page")
    expect(current_path).to eq(user_discover_path(@user.id))
  end

  it 'has a button to create a viewing party', :vcr do
    expect(page).to have_button("Create Viewing Party for #{@movie.title}")
    click_button("Create Viewing Party for #{@movie.title}")
    expect(current_path).to eq(new_user_movie_viewing_party_path(@user.id, @movie.id))
  end
end
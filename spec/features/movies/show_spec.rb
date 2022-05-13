require "rails_helper"

RSpec.describe "Movie Detail Page" do
  xit "has a button to create a viewing party" do
    # movie =
    visit movie_path
    click_button "Create Viewing Party for #{movie.title}"
    expect(current_path).to eq
  end

  xit "has a button to return to Discover Page" do
    visit movie_path
    click_button "Discover Page"
    expect(current_path).to eq(discover_path)
  end

  xit "displays movie information" do
    # movie =

    visit movie_path

    expect(page).to have_content(movie.title)
    expect(page).to have_content(movie.vote_average)
    expect(page).to have_content(movie.runtime)
    expect(page).to have_content(movie.genre)
    expect(page).to have_content(movie.summary)
    expect(page).to have_content(movie.cast_members)
    expect(page).to have_content(movie.review_count)
    expect(page).to have_content(movie.review_author_info)
  end
end

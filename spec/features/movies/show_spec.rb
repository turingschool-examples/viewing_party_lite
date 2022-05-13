require "rails_helper"

RSpec.describe "Movie Detail Page" do
  it "has a button to create a viewing party" do
    movie1 = Movie.new(title: "Who Killed Mike Dao", vote_average: 10, id: 20)

    visit movie_path(20)

    click_button "Create Viewing Party for #{movie1.title}"

    expect(current_path).to eq(new_person_party_path)
  end

  xit "has a button to return to Discover Page" do
    movie1 = Movie.new(title: "Who Killed Mike Dao", vote_average: 10, id: 20)

    visit movie_path

    click_button "Discover Page"

    expect(current_path).to eq(discover_path)
  end

  xit "displays movie information" do
    movie1 = Movie.new(title: "Who Killed Mike Dao", vote_average: 10, id: 20)

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

require 'rails_helper'

RSpec.describe "Movies Service" do
  it 'can retrieve popular movies', :vcr do
    json = MovieService.movie_titles_by_rating

    expect(json).to have_key(:page)
    expect(json).to have_key(:results)
    expect(json[:results][0]).to have_key(:original_title)
  end
end

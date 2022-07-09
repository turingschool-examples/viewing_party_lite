require 'rails_helper'

RSpec.describe MovieFacade do
  it 'creates a MovieResults poro from top rated call', :vcr do
    top_rated = MovieFacade.create_top_rated

    expect(top_rated[0]).to be_an_instance_of(MovieResult)
  end

  it 'creates a MovieResults poro from keyword call', :vcr do
    keywords = 'howl'
    movie_by_keyword = MovieFacade.create_by_keyword(keywords)

    expect(movie_by_keyword[0]).to be_an_instance_of(MovieResult)
  end
end
